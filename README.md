# GreenThumb Analytics Dashboard

A full-stack web application for tracking sales and customer insights in an agricultural business.

## Project Structure:
- /backend: FastAPI server
- /frontend: React + Material UI frontend

## Getting Started:

1. Backend (FastAPI)
Requirements:
- Python 3.10+
- pip or poetry
- Uvicorn, FastAPI, SQLAlchemy, Pydantic

Run the server:
```shell
cd backend
uvicorn app.main:app --reload
```

API available at: http://localhost:8000

2. Frontend (React)
Requirements:
- Node.js 18+
- Yarn

Run the frontend:
```shell
cd frontend
yarn install
yarn start --host
```
UI runs at: http://localhost:3000

### Docker Compose:
Preferred method is to boot up entire stack using docker compose

This will bring up the postgres, seed the database and connect the frontend (http://localhost/) to backend (http://localhost/api)

```shell
docker compose up -d --build
```


Endpoints Overview:
- /sales/overview: Returns monthly revenue and category breakdown
- /customers/insights: Returns top customers and summary statistics

Dev Tips:
- Use .env files for secrets/config
- Configure CORS in FastAPI if accessing from frontend
- For production: use nginx or gunicorn + build React frontend with yarn build