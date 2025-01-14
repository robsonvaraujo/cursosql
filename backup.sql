-- MySQL dump 10.13  Distrib 9.1.0, for Win64 (x86_64)
--
-- Host: localhost    Database: ecommerce_entrega
-- ------------------------------------------------------
-- Server version	9.1.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `idCliente` int NOT NULL AUTO_INCREMENT,
  `Pname` varchar(10) NOT NULL,
  `Nmeioinicial` varchar(3) DEFAULT NULL,
  `Sobrenome` varchar(20) DEFAULT NULL,
  `cpf` char(11) NOT NULL,
  `Endereço` varchar(45) DEFAULT NULL,
  `Dnascimento` date NOT NULL,
  PRIMARY KEY (`idCliente`),
  UNIQUE KEY `Identificação_UNIQUE` (`cpf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamentos`
--

DROP TABLE IF EXISTS `departamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departamentos` (
  `idDepartamento` int NOT NULL,
  `Nome` varchar(50) DEFAULT NULL,
  `Localização` text,
  PRIMARY KEY (`idDepartamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamentos`
--

LOCK TABLES `departamentos` WRITE;
/*!40000 ALTER TABLE `departamentos` DISABLE KEYS */;
INSERT INTO `departamentos` VALUES (1,'Financeiro','Bahia'),(2,'ADM','Bahia'),(3,'TI','Bahia'),(4,'Transporte','Bahia'),(5,'Suporte','Bahia'),(6,'Estoque','Bahia'),(7,'Vendas','São Paulo');
/*!40000 ALTER TABLE `departamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disponibilizando_produto`
--

DROP TABLE IF EXISTS `disponibilizando_produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disponibilizando_produto` (
  `Fornecedor_idFornecedor` int NOT NULL,
  `Produto_idProduto` int NOT NULL,
  PRIMARY KEY (`Fornecedor_idFornecedor`,`Produto_idProduto`),
  KEY `fk_Fornecedor_has_Produto_Produto1_idx` (`Produto_idProduto`),
  KEY `fk_Fornecedor_has_Produto_Fornecedor_idx` (`Fornecedor_idFornecedor`),
  CONSTRAINT `fk_Fornecedor_has_Produto_Fornecedor` FOREIGN KEY (`Fornecedor_idFornecedor`) REFERENCES `mydb`.`fornecedor` (`idFornecedor`),
  CONSTRAINT `fk_Fornecedor_has_Produto_Produto1` FOREIGN KEY (`Produto_idProduto`) REFERENCES `mydb`.`produto` (`idproduto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disponibilizando_produto`
--

LOCK TABLES `disponibilizando_produto` WRITE;
/*!40000 ALTER TABLE `disponibilizando_produto` DISABLE KEYS */;
/*!40000 ALTER TABLE `disponibilizando_produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estoque`
--

DROP TABLE IF EXISTS `estoque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estoque` (
  `idEstoque` int NOT NULL,
  `Local` varchar(45) DEFAULT NULL,
  `Produto` varchar(45) DEFAULT NULL,
  `Quantidade` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idEstoque`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estoque`
--

LOCK TABLES `estoque` WRITE;
/*!40000 ALTER TABLE `estoque` DISABLE KEYS */;
/*!40000 ALTER TABLE `estoque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estoque_de_produto`
--

DROP TABLE IF EXISTS `estoque_de_produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estoque_de_produto` (
  `Estoque_idEstoque` int NOT NULL,
  `Produto_idProduto` int NOT NULL,
  `Quantidade` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Estoque_idEstoque`,`Produto_idProduto`),
  KEY `fk_Estoque_has_Produto_Produto1_idx` (`Produto_idProduto`),
  KEY `fk_Estoque_has_Produto_Estoque1_idx` (`Estoque_idEstoque`),
  CONSTRAINT `fk_Estoque_has_Produto_Estoque1` FOREIGN KEY (`Estoque_idEstoque`) REFERENCES `estoque` (`idEstoque`),
  CONSTRAINT `fk_Estoque_has_Produto_Produto1` FOREIGN KEY (`Produto_idProduto`) REFERENCES `produto` (`idProduto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estoque_de_produto`
--

LOCK TABLES `estoque_de_produto` WRITE;
/*!40000 ALTER TABLE `estoque_de_produto` DISABLE KEYS */;
/*!40000 ALTER TABLE `estoque_de_produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fornecedor`
--

DROP TABLE IF EXISTS `fornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fornecedor` (
  `idFornecedor` int NOT NULL,
  `RSocial` varchar(45) NOT NULL,
  `CNPJ` char(14) DEFAULT NULL,
  `Telefone` varchar(15) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idFornecedor`),
  UNIQUE KEY `RSocial_UNIQUE` (`RSocial`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornecedor`
--

LOCK TABLES `fornecedor` WRITE;
/*!40000 ALTER TABLE `fornecedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `fornecedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionarios`
--

DROP TABLE IF EXISTS `funcionarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funcionarios` (
  `idFuncionario` int NOT NULL,
  `Nome` varchar(255) DEFAULT NULL,
  `Salario` decimal(10,2) DEFAULT NULL,
  `Departamento_id` int DEFAULT NULL,
  `Gerente_idGerente` int DEFAULT NULL,
  PRIMARY KEY (`idFuncionario`),
  KEY `Departamento_id` (`Departamento_id`),
  KEY `fk_Gerente_idGerente` (`Gerente_idGerente`),
  CONSTRAINT `fk_Gerente_idGerente` FOREIGN KEY (`Gerente_idGerente`) REFERENCES `gerentes` (`idGerente`),
  CONSTRAINT `funcionarios_ibfk_1` FOREIGN KEY (`Departamento_id`) REFERENCES `departamentos` (`idDepartamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionarios`
--

LOCK TABLES `funcionarios` WRITE;
/*!40000 ALTER TABLE `funcionarios` DISABLE KEYS */;
INSERT INTO `funcionarios` VALUES (1,'Ronson',2500.00,1,NULL),(2,'Elem',1900.00,2,NULL),(3,'Roberto',2200.00,3,NULL),(4,'Afonso',1800.00,4,NULL),(5,'Crodoaldo',2400.00,5,NULL),(6,'Cristiano',1600.00,6,NULL),(7,'Alencar',1900.00,1,NULL),(8,'Frascivaldo',2150.00,1,NULL),(9,'Florisvaldo',1950.00,1,1),(10,'Ronivaldo',3500.00,4,4);
/*!40000 ALTER TABLE `funcionarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_definir_gerente_departamento` BEFORE INSERT ON `funcionarios` FOR EACH ROW BEGIN
  SET NEW.Gerente_idGerente = (
    SELECT idGerente 
    FROM gerentes 
    WHERE Departamento_id = NEW.Departamento_id
  );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `gerentes`
--

DROP TABLE IF EXISTS `gerentes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gerentes` (
  `idGerente` int NOT NULL,
  `Nome` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Telefone` varchar(11) DEFAULT NULL,
  `Departamento_id` int DEFAULT NULL,
  PRIMARY KEY (`idGerente`),
  KEY `Departamento_id` (`Departamento_id`),
  CONSTRAINT `gerentes_ibfk_1` FOREIGN KEY (`Departamento_id`) REFERENCES `departamentos` (`idDepartamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gerentes`
--

LOCK TABLES `gerentes` WRITE;
/*!40000 ALTER TABLE `gerentes` DISABLE KEYS */;
INSERT INTO `gerentes` VALUES (1,'Robson',NULL,NULL,1),(2,'Elen',NULL,NULL,2),(3,'Roberto',NULL,NULL,3),(4,'Afonso',NULL,NULL,4),(5,'Crodoaldo',NULL,NULL,5),(6,'Cristiano',NULL,NULL,6),(7,'Alencar',NULL,NULL,7);
/*!40000 ALTER TABLE `gerentes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido` (
  `idPedido` int NOT NULL AUTO_INCREMENT,
  `Status_do_pedido` enum('Em andamento','Processando','Enviado','Entregue') DEFAULT 'Processando',
  `Descrição` varchar(45) DEFAULT NULL,
  `Cliente_idCliente` int NOT NULL,
  `Frete` float DEFAULT NULL,
  PRIMARY KEY (`idPedido`,`Cliente_idCliente`),
  KEY `fk_Pedido_Cliente1_idx` (`Cliente_idCliente`),
  CONSTRAINT `fk_Pedido_Cliente1` FOREIGN KEY (`Cliente_idCliente`) REFERENCES `mydb`.`cliente` (`idCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto` (
  `idProduto` int NOT NULL AUTO_INCREMENT,
  `Categoria` varchar(45) NOT NULL,
  `Descrição` varchar(45) DEFAULT NULL,
  `Valor` varchar(45) NOT NULL,
  PRIMARY KEY (`idProduto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto_por_vendedor`
--

DROP TABLE IF EXISTS `produto_por_vendedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto_por_vendedor` (
  `Terceito_vendedor_idTerceito_vendedor` int NOT NULL,
  `Produto_idProduto` int NOT NULL,
  `Quantidade` int DEFAULT NULL,
  `Produto_por_vendedorcol` int DEFAULT NULL,
  PRIMARY KEY (`Terceito_vendedor_idTerceito_vendedor`,`Produto_idProduto`),
  KEY `fk_Terceito_vendedor_has_Produto_Produto1_idx` (`Produto_idProduto`),
  KEY `fk_Terceito_vendedor_has_Produto_Terceito_vendedor1_idx` (`Terceito_vendedor_idTerceito_vendedor`),
  CONSTRAINT `fk_Terceito_vendedor_has_Produto_Produto1` FOREIGN KEY (`Produto_idProduto`) REFERENCES `produto` (`idProduto`),
  CONSTRAINT `fk_Terceito_vendedor_has_Produto_Terceito_vendedor1` FOREIGN KEY (`Terceito_vendedor_idTerceito_vendedor`) REFERENCES `terceito_vendedor` (`idTerceito_vendedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_por_vendedor`
--

LOCK TABLES `produto_por_vendedor` WRITE;
/*!40000 ALTER TABLE `produto_por_vendedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `produto_por_vendedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `terceito_vendedor`
--

DROP TABLE IF EXISTS `terceito_vendedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `terceito_vendedor` (
  `idTerceito_vendedor` int NOT NULL,
  `RSocial` varchar(45) NOT NULL,
  `Local` varchar(45) DEFAULT NULL,
  `NomeFantasia` varchar(45) NOT NULL,
  PRIMARY KEY (`idTerceito_vendedor`),
  UNIQUE KEY `Razão_social_UNIQUE` (`RSocial`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `terceito_vendedor`
--

LOCK TABLES `terceito_vendedor` WRITE;
/*!40000 ALTER TABLE `terceito_vendedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `terceito_vendedor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-14 19:51:01
