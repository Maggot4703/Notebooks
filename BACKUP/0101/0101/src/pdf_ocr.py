"""
OCR helper: render PDF pages to images and run pytesseract, updating page.json with "ocr_text".
Usage:
  python pdf_ocr.py --pdf /path/to.pdf --all
  python pdf_ocr.py --pdf /path/to.pdf --page 1
"""

from __future__ import annotations
import argparse
import json
from pathlib import Path

try:
    import fitz
except Exception:
    fitz = None
try:
    import pdfplumber
except Exception:
    pdfplumber = None
try:
    from PIL import Image
except Exception:
    Image = None
try:
    import pytesseract
except Exception:
    pytesseract = None

HERE = Path(__file__).resolve().parent
WEB_ROOT = HERE / "public_html"
OUT_DIR = WEB_ROOT / "0101_extracted"
PDFS_DIR = WEB_ROOT / "PDFs" / "SM"


def ocr_with_fitz(pdf_path: Path, page_index: int, page_out: Path) -> str:
    if fitz is None:
        return ""
    try:
        doc = fitz.open(str(pdf_path))
        page = doc.load_page(page_index)
        mat = fitz.Matrix(2, 2)
        pix = page.get_pixmap(matrix=mat)
        img_path = page_out / "ocr_page.png"
        page_out.mkdir(parents=True, exist_ok=True)
        pix.save(str(img_path))
        doc.close()
        if pytesseract and Image:
            text = pytesseract.image_to_string(Image.open(str(img_path)))
            return text
    except Exception:
        return ""
    return ""


def ocr_with_pdfplumber(pdf_path: Path, page_index: int, page_out: Path) -> str:
    if pdfplumber is None:
        return ""
    try:
        with pdfplumber.open(str(pdf_path)) as doc:
            p = doc.pages[page_index]
            img = p.to_image(resolution=150)
            page_out.mkdir(parents=True, exist_ok=True)
            img_path = page_out / "ocr_page.png"
            img.save(str(img_path), format="PNG")
            if pytesseract and Image:
                text = pytesseract.image_to_string(Image.open(str(img_path)))
                return text
    except Exception:
        return ""
    return ""


def update_page_json(page_out: Path, ocr_text: str):
    page_json = page_out / "page.json"
    data = {}
    if page_json.exists():
        try:
            with open(page_json, "r", encoding="utf-8") as fh:
                data = json.load(fh)
        except Exception:
            data = {}
    data["ocr_text"] = ocr_text
    with open(page_json, "w", encoding="utf-8") as fh:
        json.dump(data, fh, ensure_ascii=False, indent=2)


def process_pdf(pdf_path: Path, pages: list[int] | None):
    base = OUT_DIR / pdf_path.stem
    # adapt to names created earlier (some names include spaces/underscores)
    # find best matching directory under OUT_DIR
    candidates = [
        d for d in OUT_DIR.iterdir() if d.is_dir() and pdf_path.stem in d.name
    ]
    if candidates:
        base = candidates[0]
    else:
        base = OUT_DIR / pdf_path.stem
    print("Using extracted base:", base)
    if not base.exists():
        print("Extracted base does not exist; aborting")
        return
    # discover pages
    pages_dirs = sorted(
        [p for p in base.iterdir() if p.is_dir() and p.name.startswith("page")]
    )
    total = len(pages_dirs)
    if pages is None:
        indices = list(range(total))
    else:
        indices = [p - 1 for p in pages]
    for idx in indices:
        if idx < 0 or idx >= total:
            continue
        page_out = pages_dirs[idx]
        print("OCR page", idx + 1, "->", page_out)
        text = ""
        # try fitz first
        text = ocr_with_fitz(pdf_path, idx, page_out)
        if not text:
            text = ocr_with_pdfplumber(pdf_path, idx, page_out)
        if text:
            update_page_json(page_out, text)
            print("Wrote OCR text for page", idx + 1)
        else:
            print("No OCR text for page", idx + 1)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--pdf", required=True)
    parser.add_argument("--page", type=int)
    parser.add_argument("--all", action="store_true")
    args = parser.parse_args()

    pdf_path = Path(args.pdf)
    if not pdf_path.exists():
        print("PDF not found:", pdf_path)
        return
    pages = None
    if args.page:
        pages = [args.page]
    elif not args.all:
        print("Specify --page or --all")
        return
    process_pdf(pdf_path, pages)


if __name__ == "__main__":
    main()
