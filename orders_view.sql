CREATE VIEW orders_view AS
SELECT order_id, quantity, total_cost
FROM orders
WHERE quantity > 2;

SELECT * FROM orders_view;