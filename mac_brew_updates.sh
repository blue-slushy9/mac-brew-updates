#!/bin/bash

# This script will take care of nearly all updates for Mac, including
# Apple and HomeBrew updates

# Print a blank line to enhance legibility in Terminal
echo

# Enable verbose mode for brew
export HOMEBREW_VERBOSE=1

# Update HomeBrew repos in background
brew update &

# wait for command to finish running
wait

# Blank line
echo

# Install all available formula updates in background
brew upgrade &

# Wait for background process to finish running
wait

# Blank line
echo

# Install all available cask updates
brew upgrade --cask

# Disable verbose mode
unset HOMEBREW_VERBOSE

# Blank line
echo

# Moved Apple updates to the bottom because they often require a reboot, this
# way the script won't need to be run again after rebooting -- 5/18/24

# Install all available updates from Apple, if any;
# & will run the command in the background
softwareupdate -i -a #&  # removed because it seemed to cause freezing

# wait is used to wait for the background command above to finish running
#wait # Dont't think this is necessary as softwareupdate reboots the Mac on
# its own as needed
