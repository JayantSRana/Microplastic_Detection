# ngrok Setup Guide for Windows 11

## Method 1: Install via winget (Recommended)

1. Open PowerShell as Administrator
2. Run:
```powershell
winget install ngrok.ngrok
```
3. Restart your terminal to refresh PATH

## Method 2: Manual Download

1. Go to https://ngrok.com/download
2. Download `ngrok-v3-windows-amd64.zip`
3. Extract to `C:\ngrok\ngrok.exe`
4. Add to PATH:
```powershell
setx PATH "%PATH%;C:\ngrok"
```

## Step 1: Create ngrok Account and Get Authtoken

1. Go to https://ngrok.com and sign up (free tier works fine)
2. After logging in, go to https://dashboard.ngrok.com/get-started/your-authtoken
3. Copy your authtoken (looks like: `2ABCdEFGhIJKlmnoPQRsTUVwxyz1234567890`)

## Step 2: Authenticate ngrok

Open PowerShell and run:
```powershell
ngrok config add-authtoken YOUR_AUTHTOKEN_HERE
```

## Step 3: Verify Installation

```powershell
ngrok version
```
You should see something like: `ngrok version 3.x.x`

## Step 4: Start Your Tunnels

From your project root:
```powershell
ngrok start --all
```

This will show both frontend and backend URLs at http://localhost:4040