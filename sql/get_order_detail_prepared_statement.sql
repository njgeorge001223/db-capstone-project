-- 1. Prepare the statement
PREPARE get_order_detail FROM 
'SELECT order_id, quantity, total_cost FROM orders WHERE booking_id = ?';

-- 2. Create the variable and assign it a value
SET @id = 1;

-- 3. Execute the prepared statement using the variable
EXECUTE get_order_detail USING @id;