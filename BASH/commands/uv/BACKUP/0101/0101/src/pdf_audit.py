"""
PDF audit script for 0101 workspace.

Scans a PDFs directory, records filename, filesize, page count, and whether pages contain extractable text
(or likely scanned images). Outputs audit_report.json and audit_report.csv under the WEB_ROOT/0101_extracted/ folder
by default.

Usage:
  python pdf_audit.py --path <pdf_dir> --output <jsonfile> --csv <csvfile>

If --path is omitted, tries the following candidates (in order):
 - /home/me/Desktop/0101/0101/src/public_html/PDFs/SM
 - ../src/public_html/PDFs/SM  (relative to this script)

This script prefers PyMuPDF (fitz) or pdfplumber for text extraction, and falls back to PyPDF2.
"""

from __future__ import annotations

import argparse
import csv
import json
import sys
import time
from pathlib import Path

# Optional libraries
try:
    import fitz  # PyMuPDF
except Exception:
    fitz = None
try:
    import pdfplumber
except Exception:
    pdfplumber = None
try:
    from PyPDF2 import PdfReader
except Exception:
    PdfReader = None


DEFAULT_DESKTOP_PATH = "/home/me/Desktop/0101/0101/src/public_html/PDFs/SM"

HERE = Path(__file__).resolve().parent
WEB_ROOT = HERE / "public_html"
DEFAULT_REPO_PDFS = WEB_ROOT / "PDFs" / "SM"
DEFAULT_OUTPUT_DIR = WEB_ROOT / "0101_extracted"


def detect_page_count_and_text(path: Path, max_pages_check: int = 2) -> tuple[int, str]:
    """Return (page_count, sample_text) where sample_text is text extracted from up to max_pages_check pages."""
    text = ""
    page_count = 0
    # Try PyMuPDF first
    if fitz is not None:
        try:
            doc = fitz.open(str(path))
            page_count = doc.page_count
            for i in range(min(page_count, max_pages_check)):
                try:
                    page = doc.load_page(i)
                    text += page.get_text("text") or ""
                except Exception:
                    continue
            doc.close()
            return page_count, text
        except Exception:
            pass
    # Try pdfplumber
    if pdfplumber is not None:
        try:
            with pdfplumber.open(str(path)) as p:
                page_count = len(p.pages)
                for i in range(min(page_count, max_pages_check)):
                    try:
                        text += p.pages[i].extract_text() or ""
                    except Exception:
                        continue
            return page_count, text
        except Exception:
            pass
    # Fallback to PyPDF2
    if PdfReader is not None:
        try:
            with open(path, "rb") as fh:
                reader = PdfReader(fh)
                page_count = len(reader.pages)
                for i in range(min(page_count, max_pages_check)):
                    try:
                        p = reader.pages[i]
                        t = p.extract_text() or ""
                        text += t
                    except Exception:
                        continue
            return page_count, text
        except Exception:
            pass
    # Last resort: unknown
    return 0, ""


def is_searchable(sample_text: str, threshold: int = 50) -> bool:
    return len(sample_text.strip()) >= threshold


def scan_dir(pdf_dir: Path) -> list[dict]:
    items = []
    for p in sorted(pdf_dir.glob("*.pdf")):
        try:
            stat = p.stat()
            size = stat.st_size
        except Exception:
            size = None
        page_count, sample_text = detect_page_count_and_text(p)
        type_hint = "unknown"
        if page_count == 0:
            type_hint = "invalid-or-unreadable"
        else:
            type_hint = (
                "searchable" if is_searchable(sample_text) else "scanned-or-image"
            )
        items.append(
            {
                "path": str(p),
                "name": p.name,
                "size_bytes": size,
                "page_count": page_count,
                "type_hint": type_hint,
                "sample_text": (
                    sample_text[:500].replace("\n", " ") if sample_text else ""
                ),
                "scanned_check_timestamp": int(time.time()),
            }
        )
    return items


def write_outputs(items: list[dict], json_out: Path, csv_out: Path | None):
    json_out.parent.mkdir(parents=True, exist_ok=True)
    with open(json_out, "w", encoding="utf-8") as fh:
        json.dump(
            {"scanned_at": int(time.time()), "files": items},
            fh,
            indent=2,
            ensure_ascii=False,
        )
    if csv_out:
        csv_out.parent.mkdir(parents=True, exist_ok=True)
        with open(csv_out, "w", encoding="utf-8", newline="") as fh:
            writer = csv.writer(fh)
            writer.writerow(
                ["name", "path", "size_bytes", "page_count", "type_hint", "sample_text"]
            )
            for it in items:
                writer.writerow(
                    [
                        it.get("name"),
                        it.get("path"),
                        it.get("size_bytes"),
                        it.get("page_count"),
                        it.get("type_hint"),
                        (it.get("sample_text") or "")[:200],
                    ]
                )


def find_candidate_dir(cli_path: str | None) -> Path | None:
    if cli_path:
        p = Path(cli_path).expanduser()
        if p.exists():
            return p
    # Check desktop path (user-supplied location)
    p = Path(DEFAULT_DESKTOP_PATH)
    if p.exists():
        return p
    # Check repo path
    p = DEFAULT_REPO_PDFS
    if p.exists():
        return p
    # As a last resort, search common locations under repo
    alt = HERE / "public_html" / "PDFs" / "SM"
    if alt.exists():
        return alt
    return None


def main(argv=None):
    parser = argparse.ArgumentParser(description="Audit PDFs for 0101 Book Browser")
    parser.add_argument("--path", help="Path to PDFs directory", default=None)
    parser.add_argument(
        "--output",
        help="JSON output path (default: WEB_ROOT/0101_extracted/audit_report.json)",
        default=None,
    )
    parser.add_argument("--csv", help="CSV output path (optional)", default=None)
    args = parser.parse_args(argv)

    pdf_dir = find_candidate_dir(args.path)
    if pdf_dir is None:
        print(
            "No PDF directory found. Tried defaults. Provide --path to the PDFs folder.",
            file=sys.stderr,
        )
        sys.exit(2)

    print(f"Scanning PDFs in: {pdf_dir}")

    items = scan_dir(pdf_dir)

    # default outputs
    out_json = (
        Path(args.output) if args.output else DEFAULT_OUTPUT_DIR / "audit_report.json"
    )
    out_csv = Path(args.csv) if args.csv else DEFAULT_OUTPUT_DIR / "audit_report.csv"

    write_outputs(items, out_json, out_csv)

    print(f"Wrote JSON: {out_json}")
    print(f"Wrote CSV: {out_csv}")
    print(f"Found {len(items)} PDF(s)")


if __name__ == "__main__":
    main()
