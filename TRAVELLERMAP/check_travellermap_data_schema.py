#!/usr/bin/env python3
"""
check_travellermap_data_schema.py
Checks the schema/format of the Traveller Map sector data and prints key fields.
"""
import requests

def get_sector_schema(sector="Vland"):
    url = f"https://travellermap.com/data/{sector}.tab"
    try:
        resp = requests.get(url, timeout=10)
        resp.raise_for_status()
        lines = resp.text.splitlines()
        if lines:
            header = lines[0]
            print(f"Sector '{sector}' .tab header fields:")
            print(header)
        else:
            print(f"No data found for sector '{sector}'")
    except Exception as e:
        print(f"Error fetching sector data: {e}")

if __name__ == "__main__":
    get_sector_schema()
