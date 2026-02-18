from fastapi import FastAPI, HTTPException
from backend.ai_service.models import AIAnalysisRequest, AIAnalysisResponse
import random

app = FastAPI(title="Karyasetu AI Service")

@app.post("/analyze", response_model=AIAnalysisResponse)
async def analyze_image(request: AIAnalysisRequest):
    # In a real implementation, we would call YOLOv8/EfficientNet here
    # and use an LLM for the summary generation.
    # For now, we simulate the CV results.
    
    helmet = random.choice([True, False])
    vest = random.choice([True, False])
    risk = round(random.uniform(0.1, 0.9), 2)
    progress = f"{random.randint(20, 80)}%"
    
    summary = f"Safety Analysis: Helmet {'detected' if helmet else 'MISSING'}, " \
              f"Vest {'detected' if vest else 'MISSING'}. " \
              f"Project progress estimated at {progress}."
    
    return {
        "helmet_detected": helmet,
        "vest_detected": vest,
        "risk_score": risk,
        "progress_estimate": progress,
        "ai_summary": summary,
        "anomalies": ["Unsafe footwear" if risk > 0.7 else "No major anomalies"]
    }
