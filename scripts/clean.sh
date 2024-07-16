#!/bin/bash
# ========================================================
# scripts/clean.sh
# ========================================================
# Description: This script removes all temporary and build files
# from the project directory, effectively cleaning the project.
#
# Usage: This script is intended to be run by the Makefile and Github Actions.
#
# Repository: https://github.com/jekwwer/python-template
# Author: Evgenii Shiliaev
# Date: 2024-07-16
# ========================================================

# Source the configuration script
source "$(dirname "$0")/config.sh"

# Remove virtual environment
rm -rf venv

# Remove distribution files
rm -rf dist

# Remove build files
rm -rf build

# Remove egg-info directories
rm -rf *.egg-info
rm -rf $SRC_DIR/placeholder_package.egg-info

# Remove MyPy cache
rm -rf .mypy_cache

# Remove Pytest cache
rm -rf .pytest_cache

# Remove compiled Python files
find . -type f -name "*.pyc" -delete

# Remove Python bytecode cache directories
find . -type d -name "__pycache__" -delete

# ========================================================
# End of scripts/clean.sh
# ========================================================
