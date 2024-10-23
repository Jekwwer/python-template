"""Main module to run the greeting functionality.

This module serves as the entry point of the program, demonstrating the use
of the `greet` function from the `greet` module and a helper function from
the `utils` package.

Example:
    To run the script:
    ```bash
    python src/project_name/main.py
    ```
"""

from project_name.greet import greet
from project_name.utils.helpers import helper_function


def main() -> None:
    """Execute the main program logic.

    This function prints a greeting message using the `greet` function and
    then calls a helper function for additional functionality. It serves
    as the entry point of the program.
    """
    print(greet('Alice'))
    helper_function()


if __name__ == '__main__':
    main()
