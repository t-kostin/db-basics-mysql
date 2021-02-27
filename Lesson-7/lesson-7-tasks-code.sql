USE shop;

-- Составьте список пользователей users, которые осуществили
-- хотя бы один заказ orders в интернет магазине.

SELECT * FROM users;
SELECT * FROM orders;
SELECT DISTINCT users.id, users.name FROM users
	JOIN orders ON users.id = orders.user_id;

-- Выведите список товаров products и разделов catalogs,
-- который соответствует товару.
SELECT products.id, products.name, catalogs.name FROM products
	JOIN catalogs ON products.catalog_id = catalogs.id;

-- Пусть имеется таблица рейсов flights (id, from, to) и таблица городов 
-- cities (label, name). Поля from, to и label содержат английские названия
-- городов, поле name — русское. Выведите список рейсов flights с русскими
-- названиями городов.
USE aero;
SELECT * FROM cities;
SELECT * FROM flights;
SELECT flights.id, _from_.name AS `From`, _to_.name AS `To` FROM flights
	JOIN cities AS _from_ ON flights.`from` = _from_.label
	JOIN cities AS _to_ ON flights.`to` = _to_.label
	ORDER BY flights.id;
