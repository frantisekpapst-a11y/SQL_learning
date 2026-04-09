-- 1. Top customer (customer with highest total spending)
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


-- 4. Low value customers (customers with low average order value)
SELECT
    c.name,
    ROUND(AVG(o.amount), 0) AS avg_order_value
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.name
HAVING COUNT(*) >= 1
   AND AVG(o.amount) < 500
ORDER BY avg_order_value ASC;


-- 5. Low value customers (customers with at least 1 order and low average order value)
SELECT
    c.name,
    COUNT(*) AS total_orders,
    ROUND(AVG(o.amount), 0) AS avg_order_value
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.name
HAVING COUNT(*) >= 1
   AND AVG(o.amount) < 500
ORDER BY avg_order_value ASC;
