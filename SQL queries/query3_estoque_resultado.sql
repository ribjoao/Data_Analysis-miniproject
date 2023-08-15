WITH total_weight_ing AS(
SELECT 
	ing_id,
	ing_name,
	SUM(ordered_weight) AS ordered_weight
FROM estoque1
GROUP BY ing_id, ing_name
)
SELECT
	tw.ing_name,
	tw.ordered_weight,
	ing.ing_weight * inv.quantity AS total_inv_weight,
	(ing.ing_weight * inv.quantity)-tw.ordered_weight AS remaining_weight
	
FROM total_weight_ing AS tw
LEFT JOIN inventory AS inv ON inv.inv_id = tw.ing_id
LEFT JOIN ingredient AS ing ON ing.ing_id = tw.ing_id