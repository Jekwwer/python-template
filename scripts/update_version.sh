#!/bin/bash
# --------------------------------------------------------
# scripts/update_version.sh
# --------------------------------------------------------
# Description: This script updates the version placeholder
#              in the specified files with the latest tag
#              from the repository if the version is outdated.
#
# Usage: The script is intended to be run by the Makefile.
#
# Run the script using:
# make update-version
#
# Repository: https://github.com/jekwwer/python-template
# Author: Evgenii Shiliaev
# Author's GitHub Username: @Jekwwer
#
# Date: 2024-08-29

# Source the configuration script
source "$(dirname "$0")/config.sh"

# Get the latest tag from the repository
TAG_NAME=$(git describe --tags $(git rev-list --tags --max-count=1))

# Remove the 'v' prefix if it exists
VERSION=${TAG_NAME#v}

# Define the files where the placeholder should be replaced
FILES=("$SCRIPTS_DIR/config.sh" "setup.py")

# Function to compare versions
version_greater_equal() {
    # If version A is greater than or equal to version B, return true (0)
    [ "$(printf '%s\n' "$1" "$2" | sort -V | head -n1)" != "$1" ]
}

# Loop through the files and replace the placeholder or older versions
for FILE in "${FILES[@]}"; do
    if [[ -f "$FILE" ]]; then
        CURRENT_VERSION=$(grep -oE '[0-9]+\.[0-9]+\.[0-9]+' "$FILE" | head -n1)

        if [[ -z "$CURRENT_VERSION" ]]; then
            # Placeholder is still there, replace it
            sed -i "s/__VERSION__/$VERSION/g" "$FILE"
            echo_green "Updated $FILE with version $VERSION"
        elif version_greater_equal "$VERSION" "$CURRENT_VERSION"; then
            # Only replace if the new version is greater or equal
            sed -i "s/v$CURRENT_VERSION/v$VERSION/g" "$FILE"
            echo_green "Updated $FILE from version $CURRENT_VERSION to $VERSION"
        else
            echo_yellow "Current version $CURRENT_VERSION in $FILE is newer or equal to $VERSION. Skipping..."
        fi
    else
        echo_red "File $FILE not found!"
        exit_check 1
    fi
done

# Exit the script successfully
exit_check 0
# --------------------------------------------------------
# End of scripts/update_version.sh
# --------------------------------------------------------
