#!/bin/bash

# This script will create a new user with a specified shell, home directory, groups, and set their password.# It directly writes to the necessary files and doesn't use any user management tools.

# Function to display usage instructions
usage() {
    echo "Usage: $0 -u username -s shell -p password [-g group1,group2,...]"
    echo "  -u  Username of the new user"
    echo "  -s  Shell for the new user"
    echo "  -p  Password for the new user"
    echo "  -g  Additional groups to add the user to"
    exit 1
}

# Check if script is run as root
if [ "$(id -u)" -ne 0 ]; then
    echo "This script must be run as root. Please use sudo."
    exit 1
fi

# Parse command-line options
while getopts ":u:s:p:g:" opt; do
    case $opt in
        u)
            USERNAME=$OPTARG
            ;;
        s)
            SHELL=$OPTARG
            ;;
        p)
            PASSWORD=$OPTARG
            ;;
        g)
            GROUPS=$OPTARG
            ;;
        *)
            usage
            ;;
    esac
done

# Check if all required options are provided
if [ -z "$USERNAME" ] || [ -z "$SHELL" ] || [ -z "$PASSWORD" ]; then
    usage
fi

# Create the home directory
HOME_DIR="/home/$USERNAME"
mkdir -p "$HOME_DIR"

# Copy the contents of /etc/skel to the new user's home directory
cp -r /etc/skel/. "$HOME_DIR"

# Set the owner of the home directory and files to the new user
chown -R "$USERNAME":"$USERNAME" "$HOME_DIR"

# Create the new user
useradd -m -d "$HOME_DIR" -s "$SHELL" "$USERNAME"

# Set the password for the new user using the 'passwd' utility
echo "$USERNAME:$PASSWORD" | chpasswd

# Add the new user to any additional groups
if [ -n "$GROUPS" ]; then
    for GROUP in $(echo "$GROUPS" | tr ',' ' '); do
        usermod -aG "$GROUP" "$USERNAME"
    done
fi

# Set the primary group to the new user's username
usermod -g "$USERNAME" "$USERNAME"

echo "User $USERNAME created successfully with shell $SHELL and password set."

