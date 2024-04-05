@echo off

setlocal enableextensions
setlocal EnableDelayedExpansion

echo Installing...

setlocal

set PATH=%PATH%;C:\MyPrograms\;C:\MyPrograms\7zip

set dxvkver=%1

if NOT EXIST "C:\Temp\dxvk-%dxvkver%.tar.gz"\ (

curl.exe -sL -O --output-dir C:\Temp\ https://github.com/doitsujin/dxvk/releases/download/v%dxvkver%/dxvk-%dxvkver%.tar.gz

)



cd /D C:\Temp\
7z.exe x "C:\Temp\dxvk-%dxvkver%.tar.gz" -so | 7z.exe x -aoa -si -ttar -o"C:\Temp\" >NUL 2>&1
copy /Y C:\Temp\dxvk-%dxvkver%\x64\*.dll C:\windows\system32 >NUL 2>&1
copy /Y C:\Temp\dxvk-%dxvkver%\x32\*.dll C:\windows\syswow64 >NUL 2>&1
rmdir /Q /S "C:\Temp\dxvk-%dxvkver%"
