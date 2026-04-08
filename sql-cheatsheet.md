# SQL Basics – Data Analyst Cheat Sheet

🧠 1. Struktura SQL dotazu
SELECT co_chci_videt
FROM odkud_beru_data
WHERE podminka
GROUP BY seskupeni
HAVING podminka_na_skupiny
ORDER BY razeni;
Jak to číst:

👉 „Vyber data → odkud → vyfiltruj → seskup → filtruj skupiny → seřaď“

⚡ 2. Logické pořadí SQL (velmi důležité)
FROM
JOIN
WHERE
GROUP BY
HAVING
SELECT
ORDER BY
✍️ 3. Syntaxe (čárky, středníky, mezery)
Čárka ,
odděluje sloupce
SELECT name, amount
Středník ;
ukončuje dotaz
SELECT * FROM orders;

👉 při více dotazech musí mít každý ;

Mezery
SQL je ignoruje → slouží pro čitelnost

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
📊 6. SELECT – výpis dat
SELECT *
FROM orders;

👉 * = všechny sloupce

🎯 7. WHERE – filtr řádků
SELECT *
FROM orders
WHERE amount > 400;

👉 filtruje před agregací

🔢 8. Agregační funkce
COUNT(*)        -- počet řádků
COUNT(sloupec)  -- ignoruje NULL
SUM(amount)     -- součet
AVG(amount)     -- průměr
📊 9. GROUP BY – agregace
SELECT customer_id, SUM(amount)
FROM orders
GROUP BY customer_id;

👉 rozděluje data do skupin (jako kontingenčka)

🔎 10. HAVING – filtr skupin
SELECT customer_id, SUM(amount)
FROM orders
GROUP BY customer_id
HAVING SUM(amount) > 1000;

👉 filtruje po agregaci

🧠 WHERE vs HAVING
WHERE	HAVING
filtr řádků	filtr skupin
před GROUP BY	po GROUP BY
nefunguje s AVG	funguje
🎯 11. DISTINCT – unikátní hodnoty
SELECT DISTINCT customer_id
FROM orders;
🔢 12. COUNT vs COUNT(DISTINCT)
COUNT(*)                      -- všechny řádky
COUNT(customer_id)            -- bez NULL
COUNT(DISTINCT customer_id)  -- unikátní hodnoty
📈 13. ORDER BY – řazení
ORDER BY amount DESC;
🔗 14. JOIN – spojení tabulek
SELECT *
FROM orders
JOIN customers
ON orders.customer_id = customers.customer_id;

👉 spojuje tabulky přes společný klíč

🧠 JOIN (lepší praxe – aliasy)
SELECT 
    c.name,
    o.amount
FROM orders o
JOIN customers c 
ON o.customer_id = c.customer_id;

👉 čitelnější a standard v praxi

📊 15. JOIN + GROUP BY (nejdůležitější pattern)
💰 Kolik utratil zákazník
SELECT
    c.name,
    SUM(o.amount) AS total_spent
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.name
ORDER BY total_spent DESC;
📦 Kolik má zákazník objednávek
SELECT
    c.name,
    COUNT(*) AS total_orders
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.name
ORDER BY total_orders DESC;
📈 Průměrná hodnota objednávky
SELECT
    c.name,
    AVG(o.amount) AS avg_order
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.name;
🔥 16. HAVING – pokročilé použití
zákazníci s více než 1 objednávkou
HAVING COUNT(*) > 1;
zákazníci s vysokou útratou
HAVING SUM(o.amount) > 1000;
kombinace podmínek (real case)
SELECT
    c.name,
    COUNT(*) AS total_orders,
    AVG(o.amount) AS avg_revenue
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.name
HAVING COUNT(*) > 1
   AND AVG(o.amount) > 400
ORDER BY avg_revenue DESC;

👉 typický business use-case (segmentace zákazníků)

📊 17. CSV / Excel → SQL

👉 Excel → uložit jako .csv

Použití:

Power BI
Python (pandas)
import do databáze

👉 CSV = most mezi nástroji

🧠 18. Jak přemýšlet v SQL

SQL = popis výsledku

👉 ne „jak to udělat“
👉 ale „co chci vidět“

⚡ 19. Mentální model
vezmi data (FROM)
filtruj (WHERE)
seskup (GROUP BY)
spočítej (SUM, COUNT…)
filtruj skupiny (HAVING)
seřaď (ORDER BY)

## 🔥 Pokročilejší HAVING (kombinace podmínek)

👉 Můžeme filtrovat skupiny podle více podmínek:

```sql
SELECT
    c.name,
    COUNT(*) AS total_orders,
    AVG(o.amount) AS avg_revenue
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.name
HAVING COUNT(*) > 1 AND AVG(o.amount) > 400;

👉 Co to dělá:

najde zákazníky
kteří mají více než 1 objednávku
a zároveň mají průměrnou objednávku vyšší než 400
🧠 WHERE vs HAVING (hlubší pochopení)

👉 WHERE:

filtruje jednotlivé řádky
používá se před GROUP BY

👉 HAVING:

filtruje skupiny
používá se po GROUP BY
pracuje s agregacemi (SUM, AVG, COUNT)
⚡ Příklad kombinace WHERE + HAVING
SELECT
    c.name,
    COUNT(*) AS total_orders
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
WHERE o.amount > 100
GROUP BY c.name
HAVING COUNT(*) > 1;

👉 Logika:

WHERE → vyfiltruje objednávky (řádky)
GROUP BY → rozdělí podle zákazníků
HAVING → vybere jen některé zákazníky
🧠 Analytické myšlení v SQL

👉 Nepíšu kód, ale popisuju výsledek:

Jaká data beru (FROM)
Jak je spojím (JOIN)
Co odfiltruju (WHERE)
Jak je rozdělím (GROUP BY)
Co spočítám (SUM, COUNT, AVG)
Co z toho vyberu (HAVING)
Jak to seřadím (ORDER BY)

👉 SQL = způsob, jak se ptát na data
