DELIMITER //

CREATE PROCEDURE cancel_booking(IN b_id INT)
BEGIN
    -- Delete the record that matches the input ID
    DELETE FROM bookings 
    WHERE booking_id = b_id;

    -- Output confirmation message
    SELECT CONCAT('Booking ', b_id, ' cancelled') AS 'Confirmation';
END //

DELIMITER ;