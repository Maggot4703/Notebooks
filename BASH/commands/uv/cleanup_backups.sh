#!/usr/bin/env bash
set -euo pipefail

# cleanup_backups.sh
# Move old backup archives from CREW/BACKUP and BACKUP into BACKUP/old
# and optionally delete very old files. Default is a dry-run.

usage(){
  cat <<EOF
Usage: $(basename "$0") [--days N] [--delete-days M] [--run] [--help]

Options:
  --days N         Move files older than N days (default: 30)
  --delete-days M  Delete files in BACKUP/old older than M days (default: 90)
  --run            Actually perform moves/deletes (omit for dry-run)
  --help           Show this help

By default the script runs in dry-run mode and only prints actions.
EOF
}

DAYS=30
DELETE_DAYS=90
DRY_RUN=1

while [[ $# -gt 0 ]]; do
  case "$1" in
    --days) DAYS="$2"; shift 2;;
    --delete-days) DELETE_DAYS="$2"; shift 2;;
    --run) DRY_RUN=0; shift;;
    --help) usage; exit 0;;
    *) echo "Unknown arg: $1"; usage; exit 2;;
  esac
done

BASE_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$BASE_DIR"

TARGETS=("CREW/BACKUP" "BACKUP")
ARCHIVE_DIR="BACKUP/old"
mkdir -p "$ARCHIVE_DIR"

for d in "${TARGETS[@]}"; do
  if [ -d "$d" ]; then
    if [ "$DRY_RUN" -eq 1 ]; then
      echo "DRY RUN: files in $d older than $DAYS days that would be moved to $ARCHIVE_DIR:"
      find "$d" -maxdepth 1 -type f -mtime +$DAYS -print || true
    else
      echo "Moving files from $d older than $DAYS days to $ARCHIVE_DIR"
      find "$d" -maxdepth 1 -type f -mtime +$DAYS -exec mv -v {} "$ARCHIVE_DIR/" \; || true
    fi
  else
    echo "Directory not found: $d"
  fi
done

if [ "$DRY_RUN" -eq 1 ]; then
  echo "DRY RUN: would delete files in $ARCHIVE_DIR older than $DELETE_DAYS days"
  find "$ARCHIVE_DIR" -type f -mtime +$DELETE_DAYS -print || true
else
  echo "Deleting files in $ARCHIVE_DIR older than $DELETE_DAYS days"
  find "$ARCHIVE_DIR" -type f -mtime +$DELETE_DAYS -print -exec rm -v {} \; || true
fi

echo "Done. Use --run to perform actions (current mode: $( [ "$DRY_RUN" -eq 0 ] && echo 'run' || echo 'dry-run'))"