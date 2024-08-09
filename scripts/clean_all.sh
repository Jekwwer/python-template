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
# Date: 2024-08-09
# ========================================================

# Clean everything using the clean script
bash scripts/clean.sh

# Remove logs and reports
rm -rf logs
rm -rf reports
rm -rf .benchmarks
rm -rf .coverage

# ========================================================
# End of scripts/clean_all.sh
# ========================================================
