# CrewAI skill setup

In current `CrewAI` docs, a reusable agent "skill" is typically implemented as a custom `tool`.

This workspace now includes a minimal starter you can copy when you want to add a new skill.

## What was added

- `Pipfile` now declares `crewai`
- `src/crewai_skill_demo/tools/world_lookup_tool.py` contains a custom `BaseTool`
- `src/crewai_skill_demo/tools/grid_overlay_tool.py` wraps existing `Crew.py` grid logic
- `src/crewai_skill_demo/demo.py` shows how to run the skill locally without wiring a full crew yet
- `.env.example` gives you a starting point for real crew runs later

## Recommended setup

From `/home/me/Notebooks/CREW`:

```bash
pipenv install --skip-lock
```

If you want the optional CrewAI toolkit package as well:

```bash
pipenv run python -m pip install "crewai[tools]"
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
pipenv run crewai create tool my_skill
```

That is the current CLI shortcut for generating a custom tool scaffold.

## Validate the starter skill

Run the included demo:

```bash
PYTHONPATH=src pipenv run python -m crewai_skill_demo.demo
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
