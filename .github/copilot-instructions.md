# Copilot Instructions for this repository

## Build, test, and lint commands

There is no single repo-wide build step. Most workspaces are launched with `uv`. Examples and single-test commands below.

Root workspace

```bash
cd /home/me/Notebooks
uv sync
uv run python main.py
uv run jupyter lab
```

Notebook-first workspaces (examples)

```bash
cd /home/me/Notebooks/BASH && uv sync && uv run jupyter lab
cd /home/me/Notebooks/CALIBRE && uv sync && uv run jupyter lab
```

AI workspace

```bash
cd /home/me/Notebooks/AI
uv sync
uv run python main.py
```

CREW application

```bash
cd /home/me/Notebooks/CREW/Crew
uv sync
uv run python Crew.py
uv run python run_gui.py   # or: uv run python gui.py
```

CREW tests (single-test examples)

```bash
# Run full suite
cd /home/me/Notebooks/CREW/Crew && pytest
# Run a single test file
cd /home/me/Notebooks/CREW/Crew && pytest tests/test_basic.py
# Run a single test method
cd /home/me/Notebooks/CREW/Crew && pytest tests/test_basic.py::TestBasicApp::test_module_imports
# Run via uv
cd /home/me/Notebooks/CREW && uv sync && uv run pytest -- tests/test_basic.py::TestBasicApp::test_module_imports
```

0101 web app (run server)

```bash
cd /home/me/Notebooks/0101/0101
uv sync
uv run python src/public_html/server.py
```

TRAVELLERMAP tooling

```bash
cd /home/me/Notebooks/TRAVELLERMAP
uv sync
uv run main.py
```

Lint / format (CREW example)

```bash
cd /home/me/Notebooks/CREW/Crew
flake8 .
black .
```

Playwright (end-to-end testing for 0101 web app)

```bash
# Install Playwright (local/project)
npm init -y
npm i -D @playwright/test
npx playwright install

# Start server (in separate terminal)
cd /home/me/Notebooks/0101/0101
uv sync
uv run python src/public_html/server.py

# Run Playwright tests (assumes tests in tests/playwright)
npx playwright test
```

Example GitHub Actions workflow (minimal) for Playwright (add to .github/workflows/playwright.yml):

```yaml
name: Playwright E2E
on: [push, pull_request]
jobs:
  e2e:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Install Node
        uses: actions/setup-node@v4
        with:
          node-version: '20'
      - name: Install deps
        run: |
          npm ci
          npx playwright install --with-deps
      - name: Start server
        run: |
          cd 0101/0101
          uv sync
          uv run python src/public_html/server.py &
          sleep 2
      - name: Run Playwright tests
        run: npx playwright test
```

## High-level architecture

- The repo is a notebook hub containing independent top-level workspaces. Root `pyproject.toml` defines a `uv` workspace for `AI`, `BASH`, `CALIBRE`, `CARDCUTTER`, `CREW`, `JUPYTERLAB`, and `PYTHON`. Other projects (e.g., `0101`, `TRAVELLERMAP`) live alongside the workspace.
- `main.py` is a lightweight launcher: reads `config.json`, accepts `--persona` and `--context-window`, and prints the first `README.md` it finds.
- Top-level notebooks (ai.ipynb, bash.ipynb, crew.ipynb) are convenience entry points. `links-ipynb.sh` dynamically creates symlinks for notebooks in ALL-CAPS folders; `links-create.sh` is a static list.
- `CREW/Crew/` is the only production-style Python app. Key modules: `Crew.py` (CLI/processing), `gui.py` (Tk GUI), `run_gui.py`/`launch_gui.py`, plus manager modules: `data_manager.py`, `database_manager.py`, `config.py`, `state_manager.py`, `ui_manager.py`, `cache.py`.
- `0101/0101/src/public_html/server.py` is a small threaded HTTP app (textarea persistence, /api/ping, /api/shutdown lifecycle hooks).
- `TRAVELLERMAP/traveller_agent.py` exposes scripts as callable skills and auto-discovers scripts under `TRAVELLERMAP/scripts` and `CREW/Crew/scripts` (registered with a `crew-` prefix).
- Repository-level Copilot skills and agents live under `.github/skills/` and `.github/agents/` (see agents-and-skills.md for an index).

## Key conventions

- Prefer `uv` as the environment manager. Workspaces may include `Pipfile` or `requirements.txt` for compatibility; do not mix managers inside a single workspace.
- Top-level workspace folders are uppercase; notebook discovery and symlink tooling assume this.
- Treat notebooks as reproducible artifacts: preserve metadata, avoid hidden-state cells, and extract reusable logic into `.py` modules when appropriate. Python modules are the source of truth for shared code.
- Dependency changes belong in each workspace's declared environment files (`pyproject.toml`, `Pipfile`, or package.json for JS). After editing, run `uv sync` and update/commit `uv.lock` when relevant.
- `CREW/Crew/` uses flat top-level imports (e.g. `from config import Config`) rather than package-relative imports. Tests prepend the project root to `sys.path` (see `tests/conftest.py`).
- `CREW/Crew/setup.cfg` is authoritative for pytest/flake8 config: pytest collects only from `tests/`, uses `--strict-markers` and `--tb=short`; flake8 line-length 88 ignoring `E501` and `E203` to align with Black.
- Generated docs in `BASH/` and `CALIBRE/` (`help-*.txt`, `man-*.txt`, `tldr-*.txt`, `*.html`) are derived from notebooks — regenerate from the source notebooks, do not hand-edit.
- For PDF processing prefer `pypdf`, `pdfplumber`, and `reportlab`; close readers promptly to avoid file-locking and memory issues.

## Where to find AI agents & skills

- Root index: `agents-and-skills.md` (top-level) lists all `.agent.md` and `SKILL.md` files and their paths.
- Per-workspace agents live under `.github/agents/` and skills under `.github/skills/` and `AI/skills/`.

## Other notes

- Use `uv` for running workspace-specific commands and tests. When writing CI, prefer reproducing the `uv sync` step to ensure environment parity.
- When adding E2E tests for 0101, place Playwright tests under `0101/0101/tests/playwright` and use the workflow snippet above as a template.

---

If you want, the Playwright workflow can be added to `.github/workflows/` and a sample test scaffold created under `0101/0101/tests/playwright/` — say the word and these will be added.

Summary: updated .github/copilot-instructions.md with single-test commands, agents/skills pointers, dependency update guidance, and a Playwright MCP servers snippet.
