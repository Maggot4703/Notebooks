#!/usr/bin/env python3
"""
T5-test: Unified entrypoint for CardCutter + Crew functionality
"""

import argparse
import sys

from t5_shared import (
    DEFAULT_GRID_COLOR,
    DEFAULT_GRID_SIZE,
    mark_line,
    overlay_grid,
    read_csv_pandas,
    read_excel,
)


# Example CLI: grid-image, read-csv, read-excel, mark-line
def create_cli_parser():

    parser = argparse.ArgumentParser(description="T5-test CLI (CardCutter + Crew)")
    subparsers = parser.add_subparsers(dest="command")

    # Show docs/help for a TRAVELLERMAP script
    docs_tm_script_cmd = subparsers.add_parser(
        "travellermap-script-docs",
        help="Show help or docstring for a TRAVELLERMAP script",
    )
    docs_tm_script_cmd.add_argument("script", help="Script name (e.g. export_image.py)")

    # List all available TRAVELLERMAP scripts
    subparsers.add_parser(
        "list-travellermap-scripts",
        help="List all available .py scripts in TRAVELLERMAP and scripts/",
    )

    # Generic: Run any TRAVELLERMAP script
    run_tm_script_cmd = subparsers.add_parser(
        "travellermap-script",
        help="Run any .py script from TRAVELLERMAP or TRAVELLERMAP/scripts",
    )
    run_tm_script_cmd.add_argument(
        "script", help="Script name (e.g. export_image.py or advanced_search_filter.py)"
    )
    run_tm_script_cmd.add_argument(
        "args", nargs=argparse.REMAINDER, help="Arguments to pass to the script"
    )

    # TravellerMap: Worlds for Subsector
    get_worlds_cmd = subparsers.add_parser(
        "get-worlds-for-subsector",
        help="Fetch worlds for a sector/subsector from TravellerMap API",
    )
    get_worlds_cmd.add_argument("sector", help="Sector name, e.g. 'Spinward Marches'")
    get_worlds_cmd.add_argument(
        "subsector", help="Subsector letter (A–P) or name, e.g. Vilis or F"
    )
    get_worlds_cmd.add_argument(
        "--json",
        dest="output_json",
        action="store_true",
        default=True,
        help="Print JSON array to stdout (default)",
    )
    get_worlds_cmd.add_argument(
        "--save",
        dest="save_path",
        metavar="PATH",
        default=None,
        help="Write JSON array to this file path instead of stdout",
    )

    # TravellerMap: Count Military Bases
    count_bases_cmd = subparsers.add_parser(
        "count-military-bases",
        help="List/count military bases by allegiance in a sector",
    )
    count_bases_cmd.add_argument(
        "sector", nargs="*", help="Sector name (default: prompt)"
    )

    # TravellerMap: Check API Version
    subparsers.add_parser("check-api-version", help="Show TravellerMap API version")

    # TravellerMap: Check Data Schema
    schema_cmd = subparsers.add_parser(
        "check-data-schema", help="Show sector .tab schema fields"
    )
    schema_cmd.add_argument(
        "--sector", default="Vland", help="Sector name (default: Vland)"
    )

    subparsers.add_parser(
        "travellermap", help="Launch TravellerMap main module (GUI or CLI)"
    )

    # --- Microphone/audio commands ---
    record_audio_cmd = subparsers.add_parser(
        "record-audio", help="Record microphone input to a WAV file"
    )
    record_audio_cmd.add_argument("output_path", help="Output WAV file path")
    record_audio_cmd.add_argument(
        "--duration",
        type=int,
        default=10,
        help="Recording duration in seconds (default: 10)",
    )

    speech_to_text_cmd = subparsers.add_parser(
        "speech-to-text", help="Transcribe microphone input to text"
    )
    speech_to_text_cmd.add_argument(
        "--duration", type=int, default=10, help="Max duration to listen (seconds)"
    )
    speech_to_text_cmd.add_argument("--output", help="Optional output text file")

    grid_image = subparsers.add_parser("grid-image", help="Overlay grid on image")
    grid_image.add_argument("image_path")
    grid_image.add_argument("output_path")
    grid_image.add_argument("--grid-width", type=int, default=DEFAULT_GRID_SIZE[0])
    grid_image.add_argument("--grid-height", type=int, default=DEFAULT_GRID_SIZE[1])
    grid_image.add_argument("--grid-color", default=DEFAULT_GRID_COLOR)
    grid_image.add_argument("--labels", action="store_true")

    read_csv_cmd = subparsers.add_parser("read-csv", help="Read CSV and print preview")
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
    if args.command == "travellermap-script-docs":
        import os
        import runpy
        import sys as _sys

        tm_dir = "/home/me/Notebooks/TRAVELLERMAP"
        scripts_dir = os.path.join(tm_dir, "scripts")
        utils_dir = os.path.join(scripts_dir, "utils")
        candidates = [
            os.path.join(tm_dir, args.script),
            os.path.join(scripts_dir, args.script),
            os.path.join(utils_dir, args.script),
        ]
        script_path = None
        for path in candidates:
            if os.path.isfile(path):
                script_path = path
                break
        if not script_path:
            print(f"Script not found: {args.script}")
            return 1
        # Try to print docstring
        try:
            with open(script_path, "r") as f:
                lines = f.readlines()
            doc = None
            if lines and lines[0].startswith("#!"):
                lines = lines[1:]
            if lines and lines[0].strip().startswith('"""'):
                doc = lines[0].strip().strip('"')
                # Multi-line docstring
                for line in lines[1:]:
                    if line.strip().endswith('"""'):
                        doc += "\n" + line.strip().strip('"')
                        break
                    doc += "\n" + line.rstrip()
            if doc:
                print(f"Docstring for {args.script}:\n{doc}")
                return 0
        except Exception:
            pass
        # Try --help
        try:
            import subprocess

            result = subprocess.run(
                [_sys.executable, script_path, "--help"],
                capture_output=True,
                text=True,
                timeout=5,
            )
            print(result.stdout)
            return 0
        except Exception as e:
            print(f"Could not get docs for {args.script}: {e}")
            return 1
    if args.command == "list-travellermap-scripts":
        import os

        tm_dir = "/home/me/Notebooks/TRAVELLERMAP"
        scripts_dir = os.path.join(tm_dir, "scripts")
        utils_dir = os.path.join(scripts_dir, "utils")

        def find_py_scripts(folder):
            return [
                f
                for f in os.listdir(folder)
                if f.endswith(".py") and os.path.isfile(os.path.join(folder, f))
            ]

        scripts = set()
        for folder in [tm_dir, scripts_dir, utils_dir]:
            if os.path.isdir(folder):
                for f in find_py_scripts(folder):
                    scripts.add(f)
        scripts = sorted(scripts)
        print("Available TRAVELLERMAP scripts:")
        for s in scripts:
            print(f"  {s}")
        return 0
    if args.command == "travellermap-script":
        # Try to find the script in TRAVELLERMAP or TRAVELLERMAP/scripts
        import os

        tm_dir = "/home/me/Notebooks/TRAVELLERMAP"
        scripts_dir = os.path.join(tm_dir, "scripts")
        utils_dir = os.path.join(scripts_dir, "utils")
        candidates = [
            os.path.join(tm_dir, args.script),
            os.path.join(scripts_dir, args.script),
            os.path.join(utils_dir, args.script),
        ]
        script_path = None
        for path in candidates:
            if os.path.isfile(path):
                script_path = path
                break
        if not script_path:
            print(f"Script not found: {args.script}")
            return 1
        sys_argv = [script_path] + args.args
        import runpy
        import sys as _sys

        old_argv = _sys.argv
        _sys.argv = sys_argv
        try:
            runpy.run_path(script_path, run_name="__main__")
        except Exception as e:
            print(f"Error running {args.script}: {e}")
            return 1
        finally:
            _sys.argv = old_argv
        return 0
    if args.command == "get-worlds-for-subsector":
        sys.path.append("/home/me/Notebooks/TRAVELLERMAP")
        import get_worlds_for_subsector

        sys_argv = ["get_worlds_for_subsector.py", args.sector, args.subsector]
        if args.output_json:
            sys_argv.append("--json")
        if args.save_path:
            sys_argv.extend(["--save", args.save_path])
        import sys as _sys

        old_argv = _sys.argv
        _sys.argv = sys_argv
        try:
            get_worlds_for_subsector.main()
        finally:
            _sys.argv = old_argv
        return 0

    if args.command == "count-military-bases":
        sys.path.append("/home/me/Notebooks/TRAVELLERMAP")
        import sys as _sys

        import count_military_bases

        sys_argv = ["count_military_bases.py"] + args.sector
        old_argv = _sys.argv
        _sys.argv = sys_argv
        try:
            count_military_bases.main()
        finally:
            _sys.argv = old_argv
        return 0

    if args.command == "check-api-version":
        sys.path.append("/home/me/Notebooks/TRAVELLERMAP")
        import check_travellermap_api_version

        check_travellermap_api_version.get_api_version()
        return 0

    if args.command == "check-data-schema":
        sys.path.append("/home/me/Notebooks/TRAVELLERMAP")
        import check_travellermap_data_schema

        check_travellermap_data_schema.get_sector_schema(args.sector)
        return 0

    if args.command == "travellermap":
        sys.path.append("/home/me/Notebooks/TRAVELLERMAP")
        from main import main as travellermap_main

        travellermap_main()
        return 0

    if args.command == "record-audio":
        try:
            import numpy as np
            import scipy.io.wavfile as wav
            import sounddevice as sd
        except ImportError:
            print(
                "Please install sounddevice and scipy: pip install sounddevice scipy numpy"
            )
            return 1
        samplerate = 16000
        duration = args.duration
        print(f"Recording {duration} seconds of audio...")
        try:
            audio = sd.rec(
                int(duration * samplerate),
                samplerate=samplerate,
                channels=1,
                dtype="int16",
            )
            sd.wait()
            wav.write(args.output_path, samplerate, audio)
            print(f"Saved recording to {args.output_path}")
            return 0
        except Exception as e:
            print(f"Recording failed: {e}")
            return 1

    if args.command == "speech-to-text":
        try:
            import speech_recognition as sr
        except ImportError:
            print(
                "Please install speechrecognition and pyaudio: pip install speechrecognition pyaudio"
            )
            return 1
        recognizer = sr.Recognizer()
        try:
            with sr.Microphone() as source:
                print("Speak now...")
                audio = recognizer.listen(
                    source, timeout=args.duration, phrase_time_limit=args.duration
                )
            print("Transcribing...")
            text = recognizer.recognize_google(audio)
            print("Transcript:")
            print(text)
            if args.output:
                with open(args.output, "w") as f:
                    f.write(text)
                print(f"Transcript saved to {args.output}")
            return 0
        except sr.WaitTimeoutError:
            print("No speech detected (timeout). Try increasing --duration.")
            return 1
        except sr.UnknownValueError:
            print("Could not understand audio.")
            return 1
        except sr.RequestError as e:
            print(f"Speech recognition error: {e}")
            return 1
        except Exception as e:
            print(f"Microphone or recognition error: {e}")
            return 1

    if args.command == "dictate":
        sys.path.append("/home/me/Notebooks/DICTATE")
        from dictate import main as dictate_main

        dictate_main()
        return 0
    if args.command == "travellermap":
        sys.path.append("/home/me/Notebooks/TRAVELLERMAP")
        from main import main as travellermap_main

        travellermap_main()
        return 0
    if args.command == "run-0101":
        sys.path.append("/home/me/Notebooks/0101/0101/src/public_html")
        from server import main as server_main

        server_main()
        return 0
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
            None,
            args.x1,
            args.y1,
            args.x2,
            args.y2,
            color=args.color,
            thickness=args.thickness,
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
        import importlib.util
        import sys as _sys
        import tkinter as tk

        # Add Crew GUI directory to sys.path if not present
        crew_gui_dir = "/home/me/Notebooks/CREW/Crew"
        if crew_gui_dir not in _sys.path:
            _sys.path.insert(0, crew_gui_dir)
        spec = importlib.util.spec_from_file_location("gui", f"{crew_gui_dir}/gui.py")
        gui = importlib.util.module_from_spec(spec)
        spec.loader.exec_module(gui)
        root = tk.Tk()
        gui.CrewGUI(root)
        root.mainloop()
    except Exception as e:
        print(f"Failed to launch GUI: {e}")
        sys.exit(1)


if __name__ == "__main__":
    main()
