#!/bin/bash
# ========================================================
# scripts/config.sh
# ========================================================
# Description: This script defines shared variables used across
#              different scripts in the project.
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
# Date: 2024-08-29
# ========================================================

# ========================================================
# 1. ANSI Color Codes for Formatting
# ========================================================
RED='\033[0;31m'
REVERSE_RED='\033[7;31m' # Red with reversed bg/fg colors
YELLOW='\033[0;33m'
GREEN='\033[0;32m'
REVERSE_GREEN='\033[7;32m' # Green with reversed bg/fg colors
NC='\033[0m'               # No Color

# ========================================================
# 2. Shared Variables
# ========================================================
PYTHON="python3"
VENV_DIR="venv"
SRC_DIR="src"
TEST_DIR="tests"
SCRIPTS_DIR="scripts"
REPORTS_DIR="reports"
LOGS_DIR="logs"

# SonarCloud variables
PROJECT_KEY="jekwwer-python-template"
PROJECT_NAME="Python Template Repository"
REPOSITORY_URL="https://github.com/jekwwer/python-template"
AUTHOR="Evgenii Shiliaev"
ORGANIZATION="jekwwer"
PROJECT_VERSION="__VERSION__"
PYTHON_VERSION="3.10"
SOURCES="$SRC_DIR"
TESTS="$TEST_DIR"
ENCODING="UTF-8"

# Get the script name
SCRIPT_NAME=$(basename "$0")

# Ensure necessary commands exist
command -v git >/dev/null 2>&1 || {
    echo_red "git command not found, aborting."
    exit 1
}
command -v "$PYTHON" >/dev/null 2>&1 || {
    echo_red "Python not found in the virtual environment, aborting."
    exit 1
}

# Get the last commit ID
LAST_COMMIT_ID=$(git rev-parse --short HEAD)

# Path for log tag file
export LOG_TAG_FILE="$LOGS_DIR/log-tag.txt"

# Check if the tag info file exists; if not, create it
if [ ! -f "$LOG_TAG_FILE" ]; then
    # Generate a timestamp with the last commit ID
    LOG_TAG="$(date +"%Y%m%d_%H%M%S")_${LAST_COMMIT_ID}"
    echo "$LOG_TAG" >"$LOG_TAG_FILE"
else
    # Read the log tag from the file
    LOG_TAG=$(cat "$LOG_TAG_FILE")
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

# ========================================================
# 3. Function Definitions
# ========================================================

# Function to print messages in red
echo_red() {
    echo -e "${RED}ERROR: $1${NC}"
}

# Function to print messages in reverse red
echo_reverse_red() {
    echo -e "${REVERSE_RED}ERROR: $1${NC}"
}

echo_yellow() {
    echo -e "${YELLOW}INFO: $1${NC}"
}

# Function to print messages in green
echo_green() {
    echo -e "${GREEN}SUCCESS: $1${NC}"
}

# Function to print messages in reverse green
echo_reverse_green() {
    echo -e "${REVERSE_GREEN}SUCCESS: $1${NC}"
}

# Function to check the error log and report status
exit_check() {
    local status=${1:-$?} # Use the first argument, or default to the last command's status

    # Check the exit status of the commands
    if [ $status -eq 0 ]; then
        echo_reverse_green "$SCRIPT_NAME"
        echo "----------------------------------------"
        # Remove the error log if it is empty
        if [ -f "$ERROR_LOG" ] && [ ! -s "$ERROR_LOG" ]; then
            rm -f "$ERROR_LOG"
        fi
        exit 0
    else
        echo_reverse_red "$SCRIPT_NAME"
        echo "----------------------------------------"
        echo_yellow "Check $ERROR_LOG for details."
        echo "----------------------------------------"
        exit 1
    fi
}

# Function to execute a command silently and handle success/error reporting
execute_silently() {
    local command="$1"
    local operation="$2"
    local log="/tmp/${operation// /_}.log"

    # Log the start of the operation
    {
        echo "Operation: $operation"
        echo "Command: ${command%%;*}" # Display only the first command
        echo "----------------------------------------"
    } >>"$log"

    # Execute the command and capture any error output
    bash -c "$command" >/dev/null 2>>"$log"
    local status=$?

    # Check the exit status of the command
    if [ $status -eq 0 ]; then
        echo_green "$operation"
    else
        # Log the end of the operation
        {
            echo "----------------------------------------"
            echo "End of operation: $operation"
            echo ""
        } >>"$log"
        cat "$log" >>"$ERROR_LOG"
        rm -f "$log"
        echo_red "$operation"
        exit_check $status # Immediately call exit_check to exit the script
    fi
}

# Function to create directories if they don't exist
create_dir() {
    local dir="$1"
    if [ ! -d "$dir" ]; then
        mkdir -p "$dir"
    fi
}

# Function to remove directories, files, or patterns safely
remove_item() {
    local item="$1"

    # Check if item is a pattern (e.g., *.pyc or __pycache__)
    if [[ "$item" == *"*"* ]]; then
        find . -type f -name "$item" -delete 2>/dev/null || true
        find . -type d -name "$item" -exec rm -rf {} + 2>/dev/null || true
        echo_green "Removed all $item"
    else
        # Otherwise, treat as a regular directory or file
        if [ -e "$item" ]; then
            rm -rf "$item"
            echo_green "Removed $item"
        else
            echo_yellow "$item does not exist, skipping."
        fi
    fi
}

# Function to set up the virtual environment if it doesn't exist
setup_virtualenv() {
    if [ ! -d "$VENV_DIR" ]; then
        echo_green "Creating a new virtual environment in $VENV_DIR"
        $PYTHON -m venv "$VENV_DIR"
    else
        echo_yellow "Virtual environment already exists in $VENV_DIR"
    fi
}

# Function to check if the virtual environment directory exists and activate it
check_and_activate_venv() {
    # Check if the virtual environment is already activated
    if [ -z "${VIRTUAL_ENV:-}" ]; then
        if [ ! -d "$VENV_DIR" ]; then
            echo_red "Virtual environment directory '$VENV_DIR' does not exist."
            echo_red "Ensure it is created correctly."
            exit_check 1
        fi

        # Activate the virtual environment
        source "$VENV_DIR/bin/activate"
        echo_green "Virtual environment '$VENV_DIR' activated."
    else
        echo_yellow "Virtual environment already activated: $VIRTUAL_ENV"
    fi
}

# ========================================================
# 4. Initialization and Setup
# ========================================================

# Create logs and reports directories if they don't exist
create_dir "$REPORTS_DIR"
create_dir "$LOGS_DIR"

# Check if the tag info file exists; if not, create it
if [ ! -f "$LOG_TAG_FILE" ]; then
    # Generate a timestamp with the last commit ID
    LOG_TAG="$(date +"%Y%m%d_%H%M%S")_${LAST_COMMIT_ID}"
    echo "$LOG_TAG" >"$LOG_TAG_FILE"
else
    # Read the log tag from the file
    LOG_TAG=$(cat "$LOG_TAG_FILE")
fi

# ========================================================
# End of scripts/config.sh
# ========================================================
