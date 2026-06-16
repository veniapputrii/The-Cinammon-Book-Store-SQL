
# The Cinammon Book Store: Bookstore Database Project 📚

A beginner-friendly PostgreSQL project demonstrating core SQL concepts, including database design, data insertion, filtering, sorting, and table joins.

## 🛠️ Tech Stack Used
Database: PostgreSQL | Tooling: pgAdmin 4 | Language: SQL

## 🗺️ Database Architecture

The project utilizes three tables: `authors`, `books`, and `customers`. The `books` table establishes a relationship with `authors` using a Foreign Key (`author_id`).

```sql
-- Create the Tables
CREATE TABLE authors (
    author_id SERIAL PRIMARY KEY,
    author_name VARCHAR(100) NOT NULL,
    country VARCHAR(50)
);

CREATE TABLE books (
    book_id SERIAL PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    author_id INT REFERENCES authors(author_id),
    price NUMERIC(5, 2),
    stock_quantity INT
);

CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100) UNIQUE,
    join_date DATE DEFAULT CURRENT_DATE
);

