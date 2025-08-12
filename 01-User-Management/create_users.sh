#!/bin/bash

#create users from a csv file.

input="users.csv"
if [ ! -f "$input" ]; then  # -f checks file named users.csv exit or not. ! means NOT.
echo "input file is not found"
exit 1  #exit with exit code showing 1. 0 is success 1 is fail.
fi

while IFS=, read username password  # IFS means Internal Field Separator.it stores as two variable if it speerated in a comma.
do
	echo " creating user: $username"
	sudo useradd "$username"
	echo "$username:$password" | chpasswd  #this line seperate username and pass.chpasswd means change password.pipe symbol make this output as input of next cmd.
	passwd "$username"
done
echo "user $username created successfully"

