# Olist tables: keys and links

| Table | Rows | One row means | Primary key | Links to (join keys) |
|---|---|---|---|---|
| customers | 99,441 | one customer ID, created for one order | customer_id | customer_id from orders |
| orders | 99,441 | one order | order_id | customer_id to customers; order_id from order_items, order_payments, order_reviews |
| order_items | 112,650 | one item line inside an order | order_id + order_item_id | order_id to orders; product_id to products; seller_id to sellers |
| products | 32,951 | one product | product_id | product_id from order_items; product_category_name to product_category_translation |
| sellers | 3,095 | one seller | seller_id | seller_id from order_items |
| order_payments | 103,886 | one payment entry for an order | order_id + payment_sequential | order_id to orders |
| order_reviews | 99,224 | one review record | none (not unique) | order_id to orders |
| geolocation | 1,000,163 | one latitude/longitude point for a zip prefix | none (not unique) | zip prefix matches customers and sellers zip prefixes |
| product_category_translation | 71 | one category name with its English name | product_category_name | product_category_name from products |

## Notes
- customers: customer_id is created per order (99,441). customer_unique_id identifies the real person (96,096 people), so some people ordered more than once. Count customers with customer_unique_id.
- order_items: 98,666 distinct orders appear in 112,650 rows, so an order with several items has several rows.
- order_payments: 99,440 distinct orders in 103,886 rows, so an order can have more than one payment entry.
- order_reviews: review_id (98,410 distinct) and order_id (98,673 distinct) both repeat. Neither column is unique.
- geolocation: about 52 rows per zip prefix on average (1,000,163 rows, 19,015 prefixes). Joining on zip prefix directly would multiply rows, so aggregate first.