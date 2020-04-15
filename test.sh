#!/bin/bash

PREFIX=${PREFIX:-"/usr/lib"}
if [ ! -f libfunc.so ]; then
    LIB=$PREFIX/lib cmake . -DCMAKE_INCLUDE_PATH=$PREFIX/include -DBoost_NO_BOOST_CMAKE=ON
    make
    rm -rf CMakeFiles
    rm CMakeCache.txt Makefile cmake_install.cmake
fi

gcc -O2 -omain main.c libfunc.so
gcc -O2 -omain_dl main_dl.c -ldl

### test

echo "[C] load blas user statically"
./main
echo "[C] load blas user dynamically"
./main_dl
echo "[Python] load blas user [cdll]"
python ./main_cdll.py
echo "[Python] load blas user [cdll] with modifying dlopenflags"
python ./main_cdll.py --dlopenflags
echo "[Python] load blas user [module]"
python ./main_module.py
echo "[Python] load blas user [module] with modifying dlopenflags"
python ./main_module.py --dlopenflags
