# Project: Disk Monitoring Script

## Description
This script monitors disk usage on a Linux system and alerts if usage exceeds a set threshold.

## Features
- Monitors root filesystem usage
- Customizable threshold (default: 80%)
- Logs warnings to `/var/log/disk_usage_alert.log`
- Sends email alert if configured

## Usage
1. Make the script executable:
```bash
chmod +x disk-monitor.sh

