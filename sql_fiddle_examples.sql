# sql_fiddle_examples.sql

**Schema (MySQL v5.7)**

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

---

**Query #1**

    SELECT
       c.name,
       SUM(o.amount) AS total_revenue
    FROM orders o
    JOIN customers c on o.customer_id = c.customer_id
    GROUP BY c.name
    ORDER BY SUM(o.amount) DESC
    LIMIT 1;

| name | total_revenue |
| ---- | ------------- |
| Jan  | 1200          |

---
**Query #2**

    SELECT
       c.name,
       COUNT(*) AS total_orders
    FROM orders o
    JOIN customers c on o.customer_id = c.customer_id
    GROUP BY c.name
    ORDER BY total_orders DESC;

| name | total_orders |
| ---- | ------------ |
| Jan  | 2            |
| Eva  | 1            |

---
**Query #3**

    SELECT
       c.name,
       ROUND(AVG(o.amount), 0) AS avg_order_value
    FROM orders o
    JOIN customers c on o.customer_id = c.customer_id
    GROUP BY c.name
    ORDER BY avg_order_value DESC;

| name | avg_order_value |
| ---- | --------------- |
| Jan  | 600             |
| Eva  | 300             |

---
**Query #4**

    SELECT
       c.name,
       COUNT(*) AS total_orders,
       ROUND(AVG(o.amount), 0) AS avg_order_value
    FROM orders o
    JOIN customers c on o.customer_id = c.customer_id
    GROUP BY c.name
    HAVING COUNT(*) > 1 AND ROUND(AVG(o.amount), 0) > 400;

| name | total_orders | avg_order_value |
| ---- | ------------ | --------------- |
| Jan  | 2            | 600             |

**Schema (MySQL v5.7)**

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
        INSERT INTO customers VALUES (3, 'Petr');

---

**Query #1**

    SELECT
       c.name,
       COUNT(o.order_id) AS total_orders
    FROM customers c
    LEFT JOIN orders o on c.customer_id = o.customer_id
    GROUP BY c.name
    HAVING COUNT(o.order_id) <= 1
    ORDER BY total_orders ASC;

| name | total_orders |
| ---- | ------------ |
| Petr | 0            |
| Eva  | 1            |


