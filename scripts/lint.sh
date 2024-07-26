#!/bin/bash
# ========================================================
# scripts/lint.sh
# ========================================================
# Description: This script performs static analysis on the code
#              in the source and test directories using
#              Flake8 and Pylint to ensure code quality.
#
# Usage: This script is intended to be run by the Makefile
#        and can also be run manually to check
#        for coding standard violations and potential errors.
#
# Run the script using:
# make lint
#
# Repository: https://github.com/jekwwer/python-template
# Author: Evgenii Shiliaev
# Date: 2024-07-26
# ========================================================

# Source the configuration script
source "$(dirname "$0")/config.sh"

# Use the variables defined in config.sh
source $VENV_DIR/bin/activate

# Perform static analysis using Flake8 and Pylint
$VENV_DIR/bin/flake8 $SRC_DIR/ $TEST_DIR/ --output-file=$FLAKE8_REPORT
$VENV_DIR/bin/pylint $SRC_DIR/ $TEST_DIR/ >$PYLINT_REPORT

# ========================================================
# End of scripts/lint.sh
# ========================================================
