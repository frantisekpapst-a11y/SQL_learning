-- CASE STUDY 3
-- Goal:
-- For each customer find:
-- 1. Top product category (highest revenue)
-- 2. Revenue in that category
-- 3. Total customer revenue
-- 4. Customer segment (top / medium / low)
--
-- Tables:
-- customers, orders, order_items, products

-- Step 1: revenue per customer & category

SELECT
    c.customer_id,
    c.name,
    p.category,
    SUM(oi.quantity * p.price) AS total_revenue_category
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
JOIN products p
    ON oi.product_id = p.product_id
GROUP BY
    c.customer_id,
    c.name,
    p.category;

-- Step 2: top category per customer

SELECT
    customer_id,
    name,
    category,
    total_revenue_category
FROM (
    SELECT
        customer_id,
        name,
        category,
        total_revenue_category,
        ROW_NUMBER() OVER (
            PARTITION BY customer_id
            ORDER BY total_revenue_category DESC
        ) AS rn
    FROM (
        -- previous query
    ) x
) t
WHERE rn = 1;

-- Step 3: total revenue + segment

SELECT
    c.customer_id,
    c.name,
    COALESCE(SUM(oi.quantity * p.price), 0) AS total_revenue_customer,
    CASE
        WHEN COALESCE(SUM(oi.quantity * p.price), 0) > 1000 THEN 'top'
        WHEN COALESCE(SUM(oi.quantity * p.price), 0) > 500 THEN 'medium'
        ELSE 'low'
    END AS segment
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
LEFT JOIN order_items oi
    ON o.order_id = oi.order_id
LEFT JOIN products p
    ON oi.product_id = p.product_id
GROUP BY
    c.customer_id,
    c.name;

**Schema (MySQL v8)**

    CREATE TABLE customers (
        customer_id INT,
        name VARCHAR(50)
    );
    
    INSERT INTO customers VALUES
    (1, 'Anna'),
    (2, 'Petr'),
    (3, 'Eva'),
    (4, 'Jan');
    
    CREATE TABLE orders (
        order_id INT,
        customer_id INT
    );
    
    INSERT INTO orders VALUES
    (1, 1),
    (2, 1),
    (3, 2),
    (4, 3);
    
    CREATE TABLE order_items (
        order_id INT,
        product_id INT,
        quantity INT
    );
    
    INSERT INTO order_items VALUES
    (1, 1, 2),
    (1, 2, 1),
    (2, 1, 1),
    (3, 3, 3),
    (4, 2, 2);
    
    CREATE TABLE products (
        product_id INT,
        category VARCHAR(50),
        price INT
    );
    
    INSERT INTO products VALUES
    (1, 'Shoes', 100),
    (2, 'Hats', 200),
    (3, 'Bags', 300);

---

**Query #1**

    SELECT
    	seg.customer_id,
        seg.name,
        top.category AS top_category,
        COALESCE(top.total_revenue_category, 0) AS total_revenue_category,
        seg.total_revenue_customer,
        seg.segment
    FROM
    (
    	SELECT
    		c.customer_id,
        	c.name,
        	COALESCE(SUM(oi.quantity * p.price),0) AS total_revenue_customer,
    		CASE
    			WHEN COALESCE(SUM(oi.quantity * p.price), 0) > 1000 THEN 'top'
            	WHEN COALESCE(SUM(oi.quantity * p.price), 0) > 500 THEN 'medium'
            	ELSE 'low'
     		END AS segment
    	FROM customers c
    	LEFT JOIN orders o
    		ON c.customer_id = o.customer_id
    	LEFT JOIN order_items oi
    		ON o.order_id = oi.order_id
    	LEFT JOIN products p
    		ON oi.product_id = p.product_id
    	GROUP BY
    		c.customer_id,
        	c.name
    ) seg
    LEFT JOIN
    (
    	SELECT
    		customer_id,
        	name,
        	category,
        	total_revenue_category
    	FROM (
    		SELECT
    			customer_id,
        		name,
        		category,
        		total_revenue_category,
        		ROW_NUMBER() OVER (
          			PARTITION BY customer_id
          			ORDER BY total_revenue_category DESC
      			) AS rn
    		FROM (
    			SELECT
    				c.customer_id,
        			c.name,
        			p.category,
        			COALESCE(SUM(oi.quantity * p.price), 0) AS total_revenue_category
    			FROM customers c
    			JOIN orders o
    				ON c.customer_id = o.customer_id
    			JOIN order_items oi
    				ON o.order_id = oi.order_id
    			JOIN products p
    				ON oi.product_id = p.product_id
    			GROUP BY
    				c.customer_id,
        			c.name,
        			p.category
    	  			) x
      		) t
    	WHERE rn = 1
    ) top
    	ON seg.customer_id = top.customer_id
    ORDER BY seg.total_revenue_customer DESC;

| customer_id | name | top_category | total_revenue_category | total_revenue_customer | segment |
| ----------- | ---- | ------------ | ---------------------- | ---------------------- | ------- |
| 2           | Petr | Bags         | 900                    | 900                    | medium  |
| 1           | Anna | Shoes        | 300                    | 500                    | low     |
| 3           | Eva  | Hats         | 400                    | 400                    | low     |
| 4           | Jan  |              | 0                      | 0                      | low     |

---

[View on DB Fiddle](https://www.db-fiddle.com/)
