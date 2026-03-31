#!/usr/bin/env python3
"""
export_pdf.py

Export Traveller sector/world data to PDF table.

Usage:
    python3 export_pdf.py <sector_file> [--output <output_file.pdf>]

- Outputs all worlds in a formatted PDF table.
- Requires: reportlab (pip install reportlab)
"""

import argparse
from reportlab.lib.pagesizes import letter, landscape
from reportlab.platypus import SimpleDocTemplate, Table, TableStyle
from reportlab.lib import colors
from sector_utils import load_sector_data, SECTOR_HEADERS


def parse_args():
    parser = argparse.ArgumentParser(description="Export sector/world data to PDF table.")
    parser.add_argument("sector_file", help="Path to sector file (.sec or tab-delimited)")
    parser.add_argument("--output", help="Output PDF file", default="output.pdf")
    return parser.parse_args()



def main():
    """
    Main entry point for exporting sector/world data to PDF table.
    """
    args = parse_args()
    try:
        rows = load_sector_data(args.sector_file)
    except Exception as e:
        print(f"Error: {e}")
        return
    data = [SECTOR_HEADERS] + [row[:11] for row in rows]
    doc = SimpleDocTemplate(args.output, pagesize=landscape(letter))
    table = Table(data, repeatRows=1)
    style = TableStyle([
        ('BACKGROUND', (0,0), (-1,0), colors.grey),
        ('TEXTCOLOR', (0,0), (-1,0), colors.whitesmoke),
        ('ALIGN', (0,0), (-1,-1), 'LEFT'),
        ('FONTNAME', (0,0), (-1,0), 'Helvetica-Bold'),
        ('FONTSIZE', (0,0), (-1,0), 10),
        ('BOTTOMPADDING', (0,0), (-1,0), 8),
        ('GRID', (0,0), (-1,-1), 0.5, colors.black),
    ])
    table.setStyle(style)
    doc.build([table])
    print(f"PDF exported to {args.output}")

if __name__ == "__main__":
    main()
