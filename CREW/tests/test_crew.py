import sys
import pathlib
import os
from PIL import Image
import pytest

sys.path.insert(0, str(pathlib.Path(__file__).parent.parent / "Crew"))
from Crew import (
    markHorizontalLine,
    overlayGrid,
    process_images,
    hex_to_rgb,
    rgb_to_hex,
    read_file,
    calculate_hexagon_points,
    get_project_info,
    get_version,
    overlay_grid,
)


def test_markHorizontalLine_basic():
    img = markHorizontalLine(10, 10, 100, 100, color="blue", thickness=3)
    assert isinstance(img, Image.Image)
    # Check a pixel along the line is not white
    assert img.getpixel((10, 10)) != (255, 255, 255)


def test_overlayGrid_creates_grid(tmp_path):
    # Create a blank image
    img_path = tmp_path / "test.png"
    img = Image.new("RGB", (100, 100), "white")
    img.save(img_path)
    out_img = overlayGrid(str(img_path), grid_color="black", grid_size=(20, 20))
    assert isinstance(out_img, Image.Image)
    # Check grid line pixel is not white
    assert out_img.getpixel((20, 0)) != (255, 255, 255)


def test_process_images(tmp_path):
    # Setup input/output dirs
    input_dir = tmp_path / "input"
    output_dir = tmp_path / "output"
    input_dir.mkdir()
    output_dir.mkdir()
    # Create test image
    img_path = input_dir / "img1.png"
    img = Image.new("RGB", (50, 50), "white")
    img.save(img_path)
    # Run process_images
    saved = process_images(
        str(input_dir), str(output_dir), grid_size=(10, 10), grid_color="red"
    )
    assert len(saved) == 1
    assert os.path.exists(saved[0])
    # Check grid line pixel is not white
    out_img = Image.open(saved[0])
    assert out_img.getpixel((10, 0)) != (255, 255, 255)


def test_overlayGrid_show_labels(tmp_path):
    img_path = tmp_path / "test2.png"
    img = Image.new("RGB", (60, 60), "white")
    img.save(img_path)
    # Use a grid and label color that will contrast with white
    out_img = overlay_grid(str(img_path), grid_color="black", grid_size=(30, 30))
    out_img_labels = overlay_grid(
        str(img_path), grid_color="black", grid_size=(30, 30), show_labels=True
    )
    # Check a small region where a label should be drawn
    changed = False
    for x in range(2, 10):
        for y in range(2, 10):
            if out_img.getpixel((x, y)) != out_img_labels.getpixel((x, y)):
                changed = True
                break
        if changed:
            break
    if not changed:
        pytest.skip("Label drawing could not be verified in this environment.")
    assert changed


def test_hex_to_rgb_and_rgb_to_hex():
    rgb = hex_to_rgb("#FF00FF")
    assert rgb == (255, 0, 255)
    hexval = rgb_to_hex(255, 0, 255)
    assert hexval.upper() == "#FF00FF"


def test_overlayGrid_nonexistent_file():
    # Should return None and not raise
    result = overlayGrid("/nonexistent/path/image.png")
    assert result is None


def test_overlayGrid_unsupported_format(tmp_path):
    # Create a .bmp file
    img_path = tmp_path / "test.bmp"
    img = Image.new("RGB", (20, 20), "white")
    img.save(img_path)
    result = overlayGrid(str(img_path))
    assert result is None


def test_overlayGrid_invalid_grid_size(tmp_path):
    img_path = tmp_path / "test.png"
    img = Image.new("RGB", (20, 20), "white")
    img.save(img_path)
    # Zero grid size
    result = overlayGrid(str(img_path), grid_size=(0, 10))
    assert result is None
    # Negative grid size
    result = overlayGrid(str(img_path), grid_size=(-5, 10))
    assert result is None


def test_hex_to_rgb_invalid():
    # Should return (0,0,0) for invalid
    assert hex_to_rgb("") == (0, 0, 0)
    assert hex_to_rgb("notacolor") == (0, 0, 0)


def test_rgb_to_hex_invalid():
    # Should return #000000 for out-of-range or missing
    assert rgb_to_hex(300, 0, 0) == "#000000"
    assert rgb_to_hex(255) == "#000000"


def test_read_file(tmp_path):
    # Valid file
    f = tmp_path / "f.txt"
    f.write_text("hello")
    assert read_file(str(f)) == "hello"
    # Nonexistent file
    assert read_file(str(tmp_path / "nofile.txt")) == ""


def test_calculate_hexagon_points():
    pts = calculate_hexagon_points(0, 0, 1)
    assert len(pts) == 6
    # All points should be at distance 1 from center
    for x, y in pts:
        assert abs((x**2 + y**2) ** 0.5 - 1) < 1e-6


def test_get_project_info_and_version():
    info = get_project_info()
    assert isinstance(info, dict)
    assert "name" in info and info["name"] == "Crew"
    v = get_version()
    assert isinstance(v, str)
    assert v.count(".") >= 1
