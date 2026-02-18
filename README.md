##🚧 Karyasetu – AI-Powered Construction Safety & Progress Monitoring System
<p align="center"> <img src="Karyasetu%20Architecture.png" alt="Karyasetu Architecture" width="950"/> </p> <p align="center"> <b>Industrial-Grade AI + GPS Monitoring for Smart Construction Sites</b> </p>
🌟 Overview

Karyasetu is a production-ready full-stack construction monitoring platform that integrates:

🧠 AI-powered safety detection

📍 GPS-based attendance with geofencing

📊 Real-time analytics dashboard

📱 Offline-first mobile experience

Designed to improve worker safety, compliance tracking, and site productivity.

🏗️ System Architecture

Karyasetu follows a scalable microservices architecture:

Flutter App  →  NGINX Gateway  →  FastAPI Microservices  →  MongoDB
                              ↘
                               AI Engine (YOLOv8 + LLM)

🔹 Core Components
Layer	Technology	Purpose
🎨 Frontend	Flutter	Industrial UI + Offline Support
⚙️ Backend	FastAPI	Auth, Attendance, AI, Dashboard Services
🗄 Database	MongoDB	Scalable NoSQL Storage
🧠 AI Engine	YOLOv8 + LLM	Safety Detection + Smart Summaries
🌐 Gateway	NGINX	Reverse Proxy & Routing
🐳 Orchestration	Docker Compose	Containerized Deployment
✨ Key Features
🔐 Role-Based Authentication

JWT-based secure login

Admin / Supervisor / Worker roles

Permission-controlled APIs

📍 GPS Attendance with Geofencing

Real-time location validation

Site-based check-in

Fraud prevention

🦺 AI Safety Monitoring

Helmet Detection

Safety Vest Detection

Real-time Violation Alerts

LLM-generated Safety Reports

📊 Industrial Analytics Dashboard

Attendance trends

Safety compliance metrics

Violation heatmaps

Productivity insights

📶 Offline-First Architecture

Hive local storage

Sync when online

Field-ready reliability

🚀 Getting Started
🔧 Prerequisites

Docker & Docker Compose

Flutter SDK

Git

🖥 Backend Setup
docker-compose up --build


Backend Services:

Auth Service

Attendance Service

AI Service

Dashboard Service

MongoDB

📱 Frontend Setup
cd frontend
flutter pub get
flutter run

🧠 AI Module
Model	Purpose
YOLOv8	PPE Detection (Helmet & Vest)
LLM	AI-generated safety summaries

Supports real-time detection pipelines and violation logging.

📊 Project Structure
Karyasetu/
│
├── frontend/              # Flutter Mobile Application
├── backend/               # FastAPI Microservices
├── docker-compose.yml     # Orchestration
├── nginx/                 # API Gateway Config
├── Karyasetu Architecture.png
└── README.md

🔒 Security Highlights

JWT Token Validation

Role-Based Access Control

Microservice Isolation

Containerized Deployment

Secure Reverse Proxy Routing

📈 Scalability Design

Stateless microservices

Containerized services

Horizontally scalable backend

AI service isolated for performance

Modular architecture

🏢 Use Cases

Large Construction Projects

Infrastructure Development Sites

Industrial Manufacturing Plants

Government Infrastructure Monitoring

💡 Future Enhancements

Drone-based monitoring

Real-time live stream safety detection

Predictive risk analytics

Multi-site enterprise dashboard

Blockchain-based compliance logs

🤝 Contributing

Pull requests are welcome.

For major changes:

Fork the repository

Create your feature branch

Commit your changes

Push to the branch

Open a Pull Request

📜 License

This project is licensed under the MIT License.

🏆 Why Karyasetu?

✔ AI + GPS Integrated Platform
✔ Production-Ready Architecture
✔ Enterprise-Scalable
✔ Offline-Capable
✔ Safety-First Approach

If you'd like, I can also give you:

🔥 A badge-rich version (with shields.io)

🎯 A startup pitch style README

🏆 A hackathon winning format

📊 A version optimized for recruiters**

🌍 A portfolio-ready version with impact metrics**

Just tell me your goal (job, startup, hackathon, college project, etc.).

1st

Perfect 🔥 You want the badge-rich version (shields.io style) to make your repo look top-tier tech.

Here’s your premium, recruiter-ready, GitHub-optimized README with badges.

You can directly replace your current README with this 👇

🚧 Karyasetu – AI-Powered Construction Safety & Progress Monitoring System
<p align="center"> <img src="Karyasetu%20Architecture.png" alt="Karyasetu Architecture" width="950"/> </p> <p align="center"> <b>Industrial-Grade AI + GPS Monitoring for Smart Construction Sites</b> </p> <p align="center"> <img src="https://img.shields.io/badge/Flutter-3.x-blue?logo=flutter"/> <img src="https://img.shields.io/badge/FastAPI-Backend-green?logo=fastapi"/> <img src="https://img.shields.io/badge/MongoDB-Database-darkgreen?logo=mongodb"/> <img src="https://img.shields.io/badge/Docker-Containerized-blue?logo=docker"/> <img src="https://img.shields.io/badge/YOLOv8-AI-red"/> <img src="https://img.shields.io/badge/LLM-Integrated-purple"/> <img src="https://img.shields.io/badge/Architecture-Microservices-orange"/> <img src="https://img.shields.io/badge/Status-Production--Ready-brightgreen"/> </p>
🌟 Overview

Karyasetu is a full-stack construction site monitoring platform combining:

🧠 AI-powered PPE detection

📍 GPS-based geofenced attendance

📊 Real-time industrial analytics

📱 Offline-first mobile experience

Built for improving safety compliance, workforce tracking, and site productivity.

🏗️ Architecture

Karyasetu follows a scalable microservices architecture:

Flutter App
     ↓
NGINX Gateway
     ↓
FastAPI Microservices
     ↓
MongoDB
     ↘
     AI Engine (YOLOv8 + LLM)

🔹 Tech Stack
Layer	Technology	Responsibility
🎨 Frontend	Flutter + Hive	Mobile UI + Offline Storage
⚙ Backend	FastAPI	Auth, Attendance, AI, Dashboard
🗄 Database	MongoDB	NoSQL Data Storage
🌐 Gateway	NGINX	Reverse Proxy
🐳 DevOps	Docker Compose	Service Orchestration
🧠 AI	YOLOv8 + LLM	PPE Detection + Safety Reports
✨ Core Features
🔐 Role-Based JWT Authentication

Secure login

Admin / Supervisor / Worker roles

Permission-protected APIs

📍 GPS Attendance with Geofencing

Real-time location validation

Fraud prevention

Site-bound check-in

🦺 AI Safety Monitoring

Helmet Detection

Safety Vest Detection

Violation logging

AI-generated safety summaries

📊 Industrial Dashboard

Attendance analytics

Safety compliance metrics

Trend visualization

Productivity tracking

📶 Offline-First Architecture

Hive local storage

Background data sync

Field-ready reliability

🚀 Getting Started
🔧 Prerequisites

Docker & Docker Compose

Flutter SDK

Git

🖥 Backend Setup
docker-compose up --build


Services launched:

Auth Service

Attendance Service

AI Service

Dashboard Service

MongoDB

NGINX Gateway

📱 Frontend Setup
cd frontend
flutter pub get
flutter run

📂 Project Structure
Karyasetu/
│
├── frontend/              
├── backend/               
├── nginx/                 
├── docker-compose.yml     
├── Karyasetu Architecture.png
└── README.md

🔒 Security & Scalability

✔ JWT-based authentication
✔ Role-based access control
✔ Containerized microservices
✔ Isolated AI engine
✔ Horizontal scalability ready

🏢 Target Use Cases

Large Construction Projects

Infrastructure Development

Industrial Manufacturing Sites

Government Monitoring Projects

💡 Future Enhancements

Drone surveillance integration

Live stream AI monitoring

Predictive risk analytics

Multi-site enterprise dashboard

Blockchain-based compliance logging

📜 License

MIT License

🏆 Why Karyasetu?

✔ AI + GPS Unified Platform
✔ Production-Grade Architecture
✔ Enterprise-Scalable
✔ Offline-First
✔ Safety-Centric Design
