DELIMITER //

CREATE PROCEDURE CancelOrder(IN order_id_to_cancel INT)
BEGIN
    -- 1. Delete the record from the orders table
    DELETE FROM orders 
    WHERE order_id = order_id_to_cancel;

    -- 2. Display the confirmation message
    SELECT CONCAT("Order ", order_id_to_cancel, " is cancelled") AS Confirmation;
END //

DELIMITER ;

CALL CancelOrder(5);