@echo off

setlocal enableextensions
setlocal EnableDelayedExpansion

setlocal

set PATH=%PATH%;C:\MyPrograms\

echo Installing...

if NOT EXIST "C:\Temp\PhysX_9.10.0513_SystemSoftware.exe"\ (

curl.exe -sL -O --output-dir C:\Temp\ https://us.download.nvidia.com/Windows/9.10.0513/PhysX_9.10.0513_SystemSoftware.exe

)

start /W C:\Temp\PhysX_9.10.0513_SystemSoftware.exe

endlocal
