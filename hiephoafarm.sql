-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 28, 2022 at 11:57 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hiephoafarm`
--

-- --------------------------------------------------------

--
-- Table structure for table `ads`
--

CREATE TABLE `ads` (
  `id_ads` int(11) NOT NULL,
  `adsname` varchar(45) NOT NULL,
  `adscontent` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id_category` int(11) NOT NULL,
  `category_name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id_category`, `category_name`) VALUES
(1, 'Trái cây'),
(2, 'Đặc sản mùa tết nguyên đán'),
(6, 'Test lần cuối roy đi ngủ. test ets');

-- --------------------------------------------------------

--
-- Table structure for table `gallery`
--

CREATE TABLE `gallery` (
  `id_gallery` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `photo` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `gallery`
--

INSERT INTO `gallery` (`id_gallery`, `product_id`, `photo`) VALUES
(1, 16, 'under_bullet.jpg'),
(2, 16, 'tools.jpg'),
(3, 16, 'avatar.jpg'),
(4, 16, 'thumb.jpg'),
(5, 17, 'cute_cats.jpg'),
(6, 17, 'under_bullet.jpg'),
(7, 17, 'avatar.jpg'),
(14, 4, 'avatar-01.jpg'),
(15, 4, 'tym.png'),
(16, 4, 'tymmethuy.png'),
(21, 7, 'gift.jpg'),
(22, 6, 'under_bullet.jpg'),
(23, 6, 'tools.jpg'),
(24, 6, 'avatar.jpg'),
(25, 7, 'avatar.jpg'),
(28, 3, 'tym.png'),
(29, 3, 'tymmethuy.png'),
(30, 3, 'tymbechang.png'),
(31, 3, 'thumb2.jpg'),
(32, 8, 'cute_cats.jpg'),
(35, 23, 'gift.jpg'),
(36, 25, 'avatar.jpg'),
(37, 25, 'thumb.jpg'),
(38, 25, 'Screenshot from 2021-12-17 21-54-19.png'),
(43, 31, 'gift.jpg'),
(44, 31, 'under_bullet.jpg'),
(45, 31, 'tools.jpg'),
(46, 32, 'avatar-01.jpg'),
(47, 29, 'under_bullet.jpg'),
(48, 29, 'tools.jpg'),
(49, 29, 'avatar.jpg'),
(50, 29, 'thumb.jpg'),
(51, 1, 'bo.jpg'),
(52, 1, 'bo2.jpg'),
(53, 1, 'bỏ.jpg'),
(54, 1, 'bo4.jpg'),
(55, 2, 'cute_cats.jpg'),
(56, 2, 'gift.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id_order` int(11) NOT NULL,
  `customer_phone` varchar(10) NOT NULL,
  `customer_name` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL,
  `shipping_fee` int(11) NOT NULL,
  `order_amouth` int(11) NOT NULL,
  `created_time` date NOT NULL,
  `user_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE `order_detail` (
  `Id_order_detail` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id_product` int(11) NOT NULL,
  `product_name` varchar(150) NOT NULL,
  `description` longtext NOT NULL,
  `product_price` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `sale_unit` varchar(45) DEFAULT 'KG',
  `status_id` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id_product`, `product_name`, `description`, `product_price`, `category_id`, `sale_unit`, `status_id`) VALUES
(1, 'sdfsdfssd', 'sdvsdvsdsdvsdv', 11111111, 6, 'KG', 1),
(2, 'YEPPPPP', 'Tuyệt vời ông mặt trời', 33333333, 2, 'KG', 1),
(3, 'Sản phẩm  mới', 'Ây da da', 100000, 2, 'KG', 2),
(4, 'Sản phẩm 1', 'Tuyệt vời', 1111111, 1, 'KG', 1),
(6, 'Sản phẩm 2', 'ýess', 1111111, 2, 'KG', 1),
(7, 'Sản phẩm 1', 'sdvsdv', 123123, 2, 'KG', 1),
(8, 'Sản phẩm mới', 'yessssssssssss', 123123, 2, 'KG', 1),
(9, 'Sản phẩm 1', 'Yêp', 123123, 1, 'Kg', 1),
(10, 'Sản phẩm mới', 'sdsdvsdvsdv', 0, 2, 'KG', 1),
(11, 'Sản phẩm 1', 'sdcsdc', 123123, 1, 'Kg', 1),
(12, 'Sản phẩm mới', 'sgdfdfb', 123123, 6, 'Kg', 1),
(14, 'Sản phẩm mới', 'ádvsdvsdvsdv', 123123, 2, 'Kg', 1),
(15, 'Sản phẩm 1', 'sdvsdvsdv', 1111111, 2, 'Kg', 1),
(16, 'Sản phẩm mới', 'asasdasdasd', 123123, 2, 'Kg', 1),
(17, 'Sản phẩm 1', 'asdasd', 1111111, 2, 'Kg', 1),
(19, 'Sản phẩm 1', 'ácascác', 3232323, 1, 'Kg', 1),
(20, 'fgbfgb', 'fgbfgb', 11111, 1, 'fgbfgb', 1),
(21, 'Sản phẩm 1', 'sdvsdv', 123123, 1, 'Kg', 1),
(22, 'Sản phẩm 1', 'scsdc', 1111, 2, 'Kg', 1),
(23, 'Sản phẩm mới', 'sssss', 123123, 1, 'Kg', 1),
(24, 'Sản phẩm 1', 'ÁCÁC', 11, 6, 'Kg', 1),
(25, 'Sản phẩm 1', 'SDDV', 33333333, 1, 'Kg', 1),
(26, 'Sản phẩm 1', 'SSSSS', 3232323, 1, 'KG', 1),
(27, 'fgbfgb', 'SSSS', 123123, 2, 'Kg', 1),
(28, 'Sản phẩm mới', 'mmmmm', 123123, 1, 'Kg', 1),
(29, 'Sản phẩm 1', 'gggggg', 123123, 1, 'Kg', 1),
(30, 'Sản phẩm 1', 'aâaaagggg', 123123, 6, 'Kg', 1),
(31, 'YEPPPPP', 'aaaaa', 123123, 2, 'Kg', 1),
(32, 'Sản phẩm 1', 'dsfsf', 3, 2, 'KG', 1);

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id_role` int(11) NOT NULL,
  `role_name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `id_status` int(11) NOT NULL,
  `status_name` varchar(45) DEFAULT NULL,
  `status_nameVie` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`id_status`, `status_name`, `status_nameVie`) VALUES
(1, 'enable', 'kích hoạt'),
(2, 'disable', 'vô hiệu'),
(3, 'pending', 'đang chờ'),
(4, 'prosesing', 'đang xử lí');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ads`
--
ALTER TABLE `ads`
  ADD PRIMARY KEY (`id_ads`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id_category`);

--
-- Indexes for table `gallery`
--
ALTER TABLE `gallery`
  ADD PRIMARY KEY (`id_gallery`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id_order`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `status_id` (`status_id`);

--
-- Indexes for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`Id_order_detail`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id_product`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `status_id` (`status_id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id_role`);

--
-- Indexes for table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id_status`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id_category` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `gallery`
--
ALTER TABLE `gallery`
  MODIFY `id_gallery` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id_order` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `Id_order_detail` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id_product` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id_role` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `status`
--
ALTER TABLE `status`
  MODIFY `id_status` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `gallery`
--
ALTER TABLE `gallery`
  ADD CONSTRAINT `gallery_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id_product`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id_user`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `status` (`id_status`);

--
-- Constraints for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD CONSTRAINT `order_detail_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id_product`),
  ADD CONSTRAINT `order_detail_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id_order`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id_category`),
  ADD CONSTRAINT `product_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `status` (`id_status`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id_role`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
