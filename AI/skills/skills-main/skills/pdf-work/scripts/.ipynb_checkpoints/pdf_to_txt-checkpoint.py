#!/usr/bin/env python3
"""Convert PDF files to plain text (.txt).

Automatically detects text-based vs. scanned PDFs and chooses the
appropriate extraction method.

Usage:
    python pdf_to_txt.py <file.pdf>              # → file.txt
    python pdf_to_txt.py <file.pdf> -o out.txt   # custom output
    python pdf_to_txt.py <directory/>            # batch: all PDFs in dir
    python pdf_to_txt.py <file.pdf> --ocr        # force OCR
"""

import argparse
import sys
from pathlib import Path

PAGE_SEPARATOR = "--- Page {n} ---"
OCR_DETECTION_THRESHOLD = 50  # chars on first page to classify as text-based


def _extract_text_pdfplumber(pdf_path: Path) -> str:
    import pdfplumber

    pages = []
    with pdfplumber.open(pdf_path) as pdf:
        for i, page in enumerate(pdf.pages, start=1):
            header = PAGE_SEPARATOR.format(n=i)
            text = page.extract_text() or ""
            pages.append(f"{header}\n{text}")
    return "\n\n".join(pages)


def _extract_text_ocr(pdf_path: Path) -> str:
    try:
        from pdf2image import convert_from_path
        import pytesseract
    except ImportError as exc:
        print(
            f"ERROR: OCR dependencies missing. Install with:\n"
            f"  pip install pdf2image pytesseract\n"
            f"  # Also requires: poppler-utils and tesseract-ocr\n"
            f"Details: {exc}",
            file=sys.stderr,
        )
        sys.exit(1)

    pages = []
    print(f"  Running OCR on {pdf_path.name} …", file=sys.stderr)
    images = convert_from_path(pdf_path)
    for i, image in enumerate(images, start=1):
        header = PAGE_SEPARATOR.format(n=i)
        text = pytesseract.image_to_string(image)
        pages.append(f"{header}\n{text}")
    return "\n\n".join(pages)


def _is_scanned(pdf_path: Path) -> bool:
    """Return True if the first page yields less text than the threshold."""
    try:
        import pdfplumber

        with pdfplumber.open(pdf_path) as pdf:
            if not pdf.pages:
                return True
            first_text = pdf.pages[0].extract_text() or ""
            return len(first_text.strip()) < OCR_DETECTION_THRESHOLD
    except Exception:
        return True


def convert(pdf_path: Path, output_path: Path, force_ocr: bool = False) -> None:
    print(f"Converting: {pdf_path}", file=sys.stderr)

    use_ocr = force_ocr or _is_scanned(pdf_path)
    if use_ocr:
        print("  Method: OCR (scanned PDF detected)", file=sys.stderr)
        text = _extract_text_ocr(pdf_path)
    else:
        print("  Method: text extraction (pdfplumber)", file=sys.stderr)
        text = _extract_text_pdfplumber(pdf_path)

    output_path.write_text(text, encoding="utf-8")
    print(f"  Saved → {output_path}", file=sys.stderr)


def main() -> None:
    parser = argparse.ArgumentParser(
        description="Convert PDF file(s) to plain text (.txt)."
    )
    parser.add_argument("input", help="PDF file or directory of PDFs")
    parser.add_argument("-o", "--output", help="Output .txt path (single file only)")
    parser.add_argument(
        "--ocr", action="store_true", help="Force OCR even for text-based PDFs"
    )
    args = parser.parse_args()

    input_path = Path(args.input)

    if input_path.is_dir():
        if args.output:
            parser.error("--output cannot be used with a directory input")
        pdf_files = sorted(input_path.glob("*.pdf"))
        if not pdf_files:
            print(f"No .pdf files found in {input_path}", file=sys.stderr)
            sys.exit(1)
        print(f"Found {len(pdf_files)} PDF(s) in {input_path}", file=sys.stderr)
        for pdf_file in pdf_files:
            out = pdf_file.with_suffix(".txt")
            convert(pdf_file, out, force_ocr=args.ocr)
    elif input_path.is_file():
        if not input_path.suffix.lower() == ".pdf":
            parser.error(f"Input file must be a .pdf: {input_path}")
        out = Path(args.output) if args.output else input_path.with_suffix(".txt")
        convert(input_path, out, force_ocr=args.ocr)
    else:
        parser.error(f"Input not found: {input_path}")

    print("Done.", file=sys.stderr)


if __name__ == "__main__":
    main()
