@echo off

setlocal enableextensions
setlocal EnableDelayedExpansion

setlocal


set PATH=%PATH%;C:\MyPrograms\;C:\MyPrograms\7zip

echo Installing...

FOR %%f in (arial32, arialb32, andale32, comic32, courie32, georgi32, impact32, times32, trebuc32, verdan32, webdin32) do (

if NOT EXIST "C:\Temp\%%f.exe"\ (
curl.exe -sL -O --output-dir C:\Temp\ https://github.com/pushcx/corefonts/raw/master/%%f.exe
)

cd /D C:\Temp\
mkdir C:\Temp\%%f
7z.exe x %%f.exe -o"C:\Temp\%%f" >NUL 2>&1
cd %%f
copy /y *.TTF C:\windows\fonts
cd /D C:\Temp\
rmdir /Q /S C:\Temp\%%f
)

call :register_font arialbd.ttf , "Arial Bold (TrueType)" 
call :register_font arialbi.ttf , "Arial Bold Italic (TrueType)" 
call :register_font ariali.ttf , "Arial Italic (TrueType)" 
call :register_font arial.ttf , "Arial (TrueType)" 
call :register_font ariblk.ttf , "Arial Black (TrueType)"
call :register_font andalemo.ttf , "Andale Mono" 
call :register_font comic.ttf , "Comic Sans MS" 
call :register_font comicbd.ttf , "Comic Sans MS Bold" 
call :register_font courbd.ttf "Courier New Bold" 
call :register_font courbi.ttf "Courier New Bold Italic"
call :register_font couri.ttf "Courier New Italic"
call :register_font cour.ttf "Courier New"
call :register_font georgiab.ttf "Georgia Bold"
call :register_font georgiai.ttf "Georgia Italic"
call :register_font georgia.ttf "Georgia"
call :register_font georgiaz.ttf "Georgia Bold"
call :register_font impact.ttf "Impact"
call :register_font timesbd.ttf "Times New Roman Bold"
call :register_font timesbi.ttf "Times New Roman Bold Italic"
call :register_font timesi.ttf "Times New Roman Italic"
call :register_font times.ttf "Times New Roman"
call :register_font trebucbd.ttf "Trebuchet MS Bold"
call :register_font trebucbi.ttf "Trebuchet MS Bold Italic"
call :register_font trebucit.ttf "Trebuchet MS Italic"
call :register_font trebuc.ttf "Trebuchet MS"
call :register_font verdanab.ttf "Verdana Bold"
call :register_font verdanai.ttf "Verdana Italic"
call :register_font verdana.ttf "Verdana"
call :register_font verdanaz.ttf "Verdana Bold Italic"
call :register_font webdings.ttf "Webdings"


exit /B 0

:register_font
reg add "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion" /v Fonts /f >NUL 2>&1
reg add "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\Fonts" /v "%~2" /t REG_SZ /d "C:\windows\fonts\%~1" /f >NUL 2>&1

endlocal
