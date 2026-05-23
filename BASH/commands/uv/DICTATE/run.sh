#!/usr/bin/env bash
# run.sh — install deps and launch DICTATE

set -e
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  ◉  DICTATE launcher"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

# ── System dependency check (PortAudio) ──────────────────────────────────────
if ! dpkg -s portaudio19-dev &>/dev/null 2>&1; then
    echo "► Installing PortAudio system library…"
    sudo apt-get install -y portaudio19-dev python3-pyaudio 2>/dev/null || true
fi

# ── Python packages ───────────────────────────────────────────────────────────
echo "► Checking Python packages…"
pip install -q -r "$SCRIPT_DIR/requirements.txt"

# ── Launch ────────────────────────────────────────────────────────────────────
echo "► Launching DICTATE…"
python3 "$SCRIPT_DIR/dictate.py"
