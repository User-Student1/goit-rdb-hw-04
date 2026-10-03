Завдання 1 LibraryManagement

CREATE DATABASE LibraryManagement;
USE LibraryManagement;

CREATE TABLE authors (
  author_id INT AUTO_INCREMENT PRIMARY KEY,
  author_name VARCHAR(100)
);

CREATE TABLE genres (
  genre_id INT AUTO_INCREMENT PRIMARY KEY,
  genre_name VARCHAR(100)
);

CREATE TABLE books (
  book_id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(200),
  publication_year YEAR,
  author_id INT,
  genre_id INT,
  FOREIGN KEY (author_id) REFERENCES authors(author_id),
  FOREIGN KEY (genre_id) REFERENCES genres(genre_id)
);

CREATE TABLE users (
  user_id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(100),
  email VARCHAR(150)
);

CREATE TABLE borrowed_books (
  borrow_id INT AUTO_INCREMENT PRIMARY KEY,
  book_id INT,
  user_id INT,
  borrow_date DATE,
  return_date DATE,
  FOREIGN KEY (book_id) REFERENCES books(book_id),
  FOREIGN KEY (user_id) REFERENCES users(user_id)
);

Завдання 2 тестові дані

INSERT INTO authors (author_name) VALUES
  ('J.K. Rowling'),
  ('George Orwell');

INSERT INTO genres (genre_name) VALUES
  ('Fantasy'),
  ('Dystopian');

INSERT INTO books (title, publication_year, author_id, genre_id) VALUES
  ('Harry Potter and the Philosopher''s Stone', 1997, 1, 1),
  ('1984', 1949, 2, 2);

INSERT INTO users (username, email) VALUES
  ('ivan_k', 'ivan.k@example.com'),
  ('olha_m', 'olha.m@example.com');

INSERT INTO borrowed_books (book_id, user_id, borrow_date, return_date) VALUES
  (1, 1, '2026-09-01', '2026-09-15'),
  (2, 2, '2026-09-10', NULL);

Завдання 3 INNER JOIN всіх 8 таблиць (база shop_id)

SELECT *
FROM order_details
INNER JOIN orders ON order_details.order_id = orders.id
INNER JOIN customers ON orders.customer_id = customers.id
INNER JOIN employees ON orders.employee_id = employees.employee_id
INNER JOIN shippers ON orders.shipper_id = shippers.id
INNER JOIN products ON order_details.product_id = products.id
INNER JOIN categories ON products.category_id = categories.id
INNER JOIN suppliers ON products.supplier_id = suppliers.id;

Завдання 4.1 кількість рядків

SELECT COUNT(*) AS total_rows
FROM order_details
INNER JOIN orders ON order_details.order_id = orders.id
INNER JOIN customers ON orders.customer_id = customers.id
INNER JOIN employees ON orders.employee_id = employees.employee_id
INNER JOIN shippers ON orders.shipper_id = shippers.id
INNER JOIN products ON order_details.product_id = products.id
INNER JOIN categories ON products.category_id = categories.id
INNER JOIN suppliers ON products.supplier_id = suppliers.id;

Результат total_rows = 518

Завдання 4.2 заміна INNER на LEFT JOIN

SELECT COUNT(*) AS total_rows
FROM order_details
INNER JOIN orders ON order_details.order_id = orders.id
INNER JOIN customers ON orders.customer_id = customers.id
LEFT JOIN employees ON orders.employee_id = employees.employee_id
LEFT JOIN shippers ON orders.shipper_id = shippers.id
INNER JOIN products ON order_details.product_id = products.id
INNER JOIN categories ON products.category_id = categories.id
INNER JOIN suppliers ON products.supplier_id = suppliers.id;

Результат total_rows = 518 (без змін)
Кількість рядків не змінилася (518 в обох випадках), бо у кожного замовлення в цьому датасеті дійсно є і співробітник, і перевізник —
LEFT JOIN не знайшов жодного "втраченого" рядка, який INNER JOIN раніше б відкинув через відсутність пари.

Завдання 4.3: фільтр employee_id > 3 AND <= 10

SELECT *
FROM order_details
INNER JOIN orders ON order_details.order_id = orders.id
INNER JOIN customers ON orders.customer_id = customers.id
INNER JOIN employees ON orders.employee_id = employees.employee_id
INNER JOIN shippers ON orders.shipper_id = shippers.id
INNER JOIN products ON order_details.product_id = products.id
INNER JOIN categories ON products.category_id = categories.id
INNER JOIN suppliers ON products.supplier_id = suppliers.id
WHERE orders.employee_id > 3 AND orders.employee_id <= 10;

Завдання 4.4 GROUP BY категорія + COUNT + AVG

SELECT categories.name AS category_name,
       COUNT(*) AS rows_count,
       AVG(order_details.quantity) AS avg_quantity
FROM order_details
INNER JOIN orders ON order_details.order_id = orders.id
INNER JOIN products ON order_details.product_id = products.id
INNER JOIN categories ON products.category_id = categories.id
GROUP BY categories.name;

Завдання 4.5 HAVING AVG(quantity) > 21

SELECT categories.name AS category_name,
       COUNT(*) AS rows_count,
       AVG(order_details.quantity) AS avg_quantity
FROM order_details
INNER JOIN orders ON order_details.order_id = orders.id
INNER JOIN products ON order_details.product_id = products.id
INNER JOIN categories ON products.category_id = categories.id
GROUP BY categories.name
HAVING AVG(order_details.quantity) > 21;

Завдання 4.6 ORDER BY rows_count DESC

SELECT categories.name AS category_name,
       COUNT(*) AS rows_count,
       AVG(order_details.quantity) AS avg_quantity
FROM order_details
INNER JOIN orders ON order_details.order_id = orders.id
INNER JOIN products ON order_details.product_id = products.id
INNER JOIN categories ON products.category_id = categories.id
GROUP BY categories.name
HAVING AVG(order_details.quantity) > 21
ORDER BY rows_count DESC;

Завдання 4.7 LIMIT 4 OFFSET 1

SELECT categories.name AS category_name,
       COUNT(*) AS rows_count,
       AVG(order_details.quantity) AS avg_quantity
FROM order_details
INNER JOIN orders ON order_details.order_id = orders.id
INNER JOIN products ON order_details.product_id = products.id
INNER JOIN categories ON products.category_id = categories.id
GROUP BY categories.name
HAVING AVG(order_details.quantity) > 21
ORDER BY rows_count DESC
LIMIT 4 OFFSET 1;
