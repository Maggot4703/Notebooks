# Copilot Instructions

## Commands

Work from `../Crew/` for the production Crew Manager application.

```bash
cd /home/me/Notebooks/CREW/Crew
uv sync
uv run python Crew.py
uv run python gui.py
pytest
pytest tests/test_basic.py
pytest tests/test_basic.py::TestBasicApp::test_module_imports
flake8 .
black .
```

For ReadMine-focused work, broad `pytest` collection can still be interrupted by the
current package import issue in `CREW/Crew/__init__.py`. When that happens, use the
targeted direct path instead:

```bash
cd /home/me/Notebooks/CREW/Crew
python -m py_compile ReadMine.py tests/test_readmine_features.py tests/test_readmine_progress.py
python tests/test_readmine_features.py
python tests/test_readmine_progress.py
```

## Architecture

- `CREW/Crew/` is the production Crew Manager application. Treat it as the source of truth for runtime behavior, docs, and tests.
- `Crew.py` is the main entry point. `gui.py` contains the main Tk interface, while helper modules such as `data_manager.py`, `database_manager.py`, `config.py`, `state_manager.py`, and `ui_manager.py` support persistence and layout behavior.
- `ReadMine.py` is the production documentation-fetch workflow. It now defaults to beginner-only output under `CREW/Crew/Reading Now/`.
- `CREW/docs/` and `CREW/Crew/docs/` hold the current documentation indexes and build notes. The GUI Help menu now links to these local docs.
- `DESIGN/` is for design assets, plans, templates, and workflow notes. Update it when documenting process or architecture. Do not treat `DESIGN/xCrew/` as part of the active app.
- `DESIGN/xCrew/` is not used. Keep production changes in `CREW/Crew/`. Treat other backup-style trees as non-authoritative unless a task explicitly targets them.

## Conventions

- Prefer `uv` for the production app workflow in `CREW/Crew/`.
- Preserve the flat import style used by the runtime code (`from config import Config`, `import cli`, etc.).
- Follow `CREW/Crew/setup.cfg` for pytest, flake8, and Black conventions.
- When documenting Crew behavior, prefer current production surfaces: local docs, Help menu entries, Speech Settings, ReadMine beginner-only output, and the current TTS behavior.
- Keep DESIGN documents explicit about whether they describe production behavior, a future plan, or a historical snapshot.
