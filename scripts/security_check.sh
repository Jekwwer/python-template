#!/bin/bash
# ========================================================
# scripts/security_check.sh
# ========================================================
# Description: This script performs security checks on the code
#              in the source and test directories using Bandit
#              to identify potential security issues.
#
# Usage: This script is intended to be run by the Makefile
#        and can also be run manually to ensure
#        the codebase is free from common security vulnerabilities.
#
# Run the script using:
# make security-check
#
# Repository: https://github.com/jekwwer/python-template
# Author: Evgenii Shiliaev
# Author's GitHub Username: @Jekwwer
#
# Date: 2024-08-06
# ========================================================

# Source the configuration script
source "$(dirname "$0")/config.sh"

# Use the variables defined in config.sh
source $VENV_DIR/bin/activate

# Perform security checks using Bandit
$VENV_DIR/bin/bandit -r $SRC_DIR/ $TEST_DIR/ -f json -o $BANDIT_REPORT

# ========================================================
# End of scripts/security_check.sh
# ========================================================
