@echo off
set COB_MAIN_DIR=-YOUR_PATH-

:: settings for cobc
set COB_CONFIG_DIR=%COB_MAIN_DIR%config
set COB_COPY_DIR=%COB_MAIN_DIR%copy
set COB_CFLAGS=-I"%COB_MAIN_DIR%include"
set COB_LDFLAGS=-L"%COB_MAIN_DIR%lib"
set COBCPY=%~dp0copy

:: extra
set COB_INCLUDE_PATH=%COB_MAIN_DIR%include
set COB_LIB_PATH=%COB_MAIN_DIR%lib

:: settings for libcob
rem the following won't work in GnuCOBOL 2.0 if there are spaces in COB_MAIN_DIR
set COB_LIBRARY_PATH=%COB_MAIN_DIR%extras

"%COB_MAIN_DIR%bin\mingw32-make"
