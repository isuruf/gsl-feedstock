mkdir build
pushd build

cmake -G "NMake Makefiles" ^
      -D CMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
      -D BUILD_SHARED_LIBS=ON ^
      ..
if errorlevel 1 exit 1

cmake --build . --config Release --target install
if errorlevel 1 exit 1

rm %LIBRARY_LIB%\gslcblas.lib
cp %LIBRARY_LIB%\cblas.lib %LIBRARY_LIB%\gslcblas.lib
