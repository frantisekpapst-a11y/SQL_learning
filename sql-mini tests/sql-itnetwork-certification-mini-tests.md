📘 SQL Mini Tests — Lekce 1–11

📘 Lekce 1 — CREATE DATABASE / CREATE TABLE

❓ Otázky
Jaké základní datové typy jsme používali?
Co dělá IDENTITY?
Co znamená NOT NULL?
K čemu slouží PRIMARY KEY?
Jaký SQL příkaz vytváří tabulku?

✅ Odpovědi
INT, NVARCHAR, DATE
Automatické číslování řádků
Hodnota nesmí být prázdná (NULL)
Unikátní identifikace řádku
CREATE TABLE

📘 Lekce 2 — INSERT / UPDATE / DELETE

❓ Otázky
Proč při INSERT často neuvádíme Id?
Co udělá tento dotaz?
UPDATE Knihy
SET PocetStran = 500;
Jaký je rozdíl mezi DELETE a TRUNCATE TABLE?
Co je SQL Injection?
Co znamená CRUD?

✅ Odpovědi
IDENTITY ho vyplní automaticky
Změní hodnotu u všech řádků
DELETE může mazat podmíněně, TRUNCATE smaže vše
Manipulace SQL dotazu útočníkem
Create, Read, Update, Delete

📘 Lekce 3 — Export databáze

❓ Otázky
Jaké existují typy exportu?
K čemu slouží SET IDENTITY_INSERT?
Co znamená export struktury?
Co vrátí:
SELECT *
FROM Uzivatele;
Jaký je rozdíl mezi DELETE a TRUNCATE?
Jakým příkazem vkládáme data?
Jakým příkazem upravujeme data?
Proč je důležité používat WHERE?
Co znamená CRUD?

✅ Odpovědi
Kompletní export, export struktury, export dat
Ruční vkládání hodnot do IDENTITY
Export pouze struktury tabulek
Všechny řádky a sloupce
DELETE může mít WHERE, TRUNCATE smaže vše a resetuje IDENTITY
INSERT INTO
UPDATE
Aby se neupravily všechny řádky
Create, Read, Update, Delete

📘 Lekce 4 — Import databáze

❓ Otázky
Co je .dacpac?
Jaký je rozdíl mezi importem dat a importem tabulky?
Proč používáme SET IDENTITY_INSERT ON?
Co dělá příkaz USE?
Co udělá DROP TABLE?
Jaký příkaz vytváří tabulku?
Jaký příkaz smaže tabulku?
Jaký příkaz smaže data?
Co znamená CRUD?

✅ Odpovědi
Soubor databáze (struktura + data)
Import dat plní tabulku, import tabulky ji vytváří
Aby šlo ručně nastavovat ID
Přepne databázi
Smaže tabulku i strukturu
CREATE TABLE
DROP TABLE
DELETE nebo TRUNCATE
Create, Read, Update, Delete

📘 Lekce 5 — SQL mindset

❓ Otázky
Co je hlavní princip SQL?
Co dělá:
TRUNCATE TABLE Uzivatele;
Co NEmůžeme importovat?
Jaký je rozdíl mezi SQL a klasickým programováním?
Co znamená CRUD?

✅ Odpovědi
Říkáme databázi co chceme získat
Smaže všechna data z tabulky
Databázi s daty bez tabulek
SQL popisuje výsledek, ne postup
Create, Read, Update, Delete

📘 Lekce 6 — SELECT / WHERE / LIKE / IN / BETWEEN

❓ Otázky
Co dělá SELECT *?
K čemu slouží WHERE?
Jaký je rozdíl mezi AND a OR?
Co dělá LIKE '%Samsung%'?
Kdy použijeme IN?
K čemu slouží BETWEEN?
Co dělá TOP 5?
Co znamená ORDER BY price DESC?
Jaký je rozdíl mezi ASC a DESC?
K čemu slouží alias?

✅ Odpovědi
Vrátí všechny sloupce
Filtruje řádky
AND = obě podmínky, OR = alespoň jedna
Hledá text obsahující Samsung
Pro více hodnot
Pro rozsah hodnot
Vrátí prvních 5 řádků
Seřadí podle ceny sestupně
ASC vzestupně, DESC sestupně
Zkrácení / přejmenování názvu

📘 Lekce 7 — DISTINCT / NULL / Datové typy

❓ Otázky
Co znamená NULL?
Je NULL stejné jako 0?
Co znamená NOT NULL?
K čemu slouží UNIQUE?
Co dělá IDENTITY?
Jaký je rozdíl mezi VARCHAR a NVARCHAR?
Co znamená DEFAULT?
K čemu slouží datový typ BIT?
Může mít PRIMARY KEY hodnotu NULL?
Co dělá DISTINCT?

✅ Odpovědi
Nezadaná hodnota
Ne
Hodnota musí existovat
Zakáže duplicity
Automatické číslování
NVARCHAR podporuje Unicode
Výchozí hodnota
TRUE/FALSE
Ne
Vrátí unikátní hodnoty

📘 Lekce 8 — GROUP BY / Agregace

❓ Otázky
Co dělá COUNT(*)?
Co dělá AVG()?
Co dělá SUM()?
Jaký je rozdíl mezi MAX() a MIN()?
K čemu slouží GROUP BY?
Co filtruje HAVING?
Jaký je rozdíl mezi WHERE a HAVING?
Proč musí být sloupce v SELECT buď agregace nebo GROUP BY?
Co vrátí:
COUNT(column_name)
Co znamená agregace?

✅ Odpovědi
Počet řádků
Průměr
Součet
Nejvyšší vs nejnižší hodnota
Seskupování dat
Agregované skupiny
WHERE filtruje řádky, HAVING skupiny
Aby SQL vědělo jak data seskupit
Počet nenull hodnot
Shrnutí více řádků do jedné hodnoty

📘 Lekce 9 — JOIN

❓ Otázky
K čemu slouží JOIN?
Jaký je rozdíl mezi INNER JOIN a LEFT JOIN?
Co znamená LEFT JOIN?
Jak najdeme zákazníky bez objednávky?
Proč může COUNT(*) rozbít LEFT JOIN?
Proč je lepší COUNT(order_id)?
Co dělá COALESCE?
Jaký je rozdíl mezi podmínkou v ON a WHERE?
Co znamená alias?
Co znamená „Ambiguous column name“?

✅ Odpovědi
Pro spojování tabulek
INNER vrací jen shody, LEFT vše zleva
Všechny řádky z levé tabulky + shody
LEFT JOIN + IS NULL
Počítá i null řádky
Počítá jen existující hodnoty
Nahrazuje NULL jinou hodnotou
ON ovlivňuje spojování, WHERE filtruje výsledek
Zkrácení názvu tabulky/sloupce
SQL neví, ke které tabulce sloupec patří

📘 Lekce 10 — M:N a více JOINů

❓ Otázky
Co je vazba M:N?
Jak řeší databáze M:N vztah?
Co je vazební tabulka?
Proč nejde M:N propojit přímo?
Co dělá první JOIN ve více JOIN dotazu?
Proč používáme aliasy u složitých JOINů?
Jak najdeme studenty bez kurzu?
Proč používáme LEFT JOIN u „bez objednávky / bez kurzu“?
Co vrací COUNT při LEFT JOIN a NULL?
Kdy použijeme více JOINů?

✅ Odpovědi
Více k více
Přes vazební tabulku
Tabulka propojující dvě tabulky
Chybí společný atribut
Vytvoří první propojený dataset
Přehlednost
LEFT JOIN + IS NULL
Aby zůstaly i nepropojené řádky
COUNT(column) ignoruje NULL
Když potřebujeme více propojených tabulek

📘 Lekce 11 — Poddotazy / CTE

❓ Otázky
Co je poddotaz?
Kdy se vykoná vnitřní dotaz?
Co znamená korelovaný poddotaz?
Kdy použijeme IN?
Co dělá EXISTS?
Co dělá NOT EXISTS?
Co vrací poddotaz v FROM?
Jaký je rozdíl mezi poddotazem a CTE?
Co znamená WITH?
Co dělá CROSS JOIN?

✅ Odpovědi
Dotaz uvnitř dotazu
Před vnějším dotazem
Vnitřní dotaz používá vnější dotaz
Když poddotaz vrací více hodnot
Testuje existenci řádku
Testuje neexistenci
Dočasnou tabulku
CTE je čitelnější pojmenovaný mezivýsledek
Definice CTE
Spojí všechny kombinace řádků

📘 Lekce 12 — ALTER TABLE / Transakce / VIEW

❓ Otázky
K čemu slouží ALTER TABLE?
Jak přidáš nový sloupec?
Co dělá ALTER COLUMN?
Jak odstraníš sloupec?
Co je transakce?
Co dělá COMMIT?
Co dělá ROLLBACK?
Co znamená Atomicity v ACID?
Co je VIEW?
Ukládá VIEW fyzicky data?
Jaká je hlavní výhoda VIEW?

✅ Odpovědi
Úprava struktury tabulky
ADD
Změna datového typu/sloupce
DROP COLUMN
Skupina operací provedená jako celek
Potvrdí změny
Vrátí změny zpět
Vše nebo nic
Virtuální tabulka / uložený SELECT
Ne
Zjednodušení složitých dotazů

📘 Lekce 13 — Indexy / Normalizace

❓ Otázky
K čemu slouží index?
Co je full scan?
Kdy použít index?
Jaká je nevýhoda indexů?
K čemu slouží vícesloupcový index?
Co je normalizace?
Co je denormalizace?
Proč může být denormalizace problém?

✅ Odpovědi
Zrychlení čtení dat
Čtení celé tabulky
Při častém WHERE/JOIN
Zpomalují INSERT/UPDATE/DELETE
Vyhledávání přes více sloupců
Rozdělení dat do správných tabulek
Úmyslné porušení normalizace
Duplicitní/nečistá data

📘 Lekce 14 — HAVING

❓ Otázky
Kdy se používá HAVING?
Jaký je rozdíl mezi WHERE a HAVING?
Proč WHERE neumí agregační funkce?
Kdy se vykonává HAVING?
Co filtruje HAVING?
Co je výkonnější — WHERE nebo HAVING?
Funguje alias ze SELECT uvnitř HAVING?
Proč nefunguje alias v HAVING?

✅ Odpovědi
Při filtrování agregovaných skupin
WHERE filtruje řádky, HAVING skupiny
Protože agregace vzniká až po GROUP BY
Po GROUP BY
Skupiny
WHERE
Ne
SELECT se vykonává až po HAVING

📘 Lekce 15 — Triggery

❓ Otázky
Co je trigger?
Jaké jsou hlavní typy triggerů?
Jaký je rozdíl mezi AFTER a INSTEAD OF?
Co obsahuje inserted?
Co obsahuje deleted?
Jak deklaruješ lokální proměnnou?
K čemu slouží SET?
Jak funguje IF ELSE?
Kdy se trigger automaticky spustí?
Proč mohou být triggery nebezpečné?

✅ Odpovědi
Automaticky spuštěný kód při změně dat
INSERT / UPDATE / DELETE
AFTER běží po operaci, INSTEAD OF ji nahrazuje
Nové hodnoty
Staré hodnoty
DECLARE
Nastavení hodnoty proměnné
Větvení logiky
Při databázové události
Mohou komplikovat výkon a debugging

📘 Lekce 16 — Stored Procedures

❓ Otázky
Co je uložená procedura?
Jak spustíš proceduru?
Jaký je rozdíl mezi CREATE a ALTER PROCEDURE?
Co je vstupní parametr?
Co je OUTPUT parametr?
K čemu slouží TRY CATCH?
Co vrací ERROR_MESSAGE()?
Jaká je výhoda procedur?
Kde se procedury ukládají?
Co dělá DROP PROCEDURE?

✅ Odpovědi
Uložený program na serveru
EXEC
CREATE vytváří, ALTER upravuje
Předává hodnotu do procedury
Vrací hodnotu zpět
Zachytávání chyb
Text chyby
Zapouzdření logiky a výkon
V databázi
Smaže proceduru

📘 Lekce 17 — Transakce

❓ Otázky
Co je transakce?
Co dělá COMMIT?
Co dělá ROLLBACK?
Co znamená ACID?
Co znamená Consistency?
Co znamená Isolation?
Co znamená Durability?
Proč jsou transakce důležité?

✅ Odpovědi
Skupina operací jako jeden celek
Potvrdí změny
Vrátí změny zpět
Vlastnosti správné transakce
Konzistence dat
Oddělení transakcí
Trvalost změn
Zajišťují správnost dat

📘 Lekce 19 — Uživatelé a oprávnění

❓ Otázky
Jaký je rozdíl mezi LOGIN a USER?
K čemu slouží GRANT?
Co dovoluje SELECT oprávnění?
Co dělá EXECUTE AS USER?
Proč jsou oprávnění důležitá?
Co dělá REVERT?
Může existovat LOGIN bez USERa?
Co dělá CREATE USER?

✅ Odpovědi
LOGIN = server, USER = databáze
Přidělení oprávnění
Čtení dat
Přepne kontext uživatele
Bezpečnost databáze
Návrat k původnímu uživateli
Ano
Vytvoří databázového uživatele

📘 Lekce 20 — LIKE / Fulltext Search

❓ Otázky
Co znamená % v LIKE?
Co znamená _ v LIKE?
Proč LIKE není vhodný pro velké texty?
Jaká je hlavní výhoda fulltextu?
Co je fulltextové vyhledávání?

Co vrátí:

LIKE 'D____'
Co umožňuje relevance výsledků?
Jaký je rozdíl mezi LIKE a FTS?

✅ Odpovědi
Libovolný počet znaků
Jeden znak
Je pomalý
Rychlost a relevance
Inteligentní vyhledávání textu
Pětipísmenné hodnoty začínající na D
Seřazení podle shody
FTS chápe význam slov

📘 Lekce 21 — Fulltext Search 2

❓ Otázky
Co je fulltextový index?
Proč je potřeba unique index?
Jaký je rozdíl mezi CONTAINS a FREETEXT?
Co vrací CONTAINSTABLE?
Co znamená RANK?
Co dělá LANGUAGE 1029?
Co umožňuje český jazyk ve fulltextu?
Jaký je rozdíl mezi CONTAINSTABLE a FREETEXTTABLE?
Co znamená vyšší RANK?
Kolik fulltext indexů může mít tabulka?

✅ Odpovědi
Speciální index pro FTS
Pro interní identifikaci řádků
CONTAINS = přesná shoda, FREETEXT = význam
KEY a RANK
Relevance výsledku
Nastaví český jazyk
Skloňování a kořeny slov
CONTAINS = přesná shoda, FREETEXT = významová
Vyšší relevance
Maximálně jeden
