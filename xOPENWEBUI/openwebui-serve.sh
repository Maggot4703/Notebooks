#!/usr/bin/env bash

set -euo pipefail

workspace_root="/home/me/Notebooks/OPENWEBUI"
runtime_dir="$workspace_root/data"
database_url="sqlite:///$runtime_dir/webui.db"

mkdir -p "$runtime_dir"
cd "$workspace_root"
exec env \
	DATA_DIR="$runtime_dir" \
	DATABASE_URL="$database_url" \
	DATABASE_ENABLE_SQLITE_WAL=False \
	DATABASE_SQLITE_PRAGMA_BUSY_TIMEOUT=60000 \
	uv run open-webui serve --host 127.0.0.1 --port 8081
