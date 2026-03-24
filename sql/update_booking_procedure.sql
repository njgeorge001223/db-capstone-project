DELIMITER //

CREATE PROCEDURE update_booking(IN b_id INT, IN b_date DATE)
BEGIN
    -- Update the date for the specified booking ID
    UPDATE bookings 
    SET booking_date = b_date 
    WHERE booking_id = b_id;

    -- Output confirmation message
    SELECT CONCAT('Booking ', b_id, ' updated') AS 'Confirmation';
END //

DELIMITER ;