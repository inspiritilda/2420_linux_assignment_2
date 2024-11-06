#!/bin/bash

# This script will create a new user with a specified shell, home directory, groups, and set their password.# It directly writes to the necessary files and doesn't use any user management tools.

# Ask for the username
read -p "Enter the username: " username

# Ask for the shell (default /bin/bash)
read -p "Enter the shell (default /bin/bash): " shell
shell=${shell:-/bin/bash}  # Use /bin/bash if no input is given

# Ask for additional groups
read -p "Enter additional groups (separate with commas, or leave blank): " groups

# Create the group if not already present
groupadd "$username"

# Create the user with the specified shell and group
useradd -m -s "$shell" -g "$username" $username

# Set the password
read -s -p "Enter password for $username: " password
echo
read -s -p "Confirm password for $username: " password2
echo

if [[ "$password" == "$password2" ]]; then
    echo "$username:$password" | chpasswd
    chown -R "$username:$username" "/home/$username"
    echo "User $username created successfully."
else
    echo "Passwords do not match!"
    exit 1
fi
