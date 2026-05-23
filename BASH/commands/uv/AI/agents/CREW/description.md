# CREW Agent Collection

A set of AI agent personas representing the crew of a Traveller RPG campaign vessel, inspired by "The Travellers" by Mark Harrison (2000 AD). Each agent embodies a distinct crew role with defined responsibilities, skills, and personality.

## The Crew

| Agent | Role | System | Class |
|-------|------|--------|-------|
| **Captain** | Ship's Captain / Master | — | — |
| **Pilot** | Ship Pilot | Regina | Navy |
| **Navigator** | Navigator | ROUP | Scout |
| **Doctor** | Medical Officer | Feri | Doctor |
| **Chief** | Chief Engineer | Boughene | Army |
| **Technician** | Technical Specialist | Lysen | Other |
| **Gunner** | Weapons Specialist | Jewell | Marine |
| **Trader** | Merchant / Trade Specialist | — | — |

## Agent Structure

Each crew member has two files:
- **`[Role].agent.md`** — Agent configuration: YAML frontmatter (name, role, summary, responsibilities, skills) plus delegation and coordination instructions.
- **`[Role].md`** — Background lore and reference material for the role.

## Command Hierarchy

```
Captain
├── Pilot          (vessel control and navigation)
├── Navigator      (route planning, charts, hazards)
├── Chief          (engineering, maintenance, repairs)
│   └── Technician (systems and equipment support)
├── Doctor         (medical care, crew health)
├── Gunner         (weapons systems, defense)
└── Trader         (cargo, procurement, commerce)
```

## Usage

Invoke individual agents by role for specialized tasks, or use the Captain to orchestrate multi-role workflows. See `SKILL.md` for invocation guidance and examples.

## Context

The campaign draws on the Traveller RPG universe (Classic Traveller / Traveller5) and the visual storytelling style of Mark Harrison's 2000 AD work. Crew data and associated assets are managed by the **Crew Manager** application at `CREW/Crew/`.
