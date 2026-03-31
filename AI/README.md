# IDE Workspace

This workspace is for IDE and notebook-related exploration.

## Designer Agent

The Designer agent generates Python GUI code (Tkinter, PyQt, etc.) based on user prompts. It is code-only (no visual tools) and user-driven.

**Usage:**
- Select the 'Designer' agent.
- Describe the GUI you want (e.g., "Create a Tkinter window with a label and a button.").
- The agent will return ready-to-run Python code for your GUI.

**Supported frameworks:** Tkinter (default), PyQt5 (on request).

**Limitations:** No visual layout or drag-and-drop tools; code generation only.

## Dependency management

Use `uv` as the primary workflow for this directory. The local `.venv` may be created by `uv`, which means `pip` is not guaranteed to exist inside the environment.

Recommended setup:

```sh
cd /home/me/Notebooks/IDE
uv sync
uv run python main.py
uv run jupyter lab
```

Fallback setup with a standard virtual environment:

```sh
cd /home/me/Notebooks/IDE
python -m venv .venv
source .venv/bin/activate
python -m ensurepip --upgrade
python -m pip install -e .
python main.py
jupyter lab
```

## Node prerequisites

This workspace expects the following tools to be available on `PATH`:

- `node`
- `npm`

The runtime checker in `main.py` validates these tools and the Python notebook dependencies before launching notebook workflows.
