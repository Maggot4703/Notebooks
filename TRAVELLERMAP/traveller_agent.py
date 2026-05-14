"""
traveller_agent.py
Auto-discovers and exposes all TRAVELLERMAP scripts as both CLI commands and Python callables.
"""
import os
import importlib.util
import ast
from typing import Callable, Dict, Any

# Determine paths relative to this file for robust operation in different environments
HERE = os.path.abspath(os.path.dirname(__file__))
REPO_ROOT = os.path.abspath(os.path.join(HERE, os.pardir))
TRAVELLERMAP_DIR = HERE
T5_SCRIPTS_DIRS = [
    os.path.join(TRAVELLERMAP_DIR, "scripts"),
    os.path.join(TRAVELLERMAP_DIR, "scripts", "utils"),
    TRAVELLERMAP_DIR,
]

# CREW integration: prefer repository-relative path, fall back to home-based path
CREW_SCRIPTS_BASE = os.path.join(REPO_ROOT, "CREW", "Crew", "scripts")
if not os.path.isdir(CREW_SCRIPTS_BASE):
    CREW_SCRIPTS_BASE = os.path.expanduser("~/Notebooks/CREW/Crew/scripts")

CREW_SCRIPTS_DIRS = [CREW_SCRIPTS_BASE] if os.path.isdir(CREW_SCRIPTS_BASE) else []
if os.path.isdir(CREW_SCRIPTS_BASE):
    for root, dirs, files in os.walk(CREW_SCRIPTS_BASE):
        for d in dirs:
            CREW_SCRIPTS_DIRS.append(os.path.join(root, d))


class TravellerAgent:
    def __init__(self):
        self.registry: Dict[str, Dict[str, Any]] = {}
        self._discover_scripts()

    def _discover_scripts(self):
        """Scan for .py scripts in TRAVELLERMAP and CREW and register as commands and callables."""
        all_folders = [p for p in (T5_SCRIPTS_DIRS + CREW_SCRIPTS_DIRS) if os.path.isdir(p)]
        for folder in all_folders:
            for fname in os.listdir(folder):
                if fname.endswith('.py') and not fname.startswith('__'):
                    script_path = os.path.join(folder, fname)
                    # Prefix crew- for CREW scripts to avoid name collisions
                    if os.path.abspath(script_path).startswith(os.path.abspath(CREW_SCRIPTS_BASE)):
                        cmd_name = 'crew-' + fname[:-3].replace('_', '-')
                        func_name = fname[:-3]
                    else:
                        cmd_name = fname[:-3].replace('_', '-')
                        func_name = fname[:-3]
                    self.registry[cmd_name] = {
                        'path': script_path,
                        'func': self._make_callable(script_path, func_name),
                        'doc': self._extract_doc(script_path),
                    }

    def _make_callable(self, script_path: str, func_name: str) -> Callable:
        def wrapper(*args, **kwargs):
            spec = importlib.util.spec_from_file_location(func_name, script_path)
            if spec is None or spec.loader is None:
                raise ImportError(f"Could not load module spec for {script_path}")
            mod = importlib.util.module_from_spec(spec)
            spec.loader.exec_module(mod)
            if hasattr(mod, func_name):
                return getattr(mod, func_name)(*args, **kwargs)
            if hasattr(mod, 'main'):
                return getattr(mod, 'main')(*args, **kwargs)
            raise AttributeError(f"No callable named {func_name} or main() in {script_path}")

        return wrapper

    def _extract_doc(self, script_path: str) -> str:
        try:
            with open(script_path, 'r', encoding='utf-8') as f:
                src = f.read()
            mod = ast.parse(src)
            doc = ast.get_docstring(mod) or ""
            return doc
        except Exception:
            return ""

    def list_skills(self):
        return list(self.registry.keys())

    def get_doc(self, cmd_name: str) -> str:
        return self.registry.get(cmd_name, {}).get('doc', '')

    def run(self, cmd_name: str, *args, **kwargs):
        if cmd_name not in self.registry:
            raise ValueError(f"Unknown skill: {cmd_name}")
        return self.registry[cmd_name]['func'](*args, **kwargs)


# Singleton instance
traveller_agent = TravellerAgent()
