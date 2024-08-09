#!/bin/bash
# ========================================================
# scripts/config.sh
# ========================================================
# Description: This script defines shared variables used across
#              different scripts in the project.
#
#              These variables include paths to:
#               - the virtual environment,
#               - source directory,
#               - test directory,
#               - reports directory,
#               - logs directory,
#               - reports' file names with log tag.
#              Some other variables are also defined for SonarCloud.
#
#              It defines functions to print messages in color,
#              log errors, and check for errors before exiting.
#
#              It creates logs and reports directories if they
#              don't exist and generates a [timestamp + last commid id]
#              log tag for logging purposes.
#
# Usage: This script is intended to be sourced by other scripts
#        to maintain consistency and avoid repetition.
#
# Source this configuration script in other scripts using:
# source "$(dirname "$0")/config.sh"
#
# Repository: https://github.com/jekwwer/python-template
# Author: Evgenii Shiliaev
# Author's GitHub Username: @Jekwwer
#
# Date: 2024-08-09
# ========================================================

# Define shared variables
PYTHON=python3
VENV_DIR=venv
SRC_DIR=src
TEST_DIR=tests
REPORTS_DIR=reports
LOGS_DIR=logs

# Get the script name
SCRIPT_NAME=$(basename "$0")

# Create logs and reports directories if it don't exist
mkdir -p $REPORTS_DIR
mkdir -p $LOGS_DIR

# Get the last commit ID
LAST_COMMIT_ID=$(git rev-parse --short HEAD)

# Path for log tag file
export LOG_TAG_FILE="$LOGS_DIR/log-tag.txt"

# Check if the tag info file exists; if not, create it
if [ ! -f "$LOG_TAG_FILE" ]; then
    # Generate a timestamp with the last commit ID
    LOG_TAG="$(date +"%Y%m%d_%H%M%S")_${LAST_COMMIT_ID}"
    echo $LOG_TAG >$LOG_TAG_FILE
else
    # Read the log tag from the file
    LOG_TAG=$(cat $LOG_TAG_FILE)
fi

# Define the report files' names with log tag
export AUTOPEP8_REPORT="$REPORTS_DIR/autopep8_${LOG_TAG}.log"
export BANDIT_REPORT="$REPORTS_DIR/bandit_${LOG_TAG}.json"
export BENCHMARK_REPORT="$REPORTS_DIR/benchmark_${LOG_TAG}.json"
export COVERAGE_REPORT="$REPORTS_DIR/coverage_${LOG_TAG}.xml"
export FLAKE8_REPORT="$REPORTS_DIR/flake8_${LOG_TAG}.log"
export MYPY_REPORT="$REPORTS_DIR/mypy_${LOG_TAG}.log"
export PYLINT_REPORT="$REPORTS_DIR/pylint_${LOG_TAG}.log"
export XUNIT_REPORT="$REPORTS_DIR/xunit_${LOG_TAG}.xml"

# Define the log files' names with log tag
export ERROR_LOG="$LOGS_DIR/error_log_${LOG_TAG}.txt"

# ANSI color code for formatting
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# Define SonarCloud variables
PROJECT_KEY="jekwwer-python-template"
PROJECT_NAME="Python Template Repository"
REPOSITORY_URL="https://github.com/jekwwer/python-template"
AUTHOR="Evgenii Shiliaev"
ORGANIZATION="jekwwer"
PROJECT_VERSION="0.2.0"
PYTHON_VERSION="3.10"
SOURCES=$SRC_DIR
TESTS=$TEST_DIR
ENCODING="UTF-8"

# Function to print messages in red
echo_red() {
    echo -e "${RED}$1${NC}"
}

# Function to print messages in green
echo_green() {
    echo -e "${GREEN}$1${NC}"
}

# Function to log errors
log_error() {
    echo_red "$1" >>$ERROR_LOG
    echo_red "$1"
}

# Function to check the error log and report status
exit_check() {
    if [ -f $ERROR_LOG ]; then
        echo_red "Errors were detected during the execution of $SCRIPT_NAME. Check $ERROR_LOG for details."
        exit 1
    else
        echo_green "All checks passed successfully during the execution of $SCRIPT_NAME."
        exit 0
    fi
}

# ========================================================
# End of scripts/config.sh
# ========================================================
