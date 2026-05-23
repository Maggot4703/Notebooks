#!/usr/bin/env python3
import os
import subprocess
import sys
from pathlib import Path

from pypdf import PdfReader

# Configurable parameters
INPUT_DIR = "PDFs"
OUTPUT_DIR = "OCR"
# Use the actual path to ocr-pic.py in the repo
OCR_PIC_SCRIPT = str(
    Path(__file__).parent / ".github/skills/ocr-pic/scripts/ocr-pic.py"
)


def find_pdfs(input_dir):
    # Recursively find all PDFs in input_dir and subdirectories
    return sorted([p for p in Path(input_dir).rglob("*.pdf")])


def get_pages_with_counters(pdf_path):
    reader = PdfReader(str(pdf_path))
    pages = []
    for i, page in enumerate(reader.pages, 1):
        imgs = list(page.images)
        found = False
        for img_obj in imgs:
            w = h = None
            if hasattr(img_obj, "width") and hasattr(img_obj, "height"):
                w, h = img_obj.width, img_obj.height
            elif isinstance(img_obj, dict):
                w = img_obj.get("/Width")
                h = img_obj.get("/Height")
            else:
                try:
                    w = img_obj["/Width"]
                    h = img_obj["/Height"]
                except Exception:
                    print(
                        f"  [WARN] Could not get image size for page {i} in {pdf_path.name}"
                    )
            if w == 200 and h == 100:
                found = True
                break
            if w is None or h is None:
                # Fallback: if we cannot determine size, assume it's a counter and process this page
                print(
                    f"  [INFO] Fallback: Could not determine image size for page {i} in {pdf_path.name}, will attempt OCR."
                )
                found = True
                break
        if found:
            pages.append(i)
    return pages


def run_ocr_pic(pdf_path, pages, output_dir):
    if not pages:
        return
    page_args = [str(p) for p in pages]
    cmd = (
        [sys.executable, OCR_PIC_SCRIPT, "--pdf", str(pdf_path), "--pages"]
        + page_args
        + ["--output-dir", str(output_dir)]
    )
    print(f"Running: {' '.join(cmd)}")
    subprocess.run(cmd, check=True)


def main():
    input_dir = sys.argv[1] if len(sys.argv) > 1 else INPUT_DIR
    output_dir = sys.argv[2] if len(sys.argv) > 2 else OUTPUT_DIR
    os.makedirs(output_dir, exist_ok=True)
    pdfs = find_pdfs(input_dir)
    if not pdfs:
        print(f"No PDFs found in {input_dir}")
        return
    for pdf_path in pdfs:
        print(f"Processing {pdf_path.name}...")
        pages = get_pages_with_counters(pdf_path)
        if not pages:
            print(f"  No 200x100px counters found in {pdf_path.name}")
            continue
        run_ocr_pic(pdf_path, pages, output_dir)


if __name__ == "__main__":
    main()
