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

SELECT COUNT(target_id) AS total_likes
	FROM likes
	WHERE user_id IN (SELECT * FROM (SELECT user_id FROM profiles ORDER BY birthday DESC LIMIT 10) AS youngest) 
        AND target_type_id = (SELECT id FROM target_types WHERE name = 'users');

-- 5. Найти 10 пользователей, которые проявляют наименьшую активность в
-- использовании социальной сети.

SELECT id, (SELECT COUNT(*) FROM messages WHERE messages.from_user_id = users.id) +
           (SELECT COUNT(*) FROM likes WHERE likes.user_id = users.id) +
           (SELECT COUNT(*) FROM posts WHERE posts.user_id = users.id) AS activity
    FROM users ORDER BY activity LIMIT 10;
