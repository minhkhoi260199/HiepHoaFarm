-- MySQL dump 10.13  Distrib 8.0.28, for macos10.15 (x86_64)
--
-- Host: hhfdb.c0if3g8m93cv.ap-southeast-1.rds.amazonaws.com    Database: hiephoafarm
-- ------------------------------------------------------
-- Server version	5.5.5-10.6.7-MariaDB-log

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
-- Table structure for table `ads`
--

DROP TABLE IF EXISTS `ads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ads` (
  `id_ads` int(11) NOT NULL,
  `adsname` varchar(45) NOT NULL,
  `adscontent` longtext NOT NULL,
  PRIMARY KEY (`id_ads`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ads`
--

/*!40000 ALTER TABLE `ads` DISABLE KEYS */;
/*!40000 ALTER TABLE `ads` ENABLE KEYS */;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id_category` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(150) NOT NULL,
  PRIMARY KEY (`id_category`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Trái cây'),(2,'Đặc sản vùng miền'),(20,'Sầu riêng'),(21,'Bán chạy');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;

--
-- Table structure for table `gallery`
--

DROP TABLE IF EXISTS `gallery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gallery` (
  `id_gallery` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `photo` varchar(150) NOT NULL,
  PRIMARY KEY (`id_gallery`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `gallery_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id_product`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gallery`
--

/*!40000 ALTER TABLE `gallery` DISABLE KEYS */;
INSERT INTO `gallery` VALUES (71,8,'DuaLuoi.jpeg'),(109,40,'zxcas.JPG'),(110,40,'zxcasd.JPG'),(111,40,'zxcs.JPG'),(112,39,'zxcm.jpeg'),(113,39,'zxca.jpeg'),(114,41,'zxcvasd.JPG'),(115,41,'zxcvbn.JPG'),(116,41,'zxcvbnm.JPG'),(117,1,'zxm.jpg'),(118,1,'zxn.jpg'),(119,2,'zc.jpg'),(120,2,'zx.jpg'),(121,2,'zv.jpg'),(122,3,'zo.jpg'),(123,3,'zxb.jpg'),(124,3,'zxv.jpg'),(125,23,'qwe.jpg'),(126,23,'qw.jpg'),(131,33,'zi.jpg'),(132,33,'zu.jpg'),(133,33,'zy.jpg'),(134,34,'zm.jpg'),(135,34,'zb.jpg'),(136,34,'zn.jpg'),(137,35,'zj.jpg'),(138,35,'zg.jpg'),(139,35,'zs.jpg'),(140,37,'zl.jpg'),(141,37,'zk.jpg'),(142,38,'zxcv.jpg'),(147,32,'zq.jpg'),(148,32,'zr.jpg'),(149,32,'zt.jpg'),(150,32,'zw.jpg');
/*!40000 ALTER TABLE `gallery` ENABLE KEYS */;

--
-- Table structure for table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_detail` (
  `Id_order_detail` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  PRIMARY KEY (`Id_order_detail`),
  KEY `product_id` (`product_id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `order_detail_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id_product`),
  CONSTRAINT `order_detail_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id_order`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_detail`
--

/*!40000 ALTER TABLE `order_detail` DISABLE KEYS */;
INSERT INTO `order_detail` VALUES (1,1,1,1),(2,1,1,2),(3,1,3,2),(4,1,3,4),(5,1,35,5),(6,1,35,6),(7,1,2,6),(8,1,8,7),(9,1,23,7),(10,1,8,8),(11,1,2,9),(12,1,1,10),(13,1,2,10),(14,1,1,11),(15,1,2,11),(16,1,1,12),(17,1,2,12),(18,1,1,13),(19,1,1,14),(20,1,1,15),(21,1,1,16),(22,1,3,17),(23,1,2,17),(24,1,1,18),(25,1,2,18),(26,1,3,18),(27,1,1,19),(28,2,8,19),(29,1,1,20),(30,1,2,20),(31,1,3,20),(32,1,8,20),(33,1,23,20),(34,1,32,20),(35,1,33,20),(36,1,34,20),(37,1,1,21),(38,1,1,22),(39,1,2,22),(40,2,8,22);
/*!40000 ALTER TABLE `order_detail` ENABLE KEYS */;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id_order` int(11) NOT NULL AUTO_INCREMENT,
  `customer_phone` varchar(10) NOT NULL,
  `customer_name` varchar(45) NOT NULL,
  `address` varchar(150) NOT NULL,
  `shipping_fee` int(11) NOT NULL,
  `order_amount` int(11) NOT NULL,
  `created_time` datetime NOT NULL DEFAULT current_timestamp(),
  `user_id` int(11) DEFAULT NULL,
  `status_id` int(11) NOT NULL,
  PRIMARY KEY (`id_order`),
  KEY `user_id` (`user_id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id_user`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `status` (`id_status`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'0969069589','Nguyen Minh Khoi','135 Thành Thái, phường 12, Quận 10, Hồ Chí Minh',30000,11141111,'2022-03-17 00:00:00',NULL,4),(2,'123456789','Petter Pan','135 Thành Thái, phường 12, Quận 10, Hồ Chí Minh',30000,11241111,'2022-03-18 00:00:00',NULL,4),(3,'dfv','dfv','dfv',222,111,'2022-03-17 21:30:19',NULL,4),(4,'0969069589','Nguyen Minh Khoi','135 Thành Thái, phường 12, Quận 10, Hồ Chí Minh',30000,130000,'2022-03-17 22:18:23',NULL,3),(5,'0969069589','Nguyen Minh Khoi','135 Thành Thái, phường 12, Quận 10, Hồ Chí Minh',30000,40000,'2022-03-17 22:40:01',NULL,3),(6,'123456789','Petter Pan','135 Thành Thái, phường 12, Quận 10, Hồ Chí Minh',30000,33373333,'2022-03-17 22:42:08',NULL,3),(7,'0969069589','Nguyen Minh Khoi','135 Thành Thái, phường 12, Quận 10, Hồ Chí Minh',30000,276246,'2022-03-17 22:43:36',NULL,3),(8,'0969069589','Nguyen Minh Khoi','135 Thành Thái, phường 12, Quận 10, Hồ Chí Minh',30000,153123,'2022-03-17 22:48:13',NULL,3),(9,'0969069589','Nguyen Minh Khoi','135 Thành Thái, phường 12, Quận 10, Hồ Chí Minh',30000,70000,'2022-03-18 16:55:05',NULL,3),(10,'123456789','Petter Pan','135 Thành Thái, phường 12, Quận 10, Hồ Chí Minh',30000,110000,'2022-03-18 16:56:01',NULL,3),(11,'123456789','Petter Pan','135 Thành Thái, phường 12, Quận 10, Hồ Chí Minh',30000,110000,'2022-03-18 16:56:03',NULL,3),(12,'123456789','Petter Pan','135 Thành Thái, phường 12, Quận 10, Hồ Chí Minh',30000,110000,'2022-03-18 17:00:15',NULL,3),(13,'0969069589','Nguyen Minh Khoi','135 Thành Thái, phường 12, Quận 10, Hồ Chí Minh',30000,70000,'2022-03-18 17:16:05',NULL,3),(14,'0969069589','Nguyen Minh Khoi','135 Thành Thái, phường 12, Quận 10, Hồ Chí Minh',30000,70000,'2022-03-18 17:17:20',NULL,3),(15,'0969069589','Nguyen Minh Khoi','135 Thành Thái, phường 12, Quận 10, Hồ Chí Minh',30000,70000,'2022-03-18 17:18:07',NULL,3),(16,'0865791056','Người anh Khoi iu','135 Thành Thái, phường 12, Quận 10, Hồ Chí Minh',30000,70000,'2022-03-18 17:56:54',NULL,3),(17,'0865791056','Bé chang ','135 Thành Thái, phường 12, Quận 10, Hồ Chí Minh',30000,110000,'2022-03-19 15:06:55',NULL,3),(18,'0969069589','Nguyen Minh Khoi','135 Thành Thái, phường 12, Quận 10, Hồ Chí Minh',30000,150000,'2022-03-21 09:02:24',NULL,3),(19,'0376674647','Tùng Nguyễn','78/8 Nguyễn Thị Tú, Bình Tân, HCM , phường 12, Quận 10, Hồ Chí Minh',30000,148000,'2022-03-31 09:26:47',NULL,3),(20,'3645646','khoi.nm203@aptechlearning.edu.vn','135 Thành Thái, phường 12, Quận 10, Hồ Chí Minh',30000,500111,'2022-04-13 06:50:13',NULL,3),(21,'0399945680','Đỗ Đình Hiệp','135 Thành Thái, phường 12, Quận 10, Hồ Chí Minh',30000,70000,'2022-04-24 08:29:33',NULL,3),(22,'0969069589','Nguyen Minh Khoi','135 Thành Thái, phường 12, Quận 10, Hồ Chí Minh',30000,206000,'2022-04-30 03:16:48',NULL,3);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id_product` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(150) NOT NULL,
  `description` longtext NOT NULL,
  `product_price` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `sale_unit` varchar(45) DEFAULT 'KG',
  `status_id` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id_product`),
  KEY `category_id` (`category_id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id_category`),
  CONSTRAINT `product_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `status` (`id_status`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Bưởi da xanh','👉 Bưởi da xanh Bến Tre thanh ngọt, giàu vitamin',39000,1,'KG',1),(2,'Xoài Cát HL - Cao Lãnh','👉 Tuyệt vời ông mặt trời 👉 Xoài xanh chấm muối ớt hết xảy 👉 Xoài trái siêu to khổng lồ',39000,1,'KG',1),(3,'Cam Sành','Cam sành Vĩnh Long mọng nước',29000,1,'KG',1),(8,'Dưa lưới hữu cơ','Dưa lưới thanh mát',49000,1,'KG',1),(23,'Sầu riêng Ri6','Sầu riêng Ri6 Tiền Giang. Thơm bùi ngọt thanh',109000,1,'Kg',1),(32,'Mận Hà Nội','Mận Hà Nội',99000,1,'Kg',1),(33,'Chôm chôm Thái','Chôm chôm ngọt thanh',39000,1,'KG',1),(34,'Nhãn Xuồng','Nhãn xuồng cơm vàng ngọt thanh',49000,1,'KG',1),(35,'Nấm Mỡ','Sản phẩm độc quyền. Nấm Mỡ đặc biệt sản xuất theo công nghệ Nhật Bản duy nhất tại Lâm Đồng - Việt Nam.',70000,2,'Hộp 300g',1),(37,'Mật ong rừng','Mật ong rừng vùng núi Việt Nam. Vị thuốc dân gian từ ngàn xưa.',400000,2,'chai 5l',1),(38,'Quả óc chó','Thơm ngon, tăng cường trí tuệ',70000,2,'Hộp',1),(39,'Trà quế thảo mộc','Sản phẩm trà quế túi lọc được chọn lọc từ những vỏ quế tốt nhất từ rừng Trà Bồng Quảng Ngãi, kết hợp hài hòa với các thảo mộc tự nhiên sẽ mang đến cho Bạn một tách trà thơm ngon, giúp thư giãn tinh thần vào tốt cho sức khỏe.',172000,2,'Hộp',1),(40,'Trà Quế Cam Mật ','Sản phẩm Trà Quế Cam Mật Ong được chọn lọc từ những vỏ quế tốt nhất từ rừng Trà Bồng Quảng Ngãi, kết hợp hài hòa với các nguyên liệu thiên nhiên sẽ mang đến cho Bạn một tách trà thơm ngon, giúp thư giãn tinh thần vào tốt cho sức khỏe.\nSản phẩm đầu tiên và duy nhất trên thị trường kết hợp cả 3 trong 1 vô cùng tiện lợi (Trà quế - Cam - Mật ong).',240000,2,'Hộp',1),(41,'Trà Nụ Vối','Trà nụ vối từ lâu đã được nhiều thế hệ dùng để nấu nước uống hằng ngày. Hãm trà uống hằng ngày có thể thay thế trà xanh, giúp ngon miệng hơn trong bữa cơm hằng ngày. Thời gian gần đây, trà nụ vối ngày càng được nhiều người biết đến với những công dụng dành cho sức khỏe và hỗ trợ trị bệnh thần kỳ. ',140000,2,'Gói 500g',1);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id_role` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(45) NOT NULL,
  PRIMARY KEY (`id_role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

/*!40000 ALTER TABLE `role` DISABLE KEYS */;
/*!40000 ALTER TABLE `role` ENABLE KEYS */;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status` (
  `id_status` int(11) NOT NULL AUTO_INCREMENT,
  `status_name` varchar(45) DEFAULT NULL,
  `status_nameVie` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_status`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES (1,'enable','kích hoạt'),(2,'disable','vô hiệu'),(3,'pending','đang chờ'),(4,'processing','đang xử lí'),(5,'shipping','đang vận chuyển'),(6,'complete','hoàn thành');
/*!40000 ALTER TABLE `status` ENABLE KEYS */;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`id_user`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id_role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-12 14:35:44
