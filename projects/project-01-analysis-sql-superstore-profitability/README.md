# Project 01 — Superstore SQL Profitability Analysis (SQLite)

## Executive Summary
This project restructures the Superstore dataset and uses it to answer a small set of practical business questions. It looks at how performance changes over time, where profit is made or lost, how discounts affect margin, which customers and regions matter most, and whether shipping choices relate to outcomes.

One message is consistent throughout the results: profit depends on pricing discipline and what products are being sold. Losses are concentrated, repeatable, and often avoidable.

## Quick links
- [Insights summary:](./reports/insights.md)
- [SQL analysis files:](./sql/)

## Business Questions
- How are sales and profit changing over time?
- Which product areas generate profit, and which lose money?
- At what point do discounts turn sales unprofitable?
- Which customers and regions contribute most to profit?
- Does shipping choice relate to speed and profitability?

## Dataset
- Source: Superstore dataset (Kaggle)
- Structure: Order-level retail transactions
- Coverage: Orders, customers, products, regions, pricing, discounts, and profit

## Tools
- SQLite
- SQL
- Git + GitHub

## Key Findings

### Overall performance
The business is profitable overall, with a margin that leaves limited room for heavy discounting.
- Total sales: **2,297,200.86**
- Total profit: **286,397.02**
- Profit margin: **12.47%**

### Discounts drive most losses
Most profit comes from full-price or lightly discounted orders.
- **No discount** orders generate **320,987.60** profit on **1,087,908.47** sales (**29.51% margin**).

Losses increase quickly as discounts deepen.
- **30%+ discounts:** **-125,006.78** profit on **259,543.49** sales (**-48.16% margin**)
- **20–30% discounts:** **-10,369.28** profit (**-10.05% margin**)

In day-to-day terms, deep discounts often turn revenue into losses.

### Product mix matters
Two categories carry most of the profit.
- Technology: **145,454.95** profit on **836,154.03** sales (**17.40% margin**)
- Office Supplies: **122,490.80** profit on **719,047.03** sales (**17.04% margin**)

Furniture brings in revenue but contributes little profit.
- Furniture: **18,451.27** profit on **741,999.80** sales (**2.49% margin**)

### Losses concentrate in a small number of products
A few sub-categories repeatedly lose money.
- **Tables:** **206,965.53** sales with **-17,725.48** profit (**-8.56% margin**)
- **Bookcases:** **114,880.00** sales with **-3,472.56** profit (**-3.02% margin**)

At the product level, losses cluster in a small number of items.
- *Cubify CubeX 3D Printer (Double Head):* **-8,879.97** profit (**-80% margin**)
- *Lexmark MX611dhe Printer:* **-4,589.97** profit (**-27.27% margin**)
- Several Tables products show repeated large losses.

Most products earn money. A small minority drives a large share of the losses.

### Regional performance differs in meaningful ways
Margins vary by region.
- West: **14.94%**
- East: **13.48%**
- South: **11.93%**
- Central: **7.92%**

Central is notably lower. This generally points to differences in discounting or product mix, not demand alone.

### Customers show repeat purchasing in the observed period
Repeat purchases increase after the early period.
This reflects the history available in the dataset, not full customer lifetime behavior.

## Recommendations

### 1 Set firm limits on deep discounting
**What is happening:** Discounts above 30% produce large and consistent losses.  
**What it implies:** Deep discounts should be used selectively, not as a default lever.

**Action**
- Require approval for discounts above 20%.
- Avoid 30%+ discounts for products with a clear loss history.

### 2 Improve Furniture profitability by addressing Tables
**What is happening:** Furniture margins are low, and Tables are a major driver.  
**What it implies:** More volume here does not reliably create more profit.

**Action**
- Reduce discount depth on Tables.
- Review pricing and sourcing.
- Remove or redesign products that repeatedly lose money.

### 3 Set minimum pricing rules for Machines
**What is happening:** Machines losses come from a small number of higher-priced items.  
**What it implies:** These losses tend to reflect pricing or discount rules, not random variation.

**Action**
- Decide which items are intentional loss leaders.
- Set minimum margin rules for all other items.

### 4 Diagnose Central region performance
**What is happening:** Central has the lowest margin by a wide margin.  
**What it implies:** The gap is likely driven by discount behavior and product mix.

**Action**
- Compare Central to West on discount levels, product mix, and loss-making products.
- Target the main driver rather than applying broad cost controls.

## How to Run
1. Place the raw CSV at `data/raw/superstore.csv`
2. Create the database at `data/processed/superstore.db` using `sqlite3`
3. Run schema: `.read sql/schema.sql`
4. Import CSV into staging:
   - `.mode csv`
   - `.import data/raw/superstore.csv staging_superstore`
5. Load normalized tables: `.read sql/load.sql`
6. Run analysis: `.read sql/analysis.sql`

## Methods & Limitations
- The raw Superstore CSV is loaded into SQLite and split into `customers`, `products`, `orders`, and `order_items`.
- Dates are stored as `M/D/YYYY` in the source. A derived view converts them to ISO format and calculates shipping days.
- The results describe patterns in the data. They do not prove cause and effect.
- Discount effects can reflect product mix and sales strategy that are not fully captured here.
- “New vs returning” customers is based on first observed purchase within the dataset window, not true acquisition.
