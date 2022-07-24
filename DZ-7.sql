-- Задание №2

SELECT
DAYNAME(CONCAT(YEAR(NOW()), '-', SUBSTRING(birthday_at, 6, 10))) AS day_of_week,
COUNT(DAYNAME(CONCAT(YEAR(NOW()), '-', SUBSTRING(birthday_at, 6, 10)))) AS birthday_amount
FROM users
GROUP BY 
day_of_week;