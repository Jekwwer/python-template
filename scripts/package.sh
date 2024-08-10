#!/bin/bash
# ========================================================
# scripts/package.sh
# ========================================================
# Description: This script creates a source distribution and a wheel
#              for the project, packaging the code for distribution.
#
# Usage: This script is intended to be run by the Makefile and can also
#        be run manually to generate the distribution packages.
#
# Run the script using:
# make package
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

# Create a source distribution and a wheel
execute_silently "$PYTHON setup.py sdist bdist_wheel" "package project"

exit_check $?
# ========================================================
# End of scripts/package.sh
# ========================================================
