# Superstore SQL Case Study — Insights (SQLite)

## Scope
This analysis uses the Superstore dataset loaded into SQLite and normalized into a basic analytics schema. A derived view parses order/ship dates into ISO format and computes shipping days.

## Headline KPIs
- Total sales: 2,297,200.86
- Total profit: 286,397.02
- Profit margin: 12.47%

## Key observations (evidence-first)
1) **Discount depth is the dominant profitability driver**
   - 0% discount: 29.51% margin (320,987.60 profit)
   - 30%+ discount: -48.16% margin (-125,006.78 profit)
   Interpretation: deep discounting is strongly associated with negative contribution margin.

2) **Category performance is uneven**
   - Technology and Office Supplies both operate at ~17% margin.
   - Furniture operates at ~2.5% margin.
   Interpretation: current Furniture pricing/discount/service model is structurally weaker.

3) **Profit leakage concentrates in Tables and Machines**
   - Tables: -17,725.48 profit on 206,965.53 sales (-8.56% margin).
   - Several Machines products show large negative profit with extreme negative margins.
   Interpretation: a small set of SKUs likely accounts for a disproportionate share of losses.

4) **Central region underperforms**
   - Central margin 7.92% vs West 14.94%.
   Interpretation: likely driven by a combination of discount mix + product mix (requires decomposition).

## Recommendations (decision-oriented)
1) Introduce discount guardrails (approval thresholds; SKU-level floors for known loss items).
2) Prioritize Furniture margin recovery via Tables (reduce discount depth, enforce price floors, evaluate assortment).
3) Address Machines loss concentration (separate strategic loss leaders vs accidental; enforce minimum margin).
4) Decompose Central region performance by discount bucket and product mix to target the biggest drivers.
