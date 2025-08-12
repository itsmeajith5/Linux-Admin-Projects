# Project: Firewall and Security Configuration

## Description
This script configures firewall rules and SELinux settings for a RHEL/CentOS system, restricting access to essential services.

## What it does:
- Installs and configures firewalld
- Allows only HTTP, HTTPS, SSH
- Blocks unwanted services (FTP, Samba, Telnet)
- Adds custom TCP port 8080

## Usage

```bash
chmod +x firewall-config.sh
sudo ./firewall-config.sh

