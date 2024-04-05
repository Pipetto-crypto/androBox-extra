@echo off

setlocal enableextensions
setlocal EnableDelayedExpansion

setlocal

set PATH=%PATH%;C:\MyPrograms\7zip;C:\MyPrograms\

echo Installing...

if NOT EXIST "C:\Temp\cnc-ddraw.zip"\ (

curl.exe -sL -O --output-dir C:\Temp\ https://github.com/FunkyFr3sh/cnc-ddraw/releases/download/v6.0.0.0/cnc-ddraw.zip

)

7z.exe x C:\Temp\cnc-ddraw.zip -o"C:\windows\syswow64" -y >NUL 2>&1

reg add HKEY_CURRENT_USER\Software\Wine /v DllOverrides /f >NUL 2>&1
reg add HKEY_CURRENT_USER\Software\Wine\DllOverrides /v ddraw /t REG_SZ /d native,builtin /f >NUL 2>&1

endlocal
