@echo off

set DIR=%~dp0
set SCRIPTS_DIR=%DIR%src
set DEST_DIR=%DIR%.data\
set TARGET_FILE=%DEST_DIR%game.zip

rem "用法：game_build.sh w|t(正式｜测试环境标识)",默认w
set one=%1
if "%one%"=="" set one=w
@echo 当前环境: %one%

set COMPILE_BIN=%QUICK_V3_ROOT%quick\bin\compile_scripts.bat

if not exist %DEST_DIR% mkdir %DEST_DIR%

if exist %TARGET_FILE% del /s /q %TARGET_FILE%

rem TODO: 在这里修改你的项目的加密密码，不得超过16位，记得也修改encrypt_res.py脚本中的资源的密码
set PASSWORD="gasfas___23232+_"
set YOUR_SIGN="xxtea"
set ENCRYPT_COMMAND= -e xxtea_zip -ek %PASSWORD% -es %YOUR_SIGN% 

rem 编译游戏脚本
@echo 加密: %ENCRYPT_COMMAND%
call %COMPILE_BIN% -b 32 -i %SCRIPTS_DIR% -o %TARGET_FILE% %ENCRYPT_COMMAND%
set DIR=%~dp0

rem 编译入口文件
call %DIR%init_build.bat %PASSWORD% %YOUR_SIGN%
set DIR=%~dp0

set build_path=%DIR%build
if exist %build_path% rd /s /q %build_path%
mkdir %build_path%\

python %DIR%encrypt_res.py %PASSWORD% %YOUR_SIGN%

xcopy %DIR%\.data\*.zip %build_path%\res\ /s /e /y

python %DIR%/make_update_files.py %one%


