🧠 SQL mini testy z kurzu itnetwork Datová analýza od A do Z.

Posledních 15 otázek je ze závěrečného testu části SQL.

📘Blok 1 — Základy SQL

1. Pokud chceme pomocí SQL získat data:

✅ Řekneme pouze, co má být výsledkem.

2. Příkaz DROP TABLE [Uzivatele];:

✅ Smaže tabulku Uzivatele.

3. Export celé databáze včetně struktur všech tabulek a dat je v souboru s příponou:

✅ .dacpac

4. Příkaz TRUNCATE TABLE [Uzivatele];:

✅ Vymaže všechny záznamy z tabulky.

5. Importovat NEmůžeme:

✅ Databázi s daty, bez tabulek.

6. MS-SQL je databáze:

✅ Relační.

7. Provádíme převod peněz, ale nepodaří se odečíst peníze ze zdrojového účtu. Díky ACID:

✅ Nebudou peníze připsány na cílový účet.

8. NEmůžeme exportovat:

✅ Pouze část struktury databáze.

📘 Blok 2 — SELECT, WHERE, LIKE, agregace

9. Hodnota NULL označuje:

✅ Ještě nezadanou hodnotu.

10. V MS-SQL se nevyskytuje agregační funkce:

✅ QUARTILE()

11. Dotaz SELECT * FROM [Uzivatele]; vybere:

✅ Všechna data z tabulky Uzivatele.

12. V MS-SQL neexistuje datový typ:

✅ LARGEINT

13. Pokud hledáme pomocí klauzule LIKE '_s%';, podtržítko znamená:

✅ Jeden libovolný znak.

14. Směr řazení DESC:

✅ Řadí sestupně.

15. Který operátor není v MS-SQL:

✅ BESIDE

16. Kód:
SELECT COUNT(*) 
FROM [Uzivatele] 
WHERE [PocetClanku] > 0;

✅ Vrátí počet uživatelů, kteří napsali nějaký článek.

📘 Blok 3 — JOIN, poddotazy, vztahy

17. Dotaz přes více tabulek provedeme pomocí příkazu:

✅ JOIN

18. V MS-SQL neexistuje víceřádkový operátor:

✅ INHABITS

19. Víceřádkové operátory:

✅ Umí pracovat s více řádky.

20. Poddotaz je:

✅ Dotaz, který je součástí nějakého dalšího dotazu.

21. V MS-SQL neexistuje vazba:

✅ 1:1:M

22. Aby dotaz přes více tabulek nezobrazil hodnoty NULL:

✅ Použijeme INNER JOIN.

23. V MS-SQL není JOIN typu:

✅ CENTER

24. Pokud při spojování tabulek není pojmenování sloupců jednoznačné:

✅ Použijeme aliasy.

📘 Blok 4 — Indexy, transakce, VIEW

25. Pomocný index:

✅ Může významně zrychlit čtení z tabulky pomocí SELECT.

26. Co udělá kód:
CREATE INDEX krestni_jmeno 
ON [Uzivatele] ([Jmeno])

✅ Vytvoří index na sloupec Jmeno.

27. Co udělá:
DBCC CHECKIDENT ('Uzivatele', reseed, 1233);

✅ Změní počáteční hodnotu primárního klíče na 1234.

28. Transakce v MS-SQL:

✅ Zajistí vykonání úplně všech, nebo vůbec žádného dotazu v dané transakci.

29. Optimalizace databáze:

✅ By se měla provádět až podle výkonu v praxi.

30. Pro vypnutí implicitní transakce použijeme:

✅ SET IMPLICIT_TRANSACTIONS OFF

31. Pohledy (VIEW) v MS-SQL:

✅ Slouží k ukládání často používaných nebo složitých SQL dotazů.

32. Pomocí ALTER TABLE můžeme:

✅ Měnit strukturu již existující databáze.

📘 Blok 5 — Triggery, HAVING, proměnné

33. Triggery nereagují na:

✅ SELECT

34. Jazyk T-SQL podporuje:

✅ Pouze statement-level triggery.

35. V dotazu s GROUP BY se příkaz HAVING:

✅ Vykoná po seskupení.

36. Tělo triggeru obalují:

✅ BEGIN a END.

37. Klauzule HAVING:

✅ Se používá v kombinaci se skupinami záznamů.

38. Trigger:
CREATE TRIGGER [MazaniHrdiny]
ON [Hrdinove]
AFTER DELETE
AS
BEGIN
    INSERT INTO [HistorieHrdinu] ([Jmeno], [Vyska], [Vaha])
    SELECT [Jmeno], [Vyska], [Vaha] FROM [deleted];
END;

✅ Uloží smazaného hrdinu do tabulky HistorieHrdinu.

39. Lokální proměnné se deklarují pomocí:

✅ DECLARE

40. WHERE oproti HAVING:

✅ Nesmí obsahovat agregační funkce.

📘 Blok 6 — Stored procedures

41. Co je špatně na proceduře:
CREATE PROCEDURE PocetZamestnancu
    @NazevOddeleni NVARCHAR(50),
    @Pocet INT OUT
AS
BEGIN
    SELECT @Pocet = COUNT([IdZamestnanec])
    FROM [Zamestnanci]
    WHERE [Oddeleni] LIKE @NazevOddeleni;
END;

✅ Nic. Kód neobsahuje žádnou chybu.

42. Procedura může obsahovat:

✅ Všechny možnosti jsou správně.

43. Mezi výhody uložených procedur nepatří:

✅ Nižší spotřeba prostředků oproti standartním příkazům v konzoli.

44. T-SQL obsahuje parametry:

✅ Vstupní a výstupní.

45. Správná procedura:
CREATE PROCEDURE VydejMleko
AS
BEGIN
    SELECT * FROM [MlekarnaKunin];
END;

✅ Toto je správně.

46. Hodnotu proměnné vypíšeme:

✅ SELECT @PocetKnedliku;

47. Proceduru nelze zavolat pomocí:

✅ EXPR dbo.JizdniRady

48. Proceduru smažeme:

✅ DROP PROCEDURE DulezitaProcedura;

📘 Blok 7 — Fulltext, účty, transakce

49. Mezi fulltext funkce NEpatří:

✅ EQUALS

50. MS-SQL NEumožňuje:

✅ Manualcommit transakce.

51. Fulltextové vyhledávání umožňuje:

✅ Vyhledávat dokumenty, které přesně neodpovídají kritériím vyhledávání.

52. Vytvoření loginu:
CREATE LOGIN mysacek 
WITH PASSWORD='mamRadSejra4';

✅ Správně.

53. Smazání user + login:
DROP USER test;
DROP LOGIN test;

✅ Správně.

54. Fulltext vyhledávání:
SELECT * 
FROM [Pamatky]
WHERE CONTAINS([PamatkaNazev], 'Karlův most');

✅ Správně.

55. Při práci s transakcemi se NEsetkáme s:

✅ Nezávislé čtení.

56. Izolace transakcí:

✅ K definování míry, do jaké musí být jedna transakce izolována od změn dat provedených jinými souběžně běžícími transakcemi.

📘 Blok 8 — Cizí klíče

57. Cizí klíč je:

✅ Sloupec tabulky přímo spojený se sloupcem jiné tabulky.

58. Přidáním cizího klíče vytváříme:

✅ Integritní omezení.

59. Pokud je použito ON UPDATE NO ACTION:

✅ Aktualizace nemůže být provedena.

60. Při použití SET NULL nesmí mít FK:

✅ NOT NULL

61. Výrazy ON DELETE a ON UPDATE nemohou mít hodnotu:

✅ PERFORM ALL

62. Cizí klíč přidáme pomocí:

✅ FOREIGN KEY a REFERENCES.

63. Existující vztah smažeme:
ALTER TABLE [Uzivatele]
DROP CONSTRAINT [UzivateleKomentare];

✅ Správně.

64. ON DELETE SET DEFAULT:

✅ Hodnota cizího klíče bude nastavena na výchozí hodnotu.

📘 Blok 9 — Závěrečný test (Final Quiz)

65. Export databáze se NEdělí na:

✅ Transakční export

66. O SQL injection platí:

✅ SQL injection může napadnout kód:
"DELETE FROM [Uzivatele] WHERE [Prijmeni] = '" + prijmeni + "'";

67. V MS-SQL existují dotazy:

✅ Korelované a nekorelované.

68. Pokud chceme T-SQL příkazy vykonat jako uživatel honza:

✅ EXECUTE AS USER='honza';

69. SQL dotaz:

SELECT * FROM [Uzivatele]
WHERE [DatumNarozeni] >= '1960-1-1'
    OR [PocetClanku] > 5
    OR [PocetClanku] < 1;

nikdy NEvybere:

✅ uživatele se 4 články a datem narození 2. 6. 1954.

70. O RDBMS neplatí:

✅ Řeší syntaktické chyby v jazyce Java a C#.

71. Nad rámec operátorů z programovacích jazyků SQL obsahuje:

✅ LIKE

72. Operátor pro test přítomnosti hodnoty ve výčtu:

✅ IN

73. Mezi CRUD operace patří:

✅ Read

74. SQL kód:

INSERT INTO [Hrdinove] (
    [Jmeno],
    [Prijmeni],
    [SpecialniSchopnost]
)
VALUES ('Jan', 'Dlouhý', 'Výška'),
       ('Tomáš', 'Široký', 'Objem'),
       ('Josef', 'Bystrozraký', 'Dalekohled');

Nesprávné tvrzení:

✅ Změní sloupec Prijmeni každého záznamu v tabulce na Tomáš.

75. Triggery nereagují na:

✅ SELECT

76. Primární klíč slouží:

✅ K jedinečné identifikaci záznamu v tabulce.

77. SQL dotaz:

DELETE
FROM [Uzivatele]
WHERE ([Jmeno] = 'Jan' AND [DatumNarozeni] >= '1980-1-1')
    OR ([PocetClanku] < 3)
    OR ([Jmeno] = 'Brunhilda');

udělá:

✅ Odstraní uživatele, kteří mají jméno Jan a zároveň jsou narozeni po roce 1980.

78. ACID se stará:

✅ O konzistenci dat v databázi.

79. Pro cizí klíč platí:

✅ Je primární klíč jiné tabulky.

80. Celou databázi můžeme importovat pomocí:

✅ DACPAC
