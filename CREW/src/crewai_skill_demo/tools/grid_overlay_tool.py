"""CrewAI tool wrapping Crew.py grid overlay functionality."""

from __future__ import annotations

import os
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


class GridOverlayInput(BaseModel):
    """Arguments for applying a grid overlay to an image."""

    image_path: str = Field(..., description="Path to input image")
    output_path: str = Field(..., description="Path to save output image")
    grid_width: int = Field(42, description="Grid cell width in pixels")
    grid_height: int = Field(32, description="Grid cell height in pixels")
    grid_color: str = Field("lightgrey", description="Grid line color")
    show_labels: bool = Field(False, description="Draw row/column labels")
    output_format: str = Field(
        "", description="Optional format override, e.g. png/jpg"
    )
    quality: int = Field(
        95, description="Image quality for lossy formats (1-100)"
    )


class GridOverlayTool(BaseTool):
    """Apply a grid to an image by delegating to existing Crew.py logic."""

    name: str = "grid_overlay"
    description: str = (
        "Overlay a configurable grid on an image and save the result to disk."
    )
    args_schema: Type[BaseModel] = GridOverlayInput

    def _run(
        self,
        image_path: str,
        output_path: str,
        grid_width: int = 42,
        grid_height: int = 32,
        grid_color: str = "lightgrey",
        show_labels: bool = False,
        output_format: str = "",
        quality: int = 95,
    ) -> str:
        if grid_width <= 0 or grid_height <= 0:
            return (
                "Error: grid_width and grid_height "
                "must be greater than zero."
            )
        if quality < 1 or quality > 100:
            return "Error: quality must be between 1 and 100."

        try:
            from Crew.Crew import _build_save_kwargs, overlay_grid
        except Exception as exc:
            return f"Error importing Crew.py functions: {exc}"

        image = overlay_grid(
            image_path,
            grid_color=grid_color,
            grid_size=(grid_width, grid_height),
            show_labels=show_labels,
        )
        if image is None:
            return "Error: overlay_grid failed. Check image path and inputs."

        save_path = output_path
        extension = os.path.splitext(save_path)[1]
        if output_format:
            extension = f".{output_format.lower().lstrip('.')}"
            save_path = os.path.splitext(save_path)[0] + extension

        save_kwargs = _build_save_kwargs(extension or ".png", quality)

        try:
            image.save(save_path, **save_kwargs)
            return f"Saved gridded image: {save_path}"
        except Exception as exc:
            return f"Error saving image: {exc}"
