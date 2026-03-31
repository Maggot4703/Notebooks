#!/usr/bin/env python3
"""
check_travellermap_api_version.py
Checks the current version of the Traveller Map API and prints it.
"""
import requests

def get_api_version():
    url = "https://travellermap.com/api/info"
    try:
        resp = requests.get(url, timeout=10)
        resp.raise_for_status()
        data = resp.json()
        print(f"Traveller Map API version: {data.get('version', 'unknown')}")
    except Exception as e:
        print(f"Error fetching API version: {e}")

if __name__ == "__main__":
    get_api_version()
