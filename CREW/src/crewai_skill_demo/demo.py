"""Local demo runner for CrewAI tools in this workspace."""

from __future__ import annotations

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
