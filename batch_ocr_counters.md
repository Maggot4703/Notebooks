# Batch OCR Counter Extraction

This script automates the process of scanning all PDFs in a directory for 200x100px counter images, running the ocr-pic skill on each relevant page, and saving the OCR results to separate text files. Pages without such counters are ignored.

## Usage

```
python batch_ocr_counters.py [input_dir] [output_dir]
```
- `input_dir`: Directory containing PDF files (default: `PDFs`)
- `output_dir`: Directory to save OCR results (default: `OCR`)

## Requirements
- Python packages: `pypdf`, `Pillow`, `pytesseract`, `numpy`
- System: `tesseract-ocr`
- `ocr-pic.py` script (from ocr-pic skill) must be present in the same directory or in your PATH

## How it Works
- For each PDF in the input directory:
    - Each page is checked for embedded images of exactly 200x100px.
    - If such images are found, the page is processed with `ocr-pic.py`.
    - OCR results are saved as `<pdf_stem>-page<N>.txt` in the output directory.
    - Pages without counters are skipped.

## Example

```
python batch_ocr_counters.py PDFs/ OCR/
```

This will process all PDFs in the `PDFs/` directory and write OCR results to `OCR/`.

---

See `ocr-pic.py` and the ocr-pic skill documentation for details on counter structure and output format.
