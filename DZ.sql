-- Задание №2

SELECT DISTINCT firstname
FROM users;

-- Задание №3

UPDATE profiles
SET
is_active = 0
WHERE YEAR(CURRENT_DATE()) - YEAR(birthday) < 18;

-- Задание №4

INSERT INTO messages VALUES
(21,15,18,'sfddfdf', '2048-11-09', CURRENT_TIMESTAMP);

DELETE FROM messages
WHERE created_at > NOW(); 