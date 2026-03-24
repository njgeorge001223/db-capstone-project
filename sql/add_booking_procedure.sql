DELIMITER //

CREATE PROCEDURE add_booking(
    IN b_id INT, 
    IN c_id INT, 
    IN t_num INT, 
    IN b_date DATE
)
BEGIN
    -- Insert the record into the Bookings table
    INSERT INTO bookings (booking_id, customer_id, table_number, booking_date)
    VALUES (b_id, c_id, t_num, b_date);

    -- Output confirmation message
    SELECT 'New booking added' AS 'Confirmation';
END //

DELIMITER ;