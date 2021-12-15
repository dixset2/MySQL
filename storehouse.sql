INSERT INTO
    storehouses_products (storehouse_id, product_id, value)
VALUES
    (1, 1, 25),
    (1, 2, 0),
    (1, 4, 9),
    (1, 7, 0),
    (1, 3, 12);

SELECT value FROM storehouses_products
ORDER BY IF (value > 0, 0, 1), value;