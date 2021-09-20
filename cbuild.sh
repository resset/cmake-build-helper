#!/bin/bash

cmdoptions="$@"
dirname="$(basename $(pwd))"

build () {
    rm -rf build
    mkdir build
    cd build
    cmake ..
    cmake --build . $cmdoptions
}

if [ "${dirname}" == "build" ]; then
    echo "${0}: We are in the build directory, going up."
    echo "${0}: NOTE: you should run this script in the root of the project."
    cd ..
fi


if [ -f CMakeLists.txt ]; then
    echo "${0}: There is a CMakeLists.txt of the project present."
    echo ""
    build
else
    echo "${0}: Not in a CMake project."
fi
