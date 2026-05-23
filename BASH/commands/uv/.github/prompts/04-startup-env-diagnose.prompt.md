---
name: startup-env-diagnose
description: "Use when startup scripts, uv sync, activation, or Jupyter launch behavior is failing."
model: GPT-5.3-Codex
---

# Startup Environment Diagnose

Goal:
- Find and fix startup and environment mismatches with minimal changes.

Inputs:
- Workspace area
- Error text
- Command that failed

Required output:
1. Top 3 likely root causes ranked
2. Evidence for each cause
3. Smallest viable fix for each cause
4. Recommended fix with rationale
5. Verification commands and expected results

Constraints:
- Avoid broad resets.
- Keep package manager usage consistent.
- Prefer targeted, reversible changes.
