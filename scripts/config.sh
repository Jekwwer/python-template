#!/bin/bash
# ========================================================
# scripts/config.sh
# ========================================================
# Description: This script defines shared variables used across
# different scripts in the project. These variables include paths
# to the virtual environment, source directory, test directory,
# reports directory.
#
# Usage: This script is intended to be sourced by other scripts
# to maintain consistency and avoid repetition.
#
# Repository: https://github.com/jekwwer/python-template
# Author: Evgenii Shiliaev
# Date: 2024-07-26
# ========================================================

# Define shared variables
PYTHON=python3
VENV_DIR=venv
SRC_DIR=src
TEST_DIR=tests
REPORTS_DIR=reports

# Create reports directory if it doesn't exist
mkdir -p $REPORTS_DIR

# ========================================================
# End of scripts/config.sh
# ========================================================
