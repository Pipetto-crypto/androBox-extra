@echo off

reg add HKEY_CURRENT_USER\Software\Wine\Direct3D /v VideoMemorySize /t REG_SZ /d 2048 /f
