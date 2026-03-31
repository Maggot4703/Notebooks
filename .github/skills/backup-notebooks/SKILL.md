# backup-notebooks Skill

**Purpose:**
Easily back up the entire `/home/me/Notebooks` directory as a zip archive to a specified destination (e.g., `/media/me/SSD120/Notebook.zip`).

---

## Usage Instructions

### 1. Prerequisites
- Ensure the `zip` utility is installed (`sudo apt install zip` on Debian/Ubuntu).
- Confirm you have write permissions to the destination directory (e.g., `/media/me/SSD120`).
- Ensure sufficient free space on the destination drive.

### 2. Basic Backup Command
```sh
zip -r /media/me/SSD120/Notebook.zip /home/me/Notebooks
```
- This creates (or overwrites) `Notebook.zip` with all contents of `/home/me/Notebooks`.

### 3. Exclude Unnecessary Files (Recommended)
To skip cache and checkpoint folders:
```sh
zip -r /media/me/SSD120/Notebook.zip /home/me/Notebooks -x "*/__pycache__/*" "*/.ipynb_checkpoints/*"
```

### 4. Overwriting Existing Backups
- The above command will overwrite any existing `Notebook.zip` at the destination.
- To keep old backups, append a date:  
  `zip -r /media/me/SSD120/Notebook-$(date +%Y%m%d).zip /home/me/Notebooks`

### 5. Verifying the Backup
- List contents:  
  `unzip -l /media/me/SSD120/Notebook.zip`
- Test archive integrity:  
  `unzip -t /media/me/SSD120/Notebook.zip`

### 6. Restoring from Backup
```sh
unzip /media/me/SSD120/Notebook.zip -d /home/me/Notebooks-restored
```

---

## Troubleshooting
- **Permission denied:** Check write permissions on the destination.
- **No space left:** Ensure the destination has enough free space.
- **zip: command not found:** Install zip with your package manager.
- **Very large directories:** Consider splitting the backup or using `tar.gz` for better compression (see below).

---

## Alternatives
- For better compression:  
  `tar czf /media/me/SSD120/Notebook.tar.gz -C /home/me Notebooks`
- For automation: Add the backup command to a cron job for scheduled backups.

---

## Automation

### 1. Bash Script Example
Create a script (e.g., `backup_notebooks.sh`) with the following content:
```sh
#!/bin/bash
DATE=$(date +%Y%m%d)
DEST="/media/me/SSD120/Notebook-$DATE.zip"
SRC="/home/me/Notebooks"
zip -r "$DEST" "$SRC" -x "*/__pycache__/*" "*/.ipynb_checkpoints/*"
```
Make it executable:
```sh
chmod +x backup_notebooks.sh
```

### 2. Cron Job Setup
To run the backup daily at 2:00 AM, add this line to your crontab (`crontab -e`):
```cron
0 2 * * * /path/to/backup_notebooks.sh
```

This will create a dated backup every day. Adjust the schedule as needed.

---

## Metadata
- **Name:** backup-notebooks
- **Description:** Skill for backing up the Notebooks directory as a zip archive.
- **AppliesTo:** Linux, Notebooks, backup, zip
- **Tags:** backup, notebooks, zip, Linux, archive
