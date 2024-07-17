#!/bin/bash
# ========================================================
# scripts/format.sh
# ========================================================
# Description: This script formats the code in the source and test
# directories using autopep8 with aggressive settings.
#
# Usage: This script is intended to be run by the Makefile and can
# also be run manually to ensure code style consistency.
#
# Repository: https://github.com/jekwwer/python-template
# Author: Evgenii Shiliaev
# Date: 2024-07-16
# ========================================================

# Source the configuration script
source "$(dirname "$0")/config.sh"

# Use the variables defined in config.sh
source $VENV_DIR/bin/activate

# Run isort to organize import statements
$VENV_DIR/bin/isort $SRC_DIR/ $TEST_DIR/

# Format code in the source and test directories
$VENV_DIR/bin/autopep8 --in-place --aggressive --aggressive --recursive $SRC_DIR/ $TEST_DIR/

# ========================================================
# End of scripts/format.sh
# ========================================================
