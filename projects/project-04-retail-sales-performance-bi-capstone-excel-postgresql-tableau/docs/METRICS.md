# Metrics Glossary (Project 04)

This glossary defines the metrics used across Excel, SQL (PostgreSQL), and Tableau so results stay consistent.

## Core measures

### Sales quantity
- **Definition:** Total units sold.
- **Formula:** `SUM(sales)`
- **Source field:** `sales` (sales.csv)
- **Grain:** store_id + product_id + date
- **Notes:** Units are treated as additive across rows and time.

### Revenue
- **Definition:** Total sales revenue.
- **Formula:** `SUM(revenue)`
- **Source field:** `revenue` (sales.csv)
- **Grain:** store_id + product_id + date
- **Notes:** Used as the main value measure for performance comparison.

### Average Selling Price (ASP)
- **Definition:** Average revenue per unit sold.
- **Formula:** `SUM(revenue) / NULLIF(SUM(sales), 0)`
- **Grain:** Any grouping (city/store/product/time) as long as numerator/denominator are aggregated consistently.
- **Notes:** ASP is more stable than raw `price` when price has missing values or variability.

## Promotions

### Promo presence (Channel 1)
- **Definition:** Whether a promotion was applied in channel 1.
- **Rule:** Promo is “present” when `promo_type_1` is not null/blank.
- **Useful summary:** `% of rows with promo present` by time/store/product.

### Promo presence (Channel 2)
- **Definition:** Whether a promotion was applied in channel 2.
- **Rule:** Promo is “present” when `promo_type_2` is not null/blank.
- **Useful summary:** `% of rows with promo present` by time/store/product.

### Promo rate bins
- **Definition:** Binned promotion intensity.
- **Fields:** `promo_bin_1`, `promo_bin_2`
- **Notes:** Bins are categorical. Comparisons are descriptive and not causal.

## Stock

### End-of-day stock
- **Definition:** Stock quantity recorded at the end of the day.
- **Formula:** `AVG(stock)` or `MIN(stock)` depending on the view.
- **Source field:** `stock` (sales.csv)
- **Caveat:** This is end-of-day stock, not stock movement.

### Stock pressure proxy (optional)
- **Definition:** Simple indicator for low/zero stock days.
- **Rule example:** stock <= 0 (or stock <= [chosen threshold])
- **Useful summary:** `% of rows with low stock` by store/city/product.
- **Caveat:** This is a proxy and depends on data reliability.

## Dimensions / groupings used

### Time
- **Field:** `date` (YYYY-MM-DD)
- **Common groupings:** Year, Quarter, Month

### Store and location
- **Store:** `store_id`, `store_name`, `storetype_id`, `store_size`
- **City:** `city_id`, `city_name`

### Product hierarchy
- **Product:** `product_id`, `product_name`
- **Hierarchy levels:** hierarchy1_id → hierarchy5_id (as provided)

## Interpretation guardrails
- Promotion fields are descriptive; this analysis does not prove promo impact.
- Regression in this project tested **date as a predictor** only; it is not a complete demand model.