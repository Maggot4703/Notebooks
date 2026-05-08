# Crew Template v2

This is a **design-time reference template** for role and readiness planning. It is
not a production runtime file.

## Role Record Template

Use one section per role or planned assignment.

### Role: [Role Name]

- **Purpose:** [What this role is responsible for]
- **Primary skills:** [Skill 1], [Skill 2]
- **Required tools or surfaces:** [GUI area, script, data source, docs]
- **Readiness checks:** [Training, access, data quality, review steps]
- **Fallback or backup path:** [What to do if the primary assignee is unavailable]
- **Notes:** [Design-only notes]

## Suggested use

- Pair this with `skills_db.csv` for role-to-skill mapping.
- Pair this with `training_log.csv` for readiness checks or renewals.
- Keep production behavior descriptions in `CREW/Crew/` and use this file only for planning.
