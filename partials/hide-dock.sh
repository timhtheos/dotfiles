#!/bin/bash

##
# Hide dock.
# 
# Works and tested with Yosemite, and Sierra.
#
# Reference:
#   https://www.quora.com/How-can-I-completely-hide-or-remove-the-Dock-in-Mac-OS-X-Yosemite
##

# To set the Dock to automatically hide, check the System Preferences > Dock >
# Automatically hide and show the Dock checkbox.

# To hide until 10 seconds hover.
defaults write com.apple.Dock autohide-delay -float 10 && killall Dock

# To restore default functionality.
# defaults delete com.apple.Dock autohide-delay
