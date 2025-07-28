from pydantic import BaseModel
from typing import List, Optional, Dict
from decimal import Decimal
from datetime import date

class SupplierBase(BaseModel):
  name: str
  location: Optional[str] = None
  rating: Optional[Decimal] = None

class Supplier(SupplierBase):
  id: int

  class Config:
    orm_mode = True

class ProductBase(BaseModel):
  name: str
  category: str
  price: Decimal
  seasonal: bool = False
  supplier_id: Optional[int] = None

class Product(ProductBase):
  id: int
  supplier: Optional[Supplier] = None

  class Config:
    orm_mode = True

class OrderItemBase(BaseModel):
  product_id: int
  quantity: int
  unit_price: Decimal

class OrderItem(OrderItemBase):
  id: int
  product: Product

  class Config:
    orm_mode = True

class OrderBase(BaseModel):
  customer_id: int
  order_date: date
  total_amount: Decimal
  status: str


class Order(OrderBase):
  id: int
  items: List[OrderItem] = []

  class Config:
    orm_mode = True


class CustomerBase(BaseModel):
  name: str
  email: str
  registration_date: date
  customer_tier: str
  city: Optional[str] = None
  state: Optional[str] = None

class Customer(CustomerBase):
  id: int
  orders: List[Order] = []

  class Config:
    orm_mode = True


# API Schema

class MonthlyRevenue(BaseModel):
  month: date
  revenue: Decimal

class CategorySales(BaseModel):
  category: str
  sales: float

class SalesOverviewResponse(BaseModel):
  revenue: List[MonthlyRevenue]
  categories: List[CategorySales]


class TopCustomer(BaseModel):
  id: int
  name: str
  email: str
  registration_date: date
  customer_tier: str
  order_count: int
  total_spent: Decimal
  last_order_date: Optional[date]

class SummaryStats(BaseModel):
  tier_counts: Dict[str, int]
  avg_order_value: Decimal
  retention_percent: float

class CustomerInsightsResponse(BaseModel):
  top_customers: List[TopCustomer]
  summary: SummaryStats