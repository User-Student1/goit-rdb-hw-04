# Homework #4 — DDL/DML and Multi-Table JOIN

Creating a new database (LibraryManagement) with DDL, filling it with test data via DML, and writing multi-table JOIN queries with GROUP BY, HAVING, ORDER BY and LIMIT/OFFSET.

## Files
- `queries_and_answers.sql` — all SQL code (tasks 1–4) and the written answer to task 4.2
- `p1_schema_created.png` — Task 1: LibraryManagement schema with 5 tables created via DDL
- `p2_test_data1.png`, `p2_test_data2.png` — Task 2: test data inserted via DML (books and borrowed_books)
- `p3_full_join.png`, `p3_full_join1.png`, `p3_full_join2.png` — Task 3: INNER JOIN of all 8 tables from the shop_id database (scrolled across the wide result)
- `p4_1_count.png` — Task 4.1: row count of the joined result
- `p4_2_left_join.png` — Task 4.2: same query with INNER replaced by LEFT JOIN
- `p4_3_employee_filter.png` — Task 4.3: filtered by employee_id > 3 and <= 10
- `p4_4_group_avg.png` — Task 4.4: grouped by category, row count and average quantity
- `p4_5_having.png` — Task 4.5: filtered groups with HAVING AVG(quantity) > 21
- `p4_6_order_by.png` — Task 4.6: sorted by row count descending
- `p4_7_limit_offset.png` — Task 4.7: LIMIT 4 OFFSET 1

## Database structure (LibraryManagement)
- `authors` (author_id, author_name)
- `genres` (genre_id, genre_name)
- `books` (book_id, title, publication_year, author_id, genre_id)
- `users` (user_id, username, email)
- `borrowed_books` (borrow_id, book_id, user_id, borrow_date, return_date)
