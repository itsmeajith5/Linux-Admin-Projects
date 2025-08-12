#!/bin/bash

echo "installing firewalld"
sudo dnf install -y firewalld

echo "starting and enable httpd"
systemctl start httpd
systemctl enable httpd

echo "configuring firewall to allow only HTTP,HTTPD and SSH"
firewall-cmd --permanent --remove-service=ftp
firewall-cmd --permanent --remove-service=samba
firewall-cmd --permanent --remove-service=telnet

firewall-cmd --permanent --add-service=http
firewall-cmd --permanent --add-service=https
firewall-cmd --permanent --add-service=ssh

firewall-cmd --reload

echo "allowing custom port 8080"
firewall-cmd --permanent --add-port=8080/tcp
firewall-cmd --reload








