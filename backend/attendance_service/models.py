from pydantic import BaseModel
from datetime import datetime
from typing import Optional

class AttendanceType(str):
    DAILY = "Daily Worker"
    CONTRACT = "Contract Worker"

class AttendanceCreate(BaseModel):
    user_id: str
    role: str
    site_id: str
    latitude: float
    longitude: float
    timestamp: datetime = datetime.utcnow()
    image_url: str
    attendance_type: str

class SiteGeofence(BaseModel):
    site_id: str
    center_lat: float
    center_lon: float
    radius_meters: float
