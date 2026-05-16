# plan_20_api_integration_code.py
from typing import List

from fastapi import FastAPI
from pydantic import BaseModel

app = FastAPI()


class Agent(BaseModel):
    agent_name: str
    skills: List[str]
    certifications: List[str]
    availability: str


# In-memory example data
db = [
    Agent(
        agent_name="John Doe",
        skills=["Piloting"],
        certifications=["Flight Cert"],
        availability="Active",
    ),
]


@app.get("/agents", response_model=List[Agent])
def get_agents():
    return db


@app.post("/assignments")
def create_assignment(assignment: dict):
    # Add assignment logic here
    return {"status": "Assignment created", "assignment": assignment}


# To run: uvicorn plan_20_api_integration_code:app --reload
