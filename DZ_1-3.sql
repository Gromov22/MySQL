USE vk;


/* 1) Пусть задан некоторый пользователь.
Из всех пользователей соц. сети найдите человека,
который больше всех общался с выбранным пользователем (написал ему сообщений).*/

SELECT
from_user_id,
COUNT(*) AS total
FROM messages
WHERE to_user_id = 1
GROUP BY from_user_id
ORDER BY total DESC LIMIT 1;



/* 2) Подсчитать общее количество лайков, которые получили пользователи младше 10 лет */

SELECT COUNT(*) AS likes_under_10 FROM likes
WHERE media_id IN 
	(SELECT TIMESTAMPDIFF(YEAR, birthday, NOW()) AS age FROM profiles HAVING age < 10
);



/* 3) Определить кто больше поставил лайков (всего): мужчины или женщины. */
SELECT
gender,
COUNT(*) AS likes
FROM profiles
WHERE user_id IN (SELECT user_id FROM likes)
GROUP BY gender;