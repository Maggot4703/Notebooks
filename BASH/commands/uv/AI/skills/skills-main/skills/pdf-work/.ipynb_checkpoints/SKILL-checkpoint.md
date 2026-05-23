---
name: pdf-work
description: Use this skill when the user wants to open a PDF file and convert it to plain text (.txt). Triggers on requests like "convert PDF to text", "extract text from PDF", "read a PDF file", "turn this PDF into a text file", or "save PDF content as .txt". Handles both regular text-based PDFs and scanned/image-based PDFs using OCR. Use the existing `pdf` skill for other PDF operations (merge, split, create, fill forms, etc.).
---

# PDF to Text Conversion

Convert PDF files to `.txt`. Two paths:

- **Text-based PDFs** — use `pdfplumber` (fast, layout-preserving)
- **Scanned / image-based PDFs** — use `pdf2image` + `pytesseract` (OCR)

The bundled script `scripts/pdf_to_txt.py` handles both automatically.

## Dependencies

```bash
pip install pdfplumber pypdf

# OCR support (for scanned PDFs)
pip install pdf2image pytesseract
sudo apt-get install poppler-utils tesseract-ocr  # Linux
# macOS: brew install poppler tesseract
```

## Quick Start

```bash
# Single file — output written to input.txt
python scripts/pdf_to_txt.py document.pdf

# Custom output path
python scripts/pdf_to_txt.py document.pdf -o output.txt

# Batch: convert all PDFs in a directory
python scripts/pdf_to_txt.py ./my-pdfs/

# Force OCR even on text-based PDFs
python scripts/pdf_to_txt.py document.pdf --ocr
```

## How It Works

1. Open PDF with `pdfplumber`
2. Extract text from the first page
3. If extracted text is ≥ 50 characters → **text path** (fast)
4. Otherwise → **OCR path** (converts pages to images, runs Tesseract)
5. Each page is written with a `--- Page N ---` separator
6. Output saved to `.txt`

## Manual Python Usage

### Text-based PDF

```python
import pdfplumber

def pdf_to_txt(input_path: str, output_path: str) -> None:
    with pdfplumber.open(input_path) as pdf:
        with open(output_path, "w", encoding="utf-8") as out:
            for i, page in enumerate(pdf.pages, start=1):
                out.write(f"--- Page {i} ---\n")
                text = page.extract_text() or ""
                out.write(text + "\n\n")
```

### Scanned PDF (OCR)

```python
import pytesseract
from pdf2image import convert_from_path

def scanned_pdf_to_txt(input_path: str, output_path: str) -> None:
    images = convert_from_path(input_path)
    with open(output_path, "w", encoding="utf-8") as out:
        for i, image in enumerate(images, start=1):
            out.write(f"--- Page {i} ---\n")
            text = pytesseract.image_to_string(image)
            out.write(text + "\n\n")
```

## Notes

- OCR quality depends on scan resolution; 300 DPI or higher recommended
- For scanned PDFs in languages other than English, pass `lang` to Tesseract:
  ```python
  pytesseract.image_to_string(image, lang="fra")  # French
  ```
- Password-protected PDFs: decrypt first with `pypdf` or `qpdf`
  ```bash
  qpdf --password=SECRET --decrypt encrypted.pdf decrypted.pdf
  ```
- For more advanced extraction (tables, structured data), see the `pdf` skill
