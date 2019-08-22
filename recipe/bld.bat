del /f %BUILD_PREFIX%\Library\bin\conda_build_wrapper.sh
move %RECIPE_DIR%\conda_build_wrapper.sh %BUILD_PREFIX%\Library\bin\
call %BUILD_PREFIX%\Library\bin\run_autotools_clang_conda_build.bat
exit 1
