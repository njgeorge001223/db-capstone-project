DELIMITER //

CREATE PROCEDURE manage_booking(IN b_date DATE, IN t_num INT, IN c_id INT)
BEGIN
    INSERT INTO bookings (booking_date, table_number, customer_id)
    VALUES (b_date, t_num, c_id);
    
    SELECT 'New booking added successfully' AS Status;
END //

DELIMITER ;