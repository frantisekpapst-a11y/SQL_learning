-- =========================
-- CASE STUDY 2: PRODUCT & CUSTOMER ANALYSIS
-- =========================

-- Dataset:
-- customers, orders, products

-- =========================
-- 1. Total quantity sold per product
-- =========================
SELECT
   p.product_name,
   SUM(o.quantity) AS total_quantity
FROM orders o
JOIN products p 
   ON o.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_quantity DESC;


-- =========================
-- 2. Total revenue per product
-- =========================
SELECT
   p.product_name,
   SUM(o.quantity * p.price) AS total_revenue
FROM orders o
JOIN products p 
   ON o.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_revenue DESC;


-- =========================
-- 3. Total revenue per customer
-- =========================
SELECT
   c.name,
   COALESCE(SUM(o.quantity * p.price), 0) AS total_revenue
FROM customers c
LEFT JOIN orders o
   ON c.customer_id = o.customer_id
LEFT JOIN products p
   ON o.product_id = p.product_id
GROUP BY c.name
ORDER BY total_revenue DESC;


-- =========================
-- 4. Revenue by category per customer
-- =========================
SELECT
   c.name,
   COALESCE(p.category, 'žádná') AS category,
   COALESCE(SUM(o.quantity * p.price), 0) AS total_revenue
FROM customers c
LEFT JOIN orders o
   ON c.customer_id = o.customer_id
LEFT JOIN products p
   ON o.product_id = p.product_id
GROUP BY c.name, COALESCE(p.category, 'žádná')
ORDER BY c.name, category;


-- =========================
-- 5. Top category per customer
-- =========================

WITH revenue_by_category AS (
    SELECT
       c.name,
       COALESCE(p.category, 'žádná') AS category,
       COALESCE(SUM(o.quantity * p.price), 0) AS total_revenue
    FROM customers c
    LEFT JOIN orders o
       ON c.customer_id = o.customer_id
    LEFT JOIN products p
       ON o.product_id = p.product_id
    GROUP BY c.name, COALESCE(p.category, 'žádná')
)

SELECT
   r.name,
   r.category AS top_category,
   r.total_revenue
FROM revenue_by_category r
JOIN (
    SELECT
       name,
       MAX(total_revenue) AS max_revenue
    FROM revenue_by_category
    GROUP BY name
) m
   ON r.name = m.name
  AND r.total_revenue = m.max_revenue
ORDER BY r.total_revenue DESC;

