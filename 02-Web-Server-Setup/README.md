# Project: Apache Web Server Setup Script

## Description
This script automates the installation and configuration of the Apache HTTP server on a RHEL based system.

## What it does:
- Updates system packages
- Installs Apache
- Starts and enables Apache at boot
- Configures the firewall to allow HTTP/HTTPS traffic
- Creates a test HTML page
- Tests server accessibility using curl

## Usage

```bash
chmod +x apache-setup.sh
sudo ./apache-setup.sh

