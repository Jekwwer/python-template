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
# Date: 2024-07-31
# ========================================================

# Source the configuration script
source "$(dirname "$0")/config.sh"

# Use the variables defined in config.sh
source $VENV_DIR/bin/activate

# Perform static analysis using Flake8
$VENV_DIR/bin/flake8 $SRC_DIR/ $TEST_DIR/ --output-file=$FLAKE8_REPORT
if [ $? -ne 0 ]; then
    log_error "flake8 failed. Check $FLAKE8_REPORT for details."
fi

# Perform static analysis using Pylint
$VENV_DIR/bin/pylint $SRC_DIR/ $TEST_DIR/ >$PYLINT_REPORT
if [ $? -ne 0 ]; then
    log_error "pylint failed. Check $PYLINT_REPORT for details."
fi

exit_check
# ========================================================
# End of scripts/lint.sh
# ========================================================
