#!/bin/bash
# Archive all Crew* folders not already in CrewFolders.7z with max compression
set -e
cd /home/me/Notebooks/CREW/BACKUP || exit 1

ARCHIVE="CrewFolders.7z"

# List all Crew* directories (not files)
all_folders=($(find . -maxdepth 1 -type d -name 'Crew*' -printf '%P\n'))

# List already archived top-level folders (if archive exists)
if [[ -f "$ARCHIVE" ]]; then
    archived=($(7z l "$ARCHIVE" | awk '/^D/ {print $6}' | grep '^Crew'))
else
    archived=()
fi

# Find folders not yet in archive
to_add=()
for folder in "${all_folders[@]}"; do
    skip=
    for a in "${archived[@]}"; do
        [[ "$folder" == "$a" ]] && skip=1 && break
    done
    [[ -z "$skip" ]] && to_add+=("$folder")
done

# Add missing folders to archive
if [[ ${#to_add[@]} -gt 0 ]]; then
    7z a -mx=9 "$ARCHIVE" "${to_add[@]}"
else
    echo "No new Crew* folders to add."
fi
