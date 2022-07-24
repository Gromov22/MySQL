-- Задание №2

-- Создадим 2 фейковых столбца с некорректной датой
ALTER TABLE users ADD COLUMN wrong_created_at VARCHAR(255);
ALTER TABLE users ADD COLUMN wrong_updated_at VARCHAR(255);

UPDATE users
SET
wrong_created_at = '20.10.2017 8:10',
wrong_updated_at = '20.10.2017 8:10';

-- Поменяем формат
UPDATE users
SET
wrong_created_at = STR_TO_DATE(wrong_created_at, '%d.%m.%Y %k:%i'),
wrong_updated_at = STR_TO_DATE(wrong_updated_at, '%d.%m.%Y %k:%i');

-- Поменяем тип данных
ALTER TABLE users CHANGE wrong_created_at right_created_at DATETIME;
ALTER TABLE users CHANGE wrong_updated_at right_updated_at DATETIME;

ALTER TABLE users DROP COLUMN right_created_at;
ALTER TABLE users DROP COLUMN right_updated_at;