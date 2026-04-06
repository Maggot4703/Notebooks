#!/usr/bin/env bash
set -e
cd "$(dirname "$0")"
uv sync --quiet
uv run python CardCutter/card_cutter.py "$@"
