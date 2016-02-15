#!/bin/bash

make clean
rm -f Makefile

./scripts/make.rb

make clean
make

exit $?
