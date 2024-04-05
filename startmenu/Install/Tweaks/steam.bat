@echo off

echo off

setlocal enableextensions
setlocal EnableDelayedExpansion

setlocal


set PATH=%PATH%;C:\MyPrograms\;C:\MyPrograms\7zip

echo Installing...

call "%~dp0install_corefonts.bat"

if NOT EXIST "C:\Temp\SteamSetup.exe"\ (

curl.exe -sL -O --output-dir C:\Temp\ https://cdn.cloudflare.steamstatic.com/client/installer/SteamSetup.exe

)

start /W C:\Temp\SteamSetup.exe

endlocal
