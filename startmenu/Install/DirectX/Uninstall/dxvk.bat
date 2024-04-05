del /Q /F C:\windows\system32\d3d9.dll
del /Q /F C:\windows\system32\d3d11.dll
del /Q /F C:\windows\system32\dxgi.dll
del /Q /F C:\windows\system32\d3d10core.dll
del /Q /F C:\windows\system32\d3d10.dll
del /Q /F C:\windows\system32\d3d10_1.dll

del /Q /F C:\windows\syswow64\d3d9.dll
del /Q /F C:\windows\syswow64\d3d11.dll
del /Q /F C:\windows\syswow64\dxgi.dll
del /Q /F C:\windows\syswow64\d3d10core.dll
del /Q /F C:\windows\syswow64\d3d10.dll
del /Q /F C:\windows\syswow64\d3d10_1.dll

reg delete HKEY_CURRENT_USER\Software\Wine\DllOverrides /v dxgi /f >NUL 2>&1 
reg delete HKEY_CURRENT_USER\Software\Wine\DllOverrides /v d3d9 /f >NUL 2>&1
reg delete HKEY_CURRENT_USER\Software\Wine\DllOverrides /v d3d10core /f >NUL 2>&1 
reg delete HKEY_CURRENT_USER\Software\Wine\DllOverrides /v d3d11 /f >NUL 2>&1
reg delete HKEY_CURRENT_USER\Software\Wine\DllOverrides /v d3d10 /f >NUL 2>&1
reg delete HKEY_CURRENT_USER\Software\Wine\DllOverrides /v d3d10_1 /f >NUL 2>&1

wineboot.exe -u
