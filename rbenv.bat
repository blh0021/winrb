@ECHO off
rem ECHO WINRB - Windows rbenv alternative
IF "%OLDPATH%" == "" (
	set "OLDPATH=%PATH%"
)

for /f "delims=" %%i in ('%USERPROFILE%\.winrb\jscript\bin\pdfind.exe') do set output=%%i

IF [%output%]==[false] (
	echo No local ruby version defined!
) ELSE (
	SET /p rlocal=<%output%
)

SET "PATH=%USERPROFILE%\.winrb\%rlocal%\bin;%OLDPATH%"

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
