/* Задание №1. Пусть задан некоторый пользователь. 
Из всех пользователей соц. сети найдите человека, который больше всех общался с выбранным пользователем (написал ему сообщений)
*/

SET @count_send_messages := (SELECT from_user_id FROM messages WHERE to_user_id = 1 GROUP BY from_user_id ORDER BY COUNT(*) DESC LIMIT 1);

SELECT CONCAT(firstname,' ', lastname) AS name, (SELECT COUNT(id) AS countmessages FROM messages 
WHERE from_user_id = @count_send_messages) AS send_mesasges FROM users 
WHERE id = (SELECT from_user_id FROM messages WHERE to_user_id = 1 GROUP BY from_user_id ORDER BY COUNT(*) DESC LIMIT 1);

/*Заданный нами пользователь имеет id 1. Создадим переменную @count_send_messages в которую мы сохраним значение,
показывающие сумму часто встречающихся отправителей нашему пользователю с id 1, это и есть колличество сообщений.
Далее добавим выражение находящие id отправителей SELECT from_user_id FROM messages WHERE to_user_id = 1 
GROUP BY from_user_id ORDER BY COUNT(*) DESC LIMIT 1), далее соеденим это всё и выведем пользовател, который чаще всех отправлял сообщения
нашему пользователю и сколько он их отправлял.
Данным пользователем является Frederick Kilback, отправивший 10 сообщений.*/

/* Задание №2. Подсчитать общее количество лайков, которые получили пользователи младше 10 лет.
 * Нахождение решения:

SELECT birthday FROM profiles WHERE birthday BETWEEN DATE_ADD(NOW(), INTERVAL -10 YEAR) AND NOW(); - ищем дни рождения которые меньше сегоднешней 
на 10 лет.

SELECT user_id FROM profiles WHERE birthday BETWEEN DATE_ADD(NOW(), INTERVAL -10 YEAR) AND NOW(); - ищем профили которые соответствуют 
выше найденным датам.

SELECT id FROM users WHERE id IN(SELECT user_id FROM profiles WHERE birthday BETWEEN DATE_ADD(NOW(), INTERVAL -10 YEAR) AND NOW()); -
находим пользователей которым меньше 10 лет.
*/
-- соеденяя всё это, получим:
SELECT COUNT(id) FROM likes WHERE user_id IN(SELECT id FROM users 
WHERE id IN(SELECT user_id FROM profiles WHERE birthday BETWEEN DATE_ADD(NOW(), INTERVAL -10 YEAR) AND NOW()));

/* Задание №3. Определить кто больше поставил лайков (всего): мужчины или женщины.*/
SELECT user_id FROM profiles WHERE gender = 'f'; - найдём среди пользователей женщин.
SELECT user_id FROM profiles WHERE gender = 'm'; - найдём среди пользователей мужчин.

SET @girlslike := (SELECT COUNT(id)FROM likes WHERE user_id IN(SELECT user_id FROM profiles WHERE gender = 'f')); -- поставим в переменную 
-- колличество лайков сделанных женщинами.
SET @manslike := (SELECT COUNT(id)FROM likes WHERE user_id IN(SELECT user_id FROM profiles WHERE gender = 'm')); -- поставим в переменную колличество 
-- лайков поставленных мужчинами.

SELECT IF(@girlslike > @manslike, 'Женщины', 'Мужчины') AS winner; -- используем оператор IF, которые выводит истину "Женщины",
-- из этого выходит, что больше всего лайков постаивли женщины.



