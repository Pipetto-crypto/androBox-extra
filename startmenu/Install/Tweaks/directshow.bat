@echo off

setlocal enableextensions
setlocal EnableDelayedExpansion

setlocal

set PATH=%PATH%;C:\MyPrograms\;C:\MyPrograms\7zip

echo Installing...

if NOT EXIST "C:\Temp\directshow.tar.xz"\ (

curl.exe -sL -O --output-dir C:\Temp\ https://github.com/Pipetto-crypto/androBox-extra/raw/master/tweaks/directshow.tar.xz

)

if EXIST "C:\Temp\directshow.tar.xz"\ (

set SHA1SUMOLD=fc70292939716fad106ca26320be96d51d52e693
FOR /F "tokens=*" %%g IN ('sha1sum.exe  "C:\Temp\directshow.tar.xz" ^| awk.exe  "{print $1}"') do (SET SHA1SUMNEW=%%g)


if NOT !SHA1SUMOLD! == !SHA1SUMNEW! (

del /Q /F C:\Temp\directshow.tar.xz
curl.exe -sL -O --output-dir C:\Temp\ https://github.com/Pipetto-crypto/androBox-extra/raw/master/tweaks/directshow.tar.xz

)

)


cd /D C:\Temp\
7z.exe x directshow.tar.xz -so | 7z.exe x -aoa -si -ttar -o"C:\Temp\" >NUL 2>&1
cd directshow
copy /y *.dll C:\windows\syswow64
reg add HKEY_CURRENT_USER\Software\Wine /v DllOverrides /f >NUL 2>&1
for %%p in (*.dll) do (
reg add HKEY_CURRENT_USER\Software\Wine\DllOverrides /v "%%~np" /t REG_SZ /d native,builtin /f >NUL 2>&1
C:\windows\syswow64\regsvr32.exe "%%~np" >NUL 2>&1
)
cd /D C:\Temp
rmdir /s /q directshow

endlocal
