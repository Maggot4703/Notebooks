# Copilot instructions for this repository

## Commands

```bash
pipenv install --skip-lock
```

Install the project dependencies declared in `Pipfile`.

```bash
pipenv run python -m pip install "crewai[tools]"
```

Optional extra install if a change needs the CrewAI tools extras mentioned in `README.md`.

```bash
PYTHONPATH=src pipenv run python -m crewai_skill_demo.demo
```

Primary validation command for this starter. It runs the local demo module and exercises `WorldLookupTool` directly.

There is no dedicated test, lint, or build configuration in the repository today. When adding code, keep the demo runnable and use the same `PYTHONPATH=src` pattern for any ad hoc module execution.

## Architecture

This repository is a minimal CrewAI skill starter, not a full crew application. The reusable logic lives in `src/crewai_skill_demo/tools/` as custom CrewAI tools, and `src/crewai_skill_demo/demo.py` is a tiny local entry point that instantiates a tool directly for validation.

`src/crewai_skill_demo/tools/world_lookup_tool.py` shows the intended pattern for skills in this repo: define a `pydantic` input model, subclass `crewai.tools.BaseTool`, set `name`, `description`, and `args_schema`, then implement `_run(...)`. The current example uses an in-memory `_WORLD_DATA` catalogue so the demo works without external services.

`src/crewai_skill_demo/tools/__init__.py` re-exports tool classes. Preserve that pattern when adding new tools so imports stay short and the package remains easy to browse.

`.env.example` is only for future real crew runs that need provider credentials. The included demo is intentionally local and does not wire agents, tasks, or a full `Crew`.

## Conventions

- Use the `src/` layout consistently. Imports assume `PYTHONPATH=src` for local execution.
- Treat `Pipfile` as the dependency source of truth. `Pipfile.lock` is currently empty, so setup/debugging work should start from `Pipfile` rather than assuming the lockfile is authoritative.
- Treat a reusable CrewAI "skill" as a custom tool in this codebase. New skills should follow the `BaseTool` pattern in `world_lookup_tool.py` rather than introducing a separate abstraction.
- Give each tool an explicit `pydantic` args schema even for simple inputs. That is the established pattern in both the source and `README.md`.
- Keep the demo module lightweight and local-first. Validate a tool by instantiating it directly in `demo.py` before wiring it into a real agent or crew.
- If you add a new tool module under `src/crewai_skill_demo/tools/`, also export it from `src/crewai_skill_demo/tools/__init__.py`.
- For real crew execution, expect users to copy `.env.example` to `.env` and provide model configuration there instead of hardcoding credentials in Python files.
