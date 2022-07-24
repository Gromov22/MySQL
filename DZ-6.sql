-- Задание №1

SELECT
AVG(TIMESTAMPDIFF(YEAR, birthday_at, NOW())) AS average_age
FROM
users;