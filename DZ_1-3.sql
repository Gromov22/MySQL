USE shop;

/* 1) Составьте список пользователей users, которые осуществили
 * хотя бы один заказ orders в интернет магазине. */

INSERT INTO orders (user_id) VALUES
	(1),
	(3),
	(5);


SELECT
u.id,
u.name
FROM users AS u
INNER JOIN orders AS o 
ON (u.id = o.user_id)
GROUP BY u.name, u.id
HAVING COUNT(o.user_id) > 0;

/* Выведите список товаров products и разделов catalogs,
   который соответствует товару. */

SELECT
p.id,
p.name,
c.name
FROM products AS p
LEFT JOIN catalogs AS c 
ON (c.id = p.catalog_id);


/* (по желанию) Пусть имеется таблица рейсов flights (id, from, to)
 *  и таблица городов cities (label, name). Поля from, to и label
 *  содержат английские названия городов, поле name — русское.
    Выведите список рейсов flights с русскими названиями городов.
 */


DROP TABLE IF EXISTS flights;
CREATE TABLE flights (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`from` VARCHAR(100) NOT NULL,
	`to` VARCHAR(100) NOT NULL
);

DROP TABLE IF EXISTS cities;
CREATE TABLE cities (
	label VARCHAR(100) NOT NULL PRIMARY KEY,
	name VARCHAR(100) NOT NULL
);

INSERT INTO flights(`from`, `to`) VALUES
	('moscow', 'omsk'),
	('novgorod', 'kazan'),
	('irkutsk', 'moscow'),
	('omsk', 'irkutsk'),
	('moscow', 'kazan');

INSERT INTO cities(label, name) VALUES
	('moscow', 'Москва'),
	('irkutsk', 'Иркутск'),
	('novgorod', 'Новгород'),
	('kazan', 'Казань'),
	('omsk', 'Омск');
	
ALTER TABLE flights ADD CONSTRAINT fk_from_label
FOREIGN KEY(`from`) REFERENCES cities(label);

ALTER TABLE flights ADD CONSTRAINT fk_to_label
FOREIGN KEY(`to`) REFERENCES cities(label);

SELECT
id,
(SELECT name FROM cities WHERE label = `from`) AS `from`,
(SELECT name FROM cities WHERE label = `to`) AS `to`
FROM flights;