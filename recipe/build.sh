#!/bin/bash

# https://github.com/conda-forge/toolchain-feedstock/pull/11
export CPPFLAGS="${CPPFLAGS} -I${PREFIX}/include"
export LDFLAGS="${LDFLAGS} -L${PREFIX}/lib"

LIBS="-lopenblas -lm" ./configure --prefix=$PREFIX

make
make check
make install
