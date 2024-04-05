@echo off

setlocal enableextensions
setlocal EnableDelayedExpansion

setlocal

set PATH=%PATH%;C:\MyPrograms\

echo Installing...

if NOT EXIST "C:\Temp\K-Lite_Codec_Pack_1780_Basic.exe"\ (

curl.exe -sL -O --output-dir C:\Temp\ https://files3.codecguide.com/K-Lite_Codec_Pack_1780_Basic.exe

)

start /W C:\Temp\K-Lite_Codec_Pack_1780_Basic.exe

endlocal
