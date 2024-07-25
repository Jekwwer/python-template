#!/bin/bash
# ========================================================
# scripts/test.sh
# ========================================================
# Description: This script runs the test suite using pytest via Tox
# to ensure that all tests in the test directory pass successfully.
#
# Usage: This script is intended to be run by the Makefile and can also
# be run manually to execute the test suite.
#
# Repository: https://github.com/jekwwer/python-template
# Author: Evgenii Shiliaev
# Date: 2024-07-25
# ========================================================

# Install Tox because it needs to run in the same shell on the CI server
pip install tox

# Run tests with Tox
tox

# ========================================================
# End of scripts/test.sh
# ========================================================
