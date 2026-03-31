# Copilot Instructions

## Repository Overview

A multi-workspace Jupyter notebook repository for learning, experimentation, and documentation generation. Each sub-workspace (ALL-CAPS folder) is independent with its own `.code-workspace` file and dependency management:

- **AI/** — AI workflows, project bootstrap automation, IDE dependency checker
- **BASH/** — Shell command documentation and exploration
- **CALIBRE/** — Calibre (e-book management) notebook and CLI documentation
- **CARDCUTTER/** — Card-cutter image processing tools and notebook assets
- **CREW/** — Crew Manager GUI application for data processing and image overlays
- **JUPYTERLAB/** — JupyterLab extension and configuration exploration
- **PYTHON/** — General Python learning and experimentation

- **TRAVELLERMAP/** — Traveller sector/world data tools, map API, and RPG data skills (see nearest-base skill)

The primary focus is notebook-based exploration and documentation generation. `CREW/Crew/` is the only sub-project with a full production-style Python application (GUI, tests, linting).

## Agent Skills

- **nearest-base**: Use when searching for the nearest base to a world in any Traveller sector. Supports user-driven or automatic (ANY) base type selection, sector/world lookup, and base distance calculation. See `.github/skills/nearest-base/SKILL.md` for workflow and examples.

---

## Workspace-Specific Commands

### AI/ — Project bootstrap automation and IDE dependency checker
```sh
cd /home/me/Notebooks/AI
uv sync && uv run python main.py   # validates node, npm, ipykernel, jupyterlab
uv run jupyter lab

# Bootstrap a new workspace interactively
bash markdown/create-project/create-project.sh
```

### BASH/ — Shell command documentation
```sh
cd Notebooks/BASH/
uv sync && uv run jupyter lab
```
Alternatively: `pipenv install && pipenv shell && jupyter lab`

Auto-generates `.txt` and `.html` files (help/man/tldr) — do not hand-edit these outputs.

### CALIBRE/ — E-book management notebook
```sh
cd Notebooks/CALIBRE/
# Option 1: Use uv (primary)
uv sync && uv run jupyter lab

# Option 2: Use pipenv
pipenv install && pipenv shell
jupyter lab

# Option 3: Run startup script
bash startup.sh
```
Also generates documentation outputs similar to BASH/.

### PYTHON/ — General Python learning
```sh
cd Notebooks/PYTHON/
uv sync && uv run jupyter lab
```
Alternatively: `pipenv install && pipenv shell && jupyter lab`

### CREW/ — Crew Manager GUI application
```sh
cd /home/me/Notebooks/CREW/Crew

# Install dependencies
pip install -r requirements.txt

# Run the main data processing script
python Crew.py

# Launch the GUI
python run_gui.py   # or: python launch_gui.py

# Run tests (full suite or single file)
pytest
pytest tests/test_basic.py

# Lint and format
flake8 .
black .
```

### JUPYTERLAB/ — JupyterLab exploration
```sh
cd Notebooks/JUPYTERLAB/
uv sync && uv run jupyter lab
```
Alternatively: use startup script or `pipenv install && pipenv shell && jupyter lab`

### Root — Multi-workspace utilities
```sh
cd /home/me/Notebooks

# Generate symlink commands for workspace notebooks (run output to create links)
bash links-create.sh   # generates symlink commands for ALL-CAPS workspace folders
bash links-ipynb.sh    # generates ln -s commands for .ipynb files

# Run root-level utilities
uv sync && uv run main.py
```

---

## Architecture

### Directory structure
```
Notebooks/
├── AI/                (bootstrap automation, IDE dependency checker, pyproject.toml)
├── BASH/              (shell documentation, Pipfile)
├── CALIBRE/           (e-book docs, Pipfile + uv)
├── CARDCUTTER/CardCutter/  (card-cutter image tools, notebook, CSV/XLS assets)
├── CREW/Crew/         (Crew Manager GUI app, Pipfile, requirements.txt, tests/)
├── JUPYTERLAB/        (JupyterLab exploration)
├── PYTHON/            (general Python learning, Pipfile, separate .code-workspace)
├── links-create.sh    (generates symlink commands for workspace folders)
├── links-ipynb.sh     (generates ln -s commands for .ipynb files)
├── .code-workspace    (root workspace definition)
└── [other support files]...
```

### CREW/Crew/ — Production-structured Python application
The only workspace with a full production-style application:
- **Entry points:** `Crew.py` (data processing), `run_gui.py` / `launch_gui.py` (tkinter GUI)
- **Modules:** `data_manager.py`, `database_manager.py`, `ui_manager.py`, `state_manager.py`, `config.py`, `cache.py`, `tts_manager.py`
- **Tests:** `tests/` directory with pytest; config in `setup.cfg`
- **Linting:** flake8 (max line length 88, E501 ignored — black handles it), black for formatting
- **Dependencies:** `requirements.txt` is primary; `Pipfile` also present

### BASH/ and CALIBRE/ — Auto-generated documentation
Notebooks run shell commands that write `.txt` and `.html` output to workspace root:
- `help-*.txt`, `man-*.txt`, `tldr-*.txt` — command documentation
- `*.html` — rendered versions of above
- **Do not hand-edit** these files; regenerate via notebook cells

### Shared notebooks and symlinks
- Root-level `.ipynb` files (e.g., `crew.ipynb`, `bash.ipynb`) are symlinks to workspace notebooks
- `links-create.sh` discovers notebooks in ALL-CAPS workspace folders and generates symlink commands
- `links-ipynb.sh` generates `ln -s` commands — run the output to create/update links

---

## Key Conventions and Best Practices

### Python and version management
- **Python 3.14** — pinned via `.python-version` files at root and in BASH/, CALIBRE/
- Root and most sub-workspace `pyproject.toml` files specify `requires-python = ">=3.14"`
- AI/ and CALIBRE/ `pyproject.toml` still specify `>=3.11` (acceptable, but new workspaces should use 3.14)

### Package managers
- **uv** — primary for all workspaces; faster, more reliable dependency resolution
- **pipenv** — secondary option if uv is unavailable or for legacy compatibility
- **Don't mix** package managers within a single workspace

### Notebook best practices
- **Cell independence:** Cells must run top-to-bottom without hidden state dependencies
- **Code organization:** When extracting code from cells to `.py` files, keep notebooks minimal; let modules be the source of truth
- **Dependencies:** Always add to `Pipfile`, never ad-hoc `!pip install` in cells
- **Diffs:** Prefer small, focused cell edits; avoid broad rewrites that make code review difficult

### CREW/Crew/-specific conventions
- **Architecture:** Tkinter GUI (`ui_manager.py` / `layout.py`) backed by `data_manager.py` and `database_manager.py`
- **State:** `state_manager.py` handles application state; `config.py` + `config.json` for persistence
- **Testing:** pytest with `--strict-markers`, `--tb=short`; per-file ignores for tests in `setup.cfg`
- **Formatting:** black (line length 88); flake8 ignores E501/E203 to avoid black conflicts
- **Logs:** Activity logs append to `/home/me/BACKUP/PROJECTS/Crew/ide_auto_update_chat.txt`

---

## Sub-workspace Instruction Files

Focused instruction files apply automatically for specific file types — do not duplicate their rules here:

| File | Scope | Applies to |
|------|-------|------------|
| `.github/instructions/pdf.instructions.md` | Root workspace | `**/*.py` — PDF library selection and patterns |
| `CREW/Crew/.github/instructions/Crew.instructions.md` | CREW project | `**/*.py` — formatting, linting, testing conventions |
| `JUPYTERLAB/.github/instructions/JupyterLab Instruction.instructions.md` | JUPYTERLAB | `**/*.ipynb`, `**/*.py`, `Pipfile` — notebook workflow rules |
