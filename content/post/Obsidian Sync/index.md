+++
title = 'Obsidian Sync'
date = 2024-05-16T20:45:29+03:00
draft = true
+++

## Obsidian sync via GDrive

Targets:

- Sync multiple linux machines and android phone
- Have versioning
- Ensure sync will happen even if only one machine is up - it should receive the most recent changes
- Sync should be automatic, without user intervention

Solution:

- Have GDrive as main sync drive
- Have git repo for versioning
- Use rclone from linux machines for GDrive sync
- Use DriveSync for Android sync

Details:

Create GDrive folder for Obsidian vault.
Create local folder for Obsidian vault.
Install rclone.
Configure rclone connection - rclone has very good explanation of how it should be set (add link to rclone help)
Setup private github repo for Obsidian vault.
Write two scripts - one to pull from GDrive, and the other one to push to GDrive and Github
Add actions plugin to Obsidian and configure two triggers - on load pull, on change push
For android device you can use DriveSync. You will need pro version for it.
