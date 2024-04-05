@echo off

setlocal enableextensions
setlocal EnableDelayedExpansion

echo Installing...

setlocal

set PATH=%PATH%;C:\MyPrograms\;C:\MyPrograms\7zip

set dxvkver=%1

if NOT EXIST "C:\Temp\dxvk-async-%dxvkver%.tar.gz"\ (

curl.exe -sL -O --output-dir C:\Temp\ https://github.com/Sporif/dxvk-async/releases/download/%dxvkver%/dxvk-async-%dxvkver%.tar.gz

)



cd /D C:\Temp\
7z.exe x "C:\Temp\dxvk-async-%dxvkver%.tar.gz" -so | 7z.exe x -aoa -si -ttar -o"C:\Temp\" >NUL 2>&1
copy /y C:\Temp\dxvk-async-%dxvkver%\x64\*.dll C:\windows\system32
copy /y C:\Temp\dxvk-async-%dxvkver%\x32\*.dll C:\windows\syswow64
rmdir /Q /S C:\Temp\dxvk-async-%dxvkver%
 
