# remove_app
Bash Script for Full Application Removal on macOS

A simple and powerful Bash script to completely remove a macOS application and its associated files from your system.

> ⚠️ WARNING: This script performs **permanent deletion** of application files and support data using `sudo`. Use with caution and make sure you have a backup before proceeding.

---

## 🔧 What It Does

This script:

- Removes the application from `/Applications/`
- Deletes associated files from:
  - `~/Library/Application Support/`
  - `~/Library/Preferences/`
  - `~/Library/Caches/`
  - `~/Library/Saved Application State/`
  - `/Library/Application Support/`
  - `/Library/Preferences/`
  - `/Library/Caches/`
  - Optionally: Audio loops and indexes
- Optionally empties the Trash

---

## 🖥️ Requirements

- macOS
- Terminal with `sudo` access
- Recommended: Terminal granted **Full Disk Access**  
  (`System Settings > Privacy & Security > Full Disk Access`)

---

## 🛠️ How to Use

1. Open Terminal
2. Navigate to the folder where the script is saved
3. Make the script executable:

   ```bash
   chmod +x remove_app.sh
