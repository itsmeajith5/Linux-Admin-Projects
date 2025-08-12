#!/bin/bash
BACKUP_LOC="/home/ajith/Music"
BACKUP_DEST="/backup"

# Ensure backup directory exists
mkdir -p "$BACKUP_DEST"

# Create backup with properly formatted date
tar -cvzf "$BACKUP_DEST/backup_$(date +"%Y-%m-%d_%H-%M-%S").tar.gz" "$BACKUP_LOC"


# Remove backups older than 7 days
find "$BACKUP_DEST" -type f -name "*.tar.gz" -mtime +7 -exec rm {} \;

# ADD THIS LINE TO CRONTAB >> /tmp/script.log 2>&1 TO REDIRECT ERROR  OR OUTPUT LOG TO A FILE

