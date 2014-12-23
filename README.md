# Testing gtest on C programs
This project is a prototype of how gtest can be used to unit test C programs.
The makefile downloads and compiles gtest 1.7.0 into a library and links it to the test program.

## Prerequsites
* make
* cmake
* gcc
* g++

## How to use
`make`, `make all`, and `make gtest_for_c` will create the original hello world program, called `gtest_for_c`.
`make unit_test` will create `gtest_for_c_unit_test`. This program hides the original main function by defining TESTING and also shows a PoC of how gtest can be used to test C.
Binaries are located in `bin/` after compilation.

