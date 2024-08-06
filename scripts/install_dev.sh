#!/bin/bash
# ========================================================
# scripts/install-dev.sh
# ========================================================
# Description: This script sets up the virtual environment, upgrades pip,
#              and installs the required packages listed in
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
# Date: 2024-08-06
# ========================================================

# Source the configuration script
source "$(dirname "$0")/config.sh"

# Use the variables defined in config.sh
$PYTHON -m venv $VENV_DIR
source $VENV_DIR/bin/activate

# Upgrade pip and install required packages
pip install --upgrade pip
pip install -r dev-requirements.txt
pip install -e .

# Install pre-commit hooks
pre-commit install

# ========================================================
# End of scripts/install-dev.sh
# ========================================================
