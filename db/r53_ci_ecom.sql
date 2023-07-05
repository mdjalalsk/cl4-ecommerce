-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 05, 2023 at 07:37 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `r53_ci_ecom`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(5) UNSIGNED NOT NULL,
  `address1` varchar(128) NOT NULL,
  `address2` varchar(128) NOT NULL,
  `city` varchar(60) NOT NULL,
  `state` varchar(60) NOT NULL,
  `postcode` varchar(60) NOT NULL,
  `country` varchar(60) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(5) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `image` varchar(256) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `image`, `created_at`) VALUES
(1, 'Electronices', 'http://localhost/codeigniter/inventory/public/assets/images/categories/1687369850_90da1577b5bcab8e6c9e.jpeg', '2023-06-21 17:50:50'),
(3, 'Fashion & Style Items', 'http://localhost/codeigniter/inventory/public/assets/images/categories/1687372088_4eaf82c896444d9e946e.jpg', '2023-06-21 18:28:08'),
(4, 'Sports & Outdoors', 'http://localhost/codeigniter/inventory/public/assets/images/categories/1687372121_6584149dbd5ee3d42dc4.jpeg', '2023-06-21 18:28:41'),
(5, 'Health & Beauty', 'http://localhost/codeigniter/inventory/public/assets/images/categories/1687372158_68c477e70b680cac406b.jpeg', '2023-06-21 18:29:18'),
(6, 'TV & Home Appliances', 'http://localhost/codeigniter/inventory/public/assets/images/categories/1687372196_0a29657c9dfb19a228fb.jpeg', '2023-06-21 18:29:56'),
(7, 'Groceries', 'http://localhost/codeigniter/inventory/public/assets/images/categories/1687372250_2306eb476660db5b8415.jpeg', '2023-06-21 18:30:50'),
(8, 'Jewellery', 'http://localhost/codeigniter/inventory/public/assets/images/categories/1687372328_99e8e2bc8dbebceafcac.jpg', '2023-06-21 18:32:08'),
(9, 'Accessories', 'http://localhost/codeigniter/inventory/public/assets/images/categories/1687372424_0a26adaf57ee5f0d6d62.jpeg', '2023-06-21 18:33:44'),
(12, 'Furniture', 'http://localhost/codeigniter/inventory/public/assets/images/categories/1687373510_b8b44cce828bc0990981.jpeg', '2023-06-21 18:51:50'),
(13, 'Men\'s & Boys\' Fashion', 'http://localhost/codeigniter/inventory/public/assets/images/categories/1687374150_4b3e30727b779f5d59b6.jpeg', '2023-06-21 19:02:30'),
(14, 'Women\'s & Girls\' Fashion', 'http://localhost/codeigniter/inventory/public/assets/images/categories/1687374188_d1fbf5ea56de6913921e.jpeg', '2023-06-21 19:03:08');

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id` int(11) UNSIGNED NOT NULL,
  `product_id` int(11) UNSIGNED NOT NULL,
  `name` varchar(256) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`id`, `product_id`, `name`, `created_at`) VALUES
(2, 2, '20230621/1687370135_ed587f6a842721a9f45b.png', '2023-06-21 17:55:35'),
(3, 3, '20230622/1687423549_beda268afe01a66b9ac5.jpg', '2023-06-22 08:45:49'),
(4, 4, '20230622/1687423863_685122819c82fa97c896.webp', '2023-06-22 08:51:03'),
(5, 5, '20230622/1687424063_3a78a98430bbd4144027.jpg', '2023-06-22 08:54:23'),
(6, 6, '20230622/1687433369_7090c959bae1273acbf6.jpg', '2023-06-22 11:29:29'),
(7, 7, '20230622/1687434639_f589dbea98bcbc11187e.jpg', '2023-06-22 11:50:39'),
(8, 8, '20230622/1687434749_82d6748340c5b3499d41.jpg', '2023-06-22 11:52:29'),
(9, 9, '20230622/1687434899_e6a64a69d585c9e85c88.jpg', '2023-06-22 11:54:59'),
(10, 10, '20230622/1687435051_7a0a0e08bbb32c2c9105.jpg', '2023-06-22 11:57:31'),
(11, 11, '20230622/1687436201_a29fba6375db9f2d8790.jpg', '2023-06-22 12:16:41'),
(12, 12, '20230622/1687436337_e5831c1ef1a38678d776.webp', '2023-06-22 12:18:57'),
(13, 13, '20230622/1687436794_86b33b7412f4f49250c1.webp', '2023-06-22 12:26:34'),
(14, 14, '20230622/1687436866_5561441cfbf85fa94c1e.webp', '2023-06-22 12:27:46'),
(15, 15, '20230622/1687437065_e661be65475a92a1b506.jpg', '2023-06-22 12:31:05'),
(16, 16, '20230622/1687437167_a74ad72524190d0edcd1.jpg', '2023-06-22 12:32:47'),
(17, 17, '20230622/1687437242_3b35d85140816e6e7dd7.jpg', '2023-06-22 12:34:02'),
(18, 18, '20230622/1687437298_301726dc954482e6fb94.jpg', '2023-06-22 12:34:58'),
(19, 19, '20230622/1687437458_91246a381f843b78c014.webp', '2023-06-22 12:37:38'),
(20, 20, '20230622/1687437673_a2df3dafa2a5db4e734e.jpeg', '2023-06-22 12:41:13'),
(21, 21, '20230622/1687437734_effcdfef00967a250eff.jpg', '2023-06-22 12:42:14'),
(22, 22, '20230622/1687437831_d475f67201fba434aab9.jpg', '2023-06-22 12:43:51'),
(23, 23, '20230622/1687438113_9956e27387c89c68036a.jpeg', '2023-06-22 12:48:33'),
(24, 24, '20230622/1687438274_6f6944900a0f9f2465a2.jpg', '2023-06-22 12:51:14'),
(25, 25, '20230622/1687438392_77e72a17db8a4a1a5069.jpg', '2023-06-22 12:53:12'),
(26, 26, '20230622/1687438487_41379de571d8f5ce0354.webp', '2023-06-22 12:54:47'),
(27, 27, '20230622/1687438546_b876fab4815ab5f337d8.jpg', '2023-06-22 12:55:46'),
(28, 28, '20230623/1687500558_050f500ee46d247489c7.png', '2023-06-23 06:09:18'),
(29, 29, '20230623/1687500663_ab2d08fbbebdff6544a5.png', '2023-06-23 06:11:03'),
(30, 30, '20230623/1687501734_3e6d88d75eac8bc46548.jpeg', '2023-06-23 06:28:54'),
(31, 31, '20230623/1687502138_510f1ffb46e2437362c6.jpg', '2023-06-23 06:35:38'),
(32, 32, '20230623/1687502307_7dfdfd28ea5595047e6e.jpg', '2023-06-23 06:38:27'),
(33, 33, '20230623/1687502446_7705517781d318ce523f.jpg', '2023-06-23 06:40:46'),
(34, 34, '20230623/1687503146_dc607f9733017799e22e.jpg', '2023-06-23 06:52:26'),
(35, 35, '20230623/1687503263_c4b40fd1d1a420b0a928.jpg', '2023-06-23 06:54:23'),
(36, 36, '20230623/1687503412_0a572705d2e035eec028.jpg', '2023-06-23 06:56:52'),
(37, 37, '20230623/1687503629_a1992104d92f4c877b5c.webp', '2023-06-23 07:00:29'),
(38, 38, '20230623/1687504185_050d06462d951dda2d09.jpg', '2023-06-23 07:09:45'),
(39, 39, '20230623/1687504338_e3b7af0696b3aa5abb3c.jpeg', '2023-06-23 07:12:18'),
(40, 40, '20230624/1687616205_9a4bd04270b0d3719742.jpg', '2023-06-24 14:16:45'),
(41, 41, '20230624/1687616299_a2dc52c32a6c9e9037a6.webp', '2023-06-24 14:18:19'),
(42, 42, '20230624/1687616438_d7863b804f3649fe03c1.jpeg', '2023-06-24 14:20:38'),
(43, 43, '20230624/1687616510_4cadefe2d168dc188df3.jpeg', '2023-06-24 14:21:50'),
(44, 44, '20230624/1687616647_a1c8bd19d48bed5ac890.png', '2023-06-24 14:24:07'),
(45, 45, '20230624/1687616765_0599f16dec0c7a912da1.jpg', '2023-06-24 14:26:05'),
(46, 46, '20230624/1687616870_a7d51107797336466495.webp', '2023-06-24 14:27:50'),
(47, 47, '20230624/1687617018_30ab343a6bbc2cac962e.png', '2023-06-24 14:30:18'),
(49, 49, '20230624/1687617560_e9276716f21f05d718d3.jpg', '2023-06-24 14:39:20'),
(50, 50, '20230624/1687617649_f8c3a0451380952274cd.jpg', '2023-06-24 14:40:49'),
(51, 51, '20230624/1687617860_64e5542ff8a65e0e8c70.jpg', '2023-06-24 14:44:20'),
(52, 52, '20230624/1687617930_67904f55a9f079eca6c0.jpg', '2023-06-24 14:45:30'),
(53, 53, '20230624/1687618018_5c1a8bf62583db69cd4e.jpg', '2023-06-24 14:46:58'),
(54, 54, '20230624/1687618361_58cdb3d77a734283d9af.jpg', '2023-06-24 14:52:41'),
(55, 55, '20230624/1687618423_68a9ed37d6ec7f52b15e.jpg', '2023-06-24 14:53:43'),
(56, 56, '20230624/1687618505_ec6505042b7143380a5a.jpg', '2023-06-24 14:55:05'),
(57, 57, '20230624/1687618846_e6e15f06bfd80911d15f.jpg', '2023-06-24 15:00:46'),
(58, 58, '20230624/1687618898_b1f6eef0b97ae1807ef3.jpg', '2023-06-24 15:01:38'),
(59, 59, '20230624/1687619003_f19d4f7c9a05a216506f.jpeg', '2023-06-24 15:03:23'),
(60, 60, '20230624/1687619076_59cbcc98c753b64305e0.webp', '2023-06-24 15:04:36'),
(61, 61, '20230624/1687619179_92a60313141e7fd4d12a.webp', '2023-06-24 15:06:19'),
(62, 62, '20230624/1687619272_089b97229095b02c23aa.jpg', '2023-06-24 15:07:52'),
(63, 63, '20230624/1687619380_f9f58593cff240d0c561.jpg', '2023-06-24 15:09:40'),
(64, 64, '20230626/1687774225_d6e5cf7d6b48059baa78.jpg', '2023-06-26 10:10:25'),
(65, 65, '20230626/1687774370_25ff2c905d0d9be04826.jpg', '2023-06-26 10:12:50'),
(66, 66, '20230626/1687774456_e3654e77ec576019ba24.jpg', '2023-06-26 10:14:16'),
(67, 67, '20230626/1687774529_ce9e4af7e5aee0afc7cb.jpg', '2023-06-26 10:15:29'),
(68, 68, '20230626/1687775532_3101d50946dfcbce0108.jpg', '2023-06-26 10:32:12'),
(69, 69, '20230626/1687775860_e1182b262b233be8b6da.jpg', '2023-06-26 10:37:40'),
(70, 70, '20230626/1687775923_86ec0b4d387ce96e31b5.jpg', '2023-06-26 10:38:43'),
(71, 71, '20230626/1687775991_6ac5f7c480b22eeca328.jpg', '2023-06-26 10:39:51'),
(72, 72, '20230626/1687776446_8792e1a48bd56331c09d.webp', '2023-06-26 10:47:26'),
(73, 73, '20230626/1687776924_75bf51e0d059d87f2c3e.webp', '2023-06-26 10:55:24'),
(74, 74, '20230626/1687777097_ac9011bf37cc92538760.jpeg', '2023-06-26 10:58:17'),
(75, 75, '20230626/1687777413_5e74aebec5b422a00cf1.jpeg', '2023-06-26 11:03:33'),
(76, 76, '20230626/1687777629_8cf73a6bdaf62ce30f11.jpg', '2023-06-26 11:07:09'),
(78, 78, '20230626/1687778064_46fcdeeffac64ebdfc57.jpg', '2023-06-26 11:14:24'),
(79, 79, '20230626/1687778174_5da2db7ed80932c0ece6.jpg', '2023-06-26 11:16:14'),
(80, 80, '20230626/1687778293_fd91407603e966206465.jpg', '2023-06-26 11:18:13'),
(81, 81, '20230626/1687778376_17a81e570e8e8d8fd30d.jpg', '2023-06-26 11:19:36'),
(82, 82, '20230626/1687778472_b48e0d4cf4444670531f.jpg', '2023-06-26 11:21:12'),
(84, 84, '20230626/1687778937_b27914d2a0bf1b8b087a.jpg', '2023-06-26 11:28:57'),
(85, 85, '20230626/1687782481_d968bd757d2aa4a4271e.jpeg', '2023-06-26 12:28:01'),
(86, 86, '20230626/1687782603_9e3f9082d123d9dd7651.jpeg', '2023-06-26 12:30:03'),
(87, 87, '20230626/1687782700_8d622c13c3588b54ce09.webp', '2023-06-26 12:31:40'),
(88, 88, '20230626/1687782812_04b1e58c0dedb2242e2b.webp', '2023-06-26 12:33:32'),
(89, 89, '20230626/1687783042_b80b84d36adcf94e49bb.webp', '2023-06-26 12:37:23'),
(90, 90, '20230626/1687783314_11c1fb95d95df231be5b.jpg', '2023-06-26 12:41:54'),
(91, 91, '20230626/1687783483_940e73290a03664ec6bc.jpeg', '2023-06-26 12:44:43'),
(92, 92, '20230626/1687783600_2cbcd7f59369990864a8.jpg', '2023-06-26 12:46:40'),
(93, 93, '20230626/1687784016_a057193a3cd1127c5d0f.jpeg', '2023-06-26 12:53:36');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `version` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `group` varchar(255) NOT NULL,
  `namespace` varchar(255) NOT NULL,
  `time` int(11) NOT NULL,
  `batch` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `version`, `class`, `group`, `namespace`, `time`, `batch`) VALUES
(1, '2023-06-05-095826', 'App\\Database\\Migrations\\Users', 'default', 'App', 1687369654, 1),
(2, '2023-06-05-101503', 'App\\Database\\Migrations\\Categories', 'default', 'App', 1687369654, 1),
(3, '2023-06-05-101804', 'App\\Database\\Migrations\\Subcategories', 'default', 'App', 1687369654, 1),
(4, '2023-06-10-094226', 'App\\Database\\Migrations\\Products', 'default', 'App', 1687369654, 1),
(5, '2023-06-10-095351', 'App\\Database\\Migrations\\Images', 'default', 'App', 1687369654, 1),
(6, '2023-06-15-121007', 'App\\Database\\Migrations\\Profile', 'default', 'App', 1687369654, 1),
(7, '2023-06-17-123229', 'App\\Database\\Migrations\\AddImageToCategory', 'default', 'App', 1687369654, 1),
(8, '2023-06-18-114513', 'App\\Database\\Migrations\\CustomerAddressTable', 'default', 'App', 1687369654, 1),
(9, '2023-06-18-114552', 'App\\Database\\Migrations\\OrdersTable', 'default', 'App', 1687369654, 1),
(10, '2023-06-18-114608', 'App\\Database\\Migrations\\OrderItems', 'default', 'App', 1687369654, 1),
(11, '2023-06-18-114621', 'App\\Database\\Migrations\\Payments', 'default', 'App', 1687369654, 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(5) UNSIGNED NOT NULL,
  `address_id` int(5) UNSIGNED NOT NULL,
  `total` float(10,2) NOT NULL,
  `discount` float(10,2) NOT NULL,
  `comment` varchar(128) NOT NULL,
  `status` varchar(60) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) UNSIGNED NOT NULL,
  `order_id` int(11) UNSIGNED NOT NULL,
  `product_id` int(11) UNSIGNED NOT NULL,
  `quantity` int(5) UNSIGNED NOT NULL,
  `price` float(10,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(11) UNSIGNED NOT NULL,
  `order_id` int(11) UNSIGNED NOT NULL,
  `amount` float(10,2) NOT NULL,
  `pmethod` varchar(128) NOT NULL,
  `trxid` varchar(128) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) UNSIGNED NOT NULL,
  `category_id` int(5) UNSIGNED NOT NULL,
  `subcategory_id` int(5) UNSIGNED NOT NULL,
  `name` varchar(256) NOT NULL,
  `description` text NOT NULL,
  `sku` varchar(128) NOT NULL,
  `price` float(10,2) NOT NULL,
  `price2` float(10,2) NOT NULL,
  `quantity` int(5) NOT NULL,
  `discount` int(3) NOT NULL DEFAULT 0,
  `hot` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `subcategory_id`, `name`, `description`, `sku`, `price`, `price2`, `quantity`, `discount`, `hot`, `created_at`) VALUES
(2, 1, 1, 'Rolex ', ' it is very wonderful  watch', 'dfh33', 5566.00, 555.00, 4, 20, 0, '2023-06-21 17:55:35'),
(3, 1, 2, 'Dell', ' fddfgfghfghghg', 'ghghghghj', 1111555.00, 111155.00, 5, 20, 0, '2023-06-22 08:45:49'),
(4, 5, 6, 'Lip Plumper', 'Lipstick is a staple in many beauty bags, and its popularity has boomed over the years. From celebrities to everyday women, lipstick is an essential cosmetic that adds the perfect finishing touch to any look.', 'lips', 300.00, 250.00, 10, 20, 0, '2023-06-22 08:51:03'),
(5, 1, 3, 'Oppo', 'Oppo, Vivo, and OnePlus have already captured a 75 percent market share of the Indian', 'mobiles', 15000.00, 10000.00, 10, 20, 0, '2023-06-22 08:54:23'),
(6, 3, 9, 'Persol', ' sunglasses with colored or tinted lenses that protect the eyes from the glare of sunlight.', 'sun', 599.00, 499.00, 20, 40, 0, '2023-06-22 11:29:29'),
(7, 1, 10, 'A4 Tech', ' A keyboard is for putting information including letters, words and numbers into your computer. ', 'key', 599.00, 499.00, 20, 40, 0, '2023-06-22 11:50:39'),
(8, 1, 11, 'jumpdrive', ' A keyboard is for putting information including letters, words and numbers into your computer. ', 'pdrive', 800.00, 600.00, 10, 40, 0, '2023-06-22 11:52:29'),
(9, 1, 4, 'Bose QuietComfort ', ' Headphones are a pair of small loudspeaker drivers worn on or around the head over a user\'s ears', 'Hphone', 2500.00, 2200.00, 15, 40, 0, '2023-06-22 11:54:59'),
(10, 1, 1, 'Cartier', ' A smartwatch is a wearable computing device that closely resembles a wristwatch or other time-keeping device', 'watch', 2500.00, 2200.00, 15, 40, 0, '2023-06-22 11:57:31'),
(11, 1, 21, 'Mini Lamp', 'A lamp is a small appliance that holds an electric bulb and produces light. Your desk lamp might provide enough light for you to read by at night', 'lamp', 1000.00, 999.00, 10, 30, 0, '2023-06-22 12:16:41'),
(12, 5, 26, 'skin care', 'Skin care is a range of practices that support skin integrity, enhance its appearance, and relieve skin conditions', 'scare', 1000.00, 999.00, 10, 30, 0, '2023-06-22 12:18:57'),
(13, 5, 27, 'Hair Care', 'Hair care is an overall term for hygiene and cosmetology involving the hair which grows from the human scalp, and to a lesser extent facial, pubic and other body hair.', 'Hair', 1500.00, 1200.00, 10, 100, 1, '2023-06-22 12:26:34'),
(14, 5, 28, 'Body Care', 'Body care means how an individual performs applications of dressings and ointments or lotions to their body, trims their toe- nails, and applies lotion to their feet. ', 'body', 1500.00, 1200.00, 10, 100, 1, '2023-06-22 12:27:46'),
(15, 14, 16, 'Hair Iron', 'Hair care is an overall term for hygiene and cosmetology involving the hair which grows from the human scalp, and to a lesser extent facial, pubic and other body Hire.', 'iron', 2000.00, 1500.00, 20, 100, 1, '2023-06-22 12:31:05'),
(16, 14, 24, 'Bag', 'A bag is a kind of soft container. It can hold or carry things. It may be made from cloth, leather, plastic, or paper.', 'bag', 3000.00, 2200.00, 20, 100, 1, '2023-06-22 12:32:47'),
(17, 14, 25, 'baselight', 'A bag is a kind of soft container. It can hold or carry things. It may be made from cloth, leather, plastic, or paper.', 'baselit', 300.00, 250.00, 20, 100, 1, '2023-06-22 12:34:02'),
(18, 14, 29, 'Makeup Tools', 'A bag is a kind of soft container. It can hold or carry things. It may be made from cloth, leather, plastic, or paper.', 'makeup', 500.00, 350.00, 20, 100, 1, '2023-06-22 12:34:58'),
(19, 14, 31, 'Pouch & Case', 'Congenital pouch colon (CPC) is a rare malformation. · Case report: 2-day-old female patient, with no relevant medical history.', 'pouch case', 1000.00, 800.00, 20, 15, 1, '2023-06-22 12:37:38'),
(20, 14, 32, 'Ruby-Stone', 'Congenital pouch colon (CPC) is a rare malformation. · Case report: 2-day-old female patient, with no relevant medical history.', 'stone', 1000.00, 800.00, 20, 25, 1, '2023-06-22 12:41:13'),
(21, 14, 33, 'Ring', 'Congenital pouch colon (CPC) is a rare malformation. · Case report: 2-day-old female patient, with no relevant medical history.', 'ring', 400.00, 350.00, 30, 40, 1, '2023-06-22 12:42:14'),
(22, 13, 23, 'Cap', 'Baseball caps, fedoras, berets, sun hats, etc all have a couple of things in common.', 'cap', 200.00, 180.00, 30, 35, 1, '2023-06-22 12:43:51'),
(23, 13, 22, 'water Bank', 'A watch is a portable timepiece intended to be carried or worn by a person. It is designed to keep a consistent movement despite the motions caused by the person\'s activities', 'wbank', 2000.00, 1300.00, 200, 30, 0, '2023-06-22 12:48:33'),
(24, 13, 12, 'Oakley', 'A watch is a portable timepiece intended to be carried or worn by a person. It is designed to keep a consistent movement despite the motions caused by the person\'s activities', 'oakley', 1500.00, 1300.00, 100, 35, 0, '2023-06-22 12:51:14'),
(25, 12, 14, 'Foldable Table', 'A watch is a portable timepiece intended to be carried or worn by a person. It is designed to keep a consistent movement despite the motions caused by the person\'s activities', 'table', 3000.00, 2200.00, 150, 35, 0, '2023-06-22 12:53:12'),
(26, 12, 15, 'Fancy Figurines Showpiece', 'A watch is a portable timepiece intended to be carried or worn by a person. It is designed to keep a consistent movement despite the motions caused by the person\'s activities', 'showpiece', 4500.00, 4000.00, 14, 40, 0, '2023-06-22 12:54:47'),
(27, 9, 20, 'Laptop Bag', 'A watch is a portable timepiece intended to be carried or worn by a person. It is designed to keep a consistent movement despite the motions caused by the person\'s activities', 'lapbag', 3500.00, 3000.00, 14, 40, 0, '2023-06-22 12:55:46'),
(28, 1, 1, 'Omega', ' Originally conceived as a dressy, water-resistant timepiece, the Omega Seamaster has evolved to a robust sports watch line typically with a stainless steel case, robust water resistance.', 'watchfgfgfgdfgfd', 4999.00, 4000.00, 30, 25, 0, '2023-06-23 06:09:18'),
(29, 1, 1, 'Omega', ' fhsdl dsfhsdjkfhds sfjdkhskljhfs', 'fdgdfgvdfg', 55555.00, 5555.00, 5, 20, 1, '2023-06-23 06:11:03'),
(30, 5, 6, 'lekme ', 'It\'s look like a rose', 'gfgf fgfgfger', 5555.00, 5550.00, 2, 22, 1, '2023-06-23 06:28:54'),
(31, 6, 35, 'Magic-TV', ' Magic Tv is a Movies & TV app that offers a whole catalog in HD with an exellent 5.1 Audio. It offers a lot of content including Live TV.', 'Magic Tv is a Movies ', 20000.00, 18000.00, 40, 25, 0, '2023-06-23 06:35:38'),
(32, 6, 35, 'Jamuna-LED', 'Jamuna LED 32MH01 32\" Television atrue LED TV is one of those giant screens you usually see at outdoor stadiums, at grand prix events and rock venues. They are large screens made up of thousands of extremely bright LED lights. ', 'Jamuna LED 32MH01 32\" Television ', 35000.00, 28000.00, 40, 40, 0, '2023-06-23 06:38:27'),
(33, 6, 35, 'Television-LED', 'Television-LED TV is a type of LCD television that uses light-emitting diodes (LEDs) to backlight the display instead of the cold cathode fluorescent lights (CCFLs) used in standard LCD televisions.', 'Television-LED TV', 25000.00, 20000.00, 35, 35, 0, '2023-06-23 06:40:46'),
(34, 7, 40, 'vegetables-Groceries', ' A more precise definition is \"any plant part consumed for food that is not a fruit or seed, but including mature fruits that are eaten as part of a main meal\"', 'vegetables-Groceries  a main meal', 599.00, 499.00, 30, 10, 0, '2023-06-23 06:52:26'),
(35, 7, 40, 'fruits', 'A fruit is the fleshy or dry ripened ovary of a flowering plant, enclosing the seed or seeds. Apricots, bananas, and grapes, as well as bean pods, corn grains, tomatoes, cucumbers, and (in their shells) acorns and almonds, are all technically fruits.', 'fruits-Groceries  a main meal', 1199.00, 899.00, 30, 50, 0, '2023-06-23 06:54:23'),
(36, 7, 40, 'Groceries-Basket', 'A shopping basket is a basket provided by stores for shoppers to carry around items before purchase.', 'A shopping basket is a carry.', 1000.00, 999.00, 30, 50, 0, '2023-06-23 06:56:52'),
(37, 7, 40, 'Groceries-PepperBag', 'A paper bag is a packaging solution made from the recycled paper. It\'s light and durable, perfect for restaurants or as an additional packing layer for mailer boxes. ', 'A paper bag is a packaging solution made from the recycled paper.', 99.00, 59.00, 30, 50, 0, '2023-06-23 07:00:29'),
(38, 7, 40, 'Groceri-daliy-products', 'A grocery store (AE), grocery shop (BE) or simply grocery is a retail store that primarily retails a general range of food products, which may be fresh.', 'groceri-daliy-products', 99.00, 1200.00, 1000, 50, 0, '2023-06-23 07:09:45'),
(39, 7, 40, 'spices', 'A spice is a seed, fruit, root, bark, or other plant substance primarily used for flavoring or coloring food.', 'A spice is a seed', 1099.00, 499.00, 100, 50, 0, '2023-06-23 07:12:18'),
(40, 1, 3, 'OPPO c55', ' Oppo Reno is a line of camera-focused Android smartphones manufactured by Oppo, with Reno 10x Zoom, and Reno 5G as \"flagships\", and midrange model.', 'oppo', 20000.00, 19000.00, 50, 55, 0, '2023-06-24 14:16:45'),
(41, 1, 3, 'Oppo2023webp', ' Oppo Reno is a line of camera-focused Android smartphones manufactured by Oppo, with Reno 10x Zoom, and Reno 5G as \"flagships\", and midrange model.', 'oppo23', 25000.00, 22000.00, 35, 55, 0, '2023-06-24 14:18:19'),
(42, 1, 3, 'Nokia16', ' Nokia Corporation (natively Nokia Oyj in Finnish and Nokia Abp in Swedish,[5] referred to as Nokia)[a] is a Finnish multinational telecommunications, information technology, and consumer electronics corporation, established in 1865.', 'nokia', 2500.00, 2200.00, 78, 45, 0, '2023-06-24 14:20:38'),
(43, 1, 3, 'nokia105', 'Nokia105 Corporation (natively Nokia Oyj in Finnish and Nokia Abp in Swedish,[5] referred to as Nokia)[a] is a Finnish multinational telecommunications, information technology, and consumer electronics corporation, established in 1865.', 'nokia105', 2800.00, 2500.00, 58, 35, 0, '2023-06-24 14:21:50'),
(44, 1, 3, 'IPhoneRose', 'IPhoneRose is a line of smartphones produced by Apple Inc. that use Apple\'s own iOS mobile operating system. The first-generation iPhone was announced', 'IPhoneRose', 28000.00, 25000.00, 58, 35, 0, '2023-06-24 14:24:07'),
(45, 1, 3, 'realmec55', 'Realme (stylized in realme) (all lowercase) is a Chinese consumer electronics manufacturer based in Shenzhen, Guangdong.', 'realmec55', 11000.00, 9999.00, 34, 20, 0, '2023-06-24 14:26:05'),
(46, 1, 3, 'Realme-11', 'Realme-11', 'Realme-11', 14000.00, 12999.00, 34, 20, 1, '2023-06-24 14:27:50'),
(47, 1, 3, 'iPhonelist', 'List of iPhone models ... \"List of iOS devices\" redirects here. For iPads, see List of iPad models. For Apple TVs, see Apple TV § Models. For Apple Watches.', 'iPhonelist', 30000.00, 25000.00, 34, 20, 1, '2023-06-24 14:30:18'),
(49, 1, 4, 'Beats', 'A Creative Headphone name is an important function of marketing. Check here Creative headphone Brand names ideas for your inspiration.', 'Beats', 3000.00, 2500.00, 34, 20, 0, '2023-06-24 14:39:20'),
(50, 1, 4, 'Apple AirPods', 'Apple AirPods Headphone name is an important function of marketing. Check here Creative headphone Brand names ideas for your inspiration.', 'Apple AirPods', 3000.00, 2800.00, 15, 20, 0, '2023-06-24 14:40:49'),
(51, 1, 11, 'Jump drives', 'A USB flash drive -- also known as a USB stick, USB thumb drive or pen drive -- is a plug-and-play portable storage device that uses flash memory and is lightweight enough to attach to a keychain. A USB flash drive can be used in place of a compact disc.', 'Jump drives', 2000.00, 1500.00, 15, 20, 0, '2023-06-24 14:44:20'),
(52, 1, 11, 'Memory units', 'Memory units a USB flash drive -- also known as a USB stick, USB thumb drive or pen drive is lightweight enough to attach to a keychain. A USB flash drive can be used in place of a compact disc.', 'Memory units', 1800.00, 1500.00, 15, 20, 0, '2023-06-24 14:45:30'),
(53, 1, 11, 'Thumb drives', 'Thumb drives memory units a USB flash drive -- also known as a USB stick, USB thumb drive or pen drive is lightweight enough to attach to a keychain. A USB flash drive can be used in place of a compact disc.', 'Thumb drives', 1500.00, 999.00, 15, 20, 1, '2023-06-24 14:46:58'),
(54, 1, 41, 'Cautious Speaker', ' loudspeaker, also called speaker, in sound reproduction, device for converting electrical energy into acoustical signal energy that is radiated into a room or open air.', 'Cautious Speaker', 1500.00, 1200.00, 50, 48, 0, '2023-06-24 14:52:41'),
(55, 1, 41, 'Splendid Speaker', ' Splendid Speaker loudspeaker, also called speaker, in sound reproduction, device for converting electrical energy into acoustical signal energy that is radiated into a room or open air.', 'Splendid Speaker', 1800.00, 1000.00, 50, 48, 1, '2023-06-24 14:53:43'),
(56, 1, 41, 'Simple Speaker', ' Simple Speaker sound reproduction, device for converting electrical energy into acoustical signal energy that is radiated into a room or open air.', 'Simple Speaker', 1100.00, 800.00, 50, 48, 1, '2023-06-24 14:55:05'),
(57, 8, 42, 'GoldChuri', ' Two balas, handcrafted in pure 22K gold, and loaded with symbolism, they hold a torch to the enduring power of Indian womanhood.', 'GoldChuri', 50000.00, 30000.00, 23, 50, 0, '2023-06-24 15:00:46'),
(58, 8, 42, 'GoldChuri', ' Two balas, handcrafted in pure 22K gold, and loaded with symbolism, they hold a torch to the enduring power of Indian womanhood.', 'goldHearRing', 30000.00, 20000.00, 21, 50, 0, '2023-06-24 15:01:38'),
(59, 8, 42, 'Gold-Payal\'s', ' Gold Payals, Gold Payal Designs Online​​ Jewelry that\'s made from gold has been adorned by women of all ages since ancient times. Brands, such as FreshVibes.', 'Gold-Payal\'s', 10000.00, 7000.00, 21, 50, 0, '2023-06-24 15:03:23'),
(60, 8, 42, 'gold-Plated', ' Gold plating is a method of depositing a thin layer of gold onto the surface of another metal, most often copper or silver (to make silver-gilt), by chemical or electrochemical plating.', 'gold-Plated', 50000.00, 70000.00, 21, 25, 1, '2023-06-24 15:04:36'),
(61, 8, 42, 'gold-Tikka', ' A maang tikka is forehead jewellery worn by Indian ladies. In a gold maang tikka design, a hook is attached to one end of the chain.', 'gold-Tikka', 8000.00, 7000.00, 22, 25, 1, '2023-06-24 15:06:19'),
(62, 8, 42, 'Necklace-ring', 'A ring on a necklace has various meanings for different people and cultures. In the old days, widows used to wear a necklace ring as a memory of their deceased whereas today it is also a symbol of relationship commitment, health-related, work-based reasons, and much more.', 'Necklace-ring', 90000.00, 70000.00, 22, 25, 1, '2023-06-24 15:07:52'),
(63, 8, 42, 'necklace', 'Necklace a piece of jewelry consisting of a string of stones, beads, jewels, or the like, or a chain of gold, silver, or other metal, for wearing around theneck.', 'necklace', 35000.00, 25000.00, 10, 55, 0, '2023-06-24 15:09:40'),
(64, 1, 2, 'Lenovo IdeaPad Slim 5i', ' The laptop is powered by 10th Gen Intel Core i5 / i7 Processor: Intel Core i5-1035G1 or Intel Core i7-1065G7. The device runs on Windows 10 Home 64 or Windows 10 Pro 64 operating system. The display size of 14 inches IPS FHD is protected by Anti-glare 45% color gamut. The resolution is 1920×1080 pixels.', 'Lenovo-IdeaPad-Slim-5i', 48000.00, 42000.00, 67, 55, 0, '2023-06-26 10:10:25'),
(65, 1, 2, 'Dell Inspiron 15 3511', ' Dell Inspiron 15 3511 (2021) is a Windows 10 laptop with a 15.60-inch display that has a resolution of 1920x1080 pixels. It is powered by a Core i3 processor and it comes with 8GB of RAM. The Dell Inspiron 15 3511 (2021) packs 1TB of HDD storage.', 'Dell Inspiron 15 3511', 35000.00, 30000.00, 47, 40, 0, '2023-06-26 10:12:50'),
(66, 1, 2, 'ASUS VivoBook Pro 14 OLED', 'Vivobook Pro 14 OLED is built to empower your creative lifestyle, with powerful components including the latest 12th Gen Intel Core H-series processors with 16 GB of LPDDR5 RAM, and an NVIDIA ® GeForce ® RTX ™ 3050 GPU that\'s the perfect choice for all your creative apps.', 'ASUS VivoBook Pro 14 OLED', 55000.00, 50000.00, 33, 40, 0, '2023-06-26 10:14:16'),
(67, 1, 2, 'Acer Aspire 5', 'Acer Aspire 5 is a Windows 10 laptop with a 15.60-inch display that has a resolution of 1366x768 pixels. It is powered by a Core i3 processor and it comes with 8GB of RAM. The Acer Aspire 5 packs 128GB of HDD storage. Graphics are powered by Nvidia GeForce MX150.', 'Acer Aspire 5', 40000.00, 45000.00, 20, 40, 1, '2023-06-26 10:15:29'),
(68, 1, 2, 'Acer2023', 'Acer Aspire 5 is a Windows 10 laptop with a 15.60-inch display that has a resolution of 1366x768 pixels. It is powered by a Core i3 processor and it comes with 8GB of RAM. The Acer Aspire 5 packs 128GB of HDD storage. Graphics are powered by Nvidia GeForce MX150.', 'acer2023', 40000.00, 45000.00, 20, 40, 0, '2023-06-26 10:32:12'),
(69, 1, 2, 'Dell-InspironL4', 'Dell-InspironL4 is a Windows 10 laptop with a 15.60-inch display that has a resolution of 1366x768 pixels. It is powered by a Core i3 processor and it comes with 8GB of RAM. The Acer Aspire 5 packs 128GB of HDD storage. Graphics are powered by Nvidia GeForce MX150.', 'Dell-InspironL4', 50000.00, 45000.00, 20, 55, 1, '2023-06-26 10:37:40'),
(70, 1, 2, 'Lenovo5iL3', 'Lenovo5iL3 is a Windows 10 laptop with a 15.60-inch display that has a resolution of 1366x768 pixels. It is powered by a Core i5 processor and it comes with 8GB of RAM. The Acer Aspire 5 packs 128GB of HDD storage. Graphics are powered by Nvidia GeForce MX150.', 'Lenovo5iL3', 60000.00, 55000.00, 19, 25, 1, '2023-06-26 10:38:43'),
(71, 1, 2, 'Acer-AspireL2', 'Acer-AspireL2 is powered by a Core i5 processor and it comes with 8GB of RAM. The Acer Aspire 5 packs 128GB of HDD storage. Graphics are powered by Nvidia GeForce MX150.', 'Acer-AspireL2', 55000.00, 45000.00, 120, 30, 0, '2023-06-26 10:39:51'),
(72, 1, 1, 'Rolex-22', 'Rolex timepieces are the most reputable and renowned timepieces in the world today. Invented by Hans Wilsdorf in 1908 and branded under the iconic Rolex name in 1915, these watches epitomize timeless elegance and prestige among all luxury watches.', 'Rolex-22', 5500.00, 3500.00, 44, 30, 0, '2023-06-26 10:47:26'),
(73, 1, 1, 'Oris-ProPilot', 'The collection is full of pioneering watches, aimed at pilots who value the ProPilot\'s cockpit-ready functionality and aesthetic.The collection is full of pioneering watches, aimed at pilots who value the ProPilot\'s cockpit-ready functionality and aesthetic.', 'Oris-ProPilot', 7500.00, 5500.00, 44, 30, 0, '2023-06-26 10:55:24'),
(74, 1, 1, 'Ressence', 'It employs a specially-modified automatic movement that gives the minutes, and hence the base calculation of time, from which is extrapolated all the other temporal indications on the dial.', 'Ressence', 6000.00, 4000.00, 44, 30, 1, '2023-06-26 10:58:17'),
(75, 1, 1, 'TAG Heuer', 'TAG Heuer S.A. (/ˌtæɡ ˈhɔɪ. ər/ TAG HOY-ər) is a Swiss luxury watchmaker that designs, manufactures and markets watches and fashion accessories, as well as eyewear and mobile phones manufactured under license by other companies and carrying the TAG Heuer brand name.', 'TAG Heuer', 6999.00, 4999.00, 33, 25, 1, '2023-06-26 11:03:33'),
(76, 1, 1, 'Panerai', 'Panerai is one of the most significant watchmakers when it comes to Italy, dive watches and military equipment. Founded in 1860 by Giovanni Panerai in Florence, Italy, the company was then named \"Officine Panerai\".', 'Panerai', 3000.00, 2500.00, 45, 55, 0, '2023-06-26 11:07:09'),
(78, 1, 4, 'Koss Corporation', 'The Koss Plug and Koss Spark Plug are in-ear passive noise-isolating earphones; they can be adapted to take the high-end Etymotics ear tip, becoming the \"Koss Hybrid\". Other models include the Koss Porta Pro and well-regarded budget-priced headphones including the KSC series.', 'Koss Corporation', 0.00, 0.00, 0, 0, 0, '2023-06-26 11:14:24'),
(79, 1, 4, 'EarBluetooth', 'A headset that provides a two-way connection to the user\'s cellphone via Bluetooth. Fitting in one ear only, the part that is pressed slightly into the ear canal typically comes with removable small, medium and large tips. For the best fit, custom ear pieces can be molded to the individual\'s ear.', 'EarBluetooth', 5999.00, 4999.00, 30, 35, 0, '2023-06-26 11:16:14'),
(80, 1, 4, 'Shredsiderics', 'Shredsiderics a headset that provides a two-way connection to the user\'s cellphone via Bluetooth. Fitting in one ear only, the part that is pressed slightly into the ear canal typically comes with removable small, medium and large tips. For the best fit, custom ear pieces can be molded to the individual\'s ear.', 'Shredsiderics', 3500.00, 3000.00, 50, 55, 1, '2023-06-26 11:18:13'),
(81, 1, 4, 'Auratunes', 'Active Noise Cancellation · Supports BT 5.0 wireless streaming · Easy foldable · Strong metal adjustable headband · Built-in rechargeable lithium ...\r\nMissing: Auratunes ‎| Must include: Auratunes. For the best fit, custom ear pieces can be molded to the individual\'s ear.', 'Auratunes', 3500.00, 3000.00, 50, 55, 0, '2023-06-26 11:19:36'),
(82, 1, 4, 'GeekWireless', 'GEEK wireless earbuds Bluetooth delivers 6 hours of wireless listening from a single charge and an extra 30 hours from the compact charging case. USB-C fast-charging port helps the earbuds wireless headphones reborn faster and stronger.', 'GeekWireless', 5099.00, 4099.00, 70, 60, 0, '2023-06-26 11:21:12'),
(84, 1, 4, 'Monsters', 'Featuring Active Noise Cancellation designed for a perfect secure fit, comfortable hook design meant to stay in your ear because loosing one is no fun. PURE MONSTER SOUND tuned for the ultimate party experience deep rich bass and clean highs 120W never sounded better.', 'Monsters', 4999.00, 3999.00, 50, 50, 0, '2023-06-26 11:28:57'),
(85, 3, 5, 'Essence of Paris', 'Top notes are Raspberry, Peach and Pink Pepper; middle notes are Cedar, Lily, Peony and Jasmine; base notes are Vanilla, Musk and Sandalwood.', 'Essence of Pari', 999.00, 599.00, 50, 50, 0, '2023-06-26 12:28:01'),
(86, 3, 5, 'Me and Scents', 'Merry Me by Scents n Stories is a delightful fruity-floral fragrance that will make you feel like you\'re walking through a field of flowers. With its performance and stylish packaging, it\'s sure to become your go-to perfume for any occasion.', 'Me and Scents', 1200.00, 1000.00, 40, 25, 0, '2023-06-26 12:30:03'),
(87, 3, 5, 'Elixir of Gods', 'A delicate touch of Bergamot turns this white and green blend into something awe inspiring. The perfect tea for those looking to transition from flavored tea blends to naturally flavored tea, allowing you to truly experience what the world of tea has to offer.', 'Elixir of Gods', 999.00, 599.00, 40, 25, 0, '2023-06-26 12:31:40'),
(88, 3, 5, 'Fresh Sunday Scents', 'Fragrance description: The soft sensation of fresh linen sheets on a sunny morning. Wake up to the summer softness and feel the immaculate sunlight gently .Fragrance description: The soft sensation of fresh linen sheets on a sunny morning. Wake up to the summer softness and feel the immaculate sunlight gently ...', 'Fresh Sunday Scents', 1099.00, 799.00, 40, 25, 0, '2023-06-26 12:33:32'),
(89, 3, 5, 'Ice Cream Series', 'VICE\'s Isaac Lappert travels across the United States to discover the country\'s best ice cream. Along the way, he also learns secrets of how to keep the ice cream business alive and what it takes to be the best.', 'Ice Cream Series', 1399.00, 1199.00, 10, 25, 1, '2023-06-26 12:37:23'),
(90, 3, 5, 'Elixir in Bottles', 'An elixir is a sweet liquid used for medical purposes, to be taken orally and intended to cure one\'s illness. When used as a pharmaceutical preparation, how to keep the ice cream business alive and what it takes to be the best.', 'Elixir in Bottles', 1399.00, 1199.00, 10, 25, 0, '2023-06-26 12:41:54'),
(91, 3, 5, 'Sweet Bold Scen', 'Hot scenes ... These can be explicit but tasteful, detailed but restrained. The doors may be wide open, and specific acts and body parts might be mentioned.Hot  scenes ... These can be explicit but tasteful, detailed but restrained. The doors may be wide open, and specific acts and body parts might be mentioned.', 'Sweet Bold Scen', 1399.00, 1199.00, 10, 25, 0, '2023-06-26 12:44:43'),
(92, 3, 5, 'Scent 13', 'Scent 13 is AnOther 13, a hypnotizing and unique scent. It\'s composed of ambroxan, a synthetic animal musk, making AnOther 13 an addictive dirty potion blended with twelve other ingredients such as jasmine, moss and ambrette seeds absolute - which gives it spike and shine.', 'Scent 13', 900.00, 599.00, 100, 55, 1, '2023-06-26 12:46:40'),
(93, 3, 5, 'Sweet Nectar', 'Sweet Nectar is a seedless red grape. The berries are small to medium in size and have a round to slightly oval shape (obtuse ovate). The colour is an attractive orange-red. The skin has a medium thickness offering some resistance to the bite and distinct crunch and chewiness to the berry despite the flesh being soft.', 'Sweet Nectar', 1599.00, 1399.00, 100, 55, 0, '2023-06-26 12:53:36');

-- --------------------------------------------------------

--
-- Table structure for table `profiles`
--

CREATE TABLE `profiles` (
  `id` int(5) UNSIGNED NOT NULL,
  `user_id` int(5) UNSIGNED NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `middle_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) NOT NULL,
  `avatar` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `in` varchar(20) DEFAULT NULL,
  `fb` varchar(80) DEFAULT NULL,
  `tw` varchar(80) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subcategories`
--

CREATE TABLE `subcategories` (
  `id` int(5) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `category_id` int(5) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `subcategories`
--

INSERT INTO `subcategories` (`id`, `name`, `category_id`, `created_at`) VALUES
(1, 'watch', 1, '2023-06-21 17:52:41'),
(2, 'Laptop', 1, '2023-06-22 08:37:50'),
(3, 'Mobile', 1, '2023-06-22 08:38:11'),
(4, 'Head Phone', 1, '2023-06-22 08:38:35'),
(5, 'Perfume', 3, '2023-06-22 08:39:15'),
(6, 'Lipstick', 5, '2023-06-22 08:39:39'),
(7, 'Eyeliner', 5, '2023-06-22 08:40:09'),
(8, 'Shoes', 3, '2023-06-22 08:40:42'),
(9, 'Sunglass', 3, '2023-06-22 08:41:05'),
(10, 'Keyboard', 1, '2023-06-22 08:41:35'),
(11, 'Pendrive', 1, '2023-06-22 08:42:00'),
(12, 'Oakley', 13, '2023-06-22 12:01:24'),
(13, 'Randolph Engineerin', 3, '2023-06-22 12:01:52'),
(14, 'Foldable Table', 12, '2023-06-22 12:02:18'),
(15, 'Fancy Figurines Showpiece', 12, '2023-06-22 12:02:41'),
(16, 'Hair Iron', 14, '2023-06-22 12:03:26'),
(18, 'Phone Case', 1, '2023-06-22 12:04:27'),
(19, 'Poopy Head ', 1, '2023-06-22 12:05:15'),
(20, 'Laptop bag', 9, '2023-06-22 12:06:06'),
(21, 'Lamp', 1, '2023-06-22 12:06:29'),
(22, 'Water Bank', 13, '2023-06-22 12:07:38'),
(23, 'Cap', 13, '2023-06-22 12:08:08'),
(24, 'Bag', 14, '2023-06-22 12:08:27'),
(25, 'Hand baselight', 14, '2023-06-22 12:09:07'),
(26, 'Skin Care', 5, '2023-06-22 12:09:28'),
(27, 'Hair Care', 5, '2023-06-22 12:10:18'),
(28, 'Body Care', 5, '2023-06-22 12:10:39'),
(29, 'Makeup Tools', 14, '2023-06-22 12:11:07'),
(31, 'Pouch & Case', 14, '2023-06-22 12:12:05'),
(32, 'ruby-stone', 14, '2023-06-22 12:12:30'),
(33, 'Ring', 14, '2023-06-22 12:12:57'),
(34, 'TV Remote', 6, '2023-06-23 06:18:17'),
(35, 'LED TV', 6, '2023-06-23 06:19:12'),
(36, 'Smart TV', 6, '2023-06-23 06:19:35'),
(37, 'Cricket', 4, '2023-06-23 06:22:35'),
(38, 'Football', 4, '2023-06-23 06:23:11'),
(39, 'Batminton', 4, '2023-06-23 06:23:57'),
(40, 'Food & vegetables', 7, '2023-06-23 06:45:03'),
(41, 'Speaker', 1, '2023-06-24 14:50:53'),
(42, 'Gold', 8, '2023-06-24 14:57:28');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(5) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(128) NOT NULL,
  `role` tinyint(1) NOT NULL,
  `token` varchar(256) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `role`, `token`, `created_at`) VALUES
(1, 'jalal', 'jalal@gmail.com', '$2y$10$nBCsqqm3kXLD8Uj7QnpvkuPmGgOMGPEJ/0A3o/l6kioIy46.4YQ4C', 2, NULL, '2023-06-21 18:53:04');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `addresses_user_id_foreign` (`user_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `images_product_id_foreign` (`product_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_address_id_foreign` (`address_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_order_id_foreign` (`order_id`),
  ADD KEY `order_items_product_id_foreign` (`product_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payments_order_id_foreign` (`order_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sku` (`sku`),
  ADD KEY `products_category_id_foreign` (`category_id`),
  ADD KEY `products_subcategory_id_foreign` (`subcategory_id`);

--
-- Indexes for table `profiles`
--
ALTER TABLE `profiles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `subcategories`
--
ALTER TABLE `subcategories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subcategories_category_id_foreign` (`category_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT for table `profiles`
--
ALTER TABLE `profiles`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subcategories`
--
ALTER TABLE `subcategories`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `addresses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_address_id_foreign` FOREIGN KEY (`address_id`) REFERENCES `addresses` (`id`),
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_subcategory_id_foreign` FOREIGN KEY (`subcategory_id`) REFERENCES `subcategories` (`id`);

--
-- Constraints for table `profiles`
--
ALTER TABLE `profiles`
  ADD CONSTRAINT `profiles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `subcategories`
--
ALTER TABLE `subcategories`
  ADD CONSTRAINT `subcategories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
