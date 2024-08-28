#!/bin/bash
# ========================================================
# scripts/install-dev.sh
# ========================================================
# Description: This script sets up the virtual environment, upgrades pip,
#              installs the required packages listed in
#              the dev-requirements.txt file, and sets up pre-commit hooks.
#
# Usage: This script is intended to be run by the Makefile and can also
#        be run manually to set up the development environment.
#
# Run the script using:
# make install-dev
#
# Repository: https://github.com/jekwwer/python-template
# Author: Evgenii Shiliaev
# Author's GitHub Username: @Jekwwer
#
# Date: 2024-08-28
# ========================================================

# Source the configuration script
source "$(dirname "$0")/config.sh"

# Create a virtual environment and activate it
$PYTHON -m venv $VENV_DIR

# Check and activate the virtual environment
check_and_activate_venv

# Upgrade pip to the latest version
execute_silently "pip install --upgrade pip" "pip upgrade"

# Install development dependencies from dev-requirements.txt
execute_silently "pip install -r dev-requirements.txt" "pip install dev-requirements"

# Install the package itself in editable mode
execute_silently "pip install -e ." "pip install package"

# Install pre-commit hooks
execute_silently "pre-commit install" "pre-commit install"

# ========================================================
# End of scripts/install-dev.sh
# ========================================================
