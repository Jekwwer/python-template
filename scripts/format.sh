#!/bin/bash
# ========================================================
# scripts/format.sh
# ========================================================
# Description: This script formats the code in the source and test
#              directories using autopep8 with aggressive settings.
#
# Usage: This script is intended to be run by the Makefile.
#
# Run the script using:
# make format
#
# Repository: https://github.com/jekwwer/python-template
# Author: Evgenii Shiliaev
# Author's GitHub Username: @Jekwwer
#
# Date: 2024-08-28
# ========================================================

# Source the configuration script
source "$(dirname "$0")/config.sh"

# Check and activate the virtual environment
check_and_activate_venv

# Function to parse autopep8 report
# This function reads through the autopep8 report and summarizes the results.
# It identifies the number of files with issues and provides feedback on which files had issues and which did not.
# It returns the number of files where issues were found.
parse_autopep8_report() {
    local report_file="$1" # The autopep8 report file to parse
    local issues_found=0   # Counter for files where issues were found
    local no_issues=0      # Counter for files with no issues
    local current_file=""  # Variable to hold the current file being processed
    local file_reported=0  # Flag to ensure each file is only reported once

    # Read the report file line by line
    while IFS= read -r line; do
        # Check if the line starts with [file:], which indicates the start of a new file's report
        if [[ "$line" =~ ^\[file: ]]; then
            current_file=$(echo "$line" | sed 's/^\[file:\(.*\)\]/\1/') # Extract the file name
            file_reported=0                                             # Reset the flag since we're processing a new file
        elif [[ "$line" =~ "--->" ]]; then
            # If the line indicates no issues were found in the current file
            if [[ "$line" =~ "0 issue(s) to fix" ]]; then
                # Report only once for the current file
                if [ $file_reported -eq 0 ]; then
                    echo_green "No issues found in $current_file"
                    no_issues=$((no_issues + 1)) # Increment the no issues counter
                    file_reported=1              # Mark the file as reported
                fi
            else
                # If issues were found in the current file, report it
                if [ $file_reported -eq 0 ]; then
                    echo_red "Issues found in $current_file"
                    issues_found=$((issues_found + 1)) # Increment the issues found counter
                    file_reported=1                    # Mark the file as reported
                fi
            fi
        fi
    done <"$report_file"

    # Provide a summary of the results
    echo "----------------------------------------"
    if [ "$issues_found" -gt 0 ]; then
        echo_red "AUTOPEP8 - issues found in $issues_found file(s)."
    else
        echo_green "No issues were found or all issues were already fixed."
    fi

    return $issues_found # Return the number of files where issues were found
}

# Run isort to organize import statements
execute_silently "$VENV_DIR/bin/isort $SRC_DIR/ $TEST_DIR/" "isort"

# Format code in the source and test directories
execute_silently "$VENV_DIR/bin/autopep8 --in-place --aggressive --aggressive --recursive -v $SRC_DIR/ $TEST_DIR/ &>$AUTOPEP8_REPORT" "autopep8"

# Parse the autopep8 report
parse_autopep8_report "$AUTOPEP8_REPORT"
issues_found=$?

# If issues were found, run autopep8 a second time
if [ "$issues_found" -gt 0 ]; then
    echo_yellow "Running autopep8 a second time to attempt fixing remaining issues..."
    SECOND_PASS_REPORT="${AUTOPEP8_REPORT%.log}_pass2.log" # Create a new report filename for the second pass
    execute_silently "$VENV_DIR/bin/autopep8 --in-place --aggressive --aggressive --recursive -v $SRC_DIR/ $TEST_DIR/ &>$SECOND_PASS_REPORT" "autopep8 - second pass"

    # Parse the report again
    parse_autopep8_report "$SECOND_PASS_REPORT"
    issues_found=$?
fi

# Final check
if [ "$issues_found" -eq 0 ]; then
    exit_check 0
else
    echo_red "Some issues could not be resolved. Please check the report: $SECOND_PASS_REPORT"
    exit_check 1
fi

# ========================================================
# End of scripts/format.sh
# ========================================================
