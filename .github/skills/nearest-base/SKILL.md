---
name: nearest-base
version: 1.0
description: "Use when: searching for the nearest base to a world in any Traveller sector. Covers user-driven or automatic (ANY) base type selection, sector/world lookup, and base distance calculation."
---

# Nearest Base Search Skill

**Use for:**
- Finding the nearest base to a given world in a Traveller sector
- Allowing user to select a base type, or searching for ANY base if no selection is made
- Explaining base types, search logic, and distance calculations
- Integrating with sector/world data and map conventions

**Workflow:**
1. Prompt user to select a base type (e.g., Naval, Scout, Research, etc.), or proceed with ANY if left blank
2. Parse sector/world data to locate the target world
3. Search for all bases of the selected type (or any base if blank)
4. Calculate distances (in parsecs) from the target world to each base
5. Return the nearest base(s) with world, hex, UWP, base type, and distance

**Not for:**
- General map rendering (use data-parsing skill)
- Non-Traveller base searches (use appropriate domain skill)

**References:**
- See also: rpg-data, data-parsing skills for sector/world data conventions and parsing

**Examples:**

**Standard Base Codes (Traveller):**

| Code | Meaning         |
|------|-----------------|
| N    | Naval Base      |
| S    | Scout Base      |
| M    | Marine Base     |
| W    | Way Station     |
| K    | Corsair Base    |
| B    | Base (generic)  |
| F    | Fleet Base      |
| D    | Depot           |
| A    | Army Base       |

When prompting for base type, use these codes for user selection. If left blank, search for ANY base type.

- *Find nearest Naval base to Kesali in Vland sector:*
	- `python3 find_nearest_base_to.py Vland Kesali N`
- *Find nearest base of ANY type to Regina in Spinward Marches:*
	- `python3 find_nearest_base_to.py "Spinward Marches" Regina`
- *Agent/Tool invocation:*
	- Use the `find_nearest_base_kesali` tool or agent with parameters: sector, world, [base type]
	- If base type is blank, search for ANY base

**Agent Integration:**
- Register this skill for any agent or workflow that needs to locate the nearest base to a world in Traveller sector data
- When user requests nearest base search, prompt for base type (optional), sector, and world
- Use the workflow above to return the result (world, hex, UWP, base type, distance)
