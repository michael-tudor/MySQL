SELECT id, name, description, slug, tax_category_id, promotionable, pc.by_default, pc.necessarily, pc.in_set, pc.variant_id, pc.sku, pc.amount, pc.currency, pc.is_master
FROM spree_products
LEFT JOIN (
	SELECT pc.children_id, pc.by_default, pc.necessarily, pc.in_set, v.variant_id, v.sku, v.amount, v.currency, v.is_master
	FROM product_childrens AS pc
	LEFT JOIN (
		SELECT p.variant_id, v.product_id, v.sku, p.amount, p.currency, v.is_master
		FROM spree_variants AS v
		LEFT JOIN (
			SELECT p.variant_id, p.amount, p.currency
			FROM spree_prices AS p
			LEFT JOIN (
				SELECT ovv.variant_id
				FROM spree_option_value_variants AS ovv
				LEFT JOIN (
					SELECT v.id
					FROM spree_variants AS v
					LEFT JOIN (
						SELECT children_id
						FROM product_childrens
						WHERE product_id = 14
						AND in_set = 0
					) AS pc
					ON pc.children_id = v.product_id
					WHERE pc.children_id IS NOT NULL
				) AS v
				ON v.id = ovv.variant_id
				WHERE v.id IS NOT NULL
				AND ovv.option_value_id IN (1,9,10)
				GROUP BY ovv.variant_id HAVING count(*) = 3
			) AS ovv
			ON ovv.variant_id = p.variant_id
			WHERE ovv.variant_id IS NOT NULL
			AND p.currency = 'MDL'
			AND p.deleted_at IS NULL
		) AS p
		ON p.variant_id = v.id
		WHERE p.variant_id IS NOT NULL
		AND v.deleted_at IS NULL
	) AS v
	ON v.product_id = pc.children_id
	WHERE v.product_id IS NOT NULL
	AND pc.product_id = 14
) AS pc
ON pc.children_id = id
WHERE pc.children_id IS NOT NULL
;

+----+------+-------------+------+-----------------+---------------+------------+-------------+--------+------------+------+---------+----------+-----------+
| id | name | description | slug | tax_category_id | promotionable | by_default | necessarily | in_set | variant_id | sku  | amount  | currency | is_master |
+----+------+-------------+------+-----------------+---------------+------------+-------------+--------+------------+------+---------+----------+-----------+
| 15 | 01   |             | 01   |            NULL |             1 |          1 |           1 |      0 |        217 |      | 1400.00 | MDL      |         0 |
| 16 | 02   |             | 02   |            NULL |             1 |          1 |           0 |      0 |        221 |      | 1200.00 | MDL      |         0 |
| 17 | 03   |             | 03   |            NULL |             1 |          1 |           0 |      0 |        226 |      | 1100.00 | MDL      |         0 |
| 18 | 04   |             | 04   |            NULL |             1 |          0 |           0 |      0 |        231 |      |  980.00 | MDL      |         0 |
+----+------+-------------+------+-----------------+---------------+------------+-------------+--------+------------+------+---------+----------+-----------+
