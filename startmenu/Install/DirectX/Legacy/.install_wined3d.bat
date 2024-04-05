@echo off

setlocal enableextensions
setlocal EnableDelayedExpansion

echo Installing...

setlocal

set PATH=%PATH%;C:\MyPrograms\;C:\MyPrograms\7zip

set wined3dver=%1

if NOT EXIST "C:\Temp\WineD3DForWindows_%wined3dver%.zip"\ (

curl.exe -sL -O --output-dir C:\Temp\ https://downloads.fdossena.com/Projects/WineD3D/Builds/WineD3DForWindows_%wined3dver%.zip

)



cd /D C:\Temp\
mkdir C:\Temp\wined3d
7z.exe x "C:\Temp\WineD3DForWindows_%wined3dver%.zip" -aoa -o"C:\Temp\wined3d"  >NUL 2>&1
del /Q /F C:\Temp\wined3d\ddraw.dll C:\Temp\wined3d\*.txt
copy /Y C:\Temp\wined3d\*.dll C:\windows\syswow64 
rmdir /Q /S "C:\Temp\wined3d"

reg add HKEY_CURRENT_USER\Software\Wine /v DllOverrides /f >NUL 2>&1
reg add HKEY_CURRENT_USER\Software\Wine\DllOverrides /v dxgi /t REG_SZ /d native,builtin /f >NUL 2>&1
reg add HKEY_CURRENT_USER\Software\Wine\DllOverrides /v d3d10 /t REG_SZ /d native,builtin /f >NUL 2>&1
reg add HKEY_CURRENT_USER\Software\Wine\DllOverrides /v d3d11 /t REG_SZ /d native,builtin /f >NUL 2>&1
reg add HKEY_CURRENT_USER\Software\Wine\DllOverrides /v d3d9 /t REG_SZ /d native,builtin /f >NUL 2>&1
reg add HKEY_CURRENT_USER\Software\Wine\DllOverrides /v d3d10_1 /t REG_SZ /d native,builtin /f >NUL 2>&1
reg add HKEY_CURRENT_USER\Software\Wine\DllOverrides /v d3d10core /t REG_SZ /d native,builtin /f >NUL 2>&1
reg add HKEY_CURRENT_USER\Software\Wine\DllOverrides /v libwine /t REG_SZ /d native,builtin /f >NUL 2>&1
reg add HKEY_CURRENT_USER\Software\Wine\DllOverrides /v wined3d /t REG_SZ /d native,builtin /f >NUL 2>&1