#!/bin/bash
# ========================================================
# scripts/clean_timestamp.sh
# ========================================================
# Project Name: Python Template Repository
# Description: This script checks for the existence of the
#              timestamp.txt file and deletes it if found.
#
# Usage: Run the script to remove the timestamp.txt file
#        if it exists. Typically used for cleaning up
#        before starting new tasks or processes.
#
# Run the script using:
# make clean-timestamp
#
# Repository: https://github.com/jekwwer/python-template
# Author: Evgenii Shiliaev
# Date: 2024-07-26
# ========================================================

# Source the configuration script
source "$(dirname "$0")/config.sh"

# Check if the timestamp file exists and delete it if found
[ -f "$TIMESTAMP_FILE" ] && rm -f "$TIMESTAMP_FILE"

# ========================================================
# End of scripts/scripts/clean_timestamp.sh
# ========================================================
