@echo off
setlocal
cd /d "%~dp0"

echo ========================================
echo Starting ngrok tunnels for Microplastic System
echo ========================================
echo.
echo Prerequisites:
echo 1. Add your authtoken to ngrok.yml (get from https://dashboard.ngrok.com/get-started/your-authtoken)
echo 2. Make sure backend (port 8000) and frontend (port 5173) are running locally
echo.
echo Starting tunnels...
echo.

ngrok start --all --config ngrok.yml

pause