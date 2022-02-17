@echo off
set COB_MAIN_DIR=-YOUR_PATH-

:: settings for cobc
set COB_CONFIG_DIR=%COB_MAIN_DIR%config
set COB_COPY_DIR=%COB_MAIN_DIR%copy
set COB_CFLAGS=-I"%COB_MAIN_DIR%include" %COB_CFLAGS%
set COB_LDFLAGS=-L"%COB_MAIN_DIR%lib" %COB_LDFLAGS%

:: extra
set COB_INCLUDE_PATH=%COB_MAIN_DIR%include
set COB_LIB_PATH=%COB_MAIN_DIR%lib

:: settings for libcob
rem the following won't work in GnuCOBOL 2.0 if there are spaces in COB_MAIN_DIR
set COB_LIBRARY_PATH=%COB_MAIN_DIR%extras

:: Add the bin path of GnuCOBOL (including GCC) to PATH for further references
set PATH=%COB_MAIN_DIR%bin;%PATH%

mingw32-make
