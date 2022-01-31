/*№1. В базе данных shop и sample присутствуют одни и те же таблицы, учебной базы данных. 
Переместите запись id = 1 из таблицы shop.users в таблицу sample.users. Используйте транзакции.*/

START TRANSACTION;
INSERT INTO sample.users SELECT * FROM shop.users WHERE id = 1;
COMMIT;

/*№2. Создайте представление, которое выводит название name товарной позиции из таблицы products и 
соответствующее название каталога name из таблицы catalogs.*/

CREATE OR REPLACE VIEW prod_catal AS 
SELECT p.name AS p_name, c.name AS c_name 
FROM products p,catalogs c
WHERE p.catalog_id = c.id;
SELECT * FROM prod_catal;

/* №3. Пусть имеется любая таблица с календарным полем created_at. 
Создайте запрос, который удаляет устаревшие записи из таблицы, оставляя только 5 самых свежих записей.*/

USE shop;
PREPARE data_search FROM 'DELETE FROM products ORDER BY created_at LIMIT ?';
SET @LIM = (SELECT COUNT(*)-5 FROM products);
EXECUTE data_search USING @LIM;
SELECT * FROM products;

/* №4. Создайте двух пользователей которые имеют доступ к базе данных shop. 
Первому пользователю shop_read должны быть доступны только запросы на чтение данных, 
второму пользователю shop — любые операции в пределах базы данных shop. */

CREATE USER shop IDENTIFIED WITH user_pas1 BY '123';
GRANT ALL ON shop.* TO shop;
CREATE USER shop_read IDENTIFIED WITH sha256_pas2 BY '123';
GRANT SELECT ON shop.* TO shop_read; 

/*№5. Создайте хранимую функцию hello(), которая будет возвращать приветствие, в зависимости от текущего времени суток. 
С 6:00 до 12:00 функция должна возвращать фразу "Доброе утро", с 12:00 до 18:00 функция должна возвращать фразу "Добрый день", 
с 18:00 до 00:00 — "Добрый вечер", с 00:00 до 6:00 — "Доброй ночи". */

DELIMITER //
CREATE PROCEDURE hello()
BEGIN
CASE 
WHEN CURTIME() BETWEEN '06:00:00' AND '12:00:00' THEN
SELECT 'Доброе утро';
WHEN CURTIME() BETWEEN '12:00:00' AND '18:00:00' THEN
SELECT 'Добрый день';
WHEN CURTIME() BETWEEN '18:00:00' AND '00:00:00' THEN
SELECT 'Добрый вечер';
ELSE
SELECT 'Доброй ночи';
END CASE;
END //

/* №6. В таблице products есть два текстовых поля: name с названием товара и description с его описанием. 
Допустимо присутствие обоих полей или одно из них. Ситуация, когда оба поля принимают неопределенное значение NULL неприемлема. 
Используя триггеры, добейтесь того, чтобы одно из этих полей или оба поля были заполнены. 
При попытке присвоить полям NULL-значение необходимо отменить операцию. */

CREATE TRIGGER trigger1 BEFORE INSERT ON products FOR EACH ROW
BEGIN
IF NEW.name IS NULL AND NEW.description IS NULL
THEN SIGNAL sqlstate '45000' set message_text = "products name or description can not be NULL"; 
end if;
END; //

