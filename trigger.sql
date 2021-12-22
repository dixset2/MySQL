DROP TRIGGER IF EXISTS nullTrigger;
delimiter //
CREATE TRIGGER nullTrigger BEFORE INSERT ON products
    FOR EACH ROW
BEGIN
    IF(ISNULL(NEW.name)) THEN
        SET NEW.name = 'NoName';
END IF;
IF(ISNULL(NEW.description)) THEN
        SET NEW.description = 'No Desc';
END IF;
END //
delimiter ;

INSERT INTO products (name, description, price, catalog_id)
VALUES (NULL, NULL, 20000, 12); -- FAIL ! Trigger Warning