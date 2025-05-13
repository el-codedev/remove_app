#!/bin/bash

# WARNING
# This script is designed to remove an application and its associated files from your macOS system.
# It uses `sudo` to gain administrative privileges and will delete files in critical directories such as:
# - /Applications/
# - ~/Library/Application Support/
# - ~/Library/Preferences/
# - ~/Library/Caches/
# - ~/Library/Saved Application State/
# - /Library/Application Support/
# - /Library/Preferences/
# - /Library/Caches/
#
# IMPORTANT: Make sure you have backups before proceeding.
# If you do not want certain directories to be affected, you can comment out those lines.

# Check if the app name is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <AppName>"
    echo "Example: $0 Safari"
    exit 1
fi

APP_NAME="$1"
APP_PATH="/Applications/${APP_NAME}.app"

# Check if the app exists
if [ ! -d "$APP_PATH" ]; then
    echo "$APP_NAME is not installed in /Applications."
else
    echo "Removing $APP_NAME from /Applications..."
    sudo rm -rf "$APP_PATH"
    echo "$APP_NAME removed from Applications."
fi

# Remove associated files in User Library
echo "Removing user library files..."
sudo rm -rf "$HOME/Library/Application Support/$APP_NAME"
sudo rm -rf "$HOME/Library/Preferences/com.apple.${APP_NAME}.plist"
sudo rm -rf "$HOME/Library/Preferences/com.apple.${APP_NAME}.plist.lockfile"
sudo rm -rf "$HOME/Library/Caches/com.apple.${APP_NAME}"
sudo rm -rf "$HOME/Library/Saved Application State/com.apple.${APP_NAME}.savedState"

# Remove associated files in System Library
echo "Removing system library files..."
sudo rm -rf "/Library/Application Support/$APP_NAME"
sudo rm -rf "/Library/Preferences/com.apple.${APP_NAME}.plist"
sudo rm -rf "/Library/Caches/com.apple.${APP_NAME}"

# Optionally, remove audio loops and indexes
echo "Removing Apple Loops (optional cleanup)..."
sudo rm -rf "$HOME/Library/Audio/Apple Loops"
sudo rm -rf "/Library/Audio/Apple Loops"
sudo rm -rf "$HOME/Library/Audio/Apple Loops Index"
sudo rm -rf "/Library/Audio/Apple Loops Index"

echo "$APP_NAME and associated files removed."

# Prompt to empty the Trash
read -p "Do you want to empty the Trash? [y/N]: " trash_confirm
if [[ "$trash_confirm" == "y" || "$trash_confirm" == "Y" ]]; then
    echo "Emptying Trash..."
    sudo rm -rf "$HOME/.Trash/"*
    echo "Trash emptied."
else
    echo "Trash not emptied."
fi

echo "✅ Cleanup completed."
