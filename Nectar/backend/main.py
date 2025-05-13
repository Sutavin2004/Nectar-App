from fastapi import FastAPI
from typing import List
from pydantic import BaseModel

app = FastAPI()

class Job(BaseModel):
    id: int
    title: str
    company: str
    location: str
    salary: str
    responsibilities: str
    education: str

jobs = []

@app.get("/jobs", response_model=List[Job])
def get_jobs():
    return jobs

@app.post("/jobs", response_model=Job)
def post_job(job: Job):
    jobs.append(job)
    return job
