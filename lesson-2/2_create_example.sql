CREATE DATABASE IF NOT EXISTS example;
USE example;
CREATE TABLE IF NOT EXISTS users (
        id INT,
        name VARCHAR(32)
);
INSERT INTO users VALUES
        (100, 'John'),
        (120, 'Ann'),
        (130, 'Portion'),
        (99, 'Michael');
