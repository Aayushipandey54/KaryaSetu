from pydantic import BaseModel
from typing import Optional

class AIAnalysisRequest(BaseModel):
    image_url: str
    site_id: str

class AIAnalysisResponse(BaseModel):
    helmet_detected: bool
    vest_detected: bool
    risk_score: float
    progress_estimate: str
    ai_summary: str
    anomalies: Optional[list[str]] = []
