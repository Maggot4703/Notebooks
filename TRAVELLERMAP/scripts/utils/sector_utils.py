#!/usr/bin/env python3
"""
sector_utils.py

Shared utilities for Traveller sector/world data loading and headers.
"""
import csv

SECTOR_HEADERS = [
    "Sector", "SS", "Hex", "Name", "UWP", "Bases", "Remarks", "Zone", "PBG", "Allegiance", "Stars"
]

def load_sector_data(filepath):
    """
    Load sector/world data from a tab-delimited file, skipping comments and blank lines.
    Returns a list of rows (each row is a list of strings).
    """
    rows = []
    try:
        with open(filepath, newline='', encoding='utf-8') as f:
            reader = csv.reader(f, delimiter='\t')
            for row in reader:
                if row and not row[0].startswith('#'):
                    rows.append(row)
    except Exception as e:
        raise RuntimeError(f"Error loading sector file '{filepath}': {e}")
    return rows
