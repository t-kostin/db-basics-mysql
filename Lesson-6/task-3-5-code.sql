-- 3. Определить кто больше поставил лайков (всего) - мужчины или женщины?

SELECT COUNT(*) FROM likes WHERE user_id IN (
	SELECT user_id FROM profiles WHERE profiles.gender = 'F');

SELECT COUNT(*) FROM likes WHERE user_id IN (
        SELECT user_id FROM profiles WHERE profiles.gender = 'M');

SELECT IF(
	(SELECT COUNT(*) FROM likes WHERE user_id IN (
		SELECT user_id FROM profiles WHERE profiles.gender = 'M')) >
	((SELECT COUNT(*) FROM likes) / 2),
	'Мужчины поставили больше лайков',
	'Женщины поставили больше лайков') AS Answer;

-- 4. Подсчитать общее количество лайков десяти самым молодым пользователям 
-- (сколько лайков получили 10 самых молодых пользователей).

/*SELECT COUNT(*) FROM likes WHERE user_id IN (
	SELECT user_id FROM profiles ORDER BY profiles.birthday DESC LIMIT 10);
Не работает...	 
*/
SELECT birthday FROM profiles ORDER BY birthday DESC LIMIT 10;
SELECT COUNT(*) FROM likes WHERE user_id IN (
	SELECT user_id FROM profiles WHERE birthday >= '2015-05-08');

-- 5. Найти 10 пользователей, которые проявляют наименьшую активность в
-- использовании социальной сети.
SELECT user_id, COUNT(*) AS activity FROM posts GROUP BY user_id HAVING activity < 3;

