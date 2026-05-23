# Plan 2: Agent Availability Tracking

## Scope
- Track agent status (Active, On Leave, Injured, etc.) in skills_db.csv.
- Filter assignments based on availability.

## Steps
1. Add 'availability' column to skills_db.csv.
2. Update assignment logic to exclude unavailable agents.
3. Add GUI/CLI display and edit for agent status.

## Files/Modules
- skills_db.csv, Crew.py, GUI code

## Verification
- Assignments only use available agents.
- Status changes reflected in UI and logs.
