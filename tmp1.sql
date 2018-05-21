SELECT DISTINCT option_value_id FROM spree_option_value_variants AS ovv
LEFT JOIN (
	SELECT v.id, v.sku, v.is_master, v.product_id, v.position FROM spree_variants AS v
	LEFT JOIN (
		SELECT * FROM product_childrens AS pc
		WHERE pc.product_id = 14
		AND pc.in_set = 0
	) AS pc
	ON pc.children_id = v.product_id
	WHERE v.deleted_at IS NULL
	AND pc.product_id IS NOT NULL
) AS v ON v.id = ovv.variant_id
WHERE v.id IS NOT NULL;

+-----+-----+-----------+------------+----------+
| id  | sku | is_master | product_id | position |
+-----+-----+-----------+------------+----------+
| 211 |     |         1 |         15 |        1 |
| 216 |     |         0 |         15 |        2 |
| 217 |     |         0 |         15 |        3 |
| 218 |     |         0 |         15 |        4 |
| 219 |     |         0 |         15 |        5 |
| 220 |     |         0 |         15 |        6 |
| 212 |     |         1 |         16 |        1 |
| 221 |     |         0 |         16 |        2 |
| 222 |     |         0 |         16 |        3 |
| 223 |     |         0 |         16 |        4 |
| 224 |     |         0 |         16 |        5 |
| 225 |     |         0 |         16 |        6 |
| 213 |     |         1 |         17 |        1 |
| 226 |     |         0 |         17 |        2 |
| 227 |     |         0 |         17 |        3 |
| 228 |     |         0 |         17 |        4 |
| 229 |     |         0 |         17 |        5 |
| 230 |     |         0 |         17 |        6 |
| 214 |     |         1 |         18 |        1 |
| 231 |     |         0 |         18 |        2 |
| 232 |     |         0 |         18 |        3 |
| 233 |     |         0 |         18 |        4 |
| 234 |     |         0 |         18 |        5 |
+-----+-----+-----------+------------+----------+

SELECT DISTINCT option_value_id FROM spree_option_value_variants AS ovv LEFT JOIN ( SELECT v.id, v.sku, v.is_master, v.product_id, v.position FROM spree_variants AS v LEFT JOIN ( SELECT * FROM product_childrens AS pc WHERE pc.product_id = 14 AND pc.in_set = 0 ) AS pc ON pc.children_id = v.product_id WHERE v.deleted_at IS NULL AND pc.product_id IS NOT NULL ) AS v ON v.id = ovv.variant_id WHERE v.id IS NOT NULL;
+-----------------+
| option_value_id |
+-----------------+
|               1 |
|               9 |
|              14 |
|              10 |
|              20 |
|              17 |
|              22 |
|              23 |
+-----------------+



SELECT DISTINCT option_value_id FROM spree_option_value_variants AS ovv
LEFT JOIN (
	SELECT v.id, v.sku, v.is_master, v.product_id, v.position FROM spree_variants AS v
	LEFT JOIN (
		SELECT * FROM product_childrens AS pc
		WHERE pc.product_id = 14
		AND pc.in_set = 0
	) AS pc
	ON pc.children_id = v.product_id
	WHERE v.deleted_at IS NULL
	AND pc.product_id IS NOT NULL
) AS v ON v.id = ovv.variant_id
WHERE v.id IS NOT NULL;
