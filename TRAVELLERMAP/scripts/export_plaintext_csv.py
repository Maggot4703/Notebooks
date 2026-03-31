#!/usr/bin/env python3
"""
export_plaintext_csv.py

Export Traveller sector/world data to plain text or CSV for accessibility.

Usage:
    python3 export_plaintext_csv.py <sector_file> --format [text|csv] [--output <output_file>]

- Outputs all worlds in a readable plain text table or CSV format.
- Designed for screen readers and easy import into spreadsheets.
"""

import argparse
import sys
from sector_utils import load_sector_data, SECTOR_HEADERS


def parse_args():
    parser = argparse.ArgumentParser(description="Export sector/world data to plain text or CSV.")
    parser.add_argument("sector_file", help="Path to sector file (.sec or tab-delimited)")
    parser.add_argument("--format", choices=["text", "csv"], default="text", help="Export format")
    parser.add_argument("--output", help="Output file (default: stdout)")
    return parser.parse_args()



def main():
    """
    Main entry point for exporting sector/world data to plain text or CSV.
    """
    args = parse_args()
    try:
        rows = load_sector_data(args.sector_file)
    except Exception as e:
        print(f"Error: {e}", file=sys.stderr)
        sys.exit(1)
    if args.format == "csv":
        import csv
        out = open(args.output, 'w', newline='', encoding='utf-8') if args.output else sys.stdout
        writer = csv.writer(out)
        writer.writerow(SECTOR_HEADERS)
        for row in rows:
            writer.writerow(row[:11])
        if out is not sys.stdout:
            out.close()
    else:
        lines = ["\t".join(SECTOR_HEADERS)]
        for row in rows:
            lines.append("\t".join(row[:11]))
        output = "\n".join(lines)
        if args.output:
            with open(args.output, 'w', encoding='utf-8') as out:
                out.write(output)
        else:
            print(output)

if __name__ == "__main__":
    main()
