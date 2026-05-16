#!/usr/bin/env python3
"""
index_workspace.py

Recursively scans the workspace, generates:
- INDEX.md (Markdown index of all files/folders)
- tags.json (metadata/tags for each file)

Usage: python index_workspace.py [root_folder]
"""

import json
import os
import sys
from datetime import datetime

# Tagging rules (customize as needed)
TAG_RULES = [
    (lambda f: f.endswith(".py"), "type:python"),
    (lambda f: f.endswith(".md"), "type:markdown"),
    (lambda f: f.endswith(".txt"), "type:text"),
    (lambda f: f.endswith(".csv"), "type:csv"),
    (lambda f: f.endswith(".ipynb"), "type:notebook"),
    (lambda f: f.endswith(".html"), "type:html"),
    (lambda f: os.path.isdir(f), "type:folder"),
]


def get_tags(path):
    tags = []
    for rule, tag in TAG_RULES:
        try:
            if rule(path):
                tags.append(tag)
        except Exception:
            pass
    return tags


def scan_dir(root):
    index = []
    tags = {}
    for dirpath, dirnames, filenames in os.walk(root):
        rel_dir = os.path.relpath(dirpath, root)
        if rel_dir == ".":
            rel_dir = ""
        # Add directory itself
        dir_entry = os.path.join(rel_dir, "") if rel_dir else ""
        if dir_entry:
            tags[dir_entry] = get_tags(dirpath)
        # Add files
        for fname in sorted(filenames):
            fpath = os.path.join(rel_dir, fname) if rel_dir else fname
            index.append(fpath)
            tags[fpath] = get_tags(os.path.join(dirpath, fname))
    return index, tags


def write_markdown_index(index, out_path):
    with open(out_path, "w", encoding="utf-8") as f:
        f.write(f"# Workspace Index\n\nGenerated: {datetime.now()}\n\n")
        last_dir = None
        for path in index:
            parts = path.split(os.sep)
            indent = "  " * (len(parts) - 1)
            f.write(f"{indent}- {parts[-1]}\n")


def write_tags(tags, out_path):
    with open(out_path, "w", encoding="utf-8") as f:
        json.dump(tags, f, indent=2)


def main():
    root = sys.argv[1] if len(sys.argv) > 1 else os.getcwd()
    index, tags = scan_dir(root)
    write_markdown_index(index, os.path.join(root, "INDEX.md"))
    write_tags(tags, os.path.join(root, "tags.json"))
    print(f"Indexed {len(index)} files. See INDEX.md and tags.json.")


if __name__ == "__main__":
    main()
