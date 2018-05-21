select v.id, ovv.option_value_id, v.sku, v.is_master, v.product_id, v.cost_currency from spree_option_value_variants ovv LEFT JOIN spree_variants AS v ON ovv.variant_id = v.id where ovv.option_value_id = 4 AND product_id = 14;
+------+-----------------+------+-----------+------------+---------------+
| id   | option_value_id | sku  | is_master | product_id | cost_currency |
+------+-----------------+------+-----------+------------+---------------+
|  199 |               4 |      |         0 |         14 | MDL           |
|  202 |               4 |      |         0 |         14 | MDL           |
|  205 |               4 |      |         0 |         14 | MDL           |
|  208 |               4 |      |         0 |         14 | MDL           |
+------+-----------------+------+-----------+------------+---------------+

select GROUP_CONCAT(v.id SEPARATOR ',') AS result from spree_option_value_variants ovv LEFT JOIN spree_variants AS v ON ovv.variant_id = v.id where ovv.option_value_id = 4 AND product_id = 14;
+-----------------+
| result          |
+-----------------+
| 199,202,205,208 |
+-----------------+

select GROUP_CONCAT(DISTINCT(option_value_id) SEPARATOR ',') AS result from spree_option_value_variants where variant_id IN (199, 202, 205, 208);
+-------------+
| result      |
+-------------+
| 4,8,9,10,14 |
+-------------+
