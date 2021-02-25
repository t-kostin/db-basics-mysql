USE shop;

-- Пусть в таблице users поля created_at и updated_at оказались незаполненными.
-- Заполните их текущими датой и временем.

CREATE TEMPORARY TABLE wrong_users LIKE users;
INSERT INTO wrong_users SELECT * FROM users;
UPDATE wrong_users SET created_at = NULL, updated_at = NULL;
DESC wrong_users;
SELECT * FROM wrong_users;
UPDATE wrong_users SET created_at = NOW();
SELECT * FROM wrong_users;

-- Таблица users была неудачно спроектирована. Записи created_at и updated_at были
-- заданы типом VARCHAR и в них долгое время помещались значения в формате 20.10.2017 8:10.
-- Необходимо преобразовать поля к типу DATETIME, сохранив введённые ранее значения.

CREATE TEMPORARY TABLE wrong_dates LIKE users;
ALTER TABLE wrong_dates
	MODIFY created_at VARCHAR(20),
	MODIFY updated_at VARCHAR(20);
INSERT INTO wrong_dates VALUES
	(1, 'Геннадий', '1990-10-05', '20.10.2016 08:10', '20.10.2018 18:00'),
	(2, 'Наталья', '1984-11-12', '31.12.2017 20:10', '20.10.2018 17:33'),
	(3, 'Александр', '1985-05-20', '03.04.2017 16:22', '12.11.2017 15:30');
DESC wrong_dates;
SELECT * FROM wrong_dates;
UPDATE wrong_dates SET
	created_at = STR_TO_DATE(created_at, '%d.%m.%Y %H:%i'),
	updated_at = STR_TO_DATE(updated_at, '%d.%m.%Y %H:%i');
ALTER TABLE wrong_dates
	MODIFY created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	MODIFY updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;
DESC wrong_dates;
SELECT * FROM wrong_dates;

-- В таблице складских запасов storehouses_products в поле value могут встречаться самые
-- разные цифры: 0, если товар закончился и выше нуля, если на складе имеются запасы.
-- Необходимо отсортировать записи таким образом, чтобы они выводились в порядке
-- увеличения значения value. Однако нулевые запасы должны выводиться в конце, после всех

DESC storehouses_products;
SELECT * FROM storehouses_products;
SELECT * FROM storehouses_products ORDER BY IF(value > 0, 1, 2), value;

-- Из таблицы users необходимо извлечь пользователей, родившихся в августе и мае.
-- Месяцы заданы в виде списка английских названий (may, august)

SELECT * FROM users WHERE MONTHNAME(birthday_at) IN ('may', 'august');

-- Из таблицы catalogs извлекаются записи при помощи запроса. SELECT * FROM catalogs WHERE id IN (5, 1, 2);
-- Отсортируйте записи в порядке, заданном в списке IN.

SELECT * FROM catalogs WHERE id IN (5, 1, 2);
SELECT * FROM catalogs WHERE id IN (5, 1, 2) ORDER BY FIELD(id, 5, 1, 2);

-- Подсчитайте средний возраст пользователей в таблице users.

SELECT AVG(TIMESTAMPDIFF(YEAR, birthday_at, NOW())) AS average_age FROM users;

-- Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели.
-- Следует учесть, что необходимы дни недели текущего года, а не года рождения.

SELECT COUNT(*) AS birthdays, DAYNAME(CONCAT(YEAR(NOW()), DATE_FORMAT(birthday_at, '-%m-%d'))) AS week_day
  FROM users
  GROUP BY week_day;

-- Подсчитайте произведение чисел в столбце таблицы.

SELECT ROUND(EXP(SUM(LN(id))), 0) FROM products;
