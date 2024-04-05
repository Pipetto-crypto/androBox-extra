@echo off

setlocal enableextensions
setlocal EnableDelayedExpansion

setlocal

set PATH=%PATH%;C:\MyPrograms\7zip;C:\MyPrograms\

echo Installing...

if NOT EXIST "C:\Temp\d3d8.dll"\ (

curl.exe -sL -O --output-dir C:\Temp\ https://github.com/crosire/d3d8to9/releases/download/v1.11.1/d3d8.dll

)

cd /D C:\Temp\
copy /y C:\windows\syswow64\d3d8.dll C:\windows\syswow64\d3d8.dll.old
copy /y d3d8.dll C:\windows\syswow64
reg add HKEY_CURRENT_USER\Software\Wine /v DllOverrides /f
reg add HKEY_CURRENT_USER\Software\Wine\DllOverrides /v d3d8 /t REG_SZ /d native,builtin /f
