import requests
import csv
from io import StringIO
import sys

def get_sector_url(sector_name):
    from urllib.parse import quote
    base = "https://travellermap.com/api/sec?sector="
    url = f"{base}{quote(sector_name)}&type=TabDelimited"
    return url

def list_and_count_bases_by_allegiance(sec_data):
    reader = csv.DictReader(StringIO(sec_data), delimiter='\t')
    allegiances = {}
    for row in reader:
        bases = row.get("Bases", "")
        allegiance = row.get("Allegiance", "Unknown")
        name = row.get("Name", "?")
        hexloc = row.get("Hex", "?")
        if any(code in bases for code in MILITARY_CODES):
            if allegiance not in allegiances:
                allegiances[allegiance] = []
            allegiances[allegiance].append({
                "name": name,
                "hex": hexloc,
                "bases": bases
            })
    return allegiances

# Military base codes (Traveller conventions)
MILITARY_CODES = set("NSMWKBFDA")  # Add/remove codes as needed

def fetch_sector_data(url):
    import requests
    resp = requests.get(url)
    resp.raise_for_status()
    return resp.text

def main():
    import sys
    if len(sys.argv) > 1:
        sector = " ".join(sys.argv[1:])
    else:
        sector = input("Enter sector name (e.g., Spinward Marches): ").strip()
    url = get_sector_url(sector)
    print(f"Fetching data for sector: {sector}\n")
    sec_data = fetch_sector_data(url)
    allegiances = list_and_count_bases_by_allegiance(sec_data)
    print("Military Bases by Allegiance:\n")
    for allegiance, worlds in sorted(
            allegiances.items(), key=lambda x: (-len(x[1]), x[0])):
        print(f"Allegiance: {allegiance} — {len(worlds)} worlds")
        for w in worlds:
            print(f"  {w['hex']} {w['name']} (Bases: {w['bases']})")
        print()
    total = sum(len(worlds) for worlds in allegiances.values())
    print(f"Total worlds with at least one military base: {total}")

if __name__ == "__main__":
    main()
