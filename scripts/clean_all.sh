#!/bin/bash
# ========================================================
# scripts/clean_all.sh
# ========================================================
# Description: This script removes all temporary and build files
#              from the project directory, effectively cleaning
#              the project.
#
# Usage: This script is intended to be run by the Makefile.
#
# Run the script using:
# make clean-all
#
# Repository: https://github.com/jekwwer/python-template
# Author: Evgenii Shiliaev
# Author's GitHub Username: @Jekwwer
#
# Date: 2024-08-28
# ========================================================

# Source the configuration script
source "$(dirname "$0")/config.sh"

make clean

# Remove logs, reports, and other build artifacts
items_to_remove=("logs" "reports" ".benchmarks" ".coverage")

for item in "${items_to_remove[@]}"; do
    remove_item "$item"
done

# Exit the script successfully
exit_check 0
# ========================================================
# End of scripts/clean_all.sh
# ========================================================
