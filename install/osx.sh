#!/usr/bin/env sh

echo -e "\n\nSetting OSX settings"
echo "=============================="

echo "Enable full keyboard access for all controls (e.g. enable Tab in modal dialogs)"
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

echo "Enable tap to click (Trackpad)"
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true

echo "Enable Safari's debug menu"
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

echo "Enable text selection in MD Preview"
defaults write com.apple.finder QLEnableTextSelection -bool TRUE; killall Finder

echo "Kill affected applications"
for app in Safari Finder Dock Mail SystemUIServer; do killall "$app" >/dev/null 2>&1; done

