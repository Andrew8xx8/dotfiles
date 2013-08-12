# Sets reasonable OS X defaults.
#
# The original idea were grabbed from:
#   https://raw.github.com/mathiasbynens/dotfiles/master/.osx
#   https://github.com/holman/dotfiles/blob/master/osx/set-defaults.sh
#
# Run ./set-defaults.sh and you'll be good to go.

sudo scutil --set ComputerName "8xx8@undev.mac"
sudo scutil --set HostName "8xx8@undev.mac"
sudo scutil --set LocalHostName "8xx8@undev.mac"
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "8xx8@undev.mac"

# Disable press-and-hold for keys in favor of key repeat.
defaults write -g ApplePressAndHoldEnabled -bool false

# Use AirDrop over every interface. srsly this should be a default.
defaults write com.apple.NetworkBrowser BrowseAllInterfaces 1

# Always open everything in Finder's list view. This is important.
defaults write com.apple.Finder FXPreferredViewStyle Nlsv

# Show the ~/Library folder.
chflags nohidden ~/Library

# Set a really fast key repeat.
defaults write NSGlobalDomain KeyRepeat -int 0

# Set the Finder prefs for showing a few different volumes on the Desktop.
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName
