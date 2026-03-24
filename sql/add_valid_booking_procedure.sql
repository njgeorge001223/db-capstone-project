DELIMITER //

CREATE PROCEDURE add_valid_booking(IN b_date DATE, IN t_num INT)
BEGIN
    -- Declare a variable to hold the booking count
    DECLARE tbl_exists INT DEFAULT 0;

    -- Start the transaction
    START TRANSACTION;

    -- Check if the table is now double-booked for that date
    SELECT COUNT(*) INTO tbl_exists
    FROM bookings
    WHERE booking_date = b_date AND table_number = t_num;

    -- Logic to Commit or Rollback
    IF tbl_exists > 1 THEN
        ROLLBACK;
        SELECT CONCAT('Table ', t_num, ' is already booked - booking cancelled') AS 'Booking status';
    ELSE
        COMMIT;
        SELECT CONCAT('Table ', t_num, ' is available - booking successful') AS 'Booking status';
    END IF;

END //

DELIMITER ;