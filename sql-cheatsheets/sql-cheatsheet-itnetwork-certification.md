🗄️ SQL Cheatsheet — ITnetwork Lekce 1–21

MS-SQL základy • CRUD • JOIN • GROUP BY • HAVING • Transakce • View • Procedury • Triggery • Fulltext • Indexy

🎯 Praktický cheatsheet k lekcím 1–11 MS-SQL
Zaměřeno na datovou analytiku a SQL mindset.

🧠 1. Základní pojmy
Pojem	Význam
Databáze	Kolekce tabulek
Tabulka	Data v řádcích a sloupcích
Řádek	Jeden záznam
Sloupec	Jeden atribut
Primární klíč	Unikátní identifikace řádku
Cizí klíč	Odkaz na jinou tabulku
SQL	Jazyk pro práci s databází
CRUD	Create, Read, Update, Delete

🏗️ 2. CREATE TABLE
CREATE TABLE [Uzivatele]
(
    [Id] INT NOT NULL PRIMARY KEY IDENTITY,
    [Jmeno] NVARCHAR(60) NOT NULL,
    [Prijmeni] NVARCHAR(60) NOT NULL,
    [DatumNarozeni] DATE NOT NULL,
    [PocetClanku] INT NOT NULL
);

🔑 3. Datové typy
Datový typ	Použití
INT	Celá čísla
BIGINT	Velká celá čísla
DECIMAL(10,2)	Desetinná čísla
NVARCHAR(x)	Unicode text
VARCHAR(x)	Text bez Unicode
CHAR(x)	Fixní délka textu
DATE	Datum
DATETIME	Datum + čas
BIT	TRUE/FALSE

🧱 4. Důležité vlastnosti sloupců
Vlastnost	Význam
PRIMARY KEY	Unikátní identifikátor
IDENTITY	Automatické číslování
NOT NULL	Hodnota nesmí být NULL
UNIQUE	Hodnoty se nesmí opakovat
DEFAULT	Výchozí hodnota

➕ 5. INSERT INTO
Jeden řádek
INSERT INTO [Uzivatele]
(
    [Jmeno],
    [Prijmeni]
)
VALUES
(
    'Jan',
    'Novák'
);
Více řádků
INSERT INTO [Uzivatele]
(
    [Jmeno],
    [Prijmeni]
)
VALUES
    ('Jan', 'Novák'),
    ('Eva', 'Černá'),
    ('Petr', 'Malý');

🔍 6. SELECT
SELECT *
FROM [Uzivatele];
SELECT
    [Jmeno],
    [Prijmeni]
FROM [Uzivatele];

🎯 7. WHERE
SELECT *
FROM [Uzivatele]
WHERE [PocetClanku] > 10;

⚙️ 8. Operátory
Operátor	Význam
=	rovná se
!=	není rovno
>	větší
<	menší
>=	větší nebo rovno
<=	menší nebo rovno

🔗 9. AND / OR
WHERE vek > 18
AND aktivni = 1;
WHERE tarif = 'Premium'
OR tarif = 'Student';

✏️ 10. UPDATE
UPDATE [Uzivatele]
SET [PocetClanku] = 20
WHERE [Id] = 1;
UPDATE [Uzivatele]
SET [PocetClanku] = [PocetClanku] + 1
WHERE [Id] = 1;

❌ 11. DELETE
DELETE FROM [Uzivatele]
WHERE [Id] = 2;

⚠️ Bez WHERE smaže všechny řádky.

🧨 12. TRUNCATE TABLE
TRUNCATE TABLE [Uzivatele];
smaže všechna data
resetuje IDENTITY
zachová strukturu

💥 13. DROP TABLE
DROP TABLE [Uzivatele];
smaže data
smaže strukturu tabulky

🔄 14. DELETE vs TRUNCATE vs DROP
Příkaz	Data	Struktura	WHERE	Reset IDENTITY
DELETE	smaže	zachová	ANO	NE
TRUNCATE	smaže vše	zachová	NE	ANO
DROP	smaže vše	smaže	NE	ANO

🛡️ 15. SQL Injection

❌ Nebezpečné:

WHERE prijmeni = '" + prijmeni + "'

✅ Bezpečné:

WHERE prijmeni = @prijmeni

💾 16. Export / Import
Typ	Obsah
Kompletní export	struktura + data
Export struktury	CREATE TABLE
Export dat	INSERT INTO

🧩 17. SET IDENTITY_INSERT
SET IDENTITY_INSERT [Uzivatele] ON;

INSERT INTO [Uzivatele]
(
    [Id],
    [Jmeno]
)
VALUES
(
    1,
    'Jan'
);

SET IDENTITY_INSERT [Uzivatele] OFF;

📚 18. CRUD
Operace	SQL
Create	INSERT
Read	SELECT
Update	UPDATE
Delete	DELETE

🧠 19. SQL mindset

SQL říká:

Co chci získat

Ne:

Jak to databáze udělá

📊 20. ORDER BY
SELECT *
FROM orders
ORDER BY amount DESC;
Klíčové slovo	Význam
ASC	vzestupně
DESC	sestupně

🔢 21. Agregační funkce
COUNT(*)
SUM(amount)
AVG(amount)
MAX(amount)
MIN(amount)

🧮 22. GROUP BY
SELECT
    customer_id,
    SUM(amount)
FROM orders
GROUP BY customer_id;

👉 Každý sloupec v SELECT musí být:

v GROUP BY
nebo agregace

🔍 23. HAVING
SELECT
    customer_id,
    SUM(amount) AS revenue
FROM orders
GROUP BY customer_id
HAVING SUM(amount) > 1000;

👉 filtruje agregace

⚡ 24. WHERE vs HAVING
WHERE	HAVING
filtruje řádky	filtruje skupiny
před GROUP BY	po GROUP BY

🔗 25. JOIN
SELECT
    c.customer_name,
    o.amount
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id;

👉 pouze shody

⬅️ 26. LEFT JOIN
SELECT
    c.customer_name,
    o.amount
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id;

👉 vše zleva + shody zprava

➡️ 27. RIGHT JOIN

👉 vše zprava + shody zleva

Používá se méně často.

🧠 28. LEFT JOIN + WHERE problém

❌ Může rozbít LEFT JOIN:

WHERE o.amount > 1000

✅ Zachová LEFT JOIN:

ON c.customer_id = o.customer_id
AND o.amount > 1000

🔢 29. COUNT(*) vs COUNT(sloupec)
COUNT(*)

počítá řádky

COUNT(o.order_id)

počítá pouze nenull hodnoty

👉 důležité u LEFT JOIN

🧩 30. COALESCE
COALESCE(total_orders, 0)

👉 NULL → 0

🏷️ 31. Aliasy
FROM customers c
JOIN orders o
SELECT c.name

👉 zpřehlednění dotazu

⚠️ 32. Ambiguous column name

❌

WHERE Id = customer_id

✅

WHERE customers.Id = orders.customer_id

nebo:

WHERE c.Id = o.customer_id

🔄 33. Vazba 1:N
1 zákazník → více objednávek

Cizí klíč je na straně N.

🔀 34. Vazba M:N
student ↔ kurz

Řeší se přes:

vazební tabulku

Např.:

student_courses

🧱 35. Vazební tabulka
CREATE TABLE student_courses (
    student_id INT,
    course_id INT
);

🔗 36. JOIN přes vazební tabulku
SELECT
    s.name,
    c.course_name
FROM students s
JOIN student_courses sc
    ON s.student_id = sc.student_id
JOIN courses c
    ON sc.course_id = c.course_id;

🧠 37. Poddotaz (Subquery)
SELECT *
FROM orders
WHERE amount > (
    SELECT AVG(amount)
    FROM orders
);

👉 dotaz uvnitř dotazu

🔄 38. Korelovaný poddotaz
SELECT *
FROM customers c
WHERE EXISTS (
    SELECT *
    FROM orders o
    WHERE c.customer_id = o.customer_id
);

👉 vnitřní dotaz používá vnější dotaz

🔍 39. EXISTS / NOT EXISTS
EXISTS

testuje existenci řádku

NOT EXISTS

testuje neexistenci

📋 40. IN
WHERE customer_id IN (
    SELECT customer_id
    FROM orders
)

👉 práce s více řádky

📊 41. ALL / ANY
ALL

podmínku musí splnit všechny hodnoty

ANY

stačí jedna hodnota

🧱 42. Poddotaz jako tabulka
SELECT *
FROM (
    SELECT
        customer_id,
        SUM(amount) AS revenue
    FROM orders
    GROUP BY customer_id
) t

👉 mezivýsledek jako dočasná tabulka

🚀 43. CTE (WITH)
WITH revenue_by_customer AS (
    SELECT
        customer_id,
        SUM(amount) AS revenue
    FROM orders
    GROUP BY customer_id
)

SELECT *
FROM revenue_by_customer;

👉 pojmenovaný mezivýsledek

🧠 44. Subquery vs CTE
Subquery	CTE
uvnitř dotazu	pojmenovaný blok
kratší	čitelnější
vhodné pro jednoduché věci	vhodné pro více kroků

🔀 45. CROSS JOIN
SELECT *
FROM A
CROSS JOIN B;

👉 všechny kombinace všech řádků

🏗️ 46. Logické pořadí SQL
FROM
JOIN
ON
WHERE
GROUP BY
HAVING
SELECT
ORDER BY

👉 SELECT běží téměř na konci

⚡ 47. Mentální model analytického SQL
data
↓
JOIN
↓
mezivýpočet
↓
GROUP BY
↓
filtr
↓
výstup

🚀 48. Nejčastější analytické patterny
Úloha	Řešení
zákazníci bez objednávky	LEFT JOIN + IS NULL
NULL → 0	COALESCE
revenue zákazníka	SUM + GROUP BY
existence záznamu	EXISTS
práce s více hodnotami	IN
mezivýsledek	CTE
top hodnota	MAX
průměr	AVG

🧠 49. Největší posuny v SQL mindsetu
✅ SQL = práce s datasety
✅ JOIN = spojování datasetů
✅ WHERE = filtrování výsledku
✅ ON = pravidla spojování
✅ GROUP BY = agregace
✅ CTE = rozdělení problému na kroky
✅ SQL není programování krok po kroku

🧠 50. ALTER TABLE
Přidání sloupce
ALTER TABLE [Komentare]
ADD [Palce] INT;
Změna datového typu
ALTER TABLE [Komentare]
ALTER COLUMN [Palce] BIGINT;
Odebrání sloupce
ALTER TABLE [Komentare]
DROP COLUMN [Palce];

🔢 51. DBCC CHECKIDENT

Změna počáteční hodnoty IDENTITY:

DBCC CHECKIDENT ('Uzivatele', reseed, 1233);

👉 další vložené ID bude 1234

🔄 52. Transakce
BEGIN TRANSACTION;

UPDATE accounts
SET balance = balance - 100
WHERE id = 1;

UPDATE accounts
SET balance = balance + 100
WHERE id = 2;

COMMIT TRANSACTION;

👉 buď proběhne vše
👉 nebo nic

❌ 53. ROLLBACK
ROLLBACK TRANSACTION;

👉 vrátí databázi do původního stavu

⚡ 54. COMMIT
COMMIT TRANSACTION;

👉 potvrdí změny

🧠 55. ACID
Vlastnost	Význam
Atomicity	vše nebo nic
Consistency	konzistence dat
Isolation	oddělení transakcí
Durability	trvalost dat

👁️ 56. VIEW
CREATE VIEW AktivniUzivatele AS
SELECT *
FROM users
WHERE active = 1;

👉 virtuální tabulka
👉 uložený SELECT
👉 data se generují až při spuštění

🧩 57. Výhody VIEW

✅ zjednodušení složitých dotazů
✅ zapouzdření JOINů
✅ lepší čitelnost
✅ řízení oprávnění

⚡ 58. Databázový index

👉 speciální struktura pro rychlé vyhledávání

CREATE INDEX I1
ON [Clanky] ([Url]);

🚀 59. Kdy použít index

✅ často používané WHERE
✅ JOIN sloupce
✅ časté filtrování

❌ neindexovat vše bez důvodu

⚠️ 60. Nevýhoda indexů

👉 zpomalují:

INSERT
UPDATE
DELETE

protože databáze musí indexy aktualizovat

🔗 61. Vícesloupcový index
CREATE INDEX idx_user
ON users(first_name, last_name);

👉 optimalizace hledání přes více sloupců

🧱 62. Normalizace

👉 rozdělení dat do správných tabulek

Cíl:

čistá data
méně duplicit
lepší rozšiřitelnost

💥 63. Denormalizace

👉 úmyslné porušení normalizace kvůli výkonu

Používat:

opatrně
až když je to opravdu potřeba

🔍 64. HAVING
SELECT
    customer_id,
    SUM(amount)
FROM orders
GROUP BY customer_id
HAVING SUM(amount) > 1000;

👉 filtruje agregované skupiny

⚡ 65. WHERE vs HAVING
WHERE	HAVING
filtruje řádky	filtruje skupiny
před GROUP BY	po GROUP BY
neumí agregace	umí agregace

🧠 66. Logické pořadí SELECT
FROM
JOIN
ON
WHERE
GROUP BY
HAVING
SELECT
ORDER BY

👉 alias ze SELECT ještě v HAVING neexistuje

⚙️ 67. Trigger

👉 automaticky spuštěný kód při změně dat

Typy:

INSERT
UPDATE
DELETE

🔥 68. AFTER Trigger
AFTER INSERT
AFTER UPDATE
AFTER DELETE

👉 spustí se po operaci

🔄 69. INSTEAD OF Trigger

👉 nahradí původní operaci

INSTEAD OF INSERT

📥 70. inserted a deleted
Pseudotabulka	Obsah
inserted	nové hodnoty
deleted	staré hodnoty

🧠 71. DECLARE
DECLARE @pocet INT;

👉 deklarace lokální proměnné

⚙️ 72. IF ELSE
IF @pocet > 10
    SELECT 'OK';
ELSE
    SELECT 'Malo';

👉 větvení logiky

📦 73. Stored Procedure
CREATE PROCEDURE GetUsers
AS
BEGIN
    SELECT * FROM users;
END;

👉 uložený program na serveru

▶️ 74. EXEC
EXEC GetUsers;

👉 spuštění procedury

✏️ 75. ALTER PROCEDURE
ALTER PROCEDURE GetUsers
AS
BEGIN
    SELECT id, name FROM users;
END;

👉 změna procedury

❌ 76. DROP PROCEDURE
DROP PROCEDURE GetUsers;

📥 77. Parametry procedury
CREATE PROCEDURE AddUser
    @Name NVARCHAR(50)
AS
BEGIN
    ...
END;

📤 78. OUTPUT parametr
@Count INT OUT

👉 vrací hodnotu zpět

🧠 79. TRY CATCH
BEGIN TRY
    SELECT 1/0;
END TRY
BEGIN CATCH
    SELECT ERROR_MESSAGE();
END CATCH;

👉 zachytávání chyb

👤 80. LOGIN vs USER
LOGIN	USER
přístup k serveru	přístup k databázi

🔐 81. GRANT
GRANT SELECT, EXECUTE
ON DATABASE::Firma
TO test;

👉 přidělení oprávnění

🔄 82. EXECUTE AS USER
EXECUTE AS USER='test';

👉 přepnutí uživatele

↩️ 83. REVERT
REVERT;

👉 návrat k původnímu uživateli

🔍 84. LIKE
WHERE email LIKE '%@gmail.com'
Symbol	Význam
%	libovolný počet znaků
_	jeden znak

🚀 85. Fulltextové vyhledávání (FTS)

👉 rychlé vyhledávání v textu
👉 relevance výsledků
👉 práce s významem slov

🧱 86. Fulltextový katalog
CREATE FULLTEXT CATALOG ClankyCatalog;

👉 kontejner pro fulltextové indexy

🔎 87. Fulltextový index
CREATE FULLTEXT INDEX ON [Clanky]
(
    [Obsah] LANGUAGE 1029
)
KEY INDEX [FulltextId]
ON [ClankyCatalog];

👉 speciální index pro textové hledání

🧠 88. CONTAINS
WHERE CONTAINS([Obsah], 'hra')

👉 přesná fulltext shoda

🧠 89. FREETEXT
WHERE FREETEXT([Obsah], 'hra')

👉 významové hledání
👉 pracuje se skloňováním

📊 90. CONTAINSTABLE / FREETEXTTABLE

Vrací:

KEY
RANK
SELECT *
FROM CONTAINSTABLE(...)

🏆 91. RANK

👉 relevance výsledku

Čím vyšší:

tím relevantnější výsledek

🌍 92. LANGUAGE 1029
LANGUAGE 1029

👉 český jazyk

Umožňuje:

skloňování
časování
práci s kořeny slov

🧠 93. SQL mindset — pokročilejší úroveň

✅ databáze = optimalizace práce s datasety
✅ indexy = výkon
✅ transakce = konzistence
✅ procedury = zapouzdření logiky
✅ triggery = automatické reakce
✅ fulltext = inteligentní vyhledávání
✅ SQL není jen SELECT 🙂

