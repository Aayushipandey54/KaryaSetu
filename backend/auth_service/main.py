from fastapi import FastAPI, Depends, HTTPException, status
from fastapi.security import OAuth2PasswordBearer, OAuth2PasswordRequestForm
from datetime import timedelta
from backend.auth_service.models import UserCreate, UserResponse, Token, UserInDB
from backend.common.database import get_database
from backend.common.security import get_password_hash, verify_password, create_access_token
import uuid
import asyncio

app = FastAPI(title="Karyasetu Auth Service")

db = get_database()
users_collection = db.users

# Seed initial mock users for demo purposes
async def seed_mock_users():
    admin_exists = await users_collection.find_one({"email": "admin@karyasetu.com"})
    if not admin_exists:
        await users_collection.insert_one({
            "email": "admin@karyasetu.com",
            "full_name": "Admin User",
            "hashed_password": get_password_hash("admin123"),
            "role": "admin",
            "_id": "mock-admin-id"
        })
    
    worker_exists = await users_collection.find_one({"email": "worker@karyasetu.com"})
    if not worker_exists:
        await users_collection.insert_one({
            "email": "worker@karyasetu.com",
            "full_name": "Site Worker",
            "hashed_password": get_password_hash("worker123"),
            "role": "worker",
            "_id": "mock-worker-id"
        })

@app.on_event("startup")
async def startup_event():
    await seed_mock_users()

@app.post("/register", response_model=UserResponse)
async def register(user: UserCreate):
    existing_user = await users_collection.find_one({"email": user.email})
    if existing_user:
        raise HTTPException(status_code=400, detail="Email already registered")
    
    user_dict = user.dict()
    hashed_password = get_password_hash(user_dict.pop("password"))
    user_dict["hashed_password"] = hashed_password
    user_dict["_id"] = str(uuid.uuid4())
    
    await users_collection.insert_one(user_dict)
    user_dict["id"] = user_dict.pop("_id")
    return user_dict

@app.post("/token", response_model=Token)
async def login(form_data: OAuth2PasswordRequestForm = Depends()):
    user = await users_collection.find_one({"email": form_data.username})
    if not user or not verify_password(form_data.password, user["hashed_password"]):
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail="Incorrect email or password",
            headers={"WWW-Authenticate": "Bearer"},
        )
    
    access_token = create_access_token(
        data={"sub": user["email"], "role": user["role"]}
    )
    return {"access_token": access_token, "token_type": "bearer"}
