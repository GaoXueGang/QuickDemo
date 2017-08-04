@echo off

set MY_DIR=%~dp0
set MY_DEST_DIR=%MY_DIR%res
call %MY_DIR%./../jw_loader\build_luajit.bat
move %MY_DIR%./../jw_loader\loader.zip %MY_DEST_DIR%