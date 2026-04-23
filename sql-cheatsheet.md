📘 SQL Basics – Data Analyst Cheat Sheet (v10)

🧠 1. Struktura SQL dotazu
SELECT co_chci_videt
FROM odkud_beru_data
WHERE podminka
GROUP BY seskupeni
HAVING podminka_na_skupiny
ORDER BY razeni;

👉 „Vyber → odkud → filtruj → seskup → filtruj skupiny → seřaď“

⚡ 2. Logické pořadí SQL (KLÍČOVÉ)
FROM → JOIN → WHERE → GROUP BY → HAVING → SELECT → ORDER BY

👉 SELECT běží téměř na konci
👉 aliasy nefungují ve WHERE

✍️ 3. Syntaxe
, → odděluje sloupce
; → konec dotazu
poslední sloupec → bez čárky

📊 4. SELECT
SELECT * FROM orders;

🎯 5. WHERE
WHERE amount > 400

👉 filtr před agregací

🔢 6. Agregace
COUNT(*)        -- všechny řádky
COUNT(col)      -- bez NULL
SUM(amount)
AVG(amount)
MAX(amount)
MIN(amount)

📊 7. GROUP BY
SELECT customer_id, SUM(amount)
FROM orders
GROUP BY customer_id;

🔎 8. HAVING
HAVING SUM(amount) > 1000

👉 filtr po agregaci

🧠 9. WHERE vs HAVING
WHERE	HAVING
řádky	skupiny
před GROUP BY	po GROUP BY

🔗 10. JOIN
JOIN customers c ON o.customer_id = c.customer_id

👉 jen shody

⬅️ LEFT JOIN
LEFT JOIN orders o ON c.customer_id = o.customer_id

👉 vše zleva + NULL

🧠 11. LEFT JOIN – WHERE vs ON

❌ špatně:

WHERE o.amount > 400

✅ správně:

ON c.customer_id = o.customer_id
AND o.amount > 400

🧠 12. COUNT u LEFT JOIN
výraz	význam
COUNT(*)	všechny řádky
COUNT(col)	jen nenull

🧠 13. Alias pravidla
část	funguje
SELECT	✅
WHERE	❌
HAVING	⚠️ (většinou ano v MySQL)
ORDER BY	✅

🧠 14. Subquery
SELECT *
FROM (
    SELECT ..., ROW_NUMBER() AS rn
) t
WHERE rn = 1;

📦 15. Výpočty
SUM(quantity * price)

🧠 16. COALESCE
COALESCE(SUM(amount), 0)

👉 NULL → 0

🔥 17. CASE WHEN
CASE
    WHEN condition THEN 'value'
    ELSE 'value'
END

👉 může používat více sloupců
👉 vrací jeden sloupec

🧠 18. GROUP BY pravidlo

👉 každý sloupec v SELECT:

buď v GROUP BY
nebo agregace

🧠 19. JOIN logika
customers → orders → order_items → products

🔥 20. TOP per group
ROW_NUMBER() OVER (
    PARTITION BY customer
    ORDER BY revenue DESC
)

👉 WHERE rn = 1

🧠 21. ROW_NUMBER vs RANK
funkce	chování
ROW_NUMBER	rozbije remízy
RANK	zachová remízy

🚀 22. WINDOW FUNCTIONS

👉 agregace bez GROUP BY (zachová řádky)

Total
SUM(revenue) OVER (PARTITION BY customer)
Podíl (%)
revenue * 100.0 / SUM(revenue) OVER (PARTITION BY customer)
Podíl na celku
revenue / SUM(revenue) OVER ()
Running total
SUM(revenue) OVER (
    PARTITION BY customer
    ORDER BY date
)
MAX ve skupině
MAX(revenue) OVER (PARTITION BY customer)

🔥 23. LAG / LEAD
LAG(revenue) OVER (
    PARTITION BY customer
    ORDER BY date
)

👉 předchozí hodnota

LEAD(revenue) OVER (...)

👉 následující hodnota

změna
revenue - LAG(revenue) OVER (...)
% změna
(revenue - LAG(revenue) OVER (...)) / LAG(revenue) OVER (...)

⚠️ první řádek → NULL

🔥 24. CTE (WITH)
WITH name AS (
    SELECT ...
)
SELECT * FROM name;

👉 pojmenovaný mezivýsledek

vícekrokový dotaz
WITH base AS (...),
metrics AS (...)
SELECT * FROM metrics;

👉 čitelnější než subquery

🔥 25. Alias + WHERE problém

❌ nefunguje:

SELECT ..., CASE ... AS status
FROM t
WHERE status = 'active'

✅ řešení:

subquery
nebo CTE

🔥 26. Kombinace (velmi důležité)
LAG + výpočty
CASE (status)
RANK / ROW_NUMBER
TOP N (WHERE rn <= 3)

🔥 27. Activity / gap analysis
DATEDIFF(date, prev_date)

👉 počet dní mezi aktivitami

CASE
 WHEN prev_date IS NULL THEN 'new'
 WHEN days_since_prev > X THEN 'inactive'
 ELSE 'active'
END

⚡ 28. Mentální model
data → výpočet → filtr → výstup

🚀 29. Rychlé rozhodování
otázka	řešení
kolik	COUNT
celkem	SUM
změna	LAG
% změna	LAG + výpočet
top	ROW_NUMBER / RANK
podíl	SUM() OVER

🧠 30. SQL mindset

👉 SQL = popis výsledku
👉 ne postup

👉 přemýšlej:

co chci vidět
ne jak to počítat krok po kroku
