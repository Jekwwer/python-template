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
# Date: 2024-08-10
# ========================================================

# Source the configuration script
source "$(dirname "$0")/config.sh"

# Initialize the exit code sum variable
exit_code_sum=0

# Remove virtual environment
rm -rf venv
exit_code_sum=$(($exit_code_sum + $?))

# Remove Tox environment
rm -rf .tox
exit_code_sum=$(($exit_code_sum + $?))

# Remove distribution files
rm -rf dist
exit_code_sum=$(($exit_code_sum + $?))

# Remove build files
rm -rf build
exit_code_sum=$(($exit_code_sum + $?))

# Remove egg-info directories
rm -rf *.egg-info
exit_code_sum=$(($exit_code_sum + $?))
rm -rf $SRC_DIR/*.egg-info
exit_code_sum=$(($exit_code_sum + $?))

# Remove MyPy cache
rm -rf .mypy_cache
exit_code_sum=$(($exit_code_sum + $?))

# Remove Pytest cache
rm -rf .pytest_cache
exit_code_sum=$(($exit_code_sum + $?))

# Remove compiled Python files
find . -type f -name "*.pyc" -delete
exit_code_sum=$(($exit_code_sum + $?))

# Remove Python bytecode cache directories
find . -type d -name "__pycache__" -delete
exit_code_sum=$(($exit_code_sum + $?))

exit_check $exit_code_sum
# ========================================================
# End of scripts/clean.sh
# ========================================================
