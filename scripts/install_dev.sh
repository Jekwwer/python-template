#!/bin/bash
# ========================================================
# scripts/install-dev.sh
# ========================================================
# Description: This script sets up the virtual environment, upgrades pip,
#              installs the required packages listed in
#              the dev-requirements.txt file, and sets up pre-commit hooks.
#
# Usage: This script is intended to be run by the Makefile.
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

# Set up and activate the virtual environment
setup_virtualenv
check_and_activate_venv

# Upgrade pip to the latest version
execute_silently "pip install --upgrade pip" "pip upgrade"

# Install development dependencies from dev-requirements.txt
execute_silently "pip install -r dev-requirements.txt" "pip install dev-requirements"

# Install the package itself in editable mode
execute_silently "pip install -e ." "pip install package"

# Install pre-commit hooks
execute_silently "pre-commit install" "pre-commit install"

# Exit the script successfully
exit_check 0
# ========================================================
# End of scripts/install-dev.sh
# ========================================================
