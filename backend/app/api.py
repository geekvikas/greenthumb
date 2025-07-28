from sqlalchemy.orm import Session
from sqlalchemy import func
from . import models, schemas

def get_monthly_revenue(db: Session):
  results = (
    db.query(
      func.date_trunc("month", models.Order.order_date).label("month"),
      func.sum(models.Order.total_amount).label("revenue"),
    )
    .group_by("month")
    .order_by("month")
    .all()
  )

  return [schemas.MonthlyRevenue(month=r.month, revenue=r.revenue) for r in results]

def get_category_breakdown(db: Session):

  results = (
    db.query(
      models.Product.category.label("category"),
      func.sum(models.OrderItem.quantity * models.OrderItem.unit_price).label("sales"),
    )
    .join(models.OrderItem, models.Product.id == models.OrderItem.product_id)
    .join(models.Order, models.Order.id == models.OrderItem.order_id)
    .group_by(models.Product.category)
    .all()
  )

  return [schemas.CategorySales(category=r.category, sales=r.sales) for r in results]

def get_top_customers(db: Session, limit_items = 20):
  cte = (
    db.query(
      models.Customer.id.label("id"),
      func.count(models.Order.id).label("order_count"),
      func.coalesce(func.sum(models.Order.total_amount),0).label("total_spent"),
      func.max(models.Order.order_date).label("last_order_date")
    )
    .outerjoin(models.Order, models.Customer.id == models.Order.customer_id)
    .group_by(models.Customer.id)
    .subquery()
  )

  results = (
    db.query(
      models.Customer.id,
      models.Customer.name,
      models.Customer.email,
      models.Customer.registration_date,
      models.Customer.customer_tier,
      cte.c.order_count,
      cte.c.total_spent,
      cte.c.last_order_date
    )
    .join(cte, models.Customer.id == cte.c.id)
    .order_by(cte.c.total_spent.desc())
    .limit(limit_items)
    .all()
  )

  return [
    schemas.TopCustomer(
      id=r.id,
      name=r.name,
      email=r.email,
      registration_date=r.registration_date,
      customer_tier=r.customer_tier,
      order_count=r.order_count,
      total_spent=r.total_spent,
      last_order_date=r.last_order_date,
    ) for r in results
  ]


def get_customer_summary(db: Session):
  # Get all the tiers and their counts
  tier_data = db.query(
    models.Customer.customer_tier,
    func.count(models.Customer.id).label("count")
  ).group_by(models.Customer.customer_tier).all()

  tier_counts = {tier: count for tier, count in tier_data}

  avg_order = db.query(func.avg(models.Order.total_amount)).scalar() or 0

  total_customers = db.query(func.count(models.Customer.id)).scalar() or 0

  repeat_customers = (
    db.query(models.Customer.id)
    .join(models.Order)
    .group_by(models.Customer.id)
    .having(func.count(models.Order.id) > 1)
    .count()
  )

  retention_percent = (repeat_customers / total_customers * 100) if total_customers else 0.0

  return schemas.SummaryStats(
    tier_counts=tier_counts,
    avg_order_value=avg_order,
    retention_percent=retention_percent
  )


