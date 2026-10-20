SELECT 'customers' AS table_name, 'customer_id' AS column_checked,
       COUNT(*) AS total_rows, COUNT(DISTINCT customer_id) AS distinct_values,
       CASE WHEN COUNT(*) = COUNT(DISTINCT customer_id) THEN 'YES' ELSE 'no' END AS unique_per_row
FROM customers
UNION ALL
SELECT 'customers', 'customer_unique_id', COUNT(*), COUNT(DISTINCT customer_unique_id),
       CASE WHEN COUNT(*) = COUNT(DISTINCT customer_unique_id) THEN 'YES' ELSE 'no' END
FROM customers
UNION ALL
SELECT 'orders', 'order_id', COUNT(*), COUNT(DISTINCT order_id),
       CASE WHEN COUNT(*) = COUNT(DISTINCT order_id) THEN 'YES' ELSE 'no' END
FROM orders
UNION ALL
SELECT 'orders', 'customer_id', COUNT(*), COUNT(DISTINCT customer_id),
       CASE WHEN COUNT(*) = COUNT(DISTINCT customer_id) THEN 'YES' ELSE 'no' END
FROM orders
UNION ALL
SELECT 'order_items', 'order_id', COUNT(*), COUNT(DISTINCT order_id),
       CASE WHEN COUNT(*) = COUNT(DISTINCT order_id) THEN 'YES' ELSE 'no' END
FROM order_items
UNION ALL
SELECT 'order_items', 'order_id + order_item_id', COUNT(*), COUNT(DISTINCT (order_id, order_item_id)),
       CASE WHEN COUNT(*) = COUNT(DISTINCT (order_id, order_item_id)) THEN 'YES' ELSE 'no' END
FROM order_items
UNION ALL
SELECT 'products', 'product_id', COUNT(*), COUNT(DISTINCT product_id),
       CASE WHEN COUNT(*) = COUNT(DISTINCT product_id) THEN 'YES' ELSE 'no' END
FROM products
UNION ALL
SELECT 'sellers', 'seller_id', COUNT(*), COUNT(DISTINCT seller_id),
       CASE WHEN COUNT(*) = COUNT(DISTINCT seller_id) THEN 'YES' ELSE 'no' END
FROM sellers
UNION ALL
SELECT 'order_payments', 'order_id', COUNT(*), COUNT(DISTINCT order_id),
       CASE WHEN COUNT(*) = COUNT(DISTINCT order_id) THEN 'YES' ELSE 'no' END
FROM order_payments
UNION ALL
SELECT 'order_payments', 'order_id + payment_sequential', COUNT(*), COUNT(DISTINCT (order_id, payment_sequential)),
       CASE WHEN COUNT(*) = COUNT(DISTINCT (order_id, payment_sequential)) THEN 'YES' ELSE 'no' END
FROM order_payments
UNION ALL
SELECT 'order_reviews', 'review_id', COUNT(*), COUNT(DISTINCT review_id),
       CASE WHEN COUNT(*) = COUNT(DISTINCT review_id) THEN 'YES' ELSE 'no' END
FROM order_reviews
UNION ALL
SELECT 'order_reviews', 'order_id', COUNT(*), COUNT(DISTINCT order_id),
       CASE WHEN COUNT(*) = COUNT(DISTINCT order_id) THEN 'YES' ELSE 'no' END
FROM order_reviews
UNION ALL
SELECT 'geolocation', 'geolocation_zip_code_prefix', COUNT(*), COUNT(DISTINCT geolocation_zip_code_prefix),
       CASE WHEN COUNT(*) = COUNT(DISTINCT geolocation_zip_code_prefix) THEN 'YES' ELSE 'no' END
FROM geolocation
UNION ALL
SELECT 'product_category_translation', 'product_category_name', COUNT(*), COUNT(DISTINCT product_category_name),
       CASE WHEN COUNT(*) = COUNT(DISTINCT product_category_name) THEN 'YES' ELSE 'no' END
FROM product_category_translation;