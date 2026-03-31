# TRAVELLERMAP Tools and Skills

This directory contains scripts and documentation for working with Traveller sector/world data, map APIs, and RPG conventions.

## Key Scripts

- `find_nearest_base_to.py` — Find the nearest base (of any or selected type) to a world in any sector. Supports user selection of base type or defaults to ANY if blank.
- `count_military_bases.py` — Count and summarize bases by type in a sector.
- `backupTraveller.py` — Backup and utility functions for sector/world data.

## Skills

- **nearest-base**: Use when searching for the nearest base to a world in any Traveller sector. Supports user-driven or automatic (ANY) base type selection, sector/world lookup, and base distance calculation. See `.github/skills/nearest-base/SKILL.md` for workflow and examples.
- **rpg-data**: Use for modeling, searching, or analyzing RPG sector/world data, including UWP and world attributes.
- **data-parsing**: Use for parsing, transforming, or validating structured data (tabular, JSON, etc.), map rendering, or coordinate conversion.

## Example Usage

### Find the Nearest Base (Script)

```sh
python3 find_nearest_base_to.py Vland Kesali N
```
- Finds the nearest Naval base to Kesali in the Vland sector.

```sh
python3 find_nearest_base_to.py Vland Kesali
```
- Finds the nearest base of ANY type to Kesali in the Vland sector.

### Skill Workflow (Agent)

1. Prompt user to select a base type (Naval, Scout, etc.), or use ANY if blank.
2. Parse sector/world data to locate the world.
3. Search for all bases of the selected type (or any base if blank).
4. Calculate distances (in parsecs) from the world to each base.
5. Return the nearest base(s) with world, hex, UWP, base type, and distance.

---

See also: `travellermap-api.md` for API details and `nearest_base_kesali.html` for a worked example.

## Backups

### Traveller Data and Code Backup

To back up Traveller sector/world data and scripts to an external drive or backup location:

- Use the provided backup script:

```sh
python3 backupTraveller.py
```

- The script will search for relevant Traveller folders on all mounted drives (e.g., `/media/me/*`, `/mnt/*`) and copy them to `/media/me/Traveller` by default.
- If there is not enough disk space, an HTML listing of files not copied will be generated in the backup destination.

#### Customizing or Extending Backups
- To include local project files (e.g., `.py`, `.tab`, `.ipynb`, `.md`), you can extend `backupTraveller.py` or use standard tools like `rsync`:

```sh
rsync -av --exclude='.venv' /home/me/Notebooks/TRAVELLERMAP/ /media/me/Traveller/backup-$(date +%Y%m%d)/
```

#### Scheduling Backups
- For regular automated backups, add a cron job (Linux):

```sh
crontab -e
# Add a line like:
0 2 * * * cd /home/me/Notebooks/TRAVELLERMAP && python3 backupTraveller.py
```

See the script for more options and details.
