@echo off

setlocal enableextensions
setlocal EnableDelayedExpansion

echo Installing...

setlocal

set PATH=%PATH%;C:\MyPrograms\;C:\MyPrograms\7zip

if NOT EXIST "C:\Temp\dxwrapper.zip"\ (

curl.exe -sL -O --output-dir C:\Temp\ https://github.com/elishacloud/dxwrapper/releases/download/v1.0.6542.21/dxwrapper.zip

)



cd /D C:\Temp\
mkdir C:\Temp\dxwrapper
7z.exe x "C:\Temp\dxwrapper.zip" -o"C:\Temp\dxwrapper"
FOR /F "tokens=*" %%g IN ('awk.exe "/Dd7to9/{print NR}" C:\Temp\dxwrapper\dxwrapper.ini ^| head.exe -n 1') do (SET linenumber=%%g)
sed.exe -i "%linenumber%s/=.*/=1/g" C:\Temp\dxwrapper\dxwrapper.ini
copy /Y C:\Temp\dxwrapper\Stub\ddraw.dll C:\windows\syswow64
copy /Y C:\Temp\dxwrapper\dxwrapper.dll C:\windows\syswow64
copy /Y C:\Temp\dxwrapper\dxwrapper.ini C:\windows\syswow64
reg add HKEY_CURRENT_USER\Software\Wine /v DllOverrides /f >NUL 2>&1
reg add HKEY_CURRENT_USER\Software\Wine\DllOverrides /v ddraw /t REG_SZ /d native,builtin /f >NUL 2>&1
rmdir /Q /S "C:\Temp\dxwrapper"
