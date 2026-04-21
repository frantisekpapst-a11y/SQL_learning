# 📊 SQL Learning Journey

Tento repozitář dokumentuje moji cestu učení SQL – od úplných základů až po první analytické case studies.

🎯 **Cíl:** dostat se na úroveň junior data analytika.

---

## 📁 Obsah repozitáře

- `sql-cheatsheet.md` → přehled SQL syntaxe, logiky a základních patternů
- `sql_fiddle_examples.sql` → menší praktické ukázky a tréninkové dotazy
- `sql_cheatsheet_mini_tests` → krátké mini úkoly na procvičení
- `case_study_1.sql` → základní customer analysis
- `case_study_2.sql` → product & customer analysis
- `case_study_3.sql` → top category per customer + customer segmentation
- `case_study_4.sql` → customer revenue trends (LAG, % change, segmentation)

---

## 🧠 Co se v repozitáři učím

### SQL základy
- `SELECT`, `WHERE`, `ORDER BY`
- `GROUP BY`, `HAVING`
- agregační funkce (`SUM`, `COUNT`, `AVG`, `MAX`, `MIN`)
- rozdíl mezi `COUNT(*)` a `COUNT(sloupec)`

### Práce s tabulkami
- `INNER JOIN`
- `LEFT JOIN`
- rozdíl mezi filtrem v `WHERE` a v `ON`
- práce s více tabulkami najednou

### Práce s daty
- výpočty v SQL  
  např. `quantity * price`
- práce s `NULL` hodnotami pomocí `COALESCE`
- segmentace pomocí `CASE WHEN`

### Analytické patterny
- revenue per customer
- revenue per product
- revenue by category
- top per group
- `ROW_NUMBER()` a `RANK()`
- subquery jako mezivýsledek v analýze

---

## 📊 Používané datasety

V repozitáři pracuji s jednoduchými testovacími datasety, které mi pomáhají pochopit principy datové analýzy.

### Jednoduchý dataset

#### `orders`
| order_id | customer_id | amount |
|----------|------------:|-------:|
| 1        | 1           | 500    |
| 2        | 2           | 300    |
| 3        | 1           | 700    |

#### `customers`
| customer_id | name |
|-------------|------|
| 1           | Jan  |
| 2           | Eva  |
| 3           | Petr |

### Rozšířený dataset

Pro pokročilejší case studies používám více tabulek:

- `customers`
- `orders`
- `order_items`
- `products`

Tento model mi umožňuje řešit realističtější analytické úlohy, například:
- revenue podle zákazníka
- revenue podle produktu
- revenue podle kategorie
- top category per customer
- customer segmentation

---

## 🧪 Practice / mini úkoly

Repozitář obsahuje i menší cvičení zaměřená na postupné budování SQL myšlení.

### 🟢 Základy
1. Vypsat všechny objednávky
2. Najít objednávky nad určitou hodnotu
3. Spočítat počet řádků
4. Porovnat `COUNT(*)` vs `COUNT(sloupec)`

### 🟡 Agregace
5. Kolik utratil každý zákazník
6. Kolik má kdo objednávek
7. Průměrná hodnota objednávky
8. Zákazníci s více než X objednávkami

### 🟠 JOIN a práce s více tabulkami
9. Připojit zákazníky k objednávkám
10. Najít zákazníky bez objednávek
11. Revenue per customer
12. Revenue per category

### 🔴 Pokročilejší patterny
13. Top category per customer
14. `ROW_NUMBER()` vs `RANK()`
15. Segmentace zákazníků pomocí `CASE WHEN`
16. Kombinace více mezivýsledků v jednom analytickém dotazu

---

## 📊 Case Study 1 – Customer Analysis

První case study je zaměřená na základní analýzu zákazníků.

### Co řeším
- celkovou útratu zákazníků
- počet objednávek
- průměrnou hodnotu objednávky
- identifikaci aktivnějších a hodnotnějších zákazníků

### Hlavní témata
- `GROUP BY`
- agregační funkce
- `HAVING`
- jednoduché business otázky nad daty

---

## 📊 Case Study 2 – Product & Customer Analysis

Druhá case study pracuje s více tabulkami a realističtější strukturou dat.

### Co řeším
- performance produktů
- revenue per product
- revenue per customer
- revenue by category
- top category per customer

### Hlavní témata
- více `JOIN`ů
- výpočty typu `quantity * price`
- agregace napříč více tabulkami
- analytické myšlení nad business daty

---

## 📊 Case Study 3 – Top Category per Customer + Segmentation

Třetí case study kombinuje více analytických kroků do jednoho problému.

### Cíl
Pro každého zákazníka najít:
- top kategorii podle revenue
- revenue v této kategorii
- celkové customer revenue
- segment zákazníka (`top / medium / low`)

### Co jsem si na tom procvičil
- rozdíl mezi `JOIN` a `LEFT JOIN`
- proč někdy potřebuji dva oddělené mezivýsledky
- `ROW_NUMBER()` pro top per group
- `CASE WHEN` pro segmentaci
- `COALESCE` a práce s `NULL`
- rozdíl mezi chybějícím řádkem a `NULL` hodnotou

### Klíčový insight
Top category a total customer revenue jsou dvě různé business otázky, takže je lepší je počítat odděleně a spojit až ve finálním kroku.

---

## 🧠 Jak nad SQL přemýšlím

SQL pro mě není jen syntaxe, ale způsob, jak přemýšlet nad daty.

Typický myšlenkový postup:

1. **Odkud beru data** (`FROM`)
2. **Jaké tabulky potřebuji spojit** (`JOIN`)
3. **Co chci odfiltrovat ještě před výpočtem** (`WHERE`)
4. **Jak data seskupím** (`GROUP BY`)
5. **Co spočítám** (`SUM`, `COUNT`, `AVG`, ...)
6. **Co odfiltruji až po agregaci** (`HAVING`)
7. **Jak výsledky seřadím** (`ORDER BY`)

Postupně se učím přecházet od psaní jednotlivých dotazů k řešení reálnějších analytických úloh.

---

## 🚀 Co dál

Další témata, na která chci navázat:

- pokročilejší subquery
- další window functions
- komplexnější SQL case studies
- Excel pro analytickou práci
- Power BI a dashboarding
- Python (`pandas`) pro data analysis

---

## 📌 Poznámka

Tento repozitář je součást mého learning journey.  
Nejde o hotový produkční projekt, ale o průběžně budovaný přehled toho, co se učím, zkouším a postupně chápu v SQL a datové analýze.
