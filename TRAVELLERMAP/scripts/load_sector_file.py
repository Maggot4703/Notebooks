#!/usr/bin/env python3
"""
load_sector_file.py
Prototype: Load a Traveller sector file from a local path or URL, validate, and print summary.
"""
import pandas as pd
import requests
import sys
import os

def load_sector_file(path_or_url):
    if path_or_url.startswith("http://") or path_or_url.startswith("https://"):
        resp = requests.get(path_or_url, timeout=10)
        resp.raise_for_status()
        lines = resp.text.splitlines()
    else:
        if not os.path.isfile(path_or_url):
            raise FileNotFoundError(f"File not found: {path_or_url}")
        with open(path_or_url, "r", encoding="utf-8") as f:
            lines = f.read().splitlines()
    if not lines:
        raise ValueError("File is empty")
    header = lines[0].split("\t")
    data = [line.split("\t") for line in lines[1:] if line.strip()]
    df = pd.DataFrame(data, columns=header)
    # Validate required columns
    required = {"Hex", "Name", "UWP"}
    missing = required - set(df.columns)
    if missing:
        raise ValueError(f"Missing required columns: {', '.join(missing)}")
    print(f"Loaded {len(df)} worlds from {path_or_url}")
    print(f"Columns: {', '.join(df.columns)}")
    print(df.head(5))
    return df

def main():
    if len(sys.argv) < 2:
        print("Usage: load_sector_file.py <path_or_url>")
        sys.exit(1)
    path_or_url = sys.argv[1]
    try:
        load_sector_file(path_or_url)
    except Exception as e:
        print(f"Error: {e}")

if __name__ == "__main__":
    main()
