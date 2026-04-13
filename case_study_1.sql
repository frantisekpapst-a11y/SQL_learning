-- =========================
-- CASE STUDY 1: CUSTOMER ANALYSIS
-- =========================

-- 1. Top customer (highest total spending)
SELECT
    c.name,
    SUM(o.amount) AS total_revenue
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.name
ORDER BY total_revenue DESC
LIMIT 1;


-- 2. Customer activity (number of orders per customer)
SELECT
    c.name,
    COUNT(*) AS total_orders
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.name
ORDER BY total_orders DESC;


-- 3. Average order value per customer
SELECT
    c.name,
    ROUND(AVG(o.amount), 0) AS avg_order_value
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.name
ORDER BY avg_order_value DESC;


-- 4. Low value customers (avg order value < 500)
SELECT
    c.name,
    ROUND(AVG(o.amount), 0) AS avg_order_value
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.name
HAVING AVG(o.amount) < 500
ORDER BY avg_order_value ASC;


-- 5. Low value customers with order count
SELECT
    c.name,
    COUNT(*) AS total_orders,
    ROUND(AVG(o.amount), 0) AS avg_order_value
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.name
HAVING AVG(o.amount) < 500
ORDER BY avg_order_value ASC;


-- =========================
-- EXTENDED CUSTOMER REPORT (LEFT JOIN)
-- =========================

-- 6. Customer report (orders, revenue, average)
SELECT
    c.name,
    COUNT(o.order_id) AS total_orders,
    COALESCE(SUM(o.amount), 0) AS total_revenue,
    ROUND(COALESCE(AVG(o.amount), 0), 0) AS avg_order_value
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.name
ORDER BY total_orders ASC;


-- 7. VIP customers (high-value segment)
SELECT
    c.name,
    COUNT(o.order_id) AS total_orders,
    COALESCE(SUM(o.amount), 0) AS total_revenue,
    ROUND(COALESCE(AVG(o.amount), 0), 0) AS avg_order_value
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.name
HAVING COUNT(o.order_id) > 1
   AND AVG(o.amount) > 400
ORDER BY total_orders ASC;


-- 8. Customers without orders
SELECT
    c.name
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;
