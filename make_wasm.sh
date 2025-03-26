#!/bin/bash

export CXXFLAGS=""
export LDFLAGS="-s MODULARIZE=1 -s EXPORTED_RUNTIME_METHODS=ccall -s NODERAWFS=1 -s INITIAL_MEMORY=128MB -s ALLOW_MEMORY_GROWTH"
export CPPFLAGS="-Isrc"
export LIBS=""

if [ "$1" = release ]; then
  CXXFLAGS+=" -O3"
  LDFLAGS+=" --closure 1"
else
  CXXFLAGS+=" -O0 -g"
fi

emmake make libdebversion.js -j WASM=1
