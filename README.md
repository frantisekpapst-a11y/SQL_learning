# 📊 SQL Learning Journey

Tento repozitář dokumentuje moji cestu učení SQL – od základů až po první analytické case studies.

🎯 **Cíl:** stát se junior data analytikem 🚀

---

## 📁 Obsah

- `sql-cheatsheet.md` → přehled SQL (teorie + syntaxe)
- `sql_fiddle_examples.sql` → praktické ukázky + cvičení
- `case_study_1.sql` → základní analytická case study (customers & orders)
- `case_study_2.sql` → pokročilejší analýza (customers, orders, products)

---

## 🧠 Co se učím

- SELECT, WHERE, GROUP BY
- agregační funkce (SUM, COUNT, AVG)
- JOIN (INNER JOIN, LEFT JOIN)
- HAVING (filtrace skupin)
- práce s NULL hodnotami (COALESCE)
- práce s více tabulkami
- výpočty v SQL (např. revenue = quantity × price)
- přemýšlení nad daty (SQL jako nástroj pro analýzu)

---

## 📊 Dataset

Používám jednoduché datasety pro pochopení základních principů:

### orders
| order_id | customer_id | amount |
|----------|------------|--------|
| 1        | 1          | 500    |
| 2        | 2          | 300    |
| 3        | 1          | 700    |

### customers
| customer_id | name |
|-------------|------|
| 1           | Jan  |
| 2           | Eva  |
| 3           | Petr |

---

## 🧪 Mini úkoly (practice)

### 🟢 Základy
1. Vypsat všechny objednávky  
2. Najít objednávky nad 400  
3. Spočítat počet objednávek  

### 🟡 Agregace
4. Kolik utratil každý zákazník  
5. Kolik má kdo objednávek  
6. Průměrná hodnota objednávky  

### 🟠 Pokročilejší práce s daty
7. Zákazníci s více než 1 objednávkou  
8. Zákazníci s útratou > 1000  

### 🔴 Real case
9. Zákazníci, kteří:
   - mají více než 1 objednávku  
   - a zároveň mají průměrnou objednávku > 400  

---

## 📊 Case Study 1 – Customer Analysis

Analýza základního chování zákazníků:

1. **Top customer**  
   → zákazník s nejvyšší celkovou útratou  

2. **Customer activity**  
   → počet objednávek na zákazníka  

3. **Average order value**  
   → průměrná hodnota objednávky  

4. **VIP customers**  
   → zákazníci s více objednávkami a vysokou útratou  

5. **Low-value customers**  
   → zákazníci s nízkou průměrnou hodnotou objednávky  

---

## 📊 Case Study 2 – Product & Customer Analysis

Analýza prodeje napříč více tabulkami (customers, orders, products):

1. **Product performance**  
   → kolik kusů každého produktu se prodalo  

2. **Revenue per product**  
   → kolik každý produkt vydělal  

3. **Customer revenue**  
   → kolik utratil každý zákazník  

4. **Revenue by category**  
   → kolik utratil zákazník v jednotlivých kategoriích  

5. **Top category per customer**  
   → kategorie, ve které zákazník utratil nejvíce  

---

## 🧠 Jak nad tím přemýšlím

SQL není jen syntaxe – je to způsob, jak analyzovat data.

👉 Postup:

- odkud beru data (FROM)
- jak je spojím (JOIN)
- co odfiltruju (WHERE)
- jak je rozdělím (GROUP BY)
- co spočítám (SUM, COUNT, AVG)
- co z toho vyberu (HAVING)
- jak to seřadím (ORDER BY)

---

## 🚀 Další kroky

- pokročilé JOIN scénáře
- subquery (poddotazy)
- komplexnější case studies
- reálné datasety
- Power BI (vizualizace dat)
- Python (pandas, data analysis)
