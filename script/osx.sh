#!/usr/bin/env sh

##
# This file was forked from https://gist.github.com/2260182
#

# Disable shadow in screenshots
defaults write com.apple.screencapture disable-shadow -bool true

# Change screenshots location
defaults write com.apple.screencapture location ~/Pictures/screenshots

# Change screenshots format
defaults write com.apple.screencapture type jpg

# Set a blazingly fast keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 0

# Set a shorter Delay until key repeat
defaults write NSGlobalDomain InitialKeyRepeat -int 12

# Avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Disable window animations and Get Info animations in Finder
defaults write com.apple.finder DisableAllAnimations -bool true

# Disable Mission Control's launch animation
defaults write com.apple.dock expose-animation-duration -int 0

# Remove the auto-hiding Dock delay
defaults write com.apple.Dock autohide-delay -float 10000

# Remove the animation when hiding/showing the Dock
defaults write com.apple.dock autohide-time-modifier -float 0

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Enable iTunes track notifications in the Dock
defaults write com.apple.dock itunes-notifications -bool true

# Disable New Window Animation
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool NO

# Show status bar in Finder
defaults write com.apple.finder ShowStatusBar -bool true

# Allow key holding
defaults write -g ApplePressAndHoldEnabled -bool false

# Disable smooth scrolling
defaults write -g NSScrollAnimationEnabled -bool NO

# Show the ~/Library folder
chflags nohidden ~/Library

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

# Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true

# Enable subpixel font rendering on non-Apple LCDs
defaults write NSGlobalDomain AppleFontSmoothing -int 2

# Show status bar in Finder
defaults write com.apple.finder ShowStatusBar -bool true

# Disable disk image verification
defaults write com.apple.frameworks.diskimages skip-verify -bool true
defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true

# Restart Dock
killall Dock
