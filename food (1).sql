-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3307
-- Generation Time: Aug 16, 2024 at 02:40 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `food`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`email`, `password`) VALUES
('pyaephyothaw10107@gmail.com', 'Pyae2004#');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `total_price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `categoryName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `categoryName`) VALUES
(2, 'Appetizer'),
(3, 'Dessert'),
(4, 'Drinks'),
(1, 'Main_Course');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(255) NOT NULL,
  `customer_email` varchar(255) NOT NULL,
  `customer_password` varchar(255) NOT NULL,
  `customer_phone` varchar(20) NOT NULL,
  `customer_address` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `customer_name`, `customer_email`, `customer_password`, `customer_phone`, `customer_address`) VALUES
(1, 'Pyae Phyo Thaw', 'pyaephyothaw10107@gmail.com', '$2y$10$zbB/7.0knSgzBdLnnNINmeJIelODQ3mO2Dq3KWpNPoEyOQDSDsESO', '09794456571', 'Yangon'),
(10, 'Gabriella', 'gabriella10107@gmail.com', '$2y$10$0rNn2TRhj0V5cXvx30uqL.LZIepHvKYAMRx.Ns2wAiLUpbd2DRf2e', '09794456571', 'Yangon');

-- --------------------------------------------------------

--
-- Table structure for table `customer_product`
--

CREATE TABLE `customer_product` (
  `customer_order_id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `active_product` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer_product`
--

INSERT INTO `customer_product` (`customer_order_id`, `quantity`, `product_id`, `order_id`, `active_product`) VALUES
(25, 1, 16, 22, 0),
(26, 6, 11, 22, 0),
(28, 1, 16, 24, 0),
(29, 5, 16, 25, 0),
(30, 1, 16, 26, 1),
(31, 1, 16, 27, 1),
(32, 20, 16, 28, 1),
(63, 10, 11, 49, 0),
(64, 1, 11, 50, 0);

-- --------------------------------------------------------

--
-- Table structure for table `customer_rating`
--

CREATE TABLE `customer_rating` (
  `rating_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL CHECK (`rating` between 1 and 5),
  `review` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer_rating`
--

INSERT INTO `customer_rating` (`rating_id`, `order_id`, `product_id`, `customer_id`, `rating`, `review`, `created_at`) VALUES
(1, 10, 7, 1, 5, '', '2024-08-02 19:19:45'),
(2, 10, 7, 1, 5, 'GG', '2024-08-02 19:19:49'),
(3, 11, 8, 1, 3, 'Pretty:)', '2024-08-02 19:27:21'),
(4, 11, 8, 1, 3, 'ကောင်းပါတယ်', '2024-08-03 01:03:29'),
(5, 11, 8, 1, 3, 'ကောင်းပါတယ်', '2024-08-03 02:01:45'),
(6, 11, 8, 1, 3, 'ကောင်းပါတယ်', '2024-08-03 02:02:00'),
(7, 11, 8, 1, 2, 'rre', '2024-08-03 02:02:18'),
(8, 11, 8, 1, 2, 'rre', '2024-08-03 02:03:23'),
(9, 11, 8, 1, 1, 'RE', '2024-08-03 02:03:27'),
(10, 11, 8, 1, 1, 'ww', '2024-08-03 02:03:52'),
(11, 12, 16, 1, 3, 'GOod', '2024-08-03 03:10:04'),
(12, 12, 16, 1, 1, 'FF', '2024-08-03 03:16:37'),
(13, 27, 9, 1, 1, 'heheheh', '2024-08-07 15:29:16'),
(14, 35, 11, 2, 5, 'So Delicious', '2024-08-12 19:50:57');

-- --------------------------------------------------------

--
-- Table structure for table `discount`
--

CREATE TABLE `discount` (
  `discount_id` int(11) NOT NULL,
  `discount_amount` decimal(10,2) DEFAULT NULL,
  `discount_percentage` decimal(5,2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `discount`
--

INSERT INTO `discount` (`discount_id`, `discount_amount`, `discount_percentage`, `created_at`) VALUES
(3, 20000.00, 20.00, '2024-08-12 05:59:17');

-- --------------------------------------------------------

--
-- Table structure for table `menu_item`
--

CREATE TABLE `menu_item` (
  `menu_id` int(11) NOT NULL,
  `menu_name` varchar(255) NOT NULL,
  `menu_des` text DEFAULT NULL,
  `menu_photo` varchar(255) DEFAULT NULL,
  `menu_status` enum('active','inactive') DEFAULT 'active',
  `category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menu_item`
--

INSERT INTO `menu_item` (`menu_id`, `menu_name`, `menu_des`, `menu_photo`, `menu_status`, `category_id`) VALUES
(14, 'Rice', 'GG', 'main_course.png', 'active', 1),
(15, 'Fried , Grilli, Toast', 'GG', 'appetizer.jpg', 'active', 2),
(16, 'Snacks & Dessert', 'Good', 'gg.jpg', 'active', 3),
(17, 'Juice, Smoothy, Cold', 'GG', 'drink.png', 'active', 4),
(18, 'For Child', 'gg', '1.png', 'active', 1);

-- --------------------------------------------------------

--
-- Table structure for table `order_customer`
--

CREATE TABLE `order_customer` (
  `order_id` int(11) NOT NULL,
  `order_token` varchar(255) DEFAULT NULL,
  `total_price` decimal(10,2) DEFAULT NULL,
  `order_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `active` tinyint(1) DEFAULT 1,
  `discount_id` int(11) DEFAULT NULL,
  `discount_price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_customer`
--

INSERT INTO `order_customer` (`order_id`, `order_token`, `total_price`, `order_date`, `end_date`, `customer_id`, `active`, `discount_id`, `discount_price`) VALUES
(22, '131438205250', 18000.00, '2024-08-12 11:32:54', '2024-08-16 11:18:58', 1, 0, NULL, NULL),
(24, '155449443089', 1200.00, '2024-08-12 11:34:23', '2024-08-16 11:19:31', 1, 0, NULL, NULL),
(25, '466580233025', 6000.00, '2024-08-12 12:10:20', '2024-08-16 11:27:21', 1, 0, NULL, NULL),
(26, '191553711095', 1200.00, '2024-08-12 12:14:26', '2024-08-19 07:44:26', 1, 1, NULL, 1200.00),
(27, '199585265809', 1200.00, '2024-08-12 12:16:59', '2024-08-19 07:46:59', 1, 1, NULL, NULL),
(28, '721718119093', 24000.00, '2024-08-12 12:17:33', '2024-08-19 07:47:33', 1, 1, NULL, 21600.00),
(49, '904882280376', 28000.00, '2024-08-16 12:13:27', '2024-08-16 12:13:50', 10, 0, 3, 22400.00),
(50, '543859881750', 2800.00, '2024-08-16 12:14:17', '2024-08-16 12:14:25', 10, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `package`
--

CREATE TABLE `package` (
  `package_id` int(6) UNSIGNED NOT NULL,
  `package_name` varchar(255) NOT NULL,
  `package_des` text NOT NULL,
  `package_photo` varchar(255) NOT NULL,
  `reg_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `package`
--

INSERT INTO `package` (`package_id`, `package_name`, `package_des`, `package_photo`, `reg_date`) VALUES
(4, 'Rice & Curry', 'GG', '../dashboard/upload_package/Tofu_curry.jpg', '2024-08-02 15:54:58'),
(5, 'Juice & Drinks', 'GG', '../dashboard/upload_package/farluda.jpg', '2024-08-03 02:32:36'),
(6, 'Dessert ', 'GG', '../dashboard/upload_package/snack_&_dessert.jpg', '2024-08-03 02:44:47');

-- --------------------------------------------------------

--
-- Table structure for table `package_product`
--

CREATE TABLE `package_product` (
  `package_product_id` int(6) UNSIGNED NOT NULL,
  `menu_id` int(6) NOT NULL,
  `product_id` int(6) NOT NULL,
  `package_id` int(6) UNSIGNED NOT NULL,
  `status` enum('active','inactive') DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `package_product`
--

INSERT INTO `package_product` (`package_product_id`, `menu_id`, `product_id`, `package_id`, `status`) VALUES
(16, 15, 8, 4, 'active'),
(17, 14, 7, 4, 'active'),
(19, 15, 15, 4, 'active'),
(20, 15, 16, 4, 'active'),
(21, 14, 13, 4, 'active'),
(22, 17, 11, 5, 'active'),
(23, 17, 20, 5, 'active'),
(24, 17, 21, 5, 'active'),
(25, 16, 9, 6, 'active'),
(26, 16, 17, 6, 'active'),
(27, 16, 18, 6, 'active');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_des` text DEFAULT NULL,
  `product_price` decimal(10,2) NOT NULL,
  `menu_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `average_rating` decimal(3,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `product_name`, `product_des`, `product_price`, `menu_id`, `category_id`, `average_rating`) VALUES
(7, 'Fried Rice', 'spicy ', 1200.00, 14, 1, 5.00),
(8, 'Fried Tofu', 'Delicious and Hott', 900.00, 15, 2, 2.25),
(9, 'Puddin', 'Sweet', 700.00, 16, 3, 1.00),
(11, 'Farluda', 'drink', 3500.00, 17, 4, 5.00),
(13, 'Chinese_Fried_Rice', 'spicy ', 2000.00, 14, 1, NULL),
(15, 'Buu_Fried', 'good', 300.00, 15, 2, NULL),
(16, 'Fried Shrimp', 'Neatly', 1200.00, 15, 2, 2.00),
(17, 'Semolina', 'Pretty Good', 400.00, 16, 3, NULL),
(18, 'Cocount Milk jelly', 'good', 600.00, 16, 3, NULL),
(20, 'Sugar_Cane', 'good', 1200.00, 17, 4, NULL),
(21, 'Yogurt', 'Healthy', 2400.00, 17, 4, NULL),
(22, 'Malay_Fried_Rice', 'spicy ', 2000.00, 14, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_photo`
--

CREATE TABLE `product_photo` (
  `photo_id` int(11) NOT NULL,
  `photo_name` varchar(255) NOT NULL,
  `photo_des` text DEFAULT NULL,
  `photo_path` varchar(255) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_photo`
--

INSERT INTO `product_photo` (`photo_id`, `photo_name`, `photo_des`, `photo_path`, `product_id`) VALUES
(7, 'fried_rice.jpg', 'myanmar food', '../dashboard/product_img/fried_rice.jpg', 7),
(8, 'fried_tofu.jpg', 'Shan Food', '../dashboard/product_img/fried_tofu.jpg', 8),
(9, '33 Impossibly Satisfying Food Photos.jfif', 'Homemade', '../dashboard/product_img/33 Impossibly Satisfying Food Photos.jfif', 9),
(11, 'farluda.jpg', 'good', '../dashboard/product_img/farluda.jpg', 11),
(13, 'china_fried_rice.jpg', 'China', '../dashboard/product_img/china_fried_rice.jpg', 13),
(15, 'buu_fruit.jpg', 'myanmar food', '../dashboard/product_img/buu_fruit.jpg', 15),
(16, 'shrimp_fried.jpg', 'myanmar food', '../dashboard/product_img/shrimp_fried.jpg', 16),
(17, 'semolina.jpg', 'myanmar food', '../dashboard/product_img/semolina.jpg', 17),
(18, 'argar.jpg', 'myanmar food', '../dashboard/product_img/argar.jpg', 18),
(20, 'sugar_can.jpg', 'myanmar food', '../dashboard/product_img/sugar_can.jpg', 20),
(21, 'yogurt.jpg', 'good', '../dashboard/product_img/yogurt.jpg', 21),
(22, 'malay.jpg', 'Malay', '../dashboard/product_img/malay.jpg', 22);

-- --------------------------------------------------------

--
-- Table structure for table `promotion`
--

CREATE TABLE `promotion` (
  `promotion_id` int(6) UNSIGNED NOT NULL,
  `promotion_percent` decimal(5,2) NOT NULL,
  `product_id` int(6) NOT NULL,
  `menu_id` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `promotion`
--

INSERT INTO `promotion` (`promotion_id`, `promotion_percent`, `product_id`, `menu_id`) VALUES
(18, 20.00, 11, 17),
(20, 9.00, 9, 16),
(21, 20.00, 13, 14);

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `review_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `review_comment` text NOT NULL,
  `rating` int(11) DEFAULT NULL CHECK (`rating` >= 1 and `rating` <= 5)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `review`
--

INSERT INTO `review` (`review_id`, `customer_id`, `review_comment`, `rating`) VALUES
(1, 1, 'fwdfw', 2),
(2, 1, 'GG', 3),
(3, 1, 'aa', 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`),
  ADD UNIQUE KEY `categoryName` (`categoryName`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`),
  ADD UNIQUE KEY `customer_email` (`customer_email`);

--
-- Indexes for table `customer_product`
--
ALTER TABLE `customer_product`
  ADD PRIMARY KEY (`customer_order_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `customer_rating`
--
ALTER TABLE `customer_rating`
  ADD PRIMARY KEY (`rating_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `discount`
--
ALTER TABLE `discount`
  ADD PRIMARY KEY (`discount_id`);

--
-- Indexes for table `menu_item`
--
ALTER TABLE `menu_item`
  ADD PRIMARY KEY (`menu_id`),
  ADD KEY `fk_category` (`category_id`);

--
-- Indexes for table `order_customer`
--
ALTER TABLE `order_customer`
  ADD PRIMARY KEY (`order_id`),
  ADD UNIQUE KEY `order_token` (`order_token`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `fk_discount_id` (`discount_id`);

--
-- Indexes for table `package`
--
ALTER TABLE `package`
  ADD PRIMARY KEY (`package_id`);

--
-- Indexes for table `package_product`
--
ALTER TABLE `package_product`
  ADD PRIMARY KEY (`package_product_id`),
  ADD KEY `menu_id` (`menu_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `package_id` (`package_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `menu_id` (`menu_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `product_photo`
--
ALTER TABLE `product_photo`
  ADD PRIMARY KEY (`photo_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `promotion`
--
ALTER TABLE `promotion`
  ADD PRIMARY KEY (`promotion_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `menu_id` (`menu_id`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `customer_product`
--
ALTER TABLE `customer_product`
  MODIFY `customer_order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `customer_rating`
--
ALTER TABLE `customer_rating`
  MODIFY `rating_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `discount`
--
ALTER TABLE `discount`
  MODIFY `discount_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `menu_item`
--
ALTER TABLE `menu_item`
  MODIFY `menu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `order_customer`
--
ALTER TABLE `order_customer`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `package`
--
ALTER TABLE `package`
  MODIFY `package_id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `package_product`
--
ALTER TABLE `package_product`
  MODIFY `package_product_id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `product_photo`
--
ALTER TABLE `product_photo`
  MODIFY `photo_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `promotion`
--
ALTER TABLE `promotion`
  MODIFY `promotion_id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE;

--
-- Constraints for table `customer_product`
--
ALTER TABLE `customer_product`
  ADD CONSTRAINT `customer_product_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `customer_product_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `order_customer` (`order_id`) ON DELETE CASCADE;

--
-- Constraints for table `menu_item`
--
ALTER TABLE `menu_item`
  ADD CONSTRAINT `fk_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON DELETE CASCADE;

--
-- Constraints for table `order_customer`
--
ALTER TABLE `order_customer`
  ADD CONSTRAINT `fk_discount_id` FOREIGN KEY (`discount_id`) REFERENCES `discount` (`discount_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `order_customer_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE CASCADE;

--
-- Constraints for table `package_product`
--
ALTER TABLE `package_product`
  ADD CONSTRAINT `package_product_ibfk_1` FOREIGN KEY (`menu_id`) REFERENCES `menu_item` (`menu_id`),
  ADD CONSTRAINT `package_product_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`),
  ADD CONSTRAINT `package_product_ibfk_3` FOREIGN KEY (`package_id`) REFERENCES `package` (`package_id`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`menu_id`) REFERENCES `menu_item` (`menu_id`),
  ADD CONSTRAINT `product_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`);

--
-- Constraints for table `product_photo`
--
ALTER TABLE `product_photo`
  ADD CONSTRAINT `product_photo_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`);

--
-- Constraints for table `promotion`
--
ALTER TABLE `promotion`
  ADD CONSTRAINT `promotion_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`),
  ADD CONSTRAINT `promotion_ibfk_2` FOREIGN KEY (`menu_id`) REFERENCES `menu_item` (`menu_id`);

--
-- Constraints for table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `review_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
