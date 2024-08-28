#!/bin/bash
# ========================================================
# scripts/install.sh
# ========================================================
# Description: This script sets up the virtual environment, upgrades pip,
#              and installs the required packages listed in
#              the requirements.txt file for a production environment.
#
# Usage: This script is intended to be run by the Makefile.
#
# Run the script using:
# make install
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

# Upgrade pip and install required packages
execute_silently "pip install --upgrade pip" "pip upgrade"
execute_silently "pip install -r requirements.txt" "pip install requirements"

# ========================================================
# End of scripts/install.sh
# ========================================================
