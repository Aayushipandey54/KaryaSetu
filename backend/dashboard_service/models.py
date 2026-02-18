from pydantic import BaseModel
from typing import List

class SiteStats(BaseModel):
    total_workers: int
    present_workers: int
    absent_workers: int
    safety_score: float
    progress_percentage: float
    risk_alerts: int

class DashboardData(BaseModel):
    sites: List[SiteStats]
    global_safety_score: float
    active_projects: int
