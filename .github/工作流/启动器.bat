@echo off
::WYSBDM:103.2
md Starts
cls
:jc
for /f "delims=" %%i in (starts.version) do set stv=%%i
for /f "delims=" %%i in (Starts\starts.xversion) do set stvx=%%i
title ������
for /f "delims=" %%i in (.version) do set pbv=%%i
for /f "delims=" %%i in (uac.version) do set uacv=%%i
if not exist "Tools\CIdo.exe" goto je
if not exist "Tools\wget.exe" goto je
if not exist "Starts\.xversion" goto je
if not exist "Starts\uac.xversion" goto je
if not exist "Starts\starts.xversion" goto je
if "%pbv%"=="" goto je
if "%uacv%"=="" goto je
if "%stv%"=="" goto je
goto jcn

:rz
title ��־
if not exist "Data\Msd.dll" msg * "û�п��õ���־."
if not exist "Data\Msd.dll" goto jc
copy Data\Msd.dll Msd.txt
start msd.txt
ping /n 2 127.1>nul
del /s /q msd.txt
goto jcn

:jcn
for /f "delims=" %%i in (Starts\uac.xversion) do set uacx=%%i
for /f "delims=" %%i in (Starts\.xversion) do set pbx=%%i
if "%uacx%"=="" goto je
if "%pbx%"=="" goto je
cls
title ���뱣����������
echo ���뱣���� ������
echo 1.����������
echo 2.��־��
echo 3.�����Ϣ��
if "%ab%"=="n" echo �޷��������뱣����.
set /p num=
if "%num%"=="2" set rz=new
if "%num%"=="2" goto rz
if "%num%"=="3" goto abo
if "%ab%"=="n" goto jcntt
if "%num%"=="1" goto st
if "%num%"=="ConfigHistory:Now" goto chn
:jcnt
goto jcn

:chn
cls
del /s /q Data\Msd.dll
cls
echo config.
pause
exit

:jcntt
cls
msg * "�޷����������ļ���"
goto jcnt

:abo
cls
title ������������
echo ��������������
echo �汾��%stv%���ڲ��汾%stvx%.
echo �������ڣ�2022/4/3
echo ���뱣����汾:%pbv%����ϸ�汾%pbx%.
echo �û��˻����ư汾:%uacv%����ϸ�汾%uacx%.
pause
goto jcn

:je
cls
title ����
echo ����
echo ��������¼���
pause
exit

:st
cls
title ����
echo ������......
echo �������Ҫһ��ʱ�䡣
for /f "delims=" %%i in (starts.version) do set stv=%%i
for /f "delims=" %%i in (Starts\starts.xversion) do set stvx=%%i
for /f "delims=" %%i in (.version) do set pbv=%%i
for /f "delims=" %%i in (uac.version) do set uacv=%%i
for /f "delims=" %%i in (Starts\uac.xversion) do set uacx=%%i
for /f "delims=" %%i in (Starts\.xversion) do set pbx=%%i
if "%pbv%"=="" goto je
if "%uacv%"=="" goto je
if "%stv%"=="" goto je
if "%uacx%"=="" goto je
if "%pbx%"=="" goto je
if not exist "Starts\���뱣����.bat" goto je
if not exist "Tools\CIdo.exe" goto je
if not exist "Tools\wget.exe" goto je
if not exist "Starts\.xversion" goto je
if not exist "Starts\uac.xversion" goto je
if not exist "Starts\starts.xversion" goto je
if "%ab%"=="n" goto je
echo 103.2>Starts\Tel.ini
start wt.exe Starts\���뱣����.bat /wait
tasklist|find /i "WindowsTerminal.exe" 
if not %errorlevel%==0 (
cls
echo ���밲ȫģʽ...
ping /n 2 127.1>nul
if "%pbv%"=="" goto je
if "%uacv%"=="" goto je
if "%stv%"=="" goto je
if "%uacx%"=="" goto je
if "%pbx%"=="" goto je
if not exist "Starts\���뱣����.bat" goto je
if not exist "Tools\CIdo.exe" goto je
if not exist "Tools\wget.exe" goto je
if not exist "Starts\.xversion" goto je
if not exist "Starts\uac.xversion" goto je
if not exist "Starts\starts.xversion" goto je
if "%ab%"=="n" goto je
start Starts\���뱣����.bat
exit
)
exit