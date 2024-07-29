#!/bin/bash
# ========================================================
# scripts/test.sh
# ========================================================
# Description: This script runs the test suite using pytest via Tox
#              to ensure that all tests in the test directory pass successfully.
#
# Usage: This script is intended to be run by the Makefile
#        and can also be run manually to execute the test suite.
#
# Run the script using:
# make test
#
# Repository: https://github.com/jekwwer/python-template
# Author: Evgenii Shiliaev
# Date: 2024-07-29
# ========================================================

# Source the configuration script
source "$(dirname "$0")/config.sh"

# Install Tox because it needs to run in the same shell on the CI server
pip install tox

# Run tests with Tox
tox

# Rename the coverage report file to have a timestamp
mv $REPORTS_DIR/coverage.xml $COVERAGE_REPORT

# Rename the xunit result file to have a timestamp
mv $REPORTS_DIR/xunit-result.xml $XUNIT_REPORT

# Find the latest benchmark report file
GENEREATED_BENCHMARK_REPORT=$(find . -type f -name "*benchmark*" -print0 | xargs -0 stat --format '%W %n' | sort -n | tail -n 1 | cut -d' ' -f2-)

# Rename the benchmark result file to have a timestamp
mv $GENEREATED_BENCHMARK_REPORT $BENCHMARK_REPORT

# ========================================================
# End of scripts/test.sh
# ========================================================
