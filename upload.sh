#!/bin/bash

# copy the generated site files to the docs folder where the github page deploys from 
# and then push the changes to the cloud_version branch 

# Check if a commit message was provided
if [ -z "$1" ]; then
  echo "Error: No commit message provided."
  echo "Usage: $0 '<commit-message>'"
  exit 1
fi

# Step 2: Copy files from _site to docs/
cp -r ./_site/ ./docs/

# Step 3: Add, commit with the provided message, and push changes
git add .
git commit -m "$1"
git push 