# ========================================================
# Makefile
# ========================================================
# Project Name: Python Template Repository
# Description: This Makefile provides commands to set up the environment,
# 						 format the code, run tests, create a package,
# 						 perform static analysis and clean the project directory.
#
# Repository: https://github.com/jekwwer/python-template
# Author: Evgenii Shiliaev
# Date: 2024-07-26
# ========================================================

# Phony targets are targets that are not files
.PHONY: all install install-dev format test lint type-check security-check package clean sonar-project-properties clean-timestamp

# Default target
all: clean-timestamp install-dev format test lint type-check security-check sonar-project-properties

# Create reports by all tools
all-reports: clean-timestamp install-dev format test lint type-check security-check

# Set up the virtual environment and install production dependencies
install:
	bash scripts/install.sh

# Set up the virtual environment and install development dependencies
install-dev: install
	bash scripts/install_dev.sh

# Format code using autopep8 and isort
format: install-dev
	bash scripts/format.sh

# Run tests using tox + pytest and create coverage report
test: format
	bash scripts/test.sh

# Perform static analysis with Flake8 and Pylint
lint: install-dev
	bash scripts/lint.sh

# Perform static type checking with Mypy
type-check: install-dev
	bash scripts/type_check.sh

# Perform security checks with Bandit
security-check: install-dev
	bash scripts/security_check.sh

# Create a package
package: clean install-dev test
	bash scripts/package.sh

# Generate the sonar-project.properties file
sonar-project-properties:
	bash scripts/generate_sonar_project_properties.sh

# Clean up the project directory
clean:
	bash scripts/clean.sh

# Clean up the timestamp files
clean-timestamp:
	bash scripts/clean_timestamp.sh

# ========================================================
# End of Makefile
# ========================================================
