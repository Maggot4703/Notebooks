---
name: ocr-pic
description: "Use when: OCR-ing images embedded in a PDF page, especially small images with text on a coloured background. Classifies wargame counter type (NAVY/MARINE) from left-side stripe colour, crops to the text-only right half, OCRs each counter, and emits 10-line labelled field output. Use for: reading ship stats cards, unit counters, or any graphical text embedded in a PDF."
argument-hint: "--pdf <path> --pages <N> [N ...] --output-dir <dir>"
---

# ocr-pic Skill

## Purpose
Extract embedded counter images from a PDF page, classify each by counter type
(NAVY / MARINE), OCR the text side, apply confirmed font-confusion corrections,
and write one labelled `.txt` file per page.  The PDF text layer is deliberately
ignored — only graphical image objects are processed.

## When to Use
- User asks to OCR wargame counter images on a PDF page
- Counters are ~200×100px with a solid-colour left half and text on the right
- Multiple pages or PDFs need to be processed in one run

## Dependencies
- Python: `pypdf`, `Pillow`, `pytesseract`, `numpy`
- System: `tesseract-ocr` (`sudo apt install tesseract-ocr`)

```bash
pip install pypdf Pillow pytesseract numpy
```

## Counter Structure
```
|<-- 100px colour band -->|<-- 100px white text area -->|
  NAVY   = cyan (R≈0, G≈255, B≈255)
  MARINE = red  (R≈255, G≈0,   B≈0)
```
Each counter has exactly 10 lines of text on the right half.

## Field Layouts

### NAVY (10 lines)
| Line | Label | Example |
|------|-------|---------|
| 1 | Unit ID | `0304 Chronor` |
| 2 | Ship Code | `C001` (1 letter + 3 digits) |
| 3 | Squadron Type | `Cruiser` |
| 4 | Jump | `J-2` |
| 5 | Streamlining | `USL` (CAPS) |
| 6 | DF | `DF 7` |
| 7 | AF | `AF 3` |
| 8 | BF | `BF 0` |
| 9 | TF | `TF 7` |
| 10 | TL | `TL 13` |

### MARINE (10 lines)
| Line | Label | Example |
|------|-------|---------|
| 1 | Unit ID | `0304 Chronor` |
| 2 | Code | `0003` (4 digits) |
| 3 | Size | `2-Regiment` |
| 4 | Quality | `1-Elite` |
| 5 | Mobility | `1-Armoured` |
| 6 | Mobility | `GRAV` or blank |
| 7 | Type | `0-Infantry` |
| 8 | CF | `CF 20` |
| 9 | TF | `TF 5` |
| 10 | TL | `TL 13` |

## Usage

### Named flags (recommended)
```bash
python ocr-pic.py --pdf file.pdf --pages 37 38 --output-dir /tmp/out
python ocr-pic.py --pdf file.pdf --pages 37-40
python ocr-pic.py --pdf file.pdf --pages 37,39-41 --output-dir /tmp/out
```

### Legacy positional (backward-compatible)
```bash
python ocr-pic.py <pdf_path> <page1> [page2 ...] <output_dir>
```

### Fully interactive (no arguments)
```bash
python ocr-pic.py
# → Tk file-chooser opens for PDF selection
# → Terminal prompt for pages (accepts 37, 37,38, or 37-40)
```

Output files are named: `<pdf-stem> - page<N>.txt` in `--output-dir`
(defaults to the PDF's own directory).

## Procedure

### 1. Confirm inputs
- PDF path, page number(s), output directory

### 2. Inspect images on the page (read-only check)
```python
from pypdf import PdfReader
import io
from PIL import Image

reader = PdfReader(pdf_path)
imgs = list(reader.pages[page_number - 1].images)
for img_obj in imgs:
    raw = Image.open(io.BytesIO(img_obj.data))
    print(f"{img_obj.name}: {raw.size} px")
```
Expected: ~200×100px, RGB, ≤9 images per page (3×3 grid).

### 3. View a raw image
Save one image to `/tmp/` and use `view_image` to confirm:
- Left half = solid colour strip (cyan=NAVY, red=MARINE)
- Right half = white background with black text
- If left is neither cyan nor red → `EMPTY` (skipped)

### 4. Preprocessing (right-half crop)
The script crops to the right half (`x = w//2+1` to `w-1`, inset 1px top/bottom),
upscales 6× with LANCZOS, converts to grayscale, adds a 30px white border.
**No colour inversion** — text is already dark on light.

### 5. Type detection
Samples the left 22% of the image (middle 80% height) using RGB median + HSV:
- `B > R+20 and B > G+10` (or HSV hue 120–190, sat ≥ 35) → `NAVY`
- `R > B+20 and R > G+10` (or HSV hue ≤15 or ≥240, sat ≥ 35) → `MARINE`
- Otherwise → `EMPTY` (image skipped silently)

### 6. Post-processing corrections
Applied per field label after OCR — only confirmed substitutions:

| Field | Raw OCR | Corrected | Reason |
|-------|---------|-----------|--------|
| DF, TF | `DF ?` | `DF 7` | trailing `?` = misread `7` |
| BF | `BF O` | `BF 0` | trailing `O` = misread `0` |
| TL | `Tl 13` | `TL 13` | `Tl`/`TI` prefix → `TL` (cosmetic) |
| TL | `TI if` | `TL` | `if` = unrecoverable — value stripped |

### 7. Output format
```
# Page 37

--- R2C2 | NAVY | X5.png ---
  Unit ID: 0304 Chronor
  Ship Code: Co01
  ...
  TL: TL 13

--- R3C3 | NAVY | X9.png ---
  ...
```
Grid label (e.g. `R2C2`) is derived from the image name's embedded digit (1–9).

### 8. Flag residual noise
Always report uncertain values to the user for manual verification:
- `?` in non-DF/TF positions (e.g. `TL 1?`) — trailing digit unrecoverable
- Garbled Code line (e.g. `. Braet`) — damaged or very low-res image
- `TL A` — unrecognised character

## Known Font Confusions (confirmed)
| OCR output | Actual | Position |
|------------|--------|----------|
| `?` | `7` | DF, TF number |
| `O` | `0` | BF number |
| `Tl` / `TI` | `TL` | TL label prefix |
| `o` | `0` | Ship Code digits (e.g. `Co01` = `C001`) |
| `1?` | `12` | TL trailing digit (verify against PDF) |

## Reference Script
[scripts/ocr-pic.py](./scripts/ocr-pic.py)
