#!/bin/bash
# backup_p48.sh
# Backup /home/me on me@p48 to /home/me/BACKUP/p48 on this machine
# Usage: ./backup_p48.sh

set -e

SRC="me@p48:/home/me/"
DEST="/home/me/BACKUP/p48/"

# Create destination directory if it doesn't exist
mkdir -p "$DEST"

# Run rsync with archive, ACL, xattr, verbose, and delete options
rsync -aAXv --delete -e "ssh" "$SRC" "$DEST"

# Print completion message
echo "Backup from $SRC to $DEST completed successfully."
