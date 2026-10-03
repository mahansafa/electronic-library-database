-- Electronic Library Database
-- SQL extracted from the project report by Mohammad Mahan Safaiyan.

-- Run once, after 01_schema.sql, on the newly created empty tables.
-- The sample relationships assume auto-generated IDs start at 1.
-- Ratings, editions and publication details are demonstration data.
USE electronic_library_db;
SET NAMES utf8mb4;

START TRANSACTION;

INSERT INTO Books (title, original_year, rating) VALUES
('جنایت و مکافات', 1866, 4.80),
('برادران کارامازوف', 1880, 4.90),
('1984', 1949, 4.70),
('قلعه حیوانات', 1945, 4.50),
('شازده کوچولو', 1943, 4.60),
('کیمیاگر', 1988, 4.20),
('بیگانه', 1942, 4.40),
('انسان در جستجوی معنا', 1946, 4.80),
('دنیای سوفی', 1991, 4.30),
('بوف کور', 1937, 4.10);

INSERT INTO Authors (author_name) VALUES
('فئودور داستایوفسکی'),
('جورج اورول'),
('آنتوان دو سنت اگزوپری'),
('پائولو کوئیلو'),
('آلبر کامو'),
('ویکتور فرانکل'),
('یوستین گردر'),
('صادق هدایت');

INSERT INTO Categories (category_name) VALUES
('رمان'),
('ادبیات کلاسیک'),
('فلسفه'),
('روان‌شناسی'),
('داستان تمثیلی'),
('ادبیات ایران'),
('ادبیات جهان');

INSERT INTO Translators (translator_name) VALUES
('مهری آهی'),
('سروش حبیبی'),
('صالح حسینی'),
('احمد شاملو'),
('آرش حجازی'),
('خشایار دیهیمی'),
('نهال تجدد'),
('بدون مترجم');

INSERT INTO Publishers (publisher_name) VALUES
('نشر نیلوفر'),
('نشر چشمه'),
('نشر ماهی'),
('انتشارات نگاه'),
('نشر قطره'),
('نشر مرکز'),
('نشر نی');

INSERT INTO Book_Authors (book_id, author_id) VALUES
(1, 1), (2, 1), (3, 2), (4, 2), (5, 3),
(6, 4), (7, 5), (8, 6), (9, 7), (10, 8);

INSERT INTO Book_Categories (book_id, category_id) VALUES
(1, 1), (1, 2), (2, 1), (2, 2), (3, 1),
(3, 3), (4, 5), (5, 7), (6, 1), (7, 3),
(8, 4), (9, 3), (10, 6);

INSERT INTO Book_Editions (book_id, translator_id, publisher_id, page_count, print_count) VALUES
(1, 1, 1, 720, 12),
(2, 2, 1, 980, 8),
(3, 3, 2, 350, 15),
(4, 4, 3, 160, 20),
(5, 4, 4, 120, 25),
(6, 5, 5, 240, 18),
(7, 6, 6, 180, 10),
(8, 7, 7, 220, 14),
(9, 6, 6, 560, 9),
(10, 8, 4, 130, 30);

COMMIT;
