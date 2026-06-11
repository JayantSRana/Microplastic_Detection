@echo off
setlocal
cd /d "%~dp0"

for /f "tokens=2 delims=:" %%A in ('ipconfig ^| findstr /c:"IPv4 Address"') do (
  set "LAN_IP=%%A"
  goto :got_ip
)
:got_ip
set "LAN_IP=%LAN_IP: =%"

echo.
echo ========================================
echo Microplastic System LAN Launcher
echo ========================================
echo Phone URL: http://%LAN_IP%:5173
echo Backend:   http://%LAN_IP%:8000
echo.
echo Make sure your phone is on the same Wi-Fi and open the Phone URL above.
echo If Windows Firewall asks, click Allow access for Private networks.
echo ========================================
echo.

start "Microplastic Backend LAN" cmd /k "cd /d %~dp0backend && python -m uvicorn main:app --reload --host 0.0.0.0 --port 8000"
start "Microplastic Frontend LAN" cmd /k "cd /d %~dp0frontend && npm run dev -- --host 0.0.0.0 --port 5173"

echo Started backend and frontend windows.
echo Open on phone: http://%LAN_IP%:5173
pause
