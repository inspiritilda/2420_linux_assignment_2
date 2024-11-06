#!/bin/bash

# This script will create symbolic links for the configuration files
# to make sure your setup stays clean and organized.

# Define the source directory for configuration files
CONFIG_DIR="$(pwd)/config"
HOME_DIR="$HOME"

# Function to create symbolic links
create_links() {
    echo "Setting up symbolic links..."

    # Create the ~/bin directory and link to the original files in config/bin
    mkdir -p "$HOME_DIR/bin" # Create the bin directory if it doesn't exist
    ln -sfn "$CONFIG_DIR/bin/*" "$HOME_DIR/bin/" # Link files from config/bin to ~/bin

    # Create the ~/.config directory and link to config directories like kak and tmux
    mkdir -p "$HOME_DIR/.config" # Make sure the .config directory exists
    ln -sfn "$CONFIG_DIR/kak" "$HOME_DIR/.config/kak" # Link kakoune config
    ln -sfn "CONFIG_DIR/tmux" "$HOME_DIR/.config/tmux" # Link tmux config

    # Create a symbolic link for the bashrc file
    ls -sfn "$CONFIG_DIR/home/bashrc" "$HOME_DIR/.bashrc" # Link bashrc

    echo "Symbolic links set up successfully."

}

# To run the create_links function
create_links
