🗄️ SQL Cheatsheet — ITnetwork Lekce 1–5
MS-SQL základy • CRUD • Export • Import • Databázové myšlení

🎯 Praktický cheatsheet k prvním 5 lekcím MS-SQL
Zaměřeno na úplné základy databází a práci s daty.

🧠 1. Základní pojmy
Pojem	Význam
Databáze	Kolekce tabulek
Tabulka	Data v řádcích a sloupcích
Řádek	Jeden záznam
Sloupec	Jeden atribut
Primární klíč	Unikátní identifikace řádku
SQL	Jazyk pro práci s databází
CRUD	Create, Read, Update, Delete

🏗️ 2. CREATE TABLE
Vytvoření tabulky
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
NVARCHAR(x)	Text
DATE	Datum
DATETIME	Datum + čas

🧱 4. Důležité vlastnosti sloupců
Vlastnost	Význam
PRIMARY KEY	Unikátní identifikátor
IDENTITY	Automatické číslování
NOT NULL	Hodnota nesmí být prázdná

➕ 5. INSERT INTO
Vložení jednoho záznamu
INSERT INTO [Uzivatele]
(
    [Jmeno],
    [Prijmeni],
    [DatumNarozeni],
    [PocetClanku]
)
VALUES
(
    'Jan',
    'Novák',
    '1984-03-11',
    17
);
Vložení více záznamů
INSERT INTO [Uzivatele]
(
    [Jmeno],
    [Prijmeni],
    [DatumNarozeni],
    [PocetClanku]
)
VALUES
    ('Jan', 'Novák', '1984-03-11', 17),
    ('Eva', 'Černá', '1990-06-15', 5),
    ('Petr', 'Malý', '1988-09-20', 11);

🔍 6. SELECT
Výpis celé tabulky
SELECT *
FROM [Uzivatele];
Výpis konkrétních sloupců
SELECT
    [Jmeno],
    [Prijmeni]
FROM [Uzivatele];

🎯 7. WHERE
Filtrování dat
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
AND
WHERE [Vek] > 18
AND [Aktivni] = 1;
OR
WHERE [Tarif] = 'Premium'
OR [Tarif] = 'Student';

✏️ 10. UPDATE
Úprava dat
UPDATE [Uzivatele]
SET [PocetClanku] = 20
WHERE [Id] = 1;
Zvýšení hodnoty
UPDATE [Uzivatele]
SET [PocetClanku] = [PocetClanku] + 1
WHERE [Id] = 1;

❌ 11. DELETE
Smazání konkrétního záznamu
DELETE FROM [Uzivatele]
WHERE [Id] = 2;
⚠️ DELETE bez WHERE
DELETE FROM [Uzivatele];

👉 Smaže VŠECHNY řádky.

🧨 12. TRUNCATE TABLE
Vymazání celé tabulky
TRUNCATE TABLE [Uzivatele];
Co dělá:
smaže všechna data
resetuje IDENTITY
zachová strukturu tabulky
rychlejší než DELETE

💥 13. DROP TABLE
Smazání celé tabulky
DROP TABLE [Uzivatele];
Co dělá:
smaže data
smaže strukturu
tabulka přestane existovat

🔄 14. Rozdíly — DELETE vs TRUNCATE vs DROP
Příkaz	Data	Struktura	WHERE	Reset IDENTITY
DELETE	smaže	zachová	ANO	NE
TRUNCATE	smaže vše	zachová	NE	ANO
DROP	smaže vše	smaže	NE	ANO

🛡️ 15. SQL Injection
Nebezpečný dotaz
DELETE FROM [Uzivatele]
WHERE [Prijmeni] = '" + prijmeni + "';
Bezpečný přístup
DELETE FROM [Uzivatele]
WHERE [Prijmeni] = @prijmeni;

💾 16. Export databáze
Typ exportu	Obsah
Kompletní export	struktura + data
Export struktury	jen CREATE TABLE
Export dat	jen INSERT INTO

📥 17. Import databáze
Import dat
tabulka už existuje
vkládají se data
Import tabulky
vytvoří se tabulka
následně data

🧩 18. SET IDENTITY_INSERT
Ruční vkládání ID
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

📚 19. CRUD
Písmeno	Operace	SQL
C	Create	INSERT
R	Read	SELECT
U	Update	UPDATE
D	Delete	DELETE

🧠 20. SQL mindset
SQL neříká HOW

SQL říká:

„Co chci získat.“

Ne:

„Jak to databáze má udělat.“

🏢 21. Reálné využití SQL
správa zákazníků
e-shopy
banky
reporting
CRM systémy
business analytika
Power BI
datové sklady
AI pipelines

🚀 22. Nejčastější chyby začátečníků
Chyba	Problém
DELETE bez WHERE	smaže vše
UPDATE bez WHERE	změní vše
špatné datové typy	error
zapomenutá čárka	syntax error
INSERT do IDENTITY bez povolení	error
DROP místo DELETE	ztráta tabulky

🎯 23. Doporučený workflow
CREATE TABLE
↓
INSERT INTO
↓
SELECT
↓
UPDATE
↓
DELETE
↓
EXPORT
↓
IMPORT
