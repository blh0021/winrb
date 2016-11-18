@ECHO off
rem ECHO WINRB - Windows rbenv alternative

IF [%1]==[] (
	echo rbenv
	echo     - install versionNum
	echo     - local versionNum
	echo     - versions                "will list the versions installed"
	echo     - devkit                  "install devkit for native compiling"
	echo     - fixcert                 "download new cert for gemfiles"
	GOTO :END1
)

IF "%OLDPATH%" == "" (
	SET "OLDPATH=%PATH%"
)

for /f "delims=" %%i in ('"%USERPROFILE%\.winrb\jscript\bin\pdfind.exe"') do set output=%%i

IF [%output%]==[false] (
	echo No local ruby version defined!
) ELSE (
	SET /p rlocal=<%output%
	rem echo %rlocal%
	SET "PATH=%USERPROFILE%\.winrb\ruby\%rlocal%\bin;%OLDPATH%"
)

IF [%1]==[versions] (
	dir /a:d /b "%USERPROFILE%\.winrb\ruby"
	GOTO :END1
)

IF [%1]==[local] (
	SET "PATH=%USERPROFILE%\.winrb\ruby\%2\bin;%OLDPATH%"
	"%USERPROFILE%\.winrb\devkit\devkitvars.bat"
	GOTO :END1
)

IF [%1]==[install] (
	call "%USERPROFILE%\.winrb\ruby-install.bat" %2
	GOTO END1
)

IF [%1]==[devkit] (
	call "%USERPROFILE%\.winrb\devk-install.bat" DevKit
	GOTO END1
)

IF [%1]==[fixcert] (
	wget curl.haxx.se/ca/cacert.pem -O "%USERPROFILE%\.winrb\cert\cacert.pem" --no-check-certificate
	set SSL_CERT_FILE=%USERPROFILE%\.winrb\cert\cacert.pem
)
:END1
