# Git Branch Sync Script

A PowerShell script that helps keep your local git branches in sync with remote branches by:

- Switching to main branch
- Fetching remote branches
- Deleting local branches that no longer exist in remote
- Updating main branch with latest changes

## Prerequisites

- Git installed on your Windows machine
- PowerShell

## Installation

1. Save the `.ps1` script file as `git-sync.ps1` in a permanent location (e.g., `C:\Scripts\git-sync.ps1`)

2. Create a git alias by running this command in your terminal (update the path to match your script location):

3. Command to create alias: `git config --global alias.sync '!powershell.exe -ExecutionPolicy Bypass -File "C:\Scripts\git-sync.ps1"'`
