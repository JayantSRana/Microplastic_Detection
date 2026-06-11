# MicroScan AI - Microplastic Intelligence Platform

An industrial-style microplastic inspection system for microscope/camera-based water sample analysis. The platform combines a FastAPI backend, YOLOv8 particle detection, React dashboards, polymer composition analytics, and export-ready reports.

## What is included

- **Frontend:** React + Vite + Tailwind dashboard
- **Backend:** FastAPI API server with camera, upload, detection, reports, and session routes
- **Model artifact:** imported YOLOv8 weights at `backend/ml_models/yolov8_microplastic.pt`
- **Training assets:** original training outputs preserved in `ml-artifacts/`
- **Exports:** report generation to CSV, JSON, and PDF

## Quick start

### 1. Backend

```bash
cd backend
pip install -r requirements.txt
uvicorn main:app --reload --port 8000
```

API docs: <http://localhost:8000/docs>

### 2. Frontend

```bash
cd frontend
npm install
npm run dev
```

Dashboard: <http://localhost:5173>

## Production-style run

```bash
cd frontend
npm run build
cd ../backend
uvicorn main:app --host 0.0.0.0 --port 8000
```

## Project layout

```text
backend/          FastAPI application and detection services
frontend/         React dashboard
ml-artifacts/     Imported model, OpenVINO export, and training visualizations
backend/ml_models Runtime YOLO model location
```

## Notes

- If the trained YOLO model cannot be loaded, the backend falls back to deterministic visual detection so the UI remains demo-ready.
- Polymer typing is AI-estimated from visual/classifier signals and should not be treated as spectroscopic confirmation.
