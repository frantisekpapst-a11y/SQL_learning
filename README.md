# 📊 SQL Learning Journey

Tento repozitář dokumentuje moji cestu učení SQL – od úplných základů až po pokročilejší analytické case studies.

🎯 Cíl: dostat se na úroveň junior data analytika a umět řešit reálné business problémy pomocí dat.

---

# 📁 Obsah repozitáře

- `sql-cheatsheet.md` → přehled SQL syntaxe, logiky a základních patternů  
- `sql_fiddle_examples.sql` → menší praktické ukázky a tréninkové dotazy  
- `sql_cheatsheet_mini_tests` → krátké mini úkoly na procvičení  
- `case_study_1.sql` → základní customer analysis  
- `case_study_2.sql` → product & customer analysis  
- `case_study_3.sql` → top category per customer + segmentation  
- `case_study_4.sql` → customer revenue trends (LAG, % change)  
- `case_study_5.sql` → revenue change + growth/decline status  
- `case_study_6.sql` → filtering + TOP growth customers  
- `case_study_7.sql` → customer value analysis (revenue, segment, ranking)
- `case_study_8.sql` → customer activity gaps (LAG, DATEDIFF, inactivity analysis)

---

# 🧠 Co se v repozitáři učím

## 🔰 SQL základy
- SELECT, WHERE, ORDER BY  
- GROUP BY, HAVING  
- agregační funkce (SUM, COUNT, AVG, MAX, MIN)  
- rozdíl mezi `COUNT(*)` a `COUNT(column)`  

## 🔗 Práce s tabulkami
- INNER JOIN  
- LEFT JOIN  
- rozdíl mezi filtrem v `WHERE` vs `ON`  
- práce s více tabulkami  

## 📊 Práce s daty
- výpočty v SQL (např. `quantity * price`)  
- práce s NULL hodnotami (`COALESCE`)  
- segmentace (`CASE WHEN`)  

## 🚀 Analytické patterny
- revenue per customer / product / category  
- top per group  
- subquery vs CTE  
- kombinace více kroků v jednom dotazu  

## 🔥 Window functions
- `ROW_NUMBER()` vs `RANK()`  
- `LAG()` (předchozí hodnota)  
- změna a % změna v čase  
- ranking zákazníků  
- agregace bez ztráty řádků (`SUM() OVER`)  

---

# 📊 Používané datasety

Používám jednoduché testovací datasety pro pochopení principů:

### Jednoduchý dataset
- `orders`
- `customers`

### Rozšířený dataset
- customers  
- orders  
- order_items  
- products  

👉 Tento model umožňuje řešit realističtější úlohy:
- revenue podle zákazníka  
- revenue podle produktu  
- revenue podle kategorie  
- top category per customer  
- customer segmentation  

---

# 🧪 Practice / mini úkoly

Repozitář obsahuje i menší cvičení pro budování SQL myšlení.

## 🟢 Základy
- vypsání dat  
- filtrování (`WHERE`)  
- počítání (`COUNT`)  

## 🟡 Agregace
- kolik utratil zákazník  
- kolik má objednávek  
- průměry  
- HAVING  

## 🟠 JOIN
- spojování tabulek  
- zákazníci bez objednávek  
- revenue per customer  

## 🔴 Pokročilé
- TOP per group  
- ROW_NUMBER vs RANK  
- segmentace  
- práce s mezivýsledky  

---

# 📊 Case Studies

## 📊 Case Study 1 – Customer Analysis
Základní analýza zákazníků.

**Co řeším:**
- celkovou útratu
- počet objednávek
- průměr

**Témata:**
- GROUP BY  
- agregace  
- HAVING  

---

## 📊 Case Study 2 – Product & Customer Analysis
Analýza přes více tabulek.

**Co řeším:**
- revenue per product  
- revenue per customer  
- revenue by category  

**Témata:**
- JOINy  
- výpočty  
- agregace  

---

## 📊 Case Study 3 – Top Category per Customer
Kombinace více analytických kroků.

**Co řeším:**
- top category per customer  
- total revenue  
- segment  

**Témata:**
- ROW_NUMBER()  
- CASE WHEN  
- COALESCE  

---

## 📊 Case Study 4 – Revenue Trends
Analýza vývoje v čase.

**Co řeším:**
- revenue per period  
- předchozí hodnota  
- změna a % změna  

**Témata:**
- LAG()  
- window functions  

---

## 📊 Case Study 5 – Growth vs Decline
Rozšíření trendové analýzy.

**Co řeším:**
- growth / decline status  
- interpretace změny  

**Témata:**
- CASE WHEN  
- business logika  

---

## 📊 Case Study 6 – Top Growth Customers
Filtrace a výběr TOP zákazníků.

**Co řeším:**
- zákazníci s růstem  
- TOP podle změny  

**Témata:**
- WHERE  
- ROW_NUMBER / RANK  

---

## 📊 Case Study 7 – Customer Value Analysis
Komplexní analýza zákaznické hodnoty.

**Co řeším:**
- total revenue zákazníka  
- segment (top / medium / low)  
- ranking zákazníků  
- zákazníci bez objednávek  

**Témata:**
- LEFT JOIN  
- GROUP BY  
- COALESCE  
- CASE WHEN  
- RANK()  
- subquery vs CTE  

---

## 📊 Case Study 8 – Customer Activity Gaps

Analýza neaktivity zákazníků v čase.

### Co řeším
- předchozí datum aktivity
- počet dní od minulé aktivity
- klasifikaci `new / active / inactive_gap`
- největší inactive gap overall

### Hlavní témata
- `LAG()`
- `DATEDIFF()`
- `CASE WHEN`
- `CTE`
- `RANK()`

---

# 🧠 Jak nad SQL přemýšlím

SQL není jen syntaxe, ale způsob uvažování:

1. Odkud beru data (FROM)  
2. Jaké tabulky spojím (JOIN)  
3. Co odfiltruju (WHERE)  
4. Jak seskupím data (GROUP BY)  
5. Co spočítám (SUM, COUNT…)  
6. Co filtruju po agregaci (HAVING)  
7. Jak seřadím výstup (ORDER BY)  

👉 Postupně přecházím od jednoduchých dotazů k řešení reálných analytických problémů.

---

# 🚀 Co dál

Další kroky:

- pokročilejší window functions  
- komplexnější case studies  
- SQL + Excel  
- Power BI (dashboardy)  
- Python (pandas, EDA)  

---

# 📌 Poznámka

Tento repozitář je součást mého learning journey.

Nejde o produkční projekt, ale o praktický přehled toho, co se učím, testuji a postupně chápu v oblasti datové analýzy.
