USE World_of_Warcraft_DB;

-- Сколько специализаций-лекарей в игре и к какому классу они привязаны
SELECT 
s.name,
c.name
FROM specializations s
INNER JOIN classes c
ON (s.class = c.id)
WHERE category LIKE 'H%';

-- Сколько всего женских персонажей гоблинов-разбойников
SELECT
COUNT(*) AS female_goblin_rogues
FROM heroes
WHERE gender = 'F'
AND race = 14
AND class = 9;

-- Самая популярная раса
SELECT 
COUNT(*) AS players,
(SELECT name FROM playable_races AS pr WHERE pr.id = h.race) AS race
FROM heroes AS h 
GROUP BY race
ORDER BY race LIMIT 1;

-- Самый популярный класс
SELECT 
COUNT(*) AS players,
(SELECT name FROM classes AS c WHERE c.id = h.class) AS class
FROM heroes AS h 
GROUP BY class
ORDER BY class LIMIT 1;

-- Самое популярное дополнение по количеству созданных учетных записей
SELECT 
COUNT(*) AS account_growth,
e.name
FROM accounts AS a
INNER JOIN expansions AS e
ON (YEAR(a.created_at) BETWEEN YEAR(e.started_at) AND YEAR(e.ended_at))
GROUP BY e.name
ORDER BY account_growth DESC;

-- Какой тип сервера чаще предпочитают игроки
SELECT
COUNT(*) AS players,
r.realm_type
FROM heroes h
INNER JOIN realms r
ON (h.realm = r.realm_type)
GROUP BY realm
ORDER BY players DESC;

-- Сколько у пользователя персонажей на аккаунте
SELECT
a.user_name,
COUNT(*) AS total
FROM accounts a
INNER JOIN heroes h
ON (h.owner = a.id)
GROUP BY a.user_name;

-- Представление о соотношении фракций на разных серверах
CREATE OR REPLACE VIEW fraction_balance AS
SELECT 
name,
(SELECT COUNT(*) FROM heroes h WHERE h.realm = r.id AND h.fraction = 1) AS Alliance,
(SELECT COUNT(*) FROM heroes h WHERE h.realm = r.id AND h.fraction = 2) AS Horde
FROM
realms r;

SELECT
*
FROM fraction_balance;

-- Представление о количестве локаций в разных дополнениях
CREATE OR REPLACE VIEW locations_count_per_expansion AS
SELECT
COUNT(*) AS locations,
e.name 
FROM locations l
INNER JOIN expansions e
ON (l.expansion = e.id)
GROUP BY expansion
ORDER BY locations DESC;

SELECT
*
FROM
locations_count_per_expansion;

-- Хранимая процедура, которая подсказывает, идет ли сейчас какой-нибудь праздник

/*DROP PROCEDURE IF EXISTS what_is_event_now;
DELIMITER //
CREATE PROCEDURE what_is_event_now ()
BEGIN
	SELECT name AS 'today is'
	FROM events
	WHERE DATE(NOW()) BETWEEN starting_at AND ending_at ; 
END//
DELIMITER ;
*/

CALL what_is_event_now();