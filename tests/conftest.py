"""
@brief Configuration and fixtures for the tests package.

========================================================
@file tests/conftest.py
========================================================
@details This module contains shared test configurations and
         fixtures used across multiple test files in the project.
         Fixtures defined here will be automatically discovered
         by pytest and can be reused throughout the test suite.

@note Use this file to define reusable fixtures, setup and teardown
      logic, and any test-specific configuration required for the project.

@todo Add additional fixtures or test configurations as necessary.

@warning Ensure that all required test dependencies are installed
         before running the test suite.

@code
# Example usage of fixtures in test files:
def test_example(sample_data):
    assert sample_data["number2"] == 42
@endcode

@see https://github.com/GITHUB_USERNAME/REPOSITORY_NAME

@author AUTHOR_NAME

@date CREATED_DATE
========================================================
"""

from typing import Dict, Generator

import pytest


@pytest.fixture
def sample_data() -> Dict[str, int]:
    """
    @brief Fixture providing sample data for tests.

    @details This fixture provides a dictionary of sample data that
             can be used in multiple test cases. It is intended to
             serve as reusable data for test functions, enabling
             consistency and efficiency in testing.

    @pre The sample data should contain integer values to be used
         in tests.

    @post Returns a dictionary containing sample data.

    @note Modify the fixture to provide actual test data as needed.

    @return A dictionary containing two key-value pairs:
            - "number1": 34
            - "number2": 42
    """
    print('Sample data fixture')
    return {'number1': 34, 'number2': 42}


@pytest.fixture(autouse=True)
def setup_and_teardown() -> Generator[None, None, None]:
    """
    @brief Automatically run setup and teardown logic for every test.

    @details This fixture will be executed before and after each test
             function. It prints setup and teardown messages to indicate
             when each stage is being performed. The yield statement
             separates the setup and teardown phases.

    @pre No input required.

    @post Executes setup code before the test and teardown code after
          the test is finished.

    @note This fixture is marked with `autouse=True`, meaning it will
          automatically run without needing to be explicitly declared
          in test functions.

    @return A generator that yields None before and after each test.
    """
    print('\nSetting up the test')
    yield
    print('\nTearing down the test')


# ========================================================
# End of tests/conftest.py
# ========================================================
