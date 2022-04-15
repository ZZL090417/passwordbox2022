@echo off
::WYSBDM:103.2
ver | find "10.0" >  NUL && set Sy=Y
if not "%Sy%"=="Y" goto EnviromentERROR
set SystemVer=Microsoft-Windows10.0
for /f "delims=" %%i in (Starts\Tel.ini) do set bb=%%i
if not "%bb%"=="103.2" exit
echo no>Starts\Tel.ini
:sdg
title 开始
:tymk
for /f "delims=" %%i in (.version) do set pbv=%%i
for /f "delims=" %%i in (Starts\.xversion) do set pbvx=%%i
for /f "delims=" %%i in (uac.version) do set uacv=%%i
for /f "delims=" %%i in (Starts\uac.xversion) do set uacvx=%%i
if not exist "Starts\" goto EnviromentERROR
:startuser
for /f "delims=" %%i in (Data\User\userpassword.user) do set namepassword=%%i
for /f "delims=" %%i in (Data\User\username.user) do set name=%%i
for /f "delims=" %%i in (Data\User\TurnOffUAC.ini) do if "%%i"=="OFFA" goto startdddd
set nb=%%i
md Data
if not exist "Data\User\" call:useradd
if not exist "Data\User\username.user" call:useradd
if not exist "Data\User\userpassword.user" call:useradd
if not exist "Data\User\UserNumber.user" call:useradd
set passwordci=100
:mmm
if "%name%"=="" goto errormmm
if "%namepassword%"=="" goto errormmm
set us=你没有输入任何内容
cls
echo %name%
echo 输入你设置的密码：
set /p us=
if "%passwordci%"=="104" goto errormm
if "%us%"=="%namepassword%" goto startdddd
set /a passwordci=%passwordci%+1
goto mmm

:error
Tools\CIdo.exe /beep 16
cls
title %tl%
echo 错误:%ey%
pause
exit

:errormm
cls
set tl=错误
set ey=密码输入错误过多（code1)
goto error

:errormmm
cls
set tl=错误
set ey=有一个问题，导致密码保管箱无法正常工作。(code2)
goto error

:useradd
cls
md Data
md Data\User\
cls
echo 创建用户
echo 输入用户名：
echo off.关闭用户账户控制台
set /p un=
if "%un%"=="Admin" goto errorsetpassword
if "%un%"=="Adminstrator" goto errorsetpassword
if "%un%"=="User" goto errorsetpassword
if "%un%"=="user" goto errorsetpassword
if "%un%"=="用户" goto errorsetpassword
if "%un%"=="管理员" goto errorsetpassword
if "%un%"=="off" echo OFFA>Data\User\TurnOffUAC.ini
if "%un%"=="off" del /s /q Data\User\userpassword.user
if "%un%"=="off" del /s /q Data\User\UserNumber.user
if "%un%"=="off" del /s /q Data\User\username.user
if "%un%"=="off" cls
if "%un%"=="off" echo 操作完成.
if "%un%"=="off" pause
if "%un%"=="off" exit
if "%un%"=="" goto useradd
echo %un%>Data\User\username.user
echo 101>Data\User\UserNumber.user
cls
:userpasswordset
echo 创建用户
echo 设置此用户的密码：
set /p Userpassword=
if "%Userpassword%"=="" cls
if "%Userpassword%"=="" echo 请换一个密码再试
if "%Userpassword%"=="" goto userpasswordset
if "%un%"=="" msg * "请换一个用户再试"
if "%un%"=="" goto userpasswordset
echo %Userpassword%>Data\User\userpassword.user
for /f "delims=" %%i in (Data\User\userpassword.user) do set x=%%i
if not "%x%"=="%Userpassword%" goto errorsetpassword
cls
echo 提示：
echo 成功创建用户：%un%
echo 密码为      ：%Userpassword%
echo -可在用户账户控制面板中关闭用户账户控制-
pause
exit

:errorsetpassword
cls
del /s /q Data\User\userpassword.user
del /s /q Data\User\username.user
del /s /q Data\User\UserNumber.user
rd /s /q Data\User\
cls
set tl=错误
set ey=有一个内部问题，导致你的密码无法正常保存。(code3)
goto error

:startdddd
if not exist "Tools\wget.exe" call:errorfiles
if not exist "Tools\CIdo.exe" call:errorfiles
cls
:fc
set user=100
title 密码保管箱,版本%pbv%
cls
echo 菜单
echo 1.查看/编辑 密码
echo 2.重置密码保管箱
echo 3.用户账户控制台
echo 4.退出选项
echo 5.其它
set /p user=
cls
if "%user%"=="1" call:chjm
if "%user%"=="2" call:oobe
if "%user%"=="3" call:UAC
if "%user%"=="4" goto Et
if "%user%"=="5" goto else
goto fc

:else
set else=5
cls
title 其它
echo 1.更新记录
echo 2.下载文件
echo 3.关于
echo 4.返回
set /p num=
if "%num%"=="1" goto Update-rules
if "%num%"=="2" goto download
if "%num%"=="3" goto About
if "%num%"=="4" goto fc
goto else


:Et
set zxy=3.注销
for /f "delims=" %%i in (Data\User\TurnOffUAC.ini) do if "%%i"=="OFFA" set zxy=3.此选项无效
cls
title 退出
echo 1.退出
echo 2.重新启动
if not "%zxy%"=="3.此选项无效" echo 3.注销
echo 4.返回
set /p nu=
if "%nu%"=="1" exit
if "%nu%"=="2" goto restarts
if "%nu%"=="4" goto fc
if "%nu%"=="3" goto Etp
goto Et

:Etp
if "%zxy%"=="3.此选项无效" goto Et
goto startuser


:restarts
cls
title 重新启动
if not exist "Starts\Restart.bat" goto errorre
echo 103.1>Starts\Tel.ini
start Starts\Restart.bat
exit

:errorre
set tl=错误
set ey=有一个问题，导致密码保管箱无法重新启动。(code4)
goto error

:UAC
cls
title 用户账户控制台,版本%uacv%
for /f "delims=" %%i in (Data\User\userpassword.user) do set namepassword=%%i
for /f "delims=" %%i in (Data\User\username.user) do set name=%%i
if "%name%"=="" goto errorUAC
if "%namepassword%"=="" goto errorUAC
cls
echo                   %name%
echo    密码：
set /p uss=
if not "%uss%"=="%namepassword%" goto UAC
set passma=Pass
:UACA
for /f "delims=" %%i in (Data\User\TurnOffUAC.ini) do if "%%i"=="OFFA" goto errorUACS
set uss=NOpassword
cls
if not "%passma%"=="Pass" goto errorUAC
set gn=100
if "%name%"=="" goto errorUAC
if "%namepassword%"=="" goto errorUAC
:Qcuac
cls
echo 用户账户控制台
echo.
echo 1.账户名更改
echo 原用户：%name%
echo.
echo 2.账户密码更改
echo 原密码：%namepassword%
echo.
echo 3.更改账户名及账户密码
echo 注意：你存储的密码将不会更改
echo.
echo 4.关于用户账户控制台
echo.
echo 5.返回
echo.
echo 6.关闭用户账户控制
echo.
set /p gn=
set passpo=pass
if "%gn%"=="1" call:UACname
if "%gn%"=="2" call:UACpassword
if "%gn%"=="3" call:useradd
if "%gn%"=="4" call:UACG
if "%gn%"=="5" set passma=
if "%gn%"=="5" set passpo=
if "%gn%"=="5" call:fc
if "%gn%"=="6" echo OFFA>Data\User\TurnOffUAC.ini
if "%gn%"=="6" del /s /q Data\User\userpassword.user
if "%gn%"=="6" del /s /q Data\User\UserNumber.user
if "%gn%"=="6" del /s /q Data\User\username.user
if "%gn%"=="6" cls
if "%gn%"=="6" echo 成功！
if "%gn%"=="6" pause
if "%gn%"=="6" exit
goto UACA

:UACG
if not "%passpo%"=="pass" goto errorUAC
cls
echo 关于控制台
echo 版本号  ：%uacv%
echo 更改日期：2022.3.28
echo.
echo 内部版本:%uacvx%
echo.
if "%abc%"=="n" (echo 状态    ：被关闭) else (echo 状态    ：正常)
pause
if "%abc%"=="n" goto errorUACS
goto UACA

:errorUAC
for /f "delims=" %%i in (Data\User\TurnOffUAC.ini) do if "%%i"=="OFFA" goto errorUACS
cls
set tl=用户账户控制遇到错误
set ey=用户账户控制遇到错误
goto error

:errorUACS
cls
echo 用户账户控制台被关闭。
echo 1.开启用户账户控制台
echo 2.关于用户账户控制台
echo 3.返回
set /p oo=
if "%oo%"=="1" goto OnUAC
if "%oo%"=="2" set passpo=pass
if "%oo%"=="2" set abc=n
if "%oo%"=="2" goto UACG
if "%oo%"=="" goto fc
goto errorUACS

:OnUAC
cls
del /s /q Data\User\TurnOffUAC.ini
goto useradd
exit

:UACname
cls
if not "%passpo%"=="pass" goto errorUAC
cls
echo 将账户名从%name%更改为：
set /p ajs=
if "%ajs%"=="Admin" goto errorsetpassword
if "%ajs%"=="Adminstrator" goto errorsetpassword
if "%ajs%"=="User" goto errorsetpassword
if "%ajs%"=="user" goto errorsetpassword
if "%ajs%"=="用户" goto errorsetpassword
if "%ajs%"=="管理员" goto errorsetpassword
if "%ajs%"=="" goto UACname
echo %ajs%>Data\User\username.user
echo 101>Data\User\UserNumber.user
Tools\CIdo.exe /beep 64
cls
echo 成功！
pause
exit

:UACpassword
cls
if not "%passpo%"=="pass" goto errorUAC
cls
echo 将账户密码从%namepassword%更改为：
set /p ajs=
if "%ajs%"=="" goto UACpassword
echo %ajs%>Data\User\userpassword.user
for /f "delims=" %%i in (Data\User\userpassword.user) do set x=%%i
if not "%x%"=="%ajs%" goto errorsetpassword
Tools\CIdo.exe /beep 64
cls
echo 成功！
pause
exit

:errorfiles
cls
set tl=错误
set ey=有一个缺少文件的问题，导致密码保管箱无法继续运作。(code5)
goto error

:chjm
set check=1
echo 加载...
for /f "delims=" %%i in (Data\User\name01.ini) do set name1=%%i
if "%name1%"=="" set name1=槽位01
for /f "delims=" %%i in (Data\User\name02.ini) do set name2=%%i
if "%name2%"=="" set name2=槽位02
for /f "delims=" %%i in (Data\User\name03.ini) do set name3=%%i
if "%name3%"=="" set name3=槽位03
for /f "delims=" %%i in (Data\User\name04.ini) do set name4=%%i
if "%name4%"=="" set name4=槽位04
for /f "delims=" %%i in (Data\User\name05.ini) do set name5=%%i
if "%name5%"=="" set name5=槽位05
for /f "delims=" %%i in (Data\User\name06.ini) do set name6=%%i
if "%name6%"=="" set name6=槽位06
for /f "delims=" %%i in (Data\User\name07.ini) do set name7=%%i
if "%name7%"=="" set name7=槽位07
for /f "delims=" %%i in (Data\User\name08.ini) do set name8=%%i
if "%name8%"=="" set name8=槽位08
for /f "delims=" %%i in (Data\User\name09.ini) do set name9=%%i
if "%name9%"=="" set name9=槽位09
for /f "delims=" %%i in (Data\User\name10.ini) do set name10=%%i
if "%name10%"=="" set name10=槽位10
:jianm
cls
title 槽位界面
echo 选择槽位
echo 1.%name1%
echo 2.%name2%
echo 3.%name3%
echo 4.%name4%
echo 5.%name5%
echo 6.%name6%
echo 7.%name7%
echo 8.%name8%
echo 9.%name9%
echo 10.%name10%
echo back.返回
set /p use=
if "%use%"=="1" set cw=0%use%
if "%use%"=="2" set cw=0%use%
if "%use%"=="3" set cw=0%use%
if "%use%"=="4" set cw=0%use%
if "%use%"=="5" set cw=0%use%
if "%use%"=="6" set cw=0%use%
if "%use%"=="7" set cw=0%use%
if "%use%"=="8" set cw=0%use%
if "%use%"=="9" set cw=0%use%
if "%use%"=="10" set cw=%use%
rem -------------------------------------
if "%use%"=="1" goto ch
if "%use%"=="2" goto ch
if "%use%"=="3" goto ch
if "%use%"=="4" goto ch
if "%use%"=="5" goto ch
if "%use%"=="6" goto ch
if "%use%"=="7" goto ch
if "%use%"=="8" goto ch
if "%use%"=="9" goto ch
if "%use%"=="10" goto ch
if "%use%"=="back" goto fc
goto chjm

:ch
md Data
for /f "delims=" %%i in (Data\User\chu%cw%.ini) do if "%%i"=="" echo %date%>Data\User\chu.ini
if not exist "Data\User\chu%cw%.ini" echo %date%,槽位%cw%>Data\User\chu%cw%.ini
cls
echo 你要进行什么操作？
echo 1.修改槽位的名称
echo 2.查看或编辑槽位的内容
echo 3.返回
set /p ut=
if "%ut%"=="1" goto chg
if "%ut%"=="2" goto chk
if "%ut%"=="3" goto chjm
goto ch
:chk
start Data\User\chu%cw%.ini
cls
goto fc
:chg
cls
title 更改槽位名
set /p names=输入...
if "%names%"=="" goto che
echo %names%>Data\User\name%cw%.ini
for /f "delims=" %%i in (Data\User\name%cw%.ini) do if not "%%i"=="%names%" goto chc
Tools\CIdo.exe /beep 64
cls
echo 成功！
pause
goto chjm

:chc
del /s /q Data\User\name%cw%.ini
cls
set tl=错误
set ey=有一个问题，导致密码保管箱无法存储它。(code6)
goto error
exit

:che
set tl=错误
set ey=你没有输入槽位名。(code7)
goto error


:About
for /f "delims=" %%i in (Data\User\TurnOffUAC.ini) do set jss=%%i
if "%jss%"=="OFFA" goto Aboutss
if "%name%"=="" goto Abouterror
:Aboutss
cls
title 关于
echo 关于
echo 大版本  ：密码保管箱2022
echo 内部版本：%pbv%
echo 预览通道：Dev Preview
echo 发布日期：2022/3/31
if "%jss%"=="OFFA" goto Abouts
echo 登录为  ：%name%
:Abouts
echo.
echo 内部版本:%pbvx%
echo.
pause
goto fc

:Abouterror
cls
set tl=错误
set ey=有一个问题，导致用户账户控制无法启动。(code8)
goto error
exit

:oobe
cls
title 重置
echo 按任意键重置
pause>nul
echo 操作中...
del /s /q Data
del /s /q Starts\ErrorReport.pbn
rd /s /q Data
del /s /q Starts\Settings.ini
cls
if not exist "Data" goto oobeth
call:oobeE
exit
:oobeE
cls
set tl=错误
set ey=有一个问题，导致密码保管箱无法重置。(code9)
goto error
pause
exit

:oobeth
cls
title 成功重置
Tools\CIdo.exe /beep 64
echo 重置成功。
pause
exit

:EnviromentERROR
set tl=错误
set ey=你的操作系统版本无法达到最低要求。(code10)
goto error

:download
cls
title 下载文件
echo 按任意键代表我已下载必须文件替换Tools\wget.exe
echo 下载地址:https://pan.baidu.com/s/1KNbU8vp26h8qVX49U0pv9Q?pwd=u5cz 
pause
cls
echo 键入完整下载地址：
set /p d=
if "%d%"=="" goto errork
echo 键入后缀:
set /p a=
if "%a%"=="" goto errork
echo 命名为:
set /p m=
if "%m%"=="" goto errork
cls
Tools\wget.exe -c -T 120 -t 0 -O %m%.%a% "%d%"
pause
goto fc
:errork
echo 不得为空。
pause
exit

:Update-rules
cls
title 升级路线
echo 密码保管箱2022                            升级路线
echo ---------------------------------------------------------
echo 2022/3/22-2022/3/23             1.16.5 Dev
echo 1.你可以在没有安装WT的情况下运行密码保管箱。
echo 2.新增了本页面
echo 3.优化启动
echo ---------------------------------------------------------
echo 2022/3/23                        1.16.6
echo 正式发布
echo ---------------------------------------------------------
echo 2022/3/24                        1.17.1 Dev
echo 支持更改槽位名
echo "退出选项"更新
echo ---------------------------------------------------------
echo 2022/3/25                        1.17.2 Dev
echo 保护密码保管箱以不能在不支持的平台上运行。
echo ---------------------------------------------------------
echo 2022/3/28                        1.17.3 Dev Preview
echo "退出选项"修复问题
echo ---------------------------------------------------------
echo 2022/3/30                        1.17.4 Dev Preview
echo 我们修复了一个问题，重新启动现可正常工作。
echo 我们改变了发生错误的方式，现在有一个通用的模块。
echo 我们把部分繁杂的语言进行了简化。
echo 我们把菜单进行了优化。
echo 我们改进了一处：Information文件夹现在不会出现。
echo 我们改进了一处：现在，wget.exe并非必须。
echo ---------------------------------------------------------
echo 2022/3/31                        1.17.5 Dev Preview
echo 在创建用户时，某些用户名将不再可用。
echo ---------------------------------------------------------
echo 2022/4/3                         1.17.51 Dev Preview
echo 我们的1.17.6将引入新功能！同时，也有不足。
echo 1.支持多用户（3位）
echo 2.每个用户都有权限！
echo 3.用户账户控制4.0开发人员将不再可用。
echo 4.我们的1.17.6正在内部测试！(10人)
echo 访问内部测试：www.familydepartment.com/passwordbox/text.html
echo ----------------------------------------------------------
pause
goto fc