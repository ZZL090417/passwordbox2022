@echo off
::WYSBDM:103.2
ver | find "10.0" >  NUL && set Sy=Y
if not "%Sy%"=="Y" goto EnviromentERROR
set SystemVer=Microsoft-Windows10.0
for /f "delims=" %%i in (Starts\Tel.ini) do set bb=%%i
if not "%bb%"=="103.2" exit
echo no>Starts\Tel.ini
:sdg
title ��ʼ
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
set us=��û�������κ�����
cls
echo %name%
echo ���������õ����룺
set /p us=
if "%passwordci%"=="104" goto errormm
if "%us%"=="%namepassword%" goto startdddd
set /a passwordci=%passwordci%+1
goto mmm

:error
Tools\CIdo.exe /beep 16
cls
title %tl%
echo ����:%ey%
pause
exit

:errormm
cls
set tl=����
set ey=�������������ࣨcode1)
goto error

:errormmm
cls
set tl=����
set ey=��һ�����⣬�������뱣�����޷�����������(code2)
goto error

:useradd
cls
md Data
md Data\User\
cls
echo �����û�
echo �����û�����
echo off.�ر��û��˻�����̨
set /p un=
if "%un%"=="Admin" goto errorsetpassword
if "%un%"=="Adminstrator" goto errorsetpassword
if "%un%"=="User" goto errorsetpassword
if "%un%"=="user" goto errorsetpassword
if "%un%"=="�û�" goto errorsetpassword
if "%un%"=="����Ա" goto errorsetpassword
if "%un%"=="off" echo OFFA>Data\User\TurnOffUAC.ini
if "%un%"=="off" del /s /q Data\User\userpassword.user
if "%un%"=="off" del /s /q Data\User\UserNumber.user
if "%un%"=="off" del /s /q Data\User\username.user
if "%un%"=="off" cls
if "%un%"=="off" echo �������.
if "%un%"=="off" pause
if "%un%"=="off" exit
if "%un%"=="" goto useradd
echo %un%>Data\User\username.user
echo 101>Data\User\UserNumber.user
cls
:userpasswordset
echo �����û�
echo ���ô��û������룺
set /p Userpassword=
if "%Userpassword%"=="" cls
if "%Userpassword%"=="" echo �뻻һ����������
if "%Userpassword%"=="" goto userpasswordset
if "%un%"=="" msg * "�뻻һ���û�����"
if "%un%"=="" goto userpasswordset
echo %Userpassword%>Data\User\userpassword.user
for /f "delims=" %%i in (Data\User\userpassword.user) do set x=%%i
if not "%x%"=="%Userpassword%" goto errorsetpassword
cls
echo ��ʾ��
echo �ɹ������û���%un%
echo ����Ϊ      ��%Userpassword%
echo -�����û��˻���������йر��û��˻�����-
pause
exit

:errorsetpassword
cls
del /s /q Data\User\userpassword.user
del /s /q Data\User\username.user
del /s /q Data\User\UserNumber.user
rd /s /q Data\User\
cls
set tl=����
set ey=��һ���ڲ����⣬������������޷��������档(code3)
goto error

:startdddd
if not exist "Tools\wget.exe" call:errorfiles
if not exist "Tools\CIdo.exe" call:errorfiles
cls
:fc
set user=100
title ���뱣����,�汾%pbv%
cls
echo �˵�
echo 1.�鿴/�༭ ����
echo 2.�������뱣����
echo 3.�û��˻�����̨
echo 4.�˳�ѡ��
echo 5.����
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
title ����
echo 1.���¼�¼
echo 2.�����ļ�
echo 3.����
echo 4.����
set /p num=
if "%num%"=="1" goto Update-rules
if "%num%"=="2" goto download
if "%num%"=="3" goto About
if "%num%"=="4" goto fc
goto else


:Et
set zxy=3.ע��
for /f "delims=" %%i in (Data\User\TurnOffUAC.ini) do if "%%i"=="OFFA" set zxy=3.��ѡ����Ч
cls
title �˳�
echo 1.�˳�
echo 2.��������
if not "%zxy%"=="3.��ѡ����Ч" echo 3.ע��
echo 4.����
set /p nu=
if "%nu%"=="1" exit
if "%nu%"=="2" goto restarts
if "%nu%"=="4" goto fc
if "%nu%"=="3" goto Etp
goto Et

:Etp
if "%zxy%"=="3.��ѡ����Ч" goto Et
goto startuser


:restarts
cls
title ��������
if not exist "Starts\Restart.bat" goto errorre
echo 103.1>Starts\Tel.ini
start Starts\Restart.bat
exit

:errorre
set tl=����
set ey=��һ�����⣬�������뱣�����޷�����������(code4)
goto error

:UAC
cls
title �û��˻�����̨,�汾%uacv%
for /f "delims=" %%i in (Data\User\userpassword.user) do set namepassword=%%i
for /f "delims=" %%i in (Data\User\username.user) do set name=%%i
if "%name%"=="" goto errorUAC
if "%namepassword%"=="" goto errorUAC
cls
echo                   %name%
echo    ���룺
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
echo �û��˻�����̨
echo.
echo 1.�˻�������
echo ԭ�û���%name%
echo.
echo 2.�˻��������
echo ԭ���룺%namepassword%
echo.
echo 3.�����˻������˻�����
echo ע�⣺��洢�����뽫�������
echo.
echo 4.�����û��˻�����̨
echo.
echo 5.����
echo.
echo 6.�ر��û��˻�����
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
if "%gn%"=="6" echo �ɹ���
if "%gn%"=="6" pause
if "%gn%"=="6" exit
goto UACA

:UACG
if not "%passpo%"=="pass" goto errorUAC
cls
echo ���ڿ���̨
echo �汾��  ��%uacv%
echo �������ڣ�2022.3.28
echo.
echo �ڲ��汾:%uacvx%
echo.
if "%abc%"=="n" (echo ״̬    �����ر�) else (echo ״̬    ������)
pause
if "%abc%"=="n" goto errorUACS
goto UACA

:errorUAC
for /f "delims=" %%i in (Data\User\TurnOffUAC.ini) do if "%%i"=="OFFA" goto errorUACS
cls
set tl=�û��˻�������������
set ey=�û��˻�������������
goto error

:errorUACS
cls
echo �û��˻�����̨���رա�
echo 1.�����û��˻�����̨
echo 2.�����û��˻�����̨
echo 3.����
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
echo ���˻�����%name%����Ϊ��
set /p ajs=
if "%ajs%"=="Admin" goto errorsetpassword
if "%ajs%"=="Adminstrator" goto errorsetpassword
if "%ajs%"=="User" goto errorsetpassword
if "%ajs%"=="user" goto errorsetpassword
if "%ajs%"=="�û�" goto errorsetpassword
if "%ajs%"=="����Ա" goto errorsetpassword
if "%ajs%"=="" goto UACname
echo %ajs%>Data\User\username.user
echo 101>Data\User\UserNumber.user
Tools\CIdo.exe /beep 64
cls
echo �ɹ���
pause
exit

:UACpassword
cls
if not "%passpo%"=="pass" goto errorUAC
cls
echo ���˻������%namepassword%����Ϊ��
set /p ajs=
if "%ajs%"=="" goto UACpassword
echo %ajs%>Data\User\userpassword.user
for /f "delims=" %%i in (Data\User\userpassword.user) do set x=%%i
if not "%x%"=="%ajs%" goto errorsetpassword
Tools\CIdo.exe /beep 64
cls
echo �ɹ���
pause
exit

:errorfiles
cls
set tl=����
set ey=��һ��ȱ���ļ������⣬�������뱣�����޷�����������(code5)
goto error

:chjm
set check=1
echo ����...
for /f "delims=" %%i in (Data\User\name01.ini) do set name1=%%i
if "%name1%"=="" set name1=��λ01
for /f "delims=" %%i in (Data\User\name02.ini) do set name2=%%i
if "%name2%"=="" set name2=��λ02
for /f "delims=" %%i in (Data\User\name03.ini) do set name3=%%i
if "%name3%"=="" set name3=��λ03
for /f "delims=" %%i in (Data\User\name04.ini) do set name4=%%i
if "%name4%"=="" set name4=��λ04
for /f "delims=" %%i in (Data\User\name05.ini) do set name5=%%i
if "%name5%"=="" set name5=��λ05
for /f "delims=" %%i in (Data\User\name06.ini) do set name6=%%i
if "%name6%"=="" set name6=��λ06
for /f "delims=" %%i in (Data\User\name07.ini) do set name7=%%i
if "%name7%"=="" set name7=��λ07
for /f "delims=" %%i in (Data\User\name08.ini) do set name8=%%i
if "%name8%"=="" set name8=��λ08
for /f "delims=" %%i in (Data\User\name09.ini) do set name9=%%i
if "%name9%"=="" set name9=��λ09
for /f "delims=" %%i in (Data\User\name10.ini) do set name10=%%i
if "%name10%"=="" set name10=��λ10
:jianm
cls
title ��λ����
echo ѡ���λ
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
echo back.����
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
if not exist "Data\User\chu%cw%.ini" echo %date%,��λ%cw%>Data\User\chu%cw%.ini
cls
echo ��Ҫ����ʲô������
echo 1.�޸Ĳ�λ������
echo 2.�鿴��༭��λ������
echo 3.����
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
title ���Ĳ�λ��
set /p names=����...
if "%names%"=="" goto che
echo %names%>Data\User\name%cw%.ini
for /f "delims=" %%i in (Data\User\name%cw%.ini) do if not "%%i"=="%names%" goto chc
Tools\CIdo.exe /beep 64
cls
echo �ɹ���
pause
goto chjm

:chc
del /s /q Data\User\name%cw%.ini
cls
set tl=����
set ey=��һ�����⣬�������뱣�����޷��洢����(code6)
goto error
exit

:che
set tl=����
set ey=��û�������λ����(code7)
goto error


:About
for /f "delims=" %%i in (Data\User\TurnOffUAC.ini) do set jss=%%i
if "%jss%"=="OFFA" goto Aboutss
if "%name%"=="" goto Abouterror
:Aboutss
cls
title ����
echo ����
echo ��汾  �����뱣����2022
echo �ڲ��汾��%pbv%
echo Ԥ��ͨ����Dev Preview
echo �������ڣ�2022/3/31
if "%jss%"=="OFFA" goto Abouts
echo ��¼Ϊ  ��%name%
:Abouts
echo.
echo �ڲ��汾:%pbvx%
echo.
pause
goto fc

:Abouterror
cls
set tl=����
set ey=��һ�����⣬�����û��˻������޷�������(code8)
goto error
exit

:oobe
cls
title ����
echo �����������
pause>nul
echo ������...
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
set tl=����
set ey=��һ�����⣬�������뱣�����޷����á�(code9)
goto error
pause
exit

:oobeth
cls
title �ɹ�����
Tools\CIdo.exe /beep 64
echo ���óɹ���
pause
exit

:EnviromentERROR
set tl=����
set ey=��Ĳ���ϵͳ�汾�޷��ﵽ���Ҫ��(code10)
goto error

:download
cls
title �����ļ�
echo ������������������ر����ļ��滻Tools\wget.exe
echo ���ص�ַ:https://pan.baidu.com/s/1KNbU8vp26h8qVX49U0pv9Q?pwd=u5cz 
pause
cls
echo �����������ص�ַ��
set /p d=
if "%d%"=="" goto errork
echo �����׺:
set /p a=
if "%a%"=="" goto errork
echo ����Ϊ:
set /p m=
if "%m%"=="" goto errork
cls
Tools\wget.exe -c -T 120 -t 0 -O %m%.%a% "%d%"
pause
goto fc
:errork
echo ����Ϊ�ա�
pause
exit

:Update-rules
cls
title ����·��
echo ���뱣����2022                            ����·��
echo ---------------------------------------------------------
echo 2022/3/22-2022/3/23             1.16.5 Dev
echo 1.�������û�а�װWT��������������뱣���䡣
echo 2.�����˱�ҳ��
echo 3.�Ż�����
echo ---------------------------------------------------------
echo 2022/3/23                        1.16.6
echo ��ʽ����
echo ---------------------------------------------------------
echo 2022/3/24                        1.17.1 Dev
echo ֧�ָ��Ĳ�λ��
echo "�˳�ѡ��"����
echo ---------------------------------------------------------
echo 2022/3/25                        1.17.2 Dev
echo �������뱣�����Բ����ڲ�֧�ֵ�ƽ̨�����С�
echo ---------------------------------------------------------
echo 2022/3/28                        1.17.3 Dev Preview
echo "�˳�ѡ��"�޸�����
echo ---------------------------------------------------------
echo 2022/3/30                        1.17.4 Dev Preview
echo �����޸���һ�����⣬���������ֿ�����������
echo ���Ǹı��˷�������ķ�ʽ��������һ��ͨ�õ�ģ�顣
echo ���ǰѲ��ַ��ӵ����Խ����˼򻯡�
echo ���ǰѲ˵��������Ż���
echo ���ǸĽ���һ����Information�ļ������ڲ�����֡�
echo ���ǸĽ���һ�������ڣ�wget.exe���Ǳ��롣
echo ---------------------------------------------------------
echo 2022/3/31                        1.17.5 Dev Preview
echo �ڴ����û�ʱ��ĳЩ�û��������ٿ��á�
echo ---------------------------------------------------------
echo 2022/4/3                         1.17.51 Dev Preview
echo ���ǵ�1.17.6�������¹��ܣ�ͬʱ��Ҳ�в��㡣
echo 1.֧�ֶ��û���3λ��
echo 2.ÿ���û�����Ȩ�ޣ�
echo 3.�û��˻�����4.0������Ա�����ٿ��á�
echo 4.���ǵ�1.17.6�����ڲ����ԣ�(10��)
echo �����ڲ����ԣ�www.familydepartment.com/passwordbox/text.html
echo ----------------------------------------------------------
pause
goto fc