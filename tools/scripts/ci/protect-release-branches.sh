#!/bin/bash

# ==-----------------------------------------------------------== #
# SPDX-FileCopyrightText: © 2025 Nayan Patil <nayantsg@proton.me>
#
# SPDX-License-Identifier: Apache-2.0
# ==-----------------------------------------------------------== #

# Define target branch pattern
TARGET_PATTERN="^release/.+$"

# Check if the pull request is targeting the branch
if [[ "$GITHUB_BASE_REF" =~ $TARGET_PATTERN ]]; then
    printf "Error: Pull requests to '%s' branches are not allowed.\n" "$GITHUB_BASE_REF"
    exit 1
else
    # If not targeting the branch, skip the check
    echo "Pull request is not targeting a release branch; skipping the check."
fi

exit 0

