#!/usr/bin/env python3
"""
orchestrate_batch_ocr.py — Automated orchestration for batch-ocr-counters skill.

- Scans a source directory for PDFs (recursively or flat)
- Runs the batch_ocr_counters.py skill on each subdirectory or batch
- Logs results and errors
- Can be scheduled or run unattended

Usage:
    python orchestrate_batch_ocr.py /path/to/input_dir /path/to/output_dir
"""

import logging
import os
import subprocess
import sys
from pathlib import Path

BATCH_OCR_SCRIPT = "/home/me/Notebooks/skills/batch-ocr-counters/batch_ocr_counters.py"
LOG_FILE = "orchestrate_batch_ocr.log"

logging.basicConfig(
    filename=LOG_FILE,
    level=logging.INFO,
    format="%(asctime)s %(levelname)s %(message)s",
)


def run_batch_ocr(input_dir, output_dir):
    cmd = [
        sys.executable,
        BATCH_OCR_SCRIPT,
        "--input-dir",
        str(input_dir),
        "--output-dir",
        str(output_dir),
    ]
    logging.info(f"Running: {' '.join(cmd)}")
    result = subprocess.run(cmd, capture_output=True, text=True)
    logging.info(result.stdout)
    if result.returncode != 0:
        logging.error(result.stderr)
    return result.returncode


def main():
    if len(sys.argv) < 3:
        print("Usage: python orchestrate_batch_ocr.py <input_dir> <output_dir>")
        sys.exit(1)
    input_dir = Path(sys.argv[1])
    output_dir = Path(sys.argv[2])
    if not input_dir.exists():
        logging.error(f"Input directory {input_dir} does not exist.")
        sys.exit(1)
    output_dir.mkdir(parents=True, exist_ok=True)

    # Process all PDFs in the current directory (batch)
    pdfs_in_dir = [
        entry.path
        for entry in os.scandir(input_dir)
        if entry.is_file() and entry.name.lower().endswith(".pdf")
    ]
    if pdfs_in_dir:
        cmd = [
            sys.executable,
            BATCH_OCR_SCRIPT,
            "--input-dir",
            str(input_dir),
            "--output-dir",
            str(output_dir),
        ]
        logging.info(f"Running: {' '.join(cmd)}")
        try:
            subprocess.run(cmd, check=True)
        except subprocess.CalledProcessError as e:
            logging.error(f"Error processing PDFs in {input_dir}: {e}")

    # Then process all subdirectories
    for entry in os.scandir(input_dir):
        if entry.is_dir():
            sub_input_dir = entry.path
            sub_output_dir = os.path.join(output_dir, entry.name)
            os.makedirs(sub_output_dir, exist_ok=True)
            logging.info(f"Processing {sub_input_dir} -> {sub_output_dir}")
            rc = run_batch_ocr(sub_input_dir, sub_output_dir)
            if rc == 0:
                logging.info(f"Completed {sub_input_dir}")
            else:
                logging.error(f"Failed {sub_input_dir} with code {rc}")
                logging.info(f"Processing {sub_input_dir} -> {sub_output_dir}")
                rc = run_batch_ocr(sub_input_dir, sub_output_dir)
                if rc == 0:
                    logging.info(f"Completed {sub_input_dir}")
                else:
                    logging.error(f"Failed {sub_input_dir} with code {rc}")


if __name__ == "__main__":
    main()
