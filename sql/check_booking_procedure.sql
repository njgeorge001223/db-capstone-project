DELIMITER //

CREATE PROCEDURE check_booking(IN b_date DATE, IN t_num INT)
BEGIN

    IF EXISTS 
    (
        SELECT 1 
        FROM bookings 
        WHERE booking_date = b_date AND table_number = t_num
    ) THEN SELECT CONCAT('Table ', t_num, ' is already booked') AS 'Booking status';
    ELSE SELECT CONCAT('Table ', t_num, ' is available') AS 'Booking status';
    END IF;

END //

DELIMITER ;