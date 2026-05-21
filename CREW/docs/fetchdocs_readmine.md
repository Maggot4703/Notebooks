# FetchDocs (ReadMine) User Guide

## Overview

ReadMine is the documentation-generation workflow integrated into Crew Manager. It reads subjects from `read_books.txt`, fetches or synthesizes learning notes, and writes a browsable documentation tree under `CREW/Crew/Reading Now`.

Current behavior is intentionally **beginner-first**: ReadMine now generates **beginner-only** content by default and removes stale `intermediate/` and `advanced/` folders from existing output.

## What ReadMine Generates

For each subject, ReadMine writes:

- `Reading Now/<Subject>/index.html`
- `Reading Now/<Subject>/beginner/theory.txt`
- `Reading Now/<Subject>/beginner/usage.txt`
- `Reading Now/<Subject>/beginner/examples.txt`
- `Reading Now/<Subject>/beginner/theory.meta.json`
- `Reading Now/<Subject>/beginner/usage.meta.json`
- `Reading Now/<Subject>/beginner/examples.meta.json`
- `Reading Now/<Subject>/beginner/theory_links.txt`
- `Reading Now/<Subject>/beginner/usage_links.txt`
- `Reading Now/<Subject>/beginner/examples_links.txt`

The `index.html` file links to the generated beginner content, metadata, and reference links for that subject.

## GUI Usage

1. Launch Crew Manager from `CREW/Crew/Crew.py`.
2. Open **Fetch Docs (ReadMine)** from the menu.
3. ReadMine runs in the background and updates the Crew status bar.
4. When it finishes, Crew shows a concise summary such as generated, skipped, and failed item counts.

Crew writes output to:

```text
CREW/Crew/Reading Now
```

## CLI Usage

Run ReadMine directly from the Crew project:

```bash
cd /home/me/Notebooks/CREW/Crew
python ReadMine.py
```

Useful options:

```bash
python ReadMine.py --no-web
python ReadMine.py --force
python ReadMine.py --json-summary
python ReadMine.py --base-dir "Reading Now"
python ReadMine.py --progress-file readmine_progress.json
python ReadMine.py --subjects-file read_books.txt
```

### CLI Options

| Option | Purpose |
| --- | --- |
| `--no-web` | Disable web fetching and generate stub content only |
| `--force` | Regenerate files even when output already exists |
| `--json-summary` | Print machine-readable JSON summary |
| `--base-dir PATH` | Write docs to a different output directory |
| `--progress-file PATH` | Use a different progress JSON file |
| `--subjects-file PATH` | Use a different subject list |

## Subject Input Format (`read_books.txt`)

ReadMine reads one subject per line from:

```text
CREW/Crew/read_books.txt
```

Each line can contain a subject name plus optional pipe-separated fields:

```text
Subject Name | source=mdn,python-docs | tags=frontend,reference | difficulty=medium | https://example.com/page
```

Supported patterns:

- plain subject name
- `source=` or `sources=` for preferred documentation sources
- `tag=` or `tags=` for freeform tags
- `url=` or `urls=` for explicit URLs
- any other `key=value` pair as subject metadata
- a bare `https://...` URL
- a bare known source token such as `mdn` or `python-docs`

Examples:

```text
CSS
JSON | source=python-docs,mdn | tags=data,serialization
Docker | source=docker-docs | difficulty=beginner
uv | https://docs.astral.sh/uv/
Markdown | tags=writing,formatting | audience=docs
```

Known source names include:

- `custom`
- `docker-docs`
- `git-docs`
- `github-docs`
- `markdownguide`
- `mcp-docs`
- `mdn`
- `pandas-docs`
- `pillow-docs`
- `programiz`
- `python-docs`
- `sqlite-docs`
- `streamlit-docs`
- `tkdocs`
- `tcl-docs`
- `uv-docs`
- `w3schools`

## Progress and Resume Behavior

ReadMine tracks work in:

```text
CREW/Crew/readmine_progress.json
```

That file records:

- completed subjects
- completed items
- per-item status (`generated`, `skipped`, `failed`)
- output, metadata, and links paths
- source information and fetch errors

On rerun:

- existing valid outputs are usually **skipped**
- failed items can be retried
- `--force` overrides skipping and regenerates outputs
- stale progress entries for removed output levels are cleaned up

## Generated Content Notes

- **Fetched content** comes from supported documentation sources when available.
- **Stub content** is generated when fetching fails or web access is disabled.
- Metadata files (`*.meta.json`) capture source, status, timestamps, and fetch details.
- Links files (`*_links.txt`) store reference URLs used for that content type.

## Output Shape and Legacy Files

The current ReadMine layout is:

```text
Reading Now/<Subject>/beginner/
```

Older folders such as:

```text
Reading Now/<Subject>/intermediate/
Reading Now/<Subject>/advanced/
```

are now removed by the current ReadMine flow.

You may still see subject-root files such as:

- `theory.txt`
- `usage.txt`
- `examples.txt`
- `links.txt`

Those are **legacy artifacts from older fetch-docs flows**, not the primary output shape of the current production ReadMine generator.

## Refreshing Docs Cleanly

Recommended commands:

```bash
cd /home/me/Notebooks/CREW/Crew

# Fast local refresh using stub content only
python ReadMine.py --no-web

# Rebuild everything even if outputs already exist
python ReadMine.py --force

# Rebuild with no web fetches and overwrite existing files
python ReadMine.py --no-web --force
```

Use:

- `--no-web` when you want stable local output quickly
- `--force` when you want to replace skipped files and refresh all generated content
- `--json-summary` when another tool needs structured output

After a refresh, check `Reading Now/<Subject>/index.html` and the `beginner/` folder for the current generated files.

## Troubleshooting

- If fetched docs are sparse or missing, rerun with web access enabled and check source availability.
- If you want a clean rebuild, use `--force`.
- If progress seems stuck on old state, inspect `readmine_progress.json`.
- If older folders reappear, confirm you are running `CREW/Crew/ReadMine.py`, not one of the backup or experimental copies under `xCrew`, `xxCrew`, or `BACKUP/CREW`.

## Production vs Backup Copies

The production ReadMine workflow lives in:

```text
CREW/Crew/ReadMine.py
```

You may also see copies under:

- `CREW/xCrew/`
- `CREW/xxCrew/`
- `BACKUP/CREW/...`

Those are backup, experimental, or historical copies and should not be treated as the current source of truth for Crew Manager documentation generation unless you are intentionally working in those branches of the project.

## Developer Notes

- Production implementation: [`CREW/Crew/ReadMine.py`](../Crew/ReadMine.py)
- GUI integration: [`CREW/Crew/gui.py`](../Crew/gui.py)
- Tests: `CREW/Crew/tests/test_readmine_features.py`, `CREW/Crew/tests/test_readmine_progress.py`

This guide should be updated whenever ReadMine changes its output structure, CLI, or resume behavior.
