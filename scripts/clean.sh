#!/bin/bash
# ========================================================
# scripts/clean.sh
# ========================================================
# Description: This script removes all temporary and build files
#              from the project directory, effectively cleaning
#              the project.
#
# Usage: This script is intended to be run by the Makefile
#        and Github Actions.
#
# Run the script using:
# make clean
#
# Repository: https://github.com/jekwwer/python-template
# Author: Evgenii Shiliaev
# Author's GitHub Username: @Jekwwer
#
# Date: 2024-08-09
# ========================================================

# Source the configuration script
source "$(dirname "$0")/config.sh"

# Remove virtual environment
rm -rf venv

# Remove Tox environment
rm -rf .tox

# Remove distribution files
rm -rf dist

# Remove build files
rm -rf build

# Remove egg-info directories
rm -rf *.egg-info
rm -rf $SRC_DIR/*.egg-info

# Remove MyPy cache
rm -rf .mypy_cache

# Remove Pytest cache
rm -rf .pytest_cache

# Remove compiled Python files
find . -type f -name "*.pyc" -delete

# Remove Python bytecode cache directories
find . -type d -name "__pycache__" -delete

# Remove logs and reports
rm -rf logs
rm -rf reports
rm -rf .benchmarks
rm -rf .coverage

# ========================================================
# End of scripts/clean.sh
# ========================================================
