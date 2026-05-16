"""
PDF extraction worker for 0101 Book Browser.

Produces per-page JSON files and extracts images into WEB_ROOT/0101_extracted/{pdf_basename}/pageNN/.

Usage:
  python pdf_extract.py --pdf "/path/to/file.pdf"
  python pdf_extract.py --all

Requirements (optional): PyMuPDF (fitz) recommended. pdfplumber and pytesseract used as fallbacks/for OCR.
"""

from __future__ import annotations
import argparse
import json
import sys
from pathlib import Path
import time

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
PDFS_DIR = WEB_ROOT / "PDFs" / "SM"
OUT_DIR = WEB_ROOT / "0101_extracted"


def normalize_name(s: str) -> str:
    return "".join(c if c.isalnum() or c in (" ", "-", "_") else "_" for c in s).strip()


def extract_with_fitZ(pdf_path: Path, out_root: Path):
    doc = fitz.open(str(pdf_path))
    meta = {"name": pdf_path.name, "pages": [], "extracted_at": int(time.time())}
    base_out = out_root / normalize_name(pdf_path.stem)
    base_out.mkdir(parents=True, exist_ok=True)

    for i in range(doc.page_count):
        page = doc.load_page(i)
        rect = page.rect
        page_out = base_out / f"page{(i+1):03d}"
        page_out.mkdir(parents=True, exist_ok=True)

        # extract text blocks
        try:
            text_dict = page.get_text("dict")
            # collect text blocks
            blocks = []
            for b in text_dict.get("blocks", []):
                if b.get("type") == 0:  # text
                    spans = []
                    for line in b.get("lines", []):
                        for span in line.get("spans", []):
                            spans.append(
                                {
                                    "text": span.get("text"),
                                    "bbox": span.get("bbox"),
                                    "size": span.get("size"),
                                    "font": span.get("font"),
                                }
                            )
                    blocks.append({"bbox": b.get("bbox"), "spans": spans})
        except Exception:
            blocks = []

        # extract images on the page
        images = []
        try:
            imglist = page.get_images(full=True)
            for img_index, img in enumerate(imglist, start=1):
                xref = img[0]
                pix = fitz.Pixmap(doc, xref)
                if pix.n < 5:
                    fmt = "png"
                    img_name = page_out / f"img{img_index:03d}.{fmt}"
                    pix.save(str(img_name))
                    images.append(
                        {"file": str(img_name.relative_to(WEB_ROOT)), "type": fmt}
                    )
                else:
                    # CMYK: convert to RGB
                    pix1 = fitz.Pixmap(fitz.csRGB, pix)
                    img_name = page_out / f"img{img_index:03d}.png"
                    pix1.save(str(img_name))
                    images.append(
                        {"file": str(img_name.relative_to(WEB_ROOT)), "type": "png"}
                    )
                    pix1 = None
                pix = None
        except Exception:
            images = []

        # if no text blocks and OCR available, render page image and OCR
        ocr_text = ""
        if (
            (not blocks or sum(len(b.get("spans", [])) for b in blocks) == 0)
            and pytesseract is not None
            and Image is not None
        ):
            try:
                mat = fitz.Matrix(2, 2)
                pix = page.get_pixmap(matrix=mat)
                tmp_img = page_out / "page_image.png"
                pix.save(str(tmp_img))
                ocr_text = pytesseract.image_to_string(Image.open(str(tmp_img)))
            except Exception:
                ocr_text = ""

        # also save full page raster for client fallback
        try:
            mat = fitz.Matrix(2, 2)
            pix = page.get_pixmap(matrix=mat)
            page_img = page_out / "page_full.png"
            pix.save(str(page_img))
            page_image_rel = str(page_img.relative_to(WEB_ROOT))
        except Exception:
            page_image_rel = None

        page_meta = {
            "page_number": i + 1,
            "bbox": [rect.x0, rect.y0, rect.x1, rect.y1],
            "text_blocks": blocks,
            "images": images,
            "ocr_text": ocr_text,
            "page_image": page_image_rel,
        }
        meta["pages"].append(page_meta)

        # write per-page JSON
        with open(page_out / "page.json", "w", encoding="utf-8") as fh:
            json.dump(page_meta, fh, ensure_ascii=False, indent=2)

    # write top-level metadata
    with open(base_out / "manifest.json", "w", encoding="utf-8") as fh:
        json.dump(meta, fh, ensure_ascii=False, indent=2)
    doc.close()
    return base_out


def extract_with_pdfplumber(pdf_path: Path, out_root: Path):
    # simpler extraction using pdfplumber
    base_out = out_root / normalize_name(pdf_path.stem)
    base_out.mkdir(parents=True, exist_ok=True)
    meta = {"name": pdf_path.name, "pages": [], "extracted_at": int(time.time())}
    with pdfplumber.open(str(pdf_path)) as doc:
        for i, p in enumerate(doc.pages):
            page_out = base_out / f"page{(i+1):03d}"
            page_out.mkdir(parents=True, exist_ok=True)
            text = p.extract_text() or ""
            # extract images (pdfplumber makes this awkward; skip heavy extraction)
            page_meta = {"page_number": i + 1, "text": text, "images": []}
            meta["pages"].append(page_meta)
            with open(page_out / "page.json", "w", encoding="utf-8") as fh:
                json.dump(page_meta, fh, ensure_ascii=False, indent=2)
    with open(base_out / "manifest.json", "w", encoding="utf-8") as fh:
        json.dump(meta, fh, ensure_ascii=False, indent=2)
    return base_out


def process_pdf(pdf_path: Path):
    print(f"Processing: {pdf_path}")
    if not pdf_path.exists():
        print("File not found", file=sys.stderr)
        return None
    out_root = OUT_DIR
    out_root.mkdir(parents=True, exist_ok=True)

    try:
        if fitz is not None:
            base_out = extract_with_fitZ(pdf_path, out_root)
        elif pdfplumber is not None:
            base_out = extract_with_pdfplumber(pdf_path, out_root)
        else:
            print(
                "No PDF extraction library available (fitz/pdfplumber).",
                file=sys.stderr,
            )
            return None
        print(f"Wrote extracted assets to: {base_out}")
        return base_out
    except Exception as e:
        print("Error processing", e, file=sys.stderr)
        return None


def find_pdfs(cli_pdf: str | None, all_flag: bool) -> list[Path]:
    if cli_pdf:
        p = Path(cli_pdf)
        return [p]
    if all_flag:
        return sorted(PDFS_DIR.glob("*.pdf"))
    return []


def main(argv=None):
    parser = argparse.ArgumentParser()
    parser.add_argument("--pdf", help="Single PDF to process (path)")
    parser.add_argument(
        "--all", action="store_true", help="Process all PDFs in PDFs/SM"
    )
    args = parser.parse_args(argv)

    targets = find_pdfs(args.pdf, args.all)
    if not targets:
        print("No PDFs specified. Use --pdf or --all.")
        return
    for t in targets:
        process_pdf(Path(t))


if __name__ == "__main__":
    main()
