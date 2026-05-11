#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)"
INSTALL_ROOT="$SCRIPT_DIR"
VENV_PYTHON="$INSTALL_ROOT/.venv/bin/python"
PAYLOAD_ROOT="$INSTALL_ROOT/payload"
CREW_ROOT="$PAYLOAD_ROOT/CREW/Crew"
CARDCUTTER_ROOT="$PAYLOAD_ROOT/CARDCUTTER/CardCutter"

if [[ ! -x "$VENV_PYTHON" ]]; then
  echo "Crew is not installed yet in this folder."
  echo "Run: $INSTALL_ROOT/install.sh"
  exit 1
fi

if [[ ! -d "$CREW_ROOT" ]]; then
  echo "Missing Crew payload at: $CREW_ROOT"
  exit 1
fi

mkdir -p \
  "$CARDCUTTER_ROOT/gimp" \
  "$CARDCUTTER_ROOT/Cars1_rectangles" \
  "$CREW_ROOT/Reading Now" \
  "$CREW_ROOT/output"

export CREW_INPUT_DIR="$CARDCUTTER_ROOT/gimp"
export CREW_OUTPUT_DIR="$CARDCUTTER_ROOT"
export PYTHONPATH="$CREW_ROOT${PYTHONPATH:+:$PYTHONPATH}"

cd "$CREW_ROOT"
exec "$VENV_PYTHON" run_gui.py "$@"
