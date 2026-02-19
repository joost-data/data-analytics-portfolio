# Superstore SQL Case Study — Insights (SQLite)

## Scope
This project uses the Superstore retail dataset to understand where profit is made and where it is lost.

## Headline results
- Total sales: **$2,297,200.86**
- Total profit: **$286,397.02**
- Profit margin: **12.47%**

## What stands out
- **Discounts drive profit most.**
  - No discount: **29.51%** margin (**$320,987.60** profit)
  - 30%+ discount: **–48.16%** margin (**–$125,006.78** profit)
  - Deep discounts often turn sales into losses.
- **Some categories perform much better than others.**
  - Technology and Office Supplies are around **17%** margin.
  - Furniture is around **2.5%** margin.
  - Furniture tends to be the weakest area.
- **Losses cluster in a small set of products.**
  - Tables: **–$17,725.48** profit on **$206,965.53** sales (**–8.56%** margin)
  - Several Machines items show very large losses.
  - A small number of items likely explain a large share of the total loss.
- **The Central region lags behind.**
  - Central margin: **7.92%**
  - West margin: **14.94%**
  - This tends to reflect a mix of discount choices and what is being sold.

## Recommended actions
- Set clear discount limits, with extra controls for known loss items.
- Focus Furniture recovery on Tables: reduce discount depth and protect minimum pricing.
- Review Machines losses item-by-item and enforce minimum profit rules.
- Break down Central performance by discount level and product mix to target the main drivers.

