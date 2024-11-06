#!/bin/bash

# This script will install the required software packages on the system.

# Define a list of packages to install
PACKAGES=("kakoune" "tmux")

# Function to install packages
install_packages() {
    echo "Updating system package list..."
    # Install packages listed in PACKAGES array
    sudo pacman -Syu --noconfirm "${PACKAGES[@]}"

    # Check if installation was successful
    if [[ $? -ne 0 ]]; then
        echo "Something went wrong. The packages didn't get installed."
        exit 1
    else
        echo "All packages installed successfully."
    fi
}

# To run the install function
install_packages
