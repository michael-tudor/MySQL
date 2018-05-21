SELECT id, name, description, tax_category_id, slug, p.variant_id, p.amount, p.currency
FROM spree_products
LEFT JOIN (
	SELECT v.product_id, p.variant_id, p.amount, p.currency
	FROM spree_prices AS p
	LEFT JOIN (
		SELECT v.id, v.product_id
		FROM spree_variants AS v
		WHERE id IN (217,221,226)
		AND deleted_at IS NULL
	) AS v
	ON v.id = p.variant_id
	WHERE v.id IS NOT NULL
	AND currency = 'MDL'
	AND deleted_at IS NULL
) AS p
ON p.product_id = id
WHERE p.product_id IS NOT NULL
AND deleted_at IS NULL
;
+----+---------------+-------------+-----------------+------------+---------+----------+
| id | name          | description | tax_category_id | variant_id | amount  | currency |
+----+---------------+-------------+-----------------+------------+---------+----------+
| 15 | KS top x2     |             |            NULL |        217 | 1400.00 | MDL      |
| 16 | KS bottom 1&M |             |            NULL |        221 | 1200.00 | MDL      |
| 17 | KS bottom 1x1 |             |            NULL |        226 | 1100.00 | MDL      |
+----+---------------+-------------+-----------------+------------+---------+----------+
