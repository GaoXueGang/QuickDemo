@echo off

set DIR=%~dp0
set SCRIPTS_DIR=%DIR%src
set DEST_DIR=%DIR%.data\
set TARGET_FILE=%DEST_DIR%game.zip

rem if [ ! $1 ]; then
rem    echo "�÷���./game_build.sh w|t(��ʽ�����Ի�����ʶ)"
rem    exit;
rem fi

set COMPILE_BIN=%QUICK_V3_ROOT%quick\bin\compile_scripts.bat

mkdir %DEST_DIR%

if exist %TARGET_FILE% del /s /q %TARGET_FILE%

rem # TODO: �������޸������Ŀ�ļ������룬���ó���16λ���ǵ�Ҳ�޸�encrypt_res.py�ű��е���Դ������
rem set PASSWORD=TODO_SET_PWD
rem set ENCRYPT_COMMAND= -e xxtea_zip -ek %PASSWORD% -es YOUR_SIGN 

rem # ������Ϸ�ű�
rem %COMPILE_BIN% -i %SCRIPTS_DIR% -o %TARGET_FILE%

rem # ��������ļ�

call %DIR%init_build.bat

rem # init_build.bat�޸���DIR
set DIR=%~dp0

set build_path=%DIR%build
if exist %build_path% rd /s /q %build_path%
mkdir %build_path%\

python %DIR%encrypt_res.py

xcopy -rf %DIR%/.data/*.zip %build_path%/res/

python %DIR%/make_update_files.py w
