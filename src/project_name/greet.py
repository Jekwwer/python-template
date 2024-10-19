"""This module provides functions for greeting users.

The greet function generates personalized greetings based on the provided name.
"""


def greet(name: str) -> str:
    """Generate a greeting message for the given name.

    This function takes a single string parameter representing a name and
    returns a greeting message formatted as "Hello, {name}!".

    Args:
        name (str): The name of the person to greet. Expected to be a non-empty string.

    Returns:
        str: A greeting message in the form "Hello, {name}!".

    Example:
        >>> message = greet("Alice")
        >>> print(message)
        Hello, Alice!

    Raises:
        ValueError: If the input `name` is an empty string.
    """
    if not name:
        raise ValueError('Name cannot be empty.')
    return f"Hello, {name}!"
