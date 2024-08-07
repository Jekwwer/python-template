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
# Date: 2024-08-08
# ========================================================

# Source the configuration script
source "$(dirname "$0")/config.sh"

# Check if the timestamp file exists and delete it if found
[ -f "$LOG_TAG_FILE" ] && rm -f "$LOG_TAG_FILE"

# Check if the .update_log_tag_done file exists
if [ ! -f .update_log_tag_done ]; then
    # Delete it if found
    rm -f $LOG_TAG_FILE
    touch .update_log_tag_done
fi

# ========================================================
# End of scripts/update_log_tag.sh
# ========================================================
