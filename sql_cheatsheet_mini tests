-- ============================================================
-- MINI TEST #0
-- Téma: SQL základy (SELECT, WHERE, GROUP BY, HAVING)
-- ============================================================

-- ============================================================
-- 1. SELECT
-- ============================================================

-- Co vrátí tento dotaz?

-- SELECT *
-- FROM orders;

-- Odpověď:
-- Všechny sloupce a všechny řádky z tabulky orders.


-- ============================================================
-- 2. WHERE
-- ============================================================

-- Co dělá:

-- WHERE amount > 400

-- Odpověď:
-- Filtruje řádky před agregací.


-- ============================================================
-- 3. COUNT
-- ============================================================

-- Jaký je rozdíl:

-- COUNT(*)
-- vs
-- COUNT(customer_id)

-- Odpověď:
-- COUNT(*) počítá všechny řádky.
-- COUNT(col) počítá jen nenull hodnoty.


-- ============================================================
-- 4. GROUP BY
-- ============================================================

-- Co dělá:

-- SELECT customer_id, COUNT(*)
-- FROM orders
-- GROUP BY customer_id;

-- Odpověď:
-- Agreguje data po zákaznících (1 řádek na zákazníka).


-- ============================================================
-- 5. HAVING
-- ============================================================

-- Co dělá:

-- HAVING COUNT(*) > 2

-- Odpověď:
-- Filtruje skupiny po agregaci.


-- ============================================================
-- 6. WHERE vs HAVING
-- ============================================================

-- Jaký je rozdíl?

-- Odpověď:
-- WHERE filtruje řádky před GROUP BY.
-- HAVING filtruje výsledky po GROUP BY.


-- ============================================================
-- 7. ORDER BY
-- ============================================================

-- Co se stane, když nenapíšu ASC/DESC?

-- ORDER BY customer_id

-- Odpověď:
-- Defaultně se řadí vzestupně (ASC).


-- ============================================================
-- 8. GROUP BY pravidlo
-- ============================================================

-- Proč je toto špatně?

-- SELECT customer_id, amount
-- FROM orders
-- GROUP BY customer_id;

-- Odpověď:
-- amount není v GROUP BY ani agregace.


-- ============================================================
-- 9. ALIAS
-- ============================================================

-- Proč toto nefunguje?

-- SELECT
--     amount * 2 AS doubled
-- FROM orders
-- WHERE doubled > 500;

-- Odpověď:
-- Alias vzniká až v SELECT, WHERE běží dřív.


-- ============================================================
-- 10. BONUS
-- ============================================================

-- Jak opravíš předchozí dotaz?

-- Odpověď:

-- SELECT *
-- FROM (
--     SELECT amount * 2 AS doubled
--     FROM orders
-- ) t
-- WHERE doubled > 500;

-- ============================================================
-- END
-- ============================================================

-- ============================================================
-- MINI TEST #2
-- Téma: JOINy & filtrování
-- ============================================================

-- ============================================================
-- 1. INNER JOIN vs LEFT JOIN
-- ============================================================

-- Jaký je rozdíl?

-- INNER JOIN
-- vs
-- LEFT JOIN

-- Odpověď:
-- INNER JOIN vrací jen shodné řádky.
-- LEFT JOIN vrací všechny řádky z levé tabulky + shody (jinak NULL).


-- ============================================================
-- 2. LEFT JOIN + WHERE (CHYTÁK)
-- ============================================================

-- Co udělá tento dotaz?

-- SELECT *
-- FROM customers c
-- LEFT JOIN orders o
--     ON c.customer_id = o.customer_id
-- WHERE o.amount > 100;

-- Odpověď:
-- Chová se jako INNER JOIN (NULL řádky jsou odfiltrovány).


-- ============================================================
-- 3. SPRÁVNÉ FILTROVÁNÍ
-- ============================================================

-- Jak zachovat všechny zákazníky, ale jen objednávky > 100?

-- Odpověď:

-- LEFT JOIN orders o
--     ON c.customer_id = o.customer_id
--    AND o.amount > 100


-- ============================================================
-- 4. HLEDÁNÍ CHYBĚJÍCÍCH DAT
-- ============================================================

-- Jak najdeš zákazníky bez objednávky?

-- Odpověď:

-- LEFT JOIN orders o
--     ON c.customer_id = o.customer_id
-- WHERE o.order_id IS NULL


-- ============================================================
-- 5. COUNT u LEFT JOIN
-- ============================================================

-- Jaký je rozdíl?

-- COUNT(*)
-- vs
-- COUNT(o.order_id)

-- Odpověď:
-- COUNT(*) počítá všechny řádky.
-- COUNT(sloupec) počítá jen nenull hodnoty.


-- ============================================================
-- 6. SMĚR JOINU
-- ============================================================

-- Chci všechny objednávky + zákazníky (pokud existují)

-- Jak začnu FROM?

-- Odpověď:

-- FROM orders o
-- LEFT JOIN customers c
--     ON c.customer_id = o.customer_id


-- ============================================================
-- 7. WHERE IS NULL
-- ============================================================

-- Co vrátí:

-- WHERE o.order_id IS NULL

-- Odpověď:
-- Řádky bez odpovídajícího záznamu (nenašla se shoda).


-- ============================================================
-- 8. ČASTÁ CHYBA
-- ============================================================

-- Proč je toto špatně?

-- LEFT JOIN orders o
--     ON c.customer_id = o.customer_id
-- WHERE o.amount > 100

-- Odpověď:
-- WHERE odstraní NULL → zničí logiku LEFT JOIN.


-- ============================================================
-- 9. RIGHT JOIN
-- ============================================================

-- Proč se RIGHT JOIN skoro nepoužívá?

-- Odpověď:
-- Dá se nahradit LEFT JOIN otočením tabulek.


-- ============================================================
-- 10. BONUS
-- ============================================================

-- Jak najdeš zákazníky, kteří mají alespoň 1 objednávku?

-- Odpověď:

-- INNER JOIN orders o
--     ON c.customer_id = o.customer_id

-- nebo

-- LEFT JOIN + WHERE NOT NULL
-- WHERE o.order_id IS NOT NULL


-- ============================================================
-- END
-- ============================================================

-- ============================================================
-- MINI TEST #3
-- Téma: Window funkce (pokročilé)
-- ============================================================

-- ============================================================
-- 1. PARTITION BY
-- ============================================================

-- Co dělá PARTITION BY?

-- Odpověď:
-- Rozděluje data do skupin pro výpočet window funkce.


-- ============================================================
-- 2. ORDER BY v OVER()
-- ============================================================

-- K čemu slouží?

-- Odpověď:
-- Určuje pořadí výpočtu (např. running total, LAG).


-- ============================================================
-- 3. RUNNING TOTAL
-- ============================================================

-- Co dělá:

-- SUM(revenue) OVER (
--     PARTITION BY customer
--     ORDER BY date
-- )

-- Odpověď:
-- Kumulativní součet pro každého zákazníka v čase.


-- ============================================================
-- 4. PODÍL NA CELKU
-- ============================================================

-- Co počítá:

-- revenue * 100.0 / SUM(revenue) OVER ()

-- Odpověď:
-- Procentuální podíl na celkovém součtu.


-- ============================================================
-- 5. PODÍL VE SKUPINĚ
-- ============================================================

-- Co počítá:

-- revenue * 100.0 / SUM(revenue) OVER (PARTITION BY customer)

-- Odpověď:
-- Procentuální podíl v rámci zákazníka.


-- ============================================================
-- 6. ROZDÍL OD MAXIMA
-- ============================================================

-- Co vrátí:

-- MAX(revenue) OVER (PARTITION BY customer) - revenue

-- Odpověď:
-- Rozdíl od maximální hodnoty v rámci zákazníka.


-- ============================================================
-- 7. LAG
-- ============================================================

-- Co dělá LAG?

-- Odpověď:
-- Vrací předchozí hodnotu.


-- ============================================================
-- 8. LEAD
-- ============================================================

-- Co dělá LEAD?

-- Odpověď:
-- Vrací následující hodnotu.


-- ============================================================
-- 9. RANK vs ROW_NUMBER
-- ============================================================

-- Jaký je rozdíl?

-- Odpověď:
-- RANK zachovává remízy.
-- ROW_NUMBER remízy rozbíjí.


-- ============================================================
-- 10. CHYTÁK
-- ============================================================

-- Proč toto nezachová remízy?

-- RANK() OVER (
--     ORDER BY revenue DESC, customer
-- )

-- Odpověď:
-- Protože ORDER BY obsahuje další sloupec → hodnoty už nejsou stejné.


-- ============================================================
-- BONUS
-- ============================================================

-- Co se stane, když LAG nemá ORDER BY?

-- Odpověď:
-- Výsledek není definovaný (není určené pořadí).


-- ============================================================
-- END
-- ============================================================


**Schema (MySQL v5.7)**

    CREATE TABLE orders (
        order_id INT,
        customer_id INT,
        amount INT
    );
    
    INSERT INTO orders VALUES
    (1, 1, 500),
    (2, 1, 300),
    (3, 2, 700),
    (4, 2, 200),
    (5, 2, 100),
    (6, 3, 50);

---

**Query #1**

    SELECT
    	order_id,
        customer_id
    FROM orders;

| order_id | customer_id |
| -------- | ----------- |
| 1        | 1           |
| 2        | 1           |
| 3        | 2           |
| 4        | 2           |
| 5        | 2           |
| 6        | 3           |

---
**Query #2**

    SELECT
    	order_id,
        customer_id,
        amount
    FROM orders
    WHERE amount > 400;

| order_id | customer_id | amount |
| -------- | ----------- | ------ |
| 1        | 1           | 500    |
| 3        | 2           | 700    |

---
**Query #3**

    SELECT
    	COUNT(*) AS total_orders
    FROM orders;

| total_orders |
| ------------ |
| 6            |

---
**Query #4**

    SELECT
    	COUNT(customer_id) AS total_nenull_orders
    FROM orders;

| total_nenull_orders |
| ------------------- |
| 6                   |

---
**Query #5**

    SELECT
    	customer_id,
        COUNT(*) AS total_orders
    FROM orders
    GROUP BY customer_id
    ORDER BY customer_id ASC;

| customer_id | total_orders |
| ----------- | ------------ |
| 1           | 2            |
| 2           | 3            |
| 3           | 1            |

---
**Query #6**

    SELECT
    	customer_id,
        COUNT(*) AS total_orders
    FROM orders
    GROUP BY customer_id
    HAVING COUNT(*) > 2
    ORDER BY total_orders DESC;

| customer_id | total_orders |
| ----------- | ------------ |
| 2           | 3            |

---

**Schema (MySQL v5.7)**

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
        customer_id INT,
        amount INT
    );
    
    INSERT INTO orders VALUES
    (1, 1, 500),
    (2, 1, 300),
    (3, 2, 700),
    (4, 2, 200),
    (5, 2, 100);

---

**Query #1**

    SELECT
    	c.name,
        c.customer_id,
        o.order_id
    FROM customers c
    JOIN orders o
    	ON c.customer_id = o.customer_id
    ORDER BY c.name ASC;

| name | customer_id | order_id |
| ---- | ----------- | -------- |
| Anna | 1           | 1        |
| Anna | 1           | 2        |
| Petr | 2           | 4        |
| Petr | 2           | 5        |
| Petr | 2           | 3        |

---
**Query #2**

    SELECT
        c.name,
        c.customer_id
    FROM customers c
    LEFT JOIN orders o
        ON c.customer_id = o.customer_id
    WHERE o.order_id IS NULL;

| name | customer_id |
| ---- | ----------- |
| Eva  | 3           |
| Jan  | 4           |

---
**Query #3**

    SELECT
    	c.name,
        c.customer_id,
        COUNT(o.order_id) AS total_orders
    FROM customers c
    LEFT JOIN orders o
    	ON c.customer_id = o.customer_id
    GROUP BY
    	c.name,
        c.customer_id
    HAVING COUNT(o.order_id) = 0
    ORDER BY c.name ASC;

| name | customer_id | total_orders |
| ---- | ----------- | ------------ |
| Eva  | 3           | 0            |
| Jan  | 4           | 0            |

---
**Query #4**

    SELECT
    	c.name,
        c.customer_id,
        COALESCE(SUM(o.amount), 0) AS total_revenue
    FROM customers c
    LEFT JOIN orders o
    	ON c.customer_id = o.customer_id
    GROUP BY
    	c.name,
        c.customer_id
    ORDER BY
    	total_revenue DESC;

| name | customer_id | total_revenue |
| ---- | ----------- | ------------- |
| Petr | 2           | 1000          |
| Anna | 1           | 800           |
| Eva  | 3           | 0             |
| Jan  | 4           | 0             |

---

SELECT
    customer,
    category,
    revenue
FROM (
    SELECT
        customer,
        category,
        revenue,
        ROW_NUMBER() OVER (
            PARTITION BY customer
            ORDER BY revenue DESC
        ) AS rn
    FROM sales
) x
WHERE rn = 1;

SELECT
    customer,
    category,
    revenue
FROM (
    SELECT
        customer,
        category,
        revenue,
        ROW_NUMBER() OVER (
            PARTITION BY customer
            ORDER BY revenue DESC
        ) AS rn
    FROM sales
) x
WHERE rn =< 2;

SELECT
    customer,
    category,
    revenue
FROM (
    SELECT
        customer,
        category,
        revenue,
        RANK() OVER (
            PARTITION BY customer
            ORDER BY revenue DESC
        ) AS rnk
    FROM sales
) x
WHERE rnk = 1;

SELECT
    customer,
    revenue,
    CASE
        WHEN revenue > 1000 THEN 'top'
        WHEN revenue > 500 THEN 'medium'
        ELSE 'low'
    END AS segment
FROM sales;

**Schema (MySQL v5.7)**

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
        customer_id INT,
        amount INT
    );
    
    INSERT INTO orders VALUES
    (1, 1, 500),
    (2, 1, 300),
    (3, 2, 700),
    (4, 2, 200),
    (5, 2, 100);

---

**Query #1**

    SELECT
    	c.customer_id,
        c.name,
        COALESCE(SUM(o.amount), 0) AS total_revenue,
        CASE
        	WHEN COALESCE(SUM(o.amount), 0) > 1000 THEN 'top'
            WHEN COALESCE(SUM(o.amount), 0) > 500 THEN 'medium'
            ELSE 'low'
     	END AS segment
    FROM customers c
    LEFT JOIN orders o
    	ON c.customer_id = o.customer_id
    GROUP BY
    	c.customer_id,
        c.name
    ORDER BY total_revenue DESC;

| customer_id | name | total_revenue | segment |
| ----------- | ---- | ------------- | ------- |
| 2           | Petr | 1000          | medium  |
| 1           | Anna | 800           | medium  |
| 3           | Eva  | 0             | low     |
| 4           | Jan  | 0             | low     |

