#!/bin/bash

echo "Updating system"
sudo dnf update -y

echo "Installing httpd"
sudo dnf install -y httpd

echo "Starting and enabling httpd"
sudo systemctl start httpd
sudo systemctl enable httpd

# Configuring firewall to allow httpd
sudo firewall-cmd --permanent --add-service=http
sudo firewall-cmd --permanent --add-service=https
sudo firewall-cmd --reload

# Creating a webpage content
echo "Welcome to Ajith's webserver" | sudo tee /var/www/html/index.html

# Testing webserver
curl -L http://localhost