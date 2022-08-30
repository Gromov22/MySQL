/* 1) В базе данных shop и sample присутствуют одни и те же таблицы учебной
	базы данных. Переместите запись id = 1 из таблицы shop.users в таблицу sample.users.
	Используйте транзакции.
 */
 

START TRANSACTION;

SELECT *
FROM shop.users
WHERE id = 1;

SAVEPOINT shop_users_id_1;

INSERT INTO sample.users(id, name) VALUES
	(1, 'Геннадий');
	
DELETE FROM shop.users
WHERE id = 1;

COMMIT;

/* 2) Создайте представление, которое выводит название name товарной позиции
из таблицы products и соответствующее название каталога name из таблицы catalogs. */

CREATE OR REPLACE VIEW cat AS
SELECT
p.name AS product_name,
c.name AS catalog_name
FROM products p
INNER JOIN catalogs c
ON p.catalog_id = c.id;

SELECT * FROM cat;

/* 3) Пусть имеется таблица с календарным полем created_at. 
 * В ней размещены разряженые календарные записи за август 2018 года
 *  '2018-08-01', '2016-08-04', '2018-08-16' и 2018-08-17.
 *  Составьте запрос, который выводит полный список дат за август,
 *  выставляя в соседнем поле значение 1, если дата присутствует в исходном таблице
 *  и 0, если она отсутствует. */

DROP TABLE IF EXISTS test_date;
CREATE TABLE test_date (
	`date` DATE
);

INSERT INTO test_date(`date`) VALUES
	('2018-08-01'),
	('2018-08-04'),
	('2018-08-16'),
	('2018-08-17');

SELECT
*,
(SELECT EXISTS(SELECT * FROM test_date WHERE `date` = august)) AS tbl_date
FROM 
(SELECT ADDDATE('1970-01-01',t4*10000 + t3*1000 + t2*100 + t1*10 + t0) AS august FROM
 (SELECT 0 t0 UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) t0,
 (SELECT 0 t1 UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) t1,
 (SELECT 0 t2 UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) t2,
 (SELECT 0 t3 UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) t3,
 (SELECT 0 t4 UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) t4) v
WHERE august BETWEEN '2018-08-01' AND '2018-08-31'
ORDER BY august;

/* Пусть имеется любая таблица с календарным полем created_at.
 Создайте запрос, который удаляет устаревшие записи из таблицы,
 оставляя только 5 самых свежих записей. */


USE vk;

PREPARE stmt FROM "DELETE FROM profiles ORDER BY created_at LIMIT ?";
SET @cnt=(SELECT COUNT(1)-5 FROM profiles);
EXECUTE stmt USING @cnt;


/* Создайте двух пользователей которые имеют доступ к базе данных shop.
 * Первому пользователю shop_read должны быть доступны только запросы на чтение данных,
 * второму пользователю shop — любые операции в пределах базы данных shop. */

DROP USER IF EXISTS 'shop_read@localhost';
CREATE USER 'shop_read@localhost' IDENTIFIED WITH '123';

DROP USER IF EXISTS 'shop@localhost';
CREATE USER 'shop@localhost' IDENTIFIED WITH '345';

GRANT SELECT ON shop.* TO 'shop_read@localhost';

GRANT ALL ON shop.* TO 'shop@localhost';
GRANT GRANT OPTION ON shop.* TO 'shop@localhost';


/* 1) Создайте хранимую функцию hello(), которая будет возвращать приветствие,
 * в зависимости от текущего времени суток. С 6:00 до 12:00 функция должна
 * возвращать фразу "Доброе утро", с 12:00 до 18:00 функция должна возвращать фразу
 * "Добрый день", с 18:00 до 00:00 — "Добрый вечер", с 00:00 до 6:00 — "Доброй ночи".
 */


DELIMITER //
DROP FUNCTION IF EXISTS hello//
CREATE FUNCTION hello ()
	RETURNS TEXT DETERMINISTIC
	BEGIN
		IF CURRENT_TIME() BETWEEN '06:00:00' AND '11:59:59' THEN
			RETURN 'Good morning!';
		ELSEIF CURRENT_TIME() BETWEEN '12:00:00' AND '17:59:59' THEN 
			RETURN 'Good afternoon!';
		ELSEIF CURRENT_TIME() BETWEEN '18:00:00' AND '23:59:59' THEN 
			RETURN 'Good evening!';
		ELSE
			RETURN 'Good night!';
		END IF;
	END//

SELECT hello()//

-- Вариант через CASE
DELIMITER //
DROP FUNCTION IF EXISTS hello//
CREATE FUNCTION hello ()
	RETURNS TEXT DETERMINISTIC
	BEGIN
		CASE
			WHEN CURRENT_TIME() BETWEEN '06:00:00' AND '11:59:59' THEN
				RETURN 'Good morning!';
			WHEN CURRENT_TIME() BETWEEN '12:00:00' AND '17:59:59' THEN 
				RETURN 'Good afternoon!';
			WHEN CURRENT_TIME() BETWEEN '18:00:00' AND '23:59:59' THEN 
				RETURN 'Good evening!';
			WHEN CURRENT_TIME() BETWEEN '00:00:00' AND '05:59:59' THEN 
				RETURN 'Good night!';
		END CASE;
	END//

SELECT hello()//



/* 2) В таблице products есть два текстовых поля: name с названием товара и description
 с его описанием. Допустимо присутствие обоих полей или одно из них.
 Ситуация, когда оба поля принимают неопределенное значение NULL неприемлема.
 Используя триггеры, добейтесь того, чтобы одно из этих полей или оба поля были заполнены.
 При попытке присвоить полям NULL-значение необходимо отменить операцию. */

DELIMITER //
DROP TRIGGER IF EXISTS not_null//
CREATE TRIGGER not_null BEFORE INSERT ON products
FOR EACH ROW
BEGIN
	IF(ISNULL(NEW.name)) AND ISNULL(NEW.description) THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'NULL is not allowed';
	END IF;
END//

DELIMITER ;

INSERT INTO products(name, description) VALUES
	(NULL, '1'); -- Работает
	
INSERT INTO products(name, description) VALUES
	('1', NULL); -- Работает
	
INSERT INTO products(name, description) VALUES
	(NULL, NULL); -- Не работает
	
/* 3)(по желанию) Напишите хранимую функцию для вычисления произвольного числа Фибоначчи. 
 Числами Фибоначчи называется последовательность в которой число равно сумме двух
 предыдущих чисел. Вызов функции FIBONACCI(10) должен возвращать число 55.
 */
	

DELIMITER //
DROP FUNCTION IF EXISTS fibonacci//
CREATE FUNCTION fibonacci (value INT UNSIGNED)
RETURNS INT DETERMINISTIC
BEGIN 
	DECLARE counter INT;
	SET @one = 1;
	SET @two = 1;
	IF(value > 2) THEN
		SET counter = 3;
		WHILE counter <= value DO
			SET @two = @one + @two;
			SET @one = @two - @one;
			SET counter = counter + 1;
		END WHILE;
	ELSEIF(value = 0) THEN
		RETURN 0;
	END IF;
	RETURN @two;
END//

DELIMITER ;
SELECT fibonacci(10);