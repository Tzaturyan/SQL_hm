-- Задание №1. Пусть задан некоторый пользователь. 
-- Из всех пользователей соц. сети найдите человека, который больше всех общался 
-- с выбранным пользователем (написал ему сообщений). JOIN.

/*
SELECT u.firstname, u.lastname, from_user_id
FROM users u JOIN messages m
ON m.from_user_id = u.id
WHERE to_user_id = 1
GROUP BY from_user_id
ORDER BY COUNT(*) DESC LIMIT 1;
*/

-- Задание №2. Подсчитать общее количество лайков, которые получили пользователи младше 10 лет.JOIN

/*
SELECT COUNT(l.id) AS likes_junior_users
FROM users u JOIN likes l
ON l.user_id = u.id
JOIN profiles p
ON p.user_id = u.id
WHERE p.birthday BETWEEN DATE_ADD(NOW(), INTERVAL -10 YEAR) AND NOW();
*/

-- Заданеи №3. Определить кто больше поставил лайков (всего): мужчины или женщины.JOIN.

/*
SELECT CASE p.gender WHEN 'f' THEN 'Женщины' END AS gender, COUNT(l.id) AS morelikes
FROM profiles p JOIN likes l
ON p.user_id = l.user_id
GROUP BY p.gender
ORDER BY COUNT(*) DESC LIMIT 1;
/*
