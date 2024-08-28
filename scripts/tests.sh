#!/bin/bash
# ========================================================
# scripts/tests.sh
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
# Date: 2024-08-28
# ========================================================

# Source the configuration script
source "$(dirname "$0")/config.sh"

# Function to rename a report with a timestamp
rename_report() {
    local src_file="$1"
    local dest_file="$2"

    if [ -f "$src_file" ]; then
        mv "$src_file" "$dest_file"
        echo_green "Renamed $src_file to $dest_file"
    else
        echo_yellow "Source file $src_file not found. Skipping rename."
    fi
}

# Install Tox because it needs to run in the same shell on the CI server
execute_silently "pip install tox" "tox install"

# Run tests with Tox
execute_silently "tox" "tox"

# Rename the coverage report file to have a timestamp
rename_report "$REPORTS_DIR/coverage.xml" "$COVERAGE_REPORT"

# Rename the xunit result file to have a timestamp
rename_report "$REPORTS_DIR/xunit-result.xml" "$XUNIT_REPORT"

# Find the latest benchmark report and rename it
find_latest_benchmark() {
    find . -type f -name "*benchmark*" -print0 | xargs -0 stat --format '%W %n' | sort -n | tail -n 1 | cut -d' ' -f2-
}

latest_benchmark=$(find_latest_benchmark)
if [ -n "$latest_benchmark" ]; then
    rename_report "$latest_benchmark" "$BENCHMARK_REPORT"
else
    echo_yellow "No benchmark report found."
fi

# ========================================================
# End of scripts/tests.sh
# ========================================================
