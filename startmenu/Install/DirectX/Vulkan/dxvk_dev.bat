@echo off

setlocal enableextensions
setlocal EnableDelayedExpansion

echo Installing...

setlocal

set PATH=%PATH%;C:\MyPrograms\;C:\MyPrograms\7zip


curl.exe -sL -O --output-dir C:\Temp\ https://github.com/Pipetto-crypto/androBox/releases/download/dxvk-dev/dxvk-dev.tar.xz

cd /D C:\Temp\
7z.exe x dxvk-dev.tar.xz -so | C:\MyPrograms\7zip\7z.exe x -aoa -si -ttar -o"C:\Temp\" >NUL 2>&1
copy /Y C:\Temp\dxvk-dev\x64\*.dll C:\windows\system32 >NUL 2>&1
copy /Y C:\Temp\dxvk-dev\x32\*.dll C:\windows\syswow64 >NUL 2>&1
rmdir /Q /S "C:\Temp\dxvk-dev"
del /Q /F C:\Temp\dxvk-dev.tar.xz
reg add HKEY_CURRENT_USER\Software\Wine /v DllOverrides /f >NUL 2>&1
reg add HKEY_CURRENT_USER\Software\Wine\DllOverrides /v dxgi /t REG_SZ /d native,builtin /f >NUL 2>&1
reg add HKEY_CURRENT_USER\Software\Wine\DllOverrides /v d3d10core /t REG_SZ /d native,builtin /f >NUL 2>&1
reg add HKEY_CURRENT_USER\Software\Wine\DllOverrides /v d3d11 /t REG_SZ /d native,builtin /f >NUL 2>&1
reg add HKEY_CURRENT_USER\Software\Wine\DllOverrides /v d3d9 /t REG_SZ /d native,builtin /f >NUL 2>&1
