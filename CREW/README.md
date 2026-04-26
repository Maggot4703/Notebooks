# CrewAI skill setup

In current `CrewAI` docs, a reusable agent "skill" is typically implemented as a custom `tool`.

This workspace now includes a minimal starter you can copy when you want to add a new skill.

## Documentation Index

See [docs/README.md](docs/README.md) for a full index of user and developer documentation, including the [FetchDocs (ReadMine) User Guide](docs/fetchdocs_readmine.md).

## What was added

- `pyproject.toml` declares `crewai`
- `src/crewai_skill_demo/tools/world_lookup_tool.py` contains a custom `BaseTool`
- `src/crewai_skill_demo/tools/grid_overlay_tool.py` wraps existing `Crew.py` grid logic
- `src/crewai_skill_demo/demo.py` shows how to run the skill locally without wiring a full crew yet
- `.env.example` gives you a starting point for real crew runs later


## Running the Crew Application

**Recommended:** Use the provided script to ensure all relative imports work correctly:

```bash
./crew_run.sh
```

This script runs Crew as a module (`python3 -m Crew.Crew`), which is required for Python to resolve relative imports in the codebase. Do **not** run Crew.py directly with `python Crew/Crew.py` or `python3 Crew/Crew.py`, as this will cause import errors.

You can also pass CLI arguments:

```bash
./crew_run.sh --help
./crew_run.sh grid-image --image-path <path> --output-path <path>
```


## Python Version Compatibility

**Important:** This project requires **Python 3.12** for compatibility with `gemini-cli` and Google AI libraries. Python 3.14 is not supported due to upstream library issues.

## Recommended setup

From `/home/me/Notebooks/CREW`:

```bash
uv sync
```

### Check Python Version

Before installing dependencies, run:

```bash
python3 --version
```

It should output `Python 3.12.x`. If not, please install Python 3.12 and create a new virtual environment.

You can also run the provided script:

```bash
python3 check_python_version.py
```

If you want the optional CrewAI toolkit package as well:

```bash
uv add "crewai[tools]"
```

## File layout

```text
CREW/
├── Pipfile
├── .env.example
├── crew.ipynb
└── src/
    └── crewai_skill_demo/
        ├── __init__.py
        ├── demo.py
        └── tools/
            ├── __init__.py
            ├── grid_overlay_tool.py
            └── world_lookup_tool.py
```

## How to create a new skill

### Option 1: use the pattern in this workspace

1. Create a new file under `src/crewai_skill_demo/tools/`.
2. Subclass `BaseTool`.
3. Add an input schema with `pydantic`.
4. Implement `_run(...)`.
5. Import the tool into your crew or flow.

Minimal pattern:

```python
from typing import Type
from crewai.tools import BaseTool
from pydantic import BaseModel, Field


class MySkillInput(BaseModel):
    value: str = Field(..., description="Input for the skill.")


class MySkillTool(BaseTool):
    name: str = "my_skill"
    description: str = "What the skill does."
    args_schema: Type[BaseModel] = MySkillInput

    def _run(self, value: str) -> str:
        return f"Handled: {value}"
```

### Option 2: scaffold one with the CrewAI CLI

Once `crewai` is installed:

```bash
uv run crewai create tool my_skill
```

That is the current CLI shortcut for generating a custom tool scaffold.

## Validate the starter skill

Run the included demo:

```bash
PYTHONPATH=src uv run python -m crewai_skill_demo.demo
```

Expected result: a short local lookup result for `Regina`.

The demo also loads `GridOverlayTool`, which delegates to `Crew/Crew.py` functions for
image grid processing.

## Raspberry Pi startup examples

`Crew/Crew.py` has two startup modes:

- No arguments: starts the Tkinter GUI.
- CLI subcommand: runs a non-GUI task such as `read-csv`, `read-excel`, `grid-image`, `grid-folder`, or `crop-csv`.

Because of that split, this workspace now includes two Raspberry Pi startup examples:

- `crew-cli.service.example`: use this for boot-time `systemd` automation of a CLI task. Edit `CREW_COMMAND` to the command you want to run at boot.
- `crew-gui.desktop.example`: use this for GUI autostart after a desktop login. This is the correct path if you want the Tkinter app window to open automatically.

Recommended usage:

- Prefer `systemd` for unattended CLI/background work.
- Prefer desktop autostart for the GUI path because the no-argument mode opens a window and expects a logged-in graphical session.

## Install the startup examples on a Pi

This workspace also includes `install_rpi_startup.sh` to generate the real startup files on a Raspberry Pi.

CLI boot service example:

```bash
./install_rpi_startup.sh cli --command "read-csv /home/pi/data/cards.csv"
```

GUI autostart example:

```bash
./install_rpi_startup.sh gui --user pi
```

### Undo startup (remove installed files)

GUI autostart undo:

```bash
./install_rpi_startup.sh gui --undo --user pi
```

CLI boot service undo:

```bash
./install_rpi_startup.sh cli --undo --service-name crew-cli
```

Notes:

- The script writes a real `systemd` unit to `/etc/systemd/system/` for `cli` mode.
- The script writes a real desktop autostart file to `~/.config/autostart/` for `gui` mode.
- `--undo` disables and removes the installed file cleanly, with no side effects on the rest of the system.
- Override `--python` and `--repo-root` if your Raspberry Pi uses different paths than this workspace.

## Use the skill in a real crew

After your tool works on its own, attach it to an agent:

```python
from crewai import Agent
from crewai_skill_demo.tools.world_lookup_tool import WorldLookupTool

researcher = Agent(
    role="Traveller researcher",
    goal="Answer world questions accurately",
    backstory="Knows how to use a local world lookup skill.",
    tools=[WorldLookupTool()],
    verbose=True,
)
```

For actual crew execution, copy `.env.example` to `.env` and fill in the model provider keys you plan to use.


## Startup Code

```bash
cd /home/me/Notebooks/CREW
uv sync
PYTHONPATH=src uv run python -m crewai_skill_demo.demo
```

Or, you can run the demo script directly (now safe for both styles):

```bash
cd /home/me/Notebooks/CREW
uv sync
uv run python src/crewai_skill_demo/demo.py
```

Both commands are supported. The first (module style) is always safe and recommended for most users. The second (direct script) works because demo.py now bootstraps sys.path automatically.
## Troubleshooting: Missing pandas or other dependencies

If you see an error like:

```
ModuleNotFoundError: No module named 'pandas'
```

it means the required package is not installed in the Python environment you are using. If you run `Crew/Crew.py` directly, make sure to install dependencies in the environment you use to launch it. For example, if you are using a virtual environment from another project (like DICTATE), install pandas there:

```bash
/path/to/venv/bin/pip install pandas
```

Or, to install in the current environment:

```bash
pip install pandas
```
```


## STARTUP CODE

```bash
cd /home/me/Notebooks/CREW/Crew
uv sync
#uv run jupyter lab
uv run python Crew.py
'''

- The Crew GUI now includes a Speech (TTS) menu and a Microphone (speech recognition) menu. See [Crew/Crew/README.md](Crew/Crew/README.md#speech-and-microphone-features) for details.