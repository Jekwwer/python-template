#!/bin/bash
# ========================================================
# scripts/lint.sh
# ========================================================
# Description: This script performs static analysis on the code
#              in the source and test directories using
#              Flake8 and Pylint to ensure code quality.
#
# Usage: This script is intended to be run by the Makefile.
#
# Run the script using:
# make lint
#
# Repository: https://github.com/jekwwer/python-template
# Author: Evgenii Shiliaev
# Author's GitHub Username: @Jekwwer
#
# Date: 2024-08-28
# ========================================================

# Source the configuration script
source "$(dirname "$0")/config.sh"

# Check and activate the virtual environment
check_and_activate_venv

# Perform static analysis using Flake8 and generate a report
execute_silently "$VENV_DIR/bin/flake8 $SRC_DIR/ $TEST_DIR/ --output-file=$FLAKE8_REPORT;
                 if [ \$? -ne 0 ]; then echo 'Check $FLAKE8_REPORT for details.' >&2; exit 1; fi" "flake8"

# Perform static analysis using Pylint and generate a report
execute_silently "$VENV_DIR/bin/pylint $SRC_DIR/ $TEST_DIR/ >$PYLINT_REPORT;
                 if [ \$? -ne 0 ]; then echo 'Check $PYLINT_REPORT for details.' >&2; exit 1; fi" "pylint"

# ========================================================
# End of scripts/lint.sh
# ========================================================
