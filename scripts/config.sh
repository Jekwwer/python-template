#!/bin/bash
# ========================================================
# scripts/config.sh
# ========================================================
# Description: This script defines shared variables used across
# different scripts in the project. These variables include paths
# to the virtual environment, source directory, test directory,
# reports directory and generate a timestamp for logging purposes.
#
# Usage: This script is intended to be sourced by other scripts
#        to maintain consistency and avoid repetition.
#
# Source this configuration script in other scripts using:
# source "$(dirname "$0")/config.sh"
#
# Repository: https://github.com/jekwwer/python-template
# Author: Evgenii Shiliaev
# Date: 2024-07-29
# ========================================================

# Define shared variables
PYTHON=python3
VENV_DIR=venv
SRC_DIR=src
TEST_DIR=tests
REPORTS_DIR=reports

# Create reports directory if it doesn't exist
mkdir -p $REPORTS_DIR

# Path for timestamp file
export TIMESTAMP_FILE="$REPORTS_DIR/timestamp.txt"

# Check if the timestamp file exists; if not, create it
if [ ! -f "$TIMESTAMP_FILE" ]; then
    TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
    echo $TIMESTAMP >$TIMESTAMP_FILE
else
    TIMESTAMP=$(cat $TIMESTAMP_FILE)
fi

# Define the log file names with timestamp
export AUTOPEP8_REPORT="$REPORTS_DIR/autopep8_${TIMESTAMP}.log"
export BANDIT_REPORT="$REPORTS_DIR/bandit_${TIMESTAMP}.json"
export BENCHMARK_REPORT="$REPORTS_DIR/benchmark_${TIMESTAMP}.json"
export COVERAGE_REPORT="$REPORTS_DIR/coverage_${TIMESTAMP}.xml"
export FLAKE8_REPORT="$REPORTS_DIR/flake8_${TIMESTAMP}.log"
export MYPY_REPORT="$REPORTS_DIR/mypy_${TIMESTAMP}.log"
export PYLINT_REPORT="$REPORTS_DIR/pylint_${TIMESTAMP}.log"
export XUNIT_REPORT="$REPORTS_DIR/xunit_${TIMESTAMP}.xml"

# Define SonarCloud variables
PROJECT_KEY="jekwwer-python-template"
PROJECT_NAME="Python Template Repository"
REPOSITORY_URL="https://github.com/jekwwer/python-template"
AUTHOR="Evgenii Shiliaev"
ORGANIZATION="jekwwer"
PROJECT_VERSION="0.1.0"
PYTHON_VERSION="3.10"
SOURCES=$SRC_DIR
TESTS=$TEST_DIR
ENCODING="UTF-8"

# ========================================================
# End of scripts/config.sh
# ========================================================
