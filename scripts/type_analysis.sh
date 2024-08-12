#!/bin/bash
# ========================================================
# scripts/type_analysis.sh
# ========================================================
# Description: This script performs static type checking on the code
#              in the source and test directories using Mypy
#              to ensure type correctness.
#
# Usage: This script is intended to be run by the Makefile.
#
# Run the script using:
# make type-check
#
# Repository: https://github.com/jekwwer/python-template
# Author: Evgenii Shiliaev
# Author's GitHub Username: @Jekwwer
#
# Date: 2024-08-12
# ========================================================

# Source the configuration script
source "$(dirname "$0")/config.sh"

# Use the variables defined in config.sh
source $VENV_DIR/bin/activate

# Perform static type checking using Mypy
execute_silently "$VENV_DIR/bin/mypy $SRC_DIR/ $TEST_DIR/ >$MYPY_REPORT;
                 if [ \$? -ne 0 ]; then echo 'Check $MYPY_REPORT for details.' >&2; exit 1; fi" "mypy"

exit_check $?
# ========================================================
# End of scripts/type_analysis.sh
# ========================================================
