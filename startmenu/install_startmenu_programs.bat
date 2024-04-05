@echo off

rmdir /s /q C:\Temp
rmdir /s /q C:\MyPrograms
mkdir C:\Temp
mkdir C:\MyPrograms
xcopy /Q /Y "%~dp0MyPrograms" C:\MyPrograms /E
rmdir /s /q "C:\ProgramData\Microsoft\Windows\Start Menu\Apps"
mkdir "C:\ProgramData\Microsoft\Windows\Start Menu\Apps"
rmdir /s /q "C:\ProgramData\Microsoft\Windows\Start Menu\Install"
mkdir "C:\ProgramData\Microsoft\Windows\Start Menu\Install"
rmdir /s /q "C:\ProgramData\Microsoft\Windows\Start Menu\Registry"
mkdir "C:\ProgramData\Microsoft\Windows\Start Menu\Registry"
xcopy /Q /Y "%~dp0Registry" "C:\ProgramData\Microsoft\Windows\Start Menu\Registry" /E
xcopy /Q /Y "%~dp0Apps" "C:\ProgramData\Microsoft\Windows\Start Menu\Apps" /E
xcopy /Q /Y "%~dp0Install" "C:\ProgramData\Microsoft\Windows\Start Menu\Install" /E

