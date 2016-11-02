@setlocal enableextensions enabledelayedexpansion
@echo off

REM Check to see wheter 7zip is working.
WHERE 7z
IF %ERRORLEVEL% NEQ 0 (
    ECHO 7zip is Missing
    GOTO END1
)

SET "location= "
SET "outfile= "

call:readINI location %1 location
call:readINI outfile %1 filename
call:readINI devloc %1 devloc
rem echo.loc %location%
echo.out %outfile%

wget --no-check-certificate -O %USERPROFILE%\.winrb\%outfile% %location%
7z -o%USERPROFILE%\.winrb\devkit -y x %USERPROFILE%\.winrb\%outfile%

set outfile=%outfile:.7z=%
set outfile=%outfile:.zip=%
set outfile=%outfile:.exe=%

IF NOT [%outfile%]==[%1] (
	ren %USERPROFILE%\.winrb\%outfile% %1
)

:readINI
IF defined PROGRAMFILES(x86) (
	SET arch=64
) ELSE (
	SET arch=32
)

for /f "delims=" %%a in ('call %USERPROFILE%\.winrb\read-ini.bat %USERPROFILE%\.winrb\install_%arch%.ini %~2 %~3') do (
    set %~1=%%a
)
GOTO:EOF
``
:END1
