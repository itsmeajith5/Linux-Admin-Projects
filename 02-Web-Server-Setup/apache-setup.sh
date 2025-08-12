#!/bin/bash

echo "Updating system"

sudo dnf update 

echo " installing httpd"

sudo dnf install -y httpd

echo " starting and enable httpd "

sudo systemctl start httpd

sudo systemctl enable httpd



# configuring firewall to allow httpd

firewall-cmd  --permenent-add-service =http

firewall-cmd  --permenent-add-service =https



#creating a webpage content 

echo " Wellcome to Ajith's webserver" >> /var/www/html/index.html



#Testing webserver 

curl -l http://localhost


