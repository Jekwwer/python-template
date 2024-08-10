#!/bin/bash
# ========================================================
# scripts/run_tests.sh
# ========================================================
# Description: This script runs the test suite using pytest via Tox
#              to ensure that all tests in the test directory pass successfully.
#
# Usage: This script is intended to be run by the Makefile.
#
# Run the script using:
# make test
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

# Install Tox because it needs to run in the same shell on the CI server
execute_silently "pip install tox" "tox install"
exit_code_sum=$(($exit_code_sum + $?))

# Run tests with Tox
execute_silently "tox" "tox"
exit_code_sum=$(($exit_code_sum + $?))

# Rename the coverage report file to have a timestamp
execute_silently "mv $REPORTS_DIR/coverage.xml $COVERAGE_REPORT" "rename coverage report"
exit_code_sum=$(($exit_code_sum + $?))

# Rename the xunit result file to have a timestamp
execute_silently "mv $REPORTS_DIR/xunit-result.xml $XUNIT_REPORT" "rename xunit report"
exit_code_sum=$(($exit_code_sum + $?))

# Find the latest benchmark report and rename it
find_and_move_command="mv \"\$(find . -type f -name \"*benchmark*\" -print0 | xargs -0 stat --format '%W %n' | sort -n | tail -n 1 | cut -d' ' -f2-)\" \"$BENCHMARK_REPORT\""
execute_silently "$find_and_move_command" "rename benchmark report"
exit_code_sum=$(($exit_code_sum + $?))

exit_check $exit_code_sum
# ========================================================
# End of scripts/run_tests.sh
# ========================================================
