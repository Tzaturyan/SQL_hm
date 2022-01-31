Задание №1. Пусть в таблице users поля created_at и updated_at оказались незаполненными. Заполните их текущими датой и временем.

Приведём таблицу users в соответствие с условием задачи.
Сделаем поля сreated_at и updated_at пустыми:
UPDATE users 
SET created_at = NULL
WHERE id = id >= 1;
UPDATE users
SET updated_at = NULL
WHERE id = id >= 1;

Далее далее обновим значения в данных полях функцией NOW() которая позволяет выставить даты на данный момент.
UPDATE users 
SET created_at = NOW()
WHERE id = id >= 1;
UPDATE users
SET updated_at = NOW()
WHERE id = id >= 1;


Задание №2. Таблица users была неудачно спроектирована. 
Записи created_at и updated_at были заданы типом VARCHAR и в них долгое время помещались значения в формате "20.10.2017 8:10". 
Необходимо преобразовать поля к типу DATETIME, сохранив введеные ранее значения.
Приведём данные в таблице в соответсвии с дз:
Изменим тип данных в полях created_at и updated_at
created_at VARCHAR(50), 
updated_at VARCHAR(50)
Далее добавим данные:
INSERT INTO users (name, birthday_at, created_at, updated_at) VALUES
  ('Геннадий', '1990-10-05', '20.10.2017 8:10', '20.10.2017 8:10'),
  ('Наталья', '1984-11-12', '20.10.2017 8:10', '20.10.2017 8:10'),
  ('Александр', '1985-05-20', '20.10.2017 8:10', '20.10.2017 8:10'),
  ('Сергей', '1988-02-14', '20.10.2017 8:10', '20.10.2017 8:10'),
  ('Иван', '1998-01-12', '20.10.2017 8:10', '20.10.2017 8:10'),
  ('Мария', '1992-08-29', '20.10.2017 8:10', '20.10.2017 8:10');

Тип данных DATETIME хранит данные в формате 00-00-0000 00-00-00
А так как в нашей таблице дата хранится в некорректном формате, то соответственно 
задать значение DATETIME столбцу через ALTER TABLE не получится.
Используем функцию SELECT STR_TO_DATE, которая позволяет переводить дату в удобный нам формат.
Проставим данный тип нашим полям:
UPDATE users 
SET created_at = STR_TO_DATE(created_at, "%d.%m.%Y %k:%i"),
    updated_at = STR_TO_DATE(updated_at, "%d.%m.%Y %k:%i")
WHERE id = id >= 1;
Теперь мы можем с помощью ALTER TABLE задать тип DATETIME.
ALTER TABLE users MODIFY created_at DATETIME;
ALTER TABLE users MODIFY updated_at DATETIME;

№3. Необходимо отсортировать записи таким образом, чтобы они выводились в порядке увеличения значения value. 
   Однако, нулевые запасы должны выводиться в конце, после всех записей.
   Приведём таблицу в соответствии с заданием, добавим значений:
INSERT INTO storehouses_products
  (id, storehouse_id, product_id, value)
VALUES
  (1, 1, 1,20),
  (2, 2, 2,15),
  (3, 3, 3, 0),
  (4, 4, 4, 0),
  (5, 5, 5, 30),
  (6, 6, 6, 40);

SELECT * FROM storehouses_products;
Для тоже отсортировать список таким образом, что бы нули были в конце списка, а остальной список по возрастанию,
укажем оператору ORDER BY сперва вывести нулевые значения value = 0, а потом все остальные value.
SELECT value FROM storehouses_products
ORDER BY value = 0, value;

Задание №1 (Агрегация данных) Подсчитайте средний возраст пользователей в таблице users
Функция TIMESTAMPDIFF позволяет сделать вычитание интервалов, какой брать интервал указывает первое значение в скобке, 
в нашем случае YEAR.
 SELECT name,
 TIMESTAMPDIFF(YEAR, birthday_at, NOW()) AS age
 FROM users;

Задание №2 (агрегация данных) Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели. 
   Следует учесть, что необходимы дни недели текущего года, а не года рождения.
   Для определения дня недели используем оператор DAYNAME(), в нём мы соберём год на данный момент и дату и месяц рождения пользователя,
   со вставкой "-" так как в дате после года идёт "-", иначе вернуться значения NULL,
   соединить чисоа и строковые значения позволит CONCAT.

SELECT
DAYNAME(CONCAT(YEAR(NOW()), '-', SUBSTRING(birthday_at, 6, 10))) AS birthday_day
FROM users;