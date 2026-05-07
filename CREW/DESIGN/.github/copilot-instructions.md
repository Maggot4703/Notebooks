# Copilot Instructions

## Commands

Work from `xCrew/` for the runnable application code.

```bash
cd xCrew
pip install -r requirements.txt
python Crew.py --help
python run_gui.py
python -m pytest
python -m pytest tests/test_basic.py
python -m pytest tests/test_basic.py::TestBasicApp::test_module_imports
flake8 .
black .
pre-commit run --all-files
```

For display-backed GUI checks:

```bash
cd xCrew
bash run_gui_tests.sh
```

## Architecture

- `xCrew/` is the actual Crew Manager application. `Crew.py` is the compatibility-critical entry point: it supports CLI subcommands and also acts as a GUI launcher.
- `gui.py` contains the large `CrewGUI` Tkinter application. `run_gui.py` is a thin wrapper, and `gui_main_function.py` is the canonical GUI startup path.
- Data and persistence are split across helper modules: `data_manager.py` owns loaded table state plus filter/sort behavior, `database_manager.py` manages SQLite-backed crew/group storage, and `config.py` + `state_manager.py` persist window geometry, column widths, visibility, and other settings through `config.json`.
- `ui_manager.py` and `event_manager.py` are extracted support modules for layout and bindings, but they still operate by reading and mutating attributes on the main `CrewGUI` instance.
- `message_router.py`, `audio_manager.py`, `tts_manager.py`, and related modules layer chat, recording, and TTS features onto the same GUI rather than living in a separate service boundary.
- The top-level `AGENTS/`, `RULES/`, `SKILLS/`, `PLANS/`, `JOBS/`, `NOTEBOOKS/`, and `automation/` folders are design/process assets. Edit those when the task is about workflow or documentation; edit `xCrew/` when the task is about application behavior.

## Conventions

- Treat `xCrew/Crew.py` and `xCrew/gui.py` as behavior-preservation hotspots. Existing instructions in `xCrew/.instructions.md` and `xCrew/.github/instructions/Crew.instructions.md` favor incremental modularization, reuse of existing code, and avoiding feature or UI regressions.
- Keep the current flat import style inside `xCrew/` (`from config import Config`, `from database_manager import DatabaseManager`, etc.). Tests rely on `xCrew/tests/conftest.py` adding the project root to `sys.path`, so package-relative import rewrites ripple through many files.
- Default pytest collection is defined in `xCrew/setup.cfg` and only targets `xCrew/tests/`. There are also top-level `xCrew/test_*.py` files, but many of those are standalone `unittest` or utility scripts and are not part of the default pytest run.
- Formatting and linting conventions come from `xCrew/setup.cfg` and `xCrew/.pre-commit-config.yaml`: Black-style 88 columns, Flake8 with `E501` and `E203` ignored, and isort using the Black profile.
- GUI state restoration is attribute-driven: helper managers expect specific `CrewGUI` fields such as `data_table`, `column_visibility`, and `_saved_column_widths` to exist. Preserve those contracts when refactoring.
- `xCrew/gui.py` auto-imports workspace Python files while explicitly skipping scripts, tests, and side-effect-heavy modules, and it caches results in `.auto_import_cache.json`. Be careful when changing discovery or import behavior.
- The design folders cross-reference each other: plans point at skills and jobs, rules constrain implementation, and automation scripts are expected to log process outcomes under `NOTEBOOKS/`.
