#!/usr/bin/env sh

##
# This file was forked from https://gist.github.com/2260182
#

echo "Disable shadow in screenshots"
defaults write com.apple.screencapture disable-shadow -bool true

echo "Change screenshots location"
defaults write com.apple.screencapture location ~/Pictures/screenshots

echo "Change screenshots format"
defaults write com.apple.screencapture type jpg

echo "Set a blazingly fast keyboard repeat rate"
defaults write NSGlobalDomain KeyRepeat -int 0.02

echo "Set a shorter Delay until key repeat"
defaults write NSGlobalDomain InitialKeyRepeat -int 12

echo "Avoid creating .DS_Store files on network volumes"
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

echo "Disable Mission Control's launch animation (Lion)"
defaults write com.apple.dock expose-animation-duration -int 0

#echo "Restore Mission Control's launch animation"
#defaults write com.apple.dock expose-animation-duration

#echo "Change Mission Control's launch animation speed"
#defaults write com.apple.dock expose-animation-duration -float 0.1

echo "Disable New Window Animation (Lion)"
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool NO

#echo "Restore New Window Animation (Lion)"
#defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool YES

echo "Restart Dock"
killall Dock
