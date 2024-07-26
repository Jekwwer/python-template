#!/bin/bash
# ========================================================
# scripts/type_check.sh
# ========================================================
# Description: This script performs static type checking on the code
#              in the source and test directories using Mypy
#              to ensure type correctness.
#
# Usage: This script is intended to be run by the Makefile
#        and can also be run manually to verify type annotations
#        and detect type-related errors.
#
# Run the script using:
# make type-check
#
# Repository: https://github.com/jekwwer/python-template
# Author: Evgenii Shiliaev
# Date: 2024-07-26
# ========================================================

# Source the configuration script
source "$(dirname "$0")/config.sh"

# Use the variables defined in config.sh
source $VENV_DIR/bin/activate

# Perform static type checking using Mypy
$VENV_DIR/bin/mypy $SRC_DIR/ $TEST_DIR/ >$MYPY_REPORT

# ========================================================
# End of scripts/type_check.sh
# ========================================================
