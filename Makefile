# ========================================================
# Makefile
# ========================================================
# Project Name: Python Template Repository
# Description: This Makefile provides commands to:
#							  - set up the environment,
#							  - install dependencies,
#							  - format code,
#							  - run tests,
#							  - perform static analysis,
#							  - perform security checks,
#							  - create a package,
#							  - generate the sonar-project.properties file,
#							  - update the log tag,
#							  - clean up the project directory.
#
# Repository: https://github.com/jekwwer/python-template
# Author: Evgenii Shiliaev
# Date: 2024-08-08
# ========================================================

# Phony targets are targets that are not files
.PHONY: all install install-dev format test lint type-check security-check package clean sonar-project-properties update-log-tag

# Default target
all: update-log-tag install-dev format test lint type-check security-check sonar-project-properties

# Create reports by all tools
all-reports: update-log-tag install-dev format test lint type-check security-check

# Set up the virtual environment and install production dependencies
install: update-log-tag
	bash scripts/install.sh

# Set up the virtual environment and install development dependencies
install-dev: update-log-tag install
	bash scripts/install_dev.sh

# Format code using autopep8 and isort
format: update-log-tag install-dev
	bash scripts/format.sh

# Run tests using tox + pytest and create coverage report
test: update-log-tag format
	bash scripts/test.sh

# Perform static analysis with Flake8 and Pylint
lint: update-log-tag install-dev
	bash scripts/lint.sh

# Perform static type checking with Mypy
type-check: update-log-tag install-dev
	bash scripts/type_check.sh

# Perform security checks with Bandit
security-check: update-log-tag install-dev
	bash scripts/security_check.sh

# Create a package
package: clean install-dev test
	bash scripts/package.sh

# Generate the sonar-project.properties file
sonar-project-properties:
	bash scripts/generate_sonar_project_properties.sh

# Update the log tag for adding the current date and time to logs
update-log-tag:
	bash scripts/update_log_tag.sh

# Clean up the project directory
clean:
	bash scripts/clean.sh

# ========================================================
# End of Makefile
# ========================================================
