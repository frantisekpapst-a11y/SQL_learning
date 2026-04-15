📘 SQL Basics – Data Analyst Cheat Sheet (v6)

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
COUNT(*)
COUNT(sloupec)
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
INNER JOIN
JOIN customers c
ON o.customer_id = c.customer_id

👉 jen shody

LEFT JOIN
LEFT JOIN orders o
ON c.customer_id = o.customer_id

👉 vše zleva + shody zprava + NULL

🧠 11. LEFT JOIN – WHERE vs ON

👉 filtr v WHERE může zrušit LEFT JOIN

-- ❌
WHERE o.amount > 400
-- ✅
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

👉 alias vzniká až v SELECT

🧠 14. Proč nejde alias ve WHERE
SELECT ..., ROW_NUMBER() AS rn
FROM ...
WHERE rn = 1  -- ❌

👉 protože:

WHERE běží dřív než SELECT
rn ještě neexistuje

🧠 15. Subquery (důležité!)
SELECT *
FROM (
    SELECT ..., ROW_NUMBER() AS rn
    FROM sales
) t
WHERE rn = 1;

👉 vytvoříš mezivýsledek a pak filtruješ

📦 16. Výpočty
SUM(o.quantity * p.price)

👉 nejdřív řádek → pak agregace

🧠 17. COALESCE
COALESCE(SUM(amount), 0)

👉 NULL → 0

🔥 18. TOP per group (MAX + JOIN)
WITH t AS (
    SELECT customer, category, SUM(revenue) AS total
    FROM sales
    GROUP BY customer, category
)
SELECT *
FROM t
JOIN (
    SELECT customer, MAX(total) AS max_total
    FROM t
    GROUP BY customer
) m
ON t.customer = m.customer
AND t.total = m.max_total;

👉 vrací všechny top (i při shodě)

🚀 19. TOP per group (ROW_NUMBER)
SELECT *
FROM (
    SELECT *,
        ROW_NUMBER() OVER (
            PARTITION BY customer
            ORDER BY revenue DESC
        ) AS rn
    FROM sales
) t
WHERE rn = 1;

👉 vrací jen 1 řádek na skupinu

🧠 20. ROW_NUMBER vs RANK
funkce	chování
ROW_NUMBER	vždy 1,2,3 → rozbije remízu
RANK	stejné hodnoty = stejné pořadí

🔥 21. RANK (vrátí remízy)
RANK() OVER (
    PARTITION BY customer
    ORDER BY revenue DESC
)

👉 WHERE rank = 1 → více řádků při shodě

⚡ 22. Mentální model
vezmi data (FROM)
spoj (JOIN)
filtruj (WHERE)
seskup (GROUP BY)
počítej
filtruj skupiny (HAVING)
seřaď

🚀 23. Rychlé rozhodování
otázka	řešení
kolik	COUNT
kolik celkem	SUM
průměr	AVG
max	MAX
kdo nemá	LEFT JOIN + IS NULL
filtr před	WHERE
filtr po	HAVING
NULL → 0	COALESCE
top per group	ROW_NUMBER / MAX + JOIN

🧠 24. SQL mindset

👉 SQL = popis výsledku, ne postup
