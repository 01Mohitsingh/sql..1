create database test;
use test;
-- Create Books table
CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(100),
    Author VARCHAR(100),
    Price INT
);

-- Insert data into Books table
INSERT INTO Books (BookID, Title, Author, Price) VALUES
(1, 'The Alchemist', 'Paulo Coelho', 300),
(2, '1984', 'George Orwell', 250),
(3, 'To Kill a Mockingbird', 'Harper Lee', 400),
(4, 'The Great Gatsby', 'F. Scott Fitzgerald', 350),
(5, 'Moby Dick', 'Herman Melville', 450);

-- Create BorrowRecords table
CREATE TABLE BorrowRecords (
    RecordID INT PRIMARY KEY,
    BookID INT,
    BorrowerName VARCHAR(50),
    BorrowDate DATE,
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

-- Insert data into BorrowRecords table
INSERT INTO BorrowRecords (RecordID, BookID, BorrowerName, BorrowDate) VALUES
(101, 1, 'Alice', '2022-01-10'),
(102, 2, 'Bob', '2022-01-12'),
(103, 3, 'Charlie', '2022-01-15'),
(104, 1, 'Diana', '2022-02-01'),
(105, 4, 'Alice', '2022-02-05'),
(106, 5, 'Ethan', '2022-02-20'),
(107, 2, 'Frank', '2022-03-01'),
(108, 3, 'Alice', '2022-03-05'),
(109, 4, 'Bob', '2022-03-10'),
(110, 1, 'Charlie', '2022-03-15');

select * from books;
select * from borrowrecords;	

-- 1. Find how many times each book has been borrowed.
SELECT a.Title, COUNT(b.RecordID) AS BorrowCount FROM Books AS a
JOIN BorrowRecords AS b
ON a.BookID = b.BookID
GROUP BY a.Title;

-- 2. Find books that have been borrowed more than 2 times.
SELECT a.Title, COUNT(b.RecordID)
FROM Books AS a
JOIN BorrowRecords AS b
ON a.BookID = b.BookID
GROUP BY a.Title
HAVING COUNT(b.RecordID) > 2;

-- 3. Find borrowers who borrowed books priced above the average price of all books.
SELECT a.BorrowerName 
FROM BorrowRecords AS a
JOIN Books AS b
ON a.BookID = b.BookID
GROUP BY a.BorrowerName
HAVING SUM(b.Price) > (SELECT AVG(Price) FROM Books);

-- 4. Find total money value of books borrowed by each borrower.
SELECT a.BorrowerName, SUM(b.Price)
FROM BorrowRecords AS a
JOIN Books AS b
ON a.BookID = b.BookID
GROUP BY a.BorrowerName;

-- 5. Most expensive book borrowed
SELECT Title, Price 
FROM Books 
WHERE Price = (SELECT MAX(Price) FROM Books);

-- 6. Each book and latest date it was borrowed
SELECT a.Title, MAX(b.BorrowDate) AS LastBorrowed
FROM Books AS a
JOIN BorrowRecords AS b
ON a.BookID = b.BookID
GROUP BY a.Title
HAVING MAX(b.BorrowDate);

-- 7. Borrowers who borrowed books by the same author more than once
SELECT a.BorrowerName, b.Author, COUNT(b.Author)
FROM BorrowRecords AS a
JOIN Books AS b
ON a.BookID = b.BookID
GROUP BY a.BorrowerName, b.Author
HAVING COUNT(b.Author) > 1;