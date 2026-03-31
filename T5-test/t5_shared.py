"""
t5_shared.py - Shared helpers for T5-test (CardCutter + Crew)
"""

    # os import removed (unused)
import csv
import pandas as pd
from PIL import Image, ImageDraw, ImageColor
import logging
from typing import Any, Optional, Tuple, Union

# Logging setup (Crew style)
logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s - %(name)s - %(levelname)s - %(message)s",
    filename="t5_app.log",
    filemode="a",
)
logger = logging.getLogger("t5_shared")

# Constants
DEFAULT_GRID_COLOR = "lightgrey"
DEFAULT_LINE_COLOR = "red"
DEFAULT_GRID_SIZE = (42, 32)
IMAGE_DIMENSIONS = (800, 600)

# Color helpers


def hex_to_rgb(hex_color: str) -> Tuple[int, int, int]:
    try:
        if not isinstance(hex_color, str) or not hex_color.strip():
            raise ValueError("Color value must be a non-empty string")
        color_value = hex_color.strip()
        if color_value.startswith("#") and len(color_value) == 4:
            # Expand #RGB to #RRGGBB
            color_value = (
                "#" + color_value[1] * 2 + color_value[2] * 2 + color_value[3] * 2
            )
        rgb = ImageColor.getrgb(color_value)
        if len(rgb) == 4:
            rgb = rgb[:3]
        return rgb
    except Exception as e:
        logger.error(f"Error converting hex to RGB '{hex_color}': {e}")
        return (0, 0, 0)



def rgb_to_hex(r: int, g: Optional[int] = None, b: Optional[int] = None) -> str:
    try:
        if isinstance(r, tuple) and len(r) == 3:
            r, g, b = r
        if g is None or b is None:
            raise ValueError("RGB values are required")
        if not (0 <= int(r) <= 255 and 0 <= int(g) <= 255 and 0 <= int(b) <= 255):
            raise ValueError(f"RGB values must be 0-255: ({r}, {g}, {b})")
        return f"#{int(r):02X}{int(g):02X}{int(b):02X}"
    except Exception as e:
        logger.error(f"Error converting RGB to hex ({r}, {g}, {b}): {e}")
        return "#000000"



def _resolve_color(color_value: Any) -> Any:
    if isinstance(color_value, tuple) and len(color_value) == 3:
        return color_value
    if isinstance(color_value, str):
        return hex_to_rgb(color_value)
    return (0, 0, 0)

# Image helpers


def mark_line(
    image=None,
    x1: int = 0,
    y1: int = 0,
    x2: int = 0,
    y2: int = 0,
    color: str = DEFAULT_LINE_COLOR,
    thickness: int = 1,
):
    try:
        if image is None:
            image = Image.new("RGB", IMAGE_DIMENSIONS, "white")
        draw = ImageDraw.Draw(image)
        draw.line([(x1, y1), (x2, y2)], fill=color, width=thickness)
        return image
    except Exception as e:
        logger.error(f"Error in mark_line: {e}")
        return None



def overlay_grid(
    image_path: str,
    grid_color: str = DEFAULT_GRID_COLOR,
    grid_size: tuple = DEFAULT_GRID_SIZE,
    show_labels: bool = False,
) -> Optional[Image.Image]:
    try:
        if not image_path or not isinstance(image_path, str):
            logger.error("Invalid image path provided to overlay_grid.")
            return None
        if not isinstance(grid_size, tuple) or len(grid_size) != 2:
            logger.error("Invalid grid_size. Expected tuple(width, height).")
            return None
        grid_width, grid_height = grid_size
        if not isinstance(grid_width, int) or not isinstance(grid_height, int):
            logger.error("grid_size values must be integers.")
            return None
        if grid_width <= 0 or grid_height <= 0:
            logger.error("grid_size values must be > 0.")
            return None
        color_value = _resolve_color(grid_color)
        img = Image.open(image_path)
        draw = ImageDraw.Draw(img)
        width, height = img.size
        for x in range(0, width, grid_width):
            draw.line([(x, 0), (x, height)], fill=color_value)
        for y in range(0, height, grid_height):
            draw.line([(0, y), (width, y)], fill=color_value)
        if show_labels:
            for idx, x in enumerate(range(0, width, grid_width)):
                draw.text((x + 2, 2), f"C{idx}", fill=color_value)
            for idx, y in enumerate(range(0, height, grid_height)):
                draw.text((2, y + 2), f"R{idx}", fill=color_value)
        return img
    except Exception as e:
        logger.error(f"Error in overlay_grid for {image_path}: {e}")
        return None

# CSV/Excel helpers


def read_csv_builtin(filename: str) -> list:
    data = []
    try:
        with open(filename, mode="r", newline="", encoding="utf-8") as file:
            csv_reader = csv.reader(file)
            for row in csv_reader:
                data.append(row)
        return data
    except Exception as e:
        logger.error(f"Error reading CSV file {filename} with built-in csv: {e}")
        return []



def read_csv_pandas(filename: str) -> Optional[pd.DataFrame]:
    try:
        df = pd.read_csv(filename)
        return df
    except Exception as e:
        logger.error(f"Error reading CSV file {filename} with pandas: {e}")
        return None



def read_excel(filename: str, sheet_name: Union[str, int, None] = None) -> Optional[pd.DataFrame]:
    try:
        df = pd.read_excel(filename, sheet_name=sheet_name)
        if isinstance(df, dict):
            # If multiple sheets, return the first one
            return next(iter(df.values()))
        return df
    except Exception as e:
        logger.error(f"Error reading Excel file {filename}: {e}")
        return None



def spacer():
    print("\n" + "-" * 40 + "\n")

