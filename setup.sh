#!/bin/bash

# This script will handle the set up.
# It takes options to either install packages, link configuration files, or do both.

# Function to display usage information
usage() {
    echo "Usage: $0 [-p] [-l] [-h]"
    echo " -p Install packages"
    echo "  -l Create symbolic links for configuration files"
    echo "  -h Display this help message"
    exit 1
}

# Check if the script is run as root
if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root" 1>&2
    exit 1
fi

# Parse the command-line options
while getopts "plh" opt; do
    case "$opt" in
        p)  # Install packages
            echo "Installing packages..."
            ./install-packages.sh  # Call the install packages script
            ;;
        l)  # Create symbolic links for configuration files
            echo "Creating symbolic links..."
            ./create-symbolic-links.sh  # Call the create symbolic links script
            ;;
        h)  # Display help message
            usage
            ;;
        *)  # Invalid option
            echo "Invalid option: -$OPTARG" 1>&2
            usage
            ;;
    esac
done

# If no options are given, display the usage information
if [ $OPTIND -eq 1 ]; then
    usage
fi

echo "Setup complete."
