@echo off

rem 引擎编译脚本，负责编译 cocos 和 framework 目录到 res 目录中去
set DIR=%~dp0
set SCRIPTS_DIR=%DIR%res\

rem #框架的源码包
set COCOS_SOURCE=%QUICK_V3_ROOT%quick\cocos
set FRAMEWORK_SOURCE=%QUICK_V3_ROOT%quick\framework
set TMP_PATH=%QUICK_V3_ROOT%quick\tmp
set TARGET_FILE=%SCRIPTS_DIR%framework.zip

if exist %TARGET_FILE% del /s /q %TARGET_FILE%
if exist %TMP_PATH% rd /s /q %TMP_PATH%
mkdir %TMP_PATH%

xcopy %COCOS_SOURCE% %TMP_PATH%\cocos\ /s /e /y
xcopy %FRAMEWORK_SOURCE% %TMP_PATH%\framework\ /s /e /y

set COMPILE_BIN=%QUICK_V3_ROOT%quick\bin\compile_scripts.bat

rem # 编译framework脚本文件
%COMPILE_BIN% -i %TMP_PATH% -o %TARGET_FILE%

rem # 删除tmp
rd /s /q %TMP_PATH%

