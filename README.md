# 📊 SQL Learning Journey

Tento repozitář dokumentuje moji cestu učení SQL – od základů až po první analytické case study.

🎯 **Cíl:** stát se junior data analytikem 🚀

---

## 📁 Obsah

- `sql-cheatsheet.md` → přehled SQL (teorie + syntaxe)
- `sql_fiddle_examples.sql` → praktické ukázky + cvičení
- `case_study_1.sql` → první analytická case study

---

## 🧠 Co se učím

- SELECT, WHERE, GROUP BY
- agregační funkce (SUM, COUNT, AVG)
- JOIN (spojování tabulek)
- HAVING (filtrace skupin)
- práce s daty jako v reálném businessu
- přemýšlení nad daty (SQL jako nástroj pro analýzu)

---

## 📊 Dataset

Používám jednoduchý dataset pro pochopení základních principů:

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

## 📊 Case Study

Tato case study ukazuje základní analytické scénáře nad daty:

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

## 🧠 Jak nad tím přemýšlím

SQL není programování v klasickém smyslu.

👉 Je to způsob, jak se ptát na data:

- odkud beru data (FROM)
- jak je spojím (JOIN)
- co odfiltruju (WHERE)
- jak je rozdělím (GROUP BY)
- co spočítám (SUM, COUNT, AVG)
- co z toho vyberu (HAVING)
- jak to seřadím (ORDER BY)

---

## 🚀 Další kroky

- LEFT JOIN (práce s chybějícími daty)
- složitější JOINy
- více tabulek
- reálné datasety
- Power BI / Python napojení
- reálné datasety
- Power BI / Python napojení
