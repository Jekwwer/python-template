#!/bin/bash
# ========================================================
# scripts/build_package.sh
# ========================================================
# Description: This script creates a source distribution and a wheel
#              for the project, packaging the code for distribution.
#
# Usage: This script is intended to be run by the Makefile.
#
# Run the script using:
# make package
#
# Repository: https://github.com/jekwwer/python-template
# Author: Evgenii Shiliaev
# Author's GitHub Username: @Jekwwer
#
# Date: 2024-08-27
# ========================================================

# Source the configuration script
source "$(dirname "$0")/config.sh"

# Check and activate the virtual environment
check_and_activate_venv

# Ensure setup.py exists
if [ ! -f "setup.py" ]; then
    echo_red "setup.py not found in the current directory."
    echo_red "Ensure setup.py exists in the project root directory."
    echo_red "Please run the script from the project's root directory."
    exit_check 1
fi

# Create a source distribution and a wheel
execute_silently "$PYTHON setup.py sdist bdist_wheel" "package project"
exit_check # Check the exit status of the package creation process
# ========================================================
# End of scripts/build_package.sh
# ========================================================
