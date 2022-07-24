-- Задание №5

SELECT * FROM catalogs
WHERE id IN(5, 1, 2)
ORDER BY CASE
	WHEN id = 5 THEN 1
	WHEN id = 1 THEN 2
	WHEN id = 2 THEN 3
END;