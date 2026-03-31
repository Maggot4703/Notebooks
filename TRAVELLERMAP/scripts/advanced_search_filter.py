#!/usr/bin/env python3
"""
advanced_search_filter.py

Advanced search/filter for Traveller sector/world data, supporting UWP-order field queries.

Usage:
    python3 advanced_search_filter.py <sector_file> [--allegiance=...] [--base=...] [--starport=...] [--size=...] [--atmosphere=...] [--hydro=...] [--population=...] [--gov=...] [--law=...] [--tech=...]

Examples:
    python3 advanced_search_filter.py Vland.sec --allegiance=Zh --starport=A --tech=9
    python3 advanced_search_filter.py sector.sec --base=N --population=8

Supports:
- Filtering by any UWP field (Starport, Size, Atmosphere, Hydro, Population, Gov, Law, Tech)
- Filtering by Allegiance, Base type
- Multiple filters can be combined
- Outputs matching worlds in UWP order (sector, hex, name, UWP, bases, remarks, zone, PBG, allegiance, stellar)

Sector file must be in standard Traveller tab-delimited format.
"""

import argparse
import sys
import os
sys.path.insert(0, os.path.join(os.path.dirname(__file__), 'utils'))
from sector_utils import load_sector_data, SECTOR_HEADERS

UWP_FIELDS = [
    ("starport", 0),
    ("size", 1),
    ("atmosphere", 2),
    ("hydro", 3),
    ("population", 4),
    ("gov", 5),
    ("law", 6),
    ("tech", 7),
]


def parse_args():
    parser = argparse.ArgumentParser(description="Advanced search/filter for Traveller sector/world data.")
    parser.add_argument("sector_file", help="Path to sector file (.sec or tab-delimited)")
    for field, _ in UWP_FIELDS:
        parser.add_argument(f"--{field}", help=f"Filter by {field.capitalize()} (UWP)")
    parser.add_argument("--allegiance", help="Filter by Allegiance code")
    parser.add_argument("--base", help="Filter by Base type (e.g., N, S, A, etc.)")
    parser.add_argument("--name", help="Filter by world name (case-insensitive substring)")
    return parser.parse_args()


def matches_filters(row, args):
    # UWP is usually in column 4 (0-based index 3)
    uwp = row[3] if len(row) > 3 else ""
    for field, idx in UWP_FIELDS:
        val = getattr(args, field)
        if val:
            if len(uwp) > idx:
                if uwp[idx].upper() != val.upper():
                    return False
            else:
                return False
    if args.allegiance and (len(row) < 9 or args.allegiance.upper() not in row[8].upper()):
        return False
    if args.base and (len(row) < 5 or args.base.upper() not in row[4].upper()):
        return False
    if args.name and (args.name.lower() not in row[2].lower()):
        return False
    return True



def main():
    """
    Main entry point for advanced search/filter for Traveller sector/world data.
    """
    args = parse_args()
    try:
        rows = load_sector_data(args.sector_file)
    except Exception as e:
        print(f"Error: {e}", file=sys.stderr)
        sys.exit(1)
    for row in rows:
        if matches_filters(row, args):
            # Output in UWP order: sector, hex, name, UWP, bases, remarks, zone, PBG, allegiance, stellar
            print("\t".join(row[:10]))

if __name__ == "__main__":
    main()
