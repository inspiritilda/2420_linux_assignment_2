#!/bin/bash

# This script automates the system setup process by calling other scripts based on options.

# Function to show usage
usage() {
    echo "Usage: $0 [-i] [-l]"
    echo "Options:"
    echo "  -i  Install packages"
    echo "  -l  Link configuration files"
    exit 1
}

# Parse command-line options
while getopts ":il" opt; do
    case $opt in
        i)
            echo "Installing packages..."
            ./install-packages.sh
            ;;
        l)
            echo "Linking configuration files..."
            ./link-configs.sh
            ;;
        *)
            usage
            ;;
    esac
done

# If no options are provided, show usage
if [ $OPTIND -eq 1 ]; then
    usage
fi

echo "Setup complete."
