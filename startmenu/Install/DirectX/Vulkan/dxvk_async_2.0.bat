@echo off

reg add HKEY_CURRENT_USER\Software\Wine /v DllOverrides /f >NULL 2>&1
reg add HKEY_CURRENT_USER\Software\Wine\DllOverrides /v dxgi /t REG_SZ /d native,builtin /f >NULL 2>&1
reg add HKEY_CURRENT_USER\Software\Wine\DllOverrides /v d3d10core /t REG_SZ /d native,builtin /f >NULL 2>&1
reg add HKEY_CURRENT_USER\Software\Wine\DllOverrides /v d3d11 /t REG_SZ /d native,builtin /f >NULL 2>&1
reg add HKEY_CURRENT_USER\Software\Wine\DllOverrides /v d3d9 /t REG_SZ /d native,builtin /f >NULL 2>&1
call "%~dp0.install_dxvk_async.bat" 2.0 
