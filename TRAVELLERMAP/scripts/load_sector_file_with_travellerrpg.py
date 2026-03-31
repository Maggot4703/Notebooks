#!/usr/bin/env python3
"""
load_sector_file_with_travellerrpg.py
Prototype: Load a Traveller sector file from a local path, URL, or travellerrpg.com sector download, validate, and print summary.
"""
import pandas as pd
import requests
import sys
import os

def fetch_travellerrpg_sector(sector_name):
    # Example: https://travellerrpg.com/data/sector/Vland.tab
    url = f"https://travellerrpg.com/data/sector/{sector_name}.tab"
    resp = requests.get(url, timeout=10)
    resp.raise_for_status()
    lines = resp.text.splitlines()
    return lines

def load_sector_file(path_or_url_or_sector):
    if path_or_url_or_sector.lower().endswith('.tab'):
        # Local file or URL
        if path_or_url_or_sector.startswith("http://") or path_or_url_or_sector.startswith("https://"):
            resp = requests.get(path_or_url_or_sector, timeout=10)
            resp.raise_for_status()
            lines = resp.text.splitlines()
        else:
            if not os.path.isfile(path_or_url_or_sector):
                raise FileNotFoundError(f"File not found: {path_or_url_or_sector}")
            with open(path_or_url_or_sector, "r", encoding="utf-8") as f:
                lines = f.read().splitlines()
    else:
        # Assume sector name for travellerrpg.com
        lines = fetch_travellerrpg_sector(path_or_url_or_sector)
    if not lines:
        raise ValueError("File is empty or could not be loaded")
    header = lines[0].split("\t")
    data = [line.split("\t") for line in lines[1:] if line.strip()]
    df = pd.DataFrame(data, columns=header)
    # Validate required columns
    required = {"Hex", "Name", "UWP"}
    missing = required - set(df.columns)
    if missing:
        raise ValueError(f"Missing required columns: {', '.join(missing)}")
    print(f"Loaded {len(df)} worlds from {path_or_url_or_sector}")
    print(f"Columns: {', '.join(df.columns)}")
    print(df.head(5))
    return df

def main():
    if len(sys.argv) < 2:
        print("Usage: load_sector_file_with_travellerrpg.py <path|url|sector_name>")
        print("  - path: local .tab file")
        print("  - url:  http(s)://... .tab file")
        print("  - sector_name: downloads from travellerrpg.com (e.g., Vland)")
        sys.exit(1)
    arg = sys.argv[1]
    try:
        load_sector_file(arg)
    except Exception as e:
        print(f"Error: {e}")

if __name__ == "__main__":
    main()
