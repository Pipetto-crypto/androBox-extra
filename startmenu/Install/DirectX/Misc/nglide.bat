@echo off

setlocal enableextensions
setlocal EnableDelayedExpansion

echo Installing...

setlocal

set PATH=%PATH%;C:\MyPrograms\7zip;C:\MyPrograms\


if NOT EXIST "C:\Temp\nglide.exe"\ (

curl.exe -J -L https://www.zeus-software.com/downloads/nglide/d-1.html -o "C:\Temp\nglide.exe"

)

start /W C:\Temp\nglide.exe

reg add HKEY_CURRENT_USER\Software\Wine /v DllOverrides /f >NUL 2>&1 
reg add HKEY_CURRENT_USER\Software\Wine\DllOverrides /v glide /t REG_SZ /d native,builtin /f >NUL 2>&1
reg add HKEY_CURRENT_USER\Software\Wine\DllOverrides /v glide2x /t REG_SZ /d native,builtin /f >NUL 2>&1
reg add HKEY_CURRENT_USER\Software\Wine\DllOverrides /v glide3x /t REG_SZ /d native,builtin /f >NUL 2>&1
reg add HKEY_CURRENT_USER\Software\Wine\DllOverrides /v 3dfxSpl /t REG_SZ /d native,builtin /f >NUL 2>&1
reg add HKEY_CURRENT_USER\Software\Wine\DllOverrides /v 3dfxSpl2 /t REG_SZ /d native,builtin /f >NUL 2>&1
reg add HKEY_CURRENT_USER\Software\Wine\DllOverrides /v 3dfxSpl3 /t REG_SZ /d native,builtin /f >NUL 2>&1

endlocal
