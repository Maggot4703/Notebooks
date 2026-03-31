from __future__ import annotations

import importlib
import shutil
import subprocess
import sys


REQUIRED_COMMANDS = ("node", "npm")
REQUIRED_MODULES = {
    "ipykernel": "ipykernel",
    "jupyterlab": "jupyterlab",
}


def _get_command_version(command: str) -> str:
    result = subprocess.run(
        [command, "--version"],
        check=True,
        capture_output=True,
        text=True,
    )
    return result.stdout.strip() or result.stderr.strip()


def _check_commands() -> list[str]:
    missing_commands: list[str] = []
    for command in REQUIRED_COMMANDS:
        if shutil.which(command) is None:
            missing_commands.append(command)
    return missing_commands


def _check_modules() -> list[str]:
    missing_modules: list[str] = []
    for package_name, module_name in REQUIRED_MODULES.items():
        try:
            importlib.import_module(module_name)
        except ModuleNotFoundError:
            missing_modules.append(package_name)
    return missing_modules


def main() -> int:
    missing_commands = _check_commands()
    missing_modules = _check_modules()

    if missing_commands or missing_modules:
        print("IDE workspace dependency check failed.")

        if missing_commands:
            print("Missing system tools:")
            for command in missing_commands:
                print(f"- {command}")

        if missing_modules:
            print("Missing Python packages:")
            for module_name in missing_modules:
                print(f"- {module_name}")

        print(
            "Run `uv sync` in /home/me/Notebooks/IDE "
            "to install the Python dependencies."
        )
        return 1

    print("IDE workspace dependency check passed.")
    for command in REQUIRED_COMMANDS:
        print(f"{command}: {_get_command_version(command)}")
    print(f"python: {sys.version.split()[0]}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
