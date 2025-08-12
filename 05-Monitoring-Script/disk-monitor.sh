#!/bin/bash

# Disk Usage Monitoring Script
# Sends an alert if disk usage is above a set threshold

THRESHOLD=80
ALERT_EMAIL="admin@example.com"

# Get disk usage percentage for root filesystem
USAGE=$(df -h / | grep '/' | awk '{print $5}' | sed 's/%//')

if [ "$USAGE" -ge "$THRESHOLD" ]; then
    MESSAGE="Warning: Disk usage is at ${USAGE}% on $(hostname) - $(date)"
    echo "$MESSAGE"

    # Log to a file
    echo "$MESSAGE" >> /var/log/disk_usage_alert.log

    # Send an email (requires mailutils or mailx)
    if command -v mail >/dev/null 2>&1; then
        echo "$MESSAGE" | mail -s "Disk Space Alert on $(hostname)" "$ALERT_EMAIL"
    fi
else
    echo "Disk usage is normal at ${USAGE}%."
fi

