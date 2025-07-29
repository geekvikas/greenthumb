from fastapi import FastAPI, Depends
from fastapi.middleware.cors import CORSMiddleware
from sqlalchemy.orm import Session
from . import api, models, database

models.Base.metadata.create_all(bind=database.engine)
app = FastAPI()

app.add_middleware(
  CORSMiddleware,
  allow_origins=["*"]
)
def get_db():
  db = database.Session()
  try: yield db
  finally: db.close()

@app.get("/health-check")
def health_check():
    return {"status": "ok"}

@app.get("/api/sales/overview")
def sales_overview(db: Session = Depends(get_db)):
  rev = api.get_monthly_revenue(db)
  cat = api.get_category_breakdown(db)
  return {"revenue": rev, "categories": cat}

@app.get("/api/customers/insights")
def customer_insights(db: Session = Depends(get_db)):
  top = api.get_top_customers(db)
  summ = api.get_customer_summary(db)
  return {"top_customers": top, "summary": summ}