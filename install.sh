#!/usr/bin/env bash

# Get the directory where the script file is located
SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

# Loop through all files and directories in the script directory
for rcfile in $SCRIPT_DIR/*/*; do
  # Get the filename of the current file
  filename=$(basename "$rcfile")
  
  # Remove any existing configuration file with the same name in the user's home directory
  rm -r $HOME/.$filename
  
  # Create a symbolic link to the file found in the user's home directory
  ln -sf $rcfile $HOME/.$filename
done

# Remove any existing zprezto configuration in the user's home directory
rm -rf ~/.zprezto

# Clone the zprezto repository from GitHub into the user's home directory
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

# Update all submodules (vim packages) in the zprezto repository
git submodule update --init --recursive
