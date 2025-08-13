#!/bin/bash

echo "Installing firewalld"
sudo dnf install -y firewalld

echo "Installing httpd"
sudo dnf install -y httpd

echo "Starting and enabling httpd"
sudo systemctl start httpd
sudo systemctl enable httpd

echo "Configuring firewall to allow only HTTP, HTTPS, and SSH"
sudo firewall-cmd --permanent --remove-service=ftp
sudo firewall-cmd --permanent --remove-service=samba
sudo firewall-cmd --permanent --remove-service=telnet

sudo firewall-cmd --permanent --add-service=http
sudo firewall-cmd --permanent --add-service=https
sudo firewall-cmd --permanent --add-service=ssh

echo "Allowing custom port 8080"
sudo firewall-cmd --permanent --add-port=8080/tcp

echo "Reloading firewall to apply changes"
sudo firewall-cmd --reload