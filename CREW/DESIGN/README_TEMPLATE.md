# Crew Project Documentation Template

## Overview

Crew is an image processing and crew management application with both CLI and GUI interfaces. It supports grid overlay, image cropping, CSV/Excel reading, and more.

## Table of Contents

- [Overview](#overview)
- [Installation](#installation)
- [Usage](#usage)
  - [CLI Usage](#cli-usage)
  - [GUI Usage](#gui-usage)
- [Features](#features)
- [Configuration](#configuration)
- [API Reference](#api-reference)
- [Testing](#testing)
- [Contributing](#contributing)
- [License](#license)

## Installation

Describe how to install dependencies and set up the environment.

```
pip install -r requirements.txt
# or use your preferred environment manager
```

## Usage

### CLI Usage

Show how to use the CLI commands:

```
python Crew.py --help
python Crew.py grid-image --image-path <path> --output-path <path>
python Crew.py grid-folder --image-dir <dir> --output-dir <dir>
python Crew.py read-csv --csv-path <path>
python Crew.py read-excel --excel-path <path> [--sheet <name>]
python Crew.py crop-csv --image-path <path> --annotations-csv <path> --output-dir <dir>
```

### GUI Usage

Explain how to launch and use the GUI:

```
python Crew.py
```

## Features

- Overlay grids on images or folders of images
- Crop images using CSV annotations
- Read and preview CSV/Excel files
- GUI and CLI modes
- Logging and progress tracking

## Configuration

Describe any configuration files or environment variables.

## API Reference

Document key functions and modules (example):

- `mark_line(image, x1, y1, x2, y2, color, thickness)`
- `overlay_grid(image_path, grid_color, grid_size, show_labels)`
- `crop_from_annotations(image_path, annotations_csv, output_dir, ...)`
- `log_progress_md(message)`

## Testing

How to run tests:

```
python -m unittest discover
```

## Contributing

Guidelines for contributing to the project.

## License

MIT License
