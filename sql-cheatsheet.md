📘 SQL Basics – Data Analyst Cheat Sheet (v4)

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
Čárka (,) → odděluje sloupce
Středník (;) → ukončuje dotaz
Mezery → jen pro čitelnost

✅ dobrá praxe:

SELECT *
FROM orders;

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

🎯 7. WHERE – filtr řádků
SELECT *
FROM orders
WHERE amount > 400;

👉 filtruje před agregací

🔢 8. Agregace
COUNT(*)        -- všechny řádky
COUNT(sloupec)  -- ignoruje NULL
SUM(amount)
AVG(amount)
MAX(amount)
MIN(amount)

📊 9. GROUP BY
SELECT customer_id, SUM(amount)
FROM orders
GROUP BY customer_id;

👉 rozdělí data do skupin

🔎 10. HAVING – filtr skupin
HAVING SUM(amount) > 1000;

👉 filtruje po agregaci

🧠 WHERE vs HAVING (KLÍČ)
WHERE	HAVING
filtr řádků	filtr skupin
před GROUP BY	po GROUP BY
bez agregace	s agregací

👉 WHERE mění data
👉 HAVING kontroluje výsledek

🎯 11. DISTINCT
SELECT DISTINCT customer_id
FROM orders;

🔢 12. COUNT vs COUNT(DISTINCT)
COUNT(*)                      -- všechny řádky
COUNT(customer_id)            -- bez NULL
COUNT(DISTINCT customer_id)  -- unikátní

📈 13. ORDER BY
ORDER BY amount DESC;

👉 aliasy zde fungují ✅

🔗 14. JOIN (INNER JOIN)
SELECT *
FROM orders o
JOIN customers c 
ON o.customer_id = c.customer_id;

👉 vrátí jen shody

⬅️ 15. LEFT JOIN (KRITICKÉ 🔥)
SELECT *
FROM customers c
LEFT JOIN orders o 
ON c.customer_id = o.customer_id;

👉 vrátí:

všechny zákazníky
objednávky nebo NULL
🔍 Zákazníci bez objednávek (TOP pattern)
SELECT c.name
FROM customers c
LEFT JOIN orders o 
ON c.customer_id = o.customer_id
WHERE o.customer_id IS NULL;

👉 LEFT JOIN + WHERE NULL = chybějící data

🧠 LEFT JOIN + WHERE vs ON (VELMI DŮLEŽITÉ)
-- ❌ ŠPATNĚ (zničí LEFT JOIN)
WHERE o.amount > 400
-- ✅ SPRÁVNĚ
LEFT JOIN orders o 
ON c.customer_id = o.customer_id 
AND o.amount > 400

👉 WHERE může změnit LEFT JOIN na INNER JOIN ❌

🧠 COUNT u LEFT JOIN
výraz	co počítá
COUNT(*)	všechny řádky
COUNT(o.customer_id)	jen existující

👉 proto:

HAVING COUNT(o.customer_id) = 0 ✅
HAVING COUNT(*) = 0 ❌
🧠 Alias pravidla
část	alias
SELECT	✅
WHERE	❌
GROUP BY	❌
HAVING	⚠️ někdy
ORDER BY	✅

👉 alias vzniká až v SELECT

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

🔥 17. HAVING – kombinace
HAVING COUNT(*) > 1 
   AND AVG(o.amount) > 400;

👉 typický business case (VIP zákazníci)

⚡ 18. WHERE + HAVING společně
SELECT c.name, COUNT(*) AS total_orders
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
WHERE o.amount > 100
GROUP BY c.name
HAVING COUNT(*) > 1;

👉 WHERE = filtr vstupu
👉 HAVING = filtr výsledku

🔥 19. NEJČASTĚJŠÍ CHYBA (DNEŠEK)
-- ❌ ŠPATNĚ
WHERE o.amount <= 500

👉 odstraníš data před výpočtem

-- ✅ SPRÁVNĚ
HAVING MAX(o.amount) <= 500

👉 kontroluješ skutečný stav dat

🧠 20. SQL mindset

SQL ≠ programování
SQL = popis výsledku

⚡ 21. Mentální model

👉 krok za krokem:

vezmi data (FROM)
spoj (JOIN)
filtruj (WHERE)
seskup (GROUP BY)
počítej (SUM, COUNT…)
filtruj (HAVING)
seřaď (ORDER BY)
🚀 BONUS – rychlé rozhodování
otázka	řešení
kolik?	COUNT
kolik celkem?	SUM
průměr?	AVG
maximum?	MAX
kdo nemá?	LEFT JOIN + NULL 🔥
filtr před výpočtem	WHERE
filtr po výpočtu	HAVING
