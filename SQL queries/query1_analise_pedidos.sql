SELECT
	o.order_id,
	i.item_price,
	o.quantity,
	i.item_cat,
	i.item_name,
	o.created_at,
	o.cust_id,
	c.cust_firstname,
	c.cust_address_id
FROM orders AS o
LEFT JOIN item AS i
ON o.item_id = i.item_id
LEFT JOIN customers AS c
ON o.cust_id = c.cust_id