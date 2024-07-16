#!/bin/bash
# ========================================================
# scripts/install.sh
# ========================================================
# Description: This script sets up the virtual environment, upgrades pip,
# and installs the required packages listed in the requirements.txt file.
#
# Usage: This script is intended to be run by the Makefile and can also
# be run manually to set up the development environment.
#
# Repository: https://github.com/jekwwer/python-template
# Author: Evgenii Shiliaev
# Date: 2024-07-16
# ========================================================

# Source the configuration script
source "$(dirname "$0")/config.sh"

# Use the variables defined in config.sh
$PYTHON -m venv $VENV_DIR
source $VENV_DIR/bin/activate

# Upgrade pip and install required packages
pip install --upgrade pip
pip install -r requirements.txt
pip install -e .

# ========================================================
# End of scripts/install.sh
# ========================================================
