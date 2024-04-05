@echo off

echo Removing...
del /Q /F C:\windows\syswow64\d3d8.dll
reg delete HKEY_CURRENT_USER\Software\Wine\DllOverrides /v d3d8 /f
wineboot.exe -u
