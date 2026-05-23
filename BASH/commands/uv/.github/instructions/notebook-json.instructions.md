---
name: "Notebook JSON Output"
description: "Use when creating, editing, or describing Jupyter notebooks in this workspace. Enforce JSON notebook structure, cell metadata expectations, and user-facing references by cell number instead of internal IDs."
applyTo: "**/*.ipynb"
---

# Notebook JSON Output Rules

- When generating notebook content directly, represent the notebook as a valid JSON object with a top-level `cells` array.
- Each cell must be a valid JSON object and include `metadata.language` that matches the cell content type, such as `markdown` or `python`.
- Preserve `metadata.id` for existing cells. New cells do not need an `id` unless the file already requires one.
- Keep notebook structure logically ordered and avoid unnecessary metadata churn.
- In user-facing messages, refer to notebook cells by 1-based cell number. Do not surface internal cell IDs.
- Prefer small, focused notebook edits and preserve the intent of existing cells unless the task requires restructuring.
- After substantial code-cell edits, run the affected cells when tools are available to confirm they execute cleanly.