﻿@echo off

@echo AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
set DIR=%~dp0
set SCRIPTS_DIR=%DIR%.data\src
set DEST_DIR=%DIR%.data
set TARGET_FILE=%DEST_DIR%\init.zip
set COMPILE_BIN=%QUICK_V3_ROOT%quick\bin\compile_scripts.bat

if not exist %DEST_DIR% mkdir %DEST_DIR%\
if not exist %SCRIPTS_DIR% mkdir %SCRIPTS_DIR%\

@echo BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB
del /s /q %SCRIPTS_DIR%\*.lua
if exist %TARGET_FILE% del /s /q %TARGET_FILE%

@echo CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
xcopy %DIR%src\*.lua %SCRIPTS_DIR%\ /s /e /y
@echo DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD
rem "用法：game_build.sh w|t(正式｜测试环境标识)",默认w
set PASSWORD="%1"
set YOUR_SIGN="%2"
@echo EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
set	ENCRYPT_COMMAND=-e xxtea_zip -ek %PASSWORD% -es %YOUR_SIGN%
if %PASSWORD%=="" set ENCRYPT_COMMAND=""
if %YOUR_SIGN%=="" set ENCRYPT_COMMAND=""
@echo 加密: %ENCRYPT_COMMAND%

rem 编译游戏脚本
%COMPILE_BIN% -i %SCRIPTS_DIR% -o %TARGET_FILE% %ENCRYPT_COMMAND%


