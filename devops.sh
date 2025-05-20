#!/bin/bash

# Display a yes/no dialog to confirm the push
kdialog --title "ARE YOU SURE?" --yesno "Are you sure you want to push changes?"

# Capture the user's response
response=$?
if [ "$response" -eq 1 ]; then
    echo "ABORT"
    exit 0
fi

cd /mnt/LinuxData/Desktop/3ntutorials-fe/

# Run npm generate and check for success
if ! npm run generate; then
  echo "npm run generate failed. Exiting."
  exit 1
fi

# Copy the .output/public contents to the destination directory, overwriting files
cp -rf /mnt/LinuxData/Desktop/3ntutorials-fe/.output/public/* /mnt/LinuxData/Desktop/3NTutorials/

# Navigate to the destination directory
cd /mnt/LinuxData/Desktop/3NTutorials/

# Git operations
timestamp=$(date +"%Y-%m-%d %H:%M:%S")
git add *
git commit -m "$timestamp"
git checkout netlify
git push
 echo "DONE!"
exit 1
