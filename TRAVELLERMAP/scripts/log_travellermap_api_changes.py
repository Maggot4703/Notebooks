#!/usr/bin/env python3
"""
log_travellermap_api_changes.py
Logs detected changes in API version or schema to a local file for tracking.
"""
import datetime

def log_change(message, logfile="travellermap_api_changes.log"):
    timestamp = datetime.datetime.now().isoformat()
    with open(logfile, "a") as f:
        f.write(f"[{timestamp}] {message}\n")
    print(f"Logged: {message}")

if __name__ == "__main__":
    # Example usage
    log_change("API version changed to 1.2.3")
    log_change("Sector schema updated: added 'Allegiance' column")
