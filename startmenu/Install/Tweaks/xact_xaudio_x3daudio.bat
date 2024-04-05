@echo off

setlocal enableextensions
setlocal EnableDelayedExpansion

setlocal

set PATH=%PATH%;C:\MyPrograms\;C:\MyPrograms\7zip

echo Installing...

if NOT EXIST "C:\Temp\xact_xaudio_x3daudio.tar.xz"\ (

curl.exe -sL -O --output-dir C:\Temp\ https://github.com/Pipetto-crypto/androBox-extra/raw/master/tweaks/xact_xaudio_x3daudio.tar.xz

)

if EXIST "C:\Temp\xact_xaudio_x3daudio.tar.xz"\ (

set SHA1SUMOLD=fc94f9b42be6320b6f76e1947aae8bf5a43ac6fb
FOR /F "tokens=*" %%g IN ('sha1sum.exe  "C:\Temp\xact_xaudio_x3daudio.tar.xz" ^| awk.exe  "{print $1}"') do (SET SHA1SUMNEW=%%g)


if NOT !SHA1SUMOLD! == !SHA1SUMNEW! (

del /Q /F C:\Temp\xact_xaudio_x3daudio.tar.xz
curl.exe -sL -O --output-dir C:\Temp\ https://github.com/Pipetto-crypto/androBox-extra/raw/master/tweaks/xact_xaudio_x3daudio.tar.xz

)

)


cd /D C:\Temp\
7z.exe x xact_xaudio_x3daudio.tar.xz -so | 7z.exe x -aoa -si -ttar -o"C:\Temp\" >NUL 2>&1
cd xact_xaudio_x3daudio
copy /y *.dll C:\windows\syswow64
call dll_override.bat >NUL 2>&1
for %%p in (xactengine*) do (
C:\windows\syswow64\regsvr32.exe  "%%~np" >NUL 2>&1
)
for %%p in (xaudio2_*) do (
C:\windows\syswow64\regsvr32.exe  "%%~np" >NUL 2>&1 
)
cd /D C:\Temp\
rmdir /Q /S C:\Temp\xact_xaudio_x3daudio

endlocal
