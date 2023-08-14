-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: oubus
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `id` int NOT NULL AUTO_INCREMENT,
  `taiKhoan` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `matKhau` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_vi_0900_as_cs DEFAULT NULL,
  `maQuyen` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (1,'admin','123',1),(2,'staff','123',2),(3,'staff1','123',2),(4,'staff2','123',2),(5,'admin','123',1);
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Điện thoại thông minh',NULL),(2,'Máy tính bảng',NULL),(3,'Máy tính xách tay',NULL),(4,'MOBILE','DIEN THOAI DI DONG');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chuyendi`
--

DROP TABLE IF EXISTS `chuyendi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chuyendi` (
  `id` int NOT NULL AUTO_INCREMENT,
  `giaVe` int DEFAULT NULL,
  `ngayKhoiHanh` date DEFAULT NULL,
  `gioKhoiHanh` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `diemKhoiHanh` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `diemKetThuc` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `soGheTrong` int DEFAULT '20',
  `soGheDat` int DEFAULT '0',
  `trangThai` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_vi_0900_ai_ci DEFAULT 'Chua khoi hanh',
  `maXe` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_chuyendi_xekhach_idx` (`maXe`),
  CONSTRAINT `fk_chuyendi_xekhach` FOREIGN KEY (`maXe`) REFERENCES `xekhach` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chuyendi`
--

LOCK TABLES `chuyendi` WRITE;
/*!40000 ALTER TABLE `chuyendi` DISABLE KEYS */;
INSERT INTO `chuyendi` VALUES (1,120000,'2020-02-02','12:00:00','TPHCM','Gia Lai',20,0,'Đã khởi hành',1),(2,200000,'2023-03-27','19:30:00','Nha Trang','TPHCM',19,1,'Đã khởi hành',2),(6,60000,'2023-03-17','08:00:00','Hau Giang','TP HCM',20,0,'Đã khởi hành',2),(7,100000,'2023-03-13','07:30:00','Ben Tre','TP HCM',17,3,'Đã khởi hành',1),(8,300000,'2023-03-30','20:00:00','Nha Trang','An Giang',20,0,'Đã khởi hành',1),(10,123123,'2023-04-01','21:00:00','A','B',19,1,'Đã khởi hành',1),(12,300000,'2023-03-10','17:00:00','C','D',20,0,'Đã khởi hành',2),(13,123123,'2023-03-30','16:43:00','AA','BBB',20,0,'Đã khởi hành',1),(15,120000,'2023-03-30','21:40:00','ABCC','CBAA',20,0,'Đã khởi hành',1),(16,120000,'2023-03-30','22:40:00','A','B',17,3,'Đã khởi hành',1),(17,110000,'2023-03-30','21:45:00','B','C',20,0,'Đã khởi hành',2),(18,120000,'2023-03-31','18:15:00','H','H',20,0,'Đã khởi hành',2),(19,130000,'2023-04-14','09:07:00','A01','B01',18,2,'Đã khởi hành',1),(20,20,'2023-04-14','08:58:00','C01','C02',20,0,'Đã khởi hành',2),(21,130000,'2023-04-14','17:00:00','Ben Tre','Tien Giang',20,0,'Đã khởi hành',2),(22,145000,'2023-04-14','12:30:00','Ha Tinh','Hue',20,0,'Đã khởi hành',1),(24,12000,'2023-04-19','20:00:00','A','C',19,1,'Chua khoi hanh',2),(25,130000,'2023-04-19','17:00:00','Ben Tre','Tien Giang',20,0,'Đã khởi hành',2),(26,145000,'2023-04-19','12:30:00','Ha Tinh','Hue',20,0,'Đã khởi hành',1),(27,123000,'2023-04-19','17:00:00','An Giang','Tien Giang',20,0,'Đã khởi hành',1);
/*!40000 ALTER TABLE `chuyendi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doanhthuchuyendi`
--

DROP TABLE IF EXISTS `doanhthuchuyendi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doanhthuchuyendi` (
  `id` int NOT NULL AUTO_INCREMENT,
  `doanhthu` int DEFAULT NULL,
  `soVeDat` int DEFAULT NULL,
  `ngay` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doanhthuchuyendi`
--

LOCK TABLES `doanhthuchuyendi` WRITE;
/*!40000 ALTER TABLE `doanhthuchuyendi` DISABLE KEYS */;
INSERT INTO `doanhthuchuyendi` VALUES (1,120000,1,'2020-02-02'),(2,200000,1,'2023-03-27');
/*!40000 ALTER TABLE `doanhthuchuyendi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nhanvien`
--

DROP TABLE IF EXISTS `nhanvien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nhanvien` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tenNhanVien` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `maLoaiNhanVien` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `ngaySinh` date DEFAULT NULL,
  `soDienThoai` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `cMND` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `queQuan` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `maAccount` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `maAccount_UNIQUE` (`maAccount`),
  CONSTRAINT `fk_account_nhanvien` FOREIGN KEY (`maAccount`) REFERENCES `account` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nhanvien`
--

LOCK TABLES `nhanvien` WRITE;
/*!40000 ALTER TABLE `nhanvien` DISABLE KEYS */;
INSERT INTO `nhanvien` VALUES (1,'Lê Văn Lâm','staff','2000-01-01','0335555555','123456789123','TPHCM',2),(2,'Thái Tấn Phát','staff','1999-02-02','0720397434','123456789123','An Giang',3),(5,'Võ Bùi Minh Hoàng','Tổng giám đốc','2023-04-12','0399987202','056202010094','056202010094',4),(6,'Võ Bùi Minh Hoàng','Tổng giám đốc','2023-04-12','0399987202','056202010094','056202010094',1);
/*!40000 ALTER TABLE `nhanvien` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `unit_price` decimal(10,0) DEFAULT '0',
  `num` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK_ORDERDETAIL_ORDER_idx` (`order_id`),
  KEY `FK_ORDERDETAIL_PRODUCT_idx` (`product_id`),
  CONSTRAINT `FK_ORDERDETAIL_ORDER` FOREIGN KEY (`order_id`) REFERENCES `sale_order` (`id`),
  CONSTRAINT `FK_ORDERDETAIL_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_detail`
--

LOCK TABLES `order_detail` WRITE;
/*!40000 ALTER TABLE `order_detail` DISABLE KEYS */;
INSERT INTO `order_detail` VALUES (7,4,3,17000000,'1'),(9,5,3,17000000,'1'),(10,5,7,10540000,'1'),(12,7,5,18600000,'1'),(13,7,6,12990000,'3'),(16,8,3,17000000,'1'),(19,10,4,28000000,'1'),(20,10,5,18600000,'5'),(23,11,3,17000000,'1');
/*!40000 ALTER TABLE `order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `price` decimal(10,0) DEFAULT '0',
  `manufacturer` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `image` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `active` bit(1) DEFAULT b'1',
  `category_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_PRODUCE_CATEGORY_idx` (`category_id`),
  CONSTRAINT `FK_PRODUCE_CATEGORY` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (3,'iPhone 11','64GB',17000000,NULL,'https://res.cloudinary.com/dxxwcby8l/image/upload/v1679731990/k9dg9v2fnnrbe0jddswv.jpg',NULL,NULL,1),(4,'iPhone 11 Pro Max','64GB',28000000,'Apple','https://res.cloudinary.com/dxxwcby8l/image/upload/v1679134375/ckvdo90ltnfns77zf1xb.jpg','2020-01-15 00:00:00',_binary '',1),(5,'Galaxy Tab S6','128GB',18600000,NULL,'https://res.cloudinary.com/dxxwcby8l/image/upload/v1679731974/jlad6jqdc69cjrh9zggq.jpg',NULL,NULL,2),(6,'iPad Mini 7.9','64GB, Wifi',12990000,'Apple','https://res.cloudinary.com/dxxwcby8l/image/upload/v1679126974/vz4jnpuqydszbtrcbcnd.jpg','2020-01-18 00:00:00',_binary '',2),(7,'iPad 10.2 inch','32GB, Wifi Cellular',10540000,'Apple','https://res.cloudinary.com/dxxwcby8l/image/upload/v1679126974/vz4jnpuqydszbtrcbcnd.jpg','2020-01-26 00:00:00',_binary '',2),(19,'iPhone 13','Apple',1500000,NULL,'https://res.cloudinary.com/dxxwcby8l/image/upload/v1679729888/ahwad5grrwwvpdpxcjpp.jpg',NULL,NULL,4),(20,'iPhone 13 pro max',NULL,12000,NULL,'https://res.cloudinary.com/dxxwcby8l/image/upload/v1679738736/rmdudpsj4m3map23s8b0.jpg',NULL,NULL,4),(24,'iPhone 24',NULL,240000,NULL,'https://res.cloudinary.com/dxxwcby8l/image/upload/v1679738642/zgsrphegfyvgztzl6qnl.jpg',NULL,NULL,2);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale_order`
--

DROP TABLE IF EXISTS `sale_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sale_order` (
  `id` int NOT NULL AUTO_INCREMENT,
  `amount` decimal(10,0) DEFAULT NULL,
  `created_date` datetime NOT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ORDER_USER_idx` (`user_id`),
  CONSTRAINT `FK_ORDER_USER` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale_order`
--

LOCK TABLES `sale_order` WRITE;
/*!40000 ALTER TABLE `sale_order` DISABLE KEYS */;
INSERT INTO `sale_order` VALUES (4,50500000,'2020-02-03 00:00:00',7),(5,40040000,'2020-02-03 00:00:00',7),(6,21000000,'2020-02-03 00:00:00',7),(7,57570000,'2020-02-04 00:00:00',7),(8,71500000,'2020-02-05 00:00:00',6),(9,54500000,'2020-02-05 00:00:00',7),(10,121000000,'2020-02-07 00:00:00',6),(11,84000000,'2020-02-07 00:00:00',8),(12,100,'2020-11-17 18:43:31',NULL),(13,100,'2020-11-17 18:48:11',NULL);
/*!40000 ALTER TABLE `sale_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `last_name` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `email` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `phone` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `username` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `password` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `active` bit(1) DEFAULT b'1',
  `user_role` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (6,'Thanh','Duong','thanh.dh@ou.edu.vn','0984461467','dhthanh','$2a$10$5X9k5N1sTc1/CjVH5XJoje3QMYijH3ETpgkox00R0MdPaJPPrf7wO',_binary '','ROLE_ADMIN'),(7,'Thanh','Duong','dhthanhqa@gmail.com','0984461461','thanhduong','$2a$10$RL0rTJd2ThLmCzYHMhz9aOBBZfA8ybYpa3Ugl9ds.Pkb8AjtSHWua',_binary '','ROLE_USER'),(8,'Doremon','Mr','mon@gmail.com','1111111111','doremon','$2a$10$qv8SsUwRnp/YhPWTPqdgp.MXJ01hcW4ji6wKvP6.qkWWx1ZxhqxyG',_binary '','ROLE_USER');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vexe`
--

DROP TABLE IF EXISTS `vexe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vexe` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tenKhachHang` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ngayDat` date DEFAULT NULL,
  `sdt` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `viTriGhe` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trangThai` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `maChuyenDi` int DEFAULT NULL,
  `maNhanVien` int DEFAULT NULL,
  `maDoanhThu` int DEFAULT NULL,
  `diemDon` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_vexe_chuyendi_idx` (`maChuyenDi`),
  KEY `fk_doanhthu_vexe_idx` (`maDoanhThu`),
  KEY `fk_vexe_account_idx` (`maNhanVien`),
  CONSTRAINT `fk_doanhthu_vexe` FOREIGN KEY (`maDoanhThu`) REFERENCES `doanhthuchuyendi` (`id`),
  CONSTRAINT `fk_vexe_account` FOREIGN KEY (`maNhanVien`) REFERENCES `account` (`id`),
  CONSTRAINT `fk_vexe_chuyendi` FOREIGN KEY (`maChuyenDi`) REFERENCES `chuyendi` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vexe`
--

LOCK TABLES `vexe` WRITE;
/*!40000 ALTER TABLE `vexe` DISABLE KEYS */;
INSERT INTO `vexe` VALUES ('12f0c751-ac21-4f90-bc29-31ebf6373248','1','2023-03-30','1111111111','B02','Đã xuất',16,2,1,NULL),('2','Minh Hoang','2023-04-19','0399987202','B02','Đã đặt',7,2,1,'Nha Trang'),('292b5f6b-db7f-43b9-8c08-e9818002144c','v','2023-03-31','1233213213','A02','Đã xuất',10,2,1,'a'),('3','Minh Hoang','2023-04-04','0399987202','B02','Đã đặt',7,2,1,'Nha Trang'),('4','Minh Hoang','2023-04-19','0399987202','B02','Đã đặt',7,2,1,'Nha Trang'),('48a85076-5ecb-480f-badf-3baf8acb124e','Võ Bùi Minh Hoàng','2023-04-14','0234567890','A02','Đã xuất',19,2,1,'B'),('6','1','2023-03-30','1111111111','A01','Đã xuất',16,2,1,NULL),('6180bad4-883d-4582-a5e6-8fab3fb748f9','1','2023-03-30','1111111111','B01','Đã xuất',16,2,1,NULL),('84001069-174f-4b78-9d91-2ac53bb688cb','AA','2023-04-14','0123456789','A01','Đã xuất',19,2,1,'B'),('97788030-4241-40fa-b27c-b87c51edb891','a','2023-04-19','0123456789','A02','Đã đặt',24,2,1,'a');
/*!40000 ALTER TABLE `vexe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xekhach`
--

DROP TABLE IF EXISTS `xekhach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `xekhach` (
  `id` int NOT NULL AUTO_INCREMENT,
  `bienSoXe` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `soGhe` int DEFAULT NULL,
  `maNhanVien` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `maNhanVien` FOREIGN KEY (`id`) REFERENCES `nhanvien` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xekhach`
--

LOCK TABLES `xekhach` WRITE;
/*!40000 ALTER TABLE `xekhach` DISABLE KEYS */;
INSERT INTO `xekhach` VALUES (1,'55-A23',20,1),(2,'59-B12',20,2);
/*!40000 ALTER TABLE `xekhach` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-14 13:15:17
