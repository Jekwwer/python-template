"""Unit tests for the greet module.

This module contains unit tests for the functions defined in
`src/project_name/greet.py`.

To run the tests, use the following command:
    ```bash
    pytest
    ```
"""

from project_name.greet import greet


def test_greet() -> None:
    """Test the greet function.

    This test checks if the `greet` function returns the expected greeting
    message when provided with the name "World".

    Example:
        >>> greet('World')
        'Hello, World!'
    """
    assert greet('World') == 'Hello, World!'
