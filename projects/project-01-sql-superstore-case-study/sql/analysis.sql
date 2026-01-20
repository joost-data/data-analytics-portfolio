-- Project 01: Superstore SQL Case Study
-- Author: joost-data
-- Database: SQLite

-- 1) Basic counts
SELECT COUNT(*) AS orders FROM orders;
SELECT COUNT(*) AS customers FROM customers;
SELECT COUNT(*) AS products FROM products;
SELECT COUNT(*) AS order_items FROM order_items;

-- 2) Date range
SELECT
  MIN(order_date) AS min_order_date,
  MAX(order_date) AS max_order_date
FROM orders;

-- 3) Overall sales & profit
SELECT
  ROUND(SUM(sales), 2) AS total_sales,
  ROUND(SUM(profit), 2) AS total_profit,
  ROUND(SUM(profit) / NULLIF(SUM(sales), 0), 4) AS profit_margin
FROM order_items;

-- Next: you will add monthly trend, category performance, discount impact, etc.

