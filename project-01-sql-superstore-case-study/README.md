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

## Key Findings (in progress)
- TBD

## Recommendations (in progress)
- TBD

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

## Limitations
- This dataset does not include marketing channels (no ROAS/CAC attribution).
- Some insights are correlational rather than causal.
project-01-sql-superstore-case-study
