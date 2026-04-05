-- Create Database
CREATE DATABASE IF NOT EXISTS SupplyChainOps;
USE SupplyChainOps;

-- 1. Suppliers Table
CREATE TABLE suppliers (
    supplier_id INT PRIMARY KEY,
    supplier_name VARCHAR(100),
    expected_lead_time_days INT
);

-- 2. Warehouses Table
CREATE TABLE warehouses (
    warehouse_id INT PRIMARY KEY,
    location VARCHAR(100),
    capacity INT
);

-- 3. Inventory Table
CREATE TABLE inventory (
    sku_id INT PRIMARY KEY,
    product_category VARCHAR(50),
    warehouse_id INT,
    stock_level INT,
    FOREIGN KEY (warehouse_id) REFERENCES warehouses(warehouse_id)
);

-- 4. Orders Table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    sku_id INT,
    order_date DATE,
    FOREIGN KEY (sku_id) REFERENCES inventory(sku_id)
);

-- 5. Shipments Table
CREATE TABLE shipments (
    shipment_id INT PRIMARY KEY,
    order_id INT,
    supplier_id INT,
    ship_date DATE,
    delivery_date DATE,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id)
);

-- 6. Returns Table
CREATE TABLE returns (
    return_id INT PRIMARY KEY,
    order_id INT,
    return_reason VARCHAR(100),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);
