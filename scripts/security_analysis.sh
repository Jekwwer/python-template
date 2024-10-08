#!/bin/bash
# ========================================================
# scripts/security_analysis.sh
# ========================================================
# Description: This script performs security checks on the code
#              in the source and test directories using Bandit
#              to identify potential security issues.
#
# Usage: This script is intended to be run by the Makefile.
#
# Run the script using:
# make security-check
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

# Perform security analysis using Bandit
execute_silently "$VENV_DIR/bin/bandit -r $SRC_DIR/ $TEST_DIR/ -f json -o $BANDIT_REPORT;
                 if [ \$? -ne 0 ]; then echo 'Check $BANDIT_REPORT for details.' >&2; exit 1; fi" "bandit"

# Exit the script successfully
exit_check 0
# ========================================================
# End of scripts/security_analysis.sh
# ========================================================
