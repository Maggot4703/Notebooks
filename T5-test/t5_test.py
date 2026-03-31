#!/usr/bin/env python3
"""
T5-test: Unified entrypoint for CardCutter + Crew functionality
"""

import sys
import argparse
from t5_shared import (
    overlay_grid, mark_line, read_csv_pandas, read_excel,
    DEFAULT_GRID_COLOR, DEFAULT_GRID_SIZE
)

# Example CLI: grid-image, read-csv, read-excel, mark-line



def create_cli_parser():
    parser = argparse.ArgumentParser(
        description="T5-test CLI (CardCutter + Crew)"
    )
    subparsers = parser.add_subparsers(dest="command")

    grid_image = subparsers.add_parser(
        "grid-image", help="Overlay a grid on one image"
    )
    grid_image.add_argument("image_path")
    grid_image.add_argument("output_path")
    grid_image.add_argument(
        "--grid-width", type=int, default=DEFAULT_GRID_SIZE[0]
    )
    grid_image.add_argument(
        "--grid-height", type=int, default=DEFAULT_GRID_SIZE[1]
    )
    grid_image.add_argument("--grid-color", default=DEFAULT_GRID_COLOR)
    grid_image.add_argument("--labels", action="store_true")

    read_csv_cmd = subparsers.add_parser(
        "read-csv", help="Read CSV and print preview"
    )
    read_csv_cmd.add_argument("csv_path")

    read_excel_cmd = subparsers.add_parser(
        "read-excel", help="Read Excel and print preview"
    )
    read_excel_cmd.add_argument("excel_path")
    read_excel_cmd.add_argument("--sheet")

    mark_line_cmd = subparsers.add_parser(
        "mark-line", help="Draw a line on a new image"
    )
    mark_line_cmd.add_argument("x1", type=int)
    mark_line_cmd.add_argument("y1", type=int)
    mark_line_cmd.add_argument("x2", type=int)
    mark_line_cmd.add_argument("y2", type=int)
    mark_line_cmd.add_argument("output_path")
    mark_line_cmd.add_argument("--color", default="red")
    mark_line_cmd.add_argument("--thickness", type=int, default=1)

    return parser



def run_cli(args: argparse.Namespace) -> int:
    if args.command == "grid-image":
        img = overlay_grid(
            args.image_path,
            grid_color=args.grid_color,
            grid_size=(args.grid_width, args.grid_height),
            show_labels=args.labels,
        )
        if img is None:
            print("Failed to process image.")
            return 1
        img.save(args.output_path)
        print(f"Saved: {args.output_path}")
        return 0
    if args.command == "read-csv":
        df = read_csv_pandas(args.csv_path)
        if df is not None:
            print(df.head())
        else:
            print("Could not read CSV.")
        return 0
    if args.command == "read-excel":
        df = read_excel(args.excel_path, sheet_name=args.sheet)
        if df is not None:
            print(df.head())
        else:
            print("Could not read Excel file.")
        return 0
    if args.command == "mark-line":
        img = mark_line(
            None, args.x1, args.y1, args.x2, args.y2,
            color=args.color, thickness=args.thickness
        )
        if img is None:
            print("Failed to create image with line.")
            return 1
        img.save(args.output_path)
        print(f"Saved: {args.output_path}")
        return 0
    print("No command provided. Use --help.")
    return 1



def main():
    parser = create_cli_parser()
    args = parser.parse_args()
    if args.command:
        sys.exit(run_cli(args))
    # No CLI command: try to launch GUI
    try:
        import sys as _sys
        import importlib.util
        import tkinter as tk
        gui_path = _sys.path.copy()
        # Add Crew GUI directory to sys.path if not present
        crew_gui_dir = '/home/me/Notebooks/CREW/Crew'
        if crew_gui_dir not in _sys.path:
            _sys.path.insert(0, crew_gui_dir)
        spec = importlib.util.spec_from_file_location('gui', f'{crew_gui_dir}/gui.py')
        gui = importlib.util.module_from_spec(spec)
        spec.loader.exec_module(gui)
        root = tk.Tk()
        app = gui.CrewGUI(root)
        root.mainloop()
    except Exception as e:
        print(f"Failed to launch GUI: {e}")
        sys.exit(1)



if __name__ == "__main__":
    main()
