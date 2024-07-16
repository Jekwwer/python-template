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

# Set up the virtual environment and install dependencies
install:
	bash scripts/install.sh

# Format code using autopep8
format:
	bash scripts/format.sh

# Run tests using pytest
test: install format
	bash scripts/test.sh

# Perform static analysis with Flake8 and Pylint
lint: install
	bash scripts/lint.sh

# Perform static type checking with Mypy
type-check: install
	bash scripts/type_check.sh

# Perform security checks with Bandit
security-check: install
	bash scripts/security_check.sh

# Create a package
package: clean test install
	bash scripts/package.sh

# Clean up the project directory
clean:
	bash scripts/clean.sh

# ========================================================
# End of Makefile
# ========================================================
