📘 SQL Basics – Data Analyst Cheat Sheet (v3)
🧠 1. Struktura SQL dotazu
SELECT co_chci_videt
FROM odkud_beru_data
WHERE podminka
GROUP BY seskupeni
HAVING podminka_na_skupiny
ORDER BY razeni;

👉 „Vyber → odkud → filtruj → seskup → filtruj skupiny → seřaď“

⚡ 2. Logické pořadí SQL (KLÍČOVÉ)
FROM
JOIN
WHERE
GROUP BY
HAVING
SELECT
ORDER BY

👉 SELECT se píše první, ale běží až téměř poslední

✍️ 3. Syntaxe
Čárka ,
SELECT name, amount
Středník ;
SELECT * FROM orders;
Mezery

👉 jen pro čitelnost

🧱 4. Vytvoření tabulky
CREATE TABLE orders (
    order_id INTEGER,
    customer_id INTEGER,
    amount INTEGER
);
➕ 5. Vložení dat
INSERT INTO orders VALUES (1, 1, 500);
INSERT INTO orders VALUES (2, 2, 300);
INSERT INTO orders VALUES (3, 1, 700);
📊 6. SELECT
SELECT *
FROM orders;
🎯 7. WHERE
SELECT *
FROM orders
WHERE amount > 400;

👉 filtruje řádky (před GROUP BY)

🔢 8. Agregace
COUNT(*)        -- všechny řádky
COUNT(sloupec)  -- bez NULL
SUM(amount)
AVG(amount)
📊 9. GROUP BY
SELECT customer_id, SUM(amount)
FROM orders
GROUP BY customer_id;

👉 rozdělí data do skupin

🔎 10. HAVING
HAVING SUM(amount) > 1000;

👉 filtruje skupiny (po agregaci)

🧠 WHERE vs HAVING
WHERE	HAVING
řádky	skupiny
před GROUP BY	po GROUP BY
bez agregace	s agregací
🎯 11. DISTINCT
SELECT DISTINCT customer_id
FROM orders;
🔢 12. COUNT vs COUNT(DISTINCT)
COUNT(*)                         -- všechny řádky
COUNT(customer_id)              -- ignoruje NULL
COUNT(DISTINCT customer_id)     -- unikátní hodnoty
📈 13. ORDER BY
ORDER BY amount DESC;

👉 aliasy zde fungují ✅

🔗 14. JOIN (INNER JOIN)
SELECT *
FROM orders o
JOIN customers c 
ON o.customer_id = c.customer_id;

👉 jen shody v obou tabulkách

⬅️ 15. LEFT JOIN (VELMI DŮLEŽITÉ)
SELECT *
FROM customers c
LEFT JOIN orders o 
ON c.customer_id = o.customer_id;

👉 vrátí:

všechny zákazníky
objednávky (nebo NULL)
🔍 Zákazníci bez objednávek
SELECT c.name
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.customer_id IS NULL;
🧠 COUNT(*) vs COUNT(sloupec) u LEFT JOIN
výraz	výsledek
COUNT(*)	počítá i NULL řádky
COUNT(o.customer_id)	počítá jen existující

👉 proto:

HAVING COUNT(o.customer_id) = 0

funguje, ale:

HAVING COUNT(*) = 0

❌ nefunguje

🧠 Alias pravidla (VELMI DŮLEŽITÉ)
část SQL	alias funguje?
SELECT	✅
WHERE	❌
GROUP BY	❌
HAVING	⚠️ někdy
ORDER BY	✅

👉 důvod:

alias vzniká až v SELECT
📊 16. JOIN + GROUP BY (patterny)
💰 Revenue
SELECT c.name, SUM(o.amount) AS total_revenue
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.name;
📦 Počet objednávek
SELECT c.name, COUNT(*) AS total_orders
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.name;
📈 Průměr
SELECT c.name, ROUND(AVG(o.amount), 0) AS avg_order
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.name;
🔥 17. HAVING – kombinace podmínek
SELECT
    c.name,
    COUNT(*) AS total_orders,
    ROUND(AVG(o.amount), 0) AS avg_order
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.name
HAVING COUNT(*) > 1 
   AND AVG(o.amount) > 400;

👉 typický business use-case (VIP zákazníci)

⚡ 18. WHERE + HAVING společně
SELECT
    c.name,
    COUNT(*) AS total_orders
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
WHERE o.amount > 100
GROUP BY c.name
HAVING COUNT(*) > 1;

👉 WHERE = filtr vstupu
👉 HAVING = filtr výsledku

🧠 19. SQL mindset

SQL ≠ programování
SQL = popis výsledku

⚡ 20. Mentální model
vezmi data (FROM)
spoj (JOIN)
filtruj (WHERE)
seskup (GROUP BY)
počítej (SUM, COUNT…)
filtruj (HAVING)
seřaď (ORDER BY)

👉 SQL = způsob, jak se ptát na data
