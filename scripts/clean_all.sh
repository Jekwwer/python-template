#!/bin/bash
# ========================================================
# scripts/clean_all.sh
# ========================================================
# Description: This script removes all temporary and build files
#              from the project directory, effectively cleaning
#              the project.
#
# Usage: This script is intended to be run by the Makefile.
#
# Run the script using:
# make clean-all
#
# Repository: https://github.com/jekwwer/python-template
# Author: Evgenii Shiliaev
# Author's GitHub Username: @Jekwwer
#
# Date: 2024-08-10
# ========================================================

# Source the configuration script
source "$(dirname "$0")/config.sh"

# Initialize the exit code sum variable
exit_code_sum=0

# Clean everything using the clean script
bash scripts/clean.sh
exit_code_sum=$(($exit_code_sum + $?))

# Remove logs and reports
rm -rf logs
exit_code_sum=$(($exit_code_sum + $?))

rm -rf reports
exit_code_sum=$(($exit_code_sum + $?))

rm -rf .benchmarks
exit_code_sum=$(($exit_code_sum + $?))

rm -rf .coverage
exit_code_sum=$(($exit_code_sum + $?))

exit_check $exit_code_sum
# ========================================================
# End of scripts/clean_all.sh
# ========================================================
