#!/usr/bin/env python3
"""
generate_world_data.py
One-time generator: fetches Spinward Marches world data from TravellerMap API
and writes:
  - TXT/worlds-by-subsector.json   (world list keyed by subsector label)
  - TXT/{subsector}/{hex} {name}/{hex} {name}/ stub folders (13 empty files each)
  - JPG/placeholder.jpg            (200x100 grey image)
  - JPG/{hex}-{type}.jpg           (copies of placeholder for each B-P world)
"""

import json
import os
import shutil
import sys
from pathlib import Path
from urllib.parse import quote
from urllib.request import urlopen, Request

# ---------------------------------------------------------------------------
# Constants
# ---------------------------------------------------------------------------

BASE_DIR = Path(__file__).parent
JPG_DIR = BASE_DIR / "JPG"
TXT_DIR = BASE_DIR / "TXT"
JSON_PATH = TXT_DIR / "worlds-by-subsector.json"
PLACEHOLDER = JPG_DIR / "placeholder.jpg"

SECTOR = "Spinward Marches"

# Subsector letters A-P mapped to their canonical names (matches <option> text in 0101.html)
SUBSECTORS = {
    "A": "A Cronor",
    "B": "B Jewell",
    "C": "C Regina",
    "D": "D Aramis",
    "E": "E Querion",
    "F": "F Vilis",
    "G": "G Lanth",
    "H": "H Rhylanor",
    "I": "I Darrian",
    "J": "J Sword Worlds",
    "K": "K Lunion",
    "L": "L Mora",
    "M": "M Five Sisters",
    "N": "N District 268",
    "O": "O Glisten",
    "P": "P Trin's Veil",
}

JPG_SUFFIXES = [
    "Maps",
    "SDBs",
    "Squadrons",
    "Troops",
    "Defences",
    "Population",
    "Belts",
    "Gas Giants",
    "Mainworld",
    "Worlds",
]

TXT_STUBS = [
    "jta4All.txt",
    "jta4Bases.txt",
    "jta4Dest.txt",
    "jta4HTML.txt",
    "jta4Info.txt",
    "jta4Line.txt",
    "jta4Near.txt",
    "jta4Orb.txt",
    "jta4Sec.txt",
    "jta4Str.txt",
    "jta4Sub.txt",
    "jta4Sys.txt",
    "jta4UWP.txt",
]


# ---------------------------------------------------------------------------
# Step 1: Fetch worlds from TravellerMap API
# ---------------------------------------------------------------------------

def fetch_worlds(letter: str) -> list[dict]:
    """Fetch worlds for one subsector letter. Returns list of {hex, name}."""
    url = (
        f"https://travellermap.com/api/sec"
        f"?sector={quote(SECTOR)}&subsector={letter}&type=TabDelimited"
    )
    req = Request(url, headers={"User-Agent": "0101-generator/1.0"})
    try:
        with urlopen(req, timeout=30) as resp:
            text = resp.read().decode("utf-8")
    except Exception as exc:
        print(f"  ERROR fetching subsector {letter}: {exc}", file=sys.stderr)
        return []

    worlds = []
    for line in text.splitlines():
        line = line.strip()
        if not line or line.startswith("#"):
            continue
        parts = line.split("\t")
        # TabDelimited layout: Sector, SS, Hex, Name, UWP, ...
        if len(parts) < 4:
            continue
        hex_code = parts[2].strip()
        name = parts[3].strip()
        # Skip header row
        if hex_code == "Hex" or not hex_code.isdigit():
            continue
        worlds.append({"hex": hex_code, "name": name})
    return worlds


# ---------------------------------------------------------------------------
# Step 2: Create placeholder.jpg
# ---------------------------------------------------------------------------

def create_placeholder():
    """Create a 200x100 grey placeholder JPEG."""
    try:
        from PIL import Image
        img = Image.new("RGB", (200, 100), (128, 128, 128))
        img.save(str(PLACEHOLDER), "JPEG")
        print(f"  Created {PLACEHOLDER.relative_to(BASE_DIR)}")
    except ImportError:
        # Pillow not available — create a minimal valid JPEG by hand (greyscale)
        _write_minimal_grey_jpeg(PLACEHOLDER)
        print(f"  Created {PLACEHOLDER.relative_to(BASE_DIR)} (minimal JPEG, no Pillow)")


def _write_minimal_grey_jpeg(path: Path):
    """Write a minimal valid 1x1 grey JPEG when Pillow is unavailable."""
    # Minimal 1x1 grey JPEG bytes (standard huffman tables)
    jpeg_bytes = bytes([
        0xFF,0xD8,0xFF,0xE0,0x00,0x10,0x4A,0x46,0x49,0x46,0x00,0x01,
        0x01,0x00,0x00,0x01,0x00,0x01,0x00,0x00,0xFF,0xDB,0x00,0x43,
        0x00,0x08,0x06,0x06,0x07,0x06,0x05,0x08,0x07,0x07,0x07,0x09,
        0x09,0x08,0x0A,0x0C,0x14,0x0D,0x0C,0x0B,0x0B,0x0C,0x19,0x12,
        0x13,0x0F,0x14,0x1D,0x1A,0x1F,0x1E,0x1D,0x1A,0x1C,0x1C,0x20,
        0x24,0x2E,0x27,0x20,0x22,0x2C,0x23,0x1C,0x1C,0x28,0x37,0x29,
        0x2C,0x30,0x31,0x34,0x34,0x34,0x1F,0x27,0x39,0x3D,0x38,0x32,
        0x3C,0x2E,0x33,0x34,0x32,0xFF,0xC0,0x00,0x0B,0x08,0x00,0x01,
        0x00,0x01,0x01,0x01,0x11,0x00,0xFF,0xC4,0x00,0x1F,0x00,0x00,
        0x01,0x05,0x01,0x01,0x01,0x01,0x01,0x01,0x00,0x00,0x00,0x00,
        0x00,0x00,0x00,0x00,0x01,0x02,0x03,0x04,0x05,0x06,0x07,0x08,
        0x09,0x0A,0x0B,0xFF,0xC4,0x00,0xB5,0x10,0x00,0x02,0x01,0x03,
        0x03,0x02,0x04,0x03,0x05,0x05,0x04,0x04,0x00,0x00,0x01,0x7D,
        0x01,0x02,0x03,0x00,0x04,0x11,0x05,0x12,0x21,0x31,0x41,0x06,
        0x13,0x51,0x61,0x07,0x22,0x71,0x14,0x32,0x81,0x91,0xA1,0x08,
        0x23,0x42,0xB1,0xC1,0x15,0x52,0xD1,0xF0,0x24,0x33,0x62,0x72,
        0x82,0x09,0x0A,0x16,0x17,0x18,0x19,0x1A,0x25,0x26,0x27,0x28,
        0x29,0x2A,0x34,0x35,0x36,0x37,0x38,0x39,0x3A,0x43,0x44,0x45,
        0x46,0x47,0x48,0x49,0x4A,0x53,0x54,0x55,0x56,0x57,0x58,0x59,
        0x5A,0x63,0x64,0x65,0x66,0x67,0x68,0x69,0x6A,0x73,0x74,0x75,
        0x76,0x77,0x78,0x79,0x7A,0x83,0x84,0x85,0x86,0x87,0x88,0x89,
        0x8A,0x93,0x94,0x95,0x96,0x97,0x98,0x99,0x9A,0xA2,0xA3,0xA4,
        0xA5,0xA6,0xA7,0xA8,0xA9,0xAA,0xB2,0xB3,0xB4,0xB5,0xB6,0xB7,
        0xB8,0xB9,0xBA,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,
        0xD2,0xD3,0xD4,0xD5,0xD6,0xD7,0xD8,0xD9,0xDA,0xE1,0xE2,0xE3,
        0xE4,0xE5,0xE6,0xE7,0xE8,0xE9,0xEA,0xF1,0xF2,0xF3,0xF4,0xF5,
        0xF6,0xF7,0xF8,0xF9,0xFA,0xFF,0xDA,0x00,0x08,0x01,0x01,0x00,
        0x00,0x3F,0x00,0xFB,0xD4,0xFF,0xD9,
    ])
    path.write_bytes(jpeg_bytes)


# ---------------------------------------------------------------------------
# Step 3: Create stub TXT folders
# ---------------------------------------------------------------------------

def create_txt_stubs(subsector_label: str, worlds: list[dict]):
    """Create stub folder + 13 empty files for each world."""
    for world in worlds:
        folder = TXT_DIR / subsector_label / f"{world['hex']} {world['name']}" / f"{world['hex']} {world['name']}"
        folder.mkdir(parents=True, exist_ok=True)
        for stub in TXT_STUBS:
            stub_path = folder / stub
            if not stub_path.exists():
                stub_path.touch()


# ---------------------------------------------------------------------------
# Step 4: Copy placeholder JPGs for each world
# ---------------------------------------------------------------------------

def create_world_jpgs(hex_code: str):
    """Copy placeholder.jpg to all 10 JPG slots for a world hex."""
    for suffix in JPG_SUFFIXES:
        dest = JPG_DIR / f"{hex_code}-{suffix}.jpg"
        if not dest.exists():
            shutil.copy2(str(PLACEHOLDER), str(dest))


# ---------------------------------------------------------------------------
# Main
# ---------------------------------------------------------------------------

def main():
    print("=== generate_world_data.py ===")
    print(f"Base dir: {BASE_DIR}")

    # --- Create placeholder ---
    print("\n[1] Creating placeholder.jpg ...")
    if not PLACEHOLDER.exists():
        create_placeholder()
    else:
        print(f"  Already exists: {PLACEHOLDER.relative_to(BASE_DIR)}")

    # --- Fetch all subsectors ---
    print("\n[2] Fetching worlds from TravellerMap API ...")
    worlds_by_subsector = {}
    for letter, label in SUBSECTORS.items():
        print(f"  {label} ({letter}) ...", end=" ", flush=True)
        worlds = fetch_worlds(letter)
        worlds_by_subsector[label] = worlds
        print(f"{len(worlds)} worlds")

    # --- Write JSON ---
    print(f"\n[3] Writing {JSON_PATH.relative_to(BASE_DIR)} ...")
    TXT_DIR.mkdir(exist_ok=True)
    with open(JSON_PATH, "w", encoding="utf-8") as fh:
        json.dump(worlds_by_subsector, fh, indent=2, ensure_ascii=False)
    total = sum(len(v) for v in worlds_by_subsector.values())
    print(f"  {len(worlds_by_subsector)} subsectors, {total} total worlds")

    # --- Create stubs + JPGs for B-P only (A Cronor already has real data) ---
    print("\n[4] Creating TXT stubs and placeholder JPGs for subsectors B-P ...")
    for letter, label in SUBSECTORS.items():
        if letter == "A":
            print(f"  Skipping {label} (real data exists)")
            continue
        worlds = worlds_by_subsector[label]
        print(f"  {label}: {len(worlds)} worlds ...", end=" ", flush=True)
        create_txt_stubs(label, worlds)
        for world in worlds:
            create_world_jpgs(world["hex"])
        print("done")

    print("\n=== Done ===")


if __name__ == "__main__":
    main()
