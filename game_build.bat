@echo off

set DIR=%~dp0
set SCRIPTS_DIR=%DIR%src
set DEST_DIR=%DIR%.data\
set TARGET_FILE=%DEST_DIR%game.zip

rem if [ ! $1 ]; then
rem    echo "用法：./game_build.sh w|t(正式｜测试环境标识)"
rem    exit;
rem fi

set COMPILE_BIN=%QUICK_V3_ROOT%quick\bin\compile_scripts.bat

if not exist %DEST_DIR% mkdir %DEST_DIR%

if exist %TARGET_FILE% del /s /q %TARGET_FILE%

rem # TODO: 在这里修改你的项目的加密密码，不得超过16位，记得也修改encrypt_res.py脚本中的资源的密码
set PASSWORD=TODO_SET_PWD
set ENCRYPT_COMMAND= -e xxtea_zip -ek %PASSWORD% -es YOUR_SIGN 

@echo 编译游戏脚本
call %COMPILE_BIN% -b 32 -i %SCRIPTS_DIR% -o %TARGET_FILE% 
rem # init_build.bat修改了DIR
set DIR=%~dp0

@echo 编译入口文件
call %DIR%init_build.bat
rem # init_build.bat修改了DIR
set DIR=%~dp0

set build_path=%DIR%build
if exist %build_path% rd /s /q %build_path%
mkdir %build_path%\

python %DIR%encrypt_res.py

xcopy %DIR%\.data\*.zip %build_path%\res\ /s /e /y

python %DIR%/make_update_files.py w

