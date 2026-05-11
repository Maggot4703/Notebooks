## Plan: CardCutter Startup Script

**TL;DR:** Add missing dependencies to `pyproject.toml`, then create a `run.sh` startup script that syncs the venv and runs `card_cutter.py` with optional job arguments.

**Preconditions**
- `CARDCUTTER/CardCutter/card_cutter.py` exists and is runnable
- `uv` is available on PATH
- Internet access available for `uv sync` (or packages already cached)

**Steps**

1. Edit [CARDCUTTER/pyproject.toml](CARDCUTTER/pyproject.toml) — add to `dependencies` if not already present:
   `pandas>=2.0`, `pillow>=10.0`, `openpyxl>=3.1`
2. Run `uv sync` in `CARDCUTTER/` to install them
3. Create `CARDCUTTER/run.sh` (skip if file already exists with correct content):
   ```sh
   #!/usr/bin/env bash
   set -e
   cd "$(dirname "$0")"
   uv sync --quiet
   uv run python CardCutter/card_cutter.py "$@"
   ```
   - `"$@"` passes any job arguments through (e.g. `./run.sh images`, `./run.sh csv excel`)
   - No args = runs the full default workflow defined in `card_cutter.py`
4. `chmod +x CARDCUTTER/run.sh`

**Relevant files**
- [CARDCUTTER/pyproject.toml](CARDCUTTER/pyproject.toml) — add deps
- `CARDCUTTER/run.sh` — new file (create if absent)

**Verification — success criteria**
1. `./run.sh --help` — exits 0 and lists job names
2. `./run.sh noop` — exits 0, prints `No operation performed.`
3. `uv run python CardCutter/card_cutter.py csv` — exits without `ImportError` or `ModuleNotFoundError` (missing `data.csv` is acceptable)
