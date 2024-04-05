@echo off

reg delete HKEY_CURRENT_USER\Software\Wine\DllOverrides /v ddraw /f
del /Q /F C:\windows\syswow64\ddraw.dll
wineboot.exe -u
