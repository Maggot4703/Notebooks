---
name: notebook-refactor-minimal
description: "Use when refactoring a notebook into cleaner cells with minimal behavior change."
model: GPT-5.3-Codex
---

# Notebook Refactor Minimal

Goal:
- Improve notebook structure while preserving behavior.

Inputs:
- Notebook path
- Optional target style: teaching, production-demo, quick-experiment

Required output:
1. Proposed cell structure
2. What to merge, split, or move
3. Variables to localize to specific cells
4. Imports and setup normalization plan
5. Verification checklist

Constraints:
- No behavior change.
- No unnecessary metadata churn.
- Keep examples runnable top-to-bottom.
