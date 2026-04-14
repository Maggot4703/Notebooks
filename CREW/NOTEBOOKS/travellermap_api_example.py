# Traveller Map API Integration Example
# Requirements: requests (install with pip if needed)

import requests
import pandas as pd

# Example 1: Fetch sector metadata (JSON)
sector = "Spinward Marches"
metadata_url = f"https://travellermap.com/api/metadata?sector={sector.replace(' ', '%20')}"
metadata_resp = requests.get(metadata_url)
metadata = metadata_resp.json()
print("Sector Metadata Example:")
print(metadata)

# Example 2: Fetch world list (TabDelimited)
worlds_url = f"https://travellermap.com/api/sec?sector={sector.replace(' ', '%20')}&type=TabDelimited"
worlds_resp = requests.get(worlds_url)
worlds_text = worlds_resp.text

# Parse tab-delimited world list into DataFrame
from io import StringIO
worlds_df = pd.read_csv(StringIO(worlds_text), sep='\t', comment='#')
print("\nWorld List DataFrame:")
print(worlds_df.head())

# Example 3: Get all subsectors from metadata
subsectors = metadata.get('Subsectors', [])
print("\nSubsectors:")
for s in subsectors:
    print(s)

# Example 4: Save world list to CSV
worlds_df.to_csv("spinward_marches_worlds.csv", index=False)
print("\nSaved world list to spinward_marches_worlds.csv")
