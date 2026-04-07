---
name: batch-ocr-counters
description: |
  Use when: you need to batch OCR all 200x100px counter images in every PDF in a directory, using the ocr-pic skill for classification and text extraction. This skill automates detection, OCR, and output file management for wargame counters or similar graphics.
argument-hint: "--input-dir <pdf_dir> --output-dir <out_dir>"
---

# batch-ocr-counters Skill

## Purpose
Batch process all PDFs in a directory, scanning each page for 200x100px counter images, running the ocr-pic skill on each relevant page, and saving the OCR results to separate text files. Pages without such counters are ignored.

## When to Use
- You have a directory of PDFs with wargame counters or similar graphics to OCR
- Counters are exactly 200x100px, with a colored left half and text on the right
- You want to automate the process for many files/pages

## Dependencies
- Python: `pypdf`, `Pillow`, `pytesseract`, `numpy`
- System: `tesseract-ocr`
- `ocr-pic.py` script (from ocr-pic skill) must be present in the same directory or in your PATH

## Usage

```bash
python batch_ocr_counters.py --input-dir PDFs/ --output-dir OCR/
```
- All PDFs in `PDFs/` will be scanned for 200x100px counters
- OCR results are written as `<pdf_stem>-page<N>.txt` in `OCR/`
- Pages without counters are skipped

## Output
- One `.txt` file per page with counters, labeled fields per ocr-pic conventions
- Naming: `<pdf_stem>-page<N>.txt`

## See Also
- [ocr-pic skill](../ocr-pic/SKILL.md)
- [batch_ocr_counters.py](batch_ocr_counters.py)
