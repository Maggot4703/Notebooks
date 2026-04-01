"""Reference CrewAI tool for local Traveller world lookup."""

from __future__ import annotations

from typing import Type

try:
    from crewai.tools import BaseTool
except Exception:
    class BaseTool:
        """Fallback BaseTool used when crewai is not available locally."""

        name: str = ""
        description: str = ""
        args_schema = None

        def run(self, **kwargs):
            return self._run(**kwargs)


try:
    from pydantic import BaseModel, Field
except Exception:
    class BaseModel:
        """Fallback BaseModel for local demo mode without pydantic."""

    def Field(default, description=""):
        _ = description
        return default

_WORLD_DATA = {
    "regina": "Regina (Spinward Marches) UWP: A788899-C",
    "vland": "Vland (Vland) UWP: A967A9A-F",
    "kesali": "Kesali (Vland) UWP: B544779-8",
}


class WorldLookupInput(BaseModel):
    """Arguments for world lookup."""

    world_name: str = Field(..., description="World name to look up")


class WorldLookupTool(BaseTool):
    """Look up summary world data from a local in-memory catalogue."""

    name: str = "world_lookup"
    description: str = "Return basic Traveller world data for a world name."
    args_schema: Type[BaseModel] = WorldLookupInput

    def _run(self, world_name: str) -> str:
        world_key = world_name.strip().lower()
        if not world_key:
            return "Error: world_name cannot be empty."
        return _WORLD_DATA.get(world_key, f"No data found for '{world_name}'.")
