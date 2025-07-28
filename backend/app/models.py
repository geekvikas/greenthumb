from sqlalchemy import Column, Integer, String, Numeric, Boolean, ForeignKey, Date
from sqlalchemy.orm import relationship
from .database import Base

class Supplier(Base):
  __tablename__ = "suppliers"

  id = Column(Integer, primary_key=True, index=True)
  name = Column(String(100), nullable=False)
  location = Column(String(100))
  rating = Column(Numeric(3,2))

  products = relationship("Product", back_populates="suppliers")

class Product(Base):
  __tablename__ = "products"

  id = Column(Integer, primary_key=True, index=True)
  name = Column(String(100), nullable=False)
  category = Column(String(50), nullable=False)
  price = Column(Numeric(10,2), nullable=False)
  seasonal = Column(Boolean, default=False)
  supplier_id = Column(Integer, ForeignKey("suppliers.id"), nullable=True)

  suppliers = relationship("Supplier", back_populates="products")
  order_items = relationship("OrderItem", back_populates="product")

class Customer(Base):
  __tablename__ = "customers"

  id = Column(Integer, primary_key=True, index=True)
  name = Column(String(100), nullable=False)
  email = Column(String(100), unique=True, nullable=False)
  registration_date = Column(Date, nullable=False)
  customer_tier = Column(String(20), default="bronze")
  city = Column(String(50))
  state = Column(String(2))

  orders = relationship("Order", back_populates="customer")

class Order(Base):
  __tablename__ = "orders"

  id = Column(Integer, primary_key=True, index=True)
  customer_id = Column(Integer, ForeignKey("customers.id"), nullable=False)
  order_date = Column(Date, nullable=False)
  total_amount = Column(Numeric(10,2), nullable=False)
  status = Column(String(20), default="completed")

  customer = relationship("Customer", back_populates="orders")
  items = relationship("OrderItem", back_populates="order")

class OrderItem(Base):
  __tablename__="order_items"

  id = Column(Integer, primary_key=True, index=True)
  order_id = Column(Integer, ForeignKey("orders.id"), nullable=False)
  product_id = Column(Integer, ForeignKey("products.id"), nullable=False)
  quantity = Column(Integer, nullable=False)
  unit_price = Column(Numeric(10,2), nullable=False)

  order = relationship("Order", back_populates="items")
  product = relationship("Product", back_populates="order_items")
