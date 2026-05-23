---
name: notebook-review
description: "Use when reviewing notebook quality, execution order, metadata consistency, and reproducibility."
model: GPT-5.3-Codex
---

# Notebook Review

Goal:
- Assess reliability and maintainability of a notebook.

Inputs:
- Notebook path
- Optional focus area: execution order, outputs, metadata, portability

Required output:
1. Executive summary in 3-5 lines
2. Findings grouped by severity: high, medium, low
3. Cell-by-cell issues using 1-based cell numbers
4. Minimal remediation plan
5. Residual risk after fixes

Constraints:
- Do not rewrite the whole notebook.
- Prefer minimal changes.
- Preserve existing intent and teaching flow.
