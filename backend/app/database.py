import os
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker, declarative_base

DATABASE_URL = os.getenv("DATABASE_URL", "postgresql://greenthumb:greenthumb@db:5432/greenthumb")
engine = create_engine(DATABASE_URL)
Session = sessionmaker(bind=engine, autoflush=False, autocommit=False)

Base = declarative_base()

