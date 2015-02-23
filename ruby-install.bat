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
rem echo.loc %location%
rem echo.out %outfile%

wget --no-check-certificate -O %USERPROFILE%\.winrb\ruby\%outfile% %location%
7z -o%USERPROFILE%\.winrb\ruby -y x %USERPROFILE%\.winrb\ruby\%outfile%

:readINI 
for /f "delims=" %%a in ('call %USERPROFILE%\.winrb\read-ini.bat %USERPROFILE%\.winrb\install.ini %~2 %~3') do (
    set %~1=%%a
)
GOTO:EOF

:END1