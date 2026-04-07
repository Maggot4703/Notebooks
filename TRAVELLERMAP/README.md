# TRAVELLERMAP Notebooks Directory

This folder contains Jupyter notebooks for TravellerMap data analysis, visualization, and workflow documentation.

## Purpose
- Store all notebooks related to TravellerMap tools and data

## Usage
- Open notebooks in this directory for interactive data exploration
- Use as a workspace for new TravellerMap notebook experiments

## Conventions
- Name notebooks by topic or workflow
- Keep notebooks organized for easy reference
# This file marks the notebooks directory for Jupyter notebooks.

## Agent API

A Python agent is available to auto-discover and expose all scripts in this project as both CLI/chat commands and Python callables.

- See `traveller_agent.py` for the implementation.
- See `USAGE_traveller_agent.md` for usage examples.

Example usage:

```python
from traveller_agent import traveller_agent
print(traveller_agent.list_skills())
print(traveller_agent.get_doc('find-nearest-base-to'))
# traveller_agent.run('find-nearest-base-to', 'Vland.tab', 'Jewell', 'Navy')
```

## References
- [traveller_agent.py](traveller_agent.py): Auto-discovers and exposes all scripts as agent skills/commands and Python callables.
- [USAGE_traveller_agent.md](USAGE_traveller_agent.md): Usage examples for the agent API.

## Startup Code

```bash
cd /home/me/Notebooks/TRAVELLERMAP
uv sync
#uv run jupyter lab
uv run main.py
```

- To add a new skill, simply drop a .py script into TRAVELLERMAP/scripts or its utils/ subfolder. The agent will auto-discover it on next startup.
- The agent also auto-discovers and exposes all .py scripts in CREW/Crew/scripts and its subfolders as skills/commands and Python callables, using the prefix `crew-`.
- CREW skills are registered with the prefix `crew-` (e.g., `crew-fetch-docs`, `crew-bmp2png`).
- To add a new CREW skill, drop a .py script in CREW/Crew/scripts or its subfolders. The agent will auto-discover it.
