#!/usr/bin/env bash
set -euo pipefail

SRC="/home/me/Notebooks"
DEST_DIR="/home/me/BACKUP/PROJECTS/NotebooksBackups"
DATE="$(date +%Y%m%d-%H%M%S)"
ARCHIVE="$DEST_DIR/Notebooks-$DATE.zip"
KEEP=7

mkdir -p "$DEST_DIR"

if ! command -v zip >/dev/null 2>&1; then
  echo "Error: zip is not installed. Install with: sudo apt install zip"
  exit 1
fi

if [ ! -d "$SRC" ]; then
  echo "Error: source folder not found: $SRC"
  exit 1
fi

echo "Creating backup: $ARCHIVE"
zip -r "$ARCHIVE" "$SRC" \
  -x "*/__pycache__/*" \
     "*/.ipynb_checkpoints/*" \
     "*/.venv/*" \
     "*/.git/*"

echo "Testing archive integrity..."
unzip -t "$ARCHIVE" >/dev/null

echo "Pruning old backups (keeping latest $KEEP)..."
ls -1t "$DEST_DIR"/Notebooks-*.zip 2>/dev/null | tail -n +$((KEEP + 1)) | xargs -r rm -f

echo "Backup complete: $ARCHIVE"
