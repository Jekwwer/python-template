# ========================================================
# Makefile
# ========================================================
# Project Name: Python Template Repository
# Description: This Makefile provides commands to set up the environment,
# format the code, run tests, create a package, perform static analysis,
# and clean the project directory.
#
# Repository: https://github.com/jekwwer/python-template
# Author: Evgenii Shiliaev
# Date: 2024-07-16
# ========================================================

.PHONY: all install format test package clean lint type-check security-check

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

# Clean up the project directory
clean:
	bash scripts/clean.sh

# ========================================================
# End of Makefile
# ========================================================
