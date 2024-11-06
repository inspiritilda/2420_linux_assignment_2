#!/bin/bash

# This script will handle the set up.
# It takes options to either install packages, link configuration files, or do both.

# Function to display usage instructions
usage() {
    echo "Usage: $0 [-i] [-l]"
    echo "Options:"
    echo "  -i  Install required packages"
    echo "  -l  Link configuration files"
    exit 1
}

# Parse the command-line options
while getopts ":il" opt; do
    case $opt in
        i)
            echo "Installing packages..."
            ./install-packages.sh # Call the install packages script
            ;;
        l)
            echo "Linking configuration files..."
            ./link-configs.sh # Call the link configs script
            ;;
        *)
            usage # Show usage if an invalid option is provided
            ;;
    esac
done

# If no options are given, show usage
if [ $OPTIND -eq 1 ]; then
    usage
fi

echo "Setup complete."
