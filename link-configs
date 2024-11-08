#!/bin/bash

# This script will create symbolic links for the configuration files.

echo "Setting up symbolic links..."

# Link for bashrc
if [ ! -f ~/.bashrc ]; then
    ln -s /home/arch/2420_linux_assignment_2/config/home/bashrc ~/.bashrc
    echo "bashrc linked successfully."
else
    echo "bashrc already exists."
fi

# Link for kakrc
if [ ! -f ~/.config/kak/kakrc ]; then
    ln -s /home/arch/2420_linux_assignment_2/config/kak/kakrc ~/.config/kak/kakrc
    echo "kakrc linked successfully."
else
    echo "kakrc already exists."
fi

# Link for tmux.conf
if [ ! -f ~/.config/tmux/tmux.conf ]; then
    ln -s /home/arch/2420_linux_assignment_2/config/tmux/tmux.conf ~/.config/tmux/tmux.conf
    echo "tmux.conf linked successfully."
else
    echo "tmux.conf already exists."
fi

echo "Symbolic links set up successfully."
