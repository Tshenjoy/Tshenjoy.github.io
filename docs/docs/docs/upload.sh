#!/bin/bash

# copy the generated site files to the docs folder where the github page deploys from 
# and then push the changes to the cloud_version branch 

# Check if a commit message was provided
if [ -z "$1" ]; then
  echo "Error: No commit message provided."
  echo "Usage: $0 '<commit-message>'"
  return 0 2>/dev/null || exit 0  # This prevents terminal from closing when sourced
fi

# Step 1: Build the project
bundle exec jekyll build

# Step 2: Copy files from _site to docs/
cp -r ./_site/ ./docs/

# Step 3: Add, commit with the provided message, and push changes
git add .
git commit -m "$1"
git push 