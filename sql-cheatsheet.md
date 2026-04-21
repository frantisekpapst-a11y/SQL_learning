📘 SQL Basics – Data Analyst Cheat Sheet (v9)

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
mezery → čitelnost

📊 4. SELECT
SELECT * FROM orders;

🎯 5. WHERE
WHERE amount > 400

🔢 6. Agregace
COUNT(*)      -- všechny řádky
COUNT(col)    -- bez NULL
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

🧠 9. WHERE vs HAVING
WHERE	HAVING
řádky	skupiny
před GROUP BY	po GROUP BY

🔗 10. JOIN
JOIN customers c ON o.customer_id = c.customer_id
⬅️ LEFT JOIN
LEFT JOIN orders o ON c.customer_id = o.customer_id

🧠 11. LEFT JOIN – WHERE vs ON

❌

WHERE o.amount > 400

✅

ON c.customer_id = o.customer_id AND o.amount > 400

🧠 12. COUNT u LEFT JOIN
výraz	význam
COUNT(*)	všechny řádky
COUNT(col)	jen nenull

🧠 13. Alias pravidla
část	funguje
SELECT	✅
WHERE	❌
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

🔥 17. CASE WHEN
CASE
    WHEN condition THEN 'value'
    ELSE 'value'
END

🧠 18. GROUP BY pravidlo

👉 každý sloupec:

v GROUP BY
nebo agregace

🧠 19. JOIN logika
customers → orders → order_items → products

🔥 20. TOP per group
ROW_NUMBER() OVER (
    PARTITION BY customer
    ORDER BY revenue DESC
)

🧠 21. ROW_NUMBER vs RANK
funkce	chování
ROW_NUMBER	bez remíz
RANK	remízy

🚀 22. WINDOW FUNCTIONS
🎯 Total vedle řádku
SUM(revenue) OVER (PARTITION BY customer)
🎯 Podíl (%)
revenue * 100.0 / SUM(revenue) OVER (PARTITION BY customer)
🎯 Podíl na celku
revenue / SUM(revenue) OVER ()
🎯 Running total
SUM(revenue) OVER (
    PARTITION BY customer
    ORDER BY date
)
🎯 MAX ve skupině
MAX(revenue) OVER (PARTITION BY customer)
🎯 Rozdíl od maxima
MAX(revenue) OVER (PARTITION BY customer) - revenue
🧠 PARTITION BY

👉 určuje kontext výpočtu

🔥 23. LAG / LEAD (NOVÉ)
🎯 Předchozí hodnota
LAG(revenue) OVER (
    PARTITION BY customer
    ORDER BY date
)
🎯 Následující hodnota
LEAD(revenue) OVER (
    PARTITION BY customer
    ORDER BY date
)
🎯 Změna
revenue - LAG(revenue) OVER (...)
🎯 % změna
(revenue - LAG(revenue) OVER (...))
/
LAG(revenue) OVER (...)
⚠️ První řádek

👉 NULL (není předchozí hodnota)

🔥 24. CTE (WITH)
🎯 Syntaxe
WITH name AS (
    SELECT ...
)
SELECT * FROM name;
🧠 Co to je

👉 pojmenovaný mezivýsledek

🎯 Více kroků
WITH base AS (...),
metrics AS (...)
SELECT * FROM metrics;
🧠 Kdy použít

👉 složitější dotaz
👉 více kroků
👉 lepší čitelnost

🔥 25. Kombinace (velmi důležité)
LAG + výpočty
revenue - prev_revenue
Ranking
ROW_NUMBER() OVER (ORDER BY revenue_change DESC)
TOP N
WHERE rn <= 3
TOP s remízami
RANK()

⚡ 26. Mentální model
data → výpočet → filtr → výstup

🚀 27. Rychlé rozhodování
otázka	řešení
kolik	COUNT
celkem	SUM
změna	LAG
% změna	LAG + výpočet
top	ROW_NUMBER / RANK
podíl	SUM() OVER

🧠 28. SQL mindset

👉 SQL = popis výsledku
👉 ne postup
