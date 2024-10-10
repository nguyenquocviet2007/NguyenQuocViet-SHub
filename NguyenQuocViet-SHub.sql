-- MySQL dump 10.13  Distrib 8.0.39, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: gas_station
-- ------------------------------------------------------
-- Server version	8.0.39-0ubuntu0.22.04.1

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
-- Table structure for table `Fuel_Columns`
--

DROP TABLE IF EXISTS `Fuel_Columns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Fuel_Columns` (
  `column_id` int NOT NULL AUTO_INCREMENT,
  `column_name` varchar(5) NOT NULL,
  `good_id` int DEFAULT NULL,
  PRIMARY KEY (`column_id`),
  KEY `good_id` (`good_id`),
  CONSTRAINT `Fuel_Columns_ibfk_1` FOREIGN KEY (`good_id`) REFERENCES `Goods` (`good_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Fuel_Columns`
--

LOCK TABLES `Fuel_Columns` WRITE;
/*!40000 ALTER TABLE `Fuel_Columns` DISABLE KEYS */;
/*!40000 ALTER TABLE `Fuel_Columns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Goods`
--

DROP TABLE IF EXISTS `Goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Goods` (
  `good_id` int NOT NULL AUTO_INCREMENT,
  `good_name` varchar(50) NOT NULL,
  `good_price` int NOT NULL,
  PRIMARY KEY (`good_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Goods`
--

LOCK TABLES `Goods` WRITE;
/*!40000 ALTER TABLE `Goods` DISABLE KEYS */;
/*!40000 ALTER TABLE `Goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Stations`
--

DROP TABLE IF EXISTS `Stations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Stations` (
  `station_id` int NOT NULL AUTO_INCREMENT,
  `station_name` varchar(50) NOT NULL,
  `location` varchar(50) NOT NULL,
  `column_id` int DEFAULT NULL,
  PRIMARY KEY (`station_id`),
  KEY `column_id` (`column_id`),
  CONSTRAINT `Stations_ibfk_1` FOREIGN KEY (`column_id`) REFERENCES `Fuel_Columns` (`column_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Stations`
--

LOCK TABLES `Stations` WRITE;
/*!40000 ALTER TABLE `Stations` DISABLE KEYS */;
/*!40000 ALTER TABLE `Stations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Transactions`
--

DROP TABLE IF EXISTS `Transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Transactions` (
  `transaction_id` int NOT NULL AUTO_INCREMENT,
  `createdAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `total_quantity_good` double NOT NULL,
  `total_bill` int NOT NULL,
  PRIMARY KEY (`transaction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Transactions`
--

LOCK TABLES `Transactions` WRITE;
/*!40000 ALTER TABLE `Transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `Transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Transactions_FuelColumns`
--

DROP TABLE IF EXISTS `Transactions_FuelColumns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Transactions_FuelColumns` (
  `transaction_id` int NOT NULL,
  `column_id` int NOT NULL,
  PRIMARY KEY (`transaction_id`,`column_id`),
  KEY `column_id` (`column_id`),
  CONSTRAINT `Transactions_FuelColumns_ibfk_1` FOREIGN KEY (`transaction_id`) REFERENCES `Transactions` (`transaction_id`),
  CONSTRAINT `Transactions_FuelColumns_ibfk_2` FOREIGN KEY (`column_id`) REFERENCES `Fuel_Columns` (`column_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Transactions_FuelColumns`
--

LOCK TABLES `Transactions_FuelColumns` WRITE;
/*!40000 ALTER TABLE `Transactions_FuelColumns` DISABLE KEYS */;
/*!40000 ALTER TABLE `Transactions_FuelColumns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Transactions_Stations`
--

DROP TABLE IF EXISTS `Transactions_Stations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Transactions_Stations` (
  `transaction_id` int NOT NULL,
  `station_id` int NOT NULL,
  PRIMARY KEY (`transaction_id`,`station_id`),
  KEY `station_id` (`station_id`),
  CONSTRAINT `Transactions_Stations_ibfk_1` FOREIGN KEY (`transaction_id`) REFERENCES `Transactions` (`transaction_id`),
  CONSTRAINT `Transactions_Stations_ibfk_2` FOREIGN KEY (`station_id`) REFERENCES `Stations` (`station_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Transactions_Stations`
--

LOCK TABLES `Transactions_Stations` WRITE;
/*!40000 ALTER TABLE `Transactions_Stations` DISABLE KEYS */;
/*!40000 ALTER TABLE `Transactions_Stations` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-10 15:33:58
