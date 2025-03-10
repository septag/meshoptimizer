#!/bin/bash

mkdir -p build
cd build

cmake -DMESHOPT_BUILD_SHARED_LIBS=1 -DCMAKE_BUILD_TYPE=RelWithDebInfo ..

make

mkdir -p dist
mkdir -p dist/lib/linux-x86_64
cp -f libmeshoptimizer.so dist/lib/linux-x86_64

mkdir -p dist/include
cp -f ../src/meshoptimizer.h dist/include

cd dist && zip -r ../meshopt_dist-linux-x86_64.zip ./*

cd ..

