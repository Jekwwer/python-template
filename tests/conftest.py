"""Configuration and fixtures for the tests package.

This module contains shared test configurations and fixtures used across
multiple test files in the project. Fixtures defined here will be
automatically discovered by `pytest` and can be reused throughout the test suite.

Example usage of fixtures in test files:
    def test_example(sample_data):
        assert sample_data["number2"] == 42
"""

from typing import Dict, Generator

import pytest


@pytest.fixture
def sample_data() -> Dict[str, int]:
    """Fixture providing sample data for tests.

    This fixture provides a dictionary of sample data that can be used in
    multiple test cases. It serves as reusable data for test functions,
    enabling consistency and efficiency in testing.

    Returns:
        Dict[str, int]: A dictionary containing two key-value pairs:
                        - "number1": 34
                        - "number2": 42
    """
    print('Sample data fixture')
    return {'number1': 34, 'number2': 42}


@pytest.fixture(autouse=True)
def setup_and_teardown() -> Generator[None, None, None]:
    """Automatically run setup and teardown logic for every test.

    This fixture is executed before and after each test function. It prints
    setup and teardown messages to indicate when each stage is being performed.
    The `yield` statement separates the setup and teardown phases.

    Yields:
        None: Yields control to the test function between setup and teardown.
    """
    print('\nSetting up the test')
    yield
    print('\nTearing down the test')
