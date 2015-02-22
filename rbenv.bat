@echo off
echo "rbenv"
if [%1]==[install] GOTO Dl1
GOTO End1
:Dl1

if [%2]==[2.0.0] wget -o ruby\ruby2.0.0_64.exe http://dl.bintray.com/oneclick/rubyinstaller/rubyinstaller-2.0.0-p598-x64.exe?direct

if [%2]==[2.1.5] wget -o ruby\ruby2.1.5_64.exe http://dl.bintray.com/oneclick/rubyinstaller/rubyinstaller-2.1.5-x64.exe?direct
:End1
