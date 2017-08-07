@echo off

set DIR=%~dp0
set SCRIPTS_DIR=%DIR%src\
set DEST_DIR=%DIR%.data\
set TARGET_FILE=%DEST_DIR%game.zip
set COMPILE_BIN=%QUICK_V3_ROOT%quick\bin\compile_scripts.bat
set LUAC_COMPILE=%QUICK_V3_ROOT%quick\bin\win32\luac

if not exist %DEST_DIR% mkdir %DEST_DIR%

rem # 单独编译main与config文件

if exist "%DEST_DIR%main.lua" del /s /q "%DEST_DIR%main.lua"
if exist "%DEST_DIR%config.lua" del /s /q "%DEST_DIR%config.lua"


%LUAC_COMPILE% -o %DEST_DIR%main.lua %SCRIPTS_DIR%main.lua
%LUAC_COMPILE% -o %DEST_DIR%config.lua %SCRIPTS_DIR%config.lua


rem # 编译游戏脚本文件
if exist %TARGET_FILE% del /s /q %TARGET_FILE%

%COMPILE_BIN% -i %SCRIPTS_DIR% -o %TARGET_FILE%

