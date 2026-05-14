#!/usr/bin/env bash

set -euo pipefail

usage() {
	cat <<'EOF'
Usage:
  openwebui-host.sh [me@home|me@p48]

Defaults:
  me@home -> /home/me/Notebooks/CREW/Crew/Crew.py
  me@p48  -> /home/me/Notebooks/0101/0101/src/public_html/server.py

Also install a shared Pi-safe model with:
  ollama pull llama3.2:1b
EOF
}

host="${1:-${HOSTNAME:-}}"
host="${host%%.*}"

if [[ -z "$host" || "$host" == "--help" || "$host" == "-h" ]]; then
	usage
	exit 0
fi

case "$host" in
	me@home|home)
		cd /home/me/Notebooks/CREW/Crew
		exec uv run python Crew.py
		;;
	me@p48|p48)
		cd /home/me/Notebooks/0101/0101/src/public_html
		exec uv run python server.py
		;;
	*)
		echo "Unknown host profile: $host" >&2
		usage >&2
		exit 1
		;;
esac
