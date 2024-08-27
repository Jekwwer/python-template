#!/bin/bash
# ========================================================
# scripts/clean.sh
# ========================================================
# Description: This script removes all temporary and build files
#              from the project directory, effectively cleaning
#              the project except for the logs and reports.
#
# Usage: This script is intended to be run by the Makefile.
#
# Run the script using:
# make clean
#
# Repository: https://github.com/jekwwer/python-template
# Author: Evgenii Shiliaev
# Author's GitHub Username: @Jekwwer
#
# Date: 2024-08-27
# ========================================================

# Source the configuration script
source "$(dirname "$0")/config.sh"

# Define the items to remove
items_to_remove=(
    "venv"
    ".tox"
    "dist"
    "build"
    "*.egg-info"
    "$SRC_DIR/*.egg-info"
    ".mypy_cache"
    ".pytest_cache"
    "*.pyc"        # Add pattern to remove compiled Python files
    "*__pycache__" # Add pattern to remove Python bytecode cache directories
)

# Remove the items defined above
for item in "${items_to_remove[@]}"; do
    remove_item "$item"
done

# Use exit_check to determine success or failure
exit_check

# ========================================================
# End of scripts/clean.sh
# ========================================================
