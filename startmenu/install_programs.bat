@echo off

rmdir /s /q C:\Temp
rmdir /s /q C:\MyPrograms
mkdir C:\Temp
mkdir C:\MyPrograms
xcopy /Q /Y "%~dp0MyPrograms" C:\MyPrograms /E