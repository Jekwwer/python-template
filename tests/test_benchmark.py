"""
========================================================
@file tests/test_benchmark.py
========================================================
@brief Benchmark test for the greet function.
@details This module contains a benchmark test for the greet function
         defined in src/your_package/main.py. The purpose of this test is
         to measure the performance of the function under certain conditions.

@note This is a template. Update it with actual scenarios and metrics.
@todo Add more benchmark scenarios to cover different performance aspects.

@warning Ensure that all required dependencies and the package itself
         are installed before running these tests.

@code
# To run the benchmark tests, use the following command:
# make test
@endcode

@see https://github.com/jekwwer/python-template

@date 2024-07-29
========================================================
"""


from placeholder_package.main import greet


def test_greet_benchmark(benchmark):
    """
    @brief Benchmark test for the greet function.
    @details This test benchmarks the greet function from the main module
             to measure its performance.
    """

    benchmark(greet, "World")

# ========================================================
# End of tests/test_benchmark.py
# ========================================================
