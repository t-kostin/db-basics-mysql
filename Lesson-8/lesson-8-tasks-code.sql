-- Определить кто больше поставил лайков (всего) - мужчины или женщины? 
-- Используем JOIN.

SELECT COUNT(likes.user_id) AS total, profiles.gender
	FROM likes
	LEFT JOIN profiles
	ON likes.user_id = profiles.user_id
	GROUP BY profiles.gender
	ORDER BY total DESC
	LIMIT 1;

-- Подсчитать общее количество лайков десяти самым молодым пользователям 
-- (сколько лайков получили 10 самых молодых пользователей)
-- Используем JOIN.

SELECT SUM(total_likes) FROM (
	SELECT COUNT(likes.target_id) AS total_likes
		FROM profiles 
		LEFT JOIN likes 
		ON profiles.user_id = likes.target_id AND target_type_id = 2
		GROUP BY profiles.birthday
		ORDER BY profiles.birthday DESC
		LIMIT 10) AS res_table;

/* Нашёл ошибку в предыдущем задании:
SELECT COUNT(target_id) AS total_likes
    FROM likes
    WHERE user_id IN (
		SELECT * FROM (SELECT user_id FROM profiles ORDER BY birthday DESC LIMIT 10) AS youngest)
        AND target_type_id = (SELECT id FROM target_types WHERE name = 'users');
строку 'WHERE user_id IN (' нужно заменить на 'WHERE target_id IN('.
*/

-- Найти 10 пользователей, которые проявляют наименьшую активность
-- в использовании социальной сети.

SELECT users.id, COUNT(DISTINCT(messages.id)) + COUNT(DISTINCT(likes.id)) + COUNT(DISTINCT(posts.id)) AS activity
	FROM users
	JOIN (messages, likes, posts)
	ON (messages.from_user_id = users.id AND likes.user_id = users.id AND posts.user_id = users.id)
	GROUP BY users.id
	ORDER BY activity
	LIMIT 10;
