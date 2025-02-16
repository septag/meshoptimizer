#!/bin/bash

mkdir -p build
cd build

cmake -DMESHOPT_BUILD_SHARED_LIBS=1 -DCMAKE_BUILD_TYPE=RelWithDebInfo ..

make

mkdir -p dist
mkdir -p dist/lib/mac-arm64
cp -f libmeshoptimizer.dylib dist/lib/mac-arm64

mkdir -p dist/include
cp -f ../src/meshoptimizer.h dist/include

cd dist && zip -r ../meshopt_dist-mac-arm64.zip ./*

cd ..

