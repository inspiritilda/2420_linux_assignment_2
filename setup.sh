#!/bin/bash

# This script will handle the set up.
# It takes options to either install packages, link configuration files, or do both.

# Function to display usage information
usage() {
    echo "Usage: $0 [-p] [-l] [-h]" # Displays the script's name and optional flags that can be used to modify its behaviour
    echo " -p Install packages"
    echo " -l Create symbolic links for configuration files"
    echo " -h Display this help message"
    exit 1
}

# Parse the command-line options
while getopts "plh" opt; do # Initiates a loop to parse command-line options to passed to the script, with case statement handling each options behaviour
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
            echo "Invalid option: -$OPTARG" 1>&2 # Prints an error message to standard error when an invalid option is passed to the script
            usage
            ;;
    esac
done

# If no options are given, display the usage information
if [ $OPTIND -eq 1 ]; then # This condition checks if no options have been processed yet by getopts
    usage
fi

echo "Setup complete."
