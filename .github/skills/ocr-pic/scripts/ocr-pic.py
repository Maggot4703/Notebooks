#!/usr/bin/env python3
"""
ocr-pic.py — OCR wargame counter images embedded on PDF pages.

Counter structure (200x100px):
  Left half  (x 0 to 99):  solid colour identifying counter type
                         NAVY = cyan (R≈0, G≈255, B≈255)
                         MARINE = red (R≈255, G≈0, B≈0)
  Right half (x 100 to 199): white background with black text, 10 lines

Usage:
    python ocr-pic.py <pdf_path> <page1> [page2 ...] <output_dir>

    Page numbers are 1-indexed (human-facing).
    One output file is written per page:
        <output_dir>/<pdf_stem>-page<N>.txt

Dependencies:
    pip install pypdf Pillow pytesseract numpy
    sudo apt install tesseract-ocr

Known Tesseract font confusions in these counter bitmaps:
    7  → ?    (DF/TF values; ? in those positions = 7)
    0  → O    (BF values; O in integer positions = 0)
    2  → ?    (TL trailing digit, e.g. "Tl 1?" = TL 12)
    l  → L    (label prefix e.g. "Tl" = TL — cosmetic only)
    o  → 0    (Ship Code e.g. "Co01" = C001)
Verify flagged positions manually against the original PDF.
"""

from __future__ import annotations

import argparse
import io
import os
import re
import sys
from pathlib import Path

import numpy as np
import pytesseract
from PIL import Image, ImageOps
from pypdf import PdfReader

# ---------------------------------------------------------------------------
# Field label definitions (10 lines per counter type)
# ---------------------------------------------------------------------------

NAVY_FIELDS = [
    "Unit ID",        # 4 digits, space, up to 8 alphanumerics
    "Ship Code",      # 1 letter + 3 digits  (e.g. C001)
    "Squadron Type",  # alphanumeric text
    "Jump",           # J-N  (jump rating)
    "Streamlining",   # CAPITALS code (e.g. USL)
    "DF",             # DF + number
    "AF",             # AF + number
    "BF",             # BF + number
    "TF",             # TF + number
    "TL",             # TL + number
]

MARINE_FIELDS = [
    "Unit ID",        # 4 digits, space, up to 8 alphanumerics
    "Code",           # 4 digits
    "Size",           # N-Label  (e.g. 2-Regiment)
    "Quality",        # N-Label  (e.g. 1-Elite)
    "Mobility",       # N-Label  (e.g. 1-Armoured)
    "Mobility",       # N-Label  (second mobility line)
    "Type",           # N-Label  (e.g. 0-Infantry)
    "CF",             # CF + number
    "TF",             # TF + number
    "TL",             # TL + number
]

GRID_COLS = 3


# ---------------------------------------------------------------------------
# Counter type detection
# ---------------------------------------------------------------------------


def detect_counter_type(img: Image.Image) -> str:
    """Return 'NAVY', 'MARINE', or 'EMPTY' from left-half colour.

    Samples the left ~22% of the image (the solid colour indicator strip),
    using both RGB median values and HSV hue/saturation for robustness.

        NAVY:   cyan  — R≈0, G≈255, B≈255  (HSV hue ≈ 128/255)
        MARINE: red   — R≈255, G≈0,   B≈0  (HSV hue ≈ 0 or 255)
    """
    w, h = img.size
    left = img.crop((0, int(h * 0.1), max(1, int(w * 0.22)), int(h * 0.9)))
    arr = np.array(left)
    r = float(np.median(arr[:, :, 0]))
    g = float(np.median(arr[:, :, 1]))
    b = float(np.median(arr[:, :, 2]))
    hsv = np.array(left.convert("HSV"))
    hue = float(np.median(hsv[:, :, 0]))
    sat = float(np.median(hsv[:, :, 1]))
    # NAVY: cyan — blue+green dominant, or HSV hue in cyan range
    if (b > r + 20 and b > g + 10) or (120 <= hue <= 190 and sat >= 35):
        return "NAVY"
    # MARINE: red — red dominant, or HSV hue at red extremes
    if (r > b + 20 and r > g + 10) or (
        (hue <= 15 or hue >= 240) and sat >= 35
    ):
        return "MARINE"
    return "EMPTY"


# ---------------------------------------------------------------------------
# Preprocessing
# ---------------------------------------------------------------------------


def preprocess_counter(img: Image.Image, upscale: int = 6) -> Image.Image:
    """Crop the coloured left half, upscale, and prepare for Tesseract.

    The text content is always in the right half of the counter
    (white background, black text).  One-pixel frame borders are excluded
    to prevent artefacts bleeding into OCR.

    No colour inversion is applied — text is already dark on light.

    Args:
        img:      PIL Image (RGB) of the counter.
        upscale:  Integer scale factor before OCR (default 6).
                  Aim for at least 800px wide after scaling.
    """
    w, h = img.size
    # Crop to right half, inset 1px from each frame border
    right = img.crop((w // 2 + 1, 1, w - 1, h - 1))
    right = right.resize(
        (right.width * upscale, right.height * upscale), Image.LANCZOS
    )
    gray = ImageOps.grayscale(right)
    # Add white border — prevents Tesseract clipping edge characters
    gray = ImageOps.expand(gray, border=30, fill=255)
    return gray


# ---------------------------------------------------------------------------
# OCR
# ---------------------------------------------------------------------------


def ocr_image(img: Image.Image, psm: int = 6) -> str:
    """Run Tesseract on a preprocessed image and return stripped text."""
    config = f"--psm {psm} --oem 1"
    return pytesseract.image_to_string(img, config=config).strip()


def clean_ocr_lines(text: str) -> list[str]:
    """Return lines with internal whitespace normalised.

    Leading and trailing blank lines are stripped; interior blank lines are
    preserved as empty strings to maintain 10-line field alignment.
    """
    lines = [re.sub(r"\s+", " ", line.strip()) for line in text.splitlines()]
    while lines and not lines[0]:
        lines.pop(0)
    while lines and not lines[-1]:
        lines.pop()
    return lines


# ---------------------------------------------------------------------------
# Grid slot helpers
# ---------------------------------------------------------------------------


def parse_slot_from_name(name: str) -> int | None:
    """Extract a grid slot index (1–9) from image names such as X5.png."""
    m = re.search(r"(\d+)", name)
    if not m:
        return None
    v = int(m.group(1))
    return v if 1 <= v <= 9 else None


def slot_to_label(slot: int) -> str:
    """Convert slot number to grid label, e.g. 5 → R2C2."""
    row = ((slot - 1) // GRID_COLS) + 1
    col = ((slot - 1) % GRID_COLS) + 1
    return f"R{row}C{col}"


# ---------------------------------------------------------------------------
# Formatting
# ---------------------------------------------------------------------------


def postprocess_line(label: str, value: str) -> str:
    """Apply confirmed Tesseract font confusion corrections by field label.

    Corrections confirmed by user:
        DF / TF    : trailing '?' → '7'
        BF         : trailing 'O' → '0'
        Ship Code  : o/O in digit positions 2-4 → '0'
        Code       : strip non-digit noise; flag if fewer than 4 digits remain
        TL         : 'Tl '/'TI ' prefix → 'TL '; 'TI if' → 'TL 13';
                     trailing '?' after digit → '2'; trailing ' A' → ' 8'
    """
    # Fix TL label prefix in the value regardless of field
    value = re.sub(r"^Tl\s", "TL ", value)
    value = re.sub(r"^TI\s", "TL ", value)

    if label == "DF" or label == "TF":
        # Trailing '?' is a misread '7'
        value = re.sub(r"\?$", "7", value)

    elif label == "BF":
        # Trailing 'O' is a misread '0'
        value = re.sub(r"O$", "0", value)

    elif label == "Ship Code":
        # Format: 1 letter + 3 digits. o/O in digit positions are misread 0s.
        raw = re.sub(r"\s+", "", value)
        m = re.match(r"([A-Za-z])(.+)$", raw)
        if m:
            digits = re.sub(r"[oO]", "0", m.group(2))
            value = m.group(1).upper() + digits

    elif label == "Code":
        # MARINE line 2: 4 digits. Strip non-digit noise; flag if unreadable.
        stripped = re.sub(r"\D", "", value)
        if len(stripped) >= 4:
            value = stripped[:4]
        elif stripped:
            value = stripped.ljust(4, "?")
        else:
            value = "[unreadable - 4-digit code, see PDF]"

    elif label == "TL":
        # 'TI if' / 'TL if' (if=11 misread, but user confirmed value = 13)
        value = re.sub(r"^TI\s+if\s*$", "TL 13", value, flags=re.IGNORECASE)
        value = re.sub(r"^TL\s+if\s*$", "TL 13", value, flags=re.IGNORECASE)
        # Trailing '?' after a digit → '2'  (e.g. 'TL 1?' → 'TL 12')
        value = re.sub(r"(?<=\d)\?$", "2", value)
        # Trailing ' A' → ' 8'  (e.g. 'TL A' → 'TL 8')
        value = re.sub(r" A$", " 8", value)

    return value


def format_counter(
    counter_type: str,
    lines: list[str],
    image_name: str,
    slot: int | None,
) -> str:
    """Produce a labelled block for one counter.

    Each field label is paired with its OCR line.  If fewer than 10 lines
    were recovered, missing entries are flagged [missing].  A [NOTE] is
    appended when the line count deviates from the expected 10.
    """
    fields = NAVY_FIELDS if counter_type == "NAVY" else MARINE_FIELDS
    grid_label = slot_to_label(slot) if slot is not None else f"?{image_name}"
    header = f"--- {grid_label} | {counter_type} | {image_name} ---"

    rows = []
    for i, label in enumerate(fields):
        value = lines[i] if i < len(lines) else "[missing]"
        value = postprocess_line(label, value)
        rows.append(f"  {label}: {value}")

    if len(lines) != len(fields):
        rows.append(
            f"  [NOTE: expected {len(fields)} lines, got {len(lines)}]"
        )

    return header + "\n" + "\n".join(rows)


# ---------------------------------------------------------------------------
# Per-page processing
# ---------------------------------------------------------------------------


def is_counter_candidate(img: Image.Image) -> bool:
    """Return True if image dimensions look like a wargame counter."""
    w, h = img.size
    if w < 120 or h < 50:
        return False
    ratio = w / max(h, 1)
    return 1.5 <= ratio <= 3.5


def process_page(
    reader: PdfReader, page_number: int, upscale: int = 6
) -> str:
    """OCR all non-EMPTY counters on a page and return formatted output."""
    page = reader.pages[page_number - 1]
    imgs = list(page.images)

    if not imgs:
        return f"[No embedded images on page {page_number}]\n"

    results: list[tuple[int, str, str, list[str]]] = []
    next_auto_slot = 1

    for img_obj in imgs:
        raw = Image.open(io.BytesIO(img_obj.data)).convert("RGB")
        if not is_counter_candidate(raw):
            continue

        ctype = detect_counter_type(raw)
        if ctype == "EMPTY":
            continue

        slot = parse_slot_from_name(img_obj.name)
        if slot is None:
            slot = next_auto_slot
            next_auto_slot += 1

        processed = preprocess_counter(raw, upscale)
        raw_text = ocr_image(processed)
        lines = clean_ocr_lines(raw_text)
        results.append((slot, img_obj.name, ctype, lines))

    results.sort(key=lambda item: item[0])

    sections = [f"# Page {page_number}\n"]
    for slot, name, ctype, lines in results:
        sections.append(format_counter(ctype, lines, name, slot))
        sections.append("")

    if not results:
        sections.append("[No NAVY or MARINE counters detected on this page]")

    return "\n".join(sections)


# ---------------------------------------------------------------------------
# Interactive helpers (file picker + page prompt)
# ---------------------------------------------------------------------------


def pick_pdf_gui() -> str:
    """Open a Tk file-chooser dialog and return the selected PDF path.

    Falls back to a terminal prompt if the display is unavailable (e.g. SSH).
    """
    try:
        import tkinter as tk
        from tkinter import filedialog

        root = tk.Tk()
        root.withdraw()
        root.wm_attributes("-topmost", True)
        path = filedialog.askopenfilename(
            title="Select PDF file",
            filetypes=[("PDF files", "*.pdf"), ("All files", "*.*")],
        )
        root.destroy()
        if not path:
            print("No file selected.")
            sys.exit(0)
        return path
    except Exception:
        # No display available — fall through to terminal prompt
        return input("PDF path: ").strip()


def prompt_pages(total_pages: int) -> list[int]:
    """Interactively prompt for page numbers.

    Accepts individual numbers, comma-separated lists, and N-M ranges,
    e.g.: 37,38   or   37-40   or   37, 39-41
    Returns a sorted, deduplicated list of page numbers.
    """
    print(f"PDF has {total_pages} page(s).")
    raw = input("Pages to OCR (e.g. 37  or  37,38  or  37-40): ").strip()
    return parse_page_args([raw])


# ---------------------------------------------------------------------------
# Batch mode helpers
# ---------------------------------------------------------------------------


def resolve_pdf_for_letter(letter: str, pdf_dir: str) -> str:
    """Return the path of the unique PDF in pdf_dir starting with letter.

    Raises ValueError if zero or more than one match is found.
    """
    candidates = [
        p for p in Path(pdf_dir).iterdir()
        if p.suffix.lower() == ".pdf"
        and p.name.upper().startswith(letter.upper())
    ]
    if not candidates:
        raise ValueError(
            f"No PDF found in {pdf_dir!r} starting with letter {letter!r}"
        )
    if len(candidates) > 1:
        names = ", ".join(str(c) for c in candidates)
        raise ValueError(
            f"Multiple PDFs start with {letter!r} in {pdf_dir!r}: {names}"
        )
    return str(candidates[0])


def run_batch(
    tokens: list[str],
    pdf_dir: str,
    output_dir: str | None,
) -> None:
    """Process a list of LETTER-PAGE tokens, writing one .txt per page.

    Each token is "X-NN" where X is the first letter of the target PDF filename
    and NN is the 1-indexed page number.  PDFs are opened once per unique path
    and reused across pages.
    """
    # Parse tokens first so we catch format errors before touching any files
    jobs: list[tuple[str, int]] = []  # (pdf_path, page_number)
    for token in tokens:
        token = token.strip()
        m = re.fullmatch(r"([A-Za-z])-?(\d+)", token)
        if not m:
            raise ValueError(
                f"Batch token {token!r} is not in LETTER-PAGE format "
                "(e.g. A-37)"
            )
        letter, page_str = m.group(1), m.group(2)
        pdf_path = resolve_pdf_for_letter(letter, pdf_dir)
        jobs.append((pdf_path, int(page_str)))

    # Group pages by PDF so we only open each file once
    readers: dict[str, PdfReader] = {}
    try:
        for pdf_path, page_number in jobs:
            if pdf_path not in readers:
                readers[pdf_path] = PdfReader(pdf_path)

        for pdf_path, page_number in jobs:
            reader = readers[pdf_path]
            total = len(reader.pages)
            if page_number < 1 or page_number > total:
                print(
                    f"  [SKIP] Page {page_number} out of range "
                    f"({pdf_path!r} has {total} pages)."
                )
                continue
            out_dir = output_dir or str(Path(pdf_path).parent)
            os.makedirs(out_dir, exist_ok=True)
            pdf_stem = Path(pdf_path).stem
            out_name = f"{pdf_stem} - page{page_number}.txt"
            output_path = os.path.join(out_dir, out_name)
            output = process_page(reader, page_number)
            with open(output_path, "w", encoding="utf-8") as f:
                f.write(output)
            print(f"Page {page_number} → {output_path}")
            print(output)
    finally:
        for r in readers.values():
            r.stream.close()


# ---------------------------------------------------------------------------
# Entry point
# ---------------------------------------------------------------------------

def build_arg_parser() -> argparse.ArgumentParser:
    p = argparse.ArgumentParser(
        prog="ocr-pic",
        description=(
            "OCR wargame counter images embedded in a PDF page.\n"
            "Omit --pdf to open a file-chooser dialog.\n"
            "Omit --pages to be prompted interactively."
        ),
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog=(
            "Examples:\n"
            "  ocr-pic.py --pdf file.pdf --pages 37 38 --output-dir /tmp/out\n"
            "  ocr-pic.py --pdf file.pdf --pages 37-40 --output-dir /tmp/out\n"
            "  ocr-pic.py                               # fully interactive\n"
            "  ocr-pic.py --batch A-37 A-48 B-35 B-36 --pdf-dir PDFs/\n"
        ),
    )
    p.add_argument(
        "--pdf", metavar="FILE",
        help="Path to the source PDF (omit for file-chooser dialog).",
    )
    p.add_argument(
        "--pages", nargs="+", metavar="N",
        help=(
            "Page number(s) to process (1-indexed). "
            "Accepts individual numbers, comma-separated lists, and "
            "N-M ranges (e.g. --pages 37 38  or  --pages 37-40  or  "
            "--pages 37,39-41)."
        ),
    )
    p.add_argument(
        "--output-dir", metavar="DIR", default=None,
        help=(
            "Directory to write output .txt files. "
            "Defaults to the same directory as the PDF."
        ),
    )
    p.add_argument(
        "--batch", nargs="+", metavar="LETTER-PAGE",
        help=(
            "Batch mode: one or more LETTER-PAGE tokens (e.g. A-37 B-35). "
            "Each letter is matched to the first PDF in --pdf-dir whose "
            "filename starts with that letter (case-insensitive). "
            "Requires --pdf-dir."
        ),
    )
    p.add_argument(
        "--pdf-dir", metavar="DIR", default=None,
        help=(
            "Directory to search for PDFs when using --batch. "
            "Output .txt files are written here unless --output-dir is "
            "also given."
        ),
    )
    return p


def parse_page_args(page_args: list[str]) -> list[int]:
    """Expand a list of page tokens into sorted, deduplicated page numbers.

    Each token may be a plain integer ("37"), a range ("37-40"), or
    a comma-separated mix ("37,39-41").
    """
    pages: set[int] = set()
    for token in page_args:
        for part in token.split(","):
            part = part.strip()
            if "-" in part:
                lo, hi = part.split("-", 1)
                pages.update(range(int(lo), int(hi) + 1))
            elif part:
                pages.add(int(part))
    return sorted(pages)


def main() -> None:
    parser = build_arg_parser()
    reader: PdfReader | None = None

    # Legacy positional mode: ocr-pic.py <pdf> <page1> [page2 ...] <output_dir>
    # Detect: first arg is not a flag and last arg looks like a directory
    # (not a digit). Preserves backward compatibility without breaking --help.
    if (
        len(sys.argv) >= 4
        and not sys.argv[1].startswith("-")
        and not sys.argv[-1].lstrip("-").isdigit()
    ):
        pdf_path = sys.argv[1]
        output_dir = sys.argv[-1]
        page_numbers = parse_page_args(sys.argv[2:-1])
    else:
        args = parser.parse_args()

        # --- Batch mode (takes priority over single-PDF mode) ---
        if args.batch:
            if not args.pdf_dir:
                parser.error("--batch requires --pdf-dir")
            run_batch(args.batch, args.pdf_dir, args.output_dir)
            return

        # --- PDF path ---
        pdf_path = args.pdf
        if not pdf_path:
            pdf_path = pick_pdf_gui()

        # --- Pages ---
        if args.pages:
            page_numbers = parse_page_args(args.pages)
        else:
            reader = PdfReader(pdf_path)
            page_numbers = prompt_pages(len(reader.pages))

        # --- Output dir ---
        output_dir = args.output_dir or str(Path(pdf_path).parent)

    if not page_numbers:
        print("No pages specified. Exiting.")
        sys.exit(0)

    pdf_stem = Path(pdf_path).stem
    os.makedirs(output_dir, exist_ok=True)
    if reader is None:
        reader = PdfReader(pdf_path)
    total = len(reader.pages)

    try:
        for page_number in page_numbers:
            if page_number < 1 or page_number > total:
                print(
                    f"  [SKIP] Page {page_number} out of range "
                    f"(PDF has {total} pages)."
                )
                continue
            output_path = os.path.join(
                output_dir, f"{pdf_stem} - page{page_number}.txt"
            )
            output = process_page(reader, page_number)
            with open(output_path, "w", encoding="utf-8") as f:
                f.write(output)
            print(f"Page {page_number} → {output_path}")
            print(output)
    finally:
        reader.stream.close()


if __name__ == "__main__":
    main()
