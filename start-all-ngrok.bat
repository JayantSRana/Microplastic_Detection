@echo off
setlocal
cd /d "%~dp0"

echo ========================================
echo Microplastic System - Full Start with ngrok
echo ========================================
echo.

REM Check if authtoken is configured
findstr /C:"YOUR_AUTHTOKEN_HERE" ngrok.yml >nul 2>&1
if %errorlevel% equ 0 (
    echo ERROR: ngrok.yml still contains placeholder authtoken!
    echo Edit ngrok.yml and replace YOUR_AUTHTOKEN_HERE with your actual token
    echo Get token at: https://dashboard.ngrok.com/get-started/your-authtoken
    pause
    exit /b 1
)

echo [1/3] Starting Backend (port 8000)...
start "Microplastic Backend" cmd /k "cd /d %~dp0backend && python -m uvicorn main:app --reload --host 0.0.0.0 --port 8000"

echo [2/3] Starting Frontend (port 5173)...
start "Microplastic Frontend" cmd /k "cd /d %~dp0frontend && npm run dev -- --host 0.0.0.0 --port 5173"

echo [3/3] Waiting 5 seconds for servers to start...
timeout /t 5 /nobreak >nul

echo.
echo Starting ngrok tunnels...
echo Frontend will be at: https://<random>.ngrok-free.app
echo Backend will be at:  https://<random>.ngrok-free.app
echo.
echo IMPORTANT: After ngrok starts, copy the backend URL and set in frontend .env:
echo   VITE_API_BASE_URL=https://<your-backend-ngrok-url>/api/v1
echo   VITE_BACKEND_PORT=443
echo.
echo Then restart frontend: npm run dev -- --host 0.0.0.0 --port 5173
echo.

ngrok start --all --config ngrok.yml

pause