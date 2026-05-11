#!/usr/bin/env bash
set -euo pipefail

TARGET_DIR="${1:-$HOME/.local/opt/crew-linux}"
DESKTOP_FILE="$HOME/.local/share/applications/crew.desktop"

if [[ -d "$TARGET_DIR" ]]; then
  rm -rf "$TARGET_DIR"
fi

if [[ -f "$DESKTOP_FILE" ]]; then
  rm -f "$DESKTOP_FILE"
fi

echo "Removed Crew install at: $TARGET_DIR"
