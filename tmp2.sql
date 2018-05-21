SELECT DISTINCT option_value_id FROM spree_option_value_variants
LEFT JOIN (
	SELECT ovv.variant_id FROM spree_option_value_variants AS ovv
	LEFT JOIN (
		SELECT v.id, v.sku, v.is_master, v.product_id, v.position FROM spree_variants AS v
		LEFT JOIN (
			SELECT * FROM product_childrens AS pc
			WHERE pc.product_id = 14
			AND pc.in_set = 0
		) AS pc ON pc.children_id = v.product_id
		WHERE v.deleted_at IS NULL
		AND pc.product_id IS NOT NULL
	) AS v ON v.id = ovv.variant_id
	WHERE ovv.option_value_id = 23
	AND v.id IS NOT NULL
) AS ovv ON ovv.variant_id = spree_option_value_variants.variant_id
WHERE ovv.variant_id IS NOT NULL
ORDER BY option_value_id;
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

SELECT * FROM spree_option_value_variants WHERE option_value_id = 23 AND variant_id IN (211,216,217,218,219,220,212,221,222,223,224,225,213,226,227,228,229,230,214,231,232,233,234);
+------------+-----------------+-----+
| variant_id | option_value_id | id  |
+------------+-----------------+-----+
|        220 |              23 | 603 |
|        225 |              23 | 618 |
|        230 |              23 | 633 |
+------------+-----------------+-----+

SELECT * FROM spree_option_value_variants WHERE variant_id IN (220, 225, 230);
+------------+-----------------+-----+
| variant_id | option_value_id | id  |
+------------+-----------------+-----+
|        220 |              17 | 604 |
|        220 |              22 | 605 |
|        220 |              23 | 603 |
|        225 |              17 | 619 |
|        225 |              22 | 620 |
|        225 |              23 | 618 |
|        230 |              17 | 634 |
|        230 |              22 | 635 |
|        230 |              23 | 633 |
+------------+-----------------+-----+
