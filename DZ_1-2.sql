/* 1) Создайте таблицу logs типа Archive. Пусть при каждом создании записи в таблицах users, 
 catalogs и products в таблицу logs помещается время и дата создания записи,
 название таблицы, идентификатор первичного ключа и содержимое поля name. */
 

USE shop;

DROP TABLE IF EXISTS logs;
CREATE TABLE logs (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	created_at DATETIME NOT NULL,
	tbl_name VARCHAR(50) NOT NULL,
	id_key BIGINT UNSIGNED NOT NULL,
	name VARCHAR(256) NOT NULL
) ENGINE=ARCHIVE;


-- TRIGGER ON USERS
DROP TRIGGER IF EXISTS tg_on_users;
DELIMITER //
CREATE TRIGGER tg_on_users AFTER INSERT ON users
FOR EACH ROW
BEGIN
	INSERT INTO logs(created_at, tbl_name, id_key, name) VALUES
		(NOW(), 'users', NEW.id, NEW.name);
END//
DELIMITER ;

-- TRIGGER ON CATALOGS
DROP TRIGGER IF EXISTS tg_on_catalogs;
DELIMITER //
CREATE TRIGGER tg_on_catalogs AFTER INSERT ON catalogs
FOR EACH ROW
BEGIN
	INSERT INTO logs(created_at, tbl_name, id_key, name) VALUES
		(NOW(), 'catalogs', NEW.id, NEW.name);
END//
DELIMITER ;

-- TRIGGER ON PRODUCTS
DROP TRIGGER IF EXISTS tg_on_products;
DELIMITER //
CREATE TRIGGER tg_on_products AFTER INSERT ON catalogs
FOR EACH ROW
BEGIN
	INSERT INTO logs(created_at, tbl_name, id_key, name) VALUES
		(NOW(), 'products', NEW.id, NEW.name);
END//
DELIMITER ;


INSERT INTO users(name, birthday_at) VALUES
	('Sanya', '2000-03-22');

-- 2) Создайте SQL-запрос, который помещает в таблицу users миллион записей.

DROP TABLE IF EXISTS test_users;
CREATE TABLE test_users (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(100),
	created_at DATETIME,
	updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP
);

DROP PROCEDURE IF EXISTS shop.mln_users;
DELIMITER $$
CREATE PROCEDURE shop.mln_users()
BEGIN
	DECLARE i BIGINT DEFAULT 1;
	WHILE i <= 1000001 DO
		INSERT INTO test_users(name, created_at) VALUES
			(CONCAT('user_', i), NOW());
		SET i = i + 1;
	END WHILE;			
END$$
DELIMITER ;