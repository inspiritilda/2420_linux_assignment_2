#!/bin/bash

# This script will install the required software packages on the system.

# Define a list of packages to install
PACKAGES=("kakoune" "tmux") # An array named PACKAGES which contains two elements: kakoune (text editor) and tmux (terminal multiplexer)

# Function to install packages
install_packages() {
    echo "Updating system package list..."
    sudo pacman -Syu --noconfirm "${PACKAGES[@]}" # Install packages listed in the array above

    # Check if installation was successful
    if [[ $? -ne 0 ]]; then # If the last command failed, execute the code block that follows
        echo "Something went wrong. The packages didn't get installed."
        exit 1 # Indicated failure or an error
    else
        echo "All packages installed successfully."
    fi
}
