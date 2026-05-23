# Skill: detect-lines

## Purpose
Detects black lines in an image using OpenCV. Highlights detected lines and saves the result.

## Usage
- Place the image (e.g., Cars6.png) in the working directory.
- Run `detect_lines.py` to process the image.
- The output image with detected lines will be saved as `Cars6_black_lines_detected.png`.

## Parameters
- Input image filename (default: Cars6.png)
- Thresholds for binarization and edge detection can be tuned in the script.

## Example
```bash
python detect_lines.py
```

## Output
- `Cars6_black_lines_detected.png` with red lines over detected black lines.

## Requirements
- Python 3
- opencv-python
- numpy
