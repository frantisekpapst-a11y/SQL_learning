# SQL_learning
My journey to becoming a data analyst – SQL basics and exercises

# SQL Learning – Data Analyst Journey

This repository contains my SQL learning progress as I transition into a data analyst role.

## 📊 Topics covered

- SELECT, FROM
- WHERE (filtering)
- COUNT, SUM
- GROUP BY (aggregation)
- HAVING (filtering aggregated data)

---

## 🧠 SQL Cheat Sheet

### Create table

```sql
CREATE TABLE orders (
  customer TEXT,
  amount INTEGER,
  country TEXT
);

INSERT INTO orders VALUES ('Jan', 500, 'CZ');
INSERT INTO orders VALUES ('Eva', 300, 'SK');
INSERT INTO orders VALUES ('Jan', 700, 'CZ');
Basic queries
SELECT * FROM orders;
SELECT customer FROM orders;
WHERE
SELECT *
FROM orders
WHERE country = 'CZ';
Aggregations
SELECT COUNT(*) FROM orders;
SELECT SUM(amount) FROM orders;
GROUP BY
SELECT customer, COUNT(*)
FROM orders
GROUP BY customer;
HAVING
SELECT customer, COUNT(*)
FROM orders
GROUP BY customer
HAVING COUNT(*) > 1;

🚀 Goal

Become a junior data analyst in 3–6 months.
