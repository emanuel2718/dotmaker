# show Library folder
chflags nohidden ~/Library

# show hidden files
defaults write com.apple.finder AppleShowAllFiles YES

# add pathbar to title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# app switcher follows the dock, and it sometimes moved to the second monitor. Annoying.
defaults write com.apple.dock appswitcher-all-displays -bool true 

# show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Disable font smoothing on Non-Retina Displays
defaults -currentHost write -g AppleFontSmoothing -int 0

# auto hide dock
defaults write com.apple.dock autohide -bool true

# show status bar in finder
defaults write com.apple.finder ShowStatusBar -bool true

# don't automaticlly rearrange spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false

echo "Don’t animate opening applications from the Dock"
defaults write com.apple.dock launchanim -bool false

echo "Disable opening and closing window animations"
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false

echo "Enable tap to click (Trackpad)"
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

echo "Map the bottom right corner to right-click"
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true
defaults -currentHost write NSGlobalDomain com.apple.trackpad.trackpadCornerClickBehavior -int 1
defaults -currentHost write NSGlobalDomain com.apple.trackpad.enableSecondaryClick -bool true

# disable natural scrolling
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false


# increase sound quality for Bluetooth Headphones
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

echo "Enable key repeat"
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

echo "Blazingly fast keyboard repeat rate"
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 10

defaults write com.apple.dock workspaces-auto-swoosh -bool NO


