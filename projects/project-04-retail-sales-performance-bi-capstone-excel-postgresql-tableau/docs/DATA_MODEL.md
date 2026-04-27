# Data Model Notes (Project 04)

## Goal
Keep the analysis consistent across Excel, PostgreSQL, and Tableau by documenting grain, joins, and known limitations.

## Source files
- sales.csv (daily sales + revenue + stock + price + promo fields)
- product_hierarchy.csv (product hierarchy structure)
- store_cities.csv (store → city mapping + store attributes)
- product_names.csv (product_id → product_name)
- store_names.csv (store_id → store_name)
- city_names.csv (city_id → city_name)

## Grain
**Fact grain:** `store_id + product_id + date`  
Each row represents daily activity for a product in a store on a given date.

## Tables (logical)
### Fact
- **fact_sales_daily**
  - Keys: store_id, product_id, date
  - Measures: sales, revenue, stock, price, promo fields

### Dimensions
- **dim_product**
  - Key: product_id
  - Attributes: product_name, hierarchy1_id … hierarchy5_id, product size fields (if used)

- **dim_store**
  - Key: store_id
  - Attributes: store_name, storetype_id, store_size, city_id

- **dim_city**
  - Key: city_id
  - Attribute: city_name

## Joins / relationships
- fact_sales_daily.product_id → dim_product.product_id (many-to-one)
- fact_sales_daily.store_id → dim_store.store_id (many-to-one)
- dim_store.city_id → dim_city.city_id (many-to-one)

## Tableau relationship notes
- Use relationships (not physical joins) where possible to reduce row duplication.
- Validate totals (SUM revenue, SUM sales) before and after adding dimensions.

## Data quality and caveats
- The original Kaggle dataset is very large; the provided sales.csv was truncated for coursework usability.
- Promotion fields (promo_type / promo_bin) are descriptive and not causal evidence of promo effectiveness.
- Stock is end-of-day stock; it does not directly measure restock timing or lost sales.
- Price may vary across store/product/day and may include missing values depending on the sample.