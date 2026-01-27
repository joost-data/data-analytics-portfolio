# Project 01 — Superstore SQL Case Study (SQLite)

## Executive Summary
This project converts the Superstore dataset into a simple relational schema in SQLite and answers key business questions using SQL (trends, profitability drivers, customer segments, discount impact, and shipping performance).

## Business Questions
- How are sales and profit trending over time?
- Which categories/sub-categories drive profit vs losses?
- Where do discounts destroy margin?
- Which customer segments and regions are most profitable?
- How does shipping mode relate to service speed and profitability?

## Dataset
- Source: Superstore dataset (Kaggle)
- Format: CSV loaded into SQLite
- Key fields: order/ship dates, customer segment, region, product category, sales, discount, profit

## Schema
Tables:
- customers
- products
- orders
- order_items

## Tools
- SQLite
- SQL (CTEs, joins, window functions)
- Git + GitHub

## Key Findings

### Overall performance
- Total sales: **2,297,200.86**
- Total profit: **286,397.02**
- Overall profit margin: **12.47%**

### Profitability is highly sensitive to discount depth
- **0% discount** lines generate most profit: **320,987.60** profit on **1,087,908.47** sales (**29.51% margin**).
- Deep discounts are strongly associated with losses:
  - **30%+ discount:** **-125,006.78** profit on **259,543.49** sales (**-48.16% margin**)
  - **20–30% discount:** **-10,369.28** profit (**-10.05% margin**)

### Category mix: Technology and Office Supplies carry profitability; Furniture is weak
- Technology: **145,454.95** profit on **836,154.03** sales (**17.40% margin**)
- Office Supplies: **122,490.80** profit on **719,047.03** sales (**17.04% margin**)
- Furniture: **18,451.27** profit on **741,999.80** sales (**2.49% margin**)

### Losses concentrate in a small set of sub-categories and products
- **Tables** are net loss-making despite high sales: **206,965.53** sales and **-17,725.48** profit (**-8.56% margin**).
- **Bookcases** are also net loss-making: **114,880.00** sales and **-3,472.56** profit (**-3.02% margin**).
- Product-level losses are concentrated in a few SKUs, especially in **Machines** and **Tables**:
  - *Cubify CubeX 3D Printer (Double Head):* **-8,879.97** profit (**-80% margin**)  
  - *Lexmark MX611dhe Printer:* **-4,589.97** profit (**-27.27% margin**)  
  - Multiple conference/meeting **Tables** SKUs show large negative contribution margins.

### Region performance differs materially; Central is lowest margin
- West: **14.94%** margin; East: **13.48%**; South: **11.93%**
- Central: **7.92%** margin (lowest)

### Customer base shows meaningful repeat behaviour over time (proxy)
- Returning customers rise quickly after early periods, indicating repeat purchasing exists in this dataset.
- Month-level “new vs returning” counts should be interpreted as a proxy because it is based on observed first purchase in the dataset window (not true customer acquisition).


## Recommendations

1) **Implement discount guardrails to prevent loss-making sales**
   - Evidence: 30%+ discount lines have **-48% margin** and **-125k** total profit impact.
   - Action: cap discounts by category/sub-category (e.g., require approval above 20%; prohibit 30%+ for known loss SKUs).

2) **Stabilise profitability in Furniture by addressing Tables**
   - Evidence: Furniture overall margin is **~2.5%**; Tables are **net loss-making** with **206,965** sales.
   - Action: review Tables pricing/discount policy, reduce promotional depth, and evaluate whether certain SKUs should be removed or re-sourced.

3) **Investigate Machines loss concentration and define a pricing floor**
   - Evidence: multiple Machines SKUs show large negative margins (e.g., printers/3D printers).
   - Action: separate “strategic loss leaders” from accidental loss-making; apply minimum margin rules at SKU level.

4) **Diagnose Central region underperformance using mix and discount decomposition**
   - Evidence: Central margin **7.92%** vs West **14.94%**.
   - Action: compare Central vs West on discount bucket share, product mix (especially Furniture/Machines), and top loss SKUs to identify the dominant drivers.


## How to Run
1. Place the raw CSV at `data/raw/superstore.csv`
2. Create DB:
   - `sqlite3 data/processed/superstore.db`
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

