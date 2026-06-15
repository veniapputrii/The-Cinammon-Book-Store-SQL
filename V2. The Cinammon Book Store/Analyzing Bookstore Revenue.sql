



-- Create the Sales Table
CREATE TABLE sales (
    sale_id SERIAL PRIMARY KEY,
    book_id INT REFERENCES books(book_id),
    customer_id INT REFERENCES customers(customer_id),
    quantity_sold INT,
    sale_date DATE DEFAULT CURRENT_DATE
);

-- Insert Sample Sales Data
INSERT INTO sales (book_id, customer_id, quantity_sold, sale_date) VALUES
(1, 1, 2, '2026-06-01'), -- Alice bought 2 Harry Potter books
(2, 2, 1, '2026-06-02'), -- Bob bought 1 Game of Thrones book
(1, 3, 1, '2026-06-03'), -- Charlie bought 1 Harry Potter book
(4, 1, 3, '2026-06-04'); -- Alice bought 3 Agatha Christie books

Select * from sales;

-- TASK : Aggregation Function 
-- The Grand Total: find the total number of all books ever sold
SELECT SUM(quantity_sold) as book_sold
from sales;

--The Price Check: find the average price of all the books in your books table
Select * From books;
Select  AVG(price) as AVG_Price
from books;


--The Superfan Analysis: find out how many total items each customer bought.
select * from customers;
Select * from sales;
Select customer_id, sum(quantity_sold)
from sales
group by customer_id;