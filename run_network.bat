@echo off
setlocal enabledelayedexpansion
cd /d "%~dp0"

for /f "tokens=2 delims=:" %%A in ('ipconfig ^| findstr /R /C:"IPv4 Address" /C:"IPv4"') do (
  set IP=%%A
  set IP=!IP: =!
  goto :found_ip
)
:found_ip
if "%IP%"=="" set IP=localhost

echo Starting Microplastic Detection System on your network...
echo Backend:  http://%IP%:8000
echo Frontend: http://%IP%:5173
echo Share this frontend link with devices on the same Wi-Fi/LAN.
echo.

start "Microplastic Backend" cmd /k "pushd %~dp0backend && python -m uvicorn main:app --host 0.0.0.0 --port 8000"
start "Microplastic Frontend" cmd /k "pushd %~dp0frontend && npm run dev -- --host 0.0.0.0"

echo Started. If another device cannot open the link, allow Python/Node through Windows Firewall.
pause
