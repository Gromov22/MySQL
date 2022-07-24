-- Задание №4

SELECT name, birthday_at,
CASE
	WHEN DATE_FORMAT(birthday_at,'%m') = 05 THEN 'May'
	WHEN DATE_FORMAT(birthday_at,'%m') = 08 THEN 'August'
END AS 'month'
FROM
users 
WHERE DATE_FORMAT(birthday_at, '%m') = 05 OR DATE_FORMAT(birthday_at, '%m') = 08;