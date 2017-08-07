@echo off

set DIR=%~dp0
set SCRIPTS_DIR=%DIR%.data\src
set DEST_DIR=%DIR%.data
set TARGET_FILE=%DEST_DIR%\init.zip
set COMPILE_BIN=%QUICK_V3_ROOT%quick\bin\compile_scripts.bat

mkdir %DEST_DIR%\
mkdir %SCRIPTS_DIR%\

del /s /q %SCRIPTS_DIR%\*.lua
if exist %TARGET_FILE% del /s /q %TARGET_FILE%

xcopy %DIR%src\*.lua %SCRIPTS_DIR%\ /s /e /y

rem set ENCRYPT_COMMAND=""
rem if [ $1 ]; then
rem    ENCRYPT_COMMAND=" -e xxtea_zip -ek $1 -es YOUR_SIGN "
rem fi

rem # 编译游戏脚本
%COMPILE_BIN% -i %SCRIPTS_DIR% -o %TARGET_FILE% 