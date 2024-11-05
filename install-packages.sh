#!/bin/bash

# This script installs essential software packages.

# Define a list of packages to install
PACKAGES=("kakoune" "tmux")

# Function to install packages
install_packages() {
    echo "Updating package list..."
    sudo pacman -Syu --noconfirm "${PACKAGES[@]}"

    # Check if installation was successful
    if [[ $? -ne 0 ]]; then
        echo "Error: Package installation failed."
        exit 1
    else
        echo "Packages installed successfully."
    fi
}

# Run the install function
install_packages
