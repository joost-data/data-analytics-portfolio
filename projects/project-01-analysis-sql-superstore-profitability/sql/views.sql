DROP VIEW IF EXISTS v_order_items_enriched;

-- Compatible with SQLite builds that only support instr(X, Y) with 2 arguments.
-- Parses M/D/YYYY into YYYY-MM-DD and creates an enriched view for analysis.

CREATE VIEW v_order_items_enriched AS
WITH parsed_orders AS (
  SELECT
    o.*,

    -- order_date: M/D/YYYY
    CAST(substr(o.order_date, 1, instr(o.order_date, '/') - 1) AS INT) AS order_m,
    CAST(
      substr(
        substr(o.order_date, instr(o.order_date, '/') + 1),
        1,
        instr(substr(o.order_date, instr(o.order_date, '/') + 1), '/') - 1
      ) AS INT
    ) AS order_d,
    CAST(
      substr(
        substr(o.order_date, instr(o.order_date, '/') + 1),
        instr(substr(o.order_date, instr(o.order_date, '/') + 1), '/') + 1
      ) AS INT
    ) AS order_y,

    -- ship_date: M/D/YYYY
    CAST(substr(o.ship_date, 1, instr(o.ship_date, '/') - 1) AS INT) AS ship_m,
    CAST(
      substr(
        substr(o.ship_date, instr(o.ship_date, '/') + 1),
        1,
        instr(substr(o.ship_date, instr(o.ship_date, '/') + 1), '/') - 1
      ) AS INT
    ) AS ship_d,
    CAST(
      substr(
        substr(o.ship_date, instr(o.ship_date, '/') + 1),
        instr(substr(o.ship_date, instr(o.ship_date, '/') + 1), '/') + 1
      ) AS INT
    ) AS ship_y

  FROM orders o
)
SELECT
  oi.row_id,
  po.order_id,

  -- ISO dates
  printf('%04d-%02d-%02d', po.order_y, po.order_m, po.order_d) AS order_date_iso,
  printf('%04d-%02d-%02d', po.ship_y,  po.ship_m,  po.ship_d)  AS ship_date_iso,

  -- Shipping time in days
  CAST(
    julianday(printf('%04d-%02d-%02d', po.ship_y,  po.ship_m,  po.ship_d))
    - julianday(printf('%04d-%02d-%02d', po.order_y, po.order_m, po.order_d))
  AS INT) AS ship_days,

  po.ship_mode,
  po.region,
  po.state,
  po.city,

  c.customer_id,
  c.customer_name,
  c.segment,

  p.product_id,
  p.category,
  p.sub_category,
  p.product_name,

  oi.sales,
  oi.quantity,
  oi.discount,
  oi.profit,

  CASE
    WHEN oi.sales IS NULL OR oi.sales = 0 THEN NULL
    ELSE oi.profit / oi.sales
  END AS line_profit_margin

FROM order_items oi
JOIN parsed_orders po ON oi.order_id = po.order_id
JOIN customers c ON po.customer_id = c.customer_id
JOIN products p ON oi.product_id = p.product_id;
