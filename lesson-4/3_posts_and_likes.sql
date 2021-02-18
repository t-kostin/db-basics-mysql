-- Таблица постов
CREATE TABLE posts (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT 'идентификатор поста',
    user_id INT UNSIGNED NOT NULL COMMENT 'идентификатор пользователя-создателя поста',
    post TEXT COMMENT 'текст поста до 65535 символов',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Таблица лайков
CREATE TABLE likes (
    post_id INT UNSIGNED NOT NULL COMMENT 'идентификатор поста',
    user_id INT UNSIGNED NOT NULL COMMENT 'идентификатор пользователя, поставившего like',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);
