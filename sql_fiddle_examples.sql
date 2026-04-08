# sql_fiddle_examples.sql

-- CREATE TABLES
CREATE TABLE orders (
    order_id INTEGER,
    customer_id INTEGER,
    amount INTEGER
);

CREATE TABLE customers (
    customer_id INTEGER,
    name TEXT
);

-- INSERT DATA
INSERT INTO orders VALUES (1, 1, 500);
INSERT INTO orders VALUES (2, 2, 300);
INSERT INTO orders VALUES (3, 1, 700);

INSERT INTO customers VALUES (1, 'Jan');
INSERT INTO customers VALUES (2, 'Eva');

-- JOIN + AGGREGATION
SELECT customers.name, AVG(amount)
FROM orders
JOIN customers on orders.customer_id = customers.customer_id
GROUP BY customers.name
ORDER BY AVG(amount) DESC;

SELECT
   customers.name,
   COUNT(*) AS total_orders
FROM orders
JOIN customers on orders.customer_id = customers.customer_id
GROUP BY customers.name
HAVING COUNT(*) > 1;

SELECT
   customers.name,
   SUM(amount) AS total_revenue
FROM orders
JOIN customers on orders.customer_id = customers.customer_id
GROUP BY customers.name
HAVING total_revenue > 1000;

SELECT
   customers.name,
   AVG(amount) AS avg_revenue
FROM orders
JOIN customers on orders.customer_id = customers.customer_id
GROUP BY customers.name
HAVING AVG(amount) > 400;

SELECT
   customers.name,
   COUNT(*) AS total_orders,
   AVG(amount) AS avg_revenue
FROM orders
JOIN customers on orders.customer_id = customers.customer_id
GROUP BY customers.name
HAVING COUNT(*) > 1 AND AVG(amount) > 400;

SELECT
   c.name,
   SUM(o.amount) AS total_revenue_over500
FROM orders o
JOIN customers c on o.customer_id = c.customer_id
GROUP BY c.name
HAVING SUM(o.amount) > 500;

SELECT
   c.name,
   AVG(o.amount) AS avg_revenue
FROM orders o
JOIN customers c on o.customer_id = c.customer_id
GROUP BY c.name
HAVING COUNT(*) > 1 AND AVG(o.amount) > 400;

SELECT
   c.name,
   COUNT(*) AS total_orders,
   SUM(o.amount) AS total_revenue
FROM orders o
JOIN customers c on o.customer_id = c.customer_id
GROUP BY c.name
HAVING total_orders > 1 AND total_revenue > 800
ORDER BY total_revenue DESC;

SELECT
   c.name,
   COUNT(*) AS total_orders
FROM orders o
JOIN customers c on o.customer_id = c.customer_id
GROUP BY c.name
HAVING total_orders >= 2;
