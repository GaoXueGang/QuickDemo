@echo off

rem 这是个更新 loader.zip 的快捷工具，请注意自己的路径

set MY_DIR=%~dp0
set MY_DEST_DIR=%MY_DIR%res

call %MY_DIR%./../jw_loader\build_luajit.bat

move %MY_DIR%./../jw_loader\loader.zip %MY_DEST_DIR%