#!/bin/bash
# ========================================================
# scripts/update_log_tag.sh
# ========================================================
# Project Name: Python Template Repository
# Description: This script checks for the existence of the
#              log-tag.txt file and deletes it if found.
#
# Usage: Typically used for cleaning up previous run information
#        before starting new tasks or processes.
#
# Run the script using:
# make update-log-tag
#
# Repository: https://github.com/jekwwer/python-template
# Author: Evgenii Shiliaev
# Author's GitHub Username: @Jekwwer
#
# Date: 2024-08-12
# ========================================================

# Source the configuration script
source "$(dirname "$0")/config.sh"

# Check if running on GitHub Actions
if [ "$GITHUB_ACTIONS" = "true" ]; then
    exit_check 0 # Skip this script on GitHub Actions
fi

# Check if the log tag file exists and delete it if found
execute_silently "[ -f \"$LOG_TAG_FILE\" ] && rm -f \"$LOG_TAG_FILE\"" "check and delete log tag file"

exit_check $?
# ========================================================
# End of scripts/update_log_tag.sh
# ========================================================
