#!/bin/bash

# ==-----------------------------------------------------------== #
# SPDX-FileCopyrightText: © 2025 Nayan Patil <nayantsg@proton.me>
#
# SPDX-License-Identifier: Apache-2.0
# ==-----------------------------------------------------------== #

if [ -n "$(git status --porcelain)" ]; then
    echo "Error: You have uncommitted changes. Please commit or stash them before continuing."
    exit 1
fi

read -rp "Enter the new version number (e.g., 0.4.0): " NEW_VERSION

if [ -z "$NEW_VERSION" ]; then
    echo "Error: No version entered. Aborting."
    exit 1
fi

PKL_FILES=(
    "tools/stdschema.pkl.ci/PklProject"
)

for PKL_FILE in "${PKL_FILES[@]}"; do
    if [ -f "$PKL_FILE" ]; then
        sed -i "s/version = \".*\"/version = \"$NEW_VERSION\"/" "$PKL_FILE"
        echo "Successfully updated $PKL_FILE to version: $NEW_VERSION"
    else
        echo "Warning: $PKL_FILE not found. Skipping."
    fi
done

echo "Version bump complete!"
