📘 SQL Basics – Data Analyst Cheat Sheet (v5)
# 📘 SQL Basics – Data Analyst Cheat Sheet

## 🧠 1. Struktura SQL dotazu

```sql
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

👉 SELECT se píše první, ale vykonává se až téměř poslední.
👉 Proto aliasy nefungují ve WHERE.

✍️ 3. Syntaxe
Čárka (,) → odděluje sloupce
Středník (;) → ukončuje dotaz
Mezery a odřádkování → jen pro čitelnost

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

👉 * = všechny sloupce

🎯 7. WHERE – filtr řádků
SELECT *
FROM orders
WHERE amount > 400;

👉 filtruje řádky před agregací

🔢 8. Agregační funkce
COUNT(*)        -- všechny řádky
COUNT(sloupec)  -- ignoruje NULL
SUM(amount)     -- součet
AVG(amount)     -- průměr
MAX(amount)     -- maximum
MIN(amount)     -- minimum
📊 9. GROUP BY
SELECT customer_id, SUM(amount)
FROM orders
GROUP BY customer_id;

👉 rozdělí data do skupin

🔎 10. HAVING – filtr skupin
SELECT customer_id, SUM(amount)
FROM orders
GROUP BY customer_id
HAVING SUM(amount) > 1000;

👉 filtruje skupiny po agregaci

🧠 11. WHERE vs HAVING
WHERE	HAVING
filtr řádků	filtr skupin
před GROUP BY	po GROUP BY
bez agregace	s agregací

👉 WHERE mění vstupní data
👉 HAVING kontroluje výsledek po výpočtu

🎯 12. DISTINCT
SELECT DISTINCT customer_id
FROM orders;

👉 vrátí unikátní hodnoty

🔢 13. COUNT vs COUNT(DISTINCT)
COUNT(*)                      -- všechny řádky
COUNT(customer_id)            -- bez NULL
COUNT(DISTINCT customer_id)   -- unikátní hodnoty
📈 14. ORDER BY
ORDER BY amount DESC;

👉 aliasy zde většinou fungují ✅

🔗 15. JOIN (INNER JOIN)
SELECT *
FROM orders o
JOIN customers c
    ON o.customer_id = c.customer_id;

👉 vrátí jen shody v obou tabulkách

⬅️ 16. LEFT JOIN
SELECT *
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id;

👉 vrátí:

všechny řádky z levé tabulky
odpovídající řádky z pravé tabulky
pokud nic neexistuje → NULL
🔍 Zákazníci bez objednávek
SELECT c.name
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
WHERE o.customer_id IS NULL;

👉 LEFT JOIN + WHERE ... IS NULL = hledání chybějících dat / neexistujících vazeb

🧠 17. LEFT JOIN: WHERE vs ON
❌ ŠPATNĚ
SELECT
    c.name,
    COUNT(o.order_id)
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
WHERE o.amount > 400
GROUP BY c.name;

👉 WHERE může „rozbít“ LEFT JOIN a změnit ho prakticky na INNER JOIN

✅ SPRÁVNĚ
SELECT
    c.name,
    COUNT(o.order_id)
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
   AND o.amount > 400
GROUP BY c.name;

👉 když chceš zachovat všechny řádky z levé tabulky, filtr na pravou tabulku často patří do ON

🧠 18. COUNT(*) vs COUNT(sloupec) u LEFT JOIN
výraz	co počítá
COUNT(*)	všechny řádky
COUNT(o.customer_id)	jen existující hodnoty

👉 proto:

HAVING COUNT(o.customer_id) = 0

funguje ✅

ale:

HAVING COUNT(*) = 0

nefunguje ❌

👉 u LEFT JOIN má zákazník bez objednávky pořád jeden řádek s NULL

🧠 19. Alias pravidla
část SQL	alias funguje?
SELECT	✅
WHERE	❌
GROUP BY	❌ / někdy podle DB
HAVING	⚠️ někdy
ORDER BY	✅

👉 alias vzniká až v SELECT

📊 20. JOIN + GROUP BY – základní patterny
💰 Revenue
SELECT
    c.name,
    SUM(o.amount) AS total_revenue
FROM orders o
JOIN customers c
    ON o.customer_id = c.customer_id
GROUP BY c.name;
📦 Počet objednávek
SELECT
    c.name,
    COUNT(*) AS total_orders
FROM orders o
JOIN customers c
    ON o.customer_id = c.customer_id
GROUP BY c.name;
📈 Průměr
SELECT
    c.name,
    ROUND(AVG(o.amount), 0) AS avg_order
FROM orders o
JOIN customers c
    ON o.customer_id = c.customer_id
GROUP BY c.name;
🔥 21. HAVING – kombinace podmínek
SELECT
    c.name,
    COUNT(*) AS total_orders,
    AVG(o.amount) AS avg_order
FROM orders o
JOIN customers c
    ON o.customer_id = c.customer_id
GROUP BY c.name
HAVING COUNT(*) > 1
   AND AVG(o.amount) > 400;

👉 typický business case: VIP zákazníci

⚡ 22. WHERE + HAVING společně
SELECT
    c.name,
    COUNT(*) AS total_orders
FROM orders o
JOIN customers c
    ON o.customer_id = c.customer_id
WHERE o.amount > 100
GROUP BY c.name
HAVING COUNT(*) > 1;

👉 WHERE = filtr vstupu
👉 HAVING = filtr výsledku

🔥 23. Častá chyba: WHERE vs HAVING
❌ ŠPATNĚ
WHERE o.amount <= 500

👉 odstraníš řádky ještě před výpočtem

✅ SPRÁVNĚ
HAVING MAX(o.amount) <= 500

👉 kontroluješ skutečný stav dat po agregaci

🧠 24. COALESCE – práce s NULL
COALESCE(SUM(o.amount), 0) AS total_revenue

👉 když je výsledek NULL, nahradí ho hodnotou 0

Příklad:

zákazník bez objednávek → revenue = 0 místo NULL
📦 25. Výpočty v SQL

Příklad:

o.quantity * p.price

👉 výpočet na jednom řádku

A pak agregace:

SUM(o.quantity * p.price) AS total_revenue

👉 nejdřív spočítáš řádek
👉 pak to sečteš

❌ ŠPATNĚ
SUM(o.quantity) * p.price
✅ SPRÁVNĚ
SUM(o.quantity * p.price)
🧠 26. JOIN více tabulek
SELECT
    c.name,
    COALESCE(SUM(o.quantity * p.price), 0) AS total_revenue
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
LEFT JOIN products p
    ON o.product_id = p.product_id
GROUP BY c.name;

👉 umíš spojit:

customers
orders
products
🏆 27. TOP per group (pokročilý pattern)

Typický problém:

👉 „Najdi top kategorii pro každého zákazníka“

Logika:

spočítat revenue podle kategorií
najít maximum pro každého zákazníka
spojit výsledek zpátky

Tohle je pokročilejší pattern, ale velmi důležitý pro praxi.

🧠 28. SQL mindset

SQL ≠ klasické programování
SQL = popis výsledku

👉 nepíšu postup krok za krokem jako v Pythonu
👉 říkám, jaký výsledek chci dostat

⚡ 29. Mentální model
vezmi data (FROM)
spoj tabulky (JOIN)
filtruj řádky (WHERE)
seskup data (GROUP BY)
počítej (SUM, COUNT, AVG...)
filtruj skupiny (HAVING)
seřaď výsledek (ORDER BY)
🚀 30. Rychlé rozhodování
otázka	řešení
kolik?	COUNT
kolik celkem?	SUM
průměr?	AVG
maximum?	MAX
kdo nemá?	LEFT JOIN + WHERE ... IS NULL
filtr před výpočtem	WHERE
filtr po výpočtu	HAVING
nahradit NULL	COALESCE
top něco pro každého	MAX(...) + mezitabulka + JOIN
