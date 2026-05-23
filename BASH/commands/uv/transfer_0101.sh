#!/usr/bin/env bash
# transfer_0101.sh
# Safe rsync-based transfer helper: audit -> dry-run -> execute -> verify
# Usage: ./transfer_0101.sh [src_user@src_host] [src_path] [dest_path]
# Defaults: me@p48 /home/me/Desktop/0101 /home/me/Notebooks/0101

set -euo pipefail
SRC=${1:-me@p48}
SRC_PATH=${2:-/home/me/Desktop/0101/}
DEST_PATH=${3:-/home/me/Notebooks/0101/}
EXCLUDES=(--exclude='.git' --exclude='__pycache__/' --exclude='*.pyc' --exclude='.venv/' --exclude='venv/' --exclude='.ipynb_checkpoints/' --exclude='0101_extracted/' --exclude='*.sqlite3' --exclude='*.db' --exclude='*.log')
RSYNC_OPTS=( -avzP --delete )

echo "Source: ${SRC}:${SRC_PATH}"
echo "Destination: ${DEST_PATH}"

echo "== Step 1: Quick audits =="
ssh -o BatchMode=yes -o ConnectTimeout=10 "${SRC}" "du -sh '${SRC_PATH}' 2>/dev/null || echo 'DU_FAILED'" || echo "Warning: SSH to ${SRC} failed or required password."

echo "Local free space:" 
df -h "$(dirname "${DEST_PATH%/}")" || df -h || true

read -p "Run find to list top large files on source? (y/N) " resp
if [[ "$resp" =~ ^[Yy]$ ]]; then
  echo "Listing top 10 largest files under ${SRC_PATH} (may take a while)..."
  ssh -o BatchMode=yes "${SRC}" "find '${SRC_PATH%/}' -type f -printf '%s %p\n' 2>/dev/null | sort -nr | head -n 20" || echo "Could not list remote files."
fi

DRY_CMD=( rsync "${RSYNC_OPTS[@]}" "${EXCLUDES[@]}" "${SRC}:${SRC_PATH}" "${DEST_PATH}" --dry-run )

echo "\n== Step 2: Dry-run rsync (preview changes) =="
echo "Running: ${DRY_CMD[*]}"
"${DRY_CMD[@]}"

read -p "Review the dry-run output. Proceed with actual copy? (y/N) " proceed
if [[ ! "$proceed" =~ ^[Yy]$ ]]; then
  echo "Aborting per user choice.";
  exit 0
fi

# Actual rsync
RSYNC_CMD=( rsync "${RSYNC_OPTS[@]}" "${EXCLUDES[@]}" "${SRC}:${SRC_PATH}" "${DEST_PATH}" )
echo "\n== Step 3: Executing rsync =="
echo "Running: ${RSYNC_CMD[*]}"
"${RSYNC_CMD[@]}"

# Verification: pick top 3 largest files on source and compare sha256 (best-effort)
echo "\n== Step 4: Verification (sample checksums) =="
TMPLIST=$(mktemp)
ssh -o BatchMode=yes "${SRC}" "find '${SRC_PATH%/}' -type f -printf '%s %p\n' 2>/dev/null | sort -nr | head -n 5" | awk '{print $2}' > "$TMPLIST" || true
if [[ -s "$TMPLIST" ]]; then
  echo "Comparing up to 3 largest files..."
  i=0
  while IFS= read -r f && [[ $i -lt 3 ]]; do
    remote_sha=$(ssh -o BatchMode=yes "${SRC}" "sha256sum '${f}' 2>/dev/null || true" | awk '{print $1}') || true
    rel=${f#${SRC_PATH%/}/}
    local_file="${DEST_PATH%/}/${rel}"
    if [[ -f "$local_file" ]] && [[ -n "$remote_sha" ]]; then
      local_sha=$(sha256sum "$local_file" | awk '{print $1}')
      echo "File: $rel"
      echo "  remote: $remote_sha"
      echo "  local : $local_sha"
      if [[ "$remote_sha" == "$local_sha" ]]; then
        echo "  -> OK"
      else
        echo "  -> MISMATCH"
      fi
    else
      echo "  Skipping checksum for $rel (missing or no sha)"
    fi
    i=$((i+1))
  done < "$TMPLIST"
else
  echo "No candidate files found for checksum verification."
fi
rm -f "$TMPLIST" || true

echo "\nDone. If you copied into a temp dir, consider renaming to the final location after inspection."

echo "If permissions need fixing, run: sudo chown -R $(id -u):$(id -g) '${DEST_PATH%/}'"
