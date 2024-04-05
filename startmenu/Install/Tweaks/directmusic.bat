@echo off

setlocal enableextensions
setlocal EnableDelayedExpansion

setlocal

set PATH=%PATH%;C:\MyPrograms\;C:\MyPrograms\7zip

echo Installing...

if NOT EXIST "C:\Temp\directmusic.tar.xz"\ (

curl.exe -sL -O --output-dir C:\Temp\ https://github.com/Pipetto-crypto/androBox-extra/raw/master/tweaks/directmusic.tar.xz

)

if EXIST "C:\Temp\directmusic.tar.xz"\ (

set SHA1SUMOLD=1373feb6beea6b9bc1188a4b7fdcd6cb3c3f21af
FOR /F "tokens=*" %%g IN ('sha1sum.exe  "C:\Temp\directmusic.tar.xz" ^| awk.exe  "{print $1}"') do (SET SHA1SUMNEW=%%g)


if NOT !SHA1SUMOLD! == !SHA1SUMNEW! (

del /Q /F C:\Temp\directmusic.tar.xz
curl.exe -sL -O --output-dir C:\Temp\ https://github.com/Pipetto-crypto/androBox-extra/raw/master/tweaks/directmusic.tar.xz

)

)


cd /D C:\Temp\
7z.exe x directmusic.tar.xz -so | 7z.exe x -aoa -si -ttar -o"C:\Temp\" >NUL 2>&1
cd directmusic
copy /y *.dll C:\windows\syswow64
reg add HKEY_CURRENT_USER\Software\Wine /v DllOverrides /f >NUL 2>&1
for %%p in (*.dll) do (
set CURRENTDLL=%%p
reg add HKEY_CURRENT_USER\Software\Wine\DllOverrides /v "%%~np" /t REG_SZ /d native,builtin /f >NUL 2>&1
if NOT "!CURRENTDLL!" ==  "dsound.dll" (
C:\windows\syswow64\regsvr32.exe "%%~np"  >NUL 2>&1
)
)
cd /D C:\Temp
rmdir /s /q directmusic

endlocal
