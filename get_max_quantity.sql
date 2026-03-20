DELIMITER //

CREATE PROCEDURE get_max_quantity()
BEGIN
    SELECT MAX(quantity) AS 'Max Quantity in Orders'
    FROM orders;
END //

DELIMITER ;

CALL get_max_quantity();