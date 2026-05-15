# Advanced Traveller Map API Usage Examples
# Requirements: requests, pandas

import requests
import pandas as pd
from io import StringIO

# --- CONFIG ---
sector = "Spinward Marches"
base_url = "https://travellermap.com/api"

# --- 1. Get Allegiances for a Sector ---
meta_url = f"{base_url}/metadata?sector={sector.replace(' ', '%20')}"
meta = requests.get(meta_url).json()
allegiances = meta.get("Allegiances", [])
print("Allegiances in sector:")
for a in allegiances:
    print(f"{a['Code']}: {a['Name']}")

# --- 2. Get World List and Filter by Allegiance ---
worlds_url = f"{base_url}/sec?sector={sector.replace(' ', '%20')}&type=TabDelimited"
worlds_text = requests.get(worlds_url).text
worlds_df = pd.read_csv(StringIO(worlds_text), sep="\t", comment="#")

# Example: Filter for Imperial worlds (Allegiance code 'Im')
imperial_worlds = worlds_df[worlds_df["Alg"] == "Im"]
print(f"\nImperial worlds in {sector}: {len(imperial_worlds)}")
print(imperial_worlds[["Name", "Hex", "UWP", "Remarks"]].head())

# --- 3. Get Map Image for a Sector ---
map_url = f"https://travellermap.com/api/jumpmap.png?sector={sector.replace(' ', '%20')}&scale=64"
img_resp = requests.get(map_url)
with open("spinward_marches_map.png", "wb") as f:
    f.write(img_resp.content)
print("\nSector map image saved as spinward_marches_map.png")


# --- 4. Get World Details by Hex Location ---
def get_world_details(sector, hex_code):
    url = f"{base_url}/world?sector={sector.replace(' ', '%20')}&hex={hex_code}"
    resp = requests.get(url)
    return resp.json()


# Example: Get details for world at hex 1910
world_1910 = get_world_details(sector, "1910")
print("\nDetails for world at hex 1910:")
print(world_1910)

# --- 5. List All Sectors (API Discovery) ---
sectors_url = f"{base_url}/sectors"
sectors = requests.get(sectors_url).json()
print(f"\nTotal sectors available: {len(sectors)}")
print("First 5 sectors:", sectors[:5])
