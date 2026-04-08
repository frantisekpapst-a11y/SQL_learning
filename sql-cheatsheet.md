# SQL Basics – Data Analyst Cheat Sheet

🧠 1. Struktura SQL dotazu (tohle je základ všeho)

👉 Každý dotaz má skoro vždy tuhle kostru:
SELECT co_chci_vidět
FROM odkud_beru_data
WHERE podmínka
GROUP BY seskupení
HAVING podmínka_na_skupiny
ORDER BY řazení;

💡 Jak to číst lidsky:
👉 „Vyber (SELECT)
z tabulky (FROM)
vyfiltruj (WHERE)
seskup (GROUP BY)
ještě filtruj skupiny (HAVING)
a seřaď (ORDER BY)“

✍️ 2. Čárky, mezery, středníky

✅ ČÁRKA ,

Používá se:
mezi sloupci v SELECT
mezi hodnotami
SELECT name, amount

❌ chyba:
SELECT name amount   -- chybí čárka

✅ STŘEDNÍK ;

👉 ukončuje celý dotaz

SELECT * FROM orders;
💡 v DB Fiddle:

můžeš mít víc dotazů pod sebou
každý musí končit ;

⚠️ POZOR – častá chyba
FROM orders
JOIN customers
ON ...
;   ← tady to ukončíš ❌

GROUP BY ...   ← už nepatří do dotazu
✅ MEZERY

👉 SQL ignoruje mezery → jsou jen pro čitelnost

Tohle je stejné:

SELECT * FROM orders;
SELECT
*
FROM
orders;

👉 používej formátování → přehlednost = základ

🧱 3. Jak vytvořit tabulku (CREATE TABLE)
CREATE TABLE orders (
  order_id INTEGER,
  customer_id INTEGER,
  amount INTEGER
);
Co to znamená:
orders = název tabulky
sloupce:
order_id → číslo
customer_id → číslo
amount → číslo

➕ 4. Jak tam dostat data
INSERT INTO orders VALUES (1, 1, 500);

👉 pořadí musí odpovídat sloupcům

📊 5. Jak to souvisí s Excel / CSV
👉 Varianta 1: CSV (nejčastější v praxi)

Excel → uložíš jako .csv

Pak:

v nástroji (Power BI, Python, SQL tool)
nebo import do DB

👉 CSV = „most mezi světy“

👉 Varianta 2: ručně (co děláš teď)
CREATE TABLE ...
INSERT INTO ...

👉 dobré na učení

👉 Varianta 3: reálná praxe

V práci:

data už existují v databázi
ty píšeš jen:
SELECT ...
FROM obrovská_tabulka

🧠 6. Jak nad tím přemýšlet (nejdůležitější)

👉 SQL není programování, ale:

➡️ popis toho, co chceš vidět

Např.:

„Chci vědět kolik utratil každý zákazník“

↓

SELECT customer, SUM(amount)
FROM orders
GROUP BY customer;

🔥 Mini shrnutí
čárky → oddělují sloupce
středník → konec dotazu
mezery → jen pro čitelnost
struktura = SELECT → FROM → WHERE → GROUP BY → ORDER BY
CREATE TABLE → vytvoření tabulky
INSERT → data

🧱 1. Vytvoření tabulky
CREATE TABLE orders (
  order_id INTEGER,
  customer_id INTEGER,
  amount INTEGER
);

➕ 2. Vložení dat
INSERT INTO orders VALUES (1, 1, 500);
INSERT INTO orders VALUES (2, 2, 300);
INSERT INTO orders VALUES (3, 1, 700);

📄 3. Základní výpis
SELECT *
FROM orders;

👉 vypíše všechny sloupce a řádky

🔍 4. Filtrace (WHERE)
SELECT *
FROM orders
WHERE amount > 400;

👉 filtruje řádky (jako filtr v Excelu), fuktruje před agregací

🔢 5. COUNT
SELECT COUNT(*)
FROM orders;

👉 počet řádků

SELECT COUNT(*)
FROM orders
WHERE customer_id = 1;

👉 počet řádků splňujících podmínku

➕ 6. SUM
SELECT SUM(amount)
FROM orders;

👉 součet hodnot

🧠 7. GROUP BY (základ)
SELECT customer_id, SUM(amount)
FROM orders
GROUP BY customer_id;

👉 agregace podle skupiny (jako kontingenčka), rozdělí data do skupin a umožní nad nimi výpočty

🧮 Agregační funkce
COUNT(*)        -- počet řádků
COUNT(sloupec)  -- ignoruje NULL
SUM(amount)     -- součet
AVG(amount)     -- průměr

📊 8. ORDER BY
SELECT customer_id, SUM(amount)
FROM orders
GROUP BY customer_id
ORDER BY SUM(amount) DESC;

👉 seřazení výsledků

🎯 9. DISTINCT
SELECT DISTINCT customer_id
FROM orders;

👉 unikátní hodnoty

🔗 10. JOIN (spojení tabulek)
SELECT *
FROM orders
JOIN customers
ON orders.customer_id = customers.customer_id;

👉 spojí data z více tabulek přes klíč
🧠 JOIN (lepší praxe – aliasy)
SELECT 
    c.name,
    o.amount
FROM orders o
JOIN customers c 
ON o.customer_id = c.customer_id;

🔥 11. JOIN + GROUP BY (klíčový pattern)
💰 Kolik utratil zákazník
SELECT
  customers.name,
  SUM(orders.amount) AS total_spent
FROM orders
JOIN customers
ON orders.customer_id = customers.customer_id
GROUP BY customers.name
ORDER BY total_spent DESC;
📦 Kolik má zákazník objednávek
SELECT
  customers.name,
  COUNT(*) AS total_orders
FROM orders
JOIN customers
ON orders.customer_id = customers.customer_id
GROUP BY customers.name
ORDER BY total_orders DESC;

⚠️ 12. COUNT(*) vs COUNT(sloupec)
COUNT(*) → počítá všechny řádky ✅ (nejčastější)
COUNT(sloupec) → počítá jen ne-NULL hodnoty

👉 doporučení:
➡️ používej hlavně COUNT(*)

🔎 HAVING – filtr skupin
SELECT 
    c.name,
    SUM(o.amount) AS total_spent
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.name
HAVING SUM(o.amount) > 1000;

👉 filtruje po agregaci

🧠 WHERE vs HAVING
WHERE	HAVING
filtr řádků	filtr skupin
před GROUP BY	po GROUP BY
nefunguje s AVG, SUM	funguje
🔢 COUNT vs COUNT(DISTINCT)
COUNT(*)                         -- všechny řádky
COUNT(DISTINCT customer_id)     -- unikátní zákazníci

⚡ Pořadí SQL
FROM
JOIN
WHERE
GROUP BY
HAVING
SELECT
ORDER BY

🧠 Klíčové principy
SELECT → co chci vidět
FROM → odkud beru data
WHERE → filtr řádků
GROUP BY → rozdělení do skupin
HAVING → filtr skupin
ORDER BY → seřazení
JOIN → spojení tabulek

vezmi data (FROM)
vyfiltruj (WHERE)
seskup (GROUP BY)
spočítej
vyfiltruj skupiny (HAVING)
seřaď (ORDER BY)
JOIN (spojování tabulek)
pokročilé filtry
práce s více tabulkami
