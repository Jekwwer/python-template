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
#							  - perform security analysis,
#							  - create a package,
#							  - generate the sonar-project.properties file,
#							  - update the log tag,
#							  - clean up the project directory.
#				  			- clean up the project directory
#									except the logs and reports.
#
# Usage: make <command>
#
# Repository: https://github.com/jekwwer/python-template
# Author: Evgenii Shiliaev
# Author's GitHub Username: @Jekwwer
#
# Date: 2024-08-12
# ========================================================

# Disable echoing of commands
MAKEFLAGS += -s

# Phony targets are targets that are not files
.PHONY: all install install-dev format tests lint type-analysis security-analysis build-package configure-sonar-analysis update-log-tag clean clean-all

# Default target
all: update-log-tag install-dev format tests lint type-analysis security-analysis configure-sonar-analysis

# Create reports by all tools
all-reports: update-log-tag install-dev format tests lint type-analysis security-analysis

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
tests: update-log-tag format
	bash scripts/tests.sh

# Perform static analysis with Flake8 and Pylint
lint: update-log-tag install-dev
	bash scripts/lint.sh

# Perform static analysis with mypy
type-analysis: update-log-tag install-dev
	bash scripts/type_analysis.sh

# Perform security analysis with Bandit
security-analysis: update-log-tag install-dev
	bash scripts/security_analysis.sh

# Create a package
build-package: clean install-dev tests
	bash scripts/build_package.sh

# Generate the sonar-project.properties file
configure-sonar-analysis:
	bash scripts/configure_sonar_analysis.sh

# Update the log tag for adding the current date and time to logs
update-log-tag:
	bash scripts/update_log_tag.sh

# Clean up the project directory ecxept the logs and reports
clean:
	bash scripts/clean.sh

# Clean up the project directory
clean-all:
	bash scripts/clean_all.sh

# ========================================================
# End of Makefile
# ========================================================
