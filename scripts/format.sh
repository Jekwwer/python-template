#!/bin/bash
# ========================================================
# scripts/format.sh
# ========================================================
# Description: This script formats the code in the source and test
#              directories using autopep8 with aggressive settings.
#
# Usage: This script is intended to be run by the Makefile and can
#        also be run manually to ensure code style consistency.
#
# Run the script using:
# make format
#
# Repository: https://github.com/jekwwer/python-template
# Author: Evgenii Shiliaev
# Author's GitHub Username: @Jekwwer
#
# Date: 2024-08-10
# ========================================================

# Source the configuration script
source "$(dirname "$0")/config.sh"

# Activate the virtual environment
source $VENV_DIR/bin/activate

# Initialize the exit code sum variable
exit_code_sum=0

# Run isort to organize import statements
execute_silently "$VENV_DIR/bin/isort $SRC_DIR/ $TEST_DIR/" "isort"
exit_code_sum=$(($exit_code_sum + $?))

# Format code in the source and test directories
execute_silently "$VENV_DIR/bin/autopep8 --in-place --aggressive --aggressive --recursive -v $SRC_DIR/ $TEST_DIR/ &>$AUTOPEP8_REPORT;
                 if [ \$? -ne 0 ]; then echo 'Check $AUTOPEP8_REPORT for details.' >&2; exit 1; fi" "autopep8"
exit_code_sum=$(($exit_code_sum + $?))

exit_check $exit_code_sum
# ========================================================
# End of scripts/format.sh
# ========================================================
