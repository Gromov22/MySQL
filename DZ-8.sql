-- Задание №3

DROP TABLE IF EXISTS test_table;
CREATE TABLE test_table (
	value INT UNSIGNED NOT NULL
);

INSERT INTO test_table VALUES
	(1),
	(2),
	(3),
	(4),
	(5);
	
SELECT EXP(SUM(LOG(value))) AS factorial
FROM test_table tt ;