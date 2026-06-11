# MicroScan AI - One-Command Startup Script
# This script starts the backend, frontend, and ngrok tunnels

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  MicroScan AI - Starting All Services" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan

# Get the script's directory (project root)
$ProjectRoot = Split-Path -Parent $MyInvocation.MyCommand.Path

# Start Backend (uvicorn)
Write-Host "[1/3] Starting Backend (FastAPI on :8000)..." -ForegroundColor Yellow
Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd '$ProjectRoot\backend'; uvicorn main:app --host 0.0.0.0 --port 8000" -WindowStyle Normal

# Wait for backend to initialize
Start-Sleep -Seconds 3

# Start Frontend (Vite)
Write-Host "[2/3] Starting Frontend (React on :5173)..." -ForegroundColor Yellow
Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd '$ProjectRoot\frontend'; npm run dev -- --host" -WindowStyle Normal

# Wait for frontend to initialize
Start-Sleep -Seconds 5

# Start ngrok for both services
Write-Host "[3/3] Starting ngrok tunnels..." -ForegroundColor Yellow
Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd '$ProjectRoot'; ngrok start --all -config=ngrok.yml" -WindowStyle Normal

# Wait for ngrok to initialize
Start-Sleep -Seconds 5

Write-Host "" -ForegroundColor White
Write-Host "========================================" -ForegroundColor Green
Write-Host "  Services Starting..." -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host "" -ForegroundColor White
Write-Host "Backend API:    http://localhost:8000" -ForegroundColor Gray
Write-Host "Frontend UI:    http://localhost:5173" -ForegroundColor Gray
Write-Host "ngrok Dashboard: http://localhost:4040" -ForegroundColor Gray
Write-Host "" -ForegroundColor White
Write-Host "Opening ngrok dashboard in browser..." -ForegroundColor Yellow

# Open ngrok dashboard
Start-Process "http://localhost:4040"

Write-Host "" -ForegroundColor White
Write-Host "========================================" -ForegroundColor Magenta
Write-Host "  INSTRUCTIONS:" -ForegroundColor Magenta
Write-Host "========================================" -ForegroundColor Magenta
Write-Host "" -ForegroundColor White
Write-Host "1. Go to http://localhost:4040 in your browser" -ForegroundColor Yellow
Write-Host "2. Look for TWO tunnels listed:" -ForegroundColor Yellow
Write-Host "   - 'backend' tunnel → HTTPS URL (e.g., https://xyz123.ngrok-free.app)" -ForegroundColor Green
Write-Host "   - 'frontend' tunnel → HTTPS URL (e.g., https://abc456.ngrok-free.app)" -ForegroundColor Green
Write-Host "3. Use the FRONTEND URL to share with your examiner" -ForegroundColor Yellow
Write-Host "4. The frontend will automatically connect to the backend via the same ngrok URL" -ForegroundColor Yellow
Write-Host "" -ForegroundColor White