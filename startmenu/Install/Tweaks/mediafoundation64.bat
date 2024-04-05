@echo off

setlocal enableextensions
setlocal EnableDelayedExpansion

setlocal

set PATH=%PATH%;C:\MyPrograms\;C:\MyPrograms\7zip

echo Installing...

if NOT EXIST "C:\Temp\mediafoundation64.tar.xz"\ (

curl.exe -sL -O --output-dir C:\Temp\ https://github.com/Pipetto-crypto/androBox-extra/raw/master/tweaks/mediafoundation64.tar.xz

)

if EXIST "C:\Temp\mediafoundation64.tar.xz"\ (

set SHA1SUMOLD=dccdf6eb983c2db431462f5efce79a9250a85b6e
FOR /F "tokens=*" %%g IN ('sha1sum.exe  "C:\Temp\mediafoundation64.tar.xz" ^| awk.exe  "{print $1}"') do (SET SHA1SUMNEW=%%g)


if NOT !SHA1SUMOLD! == !SHA1SUMNEW! (

del /Q /F C:\Temp\mediafoundation64.tar.xz
curl.exe -sL -O --output-dir C:\Temp\ https://github.com/Pipetto-crypto/androBox-extra/raw/master/tweaks/mediafoundation64.tar.xz

)

)


cd /D C:\Temp\
7z.exe x mediafoundation64.tar.xz -so | 7z.exe x -aoa -si -ttar -o"C:\Temp\" >NUL 2>&1
cd mediafoundation64
copy /y *.dll C:\windows\system32
call dll_override.bat >NUL 2>&1
regedit.exe mf.reg
regedit.exe wmf.reg
C:\windows\system32\regsvr32 colorcnv.dll
C:\windows\system32\regsvr32 msmpeg2adec.dll
C:\windows\system32\regsvr32 msmpeg2vdec.dll

cd /D C:\Temp\
rmdir /Q /S C:\Temp\mediafoundation64

endlocal
