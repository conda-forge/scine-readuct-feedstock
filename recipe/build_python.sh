#!/usr/bin/env bash
set -ex

cp -v $RECIPE_DIR/cmake/ImportReaduct.cmake dev/cmake

CMAKE_BUILD_DIR="_build_${PKG_BUILD_STRING}"
cmake \
    ${CMAKE_ARGS} \
    -B "${CMAKE_BUILD_DIR}" -G Ninja \
    -DPYTHON_EXECUTABLE=$PYTHON \
    -DSCINE_MARCH="" \
    -DSCINE_SKIP_LIBRARY=ON \
    -DSCINE_BUILD_TESTS=OFF \
    -DSCINE_BUILD_PYTHON_BINDINGS=ON

cmake --build "${CMAKE_BUILD_DIR}"
cmake --install "${CMAKE_BUILD_DIR}"
