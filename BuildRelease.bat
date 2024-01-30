@echo off

if not exist build mkdir build
pushd build
cmake .. -DMESHOPT_BUILD_SHARED_LIBS=1
if %errorlevel% neq 0 (
	exit /b -1
)

msbuild meshoptimizer.sln -target:Rebuild -Property:Configuration=RelWithDebInfo -verbosity:minimal
if %errorlevel% neq 0 (
	exit /b -1
)

if not exist dist mkdir dist
pushd dist
if not exist lib mkdir lib
if not exist lib\win64 mkdir lib\win64
copy /Y ..\RelWithDebInfo\meshoptimizer.* lib\win64

if not exist include mkdir include
copy /Y ..\..\src\meshoptimizer.h include

popd

powershell Compress-Archive dist\* meshopt_dist-win64.zip
move /Y meshopt_dist-win64.zip ..

popd


