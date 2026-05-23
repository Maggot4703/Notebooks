---
name: "Startup And Environment Troubleshooting"
description: "Use when debugging startup scripts, virtual environments, uv sync issues, Jupyter launch problems, activation scripts, or workspace environment mismatches in this repository. Enforce root-cause diagnosis, minimal targeted fixes, and verification of both file state and runtime behavior."
applyTo: ["startup*.txt", "**/startup*.txt", "*.sh", "**/*.sh"]
---

# Startup And Environment Troubleshooting

- Diagnose the root cause before editing startup or environment files. Do not default to broad resets when a targeted fix is sufficient.
- Apply the smallest viable change that resolves the mismatch or failure.
- After changes, verify both file state and runtime behavior, such as activation, prompt metadata, dependency sync, or launch success.
- Prefer the workspace's existing environment manager and avoid mixing package-management workflows inside one workspace.
- In this repository, prefer `uv` where it is already the primary workflow, and keep startup scripts aligned with the workspace they serve.
- Preserve intentional environment setup details, such as prompt naming and Jupyter configuration paths, unless the task explicitly requires changing them.
- Summaries should state the root cause, the targeted fix, and what was verified.