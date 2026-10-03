-- Electronic Library Database
-- SQL extracted from the project report by Mohammad Mahan Safaiyan.

USE electronic_library_db;
SET NAMES utf8mb4;

-- 1. List all books
SELECT * FROM Books;

-- 2. Show books with their authors
SELECT b.title, a.author_name
FROM Books b
JOIN Book_Authors ba ON b.book_id = ba.book_id
JOIN Authors a ON ba.author_id = a.author_id;

-- 3. Find books by a specific author
SELECT b.title, a.author_name
FROM Books b
JOIN Book_Authors ba ON b.book_id = ba.book_id
JOIN Authors a ON ba.author_id = a.author_id
WHERE a.author_name = 'فئودور داستایوفسکی';

-- 4. Find books in a category
SELECT b.title, c.category_name
FROM Books b
JOIN Book_Categories bc ON b.book_id = bc.book_id
JOIN Categories c ON bc.category_id = c.category_id
WHERE c.category_name = 'رمان';

-- 5. Find books rated above 4.50
SELECT title, rating
FROM Books
WHERE rating > 4.50;

-- 6. Show editions with translators and publishers
SELECT b.title, t.translator_name, p.publisher_name
FROM Book_Editions e
JOIN Books b ON e.book_id = b.book_id
JOIN Translators t ON e.translator_id = t.translator_id
JOIN Publishers p ON e.publisher_id = p.publisher_id;

-- 7. Count books per category
SELECT c.category_name, COUNT(b.book_id) AS book_count
FROM Categories c
JOIN Book_Categories bc ON c.category_id = bc.category_id
JOIN Books b ON bc.book_id = b.book_id
GROUP BY c.category_name;

-- 8. Calculate average ratings per category
SELECT c.category_name, AVG(b.rating) AS average_rating
FROM Categories c
JOIN Book_Categories bc ON c.category_id = bc.category_id
JOIN Books b ON bc.book_id = b.book_id
GROUP BY c.category_name;

-- 9. Sort books by rating
SELECT title, rating
FROM Books
ORDER BY rating DESC;

-- 10. Search by part of a book title
SELECT *
FROM Books
WHERE title LIKE '%جنایت%';
