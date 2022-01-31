-- Написать скрипт, возвращающий список имен (только firstname) пользователей без повторений в алфавитном порядке

SELECT DISTINCT firstname FROM users;

-- Написать скрипт, отмечающий несовершеннолетних пользователей как неактивных (поле is_active = false). 
-- Предварительно добавить такое поле в таблицу profiles со значением по умолчанию = true (или 1)

ALTER TABLE profiles ADD COLUMN ia_active BOOLEAN DEFAULT TRUE;
UPDATE profiles 
SET is_active = FALSE 
WHERE (YEAR(CURDATE()) - YEAR(birthday)) < 18;

-- Написать скрипт, удаляющий сообщения «из будущего» (дата больше сегодняшней)

DELETE FROM messages 
WHERE created_at > NOW();

