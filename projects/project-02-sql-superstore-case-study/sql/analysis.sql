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
  MIN(order_date_iso) AS min_order_date,
  MAX(order_date_iso) AS max_order_date
FROM v_order_items_enriched;

-- 3) Overall sales & profit
SELECT
  ROUND(SUM(sales), 2) AS total_sales,
  ROUND(SUM(profit), 2) AS total_profit,
  ROUND(SUM(profit) / NULLIF(SUM(sales), 0), 4) AS profit_margin
FROM order_items;

-- =========================================
-- Core Analysis (v_order_items_enriched)
-- =========================================

-- A) Monthly sales & profit trend
SELECT
  substr(order_date_iso, 1, 7) AS order_month,
  ROUND(SUM(sales), 2) AS sales,
  ROUND(SUM(profit), 2) AS profit,
  ROUND(SUM(profit) / NULLIF(SUM(sales), 0), 4) AS profit_margin
FROM v_order_items_enriched
GROUP BY order_month
ORDER BY order_month;

-- B) Profitability by category
SELECT
  category,
  ROUND(SUM(sales), 2) AS sales,
  ROUND(SUM(profit), 2) AS profit,
  ROUND(SUM(profit) / NULLIF(SUM(sales), 0), 4) AS profit_margin
FROM v_order_items_enriched
GROUP BY category
ORDER BY profit DESC;

-- C) Profitability by sub-category (top 10 winners)
SELECT
  sub_category,
  ROUND(SUM(sales), 2) AS sales,
  ROUND(SUM(profit), 2) AS profit,
  ROUND(SUM(profit) / NULLIF(SUM(sales), 0), 4) AS profit_margin
FROM v_order_items_enriched
GROUP BY sub_category
ORDER BY profit DESC
LIMIT 10;

-- D) Profitability by sub-category (top 10 losers)
SELECT
  sub_category,
  ROUND(SUM(sales), 2) AS sales,
  ROUND(SUM(profit), 2) AS profit,
  ROUND(SUM(profit) / NULLIF(SUM(sales), 0), 4) AS profit_margin
FROM v_order_items_enriched
GROUP BY sub_category
ORDER BY profit ASC
LIMIT 10;

-- E) Discount impact by bucket
SELECT
  CASE
    WHEN discount = 0 THEN '0%'
    WHEN discount > 0 AND discount <= 0.10 THEN '0–10%'
    WHEN discount > 0.10 AND discount <= 0.20 THEN '10–20%'
    WHEN discount > 0.20 AND discount <= 0.30 THEN '20–30%'
    ELSE '30%+'
  END AS discount_bucket,
  COUNT(*) AS line_items,
  ROUND(SUM(sales), 2) AS sales,
  ROUND(SUM(profit), 2) AS profit,
  ROUND(SUM(profit) / NULLIF(SUM(sales), 0), 4) AS profit_margin
FROM v_order_items_enriched
GROUP BY discount_bucket
ORDER BY line_items DESC;

-- F) Segment performance
SELECT
  segment,
  ROUND(SUM(sales), 2) AS sales,
  ROUND(SUM(profit), 2) AS profit,
  ROUND(SUM(profit) / NULLIF(SUM(sales), 0), 4) AS profit_margin
FROM v_order_items_enriched
GROUP BY segment
ORDER BY profit DESC;

-- G) Region performance
SELECT
  region,
  ROUND(SUM(sales), 2) AS sales,
  ROUND(SUM(profit), 2) AS profit,
  ROUND(SUM(profit) / NULLIF(SUM(sales), 0), 4) AS profit_margin
FROM v_order_items_enriched
GROUP BY region
ORDER BY profit DESC;

-- H) Shipping speed by ship mode
SELECT
  ship_mode,
  ROUND(AVG(ship_days), 2) AS avg_ship_days,
  COUNT(*) AS line_items,
  ROUND(SUM(sales), 2) AS sales,
  ROUND(SUM(profit), 2) AS profit
FROM v_order_items_enriched
GROUP BY ship_mode
ORDER BY avg_ship_days ASC;

-- I) High sales, low profit: sub-categories with large sales but weak/negative margin
SELECT
  sub_category,
  ROUND(SUM(sales), 2) AS sales,
  ROUND(SUM(profit), 2) AS profit,
  ROUND(SUM(profit) / NULLIF(SUM(sales), 0), 4) AS profit_margin
FROM v_order_items_enriched
GROUP BY sub_category
HAVING SUM(sales) >= 50000
ORDER BY profit_margin ASC
LIMIT 15;

-- J) Top loss-making products (where profit leakage is concentrated)
SELECT
  product_name,
  category,
  sub_category,
  ROUND(SUM(sales), 2) AS sales,
  ROUND(SUM(profit), 2) AS profit,
  ROUND(SUM(profit) / NULLIF(SUM(sales), 0), 4) AS profit_margin
FROM v_order_items_enriched
GROUP BY product_name, category, sub_category
ORDER BY profit ASC
LIMIT 15;

-- K) New vs returning customers by month (based on first order month)
WITH first_order AS (
  SELECT
    customer_id,
    MIN(order_date_iso) AS first_order_date
  FROM v_order_items_enriched
  GROUP BY customer_id
),
orders_by_month AS (
  SELECT DISTINCT
    customer_id,
    substr(order_date_iso, 1, 7) AS order_month
  FROM v_order_items_enriched
)
SELECT
  obm.order_month,
  SUM(CASE WHEN substr(fo.first_order_date, 1, 7) = obm.order_month THEN 1 ELSE 0 END) AS new_customers,
  SUM(CASE WHEN substr(fo.first_order_date, 1, 7) < obm.order_month THEN 1 ELSE 0 END) AS returning_customers
FROM orders_by_month obm
JOIN first_order fo ON fo.customer_id = obm.customer_id
GROUP BY obm.order_month
ORDER BY obm.order_month;
