-- Triggers -- 

-- Placeholder for syntax -- 

DELIMITER $$
CREATE 
	TRIGGER test_trigger AFTER INSERT
    ON hotel
    FOR EACH ROW BEGIN
		INSERT INTO hotel_phone VALUES(NEW.hotel_id, NEW.chain, 'New Phone!');
	END$$
DELIMITER ;

INSERT INTO hotel VALUES(); 