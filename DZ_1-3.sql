USE vk;

/* 1) Пусть задан некоторый пользователь (id = 1). Из всех пользователей соц. сети
 найдите человека, который больше всех общался с выбранным пользователем
 (написал ему сообщений). */

SELECT
m.from_user_id,
m.to_user_id,
COUNT(*)AS total
FROM messages AS m
INNER JOIN users u
ON m.from_user_id = u.id
WHERE to_user_id = 1
GROUP BY from_user_id
ORDER BY total DESC LIMIT 1;

/* 2) Подсчитать общее количество лайков, которые получили пользователи младше 10 лет. */

SELECT
COUNT(*) AS likes_under_10
FROM likes l
INNER JOIN media m 
ON l.media_id = m.user_id
INNER JOIN profiles p
ON m.user_id = p.user_id
WHERE YEAR(NOW()) - YEAR(p.birthday) < 10;

/* 3) Определить кто больше поставил лайков (всего): мужчины или женщины. */

SELECT
p.gender,
COUNT(l.user_id) AS likes
FROM likes l
INNER JOIN profiles p
ON l.user_id = p.user_id
GROUP BY p.gender;