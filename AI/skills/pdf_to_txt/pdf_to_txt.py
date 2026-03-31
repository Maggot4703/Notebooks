#!/usr/bin/env python3

"""
PDF to Text Converter — Robust CLI Tool

Automatically detects text-based vs. scanned PDFs and chooses the
appropriate extraction method (fast text, fallback, or OCR with
language auto-detect).

USAGE EXAMPLES:
    # Convert a single PDF to .txt (auto-detects text vs. scanned)
    python pdf_to_txt.py input.pdf

    # Specify output file
    python pdf_to_txt.py input.pdf -o output.txt

    # Batch convert all PDFs in a directory
    python pdf_to_txt.py /path/to/dir/

    # Force OCR (for scanned/image PDFs)
    python pdf_to_txt.py input.pdf --ocr

    # Use OCR with language auto-detection
    python pdf_to_txt.py input.pdf --ocr --lang auto

    # Extract a specific page or range (e.g., page 2, or pages 3-5)
    python pdf_to_txt.py input.pdf --pages 2
    python pdf_to_txt.py input.pdf --pages 3-5

    # Stream output for large PDFs (writes one page at a time)
    python pdf_to_txt.py input.pdf --stream-write

    # Batch with error logging (directory mode)
    python pdf_to_txt.py /path/to/dir/ --error-log errors.txt

OPTIONS:
    input                 PDF file or directory of PDFs
    -o, --output          Output .txt path (single file only)
    --ocr                 Force OCR even for text-based PDFs
    --lang                Tesseract OCR language code (default: eng, or
                                                'auto' to detect)
    --pages               Page range to extract (N or N-M)
    --stream-write        Write output one page at a time (for large PDFs)
    --error-log           Path to error log file for batch runs

NOTES:
    - Output is UTF-8 with page separators formatted as '--- Page N ---'.
    - Batch mode: outputs .txt files next to each PDF.
    - Summary report (pages, words, OCR used) is printed to stderr after
        each run.
    - Requires: pypdf, pdfplumber, pdf2image, pytesseract, tqdm,
        langdetect, tesseract-ocr, poppler-utils.
    - See --help for all options.
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



def _extract_text_pypdf(pdf_path: Path, page_range=None, stream_write_fh=None):
    try:
        from pypdf import PdfReader
    except ImportError as exc:
        raise RuntimeError(
            "pypdf is required for fast text extraction. Install with: pip install pypdf"
        ) from exc
    pages = []
    reader = PdfReader(str(pdf_path))
    pages = []
    total_pages = len(reader.pages)
    indices = (
        range(total_pages)
        if page_range is None
        else [i for i in range(total_pages)
              if (i + 1) >= page_range[0] and (i + 1) <= page_range[1]]
    )
    for idx in indices:
        page = reader.pages[idx]
        header = PAGE_SEPARATOR.format(n=idx + 1)
        text = page.extract_text() or ""
        page_text = f"{header}\n{text}"
        if stream_write_fh:
            print(page_text, file=stream_write_fh)
        else:
            pages.append(page_text)
    if stream_write_fh:
        return
    return "\n\n".join(pages)


def _extract_text_pdfplumber(pdf_path: Path, page_range=None, stream_write_fh=None):
    _require_pdfplumber()
    import pdfplumber
    pages = []
    with pdfplumber.open(pdf_path) as pdf:
        total_pages = len(pdf.pages)
        indices = (
            range(total_pages)
            if page_range is None
            else [i for i in range(total_pages)
                  if (i + 1) >= page_range[0] and (i + 1) <= page_range[1]]
        )
        for idx in indices:
            page = pdf.pages[idx]
            header = PAGE_SEPARATOR.format(n=idx + 1)
            text = page.extract_text() or ""
            page_text = f"{header}\n{text}"
            if stream_write_fh:
                print(page_text, file=stream_write_fh)
            else:
                pages.append(page_text)
    if stream_write_fh:
        return
    return "\n\n".join(pages)



def _extract_text_ocr(pdf_path: Path, lang: str, page_range=None, stream_write_fh=None):
    _require_ocr_dependencies()

    from pdf2image import convert_from_path
    import pytesseract

    pages = []
    print(f"  Running OCR on {pdf_path.name} ...", file=sys.stderr)
    images = convert_from_path(pdf_path)
    total_pages = len(images)
    indices = (
        range(total_pages)
        if page_range is None
        else [i for i in range(total_pages)
              if (i + 1) >= page_range[0] and (i + 1) <= page_range[1]]
    )
    # Auto language detection if requested
    if lang == "auto":
        try:
            from langdetect import detect
            first_text = pytesseract.image_to_string(images[0])
            detected_lang = detect(first_text)
            # Map ISO 639-1 to tesseract codes if needed
            lang = detected_lang if detected_lang else "eng"
            print(f"  Detected OCR language: {lang}", file=sys.stderr)
        except Exception as exc:
            print(f"  Language auto-detection failed: {exc}. Using 'eng'", file=sys.stderr)
            lang = "eng"
    for idx in indices:
        image = images[idx]
        header = PAGE_SEPARATOR.format(n=idx + 1)
        text = pytesseract.image_to_string(image, lang=lang)
        page_text = f"{header}\n{text}"
        if stream_write_fh:
            print(page_text, file=stream_write_fh)
        else:
            pages.append(page_text)
    if stream_write_fh:
        return
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
    page_range=None,
    stream_write: bool = False,
):
    print(f"Converting: {pdf_path}", file=sys.stderr)
    _validate_output_path(output_path)

    use_ocr = force_ocr or _is_scanned(pdf_path)
    if stream_write:
        with open(output_path, "w", encoding="utf-8") as fh:
            if not use_ocr:
                try:
                    _extract_text_pypdf(
                        pdf_path, page_range=page_range, stream_write_fh=fh
                    )
                except Exception as exc:
                    print(f"  pypdf extraction failed: {exc}", file=sys.stderr)
                    _extract_text_pdfplumber(
                        pdf_path, page_range=page_range, stream_write_fh=fh
                    )
            else:
                if use_ocr:
                    print(
                        "  Method: OCR (scanned PDF detected)", file=sys.stderr
                    )
                    _extract_text_ocr(
                        pdf_path, lang=ocr_lang, page_range=page_range, stream_write_fh=fh
                    )
                else:
                    print(
                        "  Method: text extraction (pdfplumber)", file=sys.stderr
                    )
                    _extract_text_pdfplumber(
                        pdf_path, page_range=page_range, stream_write_fh=fh
                    )
        print(f"  Saved → {output_path}", file=sys.stderr)
        # Summary report for stream_write: count lines/pages/words
        with open(output_path, "r", encoding="utf-8") as fsum:
            content = fsum.read()
        page_count = content.count("--- Page ")
        word_count = len(content.split())
        print(
            f"  Summary: {page_count} pages, {word_count} words, OCR: {use_ocr}",
            file=sys.stderr,
        )
        return
    text = None
    if not use_ocr:
        try:
            text = _extract_text_pypdf(pdf_path, page_range=page_range)
            if len(text.strip()) < OCR_DETECTION_THRESHOLD:
                text = None
        except Exception as exc:
            print(f"  pypdf extraction failed: {exc}", file=sys.stderr)
            text = None
    if use_ocr or text is None:
        if use_ocr:
            print("  Method: OCR (scanned PDF detected)", file=sys.stderr)
            text = _extract_text_ocr(
                pdf_path, lang=ocr_lang, page_range=page_range
            )
        else:
            print("  Method: text extraction (pdfplumber)", file=sys.stderr)
            text = _extract_text_pdfplumber(pdf_path, page_range=page_range)
        if not text:
            text = ""
        output_path.write_text(text, encoding="utf-8")
    print(f"  Saved → {output_path}", file=sys.stderr)
    page_count = text.count("--- Page ")
    word_count = len(text.split())
    print(
        f"  Summary: {page_count} pages, {word_count} words, OCR: {use_ocr}",
        file=sys.stderr,
    )




def main() -> None:

    import concurrent.futures
    try:
        from tqdm import tqdm
        has_tqdm = True
    except ImportError:
        has_tqdm = False

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
        help="Tesseract OCR language code (default: eng, or 'auto' to detect)",
    )
    parser.add_argument(
        "--stream-write",
        action="store_true",
        help="Write output one page at a time (for large PDFs)",
    )
    parser.add_argument(
        "--error-log",
        type=str,
        default=None,
        help="Path to error log file for batch runs",
    )

    def parse_page_range(s):
        if not s:
            return None
        if '-' in s:
            parts = s.split('-')
            if len(parts) == 2:
                try:
                    start = int(parts[0])
                    end = int(parts[1])
                    return (start, end)
                except Exception:
                    pass
        try:
            page = int(s)
            return (page, page)
        except Exception:
            pass
        raise argparse.ArgumentTypeError(
            "Page range must be N or N-M (e.g., 2 or 3-5)"
        )

    parser.add_argument(
        "--pages",
        type=parse_page_range,
        default=None,
        help="Page range to extract (e.g., 2 or 3-5)",
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

        def process_pdf(pdf_file):
            out = pdf_file.with_suffix(".txt")
            try:
                convert(
                    pdf_file,
                    out,
                    force_ocr=args.ocr,
                    ocr_lang=args.lang,
                    page_range=args.pages,
                    stream_write=args.stream_write,
                )
                return (pdf_file, True, None)
            except Exception as exc:
                return (pdf_file, False, exc)

        bar = tqdm(pdf_files, desc="Processing PDFs") if has_tqdm else pdf_files
        with concurrent.futures.ThreadPoolExecutor() as executor:
            results = list(executor.map(process_pdf, bar))
        error_log_path = args.error_log
        error_log_fh = (
            open(error_log_path, "a", encoding="utf-8") if error_log_path else None
        )
        for pdf_file, ok, exc in results:
            if ok:
                successes += 1
            else:
                failures += 1
                msg = f"  ERROR: {pdf_file} failed: {exc}"
                print(msg, file=sys.stderr)
                if error_log_fh:
                    print(msg, file=error_log_fh)
        if error_log_fh:
            error_log_fh.close()
        if has_tqdm and hasattr(bar, "close"):
            bar.close()

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
            convert(
                input_path,
                out,
                force_ocr=args.ocr,
                ocr_lang=args.lang,
                page_range=args.pages,
                stream_write=args.stream_write,
            )
        except Exception as exc:
            print(f"ERROR: {exc}", file=sys.stderr)
            sys.exit(1)
    else:
        parser.error(f"Input not found: {input_path}")

    print("Done.", file=sys.stderr)


if __name__ == "__main__":
    main()
