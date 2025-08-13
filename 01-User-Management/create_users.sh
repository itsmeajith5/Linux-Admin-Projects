#!/bin/bash

# Create users from a CSV file.

input="users.csv"
if [ ! -f "$input" ]; then
    echo "Input file not found: $input"
    exit 1
fi

while IFS=, read -r username password; do
    if [[ -n "$username" && -n "$password" ]]; then
        echo "Creating user: $username"
        sudo useradd "$username"
        echo "$username:$password" | sudo chpasswd
        # Optionally force password change on first login:
        # sudo passwd --expire "$username"
        echo "User $username created successfully"
    fi
done < "$input"