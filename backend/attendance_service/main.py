from fastapi import FastAPI, HTTPException, Depends
from backend.attendance_service.models import AttendanceCreate, SiteGeofence
from backend.common.database import get_database
import math
import asyncio

app = FastAPI(title="Karyasetu Attendance Service")
db = get_database()
attendance_collection = db.attendance
sites_collection = db.sites

# Seed initial mock site for demo purposes
async def seed_mock_site():
    site_exists = await sites_collection.find_one({"site_id": "SITE001"})
    if not site_exists:
        await sites_collection.insert_one({
            "site_id": "SITE001",
            "name": "Karyasetu Demo Site",
            "center_lat": 28.6139, # Example: New Delhi
            "center_lon": 77.2090,
            "radius_meters": 1000.0,
            "_id": "mock-site-id"
        })

@app.on_event("startup")
async def startup_event():
    await seed_mock_site()

def haversine(lat1, lon1, lat2, lon2):
    R = 6371000  # Earth radius in meters
    phi1, phi2 = math.radians(lat1), math.radians(lat2)
    dphi = math.radians(lat2 - lat1)
    dlambda = math.radians(lon2 - lon1)
    a = math.sin(dphi / 2)**2 + math.cos(phi1) * math.cos(phi2) * math.sin(dlambda / 2)**2
    return 2 * R * math.atan2(math.sqrt(a), math.sqrt(1 - a))

@app.post("/log")
async def log_attendance(attendance: AttendanceCreate):
    site = await sites_collection.find_one({"site_id": attendance.site_id})
    if not site:
        # Fallback to demo site if specific site not found
        site = await sites_collection.find_one({"site_id": "SITE001"})
        if not site:
            raise HTTPException(status_code=404, detail="Site not found")
    
    distance = haversine(
        attendance.latitude, attendance.longitude,
        site["center_lat"], site["center_lon"]
    )
    
    # Relax geofence for demo if needed, or just keep it 
    if distance > site["radius_meters"]:
        # For demo purposes, we might just log it anyway with a warning or strictly enforce
        # Let's keep it strict but allow the demo site to be large (1000m)
        raise HTTPException(status_code=403, detail=f"Outside site radius ({int(distance)}m > {site['radius_meters']}m)")
    
    attendance_dict = attendance.dict()
    await attendance_collection.insert_one(attendance_dict)
    return {"status": "success", "distance": distance}

@app.get("/history/{user_id}")
async def get_history(user_id: str):
    cursor = attendance_collection.find({"user_id": user_id})
    history = await cursor.to_list(length=100)
    for h in history:
        h["id"] = str(h.pop("_id"))
    return history
