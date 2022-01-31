Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.

/*INSERT INTO orders
  (id, user_id, created_at, updated_at)
VALUES
  (1, 1, DEFAULT, DEFAULT),
  (2, 1, DEFAULT, DEFAULT),
  (3, 1, DEFAULT, DEFAULT),
  (4, 3, DEFAULT, DEFAULT),
  (5, 3, DEFAULT, DEFAULT),
  (6, 3, DEFAULT, DEFAULT);
SELECT id, name FROM users WHERE id IN(SELECT DISTINCT user_id FROM orders);
*/

Выведите список товаров products и разделов catalogs, который соответствует товару.
/*
SELECT
  p.name,
  p.price,
  c.name
FROM
  catalogs AS c JOIN products AS p
ON
  c.id = p.catalog_id;

