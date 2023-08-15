WITH pizzas_ingredients AS(
SELECT
	o.item_id,
	i.sku,
	i.item_name,
	i.item_size,
	r.ing_id,
	ing.ing_name,
	r.quantity AS recipe_quantity,
	SUM(o.quantity) AS order_quantity,
	ing.ing_weight,
	ing.ing_price
FROM orders AS o
LEFT JOIN item AS i ON o.item_id = i.item_id	
LEFT JOIN recipe AS r ON i.sku = r.recipe_id
LEFT JOIN ingredient AS ing ON ing.ing_id = r.ing_id
GROUP BY 1,2,3,4,5,6,7,9,10
)
SELECT
	p.item_name,
	p.item_size,
	p.ing_id,
	p.ing_name,
	p.ing_weight,
	p.ing_price,
	p.ing_price / p.ing_weight AS unit_cost,
	p.order_quantity,
	p.recipe_quantity,
	p.order_quantity * p.recipe_quantity AS ordered_weight,
	(p.ing_price / p.ing_weight) * (p.order_quantity * p.recipe_quantity) AS ingredient_cost_total
FROM pizzas_ingredients AS p
