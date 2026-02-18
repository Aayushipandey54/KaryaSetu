# Karyasetu – AI-Powered Construction Safety & Progress Monitoring System

Karyasetu is a production-ready full-stack application for managing construction sites with AI-driven safety compliance and GPS-based attendance.

## Architecture

- **Frontend**: Flutter (Industrial UI, Hive Offline Storage)
- **Backend**: FastAPI Microservices (Auth, Attendance, AI, Dashboard)
- **Database**: MongoDB
- **Orchestration**: Docker Compose + NGINX Gateway
- **AI**: YOLOv8 (Detection) + LLM (Summaries)

## Architecture Diagram

<p align="center">
  <img src="Karysetu%20architecture/architecture.png" alt="Karyasetu Architecture" width="800"/>
</p>

## Getting Started

### Prerequisites
- Docker & Docker Compose
- Flutter SDK

### Run Backend
```bash
docker-compose up --build
```

### Run Frontend
```bash
cd frontend
flutter pub get
flutter run
```

## Features
- ✅ Role-Based JWT Auth
- ✅ GPS Attendance with Geofencing
- ✅ AI Safety Monitoring (Helmet/Vest Detection)
- ✅ Industrial Analytics Dashboard
- ✅ Offline-First Architecture
```
