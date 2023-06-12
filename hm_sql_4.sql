-- Домашняя работа. 
-- Задача №1 Подсчитать общее количество лайков, которые получили пользователи младше 12 лет.

SELECT 
    users.id, 
    users.firstname, 
    users.lastname, 
    profiles.birthday, 
    COUNT(likes.media_id) AS likes_per_user
FROM users
JOIN likes ON users.id = likes.user_id
JOIN profiles ON profiles.user_id = users.id
LEFT JOIN media ON likes.user_id = media.id
        WHERE likes.media_id IN (2, 3, 4, 5)
GROUP BY users.id
ORDER BY birthday DESC LIMIT 12;

SELECT * FROM media;

-- Задача №2 Определить кто больше поставил лайков (всего) - мужчины или женщины?

SELECT 
    profiles.gender AS gender, 
    COUNT(likes.media_id) AS likes_amount
FROM profiles 
JOIN users ON profiles.user_id = users.id
JOIN likes ON users.id = likes.user_id
GROUP BY profiles.gender 
ORDER BY likes_amount DESC LIMIT 1;

-- Задача №3. Вывести всех пользователей, которые не отправляли сообщения.

SELECT 
    CONCAT(users.firstname, ' ', users.lastname) AS user, 
    COUNT(messages.from_user_id) AS messages 
FROM users
LEFT JOIN messages ON messages.from_user_id = users.id
GROUP BY user
ORDER BY messages LIMIT 1;
