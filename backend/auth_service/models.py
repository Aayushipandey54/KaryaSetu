from pydantic import BaseModel, EmailStr, Field
from typing import Optional
from enum import Enum

class UserRole(str, Enum):
    WORKER = "Worker"
    SITE_ENGINEER = "Site Engineer"
    ARCHITECT = "Architect"
    PROJECT_HEAD = "Project Head"
    ADMIN = "Admin"

class UserBase(BaseModel):
    email: EmailStr
    full_name: str
    role: UserRole
    site_id: Optional[str] = None

class UserCreate(UserBase):
    password: str

class UserInDB(UserBase):
    hashed_password: str
    id: str = Field(alias="_id")

class UserResponse(UserBase):
    id: str

class Token(BaseModel):
    access_token: str
    token_type: str

class TokenData(BaseModel):
    email: Optional[str] = None
    role: Optional[str] = None
