# ocr-pic Skill – Improvement Suggestions

## 1. OCR Accuracy

### 1a. Multi-PSM voting
Run Tesseract with `--psm 6`, `--psm 4`, and `--psm 11` on every counter and pick the result with the highest average per-character confidence (via `image_to_data()`). Currently only `--psm 6` is used.

### 1b. Morphological thickening
After upscale and invert, apply a small dilation (`ImageFilter.MaxFilter(3)`) to thicken thin strokes before OCR. Thin fonts at low source DPI are the main cause of `1 → l`, `0 → U` confusions.

### 1c. Adaptive thresholding
Replace `ImageOps.autocontrast` with OpenCV `cv2.adaptiveThreshold` (Gaussian, blockSize ~11). This handles uneven lighting/gradients on the colour strip better than global contrast stretch.

### 1d. Sharpening pass
After upscale add `img.filter(ImageFilter.UnsharpMask(radius=1, percent=150))` before thresholding to improve edge definition on small bitmap fonts.

### 1e. Per-line confidence flagging
Use `pytesseract.image_to_data()` (which returns a confidence per word) and mark any line where average confidence < 70 with a trailing `[?]` in the output, so the user knows which lines need manual review.

---

## 2. Grid / Slot Detection

### 2a. Coordinate-based slot ordering
`pypdf` exposes each image's position via its XObject transform matrix. Extract `(x, y)` for each image and derive slot order geometrically (sort by row-band then x). This removes dependence on image names like `X5.png` which are not always present or reliable.

### 2b. Empty-slot detection
After coordinate sorting, mark any gap in the 3×3 grid as `[empty]` in the output instead of silently skipping it. Keeps the reader's slot numbering aligned with expected output.

---

## 3. Counter Type Detection

### 3a. Wider colour palette
Add support for at least:
- **GREEN** → Army (ground forces that aren't Marine)
- **YELLOW/GOLD** → Scout or Mercenary
- **WHITE/GREY** → Civilian or neutral

Current two-class (NAVY/MARINE) logic falls back to `UNKNOWN` for anything else and then guesses NAVY, which introduces silent errors.

### 3b. Use HSV hue histogram instead of median
The median hue can be thrown off by the white text region bleeding into the left-strip sample. Compute the hue histogram of fully-saturated pixels only (`sat > 50`), and use the dominant bin. More robust against mixed-colour edges.

---

## 4. Configuration & Extensibility

### 4a. External config file
Move `KNOWN_WORLD_NAMES`, `NAVY_WORLD_UNIT_CODE`, known size/quality/mobility words into a JSON config (e.g. `ocr-pic-config.json`). Accept `--config` argument. This avoids hard-coding game data in the script and allows reuse for different sectors/supplements.

### 4b. Per-page overrides
Allow the config to specify per-page settings:
```json
{
  "pages": {
    "37": { "grid_cols": 3, "counter_width_px": 200, "counter_height_px": 100 }
  }
}
```

### 4c. `--dry-run` / `--inspect` mode
Add a `--inspect` flag that lists all images found on the page (name, dimensions, detected type, slot) without running full OCR. Useful for diagnosing why a page produces wrong results before committing to a full run.

---

## 5. Output Formats

### 5a. JSON output mode
Add `--format json` that writes structured output:
```json
[
  { "slot": 1, "label": "R1C1", "type": "NAVY", "lines": ["0304 Chronor", ...] },
  ...
]
```
Enables downstream tooling (spreadsheets, map viewers) without parsing the text format.

### 5b. CSV output mode
Add `--format csv` for tabular import into spreadsheets.

### 5c. Confidence column
Include a confidence value per line in JSON/CSV output for automated quality filtering.

---

## 6. Multi-Page Workflow

### 6a. Smarter `--count` default
When `--count` is not specified, automatically stop at the last page that contains counter images (detect via `is_counter_candidate` without OCR) rather than requiring the user to know the exact page count.

### 6b. Progress reporting
Print a summary per page: `Page 37: 7 counters (NAVY: 4, MARINE: 3)` to standard error so the user can see progress on multi-page runs.

---

## 7. Skill Documentation (SKILL.md)

- Add a **Troubleshooting** section for `UNKNOWN` type detection (how to check the raw left-strip colour).
- Document the `--inspect` flag once added.
- Add a worked example with actual command and expected output snippet.
- Note that `pypdf` image extraction order is PDF-internal and NOT guaranteed to match visual page order — always use coordinate-based sorting (improvement 2a above).
