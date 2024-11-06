#!/bin/bash

# This script will create symbolic links for the configuration files.

# Set up symbolic links for configuration files
echo "Setting up symbolic links..."

# Link for bashrc file
ln -sf /home/arch/2420_linux_assignment_2/config/bashrc ~/.bashrc

# Link for kakrc file (assuming kak config is inside config/kak)
mkdir -p ~/.config/kak
ln -sf /home/arch/2420_linux_assignment_2/config/kak/kakrc ~/.config/kak/kakrc

# Link for tmux.conf file (assuming tmux config is inside config/tmux)
mkdir -p ~/.config/tmux
ln -sf /home/arch/2420_linux_assignment_2/config/tmux/tmux.conf ~/.config/tmux/tmux.conf

# Additional links for other files can be added similarly

echo "Symbolic links set up successfully."
