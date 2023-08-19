#!/bin/bash

# This script will take care of nearly all updates for Mac, including
# Apple updates and HomeBrew updates;

# Print a blank line to enhance legibility in Terminal;
echo

# Install all available updates from Apple, if any;
# & will run the command in the background;
softwareupdate -i -a &

# wait is used to wait for the background command above to finish running;
wait

# Print a blank line to enhance legibility in Terminal;
echo

# Enable verbose mode for brew;
export HOMEBREW_VERBOSE=1

# Update HomeBrew repos in background;
brew update &

# wait for command to finish running;
wait

# Blank line;
echo

# Install all available formula updates in background;
brew upgrade &

# Wait for background process to finish running;
wait

# Blank line;
echo

# Install all available cask updates;
brew upgrade --cask

# Disable verbose mode;
unset HOMEBREW_VERBOSE
