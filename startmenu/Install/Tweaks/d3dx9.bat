@echo off

setlocal enableextensions
setlocal EnableDelayedExpansion

setlocal

set PATH=%PATH%;C:\MyPrograms\;C:\MyPrograms\7zip

echo Installing...

if NOT EXIST "C:\Temp\d3dx9.tar.xz"\ (

curl.exe -sL -O --output-dir C:\Temp\ https://github.com/Pipetto-crypto/androBox-extra/raw/master/tweaks/d3dx9.tar.xz

)

if EXIST "C:\Temp\d3dx9.tar.xz"\ (

set SHA1SUMOLD=4964014cf6235a206fd35683ee87e4d958573683
FOR /F "tokens=*" %%g IN ('sha1sum.exe  "C:\Temp\d3dx9.tar.xz" ^| awk.exe  "{print $1}"') do (SET SHA1SUMNEW=%%g)


if NOT !SHA1SUMOLD! == !SHA1SUMNEW! (

del /Q /F C:\Temp\d3dx9.tar.xz
curl.exe -sL -O --output-dir C:\Temp\ https://github.com/Pipetto-crypto/androBox-extra/raw/master/tweaks/d3dx9.tar.xz

)

)


cd /D C:\Temp\
7z.exe x d3dx9.tar.xz -so | 7z.exe x -aoa -si -ttar -o"C:\Temp\" >NUL 2>&1
cd d3dx9
copy /y *.dll C:\windows\syswow64
call dll_override.bat >NUL 2>&1
cd /D C:\Temp\
rmdir /Q /S C:\Temp\d3dx9

endlocal
