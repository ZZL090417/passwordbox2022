@echo off
::WYSBDM:103.2
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