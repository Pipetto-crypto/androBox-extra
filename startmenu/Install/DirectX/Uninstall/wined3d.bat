@echo off

reg delete HKEY_CURRENT_USER\Software\Wine\DllOverrides /v dxgi /f >NUL 2>&1 
reg delete HKEY_CURRENT_USER\Software\Wine\DllOverrides /v d3d10 /f >NUL 2>&1
reg delete HKEY_CURRENT_USER\Software\Wine\DllOverrides /v d3d11 /f >NUL 2>&1
reg delete HKEY_CURRENT_USER\Software\Wine\DllOverrides /v d3d9 /f >NUL 2>&1
reg delete HKEY_CURRENT_USER\Software\Wine\DllOverrides /v d3d10core /f >NUL 2>&1
reg delete HKEY_CURRENT_USER\Software\Wine\DllOverrides /v d3d10_1 /f >NUL 2>&1
reg delete HKEY_CURRENT_USER\Software\Wine\DllOverrides /v libwine /f >NUL 2>&1
reg delete HKEY_CURRENT_USER\Software\Wine\DllOverrides /v wined3d /f >NUL 2>&1

wineboot.exe -u