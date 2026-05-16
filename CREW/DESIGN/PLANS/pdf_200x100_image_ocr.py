#!/usr/bin/env python3
"""
Batch extract 200x100 images from PDFs and OCR them.
- Uses pdfimages to extract images
- Filters for 200x100 px images
- Runs OCR on those images
- Saves results to a markdown file
"""

import subprocess
from pathlib import Path

import pytesseract
from PIL import Image

target_dir = "/home/me/Desktop/T5/Vland"
out_md = "/home/me/Desktop/T5/Vland/pdf_image_ocr_results.md"
pdfimages_bin = "pdfimages"  # Assumes in PATH


def extract_images(pdf_path, out_dir):
    out_prefix = out_dir / (pdf_path.stem + "_img")
    cmd = [pdfimages_bin, "-png", str(pdf_path), str(out_prefix)]
    subprocess.run(cmd, check=True)
    return list(out_dir.glob(f"{pdf_path.stem}_img-*.png"))


def filter_images(img_paths, width=200, height=100):
    filtered = []
    for img_path in img_paths:
        with Image.open(img_path) as im:
            if im.width == width and im.height == height:
                filtered.append(img_path)
    return filtered


def ocr_image(img_path):
    with Image.open(img_path) as im:
        return pytesseract.image_to_string(im)


def main():
    pdfs = [f for f in Path(target_dir).glob("*.pdf")]
    results = []
    tmp_img_dir = Path(target_dir) / "tmp_pdf_images"
    tmp_img_dir.mkdir(exist_ok=True)
    for pdf in pdfs:
        try:
            img_paths = extract_images(pdf, tmp_img_dir)
            filtered = filter_images(img_paths)
            for img in filtered:
                text = ocr_image(img)
                results.append({"pdf": pdf.name, "img": img.name, "text": text.strip()})
        except Exception as e:
            results.append({"pdf": pdf.name, "img": None, "text": f"ERROR: {e}"})
    # Write markdown
    with open(out_md, "w", encoding="utf-8") as f:
        f.write("# PDF 200x100 Image OCR Results\n\n")
        for r in results:
            f.write(f"## {r['pdf']}\n")
            if r["img"]:
                f.write(f"- Image: {r['img']}\n")
                f.write(f"- OCR Text:\n\n    {r['text']}\n\n")
            else:
                f.write(f"- ERROR: {r['text']}\n\n")
    # Cleanup
    for img in tmp_img_dir.glob("*"):
        img.unlink()
    tmp_img_dir.rmdir()


if __name__ == "__main__":
    main()
