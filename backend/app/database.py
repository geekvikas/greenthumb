from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker, declarative_base


engine = create_engine("postgresql://greenthumb:greenthumb@db/greenthumb")
Session = sessionmaker(bind=engine, autoflush=False, autocommit=False)

Base = declarative_base()

