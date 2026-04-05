import pandas as pd
import numpy as np
from faker import Faker
import random
from datetime import timedelta
import os

fake = Faker()
Faker.seed(42)

NUM_ORDERS = 85000 

print("Generating Supply Chain Data. This might take a minute...")

# 1. Suppliers
suppliers = pd.DataFrame({
    'supplier_id': range(1, 51),
    'supplier_name': [fake.company() for _ in range(50)],
    'expected_lead_time_days': [random.randint(2, 14) for _ in range(50)]
})

# 2. Warehouses
warehouses = pd.DataFrame({
    'warehouse_id': range(1, 6),
    'location': [fake.city() for _ in range(5)],
    'capacity': [random.randint(10000, 50000) for _ in range(5)]
})

# 3. Inventory
inventory = pd.DataFrame({
    'sku_id': range(1, 501),
    'product_category': [random.choice(['Electronics', 'Apparel', 'Home Goods', 'Sports', 'Toys']) for _ in range(500)],
    'warehouse_id': [random.randint(1, 5) for _ in range(500)],
    'stock_level': [random.randint(0, 1000) for _ in range(500)]
})

# 4. Orders
order_dates = [fake.date_between(start_date='-1y', end_date='today') for _ in range(NUM_ORDERS)]
orders = pd.DataFrame({
    'order_id': range(1, NUM_ORDERS + 1),
    'sku_id': [random.randint(1, 500) for _ in range(NUM_ORDERS)],
    'order_date': order_dates
})

# 5. Shipments 
ship_dates = [order_date + timedelta(days=random.randint(1, 7)) for order_date in order_dates]
delivery_dates = [ship_date + timedelta(days=random.randint(1, 10)) for ship_date in ship_dates]

shipments = pd.DataFrame({
    'shipment_id': range(1, NUM_ORDERS + 1),
    'order_id': range(1, NUM_ORDERS + 1),
    'supplier_id': [random.randint(1, 50) for _ in range(NUM_ORDERS)],
    'ship_date': ship_dates,
    'delivery_date': delivery_dates
})

# Export to CSV
os.makedirs('data', exist_ok=True)
suppliers.to_csv('data/suppliers.csv', index=False)
warehouses.to_csv('data/warehouses.csv', index=False)
inventory.to_csv('data/inventory.csv', index=False)
orders.to_csv('data/orders.csv', index=False)
shipments.to_csv('data/shipments.csv', index=False)

print("Data generation complete! CSV files saved to the 'data' folder.")
