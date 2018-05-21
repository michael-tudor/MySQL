SELECT * FROM product_childrens WHERE product_id = 14 AND in_set = 0;
+-------------+
| result      |
+-------------+
| 15,16,17,18 |
+-------------+

select GROUP_CONCAT(id SEPARATOR ',') AS result from spree_variants where product_id in (15,16,17,18);
+---------------------------------------------------------------------------------------------+
| result                                                                                      |
+---------------------------------------------------------------------------------------------+
| 211,216,217,218,219,220,212,221,222,223,224,225,213,226,227,228,229,230,214,231,232,233,234 |
+---------------------------------------------------------------------------------------------+

select GROUP_CONCAT(variant_id SEPARATOR ',') AS result from spree_option_value_variants WHERE option_value_id = 9 AND variant_id IN (211,216,217,218,219,220,212,221,222,223,224,225,213,226,227,228,229,230,214,231,232,233,234);
+-----------------------------------------------------------------+
| result                                                          |
+-----------------------------------------------------------------+
| 216,217,218,219,221,222,223,224,226,227,228,229,231,232,233,234 |
+-----------------------------------------------------------------+

select GROUP_CONCAT(DISTINCT(option_value_id) SEPARATOR ',') AS result from spree_option_value_variants WHERE variant_id IN (216,217,218,219,221,222,223,224,226,227,228,229,231,232,233,234);
+--------------+
| result       |
+--------------+
| 1,9,10,14,20 |
+--------------+

SELECT pc.children_id, pc.by_default, pc.necessarily, pc.in_set, v.variant_id, v.sku, v.amount, v.currency, v.is_master, v.position
FROM product_childrens AS pc
LEFT JOIN (
	SELECT p.variant_id, v.product_id, v.sku, p.amount, p.currency, v.is_master, v.position
	FROM spree_variants AS v
	LEFT JOIN (
		SELECT p.variant_id, p.amount, p.currency
		FROM spree_prices AS p
		LEFT JOIN (
			SELECT variant_id
			FROM spree_option_value_variants
			WHERE option_value_id IN (1,9,10)
			AND variant_id IN (211,212,213,214,216,217,218,219,220,221,222,223,224,225,226,227,228,229,230,231,232,233,234)
			GROUP BY variant_id HAVING count(*) = 3
		) AS ovv
		ON ovv.variant_id = p.variant_id
		WHERE ovv.variant_id IS NOT NULL
		AND currency = 'MDL'
		AND deleted_at IS NULL
	) AS p
	ON p.variant_id = v.id
	WHERE p.variant_id IS NOT NULL
	AND deleted_at IS NULL
) AS v
ON v.product_id = pc.children_id
WHERE v.product_id IS NOT NULL
AND pc.product_id = 14
;

+-------------+------------+-------------+--------+------------+------+---------+----------+-----------+----------+
| children_id | by_default | necessarily | in_set | variant_id | sku  | amount  | currency | is_master | position |
+-------------+------------+-------------+--------+------------+------+---------+----------+-----------+----------+
|          15 |          1 |           1 |      0 |        217 |      | 1400.00 | MDL      |         0 |        3 |
|          16 |          1 |           0 |      0 |        221 |      | 1200.00 | MDL      |         0 |        2 |
|          17 |          1 |           0 |      0 |        226 |      | 1100.00 | MDL      |         0 |        2 |
|          18 |          0 |           0 |      0 |        231 |      |  980.00 | MDL      |         0 |        2 |
+-------------+------------+-------------+--------+------------+------+---------+----------+-----------+----------+
