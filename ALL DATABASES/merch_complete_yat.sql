-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 26, 2024 at 10:44 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shop_project`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `admin_id` int(11) NOT NULL,
  `admin_name` text NOT NULL,
  `admin_email` text NOT NULL,
  `admin_password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`admin_id`, `admin_name`, `admin_email`, `admin_password`) VALUES
(1, 'Christian Earl Tapit', 'christianearl.tapit@gmail.com', '888b0c8c031de7831a9b598ac78c35e6'),
(2, 'Kim Jensen Yebes', 'kimjensen.admin@gmail.com', '888b0c8c031de7831a9b598ac78c35e6');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `order_cost` decimal(6,2) NOT NULL,
  `order_status` varchar(100) NOT NULL DEFAULT 'on_hold',
  `user_id` int(11) NOT NULL,
  `user_phone` int(11) NOT NULL,
  `user_city` varchar(255) NOT NULL,
  `user_address` varchar(255) NOT NULL,
  `order_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `order_cost`, `order_status`, `user_id`, `user_phone`, `user_city`, `user_address`, `order_date`) VALUES
(1, 250.00, 'delivered', 1, 2147483647, 'Taguig City', 'Block 63 Lot 52 Upper Bicutan Taguig City', '2024-11-26 10:36:54'),
(2, 170.00, 'delivered', 1, 2147483647, 'Taguig City', 'Block 63 Lot 52 Upper Bicutan Taguig City', '2024-11-26 10:37:06'),
(3, 160.00, 'in_transit', 2, 2147483647, 'Taguig City', 'Block 1 Lot 2 White House Manila', '2024-11-26 10:37:42'),
(4, 444.00, 'delivered', 3, 2147483647, 'Taguig City', 'Block 1 Lot 2 White House Manila', '2024-11-26 10:38:27'),
(5, 165.00, 'canceled', 3, 2147483647, 'Taguig City', 'Block 63 Lot 52 Upper Bicutan Taguig City', '2024-11-26 10:38:38'),
(6, 155.00, 'in_transit', 4, 2147483647, 'Taguig City', 'Block 63 Lot 52 Upper Bicutan Taguig City', '2024-11-26 10:39:43'),
(7, 200.00, 'in_transit', 1, 2147483647, 'Taguig City', 'Block 63 Lot 52 Upper Bicutan Taguig City', '2024-11-26 10:40:57'),
(8, 200.00, 'delivered', 4, 2147483647, 'Taguig City', 'Block 63 Lot 52 Upper Bicutan Taguig City', '2024-11-26 10:41:31'),
(9, 444.00, 'in_transit', 2, 2147483647, 'Taguig City', 'Block 63 Lot 52 Upper Bicutan Taguig City', '2024-11-26 10:42:31');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `item_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` varchar(255) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_image` varchar(255) NOT NULL,
  `product_price` decimal(6,2) NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`item_id`, `order_id`, `product_id`, `product_name`, `product_image`, `product_price`, `product_quantity`, `user_id`, `order_date`) VALUES
(1, 1, '30', 'Suisei\'s Spectre Vinyl', 'vinyl1.jpg', 250.00, 1, 1, '2024-11-26 10:36:54'),
(2, 2, '9', '2B - Nier Automata', 'game1.jpg', 170.00, 1, 1, '2024-11-26 10:37:06'),
(3, 3, '11', 'Sora - Kingdom Hearts', 'game3.jpg', 160.00, 1, 2, '2024-11-26 10:37:42'),
(4, 4, '31', 'Mori Calliope Jigoku 6 LP', 'MORI_0013-JIGOKU-6-LP_SIDE_A_MOCK.png', 444.00, 1, 3, '2024-11-26 10:38:27'),
(5, 5, '12', 'Tifa - Final Fantasy', 'game4.jpg', 165.00, 1, 3, '2024-11-26 10:38:38'),
(6, 6, '4', 'Fuwa Acrylic stand', 'fuwastand.jpg', 155.00, 1, 4, '2024-11-26 10:39:43'),
(7, 7, '1', 'SuiSei Acrylic stand', 'suiseistand.jpg', 200.00, 1, 1, '2024-11-26 10:40:57'),
(8, 8, '1', 'SuiSei Acrylic stand', 'suiseistand.jpg', 200.00, 1, 4, '2024-11-26 10:41:31'),
(9, 9, '31', 'Mori Calliope Jigoku 6 LP', 'MORI_0013-JIGOKU-6-LP_SIDE_A_MOCK.png', 444.00, 1, 2, '2024-11-26 10:42:31');

-- --------------------------------------------------------

--
-- Stand-in structure for view `order_transaction_summary`
-- (See below for the actual view)
--
CREATE TABLE `order_transaction_summary` (
`order_id` int(11)
,`order_cost` decimal(6,2)
,`order_status` varchar(100)
,`order_date` datetime
,`user_name` varchar(108)
,`total_items` bigint(21)
,`product_names` mediumtext
);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `product_category` varchar(108) NOT NULL,
  `product_description` varchar(255) NOT NULL,
  `product_image` varchar(255) NOT NULL,
  `product_image2` varchar(255) DEFAULT NULL,
  `product_image3` varchar(255) DEFAULT NULL,
  `product_image4` varchar(255) DEFAULT NULL,
  `product_price` decimal(6,2) NOT NULL,
  `product_special_offer` int(2) DEFAULT NULL,
  `product_color` varchar(108) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `product_category`, `product_description`, `product_image`, `product_image2`, `product_image3`, `product_image4`, `product_price`, `product_special_offer`, `product_color`) VALUES
(1, 'SuiSei Acrylic stand', 'acrylic stand', 'very cute acryclic stand', 'suiseistand.jpg', 'suiseistand.jpg', 'suiseistand.jpg', 'suiseistand.jpg', 200.00, 0, 'blue'),
(2, 'Ina Acrylic stand', 'acrylic stand', 'very cute acryclic stand', 'inastand.jpg', 'inastand.jpg', 'inastand.jpg', 'inastand.jpg', 155.00, 0, 'violet'),
(3, 'Towa stand', 'acrylic stand', 'very cute acryclic stand', 'towastand.jpg', 'towastand.jpg', 'towastand.jpg', 'towastand.jpg', 155.00, 0, 'purple'),
(4, 'Fuwa Acrylic stand', 'acrylic stand', 'very cute acryclic stand', 'fuwastand.jpg', 'fuwastand.jpg', 'fuwastand.jpg', 'fuwastand.jpg', 155.00, 0, 'pink'),
(5, 'Lamy Plushie', 'plushies', 'Cute Lamy Plushie', 'Plushie1.jpg', 'Plushie1.jpg', 'Plushie1.jpg', 'Plushie1.jpg', 99.00, 0, 'Sky Blue'),
(6, 'Ao Plushie', 'plushies', 'Cute Ao Plushie', 'Plushie2.jpg', 'Plushie2.jpg', 'Plushie2.jpg', 'Plushie2.jpg', 99.00, 0, 'Grey And Blue'),
(7, 'Shiori Plushie', 'plushies', 'Cute Shiori Plushie', 'Plushie3.jpg', 'Plushie3.jpg', 'Plushie3.jpg', 'Plushie3.jpg', 99.00, 0, 'Dark Purple and White'),
(8, 'Raden Plushie', 'plushies', 'Cute Raden Plushie', 'Plushie4.jpg', 'Plushie4.jpg', 'Plushie4.jpg', 'Plushie4.jpg', 99.00, 0, 'Peach and Dark Grey'),
(9, '2B - Nier Automata', 'games', '2B FROM NIER AUTOMATA', 'game1.jpg', 'game1.jpg', 'game1.jpg', 'game1.jpg', 170.00, 0, 'Black and Grey'),
(10, 'Sepiroth - Final Fantasy', 'games', 'Sepiroth from Final Fantasy', 'game2.jpg', 'game2.jpg', 'game2.jpg', 'game2.jpg', 160.00, 0, 'Dark and Grey'),
(11, 'Sora - Kingdom Hearts', 'games', 'Sora from Kingdom Hearts', 'game3.jpg', 'game3.jpg', 'game3.jpg', 'game3.jpg', 160.00, 0, 'Blue and White'),
(12, 'Tifa - Final Fantasy', 'games', 'Tifa from Final Fantasy', 'game4.jpg', 'game4.jpg', 'game4.jpg', 'game4.jpg', 165.00, NULL, 'Red and White'),
(13, 'Suisei - Tapestry', 'tapestry', 'Suisei\'s Tapestry', 'tapestry1.jpg', 'tapestry1.jpg', 'tapestry1.jpg', 'tapestry1.jpg', 250.00, 0, 'Rouge and Blue'),
(14, 'Hololive Gen 3 - Tapestry', 'tapestry', 'Hololive Gen 3\'s Lovely Tapestry!', 'tapestry2.jpg', 'tapestry2.jpg', 'tapestry2.jpg', 'tapestry2.jpg', 210.00, 0, 'Grey, Green, Blue, Red, and Peach'),
(15, 'Hololive Gen 1 - Tapestry', 'tapestry', 'Hololive Gen1\'s Lovely Tapestry!', 'tapestry3.jpg', 'tapestry3.jpg', 'tapestry3.jpg', 'tapestry3.jpg', 220.00, 0, 'Peach, White, and Brown'),
(16, 'Hololive Meet Tapestry', 'tapestry', 'Hololive Meet Tapestry - See a variety of different Vtubers across generations!', 'tapestry4.jpg', 'tapestry4.jpg', 'tapestry4.jpg', 'tapestry4.jpg', 230.00, 0, 'Sky Blue, Violet, Lilac, White, and Red'),
(30, 'Suisei\'s Spectre Vinyl', 'Vinyl', 'This is Suisei\'s Vinyl', 'vinyl1.jpg', 'vinyl1.jpg', 'vinyl1.jpg', 'vinyl1.jpg', 250.00, 0, 'Blue and Red'),
(31, 'Mori Calliope Jigoku 6 LP', 'Vinyl', 'Mori Calliope Album Vinyl Record LP', 'MORI_0013-JIGOKU-6-LP_SIDE_A_MOCK.png', 'MORI_0013-JIGOKU-6-LP_SIDE_B_MOCK.png', 'MORI_0013-JIGOKU-6-LP_BOTH-SIDES.png', 'MORI_0013-JIGOKU-6-LP_ALT-COVER_SAMPLE.png', 444.00, 0, 'Black, Red'),
(32, 'Holostar X Fubuki', 'Vinyl', 'Test', 'vinyl2.jpg', 'vinyl2.jpg', 'vinyl2.jpg', 'vinyl2.jpg', 123.00, 0, 'Blue and Red');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `review_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `review_text` text NOT NULL,
  `review_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`review_id`, `product_id`, `user_id`, `review_text`, `review_date`) VALUES
(1, 30, 1, 'I FUCKING LOVE SUISEI!!!!! RAAAAAAAAAAHHH', '2024-11-26 17:40:17'),
(2, 1, 1, 'I EAT, DRINK, AND BREATHE SUISEI!', '2024-11-26 17:41:13'),
(3, 1, 4, 'Personally, I like Fuwa Fuwa more. But OK.', '2024-11-26 17:41:47'),
(4, 31, 2, 'I LOVE YOU CALLLIIIIIIIIIIIIII!!! FUCKKKKK', '2024-11-26 17:42:41');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(108) NOT NULL,
  `user_email` varchar(100) NOT NULL,
  `user_password` varchar(100) NOT NULL,
  `user_profile` varchar(255) NOT NULL,
  `user_status` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_name`, `user_email`, `user_password`, `user_profile`, `user_status`) VALUES
(1, 'Kim Jensen Yebes', 'kimjensenyebes@gmail.com', '1fed0ddef1d6cdeffdd468d252ce2ccd', 'profile_1_2024-11-26-10-36-41.jpeg', 1),
(2, 'Christian Earl Tapit', 'christitanearltapit@gmail.com', '1fed0ddef1d6cdeffdd468d252ce2ccd', 'profile_2_2024-11-26-10-37-22.jpg', 1),
(3, 'Suisei Machi Kawaii', 'Suiseikawaii@gmail.com', '1fed0ddef1d6cdeffdd468d252ce2ccd', 'profile_3_2024-11-26-10-38-14.jpg', 1),
(4, 'Average Joe', 'averagejoe@gmail.com', '1fed0ddef1d6cdeffdd468d252ce2ccd', 'profile_4_2024-11-26-10-39-14.jpg', 1);

-- --------------------------------------------------------

--
-- Structure for view `order_transaction_summary`
--
DROP TABLE IF EXISTS `order_transaction_summary`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `order_transaction_summary`  AS SELECT `o`.`order_id` AS `order_id`, `o`.`order_cost` AS `order_cost`, `o`.`order_status` AS `order_status`, `o`.`order_date` AS `order_date`, `u`.`user_name` AS `user_name`, count(`oi`.`item_id`) AS `total_items`, group_concat(`p`.`product_name` separator ', ') AS `product_names` FROM (((`orders` `o` join `users` `u` on(`o`.`user_id` = `u`.`user_id`)) join `order_items` `oi` on(`o`.`order_id` = `oi`.`order_id`)) join `products` `p` on(`oi`.`product_id` = `p`.`product_id`)) GROUP BY `o`.`order_id`, `o`.`order_cost`, `o`.`order_status`, `o`.`order_date`, `u`.`user_name` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`item_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `UX_Constraint` (`user_email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
