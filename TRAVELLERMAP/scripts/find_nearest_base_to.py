# Find the nearest military base to a world in any sector

import requests
import sys
import os
import json

# All possible Traveller base codes (from count_military_bases.py)
CODES = set(
    "NSMWKBFDA"
)  # N: Navy, S: Scout, M: Marine, W: Way Station, K: Corsair, B: Base, F: Fleet, D: Depot, A: Army


def hex_distance(a, b):
    dx = b[0] - a[0]
    dy = b[1] - a[1]
    return max(abs(dx), abs(dy), abs(dx + dy))


def parse_hex(hexstr):
    return (int(hexstr[:2]), int(hexstr[2:]))



def get_sector_data(sector):
    url = f'https://travellermap.com/api/sec?sector={sector}&type=TabDelimited'
    try:
        resp = requests.get(url)
        resp.raise_for_status()
        return resp.text.splitlines()
    except requests.RequestException as e:
        print(f"[ERROR] Failed to load sector data: {e}")
        sys.exit(2)

# Base type codes (move outside of function)
BASE_TYPE_CODES = {
    'N': 'Naval Base',
    'S': 'Scout Base',
    'M': 'Marine Base',
    'W': 'Way Station',
    'K': 'Corsair Base',
    'B': 'Base (generic)',
    'F': 'Fleet Base',
    'D': 'Depot',
    'A': 'Army Base',
}



# Dynamically determine column indices from header
def get_column_indices(header_line):
    fields = header_line.strip().split('\t')
    colmap = {name.strip().lower(): idx for idx, name in enumerate(fields)}
    return colmap

def find_world(lines, world_name, colmap):
    for line in lines:
        if line.startswith('#') or not line.strip():
            continue
        fields = line.split('\t')
        name_idx = colmap.get('name')
        if name_idx is not None and len(fields) > name_idx:
            name = fields[name_idx].strip().lower()
            if name == world_name.strip().lower():
                return fields
    return None



def find_bases(lines, base_types, colmap):
    bases = []
    hex_idx = colmap.get('hex')
    name_idx = colmap.get('name')
    uwp_idx = colmap.get('uwp')
    bases_idx = colmap.get('bases')
    for line in lines:
        if line.startswith('#') or not line.strip():
            continue
        fields = line.split('\t')
        if None in (hex_idx, name_idx, uwp_idx, bases_idx):
            continue
        if len(fields) <= max(hex_idx, name_idx, uwp_idx, bases_idx):
            continue
        hexloc = fields[hex_idx]
        # Skip header or invalid lines (hexloc should be 4 digits)
        if len(hexloc) != 4 or not hexloc.isdigit():
            continue
        name = fields[name_idx]
        uwp = fields[uwp_idx]
        bases_field = fields[bases_idx].lower()
        if any(b in bases_field for b in base_types):
            bases.append({
                'name': name,
                'hex': parse_hex(hexloc),
                'uwp': uwp,
                'bases': bases_field
            })
    return bases

def main():


    if len(sys.argv) < 3:
        print(
            "Usage: python3 find_nearest_base_kesali.py <world> <sector> [base_types] [--json]"
        )
        print("  <world>: World name (e.g., Kesali)")
        print("  <sector>: Sector name (e.g., Vland, Spinward Marches)")
        print(
            "  [base_types]: Optional string of base type letters to include "
            "(e.g., N, S, A, NS, NSA). Default: NSA"
        )
        print("  [--json]: Output result as JSON")
        print(
            "Example: python3 find_nearest_base_kesali.py Kesali Vland N --json"
        )
        sys.exit(1)

    # Parse args
    args = sys.argv[1:]
    world = args[0].strip().lower()
    sector = args[1].strip().lower()
    base_types = None
    output_json = False

    for arg in args[2:]:
        if arg.startswith('--json'):
            output_json = True
        elif not base_types:
            base_types = arg.lower()

    # Prompt user to select base type if not provided
    if not base_types:
        print("Select a base type to search for (or press Enter for ANY):")
        for code, desc in BASE_TYPE_CODES.items():
            print(f"  {code}: {desc}")
        user_input = input("Enter base type code (e.g., N, S, A, or leave blank for ANY): ").strip().lower()
        if user_input:
            # Validate input
            valid = all(c.upper() in BASE_TYPE_CODES for c in user_input)
            if not valid:
                print(f"Invalid base type code(s): {user_input}. Using ANY base type.")
                base_types = "".join(c.lower() for c in CODES)
            else:
                base_types = user_input
        else:
            base_types = "".join(c.lower() for c in CODES)

    print(f"[DEBUG] Current working directory: {os.getcwd()}")
    print(f"[DEBUG] Script absolute path: {os.path.abspath(__file__)}")

    lines = get_sector_data(sector.title())
    if not lines:
        print(f"No data returned for sector '{sector}'.")
        sys.exit(1)
    header_line = lines[0]
    colmap = get_column_indices(header_line)
    data_lines = lines[1:]
    world_fields = find_world(data_lines, world, colmap)
    print(f"[DEBUG] world_fields: {world_fields}")
    if not world_fields:
        print(f"World '{world}' not found in sector '{sector}'.")
        # Print all world names for debugging
        print("[DEBUG] Worlds found in sector:")
        name_idx = colmap.get('name')
        for line in data_lines:
            if line.startswith('#') or not line.strip():
                continue
            fields = line.split('\t')
            if name_idx is not None and len(fields) > name_idx:
                print(f"  - {fields[name_idx]}")
        sys.exit(1)
    hex_idx = colmap.get('hex')
    uwp_idx = colmap.get('uwp')
    world_hex = parse_hex(world_fields[hex_idx])
    world_uwp = world_fields[uwp_idx]
    print(
        f"Target world: {world} (hex {world_fields[hex_idx]}, UWP {world_uwp}) in sector {sector}"
    )
    bases = find_bases(data_lines, base_types, colmap)
    if not bases:
        print(f"No bases of type [{base_types}] found in sector {sector}.")
        sys.exit(1)

    min_dist = 100
    nearest = None
    for base in bases:
        dist = hex_distance(world_hex, base['hex'])
        if dist < min_dist:
            min_dist = dist
            nearest = base
    if nearest:
        if output_json:
            print(json.dumps({
                "target_world": {
                    "name": world,
                    "hex": world_fields[2],
                    "uwp": world_uwp
                },
                "nearest_base": {
                    "name": nearest['name'],
                    "hex": f"{nearest['hex'][0]:02d}{nearest['hex'][1]:02d}",
                    "uwp": nearest['uwp'],
                    "bases": nearest['bases'],
                    "distance": min_dist
                }
            }, indent=2))
        else:
            print(
                f"Nearest base to {world} ({world_fields[0]}) of type [{base_types}]:"
            )
            print(f"  World: {nearest['name']}")
            print(f"  Hex: {nearest['hex'][0]:02d}{nearest['hex'][1]:02d}")
            print(f"  UWP: {nearest['uwp']}")
            print(f"  Bases: {nearest['bases']}")
            print(f"  Distance: {min_dist} parsecs")
    else:
        print(f"No base of type [{base_types}] found in sector {sector}.")


def run_tests():
    # Basic tests for parse_hex, find_world, find_bases
    print("Running tests...")
    assert parse_hex("1234") == (12, 34)
    # Fake lines for world and base tests
    lines = [
        "1234\tA\tIx\tTestWorld\tA123456-7\tNS\tRemarks",
        "5678\tB\tIx\tOtherWorld\tB654321-8\tK\tRemarks"
    ]
    wf = find_world(lines, "TestWorld")
    assert wf[3] == "TestWorld"
    bases = find_bases(lines, "N")
    assert bases[0]['name'] == "TestWorld"
    assert "N" in bases[0]['bases']
    print("All tests passed.")



if __name__ == "__main__":
    main()
