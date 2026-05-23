## Plan: Page 37-38 Counter OCR Skill Update

Update the OCR skill script to extract only graphical counter text from page 37 and page 38 of the target PDF, classify counters by left-side colour (NAVY blue / MARINE red), enforce a fixed 3x3 left-to-right grid output with empty slots skipped, and apply conservative template-driven OCR correction before writing page-specific output files.

**Steps**
1. Discovery validation phase: confirm page 37 and page 38 rendering characteristics and verify whether counters are recoverable as embedded images (`page.images`) or require page rasterization + region detection (`pypdf` page render fallback path). This determines the primary extraction pipeline.
2. Define extraction pipeline selection logic in `.github/skills/ocr-pic/scripts/ocr-pic.py`: prefer embedded-image extraction when available; otherwise rasterize page and segment 3x3 counter regions by expected geometry (~200x100 per counter, left-to-right fill). *depends on 1*
3. Implement counter region preprocessing for OCR reliability: upscale, grayscale, conditional invert, side-colour strip handling, border padding, and optional right-half emphasis so OCR ignores decorative left colour stripe text noise. *depends on 2*
4. Implement counter classification and parsing rules: detect NAVY vs MARINE from left strip colour, then parse into 10 logical lines per template with line-specific regex and conservative correction rules for known OCR confusions (`0/O/U`, `1/I/l`, `7/U`). *depends on 3*
5. Implement fixed grid mapping output model: map detected counters to `R1C1..R3C3` in left-to-right, top-to-bottom order; skip empty slots entirely per requirement; include normalized 10-line block plus optional raw OCR snapshot for auditability. *depends on 4*
6. Implement dual-page execution behavior and outputs: run the same process for page 37 and next page (38), writing:
- `0101/0101/src/public_html/PDFs/A Cronor - Mark Ferguson - page37.txt`
- `0101/0101/src/public_html/PDFs/A Cronor - Mark Ferguson - page38.txt`
*depends on 5*
7. Update script CLI ergonomics for repeatability: keep page-specific mode and add optional consecutive-page mode (`--start-page 37 --count 2`) so this request is reproducible without manual reruns. *parallel with 4-5 once extraction contract is stable*
8. Verification phase: validate both output files against template constraints and spot-check uncertain OCR tokens against source page images; ensure no page text-layer extraction is used.

**Relevant files**
- `/home/me/Notebooks/.github/skills/ocr-pic/scripts/ocr-pic.py` — primary implementation file; extend extraction, classification, normalization, and two-page output flow.
- `/home/me/Notebooks/.github/skills/ocr-pic/SKILL.md` — update usage examples/flags only if script interface changes materially.
- `/home/me/Notebooks/0101/0101/src/public_html/PDFs/A Cronor - Mark Ferguson.pdf` — input source for validation runs (page 37, 38).
- `/home/me/Notebooks/0101/0101/src/public_html/PDFs/A Cronor - Mark Ferguson - page37.txt` — target output for page 37.
- `/home/me/Notebooks/0101/0101/src/public_html/PDFs/A Cronor - Mark Ferguson - page38.txt` — target output for page 38.

**Verification**
1. Run script for page 37 and page 38 and confirm outputs are created at the exact requested paths.
2. Confirm each emitted counter block maps to fixed grid positions and that empty positions are absent.
3. Validate each block against NAVY/MARINE line schema (line count + line-specific regex checks).
4. Confirm parser/correction does not alter fields that fail confidence heuristics (conservative mode).
5. Manually inspect at least one NAVY and one MARINE counter image crop against output text to verify colour classification and value normalization.
6. Confirm implementation path never calls PDF page text extraction APIs (`extract_text`) for this workflow.

**Decisions**
- Next-page output is explicitly page 38 txt output.
- Empty counters are skipped.
- Output is fixed to grid positions (`R1C1..R3C3`) instead of detected-only list.
- Conservative template-driven OCR post-corrections are enabled.
- Scope includes overwriting `.github/skills/ocr-pic/scripts/ocr-pic.py`; scope excludes notebook changes and non-OCR skill updates.

**Further Considerations**
1. If embedded-image extraction is incomplete on either page, default to raster segmentation automatically (recommended) rather than requiring a manual mode switch.
2. Keep optional raw OCR lines in output comments or debug mode to simplify manual review when confidence is low.
3. If colour detection is unstable due to antialiasing/compression, classify NAVY/MARINE using HSV thresholds over median left-strip colour with tolerance bands.