# omni-test

[![Build Status](https://travis-ci.org/clementval/omni-test.svg?branch=master)](https://travis-ci.org/clementval/omni-test)

This repository is just a placeholder for test cases checking the correctness
of the OMNI Compiler Fortran front-end and back-end.

##### Execute the testsuite (standard case)
By default, the `omni-test` repository supposed that the `omni-compiler`
repository is checked out at the same level. So the structure is the following:

```
./omni-test
./omni-compiler
```

To execute the test suite, run the following command:

```bash
cmake .
make test
```

##### Execute the test suite with a different OMNI Compiler location
If the `omni-compiler` development repository has another location than
the `omni-test` repository, the path can be given to `cmake`as a parameter.

```bash
cmake -DOMNI_DEV_PATH= .
make test
```
