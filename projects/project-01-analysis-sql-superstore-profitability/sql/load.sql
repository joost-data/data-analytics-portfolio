-- Customers
INSERT OR IGNORE INTO customers (customer_id, customer_name, segment)
SELECT DISTINCT customer_id, customer_name, segment
FROM staging_superstore
WHERE customer_id IS NOT NULL;

-- Products
INSERT OR IGNORE INTO products (product_id, category, sub_category, product_name)
SELECT DISTINCT product_id, category, sub_category, product_name
FROM staging_superstore
WHERE product_id IS NOT NULL;

-- Orders (distinct order_id)
INSERT OR IGNORE INTO orders (
  order_id, order_date, ship_date, ship_mode,
  country, city, state, postal_code, region, customer_id
)
SELECT DISTINCT
  order_id,
  order_date,
  ship_date,
  ship_mode,
  country,
  city,
  state,
  postal_code,
  region,
  customer_id
FROM staging_superstore
WHERE order_id IS NOT NULL;

-- Order items
INSERT OR IGNORE INTO order_items (
  row_id, order_id, product_id, sales, quantity, discount, profit
)
SELECT
  row_id, order_id, product_id, sales, quantity, discount, profit
FROM staging_superstore
WHERE row_id IS NOT NULL;

