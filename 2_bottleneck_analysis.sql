USE SupplyChainOps;

/* ===========================================================================
ANALYSIS 1: Order-to-Ship Lag & Warehouse Dwell Time by Product Category
Objective: Identify the top 5 process bottlenecks across categories.
===========================================================================
*/

WITH CycleTimeMetrics AS (
    SELECT 
        i.product_category,
        o.order_id,
        DATEDIFF(s.ship_date, o.order_date) AS order_to_ship_lag,
        AVG(DATEDIFF(s.ship_date, o.order_date)) OVER(PARTITION BY i.product_category) AS avg_category_dwell_time
    FROM orders o
    JOIN shipments s ON o.order_id = s.order_id
    JOIN inventory i ON o.sku_id = i.sku_id
)
SELECT 
    product_category,
    COUNT(order_id) AS total_orders_processed,
    ROUND(AVG(order_to_ship_lag), 2) AS avg_order_to_ship_days,
    ROUND(MAX(avg_category_dwell_time), 2) AS baseline_warehouse_dwell_time
FROM CycleTimeMetrics
GROUP BY product_category
ORDER BY avg_order_to_ship_days DESC
LIMIT 5; 


/* ===========================================================================
ANALYSIS 2: Supplier Lead Time Deviations
Objective: Identify which suppliers are missing their expected SLAs.
===========================================================================
*/

WITH SupplierPerformance AS (
    SELECT 
        sup.supplier_name,
        sup.expected_lead_time_days,
        DATEDIFF(s.delivery_date, s.ship_date) AS actual_transit_time,
        (DATEDIFF(s.delivery_date, s.ship_date) - sup.expected_lead_time_days) AS lead_time_deviation
    FROM shipments s
    JOIN suppliers sup ON s.supplier_id = sup.supplier_id
)
SELECT 
    supplier_name,
    expected_lead_time_days,
    ROUND(AVG(actual_transit_time), 2) AS avg_actual_transit_time,
    ROUND(AVG(lead_time_deviation), 2) AS avg_days_delayed,
    COUNT(*) AS total_shipments
FROM SupplierPerformance
WHERE lead_time_deviation > 0 -- Only looking at delayed shipments
GROUP BY supplier_name, expected_lead_time_days
ORDER BY avg_days_delayed DESC
LIMIT 10;
