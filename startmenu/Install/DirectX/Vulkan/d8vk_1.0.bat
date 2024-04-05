@echo off

setlocal enableextensions
setlocal EnableDelayedExpansion

setlocal

set PATH=%PATH%;C:\MyPrograms\7zip;C:\MyPrograms\

echo Installing...

if NOT EXIST "C:\Temp\d8vk-v1.0.tar.gz"\ (

curl.exe -sL -O --output-dir C:\Temp\ https://github.com/AlpyneDreams/d8vk/releases/download/d8vk-v1.0/d8vk-v1.0.tar.gz

)

cd /D C:\Temp\
mkdir C:\Temp\d8vk
7z.exe x "C:\Temp\d8vk-v1.0.tar.gz" -so | C:\MyPrograms\7zip\7z.exe x -aoa -si -ttar -o"C:\Temp\d8vk"
copy /y C:\Temp\d8vk\x32\d3d8.dll C:\windows\syswow64
rmdir /Q /S C:\Temp\d8vk
reg add HKEY_CURRENT_USER\Software\Wine /v DllOverrides /f
reg add HKEY_CURRENT_USER\Software\Wine\DllOverrides /v d3d8 /t REG_SZ /d native,builtin /f
