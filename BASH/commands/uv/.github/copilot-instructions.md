# Copilot Instructions for this repository

## Build, test, and lint commands

Notes: `uv` is the canonical workspace manager. Commands below assume the workspace root: `/home/me/Notebooks`.

- Root quick start
  - cd /home/me/Notebooks && uv sync && uv run python main.py
  - uv run jupyter lab

- Run a single test (CREW example)
  - cd /home/me/Notebooks/CREW/Crew && pytest tests/test_basic.py::TestBasicApp::test_module_imports
  - Run a single test file: cd /home/me/Notebooks/CREW/Crew && pytest tests/test_basic.py
  - Run full suite: cd /home/me/Notebooks/CREW/Crew && pytest
  - Run via uv: cd /home/me/Notebooks/CREW && uv sync && uv run pytest -- tests/test_basic.py::TestBasicApp::test_module_imports

- 0101 web app (run server)
  - cd /home/me/Notebooks/0101/0101 && uv sync && uv run python src/public_html/server.py

- Playwright (E2E for 0101)
  - npm init -y && npm i -D @playwright/test && npx playwright install
  - Start server in separate terminal and run `npx playwright test` (tests placed under `0101/0101/tests/playwright`).
  - A sample GitHub Actions workflow can be added to `.github/workflows/playwright.yml` — see repository README for a minimal example.

- Lint / format (CREW example)
  - cd /home/me/Notebooks/CREW/Crew && flake8 . && black .

When editing workspace environment files (pyproject.toml, Pipfile, package.json), run `uv sync` in that workspace and update/commit `uv.lock` when relevant.

---

## High-level architecture (concise)

- This repo is a multi-workspace notebook hub. Top-level workspaces live in ALL-CAPS folders (AI, BASH, CALIBRE, CREW, 0101, TRAVELLERMAP, CARDCUTTER, etc.).
- `main.py` is a lightweight launcher that reads `config.json`, accepts `--persona` and prints the first README it finds.
- Notebooks in the root are convenience symlinks to workspace notebooks; `links-ipynb.sh` and `links-create.sh` generate those links.
- `CREW/Crew/` is the single production-style Python application: CLI and Tk GUI, with manager modules (data_manager, database_manager, config, state_manager, ui_manager, cache).
- `CARDCUTTER/CardCutter/` contains image-processing notebooks and tools. Its outputs (generated images, CSV/XLS assets) are derived from notebooks — regenerate from sources; do not hand-edit generated artifacts.
- `0101/0101/src/public_html/server.py` is a small threaded HTTP app used by the 0101 workspace (textarea persistence and simple lifecycle endpoints).
- `TRAVELLERMAP/traveller_agent.py` auto-discovers scripts and exposes them as skills (also discovers CREW scripts with `crew-` prefix).
- Repository-level skills and agents live in `.github/skills/` and `.github/agents/` and are indexed by `agents-and-skills.md`.

---

## Key conventions (practical, repository-specific)

- Use `uv` for environment and dependency management. Do not mix multiple package managers within the same workspace.
- Workspace folders are UPPERCASE — many tools and scripts assume this naming convention.
- Notebooks are treated as reproducible artifacts. Preserve cell metadata, avoid hidden-state cells, and extract reusable code into `.py` modules.
- Per-workspace environment files (pyproject.toml, Pipfile, requirements.txt, package.json) are authoritative for dependency changes. After edits, run `uv sync` and update `uv.lock` where applicable.
- CREW uses flat top-level imports (e.g., `from config import Config`). Tests prepend the repo root to `sys.path`; follow that pattern when adding modules.
- `CREW/Crew/setup.cfg` governs pytest/flake8 behavior: pytest collects from `tests/`, uses `--strict-markers` and `--tb=short`. flake8 rules align with Black (line length 88, E501 ignored, E203 ignored).
- `CARDCUTTER/CardCutter/` produces generated image and CSV assets. Keep source notebooks and processing scripts as the source-of-truth; do not commit derived image outputs unless explicitly intended.
- Generated docs in `BASH/` and `CALIBRE/` (help-*.txt, man-*.txt, tldr-*.txt, *.html) are outputs from notebooks — do not hand-edit.
- For PDF work prefer `pypdf`, `pdfplumber`, `reportlab`. Close file readers promptly to avoid file locks and memory issues.

---

## Where to find AI agents & skills

- Root index: `agents-and-skills.md` (top-level) lists all `.agent.md` and `SKILL.md` files and their paths.
- Per-workspace agents live under `.github/agents/` and skills under `.github/skills/` and `AI/skills/`.

---

## Integration with other assistant configs

When synthesizing or enforcing assistant rules, check for these files and fold their important rules into Copilot instructions:
- CLAUDE.md
- .cursorrules or .cursor/rules/
- AGENTS.md
- .windsurfrules
- CONVENTIONS.md, AIDER_CONVENTIONS.md
- .clinerules

If present, prefer summarizing and referencing their rules instead of duplicating them verbatim.

---

## MCP Servers (optional)

This repo contains a small web app (0101) and an existing Playwright snippet. A Playwright GitHub Actions workflow and test scaffold can be added for `0101/0101`. Would you like a Playwright workflow and a test scaffold created under `0101/0101/tests/playwright`? Reply "yes" to scaffold.

---

Summary of changes

- Merged existing repository guidance and added explicit CardCutter notes, clarified uv/uv.lock workflow, and kept CREW single-test examples.

If this looks good, the file is ready. Want me to add the Playwright workflow scaffold and create the GitHub Actions file?