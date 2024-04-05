@echo off

setlocal enableextensions
setlocal EnableDelayedExpansion

setlocal

set PATH=%PATH%;C:\MyPrograms\

echo Installing...

if NOT EXIST "C:\Temp\palemoon-33.0.0.win64.installer.exe"\ (

curl.exe -sL -O --output-dir C:\Temp\ https://rm-eu.palemoon.org/release/palemoon-33.0.0.win64.installer.exe

)

start /W C:\Temp\palemoon-33.0.0.win64.installer.exe

endlocal
