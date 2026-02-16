# Project Brief — Superstore SQL Profitability Analysis (SQLite)

## Objective
Analyze retail sales data to understand **where profit is created and where profit is lost** across products, discounts, customers, and regions.  
The project translates raw transactional data into **clear, decision-ready insights** that support pricing, discounting, and assortment decisions.

---

## Scope & Key Questions
The analysis focuses on:

- How sales and profit evolve over time
- Which product categories and sub-categories drive profit or losses
- At what discount levels margin erosion occurs
- Which regions and customer segments perform better or worse
- How shipping choices relate to service speed and profitability

---

## Approach & Methodology

### Data Source
- Superstore retail dataset (CSV)
- Historical snapshot of orders, products, customers, pricing, discounts, and profit

### Data Preparation
- Load raw data into a structured relational format
- Clean data, remove duplicates and normalize data where needed
- Separate customers, products, orders, and line items
- Standardize dates and derive shipping duration
- Validate joins and totals to ensure consistency

### Analysis
- Compare sales and profit across time, products, regions, and segments
- Group discounts into clear ranges to assess margin impact
- Identify where losses are broad versus concentrated in specific products
- Use consistent comparisons to isolate the strongest drivers of performance

---

## Key Analytical Focus
- Discount depth as a driver of profit and loss
- Product mix effects, especially within weak categories
- Concentration of losses at product level
- Meaningful regional differences in margin
- Evidence of repeat purchasing within the dataset window

---

## Deliverables
- Structured SQL database
- Reproducible analysis queries
- Documented findings and recommendations
- GitHub repository with clear project documentation

---

## Constraints & Assumptions
- Findings show outcomes, not causes
- Discount effects may reflect underlying product mix
- Customer “new vs returning” is based on observed history only
- Results reflect a fixed historical period

---

## Expected Value
- Highlights the few decisions that explain most profit and loss
- Supports tighter discount control and product-level intervention
- Enables focused regional investigation
- Demonstrates an end-to-end, decision-oriented SQL analysis workflow
