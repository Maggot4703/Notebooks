#!/usr/bin/env bash
# Interactive transfer script: audit -> dry-run -> execute -> verify
# Usage: ./transfer_0101_workflow.sh [src] [dest]
# src default: me@p48:/home/me/Desktop/0101/
# dest default: /home/me/Notebooks/0101/
set -euo pipefail
IFS=$'\n\t'

SRC_DEFAULT="me@p48:/home/me/Desktop/0101/"
DEST_DEFAULT="/home/me/Notebooks/0101/"
SRC=${1:-$SRC_DEFAULT}
DEST=${2:-$DEST_DEFAULT}

RSYNC_EXCLUDES=(".git" "__pycache__/" "*.pyc" ".venv/" "venv/" ".ipynb_checkpoints/" "0101_extracted/" "*.sqlite3" "*.db")
RSYNC_OPTS=("-avzP" "--delete")
for e in "${RSYNC_EXCLUDES[@]}"; do
  RSYNC_OPTS+=("--exclude=$e")
done

function prompt_yes() {
  local msg="$1"
  read -r -p "$msg [y/N]: " ans
  case "$ans" in
    [Yy]|[Yy][Ee][Ss]) return 0 ;;
    *) return 1 ;;
  esac
}

function parse_remote() {
  # input: user@host:/path or host:/path
  local uri="$1"
  if [[ "$uri" != *":"* ]]; then
    echo "ERROR: source must be in host:/path or user@host:/path format" >&2
    return 1
  fi
  local host_part="${uri%%:*}"
  local path_part="${uri#*:}"
  echo "$host_part" "$path_part"
}

echo "Source: $SRC"
echo "Destination: $DEST"

if prompt_yes "Proceed with audit checks for source and target?"; then
  # parse source
  read -r SRC_HOST SRC_PATH < <(parse_remote "$SRC") || exit 1
  echo "Checking source disk usage (remote): $SRC_HOST:$SRC_PATH"
  ssh "$SRC_HOST" "du -sh '$SRC_PATH' 2>/dev/null || echo 'du failed'"
  if prompt_yes "List largest files on source (may be slow)?"; then
    echo "Gathering top files (remote)..."
    ssh "$SRC_HOST" "find '$SRC_PATH' -type f -printf '%s %p\\n' 2>/dev/null | sort -nr | head -n 50" > /tmp/0101_source_topfiles.txt || true
    echo "Wrote /tmp/0101_source_topfiles.txt (first 50 largest files)."
    head -n 20 /tmp/0101_source_topfiles.txt || true
  fi
  echo "Checking target disk (local):"
  df -h "$(dirname "$DEST")" || df -h . || true
else
  echo "Audit skipped by user."
fi

if prompt_yes "Run rsync --dry-run from source -> dest now?"; then
  echo "Running dry-run rsync..."
  rsync "${RSYNC_OPTS[@]}" --dry-run "$SRC" "$DEST" | tee /tmp/0101_rsync_dryrun.txt
  echo "Dry-run saved to /tmp/0101_rsync_dryrun.txt"
  echo "Review output above."
else
  echo "Dry-run skipped."
fi

if prompt_yes "Execute real rsync copy now (this will transfer files)?"; then
  echo "Starting rsync copy..."
  rsync "${RSYNC_OPTS[@]}" "$SRC" "$DEST"
  echo "Rsync finished."
else
  echo "Copy not executed."
fi

if prompt_yes "Perform basic verification (sha256 checks of top files)?"; then
  if [ -f /tmp/0101_source_topfiles.txt ]; then
    echo "Computing checksums for top 5 files listed (remote and local)."
    # extract file paths (strip size prefix)
    awk '{sub(/^[0-9]+ /,"\"); print}' /tmp/0101_source_topfiles.txt | head -n 5 > /tmp/0101_top_paths.txt || true
    echo "Top paths (first 5):"
    cat /tmp/0101_top_paths.txt

    # remote sha256
    read -r SRC_HOST SRC_PATH < <(parse_remote "$SRC") || exit 1
    echo "Computing remote sha256s..."
    # build remote command safely
    REMOTE_CMD=""
    while IFS= read -r f; do
      # escape single quotes in path
      esc="$(printf "%s" "$f" | sed "s/'/'\\''/g")"
      REMOTE_CMD+="sha256sum '$esc' ; ";
    done < /tmp/0101_top_paths.txt
    ssh "$SRC_HOST" "cd / && $REMOTE_CMD" > /tmp/0101_remote_sha256.txt || true

    # local sha256 (on dest)
    echo "Computing local sha256s at destination..."
    > /tmp/0101_local_sha256.txt
    while IFS= read -r f; do
      # translate source absolute path to dest path by replacing source base with dest base
      # only works if source paths start with SRC_PATH
      if [[ "$f" == "$SRC_PATH"* ]]; then
        rel="${f#$SRC_PATH}"
        localf="$DEST$rel"
        if [ -f "$localf" ]; then
          sha256sum "$localf" >> /tmp/0101_local_sha256.txt || echo "sha256 failed for $localf" >> /tmp/0101_local_sha256.txt
        else
          echo "MISSING $localf" >> /tmp/0101_local_sha256.txt
        fi
      else
        echo "SKIP (path mismatch): $f" >> /tmp/0101_local_sha256.txt
      fi
    done < /tmp/0101_top_paths.txt

    echo "Remote sha256s:"
    cat /tmp/0101_remote_sha256.txt || true
    echo "Local sha256s:"
    cat /tmp/0101_local_sha256.txt || true
    echo "You should compare and confirm matches."
  else
    echo "No /tmp/0101_source_topfiles.txt found — cannot run checksum verification."
  fi
else
  echo "Verification skipped."
fi

echo "Done. Review /tmp/0101_rsync_dryrun.txt, /tmp/0101_source_topfiles.txt, /tmp/0101_remote_sha256.txt, /tmp/0101_local_sha256.txt as needed."
