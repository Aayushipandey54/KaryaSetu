from fastapi import FastAPI
from backend.dashboard_service.models import DashboardData, SiteStats
from backend.common.database import get_database

app = FastAPI(title="Karyasetu Dashboard Service")
db = get_database()

@app.get("/stats", response_model=DashboardData)
async def get_dashboard_stats():
    # In a real app, this would query multiple collections and aggregate data
    # Here we return mocked aggregated data for the dashboard UI
    mock_sites = [
        SiteStats(
            total_workers=50,
            present_workers=42,
            absent_workers=8,
            safety_score=85.5,
            progress_percentage=45.0,
            risk_alerts=2
        ),
        SiteStats(
            total_workers=30,
            present_workers=28,
            absent_workers=2,
            safety_score=92.0,
            progress_percentage=12.5,
            risk_alerts=0
        )
    ]
    
    return {
        "sites": mock_sites,
        "global_safety_score": 88.75,
        "active_projects": 2
    }
