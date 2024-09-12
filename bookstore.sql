CREATE DATABASE  IF NOT EXISTS `bookstore` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `bookstore`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: bookstore
-- ------------------------------------------------------
-- Server version	8.0.39

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books` (
  `book_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(40) NOT NULL,
  `category` varchar(40) NOT NULL,
  `author_f_name` varchar(50) NOT NULL,
  `author_l_name` varchar(50) NOT NULL,
  `release_year` int NOT NULL,
  `best_seller` varchar(10) NOT NULL,
  `price` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (1,'Llsola delle Maschere','Novel','Ulysses','Moore',2008,'no',14.90),(2,'La Porta del Tempo','Novel','Ulysses','Moore',2004,'yes',12.50),(3,'La Casa degli Specchi','Novel','Ulysses','Moore',2005,'no',13.90),(4,'Nineteen Eighty-Four','Science-Fiction','George','Orwell',1949,'yes',9.99),(5,'Brave New World','Science-Fiction','Aldous','Huxley',1932,'yes',7.99),(6,'Fahrenheit 451','Dystopian','Ray','Bradbury',1953,'yes',8.99),(7,'The Hitchhiker’s Guide to the Galaxy','Science-Fiction','Douglas','Adams',1979,'yes',6.99),(8,'Dune','Science-Fiction','Frank','Herbert',1965,'yes',10.99),(9,'Neuromancer','Cyberpunk','William','Gibson',1984,'no',7.99),(10,'Snow Crash','Cyberpunk','Neal','Stephenson',1992,'no',9.49),(11,'The Left Hand of Darkness','Science-Fiction','Ursula','Le Guin',1969,'no',8.99),(12,'Foundation','Science-Fiction','Isaac','Asimov',1951,'no',9.99),(13,'The Martian','Science-Fiction','Andy','Weir',2011,'no',10.49),(14,'The Road','Post-Apocalyptic','Cormac','McCarthy',2006,'no',7.99),(15,'The War of the Worlds','Science-Fiction','H.G.','Wells',1898,'no',5.99),(16,'I, Robot','Science-Fiction','Isaac','Asimov',1950,'no',6.99),(17,'The Time Machine','Science-Fiction','H.G.','Wells',1895,'no',6.49),(18,'The Silence of the Lambs','Crime','Thomas','Harris',1988,'no',9.49),(19,'The Big Sleep','Crime','Raymond','Chandler',1939,'yes',6.99),(20,'Murder on the Orient Express','Crime','Agatha','Christie',1934,'yes',7.49);
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(40) NOT NULL,
  `last_name` varchar(40) NOT NULL,
  `age` int NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone_number` varchar(40) NOT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'John','Doe',35,'john.doe@gmail.com','555-123-4567'),(2,'Jane','Smith',28,'jane.smith@gmail.com','555-987-6543'),(3,'Michael','Brown',42,'michael.brown@gmail.com','555-564-7890'),(4,'Emily','Davis',31,'emily.davis@gmail.com','555-432-8765'),(5,'Robert','Johnson',46,'robert.johnson@gmail.com','555-765-4321'),(6,'Sarah','Wilson',22,'sarah.wilson@gmail.com','555-654-3210'),(7,'David','Clark',38,'david.clark@gmail.com','555-876-5432'),(8,'Laura','Garcia',30,'laura.garcia@gmail.com','555-234-5678'),(9,'James','Martinez',29,'james.martinez@gmail.com','555-789-0123'),(10,'Sophia','Hernandez',24,'sophia.hernandez@gmail.com','555-890-1234');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions` (
  `transaction_id` int NOT NULL AUTO_INCREMENT,
  `book_id` int DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  `transaction_date` date NOT NULL,
  PRIMARY KEY (`transaction_id`),
  KEY `customer_id` (`customer_id`),
  KEY `book_id` (`book_id`),
  CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`),
  CONSTRAINT `transactions_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` VALUES (1,13,3,'2024-08-21'),(2,13,5,'2024-09-01'),(3,9,1,'2024-07-15'),(4,11,2,'2024-06-30'),(5,1,4,'2024-09-05'),(6,2,2,'2024-08-10'),(7,7,6,'2024-08-20'),(8,8,5,'2024-09-03'),(9,9,4,'2024-07-18'),(10,10,10,'2024-08-05'),(11,11,3,'2024-09-07'),(12,12,1,'2024-06-12'),(13,13,5,'2024-09-09'),(14,14,2,'2024-09-06'),(15,15,4,'2024-07-22'),(16,16,1,'2024-09-08'),(17,17,2,'2024-08-25'),(18,18,4,'2024-09-02'),(19,19,5,'2024-08-30'),(20,20,6,'2024-07-10'),(21,1,6,'2024-09-12'),(22,2,10,'2024-08-15'),(23,3,9,'2024-08-22');
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'bookstore'
--
/*!50003 DROP PROCEDURE IF EXISTS `booksPurchasedByCustomer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `booksPurchasedByCustomer`(IN f_name VARCHAR(40), IN l_name VARCHAR(40))
BEGIN 
	SELECT first_name, last_name, title AS books_bought
	FROM customers
	INNER JOIN transactions
		ON transactions.customer_id = customers.customer_id
	INNER JOIN books
		ON transactions.book_id = books.book_id
	WHERE first_name = f_name AND last_name = l_name;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `bookTotalSales` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `bookTotalSales`(IN id INT)
BEGIN 
	SELECT title, COUNT(transaction_id) AS total_sales
	FROM books
	LEFT JOIN transactions
		ON transactions.book_id = books.book_id
	WHERE books.book_id = id
	GROUP BY title;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getCustomersByBook` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getCustomersByBook`(IN id INT)
BEGIN 
	SELECT transaction_id, title, first_name, last_name, price, transaction_date
	FROM transactions
	INNER JOIN customers
		ON transactions.customer_id = customers.customer_id
	INNER JOIN books
		ON transactions.book_id = books.book_id
	WHERE books.book_id = id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `topFiveBooks` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `topFiveBooks`()
BEGIN 
	SELECT title, COUNT(transaction_id) AS total_sales
	FROM books
	INNER JOIN transactions
		ON books.book_id = transactions.book_id
	GROUP BY title
	ORDER BY total_sales DESC
    LIMIT 5;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `topFiveCustomers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `topFiveCustomers`()
BEGIN 
	SELECT first_name, last_name, COUNT(transaction_id) AS total_transactions 
	FROM customers
	INNER JOIN transactions
		ON customers.customer_id = transactions.customer_id
	GROUP BY first_name, last_name
	ORDER BY total_transactions DESC
	LIMIT 5;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-12 18:17:15
