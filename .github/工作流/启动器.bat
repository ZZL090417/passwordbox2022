@echo off
::WYSBDM:103.2
md Starts
cls
:jc
for /f "delims=" %%i in (starts.version) do set stv=%%i
for /f "delims=" %%i in (Starts\starts.xversion) do set stvx=%%i
title 启动器
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
title 日志
if not exist "Data\Msd.dll" msg * "没有可用的日志."
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
title 密码保管箱启动器
echo 密码保管箱 启动器
echo 1.立即启动！
echo 2.日志！
echo 3.相关信息！
if "%ab%"=="n" echo 无法启动密码保管箱.
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
msg * "无法启动所需文件。"
goto jcnt

:abo
cls
title 关于启动器！
echo ←关于启动器！
echo 版本：%stv%，内部版本%stvx%.
echo 更改日期：2022/4/3
echo 密码保管箱版本:%pbv%，详细版本%pbx%.
echo 用户账户控制版本:%uacv%，详细版本%uacx%.
pause
goto jcn

:je
cls
title 错误
echo 错误
echo 你可以重新加载
pause
exit

:st
cls
title 启动
echo 启动中......
echo 这可能需要一点时间。
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
if not exist "Starts\密码保管箱.bat" goto je
if not exist "Tools\CIdo.exe" goto je
if not exist "Tools\wget.exe" goto je
if not exist "Starts\.xversion" goto je
if not exist "Starts\uac.xversion" goto je
if not exist "Starts\starts.xversion" goto je
if "%ab%"=="n" goto je
echo 103.2>Starts\Tel.ini
start wt.exe Starts\密码保管箱.bat /wait
tasklist|find /i "WindowsTerminal.exe" 
if not %errorlevel%==0 (
cls
echo 进入安全模式...
ping /n 2 127.1>nul
if "%pbv%"=="" goto je
if "%uacv%"=="" goto je
if "%stv%"=="" goto je
if "%uacx%"=="" goto je
if "%pbx%"=="" goto je
if not exist "Starts\密码保管箱.bat" goto je
if not exist "Tools\CIdo.exe" goto je
if not exist "Tools\wget.exe" goto je
if not exist "Starts\.xversion" goto je
if not exist "Starts\uac.xversion" goto je
if not exist "Starts\starts.xversion" goto je
if "%ab%"=="n" goto je
start Starts\密码保管箱.bat
exit
)
exit