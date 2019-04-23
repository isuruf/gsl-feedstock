#!/bin/bash

# https://github.com/conda-forge/gsl-feedstock/issues/34#issuecomment-449305702
export LIBS="-lcblas -lm"

./configure --prefix=${PREFIX}  \
            --host=${HOST}

make -j${CPU_COUNT} ${VERBOSE_AT}
make check
make install

rm "$PREFIX"/lib/libgslcblas.*
CBLAS_IMPL=$(readlink $PREFIX/lib/libcblas${SHLIB_EXT})
cp "$PREFIX/lib/${CBLAS_IMPL}" "$PREFIX/lib/libgslcblas${SHLIB_EXT}"

if [ "$(uname)" == "Darwin" ]; then
    ln -s "libcblas.3.dylib" "$PREFIX/lib/libgslcblas.0.dylib"
elif [ "$(uname)" == "Linux" ]; then
    ln -s "libcblas.so.3" "$PREFIX/lib/libgslcblas.so.0"
fi
