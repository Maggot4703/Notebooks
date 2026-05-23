# CREW GUI Workflow and Conversation Log

## GUI Workflow Overview

This summary reflects the current production Crew Manager app in `CREW/Crew/gui.py`.

### 1. Application startup

- `Crew.py` launches the main application and restores saved window state.
- The GUI loads configuration, restores layout choices, and attempts to load default data such as `data/npcs.csv`.
- Status messages report progress through startup and auto-import behavior.

### 2. Main working surfaces

- **Data view:** tabular browsing, filtering, sorting, and column visibility changes
- **Details panel:** selected-record details and text content
- **Scripts menu:** access to script-based automation from the project
- **Chat surfaces:** Crew Chatbot and Crew Multi-User Chat workflows
- **Speech features:** live TTS reads selected text, status, details, and test phrases

### 3. Help and documentation flow

- The Help menu now links to the local project README, docs index, ReadMine guide, and ReadMine output notes.
- This makes `CREW/Crew/README.md`, `CREW/docs/fetchdocs_readmine.md`, and `CREW/Crew/Reading Now/README.md` part of the normal support path instead of side docs.

### 4. Speech settings and TTS behavior

- Speech Settings is a current, user-facing configuration dialog for TTS and STT settings.
- Live TTS uses a short lead-in pause before playback so the first words are easier to catch.
- The dialog now includes voice, speed, volume, lead-in, and speech-recognition controls.

### 5. ReadMine workflow touchpoints

- `ReadMine.py` is the production documentation-fetch implementation.
- Current production output is beginner-only by default, with stale intermediate and advanced directories pruned during refresh.
- The generated output tree under `CREW/Crew/Reading Now/` has its own README and is referenced by the GUI help/docs flow.

### 6. Logging and status

- The app logs startup and operational status through the normal logging flow.
- Status-bar updates are an important part of the user workflow and should be preserved in future design plans.

---

## Conversation log

### 2026-04-13

- Reviewed the DESIGN folder structure and documented how AGENTS, JOBS, PLANS, RULES, SKILLS, and NOTEBOOKS connect.
- Captured a high-level Crew GUI workflow for onboarding and design reference.

### 2026-05-08 sync note

- Updated this summary to match the current production Crew app.
- Added the current Help menu docs flow, Speech Settings behavior, TTS lead-in note, and ReadMine beginner-only output model.

---

Use this file as a design reference. Re-verify it when major GUI workflow changes land in `CREW/Crew/gui.py`.
