#!/usr/bin/env python3
"""
plot_sector_worlds_plotly.py
Plot a Traveller sector's worlds using Plotly for interactive visualization.
"""
import requests
import plotly.express as px
import pandas as pd
import sys

def fetch_sector_tab(sector="Vland"):
    url = f"https://travellermap.com/data/{sector}.tab"
    resp = requests.get(url, timeout=10)
    resp.raise_for_status()
    lines = resp.text.splitlines()
    header = lines[0].split("\t")
    data = [line.split("\t") for line in lines[1:] if line.strip()]
    df = pd.DataFrame(data, columns=header)
    return df

def parse_hex_coords(hex_str):
    # Traveller hexes: e.g., '0101' => (1, 1)
    try:
        x = int(hex_str[:2])
        y = int(hex_str[2:])
        return x, y
    except Exception:
        return None, None

def plot_sector(df, sector_name="Vland"):
    df = df.copy()
    df["x"], df["y"] = zip(*df["Hex"].map(parse_hex_coords))
    fig = px.scatter(
        df,
        x="x",
        y="y",
        text="Name",
        hover_data=["UWP", "Remarks", "Bases"],
        title=f"Traveller Sector: {sector_name}",
        labels={"x": "Hex X", "y": "Hex Y"},
        height=700,
        width=700,
    )
    fig.update_traces(textposition="top center", marker=dict(size=10, color="blue"))
    fig.update_yaxes(autorange="reversed")
    fig.show()

def main():
    sector = sys.argv[1] if len(sys.argv) > 1 else "Vland"
    df = fetch_sector_tab(sector)
    plot_sector(df, sector)

if __name__ == "__main__":
    main()
