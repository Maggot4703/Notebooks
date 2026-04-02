#!/usr/bin/env bash
# toascii.sh — Render a phrase as ASCII art and save to file
# Usage: bash toascii.sh "YOUR PHRASE HERE"
#        bash toascii.sh "YOUR PHRASE HERE" /path/to/output.txt

set -euo pipefail

PHRASE="${1:-Hello World}"
OUTPUT_FILE="${2:-/home/me/Notebooks/ascii-art.txt}"

if command -v figlet &>/dev/null; then
    OUTPUT=$(figlet -- "$PHRASE")
elif command -v toilet &>/dev/null; then
    OUTPUT=$(toilet -- "$PHRASE")
elif command -v python3 &>/dev/null && python3 -c "import pyfiglet" &>/dev/null 2>&1; then
    OUTPUT=$(python3 -c "import pyfiglet, sys; print(pyfiglet.figlet_format(sys.argv[1]))" "$PHRASE")
else
    echo "Error: No ASCII art renderer found. Install figlet, toilet, or pyfiglet." >&2
    exit 1
fi

echo "$OUTPUT"
echo "$OUTPUT" >> "$OUTPUT_FILE"
echo "[Saved to $OUTPUT_FILE]"
