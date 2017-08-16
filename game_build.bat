@echo off

set DIR=%~dp0
set SCRIPTS_DIR=%DIR%src
set DEST_DIR=%DIR%.data\
set TARGET_FILE=%DEST_DIR%game.zip

rem "�÷���game_build.sh w|t(��ʽ�����Ի�����ʶ)",Ĭ��w
set one=%1
if "%one%"=="" set one=w
@echo ��ǰ����: %one%

set COMPILE_BIN=%QUICK_V3_ROOT%quick\bin\compile_scripts.bat

if not exist %DEST_DIR% mkdir %DEST_DIR%

if exist %TARGET_FILE% del /s /q %TARGET_FILE%

rem TODO: �������޸������Ŀ�ļ������룬���ó���16λ���ǵ�Ҳ�޸�encrypt_res.py�ű��е���Դ������
set PASSWORD="ygskciwucgdkocme"
set YOUR_SIGN="xxtea"
set ENCRYPT_COMMAND= -e xxtea_zip -ek %PASSWORD% -es %YOUR_SIGN% 

rem ������Ϸ�ű�
@echo ����: %ENCRYPT_COMMAND%
call %COMPILE_BIN% -b 32 -i %SCRIPTS_DIR% -o %TARGET_FILE% %ENCRYPT_COMMAND%

set DIR=%~dp0

rem ��������ļ�
call %DIR%init_build.bat %PASSWORD% %YOUR_SIGN%
set DIR=%~dp0

set build_path=%DIR%build
if exist %build_path% rd /s /q %build_path%
mkdir %build_path%\

python %DIR%encrypt_res.py %PASSWORD% %YOUR_SIGN%

xcopy %DIR%\.data\*.zip %build_path%\res\ /s /e /y

python %DIR%/make_update_files.py %one%


