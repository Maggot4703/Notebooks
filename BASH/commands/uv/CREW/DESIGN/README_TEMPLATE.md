# Crew Documentation Template

## Overview

Describe the feature, workflow, or subsystem in the production `CREW/Crew/` app.
State whether this document is about runtime behavior, design intent, or future work.

## Source of Truth

- Production code: `CREW/Crew/`
- Primary entry point: `CREW/Crew/Crew.py`
- Main GUI: `CREW/Crew/gui.py`
- Supporting docs: `CREW/docs/README.md`, `CREW/Crew/docs/README.md`

## Setup

```bash
cd /home/me/Notebooks/CREW/Crew
uv sync
```

## Run

```bash
uv run python Crew.py
```

If the document is about a specific surface, add the exact command here, for example:

```bash
uv run python gui.py
pytest tests/test_basic.py
```

## User Workflow

1. Describe how a user reaches the feature.
2. Describe the key actions and visible results.
3. Note any status messages, dialogs, or output files involved.

## Relevant Files

- `Crew.py` - entry point or CLI behavior
- `gui.py` - GUI behavior
- `config.py` - persisted settings
- `data_manager.py` / `database_manager.py` - state and persistence
- `ReadMine.py` - documentation-fetch workflow, if relevant

Replace this list with the files actually relevant to the topic.

## Configuration

Document the real configuration surface:
- values in `config.json`
- command-line flags
- environment variables
- generated output directories

## Validation

Prefer existing project commands:

```bash
cd /home/me/Notebooks/CREW/Crew
pytest
flake8 .
black .
```

For ReadMine-specific work, note the targeted direct path when broad `pytest`
collection is not reliable:

```bash
python -m py_compile ReadMine.py tests/test_readmine_features.py tests/test_readmine_progress.py
python tests/test_readmine_features.py
python tests/test_readmine_progress.py
```

## Related Documentation

- `CREW/docs/README.md`
- `CREW/docs/fetchdocs_readmine.md`
- `CREW/Crew/Reading Now/README.md`
- any DESIGN plans that explain future work

## Notes

- Call out backup or historical copies explicitly if they appear in the workflow.
- Avoid describing `xCrew/` as active. The production application is `CREW/Crew/`.
