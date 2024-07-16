#!/bin/bash
# ========================================================
# scripts/package.sh
# ========================================================
# Description: This script creates a source distribution and a wheel
# for the project, packaging the code for distribution.
#
# Usage: This script is intended to be run by the Makefile and can also
# be run manually to generate the distribution packages.
#
# Repository: https://github.com/jekwwer/python-template
# Author: Evgenii Shiliaev
# Date: 2024-07-16
# ========================================================

# Source the configuration script
source "$(dirname "$0")/config.sh"

# Use the variables defined in config.sh
source $VENV_DIR/bin/activate

# Create a source distribution and a wheel
$PYTHON setup.py sdist bdist_wheel

# ========================================================
# End of scripts/package.sh
# ========================================================
