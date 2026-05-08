# CREW Design Plans

This directory holds design-time plans and workflow notes for the Crew project.
Production behavior still lives in `../Crew/`.

## How to use this folder

- Put active design plans here when they describe upcoming work or explain current architecture.
- Keep dated logs, CSVs, and generated artifacts clearly separated from living plans.
- When a plan refers to current behavior, verify it against `CREW/Crew/` and the current docs before treating it as authoritative.

## Current high-value references

- [crew_gui_workflow_and_conversation_log.md](crew_gui_workflow_and_conversation_log.md) - current GUI workflow summary and design notes
- [code_improvement_and_testing_plan.md](code_improvement_and_testing_plan.md) - code quality and testing plan
- [crew_test_coverage_and_gaps.md](crew_test_coverage_and_gaps.md) - testing gaps and observations

## Notes on historical artifacts

Some files here are historical snapshots, dated exports, or planning scratch files.
Examples include dated CSVs, logs, and `*_code.py` sketches. Keep them for reference,
but do not treat them as the current production workflow without re-verifying them.

## Validation references

Use the production project commands when a plan needs verification:

```bash
cd /home/me/Notebooks/CREW/Crew
uv sync
uv run python Crew.py
pytest
flake8 .
black .
```
