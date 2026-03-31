#!/usr/bin/env python3
"""
export_spreadsheet.py

Export Traveller sector/world data to Excel spreadsheet (XLSX).

Usage:
    python3 export_spreadsheet.py <sector_file> [--output <output_file.xlsx>]

- Outputs all worlds in an Excel spreadsheet.
- Requires: pandas, openpyxl (pip install pandas openpyxl)
"""

import argparse
import pandas as pd
from sector_utils import load_sector_data, SECTOR_HEADERS


def parse_args():
    parser = argparse.ArgumentParser(description="Export sector/world data to Excel spreadsheet.")
    parser.add_argument("sector_file", help="Path to sector file (.sec or tab-delimited)")
    parser.add_argument("--output", help="Output XLSX file", default="output.xlsx")
    return parser.parse_args()



def main():
    """
    Main entry point for exporting sector/world data to Excel spreadsheet.
    """
    args = parse_args()
    try:
        rows = load_sector_data(args.sector_file)
    except Exception as e:
        print(f"Error: {e}")
        return
    df = pd.DataFrame([row[:11] for row in rows], columns=SECTOR_HEADERS)
    df.to_excel(args.output, index=False)
    print(f"Spreadsheet exported to {args.output}")

if __name__ == "__main__":
    main()
