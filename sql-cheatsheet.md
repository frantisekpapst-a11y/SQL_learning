📘 SQL Basics – Data Analyst Cheat Sheet (v8)

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

👉 SELECT se vykonává až téměř na konci
👉 aliasy nefungují ve WHERE

✍️ 3. Syntaxe
, → odděluje sloupce
; → konec dotazu
mezery → čitelnost

📊 4. SELECT
SELECT * FROM orders;

👉 všechny sloupce

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

🧠 9. WHERE vs HAVING
WHERE	HAVING
řádky	skupiny
před GROUP BY	po GROUP BY

🔗 10. JOIN
JOIN customers c
ON o.customer_id = c.customer_id

👉 jen shody

⬅️ LEFT JOIN
LEFT JOIN orders o
ON c.customer_id = o.customer_id

👉 vše zleva + NULL

🧠 11. LEFT JOIN – WHERE vs ON

❌ špatně:

WHERE o.amount > 400

✅ správně:

ON c.customer_id = o.customer_id AND o.amount > 400

🧠 12. COUNT u LEFT JOIN
výraz	význam
COUNT(*)	všechny řádky
COUNT(col)	jen nenull

🧠 13. Alias pravidla
část	funguje
SELECT	✅
WHERE	❌
GROUP BY	⚠️
HAVING	⚠️
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
    WHEN condition THEN 'value'
    ELSE 'value'
END

🧠 18. GROUP BY pravidlo

👉 každý sloupec v SELECT:

v GROUP BY
nebo agregace

🧠 19. JOIN logika
customers → orders → order_items → products

🔥 20. TOP per group
ROW_NUMBER
ROW_NUMBER() OVER (
    PARTITION BY customer
    ORDER BY revenue DESC
)

🧠 21. ROW_NUMBER vs RANK
funkce	chování
ROW_NUMBER	bez remíz
RANK	remízy

🚀 22. WINDOW FUNCTIONS (NOVÉ)
🧠 Základ
SUM(revenue) OVER (PARTITION BY customer)

👉 agregace bez GROUP BY
👉 zachová řádky

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

👉 nutný ORDER BY

🎯 MAX v rámci skupiny
MAX(revenue) OVER (PARTITION BY customer)
🎯 Rozdíl od maxima
MAX(revenue) OVER (PARTITION BY customer) - revenue
🧠 PARTITION BY

👉 určuje „vůči čemu počítám“

výraz	význam
PARTITION BY customer	v rámci zákazníka
PARTITION BY category	v rámci kategorie
OVER ()	celá tabulka
🧠 ORDER BY v okně

👉 určuje pořadí (např. running total)

⚡ 23. Mentální model
FROM → JOIN → WHERE → GROUP BY → HAVING → SELECT → ORDER BY

🚀 24. Rychlé rozhodování
otázka	řešení
kolik	COUNT
celkem	SUM
průměr	AVG
max	MAX
kdo nemá	LEFT JOIN + IS NULL
NULL → 0	COALESCE
top	ROW_NUMBER / RANK
podíl	SUM() OVER
running total	SUM() OVER + ORDER

🧠 25. SQL mindset

👉 SQL = popis výsledku
👉 ne postup
