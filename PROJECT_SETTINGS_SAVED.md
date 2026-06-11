# Microplastic System - Saved Project Settings

## Current project mode
- Keep the UI ordinary/simple for now.
- Do not upgrade to industrial style unless user explicitly says: "upgrade it".

## Run commands

### Backend
```powershell
cd D:\Project\microplastic-system\trial-2\backend
uvicorn main:app --host 0.0.0.0 --port 8000
```

### Frontend
```powershell
cd D:\Project\microplastic-system\trial-2\frontend
npm run dev -- --host 0.0.0.0
```

### Network/LAN run
Use:
```text
D:\Project\microplastic-system\trial-2\run_network.bat
```
Then open the frontend link shown in the terminal.

## Important camera settings
- Laptop webcam index `0` should not be used.
- USB microscope should use index `1` or higher.
- If microscope is not visible, try index `2`, `3`, etc. in Device Settings.
- Device Settings shows camera signal score to help identify the correct camera.
- Avoid repeatedly refreshing Device Settings while camera is streaming because Windows camera drivers can lock the USB camera.

## Fixed features
- Removed JSON download button from Upload Analysis.
- Kept PDF and CSV downloads only.
- PDF/CSV use backend report endpoints.
- Upload detections are saved to database so reports are not blank.
- Python 3.9 compatibility fixed.
- Dashboard receives live status fallback from `/api/v1/stream/status`.
- Live camera stream uses MJPEG instead of duplicate base64 video through WebSocket.
- Camera status exposes active index, backend, frame status, and last error.

## Model behavior
- YOLOv8 loads from `backend/ml_models/yolov8_microplastic.pt`.
- EfficientNet-B0 loads from `backend/ml_models/efficientnet_b0_polymer.onnx`.
- Upload analysis can use visual fallback if needed.
- Live dashboard should not fabricate fake detections when YOLO is missing.

## User preference
- User wants simple/ordinary project for now.
- User may ask later to upgrade to industrial style.
