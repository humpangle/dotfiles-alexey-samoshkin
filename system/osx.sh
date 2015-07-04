#!/usr/bin/env bash

# see http://secrets.blacktree.com/ for different settings
# see https://github.com/mathiasbynens/dotfiles/blob/master/.osx

# ===========================
# General settings
# ===========================

# Expand save panel by default
defaults write -g NSNavPanelExpandedStateForSaveMode -bool true
defaults write -g NSNavPanelExpandedStateForSaveMode2 -bool true

# Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# Set sidebar icon size to medium
defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 2

# Disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# Increase window resize speed for Cocoa applications
defaults write -g NSWindowResizeTime -float 0.001

# Disable automatic termination of inactive apps
defaults write -g NSDisableAutomaticTermination -bool true

# check updates once a week
sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate ScheduleFrequency 7

# Save to disk (not to iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Enable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool true

# make menu bar translucent
defaults write -g AppleEnableMenuBarTransparency -bool true

# Reveal IP address, hostname, OS version, etc. when clicking the clock
# in the login window
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName

# Add a context menu item for showing the Web Inspector in web views"
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

# Restart automatically if the computer freezes
sudo systemsetup -setrestartfreeze on

# wake on network access
sudo systemsetup -setwakeonnetworkaccess on > /dev/null

# Disable Resume system-wide
defaults write com.apple.systempreferences NSQuitAlwaysKeepsWindows -bool false

# Disable smart quotes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# Disable smart dashes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false


# ===========================
# Display
# ===========================

# Enable subpixel font rendering on non-Apple LCDs
# FIXME: this is really pain, it's still looks ugly on my DELL U2412 monitor
# defaults write NSGlobalDomain AppleFontSmoothing -int 2

# Enable HiDPI display modes (requires restart)
# sudo defaults write /Library/Preferences/com.apple.windowserver DisplayResolutionEnabled -bool true


# ===========================
# Power Management
# ===========================

# on power
sudo pmset -c displaysleep 10
sudo pmset -c sleep 15
sudo pmset -c disksleep 20

# on battery
sudo pmset -b displaysleep 5
sudo pmset -b sleep 10
sudo pmset -b disksleep 10

# disable display sleep to use an intermediate half-brightness state between full brightness and fully off  (value = 0/1)
# just make it fully off
sudo pmset -a halfdim 0

# disable screen saver
defaults -currentHost write com.apple.screensaver idleTime 0

# Require password immediately after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0


# ===========================
# Keyboard
# ===========================

# Disable press-and-hold for keys in favor of key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# increase key repeat rate
defaults write NSGlobalDomain KeyRepeat -int 1

# Enable full keyboard access for all controls (e.g. enable Tab in modal dialogs)
defaults write -g AppleKeyboardUIMode -int 2

# use default behavior for F1, F2 keys
defaults write -g com.apple.keyboard.fnState -bool true

# InitialKeyRepeat is 35 now
# defaults write NSGlobalDomain InitialKeyRepeat -int 12


# ===========================
# TrackPad
# ===========================

# Trackpad: enable tap to click for this user and for the login screen
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Trackpad: map bottom right corner to right-click
# FIXME: both two finger tap and bottom right click does not work at the same time
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true
defaults -currentHost write NSGlobalDomain com.apple.trackpad.trackpadCornerClickBehavior -int 1
defaults -currentHost write NSGlobalDomain com.apple.trackpad.enableSecondaryClick -bool true

# Disable “natural” (Lion-style) scrolling
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

# drag with three fingers
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -int 1


# ===========================
# Dock & Dashboard
# ===========================

defaults write com.apple.dock tilesize -int 36
defaults write com.apple.dock orientation -string "right"
defaults write com.apple.dock "show-process-indicators" -int 1
defaults write com.apple.dock "trash-full" -int 1
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock showhidden -bool true
defaults write com.apple.dock "dashboard-in-overlay" -int 0
defaults write com.apple.dock magnification -int 1
defaults write com.apple.dock "minimize-to-application" -int 1
defaults write com.apple.dock largesize -int 62
defaults write com.apple.dock no-glass -int 1
defaults write com.apple.dock mineffect -string "scale"
defaults write com.apple.dock launchanim -bool false

# Disable Dashboard
defaults write com.apple.dashboard mcx-disabled -bool true

# Don’t automatically rearrange Spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false


# ===========================
# Locale and language
# ===========================

defaults write NSGlobalDomain AppleLocale -string "en_UA"
defaults write NSGlobalDomain AppleMeasurementUnits -string "Centimeters"
defaults write NSGlobalDomain AppleMetricUnits -bool true

# Set the timezone; see `sudo systemsetup -listtimezones` for other values
sudo systemsetup -settimezone "Europe/Kiev" > /dev/null


# ===========================
# Accessibility
# ===========================

# Use scroll gesture with the Ctrl (^) modifier key to zoom
defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true
defaults write com.apple.universalaccess HIDScrollZoomModifierMask -int 262144

# Follow the keyboard focus while zoomed in
defaults write com.apple.universalaccess closeViewZoomFollowsFocus -bool true


# ===========================
# Finder
# ===========================

# Finder: allow quitting via ⌘ + Q; doing so will also hide desktop icons
defaults write com.apple.finder QuitMenuItem -bool true

# Finder: disable window animations and Get Info animations
defaults write com.apple.finder DisableAllAnimations -bool true

# Show icons for hard drives, servers, and removable media on the desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# Finder: allow text selection in Quick Look
defaults write com.apple.finder QLEnableTextSelection -bool true

# Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Display full POSIX path as Finder window title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Finder: show hidden files by default
defaults write com.apple.finder AppleShowAllFiles -bool true

# Use list view in all Finder windows by default
# Four-letter codes for the other view modes: `icnv`, `clmv`, `Flwv`
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Empty Trash securely by default
defaults write com.apple.finder EmptyTrashSecurely -bool true

# disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# disable warn on empty trash
defaults write com.apple.finder WarnOnEmptyTrash -bool false

# Show the ~/Library folder
chflags nohidden ~/Library

# Expand the following File Info panes:
# “General”, “Open with”, and “Sharing & Permissions”
defaults write com.apple.finder FXInfoPanesExpanded -dict \
	General -bool true \
	OpenWith -bool true \
	Privileges -bool true

# show path bar, but do not show status bar
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder ShowStatusBar -bool false


# ===========================
# Activity Monitor
# ===========================

# Show the main window when launching Activity Monitor
defaults write com.apple.ActivityMonitor OpenMainWindow -bool true

# Sort Activity Monitor results by CPU usage
defaults write com.apple.ActivityMonitor SortColumn -string "CPUUsage"
defaults write com.apple.ActivityMonitor SortDirection -int 0

# TODO: add energy impact column to CPU view


# ===========================
# Terminal
# ===========================

# only UTF-8 in terminal.app
defaults write com.apple.terminal StringEncodings -array 4


# ===========================
# Chrome
# ===========================

# disable swipe right/left with two fingers to navigate history back/forward in Chrome
defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool false


# ===========================
# Screen capture
# ===========================

# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
defaults write com.apple.screencapture type -string "png"

# Disable shadow in screenshots
defaults write com.apple.screencapture disable-shadow -bool true
