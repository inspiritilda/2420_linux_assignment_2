#!/bin/bash

# This script creates a new user with specified settings.

# Function to show usage
usage() {
    echo "Usage: $0 -u <username> -s <shell> [-g <group1,group2,...>]"
    exit 1
}

# Check for root privileges
if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root."
    exit 1
fi

# Parse command-line options
while getopts ":u:s:g:" opt; do
    case $opt in
        u) USERNAME="$OPTARG" ;;
        s) SHELL="$OPTARG" ;;
        g) IFS=',' read -r -a GROUPS <<< "$OPTARG" ;;
        *) usage ;;
    esac
done

# Check if username and shell are provided
if [ -z "$USERNAME" ] || [ -z "$SHELL" ]; then
    usage
fi

# Create the user with the specified shell
useradd -m -s "$SHELL" "$USERNAME"

# Check if the user was created successfully
if [[ $? -ne 0 ]]; then
    echo "Error: User creation failed."
    exit 1
fi

# Set the password for the new user
passwd "$USERNAME"

# Add user to additional groups
for GROUP in "${GROUPS[@]}"; do
    usermod -aG "$GROUP" "$USERNAME"
done

echo "User '$USERNAME' created successfully with shell '$SHELL'."
