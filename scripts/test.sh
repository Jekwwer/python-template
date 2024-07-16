#!/bin/bash
# ========================================================
# scripts/test.sh
# ========================================================
# Description: This script runs the test suite using pytest to ensure that
# all tests in the test directory pass successfully.
#
# Usage: This script is intended to be run by the Makefile and can also
# be run manually to execute the test suite.
#
# Repository: https://github.com/jekwwer/python-template
# Author: Evgenii Shiliaev
# Date: 2024-07-16
# ========================================================

# Source the configuration script
source "$(dirname "$0")/config.sh"

# Use the variables defined in config.sh
source $VENV_DIR/bin/activate

# Run the test suite using pytest
$VENV_DIR/bin/pytest $TEST_DIR

# ========================================================
# End of scripts/test.sh
# ========================================================
