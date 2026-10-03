# Electronic Library Database

A MySQL database design project for organizing books, authors, categories, translators, publishers, and book editions.

**Author:** Mohammad Mahan Safaiyan · **Course:** Database Design

[راهنمای فارسی](README.fa.md) · [Project report (PDF)](docs/project-report.pdf) · [ER diagram (PDF)](docs/er-diagram.pdf)

## Overview

The project takes an electronic library catalog from requirements and ER modeling to a relational schema, normalization, sample data, and SQL queries. It distinguishes a book's identity from its editions, allowing translations and publication details to vary by edition.

The scope is the database layer. The included SQL is extracted from the accompanying Persian report and organized into three scripts.

![Electronic library ER diagram](docs/er-diagram.png)

## Design highlights

- Eight tables: six entities and two junction tables.
- Many-to-many relationships for books/authors and books/categories.
- One-to-many relationships from books, translators, and publishers to editions.
- Primary keys, composite keys, and foreign keys to maintain relational integrity.
- Separation of entity attributes following the report's 1NF, 2NF, and 3NF design.
- Persian sample data with explicit `utf8mb4` database and connection settings.
- Ten queries covering joins, filtering, aggregation, sorting, and title search.

## Relational schema

| Table | Purpose | Primary key |
| --- | --- | --- |
| `Books` | Title, original publication year, and rating | `book_id` |
| `Authors` | Author names | `author_id` |
| `Book_Authors` | Books/authors junction | `book_id`, `author_id` |
| `Categories` | Category names | `category_id` |
| `Book_Categories` | Books/categories junction | `book_id`, `category_id` |
| `Translators` | Translator names | `translator_id` |
| `Publishers` | Publisher names | `publisher_id` |
| `Book_Editions` | Edition's book, translator, publisher, pages, and print count | `edition_id` |

Each edition belongs to one book and has at most one translator and one publisher in this model. The translator and publisher foreign keys are nullable. Table names in SQL are plural; the ER diagram uses singular entity labels for the same design.

## Run the project

Use MySQL with a user that can create a database and tables. From the repository root, open a MySQL client session:

```bash
mysql --default-character-set=utf8mb4 -u YOUR_USERNAME -p
```

Then run the scripts in order:

```sql
SOURCE sql/01_schema.sql;
SOURCE sql/02_sample_data.sql;
SOURCE sql/03_queries.sql;
```

In MySQL Workbench, open the three SQL files and execute them in the same order. Use a fresh database: the schema creates `electronic_library_db`, and the sample inserts assume empty tables with IDs starting at 1. The scripts are intended for a single initial import.

## Sample dataset and queries

The report supplies **10 books, 8 authors, 7 categories, 8 translator entries, 7 publishers, and 10 editions**, with 10 author links and 13 category links. Sample ratings and publication details are illustrative rather than a verified bibliographic dataset.

The ten query examples list books and their authors, filter by author or category, find highly rated books, join editions to translators and publishers, count books per category, compute average ratings, sort ratings, and search title fragments.

For example, the category aggregation is:

```sql
SELECT c.category_name, COUNT(b.book_id) AS book_count
FROM Categories c
JOIN Book_Categories bc ON c.category_id = bc.category_id
JOIN Books b ON bc.book_id = b.book_id
GROUP BY c.category_name;
```

## Repository files

| Path | Contents |
| --- | --- |
| `sql/01_schema.sql` | Database creation and eight table definitions |
| `sql/02_sample_data.sql` | Sample records and relationships |
| `sql/03_queries.sql` | Ten queries from the report |
| `docs/project-report.html` | Persian report; download and open in a browser |
| `docs/project-report.pdf` | PDF edition of the report |
| `docs/er-diagram.html` | Persian ER diagram; download and open in a browser |
| `docs/er-diagram.pdf` | Original ER diagram PDF |
| `docs/er-diagram.png` | Diagram preview used above |
| `README.fa.md` | Persian introduction and run instructions |

The public report copies omit the student number. The table definitions and queries preserve the submitted design; the packaged scripts add UTF-8 setup and an import transaction. The sample represents an untranslated book with a `بدون مترجم` translator entry, as in the report. Runtime execution on a MySQL server has not been verified in this environment.
