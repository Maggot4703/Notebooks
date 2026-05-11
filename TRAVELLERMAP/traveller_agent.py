"""
traveller_agent.py
Auto-discovers and exposes all TRAVELLERMAP scripts as both CLI commands and Python callables.
"""
import os
import importlib.util
import runpy
from typing import Callable, Dict, Any


TRAVELLERMAP_DIR = os.path.expanduser("~/Notebooks/TRAVELLERMAP")
T5_SCRIPTS_DIRS = [
    os.path.join(TRAVELLERMAP_DIR, "scripts"),
    os.path.join(TRAVELLERMAP_DIR, "scripts", "utils"),
    TRAVELLERMAP_DIR
]

# CREW integration
CREW_SCRIPTS_BASE = os.path.expanduser("~/Notebooks/CREW/Crew/scripts")
CREW_SCRIPTS_DIRS = [CREW_SCRIPTS_BASE]
for root, dirs, files in os.walk(CREW_SCRIPTS_BASE):
    for d in dirs:
        CREW_SCRIPTS_DIRS.append(os.path.join(root, d))

class TravellerAgent:
    def __init__(self):
        self.registry: Dict[str, Dict[str, Any]] = {}
        self._discover_scripts()

    def _discover_scripts(self):
        """Scan for .py scripts in TRAVELLERMAP and CREW and register as commands and callables."""
        all_folders = T5_SCRIPTS_DIRS + CREW_SCRIPTS_DIRS
        for folder in all_folders:
            if not os.path.isdir(folder):
                continue
            for fname in os.listdir(folder):
                if fname.endswith('.py') and not fname.startswith('__'):
                    script_path = os.path.join(folder, fname)
                    # Prefix crew- for CREW scripts to avoid name collisions
                    if script_path.startswith(CREW_SCRIPTS_BASE):
                        cmd_name = 'crew-' + fname[:-3].replace('_', '-')
                        func_name = fname[:-3]
                    else:
                        cmd_name = fname[:-3].replace('_', '-')
                        func_name = fname[:-3]
                    self.registry[cmd_name] = {
                        'path': script_path,
                        'func': self._make_callable(script_path, func_name),
                        'doc': self._extract_doc(script_path)
                    }

    def _make_callable(self, script_path: str, func_name: str) -> Callable:
        def wrapper(*args, **kwargs):
            spec = importlib.util.spec_from_file_location(func_name, script_path)
            mod = importlib.util.module_from_spec(spec)
            spec.loader.exec_module(mod)
            if hasattr(mod, func_name):
                return getattr(mod, func_name)(*args, **kwargs)
            elif hasattr(mod, 'main'):
                return mod.main(*args, **kwargs)
            else:
                raise AttributeError(f"No callable found in {script_path}")
        return wrapper

    def _extract_doc(self, script_path: str) -> str:
        try:
            with open(script_path, 'r') as f:
                lines = f.readlines()
            if lines and lines[0].startswith('#!'):
                lines = lines[1:]
            if lines and lines[0].strip().startswith('"""'):
                doc = lines[0].strip().strip('"')
                for line in lines[1:]:
                    if line.strip().endswith('"""'):
                        doc += '\n' + line.strip().strip('"')
                        break
                    doc += '\n' + line.rstrip()
                return doc
        except Exception:
            pass
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
