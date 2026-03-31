## Plan: Create 'backup-notebooks' Skill for Notebook Folder Backup

This plan outlines how to create a reusable skill named backup-notebooks that enables users to back up the entire /home/me/Notebooks directory as a zip archive, saving it to a specified destination (e.g., /media/me/SSD120/BACKUPS/Notebook.zip). The skill will provide a clear, repeatable workflow and best practices for this operation.

**Steps**

1. **Skill File Creation**
   - Create a new skill folder: .github/skills/backup-notebooks/
   - Add a SKILL.md file describing the backup workflow, command(s), and usage notes.

2. **Skill Content Design**
   - Document the recommended command for zipping the Notebooks directory:
     - Use zip -r for recursive archiving, excluding system/hidden files if needed.
     - Example: zip -r /media/me/SSD120/BACKUPS/Notebook.zip /home/me/Notebooks
   - Include options for:
     - Overwriting existing backups
     - Excluding cache or temporary files (e.g., __pycache__, .ipynb_checkpoints)
     - Verifying the backup (e.g., listing contents, checking archive integrity)
   - Provide troubleshooting tips for common issues (e.g., permissions, disk space).

3. **Skill Usage Instructions**
   - Add a section on how to invoke the skill, including:
     - Prerequisites (e.g., zip installed, write permissions)
     - Example terminal commands
     - How to restore from backup

4. **Skill Metadata**
   - Add YAML frontmatter to the SKILL.md for discoverability:
     - Name, description, appliesTo, tags (e.g., backup, notebooks, zip, Linux)

**Relevant files**
- .github/skills/backup-notebooks/SKILL.md — New file with backup workflow, command, and usage notes

**Verification**
1. Confirm the SKILL.md includes:
   - Step-by-step backup instructions
   - Example commands
   - Exclusion patterns for unnecessary files
   - Restore instructions
   - Troubleshooting section
2. Validate that the skill is discoverable by searching for "backup" or "notebooks" in the skills directory.
3. Optionally, test the documented command in a terminal to ensure it works as described.

**Decisions**
- The skill will focus on Linux environments using the zip utility.
- Excludes advanced backup strategies (e.g., incremental, cloud sync) for simplicity.
- Scope is limited to full directory backup and restore, not partial or selective backup.

**Further Considerations**
1. Should the skill support other archive formats (e.g., tar.gz) as alternatives? (Recommend: mention as an option, but default to zip.)
2. Should the skill include automation (e.g., cron job setup) or remain manual? (Recommend: manual, with a note on automation.)
3. Should the skill provide guidance for large directories or low disk space scenarios? (Recommend: add a troubleshooting note.)

Would you like to proceed with this plan, or request any changes before the skill is created?
