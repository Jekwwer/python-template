"""
@brief Unit tests for the greet module.

========================================================
@file tests/test_greet.py
========================================================
@details This module contains unit tests for the functions
         defined in src/project_name/greet.py.

@note This is a template. Update it with actual test cases and details.

@todo Add more comprehensive test cases to cover all functionalities.

@warning Ensure that all required dependencies and the package itself
         are installed before running these tests.

@code
# To run the tests, use the following command:
# pytest
@endcode

@see https://github.com/GITHUB_USERNAME/REPOSITORY_NAME

@author AUTHOR_NAME

@date CREATED_DATE
========================================================
"""

from project_name.greet import greet


def test_greet() -> None:
    """
    @brief Unit test for the greet function.

    @details This test checks if the greet function returns the expected
             greeting message when provided with the name "World".

    @note Update or add more tests to check the function's behavior with
          various names, including edge cases.
    """
    assert greet('World') == 'Hello, World!'

# ========================================================
# End of tests/test_greet.py
# ========================================================
