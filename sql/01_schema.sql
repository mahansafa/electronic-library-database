-- Electronic Library Database
-- SQL extracted from the project report by Mohammad Mahan Safaiyan.

-- Run once on a fresh database. Tables retain the report's schema.
-- Explicit utf8mb4 defaults support Persian text in every table.
CREATE DATABASE electronic_library_db
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

USE electronic_library_db;
SET NAMES utf8mb4;

CREATE TABLE Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    original_year INT,
    rating DECIMAL(3,2)
);

CREATE TABLE Authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(255) NOT NULL
);

CREATE TABLE Book_Authors (
    book_id INT,
    author_id INT,
    PRIMARY KEY (book_id, author_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

CREATE TABLE Categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL
);

CREATE TABLE Book_Categories (
    book_id INT,
    category_id INT,
    PRIMARY KEY (book_id, category_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

CREATE TABLE Translators (
    translator_id INT AUTO_INCREMENT PRIMARY KEY,
    translator_name VARCHAR(255) NOT NULL
);

CREATE TABLE Publishers (
    publisher_id INT AUTO_INCREMENT PRIMARY KEY,
    publisher_name VARCHAR(255) NOT NULL
);

CREATE TABLE Book_Editions (
    edition_id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT NOT NULL,
    translator_id INT,
    publisher_id INT,
    page_count INT,
    print_count INT,
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (translator_id) REFERENCES Translators(translator_id),
    FOREIGN KEY (publisher_id) REFERENCES Publishers(publisher_id)
);
