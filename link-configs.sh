#!/bin/bash

# This script creates symbolic links for configuration files.

# Define the source configuration directory
CONFIG_DIR="$(pwd)/config"
HOME_DIR="$HOME"

# Function to create symbolic links
create_links() {
    echo "Creating symbolic links..."

    # Create symbolic links for the bin directory
    mkdir -p "$HOME_DIR/bin"
    ln -sfn "$CONFIG_DIR/bin/*" "$HOME_DIR/bin/"

    # Create symbolic links for the config directory
    mkdir -p "$HOME_DIR/.config"
    ln -sfn "$CONFIG_DIR/*" "$HOME_DIR/.config/"

    # Create a symbolic link for the bashrc file
    ln -sfn "$CONFIG_DIR/home/bashrc" "$HOME_DIR/.bashrc"

    echo "Symbolic links created successfully."
}

# Run the create_links function
create_links
