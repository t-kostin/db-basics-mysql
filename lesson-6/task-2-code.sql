-- Добавляем внешние ключи к таблице communities
ALTER TABLE communities
	ADD CONSTRAINT communities_owner_id_fk
		FOREIGN KEY (owner_id) REFERENCES users(id)
			ON DELETE CASCADE;
-- Добавляем внешние ключи к таблице communities_users
ALTER TABLE communities_users
        ADD CONSTRAINT communities_users_community_id_fk
                FOREIGN KEY (community_id) REFERENCES communities(id)
                        ON DELETE CASCADE,
	ADD CONSTRAINT communities_users_user_id_fk
		FOREIGN KEY (user_id) REFERENCES users(id)
			ON DELETE CASCADE;
-- Добавляем внешние ключи к таблице friendship
ALTER TABLE friendship
        ADD CONSTRAINT friendship_user_id_fk
                FOREIGN KEY (user_id) REFERENCES users(id)
			ON DELETE CASCADE,
	ADD CONSTRAINT friendship_friend_id_fk
		FOREIGN KEY (friend_id) REFERENCES users(id)
			ON DELETE CASCADE,
	ADD CONSTRAINT frienship_friendship_status_id_fk
		FOREIGN KEY (friendship_status_id) REFERENCES friendship_statuses(id)
			ON DELETE CASCADE;
-- Добавляем внешние ключи к таблице likes
ALTER TABLE likes
	ADD CONSTRAINT likes_user_id_fk
		FOREIGN KEY (user_id) REFERENCES users(id)
			ON DELETE CASCADE,
	ADD CONSTRAINT likes_target_type_id_fk
		FOREIGN KEY (target_type_id) REFERENCES target_types(id)
			ON DELETE CASCADE;
-- Добавляем внешние ключи к таблице media
ALTER TABLE media
	ADD CONSTRAINT media_user_id_fk
		FOREIGN KEY (user_id) REFERENCES users(id)
			ON DELETE CASCADE,
	ADD CONSTRAINT media_media_type_id_fk
		FOREIGN KEY (media_type_id) REFERENCES media_types(id)
			ON DELETE CASCADE;
--  Добавляем внешние ключи к таблице messages
ALTER TABLE messages
	ADD CONSTRAINT messages_from_user_id_fk
		FOREIGN KEY (from_user_id) REFERENCES users(id)
			ON DELETE CASCADE,
	ADD CONSTRAINT messages_to_user_id_fk
		FOREIGN KEY (to_user_id) REFERENCES users(id)
			ON DELETE CASCADE;
--  Добавляем внешние ключи к таблице posts
ALTER TABLE posts
	ADD CONSTRAINT posts_user_id_fk
		FOREIGN KEY (user_id) REFERENCES users(id)
			ON DELETE CASCADE,
	ADD CONSTRAINT posts_community_id_fk
		FOREIGN KEY (community_id) REFERENCES communities(id)
			ON DELETE CASCADE,
	ADD CONSTRAINT posts_media_id_fk
		FOREIGN KEY (media_id) REFERENCES media(id)
			ON DELETE CASCADE;
--  Добавляем внешние ключи к таблице profiles
ALTER TABLE profiles
	ADD CONSTRAINT profiles_user_id_fk
		FOREIGN KEY (user_id) REFERENCES users(id)
			ON DELETE CASCADE;
