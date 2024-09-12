-- CREATE AND USE DATABASE
CREATE DATABASE bookstore;
USE bookstore;



-- CREATE books TABLE
CREATE TABLE books (
  book_id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(40) NOT NULL,
  category VARCHAR(40) NOT NULL,
  author_f_name VARCHAR(50) NOT NULL,
  author_l_name VARCHAR(50) NOT NULL,
  release_year INT NOT NULL,
  best_seller VARCHAR(10) NOT NULL,
  price DECIMAL(5,2)
);




-- CREATE customers TABLE
CREATE TABLE customers (
  customer_id INT AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(40) NOT NULL,
  last_name VARCHAR(40) NOT NULL,
  age INT NOT NULL,
  email VARCHAR(50) NOT NULL,
  phone_number VARCHAR(40) NOT NULL
);





-- CREATE transactions TABLE
CREATE TABLE transactions (
  transaction_id INT AUTO_INCREMENT PRIMARY KEY,
  book_id INT,
  customer_id INT,
  transaction_date DATE NOT NULL,
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
  FOREIGN KEY (book_id) REFERENCES books(book_id)
);





-- INSERT DATA TO books TABLE
INSERT INTO books(title, category, author_f_name, author_l_name, release_year, best_seller, price)
VALUES 	('Llsola delle Maschere','Novel','Ulysses','Moore',2008,'no',14.90),
		('La Porta del Tempo','Novel','Ulysses','Moore',2004,'yes',12.50),
        ('La Casa degli Specchi','Novel','Ulysses','Moore',2005,'no',13.90),
        ('Nineteen Eighty-Four','Science-Fiction','George','Orwell',1949,'yes',9.99),
        ('Brave New World','Science-Fiction','Aldous','Huxley',1932,'yes',7.99),
        ('Fahrenheit 451','Dystopian','Ray','Bradbury',1953,'yes',8.99),
        ('The Hitchhiker’s Guide to the Galaxy','Science-Fiction','Douglas','Adams',1979,'yes',6.99),
        ('Dune','Science-Fiction','Frank','Herbert',1965,'yes',10.99),
        ('Neuromancer','Cyberpunk','William','Gibson',1984,'no',7.99),
        ('Snow Crash','Cyberpunk','Neal','Stephenson',1992,'no',9.49),
        ('The Left Hand of Darkness','Science-Fiction','Ursula','Le Guin',1969,'no',8.99),
        ('Foundation','Science-Fiction','Isaac','Asimov',1951,'no',9.99),
        ('The Martian','Science-Fiction','Andy','Weir',2011,'no',10.49),
        ('The Road','Post-Apocalyptic','Cormac','McCarthy',2006,'no',7.99),
        ('The War of the Worlds','Science-Fiction','H.G.','Wells',1898,'no',5.99),
        ('I, Robot','Science-Fiction','Isaac','Asimov',1950,'no',6.99),
        ('The Time Machine','Science-Fiction','H.G.','Wells',1895,'no',6.49),
        ('The Silence of the Lambs','Crime','Thomas','Harris',1988,'no',9.49),
        ('The Big Sleep','Crime','Raymond','Chandler',1939,'yes',6.99),
        ('Murder on the Orient Express','Crime','Agatha','Christie',1934,'yes',7.49);






-- INSERT DATA TO customers TABLE
INSERT INTO customers(first_name, last_name, age, email, phone_number)
VALUES 	('John','Doe',35,'john.doe@gmail.com','555-123-4567'),
		('Jane','Smith',28,'jane.smith@gmail.com','555-987-6543'),
		('Michael','Brown',42,'michael.brown@gmail.com','555-564-7890'),
		('Emily','Davis',31,'emily.davis@gmail.com','555-432-8765'),
		('Robert','Johnson',46,'robert.johnson@gmail.com','555-765-4321'),
		('Sarah','Wilson',22,'sarah.wilson@gmail.com','555-654-3210'),
		('David','Clark',38,'david.clark@gmail.com','555-876-5432'),
		('Laura','Garcia',30,'laura.garcia@gmail.com','555-234-5678'),
		('James','Martinez',29,'james.martinez@gmail.com','555-789-0123'),
		('Sophia','Hernandez',24,'sophia.hernandez@gmail.com','555-890-1234');







-- INSERT DATA TO transactions TABLE
INSERT INTO transactions(book_id, customer_id, transaction_date)
VALUES 	(13,3,'2024-08-21'),
		(13,5,'2024-09-01'),
		(9,1,'2024-07-15'),
		(11,2,'2024-06-30'),
		(1,4,'2024-09-05'),
		(2,2,'2024-08-10'),
		(7,6,'2024-08-20'),
		(8,5,'2024-09-03'),
		(9,4,'2024-07-18'),
		(10,10,'2024-08-05'),
		(11,3,'2024-09-07'),
		(12,1,'2024-06-12'),
		(13,5,'2024-09-09'),
		(14,2,'2024-09-06'),
		(15,4,'2024-07-22'),
		(16,1,'2024-09-08'),
		(17,2,'2024-08-25'),
		(18,4,'2024-09-02'),
		(19,5,'2024-08-30'),
		(20,6,'2024-07-10'),
		(1,6,'2024-09-12'),
		(2,10,'2024-08-15'),
		(3,9,'2024-08-22');
        





-- CREATE PROCEDURES
-- NO 1
DELIMITER //
CREATE PROCEDURE topFiveBooks()
BEGIN 
	SELECT title, COUNT(transaction_id) AS total_sales
	FROM books
	INNER JOIN transactions
		ON books.book_id = transactions.book_id
	GROUP BY title
	ORDER BY total_sales DESC
    LIMIT 5;
END //
DELIMITER ;





-- NO 2
DELIMITER //
CREATE PROCEDURE topFiveCustomers()
BEGIN 
	SELECT first_name, last_name, COUNT(transaction_id) AS total_transactions 
	FROM customers
	INNER JOIN transactions
		ON customers.customer_id = transactions.customer_id
	GROUP BY first_name, last_name
	ORDER BY total_transactions DESC
	LIMIT 5;
END //
DELIMITER ;






-- NO 3
DELIMITER //
CREATE PROCEDURE getCustomersByBook(IN id INT)
BEGIN 
	SELECT transaction_id, title, first_name, last_name, price, transaction_date
	FROM transactions
	INNER JOIN customers
		ON transactions.customer_id = customers.customer_id
	INNER JOIN books
		ON transactions.book_id = books.book_id
	WHERE books.book_id = id;
END //
DELIMITER ;






-- NO 4
DELIMITER //
CREATE PROCEDURE bookTotalSales(IN id INT)
BEGIN 
	SELECT title, COUNT(transaction_id) AS total_sales
	FROM books
	LEFT JOIN transactions
		ON transactions.book_id = books.book_id
	WHERE books.book_id = id
	GROUP BY title;
END //
DELIMITER ;






-- NO 5
DELIMITER //
CREATE PROCEDURE booksPurchasedByCustomer(IN f_name VARCHAR(40), IN l_name VARCHAR(40))
BEGIN 
	SELECT first_name, last_name, title AS books_bought
	FROM customers
	INNER JOIN transactions
		ON transactions.customer_id = customers.customer_id
	INNER JOIN books
		ON transactions.book_id = books.book_id
	WHERE first_name = f_name AND last_name = l_name;
END //
DELIMITER ;




CALL booksPurchasedByCustomer('Emily', 'Davis');
CALL bookTotalSales(2);
CALL getCustomersByBook(2);
CALL topFiveBooks();
CALL topFiveCustomers();


