# Notebooks Workspace

This repository is a multi-workspace notebook hub for experimentation, command documentation, and learning workflows.

Projects are organized in UPPERCASE folders so each area can run independently.

## Workspace Layout

- `AI/` - AI notes, workflows, and project bootstrap automation
- `BASH/` - shell command exploration and docs
- `CALIBRE/` - Calibre command and notebook workflows
- `CARDCUTTER/` - card-cutter tools and notebook assets
- `CREW/` - Crew-related notebooks and structured Python project
- `JUPYTERLAB/` - JupyterLab exploration
- `PYTHON/` - general Python learning notebooks

Root-level convenience notebooks mirror key workspace notebooks (for example `ai.ipynb`, `bash.ipynb`, `crew.ipynb`).

## Prerequisites

- Linux/macOS shell
- Python (project environments are created per workspace)
- `uv` (primary dependency/environment tool)
- JupyterLab

Optional fallback workflow is available with `pipenv` in workspaces that include a `Pipfile`.

## Quick Start (Root)

```bash
cd /home/me/Notebooks
uv sync
uv run python main.py
```

To run notebooks in the active environment:

```bash
uv run jupyter lab
```

## Workspace Startup Patterns

Most workspaces follow this model:

```bash
cd /home/me/Notebooks/<WORKSPACE>
uv sync
uv run jupyter lab
```

Examples:

```bash
cd /home/me/Notebooks/AI && uv sync && uv run jupyter lab
cd /home/me/Notebooks/BASH && uv sync && uv run jupyter lab
cd /home/me/Notebooks/CALIBRE && uv sync && uv run jupyter lab
cd /home/me/Notebooks/PYTHON && uv sync && uv run jupyter lab
cd /home/me/Notebooks/JUPYTERLAB && uv sync && uv run jupyter lab
```

## Create a New Project (Automated)

An interactive bootstrap script is available:

```bash
cd /home/me/Notebooks/AI
bash ./create-project.sh
```

What it does:

1. Prompts for project name
2. Converts project folder name to ALL CAPS
3. Creates project folder under `/home/me/Notebooks`
4. Creates `.venv` with `uv venv` if missing
5. Copies `AI/startup.txt` into the new folder and updates the workspace `cd` path
6. Installs starter packages (`jupyterlab ipykernel pandas`) unless overridden
7. Generates `requirements.txt`
8. Creates `<PROJECT_NAME>.ipynb` if missing
9. Runs the project's `startup.txt`

## Create a New Project (Manual)

If you prefer manual setup:

```bash
deactivate || true
export PROJECT_NAME="MYPROJECT"
mkdir -p "/home/me/Notebooks/${PROJECT_NAME}"
cd "/home/me/Notebooks/${PROJECT_NAME}"
uv venv
source .venv/bin/activate
uv pip install jupyterlab ipykernel pandas
uv pip freeze > requirements.txt
cp /home/me/Notebooks/AI/startup.txt ./startup.txt
sed -i "2s|^cd .*|cd /home/me/Notebooks/${PROJECT_NAME}|" ./startup.txt
cat > "${PROJECT_NAME}.ipynb" <<'JSON'
{
	"cells": [],
	"metadata": {
		"kernelspec": {
			"display_name": "Python 3",
			"language": "python",
			"name": "python3"
		},
		"language_info": {
			"name": "python"
		}
	},
	"nbformat": 4,
	"nbformat_minor": 5
}
JSON
bash ./startup.txt
```

## Notebook Link Utilities

The root has scripts for building symlink commands to workspace notebooks.

```bash
cd /home/me/Notebooks
bash links-create.sh
bash links-ipynb.sh
```

## Conventions

- Keep project directories in ALL CAPS.
- Use one virtual environment per project/workspace.
- Prefer `uv` over mixed package managers in the same workspace.
- Treat generated command docs and outputs as generated artifacts.

## Troubleshooting

- If `uv` is missing:
	- install `uv`, then re-run the command.
- If environment activation fails:
	- confirm `.venv` exists in the target folder.
- If Jupyter starts with warnings:
	- warnings about optional language servers are expected in minimal installs.

## Batch Export Markdown to PDF (Unicode/Emoji Safe)

To convert all `.md` files in `/home/me/Notebooks` (recursively) to PDF with full Unicode and emoji support:

1. **Install Pandoc and XeLaTeX**
	- On Ubuntu/Debian:
	  ```bash
	  sudo apt-get update && sudo apt-get install -y pandoc texlive-xetex fonts-dejavu
	  ```

2. **Run this command:**
	```bash
	find /home/me/Notebooks -type f -name '*.md' -exec sh -c 'pandoc "$0" -o "${0%.md}.pdf" --pdf-engine=xelatex -V mainfont="DejaVu Sans" -V monofont="DejaVu Sans Mono"' {} \;
	```
	- This will create a PDF for each Markdown file, preserving the name and location.
	- The `mainfont` and `monofont` options ensure all Unicode and box-drawing characters render correctly.

**Troubleshooting Unicode/Emoji Issues:**
- If you see LaTeX errors about missing Unicode characters, make sure you are using `--pdf-engine=xelatex` and a Unicode font (like DejaVu or Noto).
- For other font issues, try `-V mainfont="Noto Sans" -V monofont="Noto Sans Mono"` if those fonts are installed.
=======
