-- Задание №3

DROP TABLE IF EXISTS test_storehouse_products;
CREATE TABLE test_storehouse_products (
	value BIGINT UNSIGNED NOT NULL
);

INSERT INTO test_storehouse_products VALUES
	(0),
	(2500),
	(0),
	(30),
	(500),
	(1);

SELECT * FROM test_storehouse_products ORDER BY IF(value > 0, 0, 1), value;