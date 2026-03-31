#!/usr/bin/env python3
"""
export_image.py

Export Traveller sector/world data to PNG image (table snapshot).

Usage:
    python3 export_image.py <sector_file> [--output <output_file.png>]

- Outputs all worlds in a PNG table image (max 100 rows for readability).
- Requires: pandas, matplotlib (pip install pandas matplotlib)
"""

import argparse
import pandas as pd
import matplotlib.pyplot as plt
from sector_utils import load_sector_data, SECTOR_HEADERS


def parse_args():
    parser = argparse.ArgumentParser(description="Export sector/world data to PNG image table.")
    parser.add_argument("sector_file", help="Path to sector file (.sec or tab-delimited)")
    parser.add_argument("--output", help="Output PNG file", default="output.png")
    return parser.parse_args()



def main():
    """
    Main entry point for exporting sector/world data to PNG image table.
    """
    args = parse_args()
    try:
        rows = load_sector_data(args.sector_file)
    except Exception as e:
        print(f"Error: {e}")
        return
    df = pd.DataFrame([row[:11] for row in rows], columns=SECTOR_HEADERS)
    df = df.head(100)  # Limit for readability
    ax = plt.subplots(figsize=(20, min(2+0.3*len(df), 30)))
    ax.axis('off')
    table = ax.table(cellText=df.values, colLabels=df.columns, loc='center', cellLoc='left')
    table.auto_set_font_size(False)
    table.set_fontsize(8)
    table.scale(1, 1.5)
    plt.tight_layout()
    plt.savefig(args.output, bbox_inches='tight')
    print(f"Image exported to {args.output}")

if __name__ == "__main__":
    main()
