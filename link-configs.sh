#!/bin/bash

# This script will create symbolic links for the configuration files.

# Set up symbolic links for configuration files
echo "Setting up symbolic links..."

# Check if the source files exist before creating links
if [ -f "/home/arch/2420_linux_assignment_2/config/bashrc" ]; then
    ln -sf /home/arch/2420_linux_assignment_2/config/bashrc ~/.bashrc
    echo "bashrc linked successfully."
else
    echo "bashrc file not found!"
fi

# Link for kakrc file
if [ -f "/home/arch/2420_linux_assignment_2/config/kak/kakrc" ]; then
    mkdir -p ~/.config/kak
    ln -sf /home/arch/2420_linux_assignment_2/config/kak/kakrc ~/.config/kak/kakrc
    echo "kakrc linked successfully."
else
    echo "kakrc file not found!"
fi

# Link for tmux.conf file
if [ -f "/home/arch/2420_linux_assignment_2/config/tmux/tmux.conf" ]; then
    mkdir -p ~/.config/tmux
    ln -sf /home/arch/2420_linux_assignment_2/config/tmux/tmux.conf ~/.config/tmux/tmux.conf
    echo "tmux.conf linked successfully."
else
    echo "tmux.conf file not found!"
fi

echo "Symbolic links set up successfully."
