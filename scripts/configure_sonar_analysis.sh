#!/bin/bash
# ========================================================
# scripts/configure_sonar_analysis.sh
# ========================================================
# Description: This script generates the sonar-project.properties
#              file for SonarCloud analysis using predefined variables.
#              It includes project settings and ensures
#              the properties file is correctly configured
#              for SonarCloud to analyze the project's codebase.
#
# Usage: This script is intended to be run by the Makefile.
#
# Run the script using:
# make configure-sonar-analysis
#
# Repository: https://github.com/jekwwer/python-template
# Author: Evgenii Shiliaev
# Author's GitHub Username: @Jekwwer
#
# Date: 2024-08-28
# ========================================================

# Source the configuration script
source "$(dirname "$0")/config.sh"

# Generate sonar-project.properties
execute_silently "
cat <<EOF >sonar-project.properties
# ========================================================
# sonar-project.properties
# ========================================================
# Project Name: $PROJECT_NAME
# Description: Configuration file for SonarCloud analysis.
#
# Repository: $REPOSITORY_URL
# Author: $AUTHOR
# Date: $(date +\"%Y-%m-%d\")
# ========================================================

# Required project settings
sonar.projectKey=$PROJECT_KEY
sonar.projectName=$PROJECT_NAME
sonar.organization=$ORGANIZATION
sonar.projectVersion=$PROJECT_VERSION
sonar.python.version=$PYTHON_VERSION
sonar.sources=$SOURCES
sonar.tests=$TESTS
sonar.python.bandit.reportPaths=$BANDIT_REPORT
sonar.python.coverage.reportPaths=$COVERAGE_REPORT
sonar.python.flake8.reportPaths=$FLAKE8_REPORT
sonar.python.mypy.reportPaths=$MYPY_REPORT
sonar.python.pylint.reportPaths=$PYLINT_REPORT
sonar.python.xunit.reportPath=$XUNIT_REPORT
sonar.sourceEncoding=$ENCODING

# ========================================================
# End of sonar-project.properties
# ========================================================
EOF" "generate sonar-project.properties"

# Exit the script successfully
exit_check 0
# ========================================================
# End of scripts/configure_sonar_analysis.sh
# ========================================================
