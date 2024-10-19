"""
@brief Main module to run the greeting functionality.

========================================================
@file src/project_name/main.py
========================================================
@details This module contains the entry point of the program.
         It utilizes the greet function from the greet module
         and a helper function from the utils package to
         demonstrate basic functionality.

@note This is a template. Modify as needed based on the project.

@todo Update the main logic with actual project functionality.

@warning Ensure that all required dependencies are installed
         before running this script.

@code
# Example usage:
# Run the script directly:
# python src/project_name/main.py
@endcode

@see https://github.com/GITHUB_USERNAME/REPOSITORY_NAME

@author AUTHOR_NAME

@date CREATED_DATE
========================================================
"""

from project_name.greet import greet
from utils.helpers import helper_function


def main() -> None:
    """
    @brief Main function to execute the program logic.

    @details This function prints a greeting message using the greet
             function and then calls a helper function for additional
             functionality. This is the primary entry point of the program.

    @pre The greet and helper_function must be correctly imported and
         functional.

    @post A greeting message is printed, and the helper function is executed.

    @note Modify this function to include the actual logic as needed.
    """
    print(greet('Alice'))
    helper_function()


if __name__ == '__main__':
    main()

# ========================================================
# End of src/project_name/main.py
# ========================================================
