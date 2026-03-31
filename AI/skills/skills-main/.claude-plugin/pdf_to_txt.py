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
import shutil
import sys
from pathlib import Path

PAGE_SEPARATOR = "--- Page {n} ---"
OCR_DETECTION_THRESHOLD = 50  # chars on first page to classify as text-based


def _require_pdfplumber() -> None:
    try:
        import pdfplumber  # noqa: F401
    except ImportError as exc:
        raise RuntimeError(
            "pdfplumber is required for text extraction and auto-detection. "
            "Install with: pip install pdfplumber"
        ) from exc


def _require_ocr_dependencies() -> None:
    missing_tools = []
    if shutil.which("tesseract") is None:
        missing_tools.append("tesseract-ocr (tesseract)")
    if shutil.which("pdftoppm") is None and shutil.which("pdftocairo") is None:
        missing_tools.append("poppler-utils (pdftoppm/pdftocairo)")

    if missing_tools:
        missing = ", ".join(missing_tools)
        raise RuntimeError(
            "OCR system tools missing: "
            f"{missing}. Install required system packages before using --ocr."
        )

    try:
        from pdf2image import convert_from_path  # noqa: F401
        import pytesseract  # noqa: F401
    except ImportError as exc:
        raise RuntimeError(
            "OCR Python dependencies missing. Install with: "
            "pip install pdf2image pytesseract"
        ) from exc


def _validate_output_path(output_path: Path) -> None:
    parent = output_path.parent
    if not parent.exists():
        raise FileNotFoundError(f"Output directory does not exist: {parent}")
    if not parent.is_dir():
        raise NotADirectoryError(f"Output parent is not a directory: {parent}")


def _extract_text_pdfplumber(pdf_path: Path) -> str:
    _require_pdfplumber()

    import pdfplumber

    pages = []
    with pdfplumber.open(pdf_path) as pdf:
        for i, page in enumerate(pdf.pages, start=1):
            header = PAGE_SEPARATOR.format(n=i)
            text = page.extract_text() or ""
            pages.append(f"{header}\n{text}")
    return "\n\n".join(pages)


def _extract_text_ocr(pdf_path: Path, lang: str) -> str:
    _require_ocr_dependencies()

    from pdf2image import convert_from_path
    import pytesseract

    pages = []
    print(f"  Running OCR on {pdf_path.name} ...", file=sys.stderr)
    images = convert_from_path(pdf_path)
    for i, image in enumerate(images, start=1):
        header = PAGE_SEPARATOR.format(n=i)
        text = pytesseract.image_to_string(image, lang=lang)
        pages.append(f"{header}\n{text}")
    return "\n\n".join(pages)


def _is_scanned(pdf_path: Path) -> bool:
    """Return True if the first page yields less text than the threshold."""
    try:
        _require_pdfplumber()

        import pdfplumber

        with pdfplumber.open(pdf_path) as pdf:
            if not pdf.pages:
                return True
            first_text = pdf.pages[0].extract_text() or ""
            return len(first_text.strip()) < OCR_DETECTION_THRESHOLD
    except Exception as exc:
        print(
            "  Warning: could not determine scanned/text type for "
            f"{pdf_path.name}: {exc}",
            file=sys.stderr,
        )
        print("  Falling back to text extraction.", file=sys.stderr)
        return False


def convert(
    pdf_path: Path,
    output_path: Path,
    force_ocr: bool = False,
    ocr_lang: str = "eng",
) -> None:
    print(f"Converting: {pdf_path}", file=sys.stderr)
    _validate_output_path(output_path)

    use_ocr = force_ocr or _is_scanned(pdf_path)
    if use_ocr:
        print("  Method: OCR (scanned PDF detected)", file=sys.stderr)
        text = _extract_text_ocr(pdf_path, lang=ocr_lang)
    else:
        print("  Method: text extraction (pdfplumber)", file=sys.stderr)
        text = _extract_text_pdfplumber(pdf_path)

    output_path.write_text(text, encoding="utf-8")
    print(f"  Saved → {output_path}", file=sys.stderr)


def main() -> None:
    parser = argparse.ArgumentParser(
        description=(
            "Convert PDF file(s) to plain text (.txt). Output is UTF-8 with "
            f"page separators formatted as '{PAGE_SEPARATOR}'."
        )
    )
    parser.add_argument("input", help="PDF file or directory of PDFs")
    parser.add_argument(
        "-o", "--output", help="Output .txt path (single file only)"
    )
    parser.add_argument(
        "--ocr", action="store_true", help="Force OCR even for text-based PDFs"
    )
    parser.add_argument(
        "--lang",
        default="eng",
        help="Tesseract OCR language code (default: eng)",
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
        print(
            f"Found {len(pdf_files)} PDF(s) in {input_path}", file=sys.stderr
        )
        successes = 0
        failures = 0
        for pdf_file in pdf_files:
            out = pdf_file.with_suffix(".txt")
            try:
                convert(pdf_file, out, force_ocr=args.ocr, ocr_lang=args.lang)
                successes += 1
            except Exception as exc:
                failures += 1
                print(f"  ERROR: {pdf_file} failed: {exc}", file=sys.stderr)

        print(
            f"Batch complete: {successes} succeeded, {failures} failed.",
            file=sys.stderr,
        )
        if failures:
            sys.exit(1)
    elif input_path.is_file():
        if not input_path.suffix.lower() == ".pdf":
            parser.error(f"Input file must be a .pdf: {input_path}")
        out = (
            Path(args.output)
            if args.output
            else input_path.with_suffix(".txt")
        )
        try:
            convert(input_path, out, force_ocr=args.ocr, ocr_lang=args.lang)
        except Exception as exc:
            print(f"ERROR: {exc}", file=sys.stderr)
            sys.exit(1)
    else:
        parser.error(f"Input not found: {input_path}")

    print("Done.", file=sys.stderr)


if __name__ == "__main__":
    main()
