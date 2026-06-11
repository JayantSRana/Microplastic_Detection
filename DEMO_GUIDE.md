# MicroScan AI — Live Demo Access Guide

## What This Project Does

MicroScan AI is a real-time microplastic detection and classification system that uses computer vision (YOLOv8) and deep learning (EfficientNet-B0) to identify and classify microplastic particles from a USB digital microscope in real-time.

## How to Access

1. Click the link provided by your examiner/student
2. The link will look like: `https://xxxx-xxxx-xxxx.ngrok-free.app`
3. Open it in Chrome (90+) or Firefox (88+) — no installation needed
4. The first visit may show an ngrok warning page — click "Visit Site" to continue

## Dashboard Pages

### Dashboard (`/`)
Live overview with real-time particle counts and contamination risk meter.

### Live Detection (`/live`)
Real-time camera stream from the USB microscope with AI-detected bounding boxes overlaid on particles.

### Upload Analysis (`/upload`)
Upload a JPG/PNG image from your computer to analyze microplastics offline without the camera.

### Sample Analysis (`/analysis`)
View composition charts showing polymer type distribution (PE, PP, PET, etc.)

### Reports (`/reports`)
Download analysis results as PDF, CSV, or JSON files.

### Session History (`/history`)
Browse past analysis sessions and their results.

## Important Disclaimer

⚠ **All polymer classifications are AI-estimated visual predictions.**  
Spectroscopic validation (FTIR/Raman) is required for scientific confirmation.  
The system identifies patterns learned from training data, not chemical composition.

## Technical Requirements

- Browser: Chrome 90+ or Firefox 88+ (mobile or desktop)
- Internet connection required
- No special plugins or software installation needed

## Support

**Contact:** [Your Name] — [your.email@university.edu]