📘 SQL Basics – Data Analyst Cheat Sheet (v7)

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

👉 SELECT se píše první, ale vykonává se až téměř poslední
👉 aliasy proto nefungují ve WHERE

✍️ 3. Syntaxe
, → odděluje sloupce
; → ukončuje dotaz
mezery → jen čitelnost

📊 4. SELECT
SELECT *
FROM orders;

👉 * = všechny sloupce

🎯 5. WHERE
WHERE amount > 400

👉 filtruje řádky před agregací

🔢 6. Agregace
COUNT(*)        -- všechny řádky
COUNT(sloupec)  -- bez NULL
SUM(amount)
AVG(amount)
MAX(amount)
MIN(amount)

📊 7. GROUP BY
SELECT customer_id, SUM(amount)
FROM orders
GROUP BY customer_id;

👉 rozdělí data do skupin

🔎 8. HAVING
HAVING SUM(amount) > 1000

👉 filtruje skupiny po agregaci

🧠 9. WHERE vs HAVING
WHERE	HAVING
filtr řádků	filtr skupin
před GROUP BY	po GROUP BY

🔗 10. JOIN
JOIN customers c
    ON o.customer_id = c.customer_id

👉 jen shody

⬅️ LEFT JOIN
LEFT JOIN orders o
    ON c.customer_id = o.customer_id

👉 vše zleva + shody + NULL

🧠 11. LEFT JOIN – WHERE vs ON

❌ špatně:

WHERE o.amount > 400

✅ správně:

ON c.customer_id = o.customer_id
AND o.amount > 400

🧠 12. COUNT u LEFT JOIN
výraz	co dělá
COUNT(*)	všechny řádky
COUNT(sloupec)	jen nenull

🧠 13. Alias pravidla
část	funguje
SELECT	✅
WHERE	❌
GROUP BY	⚠️
HAVING	⚠️
ORDER BY	✅

🧠 14. Proč nejde alias ve WHERE
SELECT ..., ROW_NUMBER() AS rn
FROM ...
WHERE rn = 1 -- ❌

👉 WHERE běží dřív → rn ještě neexistuje

🧠 15. Subquery
SELECT *
FROM (
    SELECT ..., ROW_NUMBER() AS rn
    FROM sales
) t
WHERE rn = 1;

👉 mezivýsledek → pak filtr

📦 16. Výpočty
SUM(o.quantity * p.price)

👉 řádek → pak agregace

🧠 17. COALESCE
COALESCE(SUM(amount), 0)

👉 NULL → 0

🔥 18. CASE WHEN (NOVÉ)
CASE
    WHEN condition THEN 'value'
    WHEN condition THEN 'value'
    ELSE 'value'
END

👉 vytváří nový sloupec ve výsledku

🎯 Použití
CASE
    WHEN total_revenue > 1000 THEN 'VIP'
    WHEN total_revenue > 500 THEN 'medium'
    ELSE 'low'
END AS segment
⚠️ Důležité

👉 podmínky jdou shora dolů
👉 nejpřísnější vždy nahoře

🧠 19. GROUP BY pravidlo (NOVÉ)

Každý sloupec v SELECTu musí být:

buď v GROUP BY
nebo agregace
❌ špatně
SELECT customer, category, SUM(revenue)
GROUP BY customer;
✅ správně
GROUP BY customer, category

🧠 20. JOIN logika (NOVÉ)

👉 vztahy:

customers → orders → order_items → products

👉 proč:

zákazník → objednávky
objednávka → položky
položka → produkt

👉 nelze:

customers → products ❌

protože chybí vazba

🔥 21. TOP per group (MAX + JOIN)

👉 vrací všechny top (i při shodě)

🚀 22. TOP per group (ROW_NUMBER)
ROW_NUMBER() OVER (
    PARTITION BY customer
    ORDER BY revenue DESC
)

👉 WHERE rn = 1

🧠 23. ROW_NUMBER vs RANK
funkce	chování
ROW_NUMBER	rozbije remízu
RANK	zachová remízu

🔥 24. LIMIT vs ROW_NUMBER (NOVÉ)
situace	použij
jednoduchý top 1	LIMIT
komplexní logika	ROW_NUMBER

⚡ 25. Mentální model
vezmi data (FROM)
spoj (JOIN)
filtruj (WHERE)
seskup (GROUP BY)
počítej
filtruj skupiny (HAVING)
seřaď (ORDER BY)

🚀 26. Rychlé rozhodování
otázka	řešení
kolik	COUNT
kolik celkem	SUM
průměr	AVG
max	MAX
kdo nemá	LEFT JOIN + IS NULL
filtr před	WHERE
filtr po	HAVING
NULL → 0	COALESCE
top per group	ROW_NUMBER / RANK

🧠 27. SQL mindset

👉 SQL ≠ programování
👉 SQL = popis výsledku
