# Agents and Their Skills

This document lists agents found in this workspace and the skills declared in their agent definitions.

## Agent to Skills Mapping

| Agent | Source | Skills |
|---|---|---|
| Traveller | `.github/agents/Traveller.agent.md` | `api-design`, `data-parsing`, `rpg-data`, `nearest-base`, `pdf` |
| Captain | `AI/agents/CREW/Captain/Captain.agent.md` | `Leadership`, `Decision-making`, `Maritime law`, `Navigation`, `Crisis management` |
| Chief | `AI/agents/CREW/Chief/Chief.agent.md` | `Engineering expertise`, `Leadership`, `Problem-solving`, `Technical documentation` |
| Doctor | `AI/agents/CREW/Doctor/Doctor.agent.md` | `Medical knowledge`, `Emergency response`, `Record keeping`, `Communication` |
| Gunner | `AI/agents/CREW/Gunner/Gunner.agent.md` | `Weapons proficiency`, `Targeting and accuracy`, `Safety protocols`, `Teamwork` |
| Navigator | `AI/agents/CREW/Navigator/Navigator.agent.md` | `Navigation (traditional and electronic)`, `Chart management`, `Analytical thinking`, `Attention to detail` |
| Pilot | `AI/agents/CREW/Pilot/Pilot.agent.md` | `Navigation`, `Technical proficiency`, `Communication`, `Situational awareness` |
| Technician | `AI/agents/CREW/Technician/Technician.agent.md` | `Technical proficiency`, `Problem-solving`, `Attention to detail`, `Safety awareness` |
| Trader | `AI/agents/CREW/Trader/Trader.agent.md` | `Negotiation`, `Market analysis`, `Logistics`, `Communication` |
| GUIDesigner | `AI/agents/GUIDesigner.agent.md` | No `skills` list declared in file |
| PiMan | `.github/agents/PiMan.agent.md` | No `skills` list declared in file |

## Additional Agent Names (No Local skill mapping in this repository)

The following agent names are listed in `AI/agents/agents.md`, but this repository does not include matching `.agent.md` files with explicit `skills` arrays for them:

- `Explore`
- `modernize-azure-dotnet`
- `modernize-azure-java`
- `modernize-batch-impl`
- `modernize-design`
- `modernize-foundation`
- `modernize-gatekeep`
- `modernize-implementation`
- `modernize-java`
- `modernize-java-assessment`
- `modernize-java-upgrade`
- `modernize-plan`
- `modernize-rearchitecture`
- `modernize-task`

## Notes

- "Skills" above are taken exactly from each agent file's `skills:` field.
- In `CREW` agent files, these are role competencies (natural-language skill lists), not Copilot skill package names.
