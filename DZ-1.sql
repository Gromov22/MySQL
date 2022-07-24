-- Задание №1

-- Поменяем все значения на NULL
UPDATE users
SET
created_at = NULL,
updated_at = NULL;

UPDATE users
SET
created_at = NOW(),
updated_at = NOW();
