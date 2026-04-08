# 📊 SQL Learning Journey

Tento repozitář obsahuje moje první kroky v SQL – od základů po práci s více tabulkami.

Cíl: stát se junior data analytikem 🚀

---

## 📁 Obsah

- `sql-cheatsheet.md` → přehled SQL (teorie + syntaxe)
- `sql_fiddle_examples.sql` → praktické ukázky + cvičení

---

## 🧠 Co se učím

- SELECT, WHERE, GROUP BY
- agregace (SUM, COUNT, AVG)
- JOIN (spojování tabulek)
- HAVING (filtrace skupin)
- práce s daty jako v reálném businessu

---

## 📊 Dataset

Používám jednoduchý dataset:

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

### 🟢 1. Základní výpis
Vypiš všechny objednávky

---

### 🟢 2. Filtrace
Najdi objednávky nad 400

---

### 🟢 3. Kolik je objednávek
Spočítej počet objednávek

---

### 🟡 4. Součet objednávek podle zákazníka
👉 Kolik utratil každý zákazník

---

### 🟡 5. Počet objednávek podle zákazníka
👉 Kolik má kdo objednávek

---

### 🟡 6. Průměrná hodnota objednávky
👉 AVG amount podle zákazníka

---

### 🟠 7. Filtrace skupin
👉 Najdi zákazníky s více než 1 objednávkou

---

### 🟠 8. Velcí zákazníci
👉 zákazníci s útratou > 1000

---

### 🔴 9. Kombinace podmínek (REAL CASE)
👉 zákazníci kteří:
- mají více než 1 objednávku
- a zároveň průměrná objednávka > 400

---

## 🧠 Jak nad tím přemýšlím

SQL = popis výsledku

1. odkud beru data (FROM)
2. spojím tabulky (JOIN)
3. filtruju (WHERE)
4. seskupím (GROUP BY)
5. počítám (SUM, COUNT…)
6. filtruju skupiny (HAVING)
7. seřadím (ORDER BY)

---

## 🚀 Další kroky

- složitější JOINy
- více tabulek
- reálné datasety
- Power BI / Python napojení
