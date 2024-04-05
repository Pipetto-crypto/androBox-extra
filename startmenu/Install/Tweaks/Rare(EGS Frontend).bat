@echo off

setlocal enableextensions
setlocal EnableDelayedExpansion

setlocal

set PATH=%PATH%;C:\MyPrograms\

echo Installing...

if NOT EXIST "C:\Program Files\Pale Moon\palemoon.exe"\ (

start /W install_palemoon.bat

)

if NOT EXIST "C:\Temp\Rare-1.10.11.201.msi"\ (

curl.exe -sL -O --output-dir C:\Temp\  https://github.com/RareDevs/Rare/releases/download/1.10.11.201/Rare-1.10.11.201.msi

)

start /W C:\Temp\Rare-1.10.11.201.msi

endlocal
