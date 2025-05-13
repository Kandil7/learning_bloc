#!/bin/bash

# Create a new branch from master
git checkout master
git checkout -b feature/ui-complete

# Merge each feature branch
git merge feature/ui-basic-components-impl --no-edit
git merge feature/ui-material-design-impl --no-edit
git merge feature/ui-cupertino-design-impl --no-edit
git merge feature/ui-responsive-design-impl --no-edit
git merge feature/ui-advanced-techniques-impl --no-edit
git merge feature/ui-section-main-page-update --no-edit

# Push the new branch
git push origin feature/ui-complete

echo "All UI branches merged into feature/ui-complete"
