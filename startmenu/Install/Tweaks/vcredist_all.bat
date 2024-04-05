@echo off

setlocal enableextensions
setlocal EnableDelayedExpansion

setlocal

set PATH=%PATH%;C:\MyPrograms\;C:\MyPrograms\7zip

echo Installing...

if NOT EXIST "C:\Temp\vcredist.tar.xz"\ (

curl.exe -sL -O --output-dir C:\Temp\ https://github.com/Pipetto-crypto/androBox-extra/raw/master/tweaks/vcredist.tar.xz

)

if EXIST "C:\Temp\vcredist.tar.xz"\ (

set SHA1SUMOLD=14af01bdd559cd5c43ae395ba5c4fee4b605f930
FOR /F "tokens=*" %%g IN ('sha1sum.exe  "C:\Temp\vcredist.tar.xz" ^| awk.exe  "{print $1}"') do (SET SHA1SUMNEW=%%g)


if NOT !SHA1SUMOLD! == !SHA1SUMNEW! (

del /Q /F C:\Temp\vcredist.tar.xz
curl.exe -sL -O --output-dir C:\Temp\ https://github.com/Pipetto-crypto/androBox-extra/raw/master/tweaks/vcredist.tar.xz

)

)


cd /D C:\Temp\
7z.exe x vcredist.tar.xz -so | 7z.exe x -aoa -si -ttar -o"C:\Temp\" >NUL 2>&1
cd vcredist
start /W all_vcredist.exe
call dll_override.bat >NUL 2>&1
cd /D C:\Temp\
rmdir /s /q C:\Temp\vcredist

endlocal
