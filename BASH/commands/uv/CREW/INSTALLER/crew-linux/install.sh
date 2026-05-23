#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)"
DEFAULT_TARGET="${HOME}/.local/opt/crew-linux"
TARGET_DIR="$DEFAULT_TARGET"
SKIP_SYSTEM_PACKAGES=0

usage() {
  cat <<EOF
Usage: $(basename "$0") [--target DIR] [--skip-system-packages]

Installs the portable Crew Linux bundle into a local folder, creates a Python
virtual environment, installs dependencies, and writes a desktop launcher.
EOF
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --target)
      TARGET_DIR="${2:?missing value for --target}"
      shift 2
      ;;
    --skip-system-packages)
      SKIP_SYSTEM_PACKAGES=1
      shift
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      echo "Unknown argument: $1" >&2
      usage >&2
      exit 1
      ;;
  esac
done

if ! command -v python3 >/dev/null 2>&1; then
  echo "python3 is required but was not found." >&2
  exit 1
fi

if [[ $SKIP_SYSTEM_PACKAGES -eq 0 ]] && command -v apt-get >/dev/null 2>&1; then
  PACKAGES="$(grep -Ev '^(#|$)' "$SCRIPT_DIR/system-packages.txt" | tr '\n' ' ')"
  if [[ -n "$PACKAGES" ]]; then
    echo "Installing system packages with apt-get..."
    sudo apt-get update
    sudo apt-get install -y $PACKAGES
  fi
fi

mkdir -p "$TARGET_DIR" "$TARGET_DIR/payload"

cp -a "$SCRIPT_DIR/payload/." "$TARGET_DIR/payload/"
cp -a \
  "$SCRIPT_DIR/requirements-lock.txt" \
  "$SCRIPT_DIR/system-packages.txt" \
  "$SCRIPT_DIR/INSTALL.md" \
  "$SCRIPT_DIR/manifest.txt" \
  "$SCRIPT_DIR/launch-crew.sh" \
  "$SCRIPT_DIR/uninstall.sh" \
  "$TARGET_DIR/"

if command -v uv >/dev/null 2>&1; then
  uv venv --seed "$TARGET_DIR/.venv"
else
  python3 -m venv "$TARGET_DIR/.venv"
fi

if [[ ! -x "$TARGET_DIR/.venv/bin/pip" ]]; then
  "$TARGET_DIR/.venv/bin/python" -m ensurepip --upgrade
fi

"$TARGET_DIR/.venv/bin/python" -m pip install --upgrade pip setuptools wheel
CORE_REQUIREMENTS="$(mktemp)"
trap 'rm -f "$CORE_REQUIREMENTS"' EXIT
grep -vi '^PyAudio==' "$TARGET_DIR/requirements-lock.txt" > "$CORE_REQUIREMENTS"
"$TARGET_DIR/.venv/bin/python" -m pip install -r "$CORE_REQUIREMENTS"
"$TARGET_DIR/.venv/bin/python" -m pip install 'PyAudio==0.2.14'

mkdir -p \
  "$TARGET_DIR/payload/CARDCUTTER/CardCutter/gimp" \
  "$TARGET_DIR/payload/CARDCUTTER/CardCutter/Cars1_rectangles" \
  "$TARGET_DIR/payload/CREW/Crew/Reading Now" \
  "$TARGET_DIR/payload/CREW/Crew/output" \
  "$HOME/.local/share/applications"

DESKTOP_FILE="$HOME/.local/share/applications/crew.desktop"
sed \
  -e "s|__EXEC__|$TARGET_DIR/launch-crew.sh|g" \
  -e "s|__ICON__|$TARGET_DIR/payload/CREW/Crew/input/Cars1.png|g" \
  -e "s|__PATH__|$TARGET_DIR/payload/CREW/Crew|g" \
  "$SCRIPT_DIR/crew.desktop" > "$DESKTOP_FILE"
chmod +x "$TARGET_DIR/launch-crew.sh" "$TARGET_DIR/uninstall.sh"

echo
echo "Crew installed to: $TARGET_DIR"
echo "Launch with: $TARGET_DIR/launch-crew.sh"
echo "Desktop entry: $DESKTOP_FILE"
