@echo off

setlocal enableextensions
setlocal EnableDelayedExpansion

echo Installing...

setlocal

set PATH=%PATH%;C:\MyPrograms\;C:\MyPrograms\7zip

set arch=%1
set type=%2
set date=%3
set revision=%4

mkdir C:\Temp\mesa\aarch64\turnip 2>NUL
mkdir C:\Temp\mesa\aarch64\zink 2>NUL
mkdir C:\Temp\mesa\armhf\turnip 2>NUL
mkdir C:\Temp\mesa\armhf\zink 2>NUL


if NOT EXIST "C:\Temp\mesa\%arch%\%type%\%type%_%date%%revision%.tar.xz"\ (

curl.exe -sL -O --output-dir C:\Temp\mesa\%arch%\%type% https://github.com/Pipetto-crypto/mesa-builds/raw/master/%arch%/%type%/%type%_%date%%revision%.tar.xz

)



cd /D C:\Temp\
if %arch%==aarch64 (
   if NOT EXIST "Z:\usr\glibc" (
       
       7z.exe x "C:\Temp\mesa\%arch%\%type%\%type%_%date%%revision%.tar.xz" -so | 7z.exe x -aoa -si -ttar -o"Z:\usr\lib\aarch64-linux-gnu" >NUL 2>&1
   )

7z.exe x "C:\Temp\mesa\%arch%\%type%\%type%_%date%%revision%.tar.xz" -so | 7z.exe x -aoa -si -ttar -o"Z:\usr\glibc\lib" >NUL 2>&1

)


