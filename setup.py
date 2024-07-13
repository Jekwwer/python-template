"""
========================================================
@file setup.py
========================================================
@brief Setup script for the Python package.
@details This script is used for packaging and distributing the project.

@note This is a template. Update it with actual project details.
@todo Replace placeholder values and ensure all required dependencies are added.

@warning Ensure that the `README.md` file exists and is correctly formatted.

@code
# To build the package, use the following command:
# python3 setup.py sdist bdist_wheel

# To install the package locally, use:
# pip install .
@endcode

@see https://github.com/jekwwer/python-template

@date 2024-07-13
========================================================
"""

from setuptools import setup, find_packages

# Read the long description from the README.md file
with open('README.md', 'r') as fh:
    long_description = fh.read()

# Package setup
setup(
    name='placeholder_package',  # TODO: Replace with your package name
    version='0.1.0',  # TODO: Update the version as needed
    author='Evgenii Shiliaev',
    # TODO: Replace with the author's email
    author_email='evgenii.shiliaev.work@pm.me',

    # TODO: Replace with your package description
    description='A brief description of your package',
    long_description=long_description,
    long_description_content_type='text/markdown',

    # TODO: Replace with your project's URL
    url='https://github.com/jekwwer/python-template',
    # Finds packages in the 'src' directory
    packages=find_packages(where='src'),
    # Tells setuptools to look in the 'src' directory for packages
    package_dir={'': 'src'},
    install_requires=[
        # Add your dependencies here
        # Example: 'numpy', 'requests'
    ],
    classifiers=[
        # TODO: Update the classifiers to match your project details
        'Programming Language :: Python :: 3',
        'License :: OSI Approved :: GNU General Public License v3 (GPLv3)',
        'Operating System :: OS Independent',
    ],
    python_requires='>=3.10',  # TODO: Change this to your minimum required Python version
)

# ========================================================
# End of setup.py
# ========================================================
