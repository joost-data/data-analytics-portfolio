-- Drop tables if they exist
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS staging_superstore;

-- 1) Staging table: mirrors the CSV columns (simple types)
CREATE TABLE staging_superstore (
  row_id INTEGER,
  order_id TEXT,
  order_date TEXT,
  ship_date TEXT,
  ship_mode TEXT,
  customer_id TEXT,
  customer_name TEXT,
  segment TEXT,
  country TEXT,
  city TEXT,
  state TEXT,
  postal_code TEXT,
  region TEXT,
  product_id TEXT,
  category TEXT,
  sub_category TEXT,
  product_name TEXT,
  sales REAL,
  quantity INTEGER,
  discount REAL,
  profit REAL
);

-- 2) Dimension tables
CREATE TABLE customers (
  customer_id TEXT PRIMARY KEY,
  customer_name TEXT,
  segment TEXT
);

CREATE TABLE products (
  product_id TEXT PRIMARY KEY,
  category TEXT,
  sub_category TEXT,
  product_name TEXT
);

-- 3) Orders table (one row per order)
CREATE TABLE orders (
  order_id TEXT PRIMARY KEY,
  order_date TEXT,
  ship_date TEXT,
  ship_mode TEXT,
  country TEXT,
  city TEXT,
  state TEXT,
  postal_code TEXT,
  region TEXT,
  customer_id TEXT,
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- 4) Fact table: order items (one row per product line in an order)
-- IMPORTANT: We use an auto-increment id to avoid datatype mismatch issues with row_id.
CREATE TABLE order_items (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  row_id INTEGER,
  order_id TEXT,
  product_id TEXT,
  sales REAL,
  quantity INTEGER,
  discount REAL,
  profit REAL,
  FOREIGN KEY (order_id) REFERENCES orders(order_id),
  FOREIGN KEY (product_id) REFERENCES products(product_id)
);
