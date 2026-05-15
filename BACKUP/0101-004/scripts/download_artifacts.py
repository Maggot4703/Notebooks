#!/usr/bin/env python3
"""
Download GitHub Actions artifacts for a workflow run.

Usage:
  export GITHUB_TOKEN=ghp_...
  python scripts/download_artifacts.py --owner OWNER --repo REPO --run-id RUN_ID --artifact-name e2e-artifacts --out-dir tmp

The script finds the artifact by name, downloads the artifact zip, and extracts it into --out-dir.
"""

import argparse
import os
import sys
import requests
import zipfile
import io

API_BASE = "https://api.github.com"


def main():
    p = argparse.ArgumentParser()
    p.add_argument("--owner", required=True)
    p.add_argument("--repo", required=True)
    p.add_argument("--run-id", required=True)
    p.add_argument("--artifact-name", required=True)
    p.add_argument("--out-dir", default="artifacts")
    p.add_argument("--token", default=os.environ.get("GITHUB_TOKEN"))
    args = p.parse_args()

    if not args.token:
        print(
            "GITHUB_TOKEN must be set via --token or the GITHUB_TOKEN env var",
            file=sys.stderr,
        )
        sys.exit(2)

    headers = {
        "Authorization": f"token {args.token}",
        "Accept": "application/vnd.github.v3+json",
    }

    url = f"{API_BASE}/repos/{args.owner}/{args.repo}/actions/runs/{args.run_id}/artifacts"
    r = requests.get(url, headers=headers)
    if r.status_code != 200:
        print("Failed to list artifacts:", r.status_code, r.text, file=sys.stderr)
        sys.exit(3)

    data = r.json()
    artifacts = data.get("artifacts", [])
    target = None
    for a in artifacts:
        if a.get("name") == args.artifact_name:
            target = a
            break

    if not target:
        print(f"Artifact named '{args.artifact_name}' not found. Available:")
        for a in artifacts:
            print(" -", a.get("name"), "(id=", a.get("id"), ")")
        sys.exit(4)

    artifact_id = target["id"]
    dl_url = (
        f"{API_BASE}/repos/{args.owner}/{args.repo}/actions/artifacts/{artifact_id}/zip"
    )
    print(f"Downloading artifact id={artifact_id}...")
    rr = requests.get(dl_url, headers=headers, stream=True)
    if rr.status_code not in (200, 302):
        print("Failed to download artifact:", rr.status_code, rr.text, file=sys.stderr)
        sys.exit(5)

    # The API will return a redirect to an S3 URL; requests will follow it and deliver the zip bytes
    bytes_io = io.BytesIO(rr.content)

    out_dir = os.path.abspath(args.out_dir)
    os.makedirs(out_dir, exist_ok=True)

    try:
        with zipfile.ZipFile(bytes_io) as z:
            z.extractall(path=out_dir)
    except zipfile.BadZipFile:
        # sometimes the API returns a 302 with a redirect; requests should have followed it
        print("Downloaded content is not a zip file", file=sys.stderr)
        sys.exit(6)

    print(f"Artifact extracted to: {out_dir}")


if __name__ == "__main__":
    main()
