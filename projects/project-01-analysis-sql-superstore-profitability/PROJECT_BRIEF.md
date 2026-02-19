# Project Brief — Superstore Profitability Analysis (SQL)

## Objective
Find where profit is made and where it is lost in a retail business.
Turn raw sales data into clear guidance for pricing, discounting, and product focus.

---

## Questions this project answers
- How do sales and profit change over time?
- Which categories and sub-categories drive profit or losses?
- At what discount levels do losses start to grow?
- Which regions and customer groups perform better or worse?
- How do shipping choices relate to speed and profit?

---

## Data
- Superstore retail dataset (CSV)
- One historical snapshot of orders, products, customers, discounts, and profit

---

## What I did
### Prepare the data
- Loaded the raw file into a structured database.
- Checked for duplicates and cleaned obvious issues.
- Split the data into clear tables for customers, products, orders, and order items.
- Standardized dates and calculated shipping time.
- Validated totals to make sure results match the source data.

### Analyze the data
- Compared profit and sales across time, products, regions, and customer groups.
- Grouped discounts into simple ranges to see where profit breaks down.
- Checked whether losses are widespread or concentrated in a small set of items.
- Focused on the strongest drivers first, then added detail where it helped decisions.

---

## What the analysis focuses on
- Discount depth as the main driver of profit and loss
- Weak product areas and product mix effects
- Loss concentration in specific items
- Meaningful regional differences in margin
- Signs of repeat purchasing within the available history

---

## Deliverables
- A structured SQL database built from the raw CSV
- Reproducible SQL queries for analysis
- A short insights summary with clear recommendations
- A GitHub project folder with documentation and files

---

## Limits and assumptions
- The results show patterns in outcomes, not direct causes.
- Discount effects can reflect what products are being sold, not only pricing.
- “New vs returning customers” is based only on what appears in this dataset.
- Findings reflect one fixed historical period.

---

## Why this is useful
- Helps identify the few decisions that explain most profit and loss.
- Supports clearer discount limits and product-level action.
- Points to where deeper regional investigation is most likely to pay off.
- Shows an end-to-end workflow from raw data to decision-ready findings.
