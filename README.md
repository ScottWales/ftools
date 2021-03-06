FTools: Tools for Fortran coding
================================
[![Build Status](https://travis-ci.org/ScottWales/ftools.svg?branch=master)](https://travis-ci.org/ScottWales/ftools)
[![codecov.io](http://codecov.io/github/ScottWales/ftools/coverage.svg?branch=master)](http://codecov.io/github/ScottWales/ftools?branch=master)
[![Code Health](https://landscape.io/github/ScottWales/ftools/master/landscape.svg?style=flat)](https://landscape.io/github/ScottWales/ftools/master)

A selection of tools for working with Fortran code

Current ideas:

### fdeps (planned)

Produce a `Make`-style list of file and module dependencies for a project

```
$ fdeps DIR
```
outputs:
```make
DIR/program: DIR/program.o DIR/module.o
DIR/program.o: DIR/program.f90 DIR/module.mod
DIR/module.mod DIR/module.o: DIR/module.f90
```

### fformat (planned)

Format a file in a standard way (similar to goformat)

```
$ fformat <<EOF
program 
integer a
write(*,*) "Hello world", A
end program
EOF
```
outputs:
```fortran
PROGRAM
    IMPLICIT NONE
    INTEGER :: a

    WRITE(*,*) "Hello world", a
END PROGRAM
```

### Sphinx Plugin (planned)

Sphinx extension for documenting Fortran

```fortran
!> Program Documentation
!! Prints "Hello world"
PROGRAM
    IMPLICIT NONE
    INTEGER :: a

    WRITE(*,*) "Hello world", a
END PROGRAM
```
