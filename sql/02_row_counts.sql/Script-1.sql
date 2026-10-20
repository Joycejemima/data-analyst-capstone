SELECT 'customers' AS table_name, COUNT(*) AS row_count, 99441 AS expected FROM customers
UNION ALL SELECT 'orders', COUNT(*), 99441 FROM orders
UNION ALL SELECT 'order_items', COUNT(*), 112650 FROM order_items
UNION ALL SELECT 'products', COUNT(*), 32951 FROM products
UNION ALL SELECT 'sellers', COUNT(*), 3095 FROM sellers
UNION ALL SELECT 'order_payments', COUNT(*), 103886 FROM order_payments
UNION ALL SELECT 'order_reviews', COUNT(*), 99224 FROM order_reviews
UNION ALL SELECT 'geolocation', COUNT(*), 1000163 FROM geolocation
UNION ALL SELECT 'product_category_translation', COUNT(*), 71 FROM product_category_translation;