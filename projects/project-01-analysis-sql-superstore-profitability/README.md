# Project 01 — Superstore SQL Profatibility Analysis (SQLite)

## Executive Summary
This project restructures the Superstore data and uses it to answer a small set of practical business questions: how performance evolves over time, where profit is created or lost, how discounts affect margins, which customers and regions matter most, and whether delivery choices relate to outcomes.

The results point to one dominant theme: profit is driven by pricing discipline and product mix. Losses are concentrated, predictable, and largely preventable.

## Business Questions
- How are sales and profit changing over time?
- Which product areas generate profit, and which destroy it?
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
The business is profitable overall, with a healthy but not robust margin.
- Total sales: **2,297,200.86**
- Total profit: **286,397.02**
- Profit margin: **12.47%**

This margin leaves limited room for aggressive discounting or weak product economics.

### Discounts are the primary driver of losses
Most profit comes from full-price or lightly discounted sales.
- **No discount** orders generate **320,987.60** profit on **1,087,908.47** sales (**29.51% margin**).

Losses emerge quickly once discounts deepen.
- **30%+ discounts:** **-125,006.78** profit on **259,543.49** sales (**-48.16% margin**)
- **20–30% discounts:** **-10,369.28** profit (**-10.05% margin**)

In practice, deep discounts reliably convert revenue into losses.

### Profit depends heavily on product mix
Two categories carry the business.
- Technology: **145,454.95** profit on **836,154.03** sales (**17.40% margin**)
- Office Supplies: **122,490.80** profit on **719,047.03** sales (**17.04% margin**)

Furniture underperforms despite similar sales volume.
- Furniture: **18,451.27** profit on **741,999.80** sales (**2.49% margin**)

Furniture sales add revenue, but contribute little profit.

### Losses are concentrated in a small number of products
A few sub-categories consistently lose money.
- **Tables:** **206,965.53** sales with **-17,725.48** profit (**-8.56% margin**)
- **Bookcases:** **114,880.00** sales with **-3,472.56** profit (**-3.02% margin**)

At the product level, losses are highly concentrated.
- *Cubify CubeX 3D Printer (Double Head):* **-8,879.97** profit (**-80% margin**)
- *Lexmark MX611dhe Printer:* **-4,589.97** profit (**-27.27% margin**)
- Several Tables products repeatedly show large negative contribution.

Most products are viable. A small minority drives a disproportionate share of losses.

### Regional performance varies meaningfully
Margins differ by region.
- West: **14.94%**
- East: **13.48%**
- South: **11.93%**
- Central: **7.92%**

Central lags materially, suggesting differences in pricing, product mix, or discount behavior rather than demand alone.

### Customers show repeat purchasing behavior
Observed repeat purchasing increases quickly after early periods.
This indicates that repeat demand exists in the data, though it reflects observed history rather than true customer acquisition.

## Recommendations

### 1 Set firm limits on deep discounting
**What is happening:** Discounts above 30% generate large, consistent losses.  
**What it implies:** Deep discounts should be the exception, not a sales lever.

**Action**
- Require approval for discounts above 20%.
- Prohibit 30%+ discounts for products with a history of losses.

### 2 Fix Furniture profitability by addressing Tables
**What is happening:** Furniture margins are near zero, driven primarily by Tables.  
**What it implies:** Volume in this area does not translate into profit.

**Action**
- Reduce discount depth on Tables.
- Review pricing and sourcing.
- Remove or redesign persistently loss-making products.

### 3 Define minimum pricing for Machines
**What is happening:** Losses in Machines come from a small number of expensive items.  
**What it implies:** These losses are likely structural, not incidental.

**Action**
- Decide which products are intentional loss leaders.
- Enforce minimum margin thresholds for all other items.

### 4 Diagnose Central region performance
**What is happening:** Central has the lowest margin by a wide margin.  
**What it implies:** Profitability issues are likely driven by mix or discount behavior.

**Action**
- Compare Central to West on discount levels, product mix, and loss-making products.
- Address the dominant driver rather than applying broad cost controls.

## How to Run
1. Place the raw CSV at `data/raw/superstore.csv`
2. Create the database:
   ```bash
   sqlite3 data/processed/superstore.db
3. Run schema:
   - `.read sql/schema.sql`
4. Import CSV into staging:
   - `.mode csv`
   - `.import data/raw/superstore.csv staging_superstore`
5. Load normalized tables:
   - `.read sql/load.sql`
6. Run analysis:
   - `.read sql/analysis.sql`

## Methods & Limitations

- The raw Superstore CSV was loaded into SQLite, then normalized into `customers`, `products`, `orders`, and `order_items`.
- Dates in the source data are stored as `M/D/YYYY`; an enriched SQL view converts them to ISO format for time-series analysis and calculates shipping days.
- Findings are observational (correlation, not causation). Discount effects may reflect product mix, promotional strategy, or other operational factors not captured in this dataset.
- Customer “new vs returning” is based on first observed purchase within the dataset window, not true acquisition.

