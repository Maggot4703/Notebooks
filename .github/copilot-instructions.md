# Copilot Instructions for this repository

## Build, test, and lint commands

There is no single repo-wide build step. Most workspaces are launched directly with `uv`.

```bash
# Root workspace
cd /home/me/Notebooks
uv sync
uv run python main.py
uv run jupyter lab
```

```bash
# Notebook-first workspaces
cd /home/me/Notebooks/BASH && uv sync && uv run jupyter lab
cd /home/me/Notebooks/CALIBRE && uv sync && uv run jupyter lab
cd /home/me/Notebooks/JUPYTERLAB && uv sync && uv run jupyter lab
cd /home/me/Notebooks/PYTHON && uv sync && uv run jupyter lab
```

```bash
# AI workspace
cd /home/me/Notebooks/AI
uv sync
uv run python main.py

# Bootstrap a new ALL-CAPS workspace
bash markdown/create-project/create-project.sh
```

```bash
# CREW application
cd /home/me/Notebooks/CREW/Crew
uv sync
uv run python Crew.py
uv run python run_gui.py   # or: uv run python gui.py
```

```bash
# CREW tests
cd /home/me/Notebooks/CREW/Crew
pytest
pytest tests/test_basic.py
pytest tests/test_basic.py::TestBasicApp::test_module_imports
```

```bash
# CREW lint / format
cd /home/me/Notebooks/CREW/Crew
flake8 .
black .
```

```bash
# 0101 web app
cd /home/me/Notebooks/0101/0101
uv sync
uv run python src/public_html/server.py
```

```bash
# TRAVELLERMAP tooling
cd /home/me/Notebooks/TRAVELLERMAP
uv sync
uv run main.py
```

## High-level architecture

- The repo is a notebook hub with mostly independent top-level workspaces. The root `pyproject.toml` defines a `uv` workspace for `AI`, `BASH`, `CALIBRE`, `CARDCUTTER`, `CREW`, `JUPYTERLAB`, and `PYTHON`, while other top-level projects such as `0101` and `TRAVELLERMAP` live alongside that workspace rather than inside it.
- Root `main.py` is a lightweight launcher: it reads `config.json`, accepts `--persona` and `--context-window`, then prints the first `README.md` it finds while walking the repo.
- Root notebooks such as `ai.ipynb`, `bash.ipynb`, and `crew.ipynb` are convenience entry points into workspace notebooks. `links-ipynb.sh` is the dynamic script that scans top-level ALL-CAPS folders, rewrites itself as `ln -s` commands, and creates or updates symlinks. `links-create.sh` is a static prebuilt symlink list for common notebooks.
- `CREW/Crew/` is the only production-style Python application in the repository. `Crew.py` is the CLI/data-processing entry point, `gui.py` still coordinates much of the Tk GUI behavior, and `run_gui.py` / `launch_gui.py` are launch wrappers. Core responsibilities are split across manager modules: `data_manager.py` for table loading/filtering/sorting, `database_manager.py` for SQLite persistence, `config.py` for validated config state, `state_manager.py` for window/layout restore, `ui_manager.py` for layout and menus, and `cache.py` for short-lived cached data.
- `0101/0101/src/public_html/server.py` is a separate threaded HTTP app. It serves static files, persists textarea content under `saved/` via `/api/text/<key>`, and uses `/api/ping` plus `/api/shutdown` to stop itself when the browser closes or goes idle.
- `TRAVELLERMAP/traveller_agent.py` exposes scripts as callable skills. It auto-discovers scripts under `TRAVELLERMAP/scripts` and also registers scripts under `CREW/Crew/scripts` with a `crew-` prefix, so some automation spans both workspaces.
- Repository-level Copilot skills live under `.github/skills/`, with task-specific coverage for Traveller data, nearest-base lookup, OCR, API design, textarea persistence, ASCII art, and related utility workflows.

## Key conventions

- Prefer `uv` as the environment manager. Some workspaces still include `Pipfile` or `requirements.txt` for compatibility, but do not mix package-management workflows inside one workspace.
- Keep top-level workspace folders uppercase. Notebook discovery and symlink tooling assume that naming convention.
- Treat notebooks as reproducible artifacts: preserve metadata, avoid hidden state dependencies, keep edits focused, and move reusable logic into `.py` files once a notebook grows beyond exploration. When code is extracted, the Python module becomes the source of truth and the notebook should stay a thin driver/example.
- For notebook-centric workspaces, dependency changes belong in the workspace's declared environment files (`pyproject.toml` or `Pipfile`), not as ad hoc notebook installs.
- `CREW/Crew/` uses a flat import style in runtime code (`from config import Config`, `import cli`) rather than package-relative imports. Tests make this work by prepending the project root to `sys.path` in `tests/conftest.py`.
- `CREW/Crew/setup.cfg` is the source of truth for Python tooling there: pytest only collects from `tests/`, runs with `--strict-markers` and `--tb=short`, and flake8 uses line length 88 while ignoring `E501` and `E203` to stay aligned with Black.
- Generated command documentation in `BASH/` and `CALIBRE/` (`help-*.txt`, `man-*.txt`, `tldr-*.txt`, and generated `.html`) should be regenerated from notebooks or scripts rather than edited by hand.
- For shell and startup files, preserve the workspace-specific launch flow and make minimal targeted fixes instead of broad environment rewrites.
- For `0101` web work, browser lifecycle matters: textarea persistence and shutdown behavior depend on real page activity, not just raw HTTP calls.
- For PDF-related Python work, prefer `pypdf` for general manipulation, `pdfplumber` for structured extraction, and `reportlab` for PDF generation; close readers promptly when processing large files.
