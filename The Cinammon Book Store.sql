

-- 1. Create the Tables
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

-- 2. Insert Sample Data
INSERT INTO authors (author_name, country) VALUES
('J.K. Rowling', 'UK'),
('George R.R. Martin', 'USA'),
('Agatha Christie', 'UK');

INSERT INTO books (title, author_id, price, stock_quantity) VALUES
('Harry Potter and the Sorcerers Stone', 1, 19.99, 12),
('A Game of Thrones', 2, 24.99, 5),
('A Clash of Kings', 2, 21.99, 0), -- Out of stock
('Murder on the Orient Express', 3, 14.99, 20);

INSERT INTO customers (first_name, last_name, email, join_date) VALUES
('Alice', 'Smith', 'alice@email.com', '2026-01-15'),
('Bob', 'Jones', 'bob@email.com', '2026-02-20'),
('Charlie', 'Brown', 'charlie@email.com', '2026-03-05');

SELECT * FROM authors;

-- ✨ The inventory check
-- 💡 Display all the book titles and their price, but only 
--    for books than actually in stock (where stock_quantity is greater than 0)
Select title, price from books where stock_quantity > 0;

-- ✨ The International Authors
-- 💡 Find the names of all authors who are from the "UK"
Select * from authors where country = 'UK';

-- ✨ THe big spender
-- 💡 sort the price from books table from the highest price to the lowest price
Select * from public.books 
order by price DESC

-- ✨ Join
-- 💡 show the book 'title' alongside the 'author_name'
Select
authors.author_id author_id1,
authors.author_name,
books.author_id author_id2,
books.title
from 
authors
inner join books on authors.author_id = books.author_id;
