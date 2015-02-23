@ECHO off
rem ECHO WINRB - Windows rbenv alternative
IF "%OLDPATH%" == "" (
	set "OLDPATH=%PATH%"
)

IF [%1]==[versions] (
	dir /a:d /b %USERPROFILE%\.winrb\ruby
	GOTO :END1
)


IF [%1]==[local] (
	SET "PATH=%USERPROFILE%\.winrb\ruby\%2\bin;%OLDPATH%"
	GOTO :END1
)

IF [%1]==[install] (
	call %USERPROFILE%\.winrb\ruby-install.bat %2
	GOTO END1
)



:END1
