@echo off

setlocal enableextensions
setlocal EnableDelayedExpansion

echo Installing...

setlocal

set PATH=%PATH%;C:\MyPrograms\

set dxvkver=%1

if NOT EXIST "C:\Temp\dxvk-gplasync-v%dxvkver%.tar.gz"\ (

curl.exe -sL -O --output-dir C:\Temp\ https://gitlab.com/Ph42oN/dxvk-gplasync/-/raw/main/releases/dxvk-gplasync-v%dxvkver%.tar.gz

)



cd /D C:\Temp\
7z.exe x "C:\Temp\dxvk-gplasync-v%dxvkver%.tar.gz" -so | 7z.exe x -aoa -si -ttar -o"C:\Temp\" >NUL 2>&1
copy /y C:\Temp\dxvk-gplasync-v%dxvkver%\x64\*.dll C:\windows\system32
copy /y C:\Temp\dxvk-gplasync-v%dxvkver%\x32\*.dll C:\windows\syswow64
rmdir /Q /S C:\Temp\dxvk-gplasync-v%dxvkver%

