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
# Date: 2024-08-10
# ========================================================

# Source the configuration script
source "$(dirname "$0")/config.sh"

# Create a virtual environment and activate it
$PYTHON -m venv $VENV_DIR
source $VENV_DIR/bin/activate

exit_code_sum=0

# Upgrade pip and install required packages
execute_silently "pip install --upgrade pip" "pip upgrade"
exit_code_sum=$(($exit_code_sum + $?))
execute_silently "pip install -r dev-requirements.txt" "pip install dev-requirements"
exit_code_sum=$(($exit_code_sum + $?))
execute_silently "pip install -e ." "pip install package"
exit_code_sum=$(($exit_code_sum + $?))

# Install pre-commit hooks
execute_silently "pre-commit install" "pre-commit install"
exit_code_sum=$(($exit_code_sum + $?))

exit_check $exit_code_sum
# ========================================================
# End of scripts/install-dev.sh
# ========================================================
