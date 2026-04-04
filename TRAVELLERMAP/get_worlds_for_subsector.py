"""
Get the list of worlds for a given sector and subsector from TravellerMap API.

Outputs a JSON array of {hex, name} objects matching the worldsCache format
used by 0101/0101/src/public_html/0101.html.

Usage:
    python3 get_worlds_for_subsector.py <sector> <subsector> [--json] [--save <path>]

    <sector>    Sector name, e.g. "Spinward Marches"
    <subsector> Subsector letter (A–P) OR subsector name, e.g. "Vilis" or "F"
    --json      Print JSON array to stdout (default when no --save specified)
    --save      Write JSON array to the given file path

Examples:
    python3 get_worlds_for_subsector.py "Spinward Marches" A --json
    python3 get_worlds_for_subsector.py "Spinward Marches" Vilis --json
    python3 get_worlds_for_subsector.py "Vland" B --save /tmp/vland-b.json
"""

import argparse
import json
import sys
import requests


# ── Metadata ────────────────────────────────────────────────────────────────

def get_subsector_letter(sector, subsector_arg):
    """
    Return the single letter (A–P) for a subsector in the given sector.

    If subsector_arg is already a single letter A–P, return it directly.
    Otherwise call the TravellerMap metadata API to resolve the name.
    """
    arg = subsector_arg.strip()
    if len(arg) == 1 and arg.upper() in "ABCDEFGHIJKLMNOP":
        return arg.upper()

    url = "https://travellermap.com/api/metadata"
    try:
        resp = requests.get(url, params={"sector": sector}, timeout=10)
        resp.raise_for_status()
    except requests.RequestException as e:
        print(f"[ERROR] Failed to fetch metadata for sector '{sector}': {e}", file=sys.stderr)
        sys.exit(2)

    data = resp.json()
    subsectors = data.get("Subsectors", [])
    arg_lower = arg.lower()
    for s in subsectors:
        if s.get("Name", "").lower() == arg_lower:
            return s.get("Index", "").upper()

    print(
        f"[ERROR] Subsector '{subsector_arg}' not found in sector '{sector}'.",
        file=sys.stderr,
    )
    print(
        "[INFO] Available subsectors: "
        + ", ".join(f"{s.get('Index')} {s.get('Name')}" for s in subsectors),
        file=sys.stderr,
    )
    sys.exit(1)


# ── Sector data ──────────────────────────────────────────────────────────────

def fetch_tab_delimited(sector, subsector_letter):
    """
    Fetch tab-delimited world data for one subsector from TravellerMap API.
    Returns lines as a list of str.
    """
    url = "https://travellermap.com/api/sec"
    params = {
        "sector": sector,
        "subsector": subsector_letter,
        "type": "TabDelimited",
    }
    try:
        resp = requests.get(url, params=params, timeout=15)
        resp.raise_for_status()
    except requests.RequestException as e:
        print(f"[ERROR] Failed to fetch world data: {e}", file=sys.stderr)
        sys.exit(2)
    return resp.text.splitlines()


def get_column_indices(header_line):
    """Return a dict mapping lowercase column name → zero-based index."""
    fields = header_line.strip().split("\t")
    return {name.strip().lower(): idx for idx, name in enumerate(fields)}


def parse_worlds(lines):
    """
    Parse tab-delimited world data lines into [{hex, name}, ...].
    Skips the header row and comment/blank lines.
    Returns a list of dicts sorted by hex code.
    """
    if not lines:
        return []

    header = lines[0]
    colmap = get_column_indices(header)
    hex_idx = colmap.get("hex")
    name_idx = colmap.get("name")

    if hex_idx is None or name_idx is None:
        print(
            f"[ERROR] Could not find 'Hex' and/or 'Name' columns in response header: {header!r}",
            file=sys.stderr,
        )
        sys.exit(1)

    worlds = []
    for line in lines[1:]:
        line = line.strip()
        if not line or line.startswith("#"):
            continue
        fields = line.split("\t")
        if len(fields) <= max(hex_idx, name_idx):
            continue
        hex_val = fields[hex_idx].strip()
        # Skip malformed rows (hex should be exactly 4 digits)
        if len(hex_val) != 4 or not hex_val.isdigit():
            continue
        name_val = fields[name_idx].strip()
        worlds.append({"hex": hex_val, "name": name_val})

    worlds.sort(key=lambda w: w["hex"])
    return worlds


# ── Entry point ──────────────────────────────────────────────────────────────

def main():
    parser = argparse.ArgumentParser(
        description="Fetch worlds for a sector/subsector from TravellerMap API."
    )
    parser.add_argument("sector", help='Sector name, e.g. "Spinward Marches"')
    parser.add_argument(
        "subsector",
        help="Subsector letter (A–P) or subsector name, e.g. Vilis or F",
    )
    parser.add_argument(
        "--json",
        dest="output_json",
        action="store_true",
        default=True,
        help="Print JSON array to stdout (default)",
    )
    parser.add_argument(
        "--save",
        dest="save_path",
        metavar="PATH",
        default=None,
        help="Write JSON array to this file path instead of stdout",
    )
    args = parser.parse_args()

    letter = get_subsector_letter(args.sector, args.subsector)
    lines = fetch_tab_delimited(args.sector, letter)
    worlds = parse_worlds(lines)

    if not worlds:
        print(
            f"[WARN] No worlds found for subsector '{args.subsector}' in '{args.sector}'.",
            file=sys.stderr,
        )

    output = json.dumps(worlds, indent=2)

    if args.save_path:
        with open(args.save_path, "w", encoding="utf-8") as fh:
            fh.write(output)
            fh.write("\n")
        print(
            f"[OK] Wrote {len(worlds)} worlds to {args.save_path}",
            file=sys.stderr,
        )
    else:
        print(output)


if __name__ == "__main__":
    main()
