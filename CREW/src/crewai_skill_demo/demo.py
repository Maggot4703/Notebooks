"""Local demo runner for CrewAI tools in this workspace."""

from __future__ import annotations

import sys
from pathlib import Path

# Support direct execution (python /path/to/demo.py) by adding src to sys.path.
if __package__ in {None, ""}:
    src_dir = Path(__file__).resolve().parent.parent
    src_dir_str = str(src_dir)
    if src_dir_str not in sys.path:
        sys.path.insert(0, src_dir_str)

from crewai_skill_demo.tools import GridOverlayTool
from crewai_skill_demo.tools import WorldLookupTool


def main() -> None:
    tool = GridOverlayTool()
    world_tool = WorldLookupTool()
    print(f"Loaded tool: {tool.name}")
    print(f"Loaded tool: {world_tool.name}")
    print("GridOverlayTool loaded successfully.")
    print(world_tool.run(world_name="Regina"))
    print("Run example:")
    print("tool.run(image_path='input.png', output_path='output.png')")


if __name__ == "__main__":
    main()
