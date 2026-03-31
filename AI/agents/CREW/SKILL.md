---
name: crew
description: >
  Use when working with the Traveller RPG crew roster, crew member roles, ship operations,
  or campaign planning for "The Travellers" setting. Covers role delegation, crew tasks,
  mission planning, and coordination across the Captain, Pilot, Navigator, Doctor, Chief
  Engineer, Technician, Gunner, and Trader agents. Also use when querying or updating
  crew data managed by the Crew Manager application (CSV, SQLite, GUI).
---

# CREW Skill

## Overview

The CREW skill coordinates a team of Traveller RPG crew agents. Each agent has a defined role, responsibilities, and skill set. The Captain is the top-level orchestrator; specialized agents handle domain-specific tasks.

**Crew Manager app:** `CREW/Crew/` — Python/tkinter GUI for crew data, CSV/Excel import, image overlays, and SQLite persistence.

---

## Crew Agents

### Captain
Highest authority on the vessel. Delegates to all other crew members. Use for overall mission planning, crew coordination, legal decisions, and final authority.

```
Captain → Pilot (navigation and helm)
        → Chief (engineering and maintenance)
        → Doctor (medical and health)
        → Navigator (route and charts)
        → Gunner (weapons and defense)
        → Trader (cargo and commerce)
        → Technician (systems and equipment)
```

### Pilot
Direct control and operation of the vessel. Use for jump calculations, in-system maneuvers, emergency flight, and communications with traffic control.

### Navigator
Route planning and position monitoring. Use for jump route selection, chart updates, hazard assessment, and passage timing.

### Doctor
Medical care and crew health. Use for treatment, medical supply management, health advisories, and emergency response.

### Chief Engineer
Engineering department management. Use for maintenance schedules, system repairs, power management, and technical compliance.

### Technician
Hands-on systems and equipment support. Use for equipment diagnostics, repair tasks, sensor operations, and technical support to the Chief.

### Gunner
Weapons systems and defense. Use for weapon maintenance, combat readiness, targeting, and tactical support.

### Trader
Cargo, procurement, and commerce. Use for trade route analysis, cargo manifests, supply procurement, and contract negotiation.

---

## Invoking Agents

### Single agent
```
@Captain: What is the current mission status?
@Pilot: Plot a jump route from Regina to Efate.
@Doctor: Review crew health status and flag any concerns.
```

### Orchestrated multi-agent workflow (via Captain)
```
@Captain: Prepare the ship for departure from Regina.
→ Captain delegates:
  - Navigator: confirm jump route
  - Chief: engineering pre-departure checklist
  - Doctor: crew health clearance
  - Gunner: weapons systems check
  - Trader: cargo manifest and customs clearance
```

### Todo-list task planning
Each agent can generate a structured todo list for their domain:
```
@Chief: Create a maintenance plan for the jump drive. Write a todo list.
@Doctor: Create a health plan for the voyage. Write a todo list.
```

---

## Crew Data (Crew Manager App)

The Crew Manager application manages the crew roster and associated data.

### Key files
| File | Purpose |
|------|---------|
| `data/Crew.csv` | Master crew roster (name, system, position, class, AI, module, vehicle, squad) |
| `data/CLASS.csv` | Character class records |
| `data/COMPANY.csv` | Crew company/unit names |
| `data/AI.csv` | AI companion assignments |
| `crew_data.db` | SQLite database (crew_members, groups, group_members) |
| `config.json` | Application settings |

### Running the app
```bash
cd /home/me/Notebooks/CREW/Crew

# Launch GUI
python run_gui.py

# CLI operations
python Crew.py grid-image --image-path <path> --output-path <path>
python Crew.py grid-folder --image-dir <dir> --output-dir <dir>
python Crew.py read-csv --csv-path <path>
python Crew.py crop-csv --image-path <path> --annotations-csv <path> --output-dir <dir>
```

### Database schema
```sql
-- Crew members
CREATE TABLE crew_members (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    rank TEXT,
    department TEXT,
    primary_skill TEXT,
    secondary_skill TEXT,
    experience INTEGER,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Groups / squads
CREATE TABLE groups (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL UNIQUE,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

---

## Crew Roster (Current Campaign)

| # | Name | Position | System | Class | AI | Module | Vehicle | Squad |
|---|------|----------|--------|-------|----|--------|---------|-------|
| 1 | Donal (PC) | Captain | — | — | — | Jump | grav-belt | — |
| 2 | Carl | Pilot | Regina | Navy | Nancy | Home | apcA | — |
| 3 | Terri | Navigator | ROUP | Scout | Sally | 1 | apcB | — |
| 4 | Andi | Doctor | Feri | Doctor | Debi | 2 | apcC | — |
| 5 | Raoul | Chief Eng. | Boughene | Army | Ali | 3 | apcD | — |
| 6 | Betti | Engineer | Efate | Army | Angel | 4 | apcE | — |
| 7 | Teelan | Technician | Lysen | Other | Onor | 5 | apcF | — |
| 8 | Max | Gunner | Jewell | Marine | Mary | 6 | battlesuit | — |

---

## Campaign Notes

- **Setting:** Traveller RPG / Classic Traveller universe; visual aesthetic from Mark Harrison's *The Travellers* (2000 AD)
- **Background:** Crew are clones bred over generations as sleeper agents for the 213th NI @ Efate (BRS)
- **Key links:** AHL hulk in MT hex, 213th NI, Regina NI, CSB, Psionics, pearl_diving, Brubeks Babes, ABC Warriors R Women
