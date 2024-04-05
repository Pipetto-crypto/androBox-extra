@echo off

setlocal enableextensions
setlocal EnableDelayedExpansion

setlocal

set PATH=%PATH%;C:\MyPrograms\;C:\MyPrograms\7zip

echo Installing...

if NOT EXIST "C:\Temp\mediafoundation32.tar.xz"\ (

curl.exe -sL -O --output-dir C:\Temp\ https://github.com/Pipetto-crypto/androBox-extra/raw/master/tweaks/mediafoundation32.tar.xz

)

if EXIST "C:\Temp\mediafoundation32.tar.xz"\ (

set SHA1SUMOLD=2847029c74212ade830f4b39b93cf6e5d7ee8d69
FOR /F "tokens=*" %%g IN ('sha1sum.exe  "C:\Temp\mediafoundation32.tar.xz" ^| awk.exe  "{print $1}"') do (SET SHA1SUMNEW=%%g)


if NOT !SHA1SUMOLD! == !SHA1SUMNEW! (

del /Q /F C:\Temp\mediafoundation32.tar.xz
curl.exe -sL -O --output-dir C:\Temp\ https://github.com/Pipetto-crypto/androBox-extra/raw/master/tweaks/mediafoundation32.tar.xz

)

)


cd /D C:\Temp\
7z.exe x mediafoundation32.tar.xz -so | 7z.exe x -aoa -si -ttar -o"C:\Temp\" >NUL 2>&1
cd mediafoundation32
copy /y *.dll C:\windows\syswow64
call dll_override.bat >NUL 2>&1
reg import mf.reg
reg import wmf.reg
C:\windows\syswow64\regsvr32 colorcnv.dll
C:\windows\syswow64\regsvr32 msmpeg2adec.dll
C:\windows\syswow64\regsvr32 msmpeg2vdec.dll
cd /D C:\Temp\
rmdir /Q /S C:\Temp\mediafoundation32

endlocal
