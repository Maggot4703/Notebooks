---
description: "Use when editing Jupyter notebooks, Python files, or Pipfile in this workspace. Enforce reproducible notebook workflows, safe cell updates, and dependency consistency."
name: "JupyterLab Notebook Workflow"
applyTo: ["**/*.ipynb", "**/*.py", "Pipfile"]
---

# JupyterLab Workflow Rules

- Keep notebook runs reproducible: prefer deterministic cells, avoid hidden state dependencies, and run cells in logical order after edits.
- For notebook edits, preserve existing cell intent and metadata unless a task explicitly requires structural changes.
- When adding dependencies, update `Pipfile` (not ad-hoc install commands only) and keep versions compatible with Python 3.11.
- Prefer small, focused changes to notebook cells; avoid broad rewrites that make diffs hard to review.
- If code is moved from notebook cells into Python files, keep notebook examples minimal and make scripts the source of truth.
- Before finalizing substantial notebook changes, validate that edited code cells execute without errors.