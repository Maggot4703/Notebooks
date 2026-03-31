#!/usr/bin/env python3
"""
watch_travellermap_github.py
Watches the Traveller Map GitHub repo for new releases or commits.
"""
import requests

def check_github_releases(repo="inexorabletash/travellermap"):
    url = f"https://api.github.com/repos/{repo}/releases/latest"
    try:
        resp = requests.get(url, timeout=10)
        resp.raise_for_status()
        data = resp.json()
        print(f"Latest release for {repo}: {data.get('tag_name', 'unknown')} ({data.get('name', '')})")
        print(f"Published at: {data.get('published_at', 'unknown')}")
    except Exception as e:
        print(f"Error fetching releases: {e}")

def check_github_commits(repo="inexorabletash/travellermap"):
    url = f"https://api.github.com/repos/{repo}/commits"
    try:
        resp = requests.get(url, timeout=10)
        resp.raise_for_status()
        data = resp.json()
        if data:
            latest = data[0]
            print(f"Latest commit: {latest['sha'][:7]} by {latest['commit']['author']['name']} on {latest['commit']['author']['date']}")
            print(f"Message: {latest['commit']['message']}")
        else:
            print("No commits found.")
    except Exception as e:
        print(f"Error fetching commits: {e}")

if __name__ == "__main__":
    check_github_releases()
    check_github_commits()
