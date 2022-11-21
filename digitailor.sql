-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 08, 2022 at 09:26 AM
-- Server version: 5.7.36
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `digitailor`
--

-- --------------------------------------------------------

--
-- Table structure for table `accept_statuses`
--

DROP TABLE IF EXISTS `accept_statuses`;
CREATE TABLE IF NOT EXISTS `accept_statuses` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_ar` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `accept_statuses`
--

INSERT INTO `accept_statuses` (`id`, `title`, `title_ar`, `created_at`, `updated_at`) VALUES
(1, 'Pending', 'قيد الانتظار', NULL, NULL),
(2, 'Accepted', 'وافقت', NULL, NULL),
(3, 'Rejected', 'مرفوض', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_menus`
--

DROP TABLE IF EXISTS `admin_menus`;
CREATE TABLE IF NOT EXISTS `admin_menus` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_menus`
--

INSERT INTO `admin_menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Header - en', '2022-08-11 15:27:22', '2022-08-11 15:27:22'),
(2, 'Header - ar', '2022-08-11 15:31:40', '2022-08-11 15:31:40'),
(3, 'Footer - en', '2022-08-11 15:36:51', '2022-08-11 15:36:51'),
(4, 'Footer - ar', '2022-08-11 15:40:21', '2022-08-11 15:40:21');

-- --------------------------------------------------------

--
-- Table structure for table `admin_menu_items`
--

DROP TABLE IF EXISTS `admin_menu_items`;
CREATE TABLE IF NOT EXISTS `admin_menu_items` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `label` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `sort` int(11) NOT NULL DEFAULT '0',
  `class` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `menu` bigint(20) UNSIGNED NOT NULL,
  `depth` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_menu_items_menu_foreign` (`menu`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_menu_items`
--

INSERT INTO `admin_menu_items` (`id`, `label`, `link`, `parent`, `sort`, `class`, `menu`, `depth`, `created_at`, `updated_at`) VALUES
(1, 'Home', '/', 0, 0, NULL, 1, 0, '2022-08-11 10:27:47', '2022-08-19 20:26:33'),
(2, 'ABOUT US', '/about-us', 0, 1, NULL, 1, 0, '2022-08-11 10:28:13', '2022-08-20 10:55:06'),
(3, 'SHOP', '/', 0, 2, NULL, 1, 0, '2022-08-11 10:28:57', '2022-08-11 10:28:57'),
(4, 'KANDOORAS', '/shop', 3, 3, NULL, 1, 1, '2022-08-11 10:29:36', '2022-08-11 10:30:01'),
(5, 'TAILORS', '/tailors', 0, 5, NULL, 1, 0, '2022-08-11 10:30:01', '2022-10-07 10:59:24'),
(6, 'TESTIMONIALS', '/testimonials', 0, 6, NULL, 1, 0, '2022-08-11 10:30:49', '2022-10-07 10:59:24'),
(7, 'CONTACT US', '/contact-us', 0, 7, NULL, 1, 0, '2022-08-11 10:31:08', '2022-10-07 10:59:24'),
(8, 'الصفحة الرئيسية', '/ar/', 0, 0, NULL, 2, 0, '2022-08-11 10:32:22', '2022-08-11 10:32:44'),
(9, 'معلومات عنا', '/ar/about-us', 0, 1, NULL, 2, 0, '2022-08-11 10:32:44', '2022-08-11 10:33:17'),
(10, 'متجر', '/ar/', 0, 2, NULL, 2, 0, '2022-08-11 10:33:17', '2022-08-11 10:34:13'),
(11, 'كندورة', '/ar/shop', 10, 3, NULL, 2, 1, '2022-08-11 10:34:13', '2022-08-11 10:34:58'),
(12, 'الخياطين', '/ar/tailors', 0, 4, NULL, 2, 0, '2022-08-11 10:34:58', '2022-08-11 10:34:58'),
(13, 'الشهادات - التوصيات', '/ar/testimonials', 0, 5, NULL, 2, 0, '2022-08-11 10:35:24', '2022-08-11 10:35:24'),
(14, 'اتصل بنا', '/ar/contact-us', 0, 6, NULL, 2, 0, '2022-08-11 10:35:55', '2022-08-11 10:35:55'),
(15, 'HOME', '/', 0, 0, NULL, 3, 0, '2022-08-11 10:37:18', '2022-08-11 10:37:35'),
(16, 'ABOUT US', '/about-us', 0, 1, NULL, 3, 0, '2022-08-11 10:37:35', '2022-08-11 10:37:50'),
(17, 'SHOP', '/shop', 0, 2, NULL, 3, 0, '2022-08-11 10:37:50', '2022-08-11 10:38:08'),
(18, 'TAILORS', '/tailors', 0, 3, NULL, 3, 0, '2022-08-11 10:38:54', '2022-08-11 10:38:54'),
(19, 'TESTIMONIALS', '/testimonials', 0, 4, NULL, 3, 0, '2022-08-11 10:39:14', '2022-08-11 10:39:14'),
(20, 'CONTACT US', '/contact-us', 0, 5, NULL, 3, 0, '2022-08-11 10:39:34', '2022-08-11 10:39:34'),
(21, 'FAQ', '/faq', 0, 6, NULL, 3, 0, '2022-08-11 10:39:48', '2022-08-11 10:39:48'),
(22, 'الصفحة الرئيسية', '/ar/', 0, 0, NULL, 4, 0, '2022-08-11 10:41:06', '2022-08-11 10:41:33'),
(23, 'معلومات عنا', '/ar/about-us', 0, 1, NULL, 4, 0, '2022-08-11 10:41:33', '2022-08-11 10:41:59'),
(24, 'متجر', '/ar/shop', 0, 2, NULL, 4, 0, '2022-08-11 10:41:59', '2022-08-11 10:42:37'),
(25, 'الخياطون', '/ar/tailors', 0, 3, NULL, 4, 0, '2022-08-11 10:42:37', '2022-08-11 10:43:16'),
(26, 'الشهادات - التوصيات', '/ar/testimonials', 0, 4, NULL, 4, 0, '2022-08-11 10:43:16', '2022-08-11 10:44:12'),
(27, 'اتصل بنا', '/ar/contact-us', 0, 5, NULL, 4, 0, '2022-08-11 10:44:12', '2022-08-11 10:44:39'),
(28, 'التعليمات', '/ar/faq', 0, 7, NULL, 4, 0, '2022-08-11 10:44:39', '2022-08-11 10:44:39'),
(29, 'TERMS AND CONDITIONS', '/en/terms-and-condition', 0, 7, NULL, 3, 0, '2022-08-24 10:26:07', '2022-09-23 20:48:51'),
(30, 'PRIVACY POLICY', '/en/privacy-policy', 0, 8, NULL, 3, 0, '2022-08-24 10:27:28', '2022-09-24 13:41:55'),
(31, 'Custom Kandora', 'custom-kandora', 3, 4, NULL, 1, 1, '2022-10-07 10:59:16', '2022-10-07 10:59:24');

-- --------------------------------------------------------

--
-- Table structure for table `audits`
--

DROP TABLE IF EXISTS `audits`;
CREATE TABLE IF NOT EXISTS `audits` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `event` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `auditable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `auditable_id` bigint(20) UNSIGNED NOT NULL,
  `old_values` text COLLATE utf8mb4_unicode_ci,
  `new_values` text COLLATE utf8mb4_unicode_ci,
  `url` text COLLATE utf8mb4_unicode_ci,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` varchar(1023) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tags` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `audits_auditable_type_auditable_id_index` (`auditable_type`,`auditable_id`),
  KEY `audits_user_id_user_type_index` (`user_id`,`user_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
CREATE TABLE IF NOT EXISTS `carts` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_checkout` int(11) NOT NULL DEFAULT '0',
  `coupon_id` int(11) DEFAULT NULL,
  `coupon_charge` double(8,2) NOT NULL DEFAULT '0.00',
  `session_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `carts_session_id_unique` (`session_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `customer_id`, `created_at`, `updated_at`, `is_checkout`, `coupon_id`, `coupon_charge`, `session_id`) VALUES
(29, 19, '2022-09-21 03:09:29', '2022-09-30 05:02:49', 0, NULL, 0.00, '33c741ef1e2b78cec0e85582f2f5fd808597357d'),
(30, 20, '2022-10-08 15:10:35', '2022-10-12 05:06:37', 1, NULL, 0.00, 'c6db8a1efc57ec345daf175a2f270740185560a0');

-- --------------------------------------------------------

--
-- Table structure for table `cart_items`
--

DROP TABLE IF EXISTS `cart_items`;
CREATE TABLE IF NOT EXISTS `cart_items` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cart_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_fabric_id` int(11) NOT NULL,
  `product_size_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cart_items`
--

INSERT INTO `cart_items` (`id`, `cart_id`, `product_id`, `product_fabric_id`, `product_size_id`, `quantity`, `price`, `created_at`, `updated_at`) VALUES
(41, 29, 9, 3, 3, 3, 34.00, '2022-09-21 03:09:29', '2022-09-21 03:10:50'),
(43, 29, 10, 3, 3, 4, 57.00, '2022-09-21 03:23:09', '2022-09-27 14:33:33'),
(44, 30, 10, 3, 3, 1, 57.00, '2022-10-08 15:10:35', '2022-10-08 15:10:35');

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
CREATE TABLE IF NOT EXISTS `cities` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_ar` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `title`, `title_ar`, `created_at`, `updated_at`) VALUES
(1, 'Dubai', 'دبي', '2022-08-17 16:34:04', '2022-08-17 16:34:04');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
CREATE TABLE IF NOT EXISTS `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `email`, `phone_number`, `message`, `created_at`, `updated_at`) VALUES
(1, 'adasdsad', 'asdsd@gmail.com', '123456', 'adsasds', '2022-08-16 01:25:03', '2022-08-16 01:25:03'),
(2, 'adasdsad', 'asdsd1@gmail.com', '1234561', 'adsasds', '2022-08-16 01:25:40', '2022-08-16 01:25:40'),
(3, 'adasdsad', 'asdsd2@gmail.com', '1234562', 'adsasds', '2022-08-16 01:25:59', '2022-08-16 01:25:59'),
(4, 'adasdsad', 'asdsd21@gmail.com', '12345621', 'adsasds', '2022-08-16 01:34:55', '2022-08-16 01:34:55'),
(5, 'sadsd', 'sdasad@gmail.com', '12345644', 'dfsdsfdsf', '2022-08-16 02:56:33', '2022-08-16 02:56:33'),
(6, 'asdasd', 'sadasd@gmail.com', '12345622', 'sadsdsad', '2022-08-16 03:01:28', '2022-08-16 03:01:28'),
(7, 'asdasd', 'sadasd3@gmail.com', '123456223', 'sadsdsad', '2022-08-16 03:01:53', '2022-08-16 03:01:53'),
(8, 'asdasd', 'sadasde3@gmail.com', '1234562232', 'sadsdsad', '2022-08-16 03:02:27', '2022-08-16 03:02:27'),
(10, 'asdasd', 'sadasde33@gmail.com', '123456223233', 'sadsdsad', '2022-08-16 03:03:43', '2022-08-16 03:03:43'),
(11, 'adssadasd', 'asdsad@gmail.com', '1234576', 'dsaads', '2022-08-16 03:05:08', '2022-08-16 03:05:08'),
(12, 'adssadasd', 'asdsad22@gmail.com', '123457622', 'dsaads', '2022-08-16 03:06:27', '2022-08-16 03:06:27'),
(13, 'asdsad', 'asdsad44@gmail.com', '12122', 'asdsad', '2022-08-16 04:32:31', '2022-08-16 04:32:31'),
(14, 'asdsad', 'asdsad444@gmail.com', '12122444', 'asdsad', '2022-08-16 04:34:12', '2022-08-16 04:34:12'),
(15, 'asdasdas', 'asdsad4334@gmail.com', '324324323', 'sadsdsd', '2022-08-16 04:35:33', '2022-08-16 04:35:33'),
(16, 'asdasdas', 'asdsad434434@gmail.com', '32432432344', 'sadsdsd', '2022-08-16 04:38:29', '2022-08-16 04:38:29'),
(17, 'sadsad', 'sadsda@gmail.com', '21232223', 'dsasda', '2022-08-16 04:39:19', '2022-08-16 04:39:19'),
(18, 'sadsda', 'sdasad33@gmail.com', '3343343324', 'sdaasdasd', '2022-08-16 04:40:35', '2022-08-16 04:40:35'),
(19, 'sadsda', 'asdsad2223@gmail.com', '1323234234', 'sadsdaas', '2022-08-16 04:41:41', '2022-08-16 04:41:41'),
(20, 'sdasaddsa', 'sadsdaas11212@gmail.com', '43232434', 'ereererew', '2022-08-16 04:43:49', '2022-08-16 04:43:49'),
(21, 'sadsdaa', 'sadsaddas@gmail.com', '134344', 'dsadsadas', '2022-08-16 04:44:50', '2022-08-16 04:44:50'),
(22, 'asdsad', 'sdasad454@gmail.com', '3435543', 'asdasdasd', '2022-08-16 04:47:48', '2022-08-16 04:47:48'),
(23, 'asdsda', 'saddas@gmail.com', '32434232', 'sdadsads', '2022-08-16 04:48:26', '2022-08-16 04:48:26'),
(24, 'adssadasd', 'asdsad2332@gmail.com', '12345762233', 'dsaads', '2022-08-16 05:03:03', '2022-08-16 05:03:03'),
(25, 'asdsad', 'sdasad34r34@gmail.com', '33434433', 'asdassad', '2022-08-16 05:03:35', '2022-08-16 05:03:35'),
(26, 'asdasd', 'sadsdaasda@gmail.com', '12345645', 'dssadsad', '2022-08-29 11:01:37', '2022-08-29 11:01:37'),
(27, 'test', 'test001@gmail.com', '123456133', 'test', '2022-09-08 03:35:05', '2022-09-08 03:35:05'),
(28, 'sdasad', 'irtazaalam786@gmail.com', '1234566', 'sadsad', '2022-09-18 14:11:16', '2022-09-18 14:11:16'),
(32, 'sdasad', 'irtazaalam786@gmail.com', '1234566', 'sadsad', '2022-09-18 14:39:10', '2022-09-18 14:39:10'),
(33, 'sdasad', 'irtazaalam786@gmail.com', '1234566', 'sadsad', '2022-09-18 14:43:22', '2022-09-18 14:43:22'),
(34, 'sdasad', 'irtazaalam786@gmail.com', '1234566', 'sadsad', '2022-09-18 14:43:43', '2022-09-18 14:43:43'),
(35, 'sdasad', 'irtazaalam786@gmail.com', '1234566', 'sadsad', '2022-09-18 14:45:03', '2022-09-18 14:45:03'),
(36, 'sdasad', 'irtazaalam786@gmail.com', '1234566', 'sadsad', '2022-09-18 14:45:46', '2022-09-18 14:45:46'),
(37, 'sdasad', 'irtazaalam786@gmail.com', '1234566', 'sadsad', '2022-09-18 14:50:31', '2022-09-18 14:50:31'),
(38, 'sdasad', 'irtazaalam786@gmail.com', '1234566', 'sadsad', '2022-09-18 14:53:38', '2022-09-18 14:53:38'),
(39, 'sdasad', 'irtazaalam786@gmail.com', '1234566', 'sadsad', '2022-09-18 14:53:51', '2022-09-18 14:53:51'),
(40, 'sdasad', 'irtazaalam786@gmail.com', '1234566', 'sadsad', '2022-09-18 14:55:40', '2022-09-18 14:55:40'),
(41, 'Irtiza', 'irtazaalam786@gmail.com', '123456', 'fdsdsdsf', '2022-09-23 15:34:23', '2022-09-23 15:34:23'),
(42, 'Irtiza', 'irtazaalam786@gmail.com', '123456', 'fdsdsdsf', '2022-09-23 15:40:36', '2022-09-23 15:40:36'),
(43, 'sadsad', 'irtazaalam786@gmail.com', '123456', 'sdaasdsda', '2022-09-23 15:40:57', '2022-09-23 15:40:57'),
(44, 'sadsads', 'irtazaalam786@gmail.com', '123456', 'asdsfdssdf', '2022-09-23 15:43:38', '2022-09-23 15:43:38'),
(45, 'sadsa', 'irtazaalam786@gmail.com', '123456', 'dsasdasad', '2022-09-30 02:57:38', '2022-09-30 02:57:38'),
(46, 'sadsa', 'irtazaalam786@gmail.com', '123456', 'dsasdasad', '2022-09-30 03:53:56', '2022-09-30 03:53:56'),
(47, 'sdsad', 'irtazaalam786@gmail.com', '123456', 'dfdsdfs', '2022-09-30 06:22:53', '2022-09-30 06:22:53'),
(48, 'sdsad', 'irtazaalam786@gmail.com', '123456', 'dfdsdfs', '2022-09-30 06:23:54', '2022-09-30 06:23:54'),
(49, 'sdsad', 'irtazaalam786@gmail.com', '123456', 'dfdsdfs', '2022-09-30 06:25:47', '2022-09-30 06:25:47'),
(50, 'sdsad', 'irtazaalam786@gmail.com', '123456', 'dfdsdfs', '2022-09-30 06:27:50', '2022-09-30 06:27:50'),
(51, 'sdsad', 'irtazaalam786@gmail.com', '123456', 'dfdsdfs', '2022-09-30 06:28:18', '2022-09-30 06:28:18');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

DROP TABLE IF EXISTS `coupons`;
CREATE TABLE IF NOT EXISTS `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total` int(11) NOT NULL,
  `total_per_user` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `status_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `value` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `coupon_id`, `code`, `total`, `total_per_user`, `start_date`, `end_date`, `status_id`, `created_at`, `updated_at`, `value`) VALUES
(1, 1, '9ea57b4f', 44, 5, '2022-08-24', '2022-10-13', 1, '2022-08-25 05:54:14', '2022-10-09 18:07:27', 30);

-- --------------------------------------------------------

--
-- Table structure for table `coupon_types`
--

DROP TABLE IF EXISTS `coupon_types`;
CREATE TABLE IF NOT EXISTS `coupon_types` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupon_types`
--

INSERT INTO `coupon_types` (`id`, `title`, `created_at`, `updated_at`) VALUES
(1, 'Percentage', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
CREATE TABLE IF NOT EXISTS `customers` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `otp` int(11) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `customers_email_unique` (`email`),
  UNIQUE KEY `customers_phone_number_unique` (`phone_number`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `first_name`, `last_name`, `email`, `phone_number`, `password`, `otp`, `email_verified_at`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'sadads', 'sadasd', 'test@gmail.com', '123456', '$2y$10$i2xOQ8zgh.0hKlM4.B.JJeoxdLIXBML1j5NP06eVv6/fl7CYjzNy.', 22191, '2022-08-13 01:23:59', NULL, '2022-08-13 13:23:40', '2022-08-19 12:46:39'),
(2, 'dsadas', 'sadasd', 'asdsda@gmail.com', '123445', '$2y$10$PNrBhQ5OoXTgMHtvDX6dfeC/qquy962vMulMnL/Xz4m8a.ABDryyO', 26289, '2022-08-19 23:51:03', NULL, '2022-08-20 11:50:24', '2022-08-20 11:51:03'),
(3, 'adsasd', 'asdsad', 'dsadas@gmail.com', '123455', '$2y$10$DkcdH9QVotJ08WstdGKzWOn7Ug48OLQHQxGrRTXXoxnalPLCbTRqK', 30023, '2022-08-20 01:22:11', NULL, '2022-08-20 12:08:11', '2022-08-20 14:48:46'),
(12, 'fdsfdsf', 'sfdfdsfds', 'ddsadsa@gmail.com', '9231771411144', '$2y$10$x.obH0ERccVwdykx/5HAOO9Z8kjbGAhaSJYtzrjb5hKgjnCenCSii', 55236, '2022-08-23 15:34:17', NULL, '2022-08-24 00:13:42', '2022-08-24 04:09:40'),
(13, 'Murtaza', 'Alam', 'test1@gmail.com', '923172116172', '$2y$10$VXyy4VczcQdYcapLIVSx2OmNFBqAmVlUQ3jTFmx0dousa2oCligZm', 34747, '2022-08-23 20:17:08', NULL, '2022-08-24 08:16:23', '2022-08-24 08:17:08'),
(14, 'Shahida', 'Rizvi', 'shahida@gmail.com', '923137922244', '$2y$10$LS1OiWEUTVgrOw35bSTlsOc/0T2a9GxzkJBj.CKHMxl8IwadozQb2', 66484, NULL, NULL, '2022-08-27 05:59:09', '2022-08-27 06:00:44'),
(17, 'Irtiza', 'Alam', 'test0001@gmail.com', '9231771414441', '$2y$10$v4spZbIPMCfA6EXEBpYhS.qsHl59pCSVQ1M8.m6NqUEv.9SR5oJy2', 55304, '2022-09-07 04:52:52', NULL, '2022-09-07 15:58:42', '2022-09-08 02:05:50'),
(19, 'Irtiza', 'Alam', 'irtazaalam7816@gmail.com', '9231771414444', '$2y$10$H/zIEPcEH6qzFmihgHAzVe7wSU6vf8lTmCGg7IA8N9DGYq1yo8UKK', 54503, '2022-09-19 03:12:46', NULL, '2022-09-19 03:02:03', '2022-09-24 13:13:58'),
(20, 'Irtiza', 'Alam', 'irtazaalam786@gmail.com', '923177141444', '$2y$10$TGBiNMl/dQMZEfCbLY7NB.X2zNX6I5ciUc18T9P20829tjru1/Tw6', 99533, '2022-09-19 03:12:46', NULL, '2022-10-05 08:55:14', '2022-10-05 09:19:30');

-- --------------------------------------------------------

--
-- Table structure for table `customer_billing_addresses`
--

DROP TABLE IF EXISTS `customer_billing_addresses`;
CREATE TABLE IF NOT EXISTS `customer_billing_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `full_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city_id` int(11) NOT NULL,
  `house_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `area` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer_billing_addresses`
--

INSERT INTO `customer_billing_addresses` (`id`, `customer_id`, `full_name`, `phone_number`, `city_id`, `house_no`, `area`, `address`, `created_at`, `updated_at`) VALUES
(1, 1, 'sadds', '222323', 1, 'sdasd', 'asdsadas', 'sdasdsa', '2022-08-19 02:21:54', '2022-08-19 02:21:54'),
(2, 12, 'dfsdsf', '444', 1, 'saddsa', 'asdsda', 'adsd', '2022-08-25 23:42:07', '2022-08-25 23:42:07');

-- --------------------------------------------------------

--
-- Table structure for table `customer_measurements`
--

DROP TABLE IF EXISTS `customer_measurements`;
CREATE TABLE IF NOT EXISTS `customer_measurements` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `neck_size` double(8,2) NOT NULL,
  `shoulder_size` double(8,2) NOT NULL,
  `chest_size` double(8,2) NOT NULL,
  `front_cross` double(8,2) NOT NULL,
  `waist` double(8,2) NOT NULL,
  `sleeve` double(8,2) NOT NULL,
  `arm_hole` double(8,2) NOT NULL,
  `biceps` double(8,2) NOT NULL,
  `cuff` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer_measurements`
--

INSERT INTO `customer_measurements` (`id`, `customer_id`, `title`, `neck_size`, `shoulder_size`, `chest_size`, `front_cross`, `waist`, `sleeve`, `arm_hole`, `biceps`, `cuff`, `created_at`, `updated_at`) VALUES
(1, 12, 'test', 111.00, 111.00, 111.00, 111.00, 111.00, 111.00, 111.00, 111.00, 111.00, '2022-08-26 04:20:56', '2022-08-26 04:21:17'),
(2, 13, 'sdassa', 22.00, 22.00, 22.00, 22.00, 22.00, 22.00, 22.00, 22.00, 22.00, '2022-08-29 04:03:45', '2022-08-29 04:03:45'),
(3, 13, 'saddas', 22.00, 22.00, 22.00, 22.00, 22.00, 22.00, 22.00, 22.00, 22.00, '2022-08-29 04:25:29', '2022-08-29 04:25:29'),
(4, 20, 'test', 45.00, 32.00, 23.00, 23.00, 23.00, 23.00, 23.00, 23.00, 22.00, '2022-10-07 08:34:59', '2022-10-07 08:34:59'),
(5, 20, 'test', 33.00, 34.00, 34.00, 32.00, 33.00, 22.00, 342.00, 23.00, 34.00, '2022-10-07 09:54:02', '2022-10-07 09:54:02');

-- --------------------------------------------------------

--
-- Table structure for table `customer_password_resets`
--

DROP TABLE IF EXISTS `customer_password_resets`;
CREATE TABLE IF NOT EXISTS `customer_password_resets` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `phone_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `otp` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_used` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_password_resets_phone_number_index` (`phone_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer_shipping_addresses`
--

DROP TABLE IF EXISTS `customer_shipping_addresses`;
CREATE TABLE IF NOT EXISTS `customer_shipping_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `full_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city_id` int(11) NOT NULL,
  `house_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `area` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer_shipping_addresses`
--

INSERT INTO `customer_shipping_addresses` (`id`, `customer_id`, `full_name`, `phone_number`, `city_id`, `house_no`, `area`, `address`, `created_at`, `updated_at`) VALUES
(1, 12, 'sadsda', '12345', 1, 'fsdds', 'dfssd', 'fdsdfsfd', '2022-08-24 11:34:07', '2022-08-24 11:38:40'),
(2, 13, 'sdasad', '1234565', 1, 'dsasad', 'sdasda', 'sdasadsa', '2022-08-29 03:34:42', '2022-08-29 03:34:42'),
(3, 19, 'Irtiza Alam', '923177141444', 1, '123456', 'dsdsadsa', 'test@gmail.com', '2022-09-19 03:41:25', '2022-09-19 03:41:25'),
(4, 20, 'Irtiza Alam', '923177141444', 1, 'sdasda', 'sadasd', 'sadsadas', '2022-10-09 12:54:00', '2022-10-09 12:54:00');

-- --------------------------------------------------------

--
-- Table structure for table `custom_kandoras`
--

DROP TABLE IF EXISTS `custom_kandoras`;
CREATE TABLE IF NOT EXISTS `custom_kandoras` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `tailor_id` int(11) NOT NULL,
  `kandora_design_id` int(11) DEFAULT NULL,
  `kandora_design_price` double(8,2) NOT NULL DEFAULT '0.00',
  `kandora_fabric_id` int(11) DEFAULT NULL,
  `kandora_fabric_price` double(8,2) NOT NULL DEFAULT '0.00',
  `kandora_pattern_id` int(11) DEFAULT NULL,
  `kandora_pattern_price` double(8,2) NOT NULL DEFAULT '0.00',
  `kandora_design_sleeve_id` int(11) DEFAULT NULL,
  `kandora_design_sleeve_price` double(8,2) NOT NULL DEFAULT '0.00',
  `kandora_sleeve_length_id` int(11) DEFAULT NULL,
  `kandora_sleeve_length_price` double(8,2) NOT NULL DEFAULT '0.00',
  `kandora_sleeve_button_id` int(11) DEFAULT NULL,
  `kandora_sleeve_button_price` double(8,2) NOT NULL DEFAULT '0.00',
  `kandora_neck_shape_id` int(11) DEFAULT NULL,
  `kandora_neck_shape_price` double(8,2) NOT NULL DEFAULT '0.00',
  `kandora_neck_front_length_id` int(11) DEFAULT NULL,
  `kandora_neck_front_length_price` double(8,2) NOT NULL DEFAULT '0.00',
  `kandora_khawar_neck_length_id` int(11) DEFAULT NULL,
  `kandora_khawar_neck_length_price` double(8,2) NOT NULL DEFAULT '0.00',
  `kandora_waist_shape_tight_id` int(11) DEFAULT NULL,
  `kandora_waist_shape_tight_price` double(8,2) NOT NULL DEFAULT '0.00',
  `kandora_type_crystal_id` int(11) DEFAULT NULL,
  `kandora_type_crystal_price` double(8,2) NOT NULL DEFAULT '0.00',
  `kandora_size_crystal_id` int(11) DEFAULT NULL,
  `kandora_size_crystal_price` double(8,2) NOT NULL DEFAULT '0.00',
  `kandora_amount_crytal_id` int(11) DEFAULT NULL,
  `kandora_amount_crytal_price` double(8,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `instructions` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `coupon_id` int(11) DEFAULT NULL,
  `coupon_charge` double(8,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `custom_kandoras`
--

INSERT INTO `custom_kandoras` (`id`, `customer_id`, `tailor_id`, `kandora_design_id`, `kandora_design_price`, `kandora_fabric_id`, `kandora_fabric_price`, `kandora_pattern_id`, `kandora_pattern_price`, `kandora_design_sleeve_id`, `kandora_design_sleeve_price`, `kandora_sleeve_length_id`, `kandora_sleeve_length_price`, `kandora_sleeve_button_id`, `kandora_sleeve_button_price`, `kandora_neck_shape_id`, `kandora_neck_shape_price`, `kandora_neck_front_length_id`, `kandora_neck_front_length_price`, `kandora_khawar_neck_length_id`, `kandora_khawar_neck_length_price`, `kandora_waist_shape_tight_id`, `kandora_waist_shape_tight_price`, `kandora_type_crystal_id`, `kandora_type_crystal_price`, `kandora_size_crystal_id`, `kandora_size_crystal_price`, `kandora_amount_crytal_id`, `kandora_amount_crytal_price`, `created_at`, `updated_at`, `instructions`, `coupon_id`, `coupon_charge`) VALUES
(9, 19, 8, 1, 400.00, 1, 100.00, 1, 300.00, 1, 35.00, 1, 400.00, 1, 100.00, 1, 100.00, 1, 100.00, 1, 400.00, 1, 300.00, 1, 300.00, 1, 333.00, 1, 300.00, '2022-09-27 14:51:14', '2022-09-28 06:12:52', '', NULL, 0.00),
(11, 20, 8, 1, 400.00, 1, 100.00, 1, 300.00, 1, 35.00, 1, 400.00, 1, 100.00, 1, 100.00, 1, 100.00, 1, 400.00, 1, 300.00, 1, 300.00, 1, 333.00, 1, 300.00, '2022-10-10 16:22:02', '2022-10-10 16:22:02', 'saasa', NULL, 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

DROP TABLE IF EXISTS `email_templates`;
CREATE TABLE IF NOT EXISTS `email_templates` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_ar` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description_ar` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `email_templates`
--

INSERT INTO `email_templates` (`id`, `title`, `subject`, `subject_ar`, `description`, `description_ar`, `status_id`, `created_at`, `updated_at`) VALUES
(2, 'Contact US', 'Digitailor - Contact Request', 'Digitailor - طلب الاتصال', '<p>Your request has been recieved.</p>', '<p>تم استلام طلبك.</p>', 1, '2022-09-18 16:44:54', '2022-09-18 17:38:48'),
(3, 'Contact US - Admin', 'Digitailor - New Contact Request', 'Digitailor - طلب اتصال جديد', '<p>A new request has been received.</p>', '<p>تم استلام طلب جديد.</p>', 1, '2022-09-18 19:24:45', '2022-09-18 19:50:09'),
(4, 'Welcome', 'Welcome to Digitailor', 'مرحبا بكم في Digitailor', '<p>Thanks for the subscription to our website! We can&rsquo;t wait to start helping you customize your own Khawar.</p>', '<p>شكرا للاشتراك في موقعنا! لا يسعنا الانتظار لبدء مساعدتك في تخصيص الخوار الخاص بك.</p>', 1, '2022-09-19 07:32:30', '2022-09-19 07:32:30'),
(5, 'Order Received', 'Order received', 'طلب وارد', '<p>We are so happy to receive your order!</p>\r\n<p>Our team is already preparing your Khawar, while you are waiting, enjoy X% off your next purchase.</p>\r\n<p>Hope to see you soon.</p>', '<p>يسعدنا تلقي طلبك!</p>\r\n<p>يقوم فريقنا بالفعل بإعداد الخوار الخاص بك ، أثناء انتظارك ، استمتع بخصم X٪ على مشترياتك التالية.</p>\r\n<p>أتمنى رؤيتك قريبا.</p>', 1, '2022-09-19 08:54:10', '2022-09-19 08:54:10'),
(6, 'Order Status Change', 'Order status change', 'تغيير حالة الطلب', '<p><span style=\"font-size: 12.0pt; font-family: \'Calibri\',sans-serif; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: Calibri; mso-fareast-theme-font: minor-latin; mso-hansi-theme-font: minor-latin; mso-bidi-font-family: Arial; mso-bidi-theme-font: minor-bidi; mso-ansi-language: EN-US; mso-fareast-language: EN-US; mso-bidi-language: AR-SA;\">We know you are excited to receive your order, here is the last update on your Khawar.</span></p>', '<p>نحن نعلم أنك متحمس لاستلام طلبك ، إليك آخر تحديث على خوار الخاص بك.</p>', 1, '2022-09-25 16:12:01', '2022-09-25 16:12:01');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

DROP TABLE IF EXISTS `faqs`;
CREATE TABLE IF NOT EXISTS `faqs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `question` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `question_ar` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer_ar` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `order` double(8,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faqs`
--

INSERT INTO `faqs` (`id`, `question`, `question_ar`, `answer`, `answer_ar`, `status_id`, `created_at`, `updated_at`, `order`) VALUES
(2, 'How can we add vendors?', 'كيف يمكننا اضافة بائعين؟', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 'لوريم إيبسوم هو ببساطة نص شكلي يستخدم في صناعة الطباعة والتنضيد. كان Lorem Ipsum هو النص الوهمي القياسي في الصناعة منذ القرن الخامس عشر الميلادي ، عندما أخذت طابعة غير معروفة لوحًا من النوع وتدافعت عليه لعمل كتاب عينة.', 1, '2022-08-21 09:24:18', '2022-09-21 11:52:26', 1.00),
(4, 'asdadssa', 'sdaasd', 'sadads', 'sadasd', 1, '2022-08-28 09:50:12', '2022-09-21 11:52:35', 5.00),
(7, 'dsaasd', 'sadsad', 'sdasd', 'asdasd', 1, '2022-08-28 10:05:15', '2022-09-21 11:52:40', 3.00);

-- --------------------------------------------------------

--
-- Table structure for table `kandora_amount_crystals`
--

DROP TABLE IF EXISTS `kandora_amount_crystals`;
CREATE TABLE IF NOT EXISTS `kandora_amount_crystals` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_ar` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_id` int(11) NOT NULL,
  `kandora_size_crystal_id` int(11) NOT NULL,
  `price` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kandora_amount_crystals`
--

INSERT INTO `kandora_amount_crystals` (`id`, `title`, `title_ar`, `status_id`, `kandora_size_crystal_id`, `price`, `created_at`, `updated_at`) VALUES
(1, 'test', 'اختبار', 1, 1, 300.00, '2022-09-18 14:53:54', '2022-09-18 14:53:54'),
(2, 'test one', 'اختبار واحد', 1, 2, 300.00, '2022-09-18 14:54:20', '2022-09-18 14:54:20');

-- --------------------------------------------------------

--
-- Table structure for table `kandora_design`
--

DROP TABLE IF EXISTS `kandora_design`;
CREATE TABLE IF NOT EXISTS `kandora_design` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_ar` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tailor_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_id` int(11) NOT NULL,
  `price` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kandora_design`
--

INSERT INTO `kandora_design` (`id`, `title`, `title_ar`, `tailor_id`, `status_id`, `price`, `created_at`, `updated_at`) VALUES
(1, 'test', 'اختبار', '8', 1, 400.00, '2022-09-08 10:14:11', '2022-09-08 10:14:11'),
(2, 'test one', 'اختبار واحد', '8', 1, 500.00, '2022-09-10 21:47:22', '2022-09-10 21:47:22'),
(3, 'test', 'اختبار', '9', 1, 44.00, '2022-09-20 06:56:04', '2022-09-20 06:56:04');

-- --------------------------------------------------------

--
-- Table structure for table `kandora_design_sleeves`
--

DROP TABLE IF EXISTS `kandora_design_sleeves`;
CREATE TABLE IF NOT EXISTS `kandora_design_sleeves` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_ar` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tailor_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_id` int(11) NOT NULL,
  `price` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kandora_design_sleeves`
--

INSERT INTO `kandora_design_sleeves` (`id`, `title`, `title_ar`, `tailor_id`, `status_id`, `price`, `created_at`, `updated_at`) VALUES
(1, 'test', 'test', '8', 1, 35.00, '2022-09-12 11:15:44', '2022-09-12 11:15:44');

-- --------------------------------------------------------

--
-- Table structure for table `kandora_fabrics`
--

DROP TABLE IF EXISTS `kandora_fabrics`;
CREATE TABLE IF NOT EXISTS `kandora_fabrics` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_ar` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_id` int(11) NOT NULL,
  `price` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kandora_fabrics`
--

INSERT INTO `kandora_fabrics` (`id`, `title`, `title_ar`, `status_id`, `price`, `created_at`, `updated_at`) VALUES
(1, 'Linen', 'الكتان', 1, 100.00, '2022-09-10 20:58:45', '2022-09-10 20:58:45'),
(2, 'Cotton', 'قطن', 1, 300.00, '2022-09-12 12:00:54', '2022-09-12 12:00:54');

-- --------------------------------------------------------

--
-- Table structure for table `kandora_khawar_neck_lengths`
--

DROP TABLE IF EXISTS `kandora_khawar_neck_lengths`;
CREATE TABLE IF NOT EXISTS `kandora_khawar_neck_lengths` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_ar` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_id` int(11) NOT NULL,
  `price` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kandora_khawar_neck_lengths`
--

INSERT INTO `kandora_khawar_neck_lengths` (`id`, `title`, `title_ar`, `status_id`, `price`, `created_at`, `updated_at`) VALUES
(1, 'Short', 'قصيرة', 1, 400.00, '2022-09-14 10:40:31', '2022-09-14 10:40:31');

-- --------------------------------------------------------

--
-- Table structure for table `kandora_neck_front_lengths`
--

DROP TABLE IF EXISTS `kandora_neck_front_lengths`;
CREATE TABLE IF NOT EXISTS `kandora_neck_front_lengths` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_ar` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_id` int(11) NOT NULL,
  `price` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kandora_neck_front_lengths`
--

INSERT INTO `kandora_neck_front_lengths` (`id`, `title`, `title_ar`, `status_id`, `price`, `created_at`, `updated_at`) VALUES
(1, 'test', 'اختبار', 1, 220.00, '2022-09-13 07:52:56', '2022-09-13 07:52:56');

-- --------------------------------------------------------

--
-- Table structure for table `kandora_neck_shapes`
--

DROP TABLE IF EXISTS `kandora_neck_shapes`;
CREATE TABLE IF NOT EXISTS `kandora_neck_shapes` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_ar` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_id` int(11) NOT NULL,
  `price` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kandora_neck_shapes`
--

INSERT INTO `kandora_neck_shapes` (`id`, `title`, `title_ar`, `status_id`, `price`, `created_at`, `updated_at`) VALUES
(1, 'test', 'اختبار', 1, 100.00, '2022-09-13 06:50:14', '2022-09-13 06:50:14');

-- --------------------------------------------------------

--
-- Table structure for table `kandora_patterns`
--

DROP TABLE IF EXISTS `kandora_patterns`;
CREATE TABLE IF NOT EXISTS `kandora_patterns` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_ar` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kandora_fabric_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kandora_patterns`
--

INSERT INTO `kandora_patterns` (`id`, `title`, `title_ar`, `kandora_fabric_id`, `status_id`, `price`, `created_at`, `updated_at`) VALUES
(1, 'test', 'اختبار', '1', '1', 300.00, '2022-09-12 09:24:21', '2022-09-12 09:24:21'),
(2, 'Pattern', 'نمط', '2', '1', 300.00, '2022-09-12 12:01:30', '2022-09-12 12:01:30');

-- --------------------------------------------------------

--
-- Table structure for table `kandora_size_crystals`
--

DROP TABLE IF EXISTS `kandora_size_crystals`;
CREATE TABLE IF NOT EXISTS `kandora_size_crystals` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_ar` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_id` int(11) NOT NULL,
  `kandora_type_crystal_id` int(11) NOT NULL,
  `price` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kandora_size_crystals`
--

INSERT INTO `kandora_size_crystals` (`id`, `title`, `title_ar`, `status_id`, `kandora_type_crystal_id`, `price`, `created_at`, `updated_at`) VALUES
(1, 'test', 'اختبار', 1, 1, 333.00, '2022-09-18 14:04:17', '2022-09-18 14:04:17'),
(2, 'test one', 'اختبار واحد', 1, 2, 300.00, '2022-09-18 14:04:45', '2022-09-18 14:04:45');

-- --------------------------------------------------------

--
-- Table structure for table `kandora_sleeve_buttons`
--

DROP TABLE IF EXISTS `kandora_sleeve_buttons`;
CREATE TABLE IF NOT EXISTS `kandora_sleeve_buttons` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_ar` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_id` int(11) NOT NULL,
  `price` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kandora_sleeve_buttons`
--

INSERT INTO `kandora_sleeve_buttons` (`id`, `title`, `title_ar`, `status_id`, `price`, `created_at`, `updated_at`) VALUES
(1, 'test', 'اختبار', 1, 100.00, '2022-09-13 06:48:03', '2022-09-13 06:48:03');

-- --------------------------------------------------------

--
-- Table structure for table `kandora_sleeve_lengths`
--

DROP TABLE IF EXISTS `kandora_sleeve_lengths`;
CREATE TABLE IF NOT EXISTS `kandora_sleeve_lengths` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_ar` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_id` int(11) NOT NULL,
  `price` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kandora_sleeve_lengths`
--

INSERT INTO `kandora_sleeve_lengths` (`id`, `title`, `title_ar`, `status_id`, `price`, `created_at`, `updated_at`) VALUES
(1, 'test', 'اختبار', 1, 400.00, '2022-09-12 12:36:15', '2022-09-12 12:36:15');

-- --------------------------------------------------------

--
-- Table structure for table `kandora_type_crystals`
--

DROP TABLE IF EXISTS `kandora_type_crystals`;
CREATE TABLE IF NOT EXISTS `kandora_type_crystals` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_ar` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_id` int(11) NOT NULL,
  `kandora_design_id` int(11) NOT NULL,
  `price` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kandora_type_crystals`
--

INSERT INTO `kandora_type_crystals` (`id`, `title`, `title_ar`, `status_id`, `kandora_design_id`, `price`, `created_at`, `updated_at`) VALUES
(1, 'test', 'اختبار', 1, 1, 300.00, '2022-09-18 12:16:23', '2022-09-18 12:16:23'),
(2, 'test one', 'اختبار واحد', 1, 2, 300.00, '2022-09-18 12:17:36', '2022-09-18 12:17:36');

-- --------------------------------------------------------

--
-- Table structure for table `kandora_waist_shape_tights`
--

DROP TABLE IF EXISTS `kandora_waist_shape_tights`;
CREATE TABLE IF NOT EXISTS `kandora_waist_shape_tights` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_ar` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_id` int(11) NOT NULL,
  `price` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kandora_waist_shape_tights`
--

INSERT INTO `kandora_waist_shape_tights` (`id`, `title`, `title_ar`, `status_id`, `price`, `created_at`, `updated_at`) VALUES
(1, 'Test', 'اختبار', 1, 300.00, '2022-09-18 11:26:38', '2022-09-18 11:26:38');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
CREATE TABLE IF NOT EXISTS `languages` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `title`, `locale`, `created_at`, `updated_at`) VALUES
(1, 'English', 'en', NULL, NULL),
(2, 'Arabic', 'ar', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
CREATE TABLE IF NOT EXISTS `media` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `collection_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disk` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `conversions_disk` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` bigint(20) UNSIGNED NOT NULL,
  `manipulations` json NOT NULL,
  `custom_properties` json NOT NULL,
  `generated_conversions` json NOT NULL,
  `responsive_images` json NOT NULL,
  `order_column` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `media_uuid_unique` (`uuid`),
  KEY `media_model_type_model_id_index` (`model_type`,`model_id`),
  KEY `media_order_column_index` (`order_column`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`id`, `model_type`, `model_id`, `uuid`, `collection_name`, `name`, `file_name`, `mime_type`, `disk`, `conversions_disk`, `size`, `manipulations`, `custom_properties`, `generated_conversions`, `responsive_images`, `order_column`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\MediaRelation', 91, '35918c53-d3b4-47e2-ae08-9fd4693869c4', 'default', 'bjorn', 'bjorn.jpg', 'image/jpeg', 'public', 'public', 15439, '[]', '[]', '[]', '[]', 1, '2022-08-07 22:49:31', '2022-08-07 22:49:31'),
(2, 'App\\Models\\MediaRelation', 96, '350cb960-6b9e-481a-9a7f-4e97c1f2bc79', 'default', 'ceo-1-1', 'ceo-1-1.jpg', 'image/jpeg', 'public', 'public', 25372, '[]', '[]', '[]', '[]', 2, '2022-08-10 09:58:19', '2022-08-10 09:58:19'),
(3, 'App\\Models\\MediaRelation', 103, 'a0c0d18f-6a56-4dcf-9697-2ff4cecd2eab', 'default', 'corporate-governance-chart-pic-2', 'corporate-governance-chart-pic-2.svg', 'image/svg+xml', 'public', 'public', 93196, '[]', '[]', '[]', '[]', 3, '2022-08-10 11:49:31', '2022-08-10 11:49:31'),
(4, 'App\\Models\\MediaRelation', 104, 'd765b387-9f9c-45e5-ba0b-68791d38d01e', 'default', 'drilling-icon', 'drilling-icon.svg', 'image/svg+xml', 'public', 'public', 91948, '[]', '[]', '[]', '[]', 4, '2022-08-10 11:49:50', '2022-08-10 11:49:50'),
(5, 'App\\Models\\MediaRelation', 105, 'e8316620-acc4-490f-8379-95344ccf8ee9', 'default', 'corporate-governance-chart-pic-2', 'corporate-governance-chart-pic-2.svg', 'image/svg+xml', 'public', 'public', 93196, '[]', '[]', '[]', '[]', 5, '2022-08-10 11:50:17', '2022-08-10 11:50:17'),
(6, 'App\\Models\\MediaRelation', 106, '432413a7-c4af-457f-83e7-3b9e7b0303fa', 'default', 'facebook', 'facebook.svg', 'image/svg+xml', 'public', 'public', 370, '[]', '[]', '[]', '[]', 6, '2022-08-10 11:50:40', '2022-08-10 11:50:40'),
(7, 'App\\Models\\MediaRelation', 103, 'aed09ed4-0c5e-473a-a561-ea96ac8eb987', 'default', 'home-about1', 'home-about1.webp', 'image/webp', 'public', 'public', 24560, '[]', '[]', '[]', '[]', 7, '2022-08-10 17:58:12', '2022-08-10 17:58:12'),
(8, 'App\\Models\\MediaRelation', 104, '79b5e76d-993f-4c7f-bb9c-6b865bd16170', 'default', 'home-about2', 'home-about2.webp', 'image/webp', 'public', 'public', 32596, '[]', '[]', '[]', '[]', 8, '2022-08-10 18:02:43', '2022-08-10 18:02:43'),
(9, 'App\\Models\\MediaRelation', 105, '332acbdc-42ea-47c3-b90e-4a8835dfb96f', 'default', 'home-product-gallery4', 'home-product-gallery4.webp', 'image/webp', 'public', 'public', 67040, '[]', '[]', '[]', '[]', 9, '2022-08-10 19:15:18', '2022-08-10 19:15:18'),
(10, 'App\\Models\\MediaRelation', 106, 'bb0eea2f-1cc3-4557-a8d8-1fef7e41158a', 'default', 'home-product-thumb4', 'home-product-thumb4.webp', 'image/webp', 'public', 'public', 17588, '[]', '[]', '[]', '[]', 10, '2022-08-10 19:15:32', '2022-08-10 19:15:32'),
(11, 'App\\Models\\MediaRelation', 107, 'e50796b2-1805-4b24-8d8b-37432678c539', 'default', 'detail-slide1', 'detail-slide1.jpg', 'image/jpeg', 'public', 'public', 121575, '[]', '[]', '[]', '[]', 11, '2022-08-10 19:17:12', '2022-08-10 19:17:12'),
(12, 'App\\Models\\MediaRelation', 108, 'c19023e6-35a9-4c25-98b5-0b2415463f3c', 'default', 'detail-slide2', 'detail-slide2.jpg', 'image/jpeg', 'public', 'public', 121575, '[]', '[]', '[]', '[]', 12, '2022-08-10 19:17:18', '2022-08-10 19:17:18'),
(13, 'App\\Models\\MediaRelation', 113, 'eb7388ec-d937-4689-9cd1-14c0613cfd2b', 'default', 'jazair-tailors', 'jazair-tailors.jpg', 'image/jpeg', 'public', 'public', 304611, '[]', '[]', '[]', '[]', 13, '2022-08-10 20:07:35', '2022-08-10 20:07:35'),
(14, 'App\\Models\\MediaRelation', 115, '614f0dd6-b762-45f5-b5cd-80b9bda0f6fa', 'default', '4', '4.jpg', 'image/jpeg', 'public', 'public', 155435, '[]', '[]', '[]', '[]', 14, '2022-08-10 20:07:50', '2022-08-10 20:07:50'),
(15, 'App\\Models\\MediaRelation', 114, '444eca83-a7d4-447e-af3f-b460431d2f81', 'default', '2', '2.jpg', 'image/jpeg', 'public', 'public', 148650, '[]', '[]', '[]', '[]', 14, '2022-08-10 20:07:50', '2022-08-10 20:07:50'),
(16, 'App\\Models\\MediaRelation', 116, 'b6adb889-faa1-414b-b941-64786cbe858a', 'default', '1', '1.jpg', 'image/jpeg', 'public', 'public', 160126, '[]', '[]', '[]', '[]', 14, '2022-08-10 20:07:50', '2022-08-10 20:07:50'),
(17, 'App\\Models\\MediaRelation', 117, 'ac6cad86-fa7e-42a2-8624-074bc80e576b', 'default', '5', '5.jpg', 'image/jpeg', 'public', 'public', 160126, '[]', '[]', '[]', '[]', 15, '2022-08-10 20:07:50', '2022-08-10 20:07:50'),
(18, 'App\\Models\\MediaRelation', 118, 'c0456778-b361-4fbe-95df-df5ce38342c7', 'default', '3', '3.jpg', 'image/jpeg', 'public', 'public', 116794, '[]', '[]', '[]', '[]', 16, '2022-08-10 20:07:50', '2022-08-10 20:07:50'),
(19, 'App\\Models\\MediaRelation', 125, '7f42a5f7-7bb3-4ea5-a96c-829049705680', 'default', 'home-testimonial3', 'home-testimonial3.webp', 'image/webp', 'public', 'public', 7426, '[]', '[]', '[]', '[]', 17, '2022-08-10 22:20:12', '2022-08-10 22:20:12'),
(20, 'App\\Models\\MediaRelation', 126, 'f9499aa8-af65-4ee1-a0a8-c7ba15c59ce7', 'default', 'card1', 'card1.webp', 'image/webp', 'public', 'public', 1724, '[]', '[]', '[]', '[]', 18, '2022-08-10 22:20:25', '2022-08-10 22:20:25'),
(21, 'App\\Models\\MediaRelation', 129, '680d7c9e-5174-4261-a465-219b15cbc7e6', 'default', 'about-us', 'about-us.webp', 'image/webp', 'public', 'public', 747508, '[]', '[]', '[]', '[]', 19, '2022-08-11 09:46:33', '2022-08-11 09:46:33'),
(22, 'App\\Models\\MediaRelation', 130, 'fa11c4b8-3651-4d26-bcd7-82b266145e65', 'default', 'approach-img', 'approach-img.webp', 'image/webp', 'public', 'public', 376968, '[]', '[]', '[]', '[]', 20, '2022-08-11 09:47:20', '2022-08-11 09:47:20'),
(23, 'App\\Models\\MediaRelation', 131, 'b28f5956-bd50-4fb9-bff3-b40de7805623', 'default', 'mission-vision', 'mission-vision.webp', 'image/webp', 'public', 'public', 432738, '[]', '[]', '[]', '[]', 21, '2022-08-11 09:48:00', '2022-08-11 09:48:00'),
(24, 'App\\Models\\MediaRelation', 132, '5d34eeaf-7083-4363-96af-7eac511b526e', 'default', 'management', 'management.webp', 'image/webp', 'public', 'public', 255568, '[]', '[]', '[]', '[]', 22, '2022-08-11 09:48:47', '2022-08-11 09:48:47'),
(25, 'App\\Models\\MediaRelation', 133, '1ea1d07b-9618-458e-8cd2-0ac253e814b9', 'default', 'shop', 'shop.webp', 'image/webp', 'public', 'public', 1546880, '[]', '[]', '[]', '[]', 23, '2022-08-11 10:01:35', '2022-08-11 10:01:35'),
(26, 'App\\Models\\MediaRelation', 134, '9af77cca-31bc-492c-8631-1e88c463613e', 'default', 'tailors', 'tailors.webp', 'image/webp', 'public', 'public', 45092, '[]', '[]', '[]', '[]', 24, '2022-08-11 10:06:18', '2022-08-11 10:06:18'),
(27, 'App\\Models\\MediaRelation', 135, 'f474822e-09be-4c58-8f66-73dfa5064136', 'default', 'tailors', 'tailors.webp', 'image/webp', 'public', 'public', 45092, '[]', '[]', '[]', '[]', 25, '2022-08-11 10:06:26', '2022-08-11 10:06:26'),
(28, 'App\\Models\\MediaRelation', 136, 'e783562e-b786-4204-89aa-79351edd45ab', 'default', 'testimonials', 'testimonials.webp', 'image/webp', 'public', 'public', 95360, '[]', '[]', '[]', '[]', 26, '2022-08-11 10:17:46', '2022-08-11 10:17:46'),
(29, 'App\\Models\\MediaRelation', 137, '0061ee22-899c-440e-be6a-dbf148c4afb9', 'default', 'contact-us', 'contact-us.webp', 'image/webp', 'public', 'public', 49066, '[]', '[]', '[]', '[]', 27, '2022-08-11 12:36:26', '2022-08-11 12:36:26'),
(30, 'App\\Models\\MediaRelation', 138, '06b30ea7-416a-43b4-882d-ea124bf84349', 'default', 'logo', 'logo.svg', 'image/svg+xml', 'public', 'public', 99255, '[]', '[]', '[]', '[]', 28, '2022-08-11 16:20:01', '2022-08-11 16:20:01'),
(31, 'App\\Models\\MediaRelation', 139, 'ac63d4bc-9660-4c56-ba3e-f6706cedea4d', 'default', 'footer-logo', 'footer-logo.svg', 'image/svg+xml', 'public', 'public', 68754, '[]', '[]', '[]', '[]', 29, '2022-08-11 16:20:32', '2022-08-11 16:20:32'),
(32, 'App\\Models\\MediaRelation', 140, 'ccb0ae49-a23f-4fec-a5ba-134a9587996a', 'default', 'footer-icon1', 'footer-icon1.svg', 'image/svg+xml', 'public', 'public', 3966, '[]', '[]', '[]', '[]', 30, '2022-08-11 16:25:19', '2022-08-11 16:25:19'),
(33, 'App\\Models\\MediaRelation', 141, 'c909f0fd-4cfe-42e8-851f-622cafd80704', 'default', 'footer-icon2', 'footer-icon2.svg', 'image/svg+xml', 'public', 'public', 7005, '[]', '[]', '[]', '[]', 31, '2022-08-11 16:25:25', '2022-08-11 16:25:25'),
(34, 'App\\Models\\MediaRelation', 142, '24c0b8ab-cb1a-4c54-a46b-c7c475966fec', 'default', 'footer-icon3', 'footer-icon3.svg', 'image/svg+xml', 'public', 'public', 4542, '[]', '[]', '[]', '[]', 32, '2022-08-11 16:25:32', '2022-08-11 16:25:32'),
(35, 'App\\Models\\MediaRelation', 143, '3aaf3f78-26f6-4d97-98f4-fe7644af336b', 'default', 'footer-twitter', 'footer-twitter.svg', 'image/svg+xml', 'public', 'public', 1258, '[]', '[]', '[]', '[]', 33, '2022-08-11 16:28:22', '2022-08-11 16:28:22'),
(36, 'App\\Models\\MediaRelation', 144, 'fde3b392-0082-46c6-9650-d235478429a1', 'default', 'footer-facebook', 'footer-facebook.svg', 'image/svg+xml', 'public', 'public', 608, '[]', '[]', '[]', '[]', 34, '2022-08-11 16:28:31', '2022-08-11 16:28:31'),
(37, 'App\\Models\\MediaRelation', 145, '16abe2cf-1b55-4b86-a03e-ab97c203e2fa', 'default', 'footer-youtube', 'footer-youtube.svg', 'image/svg+xml', 'public', 'public', 970, '[]', '[]', '[]', '[]', 35, '2022-08-11 16:28:38', '2022-08-11 16:28:38'),
(38, 'App\\Models\\MediaRelation', 146, 'bd5279e4-94ba-4e99-9c2c-8fd57cbfbf2a', 'default', 'footer-instagram', 'footer-instagram.svg', 'image/svg+xml', 'public', 'public', 3248, '[]', '[]', '[]', '[]', 36, '2022-08-11 16:28:48', '2022-08-11 16:28:48'),
(39, 'App\\Models\\MediaRelation', 129, '4ef6050b-eb48-4593-8734-8f30e47816c5', 'default', 'hero-slide1', 'hero-slide1.webp', 'image/webp', 'public', 'public', 127160, '[]', '[]', '[]', '[]', 37, '2022-08-12 10:35:48', '2022-08-12 10:35:48'),
(40, 'App\\Models\\MediaRelation', 130, '67787c4f-af7d-4cdb-aa86-906f44e7cc2a', 'default', 'work-step1', 'work-step1.svg', 'image/svg+xml', 'public', 'public', 4160, '[]', '[]', '[]', '[]', 38, '2022-08-12 13:03:05', '2022-08-12 13:03:05'),
(41, 'App\\Models\\MediaRelation', 131, 'a7720a69-96e7-46f7-9838-44a4c03af174', 'default', 'work-step-gallery1', 'work-step-gallery1.webp', 'image/webp', 'public', 'public', 17318, '[]', '[]', '[]', '[]', 39, '2022-08-12 13:07:43', '2022-08-12 13:07:43'),
(42, 'App\\Models\\MediaRelation', 132, 'a00a862d-290d-4012-98fc-b1ea1c23b902', 'default', 'work-step-gallery1', 'work-step-gallery1.webp', 'image/webp', 'public', 'public', 17318, '[]', '[]', '[]', '[]', 40, '2022-08-12 14:13:33', '2022-08-12 14:13:33'),
(43, 'App\\Models\\MediaRelation', 187, 'b44e2a80-9da0-4ec2-86b0-e8473edbde63', 'default', 'contact-us-sec', 'contact-us-sec.webp', 'image/webp', 'public', 'public', 43430, '[]', '[]', '[]', '[]', 41, '2022-08-15 20:11:57', '2022-08-15 20:11:57'),
(44, 'App\\Models\\MediaRelation', 187, 'f2171dbd-286c-4177-a3f5-dbae8f063e8f', 'default', 'shop-details', 'shop-details.webp', 'image/webp', 'public', 'public', 1169838, '[]', '[]', '[]', '[]', 42, '2022-08-16 07:42:14', '2022-08-16 07:42:14'),
(45, 'App\\Models\\MediaRelation', 188, 'ad71d655-c1b2-41a8-b8c2-906530ae40ad', 'default', 'quality', 'quality.svg', 'image/svg+xml', 'public', 'public', 1819, '[]', '[]', '[]', '[]', 43, '2022-08-16 08:19:58', '2022-08-16 08:19:58'),
(46, 'App\\Models\\MediaRelation', 189, 'f946a5e1-26cd-4ab1-aeae-b67f9ce8f5a4', 'default', 'on-time', 'on-time.svg', 'image/svg+xml', 'public', 'public', 6717, '[]', '[]', '[]', '[]', 44, '2022-08-16 08:20:09', '2022-08-16 08:20:09'),
(47, 'App\\Models\\MediaRelation', 190, '69440a4f-6c5a-498a-9abf-31a59f77de72', 'default', 'sticted', 'sticted.svg', 'image/svg+xml', 'public', 'public', 9730, '[]', '[]', '[]', '[]', 45, '2022-08-16 08:20:18', '2022-08-16 08:20:18'),
(48, 'App\\Models\\Customer', 1, 'd7fedb25-483a-4d8f-b288-b32bb8894f11', 'main', 'about-3', 'about-3.jpg', 'image/jpeg', 'public', 'public', 138484, '[]', '[]', '[]', '[]', 46, '2022-08-19 14:05:40', '2022-08-19 14:05:40'),
(54, 'App\\Models\\Customer', 1, 'f800b882-4837-4d0e-8f2b-c57c7bdf366e', 'profile', 'video-img', 'video-img.jpg', 'image/jpeg', 'main', 'main', 263310, '[]', '[]', '[]', '[]', 47, '2022-08-19 14:37:25', '2022-08-19 14:37:25'),
(55, 'App\\Models\\MediaRelation', 192, '58e12023-bc1f-49ec-a04a-599e706588a2', 'default', 'about-1', 'about-1.jpg', 'image/jpeg', 'public', 'public', 130924, '[]', '[]', '[]', '[]', 48, '2022-08-20 19:15:56', '2022-08-20 19:15:56'),
(56, 'App\\Models\\MediaRelation', 193, '7f60f333-11b9-4dcb-85e1-2ab9146d145b', 'default', 'about-3', 'about-3.jpg', 'image/jpeg', 'public', 'public', 138484, '[]', '[]', '[]', '[]', 49, '2022-08-20 19:16:12', '2022-08-20 19:16:12'),
(57, 'App\\Models\\MediaRelation', 194, 'f7b34072-ea5c-422a-83d8-b276531df8f9', 'default', 'banner1-min', 'banner1-min.jpg', 'image/jpeg', 'public', 'public', 258000, '[]', '[]', '[]', '[]', 50, '2022-08-20 19:18:15', '2022-08-20 19:18:15'),
(58, 'App\\Models\\MediaRelation', 195, 'b48cf350-a625-433c-84bc-30ff178f786e', 'default', 'blog-banner', 'blog-banner.jpg', 'image/jpeg', 'public', 'public', 299382, '[]', '[]', '[]', '[]', 50, '2022-08-20 19:18:15', '2022-08-20 19:18:15'),
(59, 'App\\Models\\MediaRelation', 196, '2f3f586c-17c9-4b24-8ccc-974bda51c621', 'default', 'banner1', 'banner1.jpg', 'image/jpeg', 'public', 'public', 1327618, '[]', '[]', '[]', '[]', 50, '2022-08-20 19:18:15', '2022-08-20 19:18:15'),
(60, 'App\\Models\\MediaRelation', 201, '81de199e-4670-4688-959e-83044a226545', 'default', 'banner1', 'banner1.jpg', 'image/jpeg', 'public', 'public', 1327618, '[]', '[]', '[]', '[]', 51, '2022-08-21 00:57:23', '2022-08-21 00:57:23'),
(61, 'App\\Models\\MediaRelation', 202, 'a9d9d28b-7154-4e67-a9e8-f18e0aa2ecc4', 'default', 'about', 'about.jpg', 'image/jpeg', 'public', 'public', 951329, '[]', '[]', '[]', '[]', 52, '2022-08-21 00:57:48', '2022-08-21 00:57:48'),
(62, 'App\\Models\\MediaRelation', 203, '87e23f54-a8d5-49ba-80e8-a81bf9fc5ad1', 'default', 'about-4', 'about-4.jpg', 'image/jpeg', 'public', 'public', 116665, '[]', '[]', '[]', '[]', 52, '2022-08-21 00:57:48', '2022-08-21 00:57:48'),
(63, 'App\\Models\\MediaRelation', 204, '239cd0b4-b1c3-4777-b91a-e0e9ddbca4b7', 'default', 'about-head', 'about-head.jpg', 'image/jpeg', 'public', 'public', 381043, '[]', '[]', '[]', '[]', 53, '2022-08-21 00:57:48', '2022-08-21 00:57:48'),
(64, 'App\\Models\\MediaRelation', 205, 'a5c26b2e-5537-4dd2-845a-331f1b6f7498', 'default', 'family-trip-4', 'family-trip-4.jpg', 'image/jpeg', 'public', 'public', 83611, '[]', '[]', '[]', '[]', 54, '2022-08-21 00:58:28', '2022-08-21 00:58:28'),
(65, 'App\\Models\\MediaRelation', 206, '57f4b8e4-718a-4c01-a5f8-dd18bb26e824', 'default', 'family-trip-3', 'family-trip-3.jpg', 'image/jpeg', 'public', 'public', 57441, '[]', '[]', '[]', '[]', 55, '2022-08-21 00:58:28', '2022-08-21 00:58:28'),
(66, 'App\\Models\\MediaRelation', 207, 'f09e94d8-9ed0-4b5c-97f3-07a3ef52b0aa', 'default', 'family-trip-5', 'family-trip-5.jpg', 'image/jpeg', 'public', 'public', 35409, '[]', '[]', '[]', '[]', 56, '2022-08-21 00:58:28', '2022-08-21 00:58:28'),
(67, 'App\\Models\\MediaRelation', 212, 'b2aea805-1118-40bb-a72b-269549f5fd6d', 'default', 'jazair-tailors', 'jazair-tailors.jpg', 'image/jpeg', 'public', 'public', 304611, '[]', '[]', '[]', '[]', 57, '2022-08-21 01:04:02', '2022-08-21 01:04:02'),
(68, 'App\\Models\\Customer', 3, 'edf1c455-2920-46a8-b5c2-267ee472328f', 'profile', '2', '2.jpg', 'image/jpeg', 'main', 'main', 148650, '[]', '[]', '[]', '[]', 58, '2022-08-20 20:13:25', '2022-08-20 20:13:25'),
(69, 'App\\Models\\MediaRelation', 214, '59492961-3bde-48ac-8e96-31251fb2e62b', 'default', 'faq', 'faq.webp', 'image/webp', 'public', 'public', 27162, '[]', '[]', '[]', '[]', 59, '2022-08-21 14:09:44', '2022-08-21 14:09:44'),
(70, 'App\\Models\\MediaRelation', 215, '2a02d5e9-e72d-44dd-b2e5-9db7c9574c99', 'default', 'faq', 'faq.webp', 'image/webp', 'public', 'public', 27162, '[]', '[]', '[]', '[]', 60, '2022-08-21 14:09:56', '2022-08-21 14:09:56'),
(71, 'App\\Models\\MediaRelation', 216, '2706a650-0d28-4b9d-b54f-0fb54abd3a3e', 'default', 'faq', 'faq.webp', 'image/webp', 'public', 'public', 27162, '[]', '[]', '[]', '[]', 61, '2022-08-21 14:34:46', '2022-08-21 14:34:46'),
(72, 'App\\Models\\MediaRelation', 217, 'cde1abdd-34aa-4ef5-b1e3-3d7de9c52586', 'default', 'faq', 'faq.webp', 'image/webp', 'public', 'public', 27162, '[]', '[]', '[]', '[]', 62, '2022-08-21 14:34:58', '2022-08-21 14:34:58'),
(73, 'App\\Models\\MediaRelation', 214, '6ea3d4c9-2fd4-4c52-b487-7e8d858c54a0', 'default', 'faq', 'faq.webp', 'image/webp', 'public', 'public', 27162, '[]', '[]', '[]', '[]', 63, '2022-08-23 06:23:38', '2022-08-23 06:23:38'),
(74, 'App\\Models\\MediaRelation', 214, 'd06405c5-c184-4994-9097-9952cefa7380', 'default', 'testimonials', 'testimonials.webp', 'image/webp', 'public', 'public', 95360, '[]', '[]', '[]', '[]', 64, '2022-08-24 15:14:18', '2022-08-24 15:14:18'),
(75, 'App\\Models\\Customer', 12, '7191b9b9-542f-4e34-b19f-35a21fa52a1b', 'profile', 'IMG_6401', 'IMG_6401.JPG', 'image/jpeg', 'main', 'main', 2753491, '[]', '[]', '[]', '[]', 65, '2022-08-26 09:24:30', '2022-08-26 09:24:30'),
(84, 'App\\Models\\Customer', 13, '47ee54b2-4bc2-4620-ac1a-ad1ab4dcffbc', 'profile', 'IMG_6207', 'IMG_6207.JPG', 'image/jpeg', 'main', 'main', 3163385, '[]', '[]', '[]', '[]', 66, '2022-08-29 07:04:28', '2022-08-29 07:04:28'),
(85, 'App\\Models\\MediaRelation', 219, 'cde55913-f40d-4db4-88eb-e59bbfad4e14', 'default', 'image', 'image.jpg', 'image/jpeg', 'public', 'public', 2388359, '[]', '[]', '[]', '[]', 67, '2022-09-02 13:02:02', '2022-09-02 13:02:02'),
(86, 'App\\Models\\MediaRelation', 220, '60f8e944-1186-4cbc-aff0-64ea53b3b741', 'default', 'image', 'image.jpg', 'image/jpeg', 'public', 'public', 2388359, '[]', '[]', '[]', '[]', 68, '2022-09-02 13:02:15', '2022-09-02 13:02:15'),
(89, 'App\\Models\\Customer', 19, '670dd1c2-3635-4c7c-97a3-a2bbf9529686', 'profile', 'listing_placeholder', 'listing_placeholder.jpeg', 'image/jpeg', 'main', 'main', 11567, '[]', '[]', '[]', '[]', 69, '2022-09-25 09:47:22', '2022-09-25 09:47:22'),
(90, 'App\\Models\\MediaRelation', 242, 'b51971ae-7ce4-47ed-a823-e2fc588870c4', 'default', 'api-logo', 'api-logo.png', 'image/png', 'public', 'public', 9512, '[]', '[]', '{\"thumb\": true}', '[]', 70, '2022-09-30 11:20:31', '2022-09-30 11:20:31'),
(91, 'App\\Models\\MediaRelation', 243, 'ad17fcca-e542-438e-9d2a-2bac1e366575', 'default', 'award_1', 'award_1.jpg', 'image/jpeg', 'public', 'public', 79288, '[]', '[]', '{\"thumb\": true}', '[]', 71, '2022-09-30 11:25:03', '2022-09-30 11:25:04');

-- --------------------------------------------------------

--
-- Table structure for table `media_relations`
--

DROP TABLE IF EXISTS `media_relations`;
CREATE TABLE IF NOT EXISTS `media_relations` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `media_id` int(11) DEFAULT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_id` bigint(20) UNSIGNED DEFAULT NULL,
  `order` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `collection` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `media_relations_model_type_model_id_index` (`model_type`,`model_id`)
) ENGINE=InnoDB AUTO_INCREMENT=242 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media_relations`
--

INSERT INTO `media_relations` (`id`, `media_id`, `model_type`, `model_id`, `order`, `collection`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL, NULL, NULL, '2022-07-14 09:16:27', '2022-07-14 09:16:27'),
(2, 1, NULL, NULL, NULL, NULL, '2022-07-14 09:17:16', '2022-07-14 09:17:16'),
(3, 1, NULL, NULL, NULL, NULL, '2022-07-14 09:17:37', '2022-07-14 09:17:37'),
(4, 1, NULL, NULL, NULL, NULL, '2022-07-14 09:19:20', '2022-07-14 09:19:20'),
(5, 1, NULL, NULL, NULL, NULL, '2022-07-14 09:19:51', '2022-07-14 09:19:51'),
(6, 1, NULL, NULL, NULL, NULL, '2022-07-14 09:20:46', '2022-07-14 09:20:46'),
(7, 1, NULL, NULL, NULL, NULL, '2022-07-14 09:21:03', '2022-07-14 09:21:03'),
(8, 1, NULL, NULL, NULL, NULL, '2022-07-14 09:21:23', '2022-07-14 09:21:23'),
(9, 6, NULL, NULL, NULL, NULL, '2022-07-14 09:25:32', '2022-07-14 09:25:32'),
(10, 7, NULL, NULL, NULL, NULL, '2022-07-14 09:35:23', '2022-07-14 09:35:23'),
(11, 8, NULL, NULL, NULL, NULL, '2022-07-14 09:35:23', '2022-07-14 09:35:23'),
(12, 9, NULL, NULL, NULL, NULL, '2022-07-14 09:35:24', '2022-07-14 09:35:24'),
(13, 10, NULL, NULL, NULL, NULL, '2022-07-14 09:35:24', '2022-07-14 09:35:24'),
(14, 11, NULL, NULL, NULL, NULL, '2022-07-16 14:30:26', '2022-07-16 14:30:26'),
(15, 1, NULL, NULL, NULL, NULL, '2022-07-16 14:30:27', '2022-07-16 14:30:27'),
(16, 12, NULL, NULL, NULL, NULL, '2022-07-16 14:30:27', '2022-07-16 14:30:27'),
(17, 13, NULL, NULL, NULL, NULL, '2022-07-16 14:30:27', '2022-07-16 14:30:27'),
(18, 15, NULL, NULL, NULL, NULL, '2022-07-16 14:30:27', '2022-07-16 14:30:27'),
(19, 14, NULL, NULL, NULL, NULL, '2022-07-16 14:30:27', '2022-07-16 14:30:27'),
(20, 16, NULL, NULL, NULL, NULL, '2022-07-16 14:30:27', '2022-07-16 14:30:27'),
(21, 17, NULL, NULL, NULL, NULL, '2022-07-16 14:30:52', '2022-07-16 14:30:52'),
(22, 18, NULL, NULL, NULL, NULL, '2022-07-16 14:31:00', '2022-07-16 14:31:00'),
(23, 21, NULL, NULL, NULL, NULL, '2022-07-16 14:31:00', '2022-07-16 14:31:00'),
(24, 20, NULL, NULL, NULL, NULL, '2022-07-16 14:31:00', '2022-07-16 14:31:00'),
(25, 22, NULL, NULL, NULL, NULL, '2022-07-16 14:31:00', '2022-07-16 14:31:00'),
(26, 19, NULL, NULL, NULL, NULL, '2022-07-16 14:31:00', '2022-07-16 14:31:00'),
(27, 1, NULL, NULL, NULL, NULL, '2022-07-16 14:31:01', '2022-07-16 14:31:01'),
(28, 23, NULL, NULL, NULL, NULL, '2022-07-20 10:28:27', '2022-07-20 10:28:27'),
(29, 24, NULL, NULL, NULL, NULL, '2022-07-20 10:29:19', '2022-07-20 10:29:19'),
(35, 25, 'App\\Models\\User', 164, '1', 'avatar', '2022-08-02 10:07:18', '2022-08-02 10:07:18'),
(36, 26, 'App\\Models\\User', 164, '2', 'avatar', '2022-08-02 10:07:18', '2022-08-02 10:07:18'),
(37, 29, 'App\\Models\\User', 164, '1', 'profile_image', '2022-08-02 10:07:18', '2022-08-02 10:07:18'),
(39, 29, 'App\\Models\\ProductColor', 4, '1', 'profile_image', '2022-08-03 09:31:54', '2022-08-03 09:31:54'),
(40, 25, 'App\\Models\\ProductColor', 5, '1', 'profile_image', '2022-08-03 10:42:05', '2022-08-03 10:42:05'),
(46, 29, 'App\\Models\\Tailor', 3, '1', 'main_image', '2022-08-03 15:02:35', '2022-08-14 12:58:46'),
(47, 26, 'App\\Models\\Tailor', 3, '1', 'gallery', '2022-08-03 15:02:35', '2022-08-14 12:58:46'),
(48, 25, 'App\\Models\\Tailor', 3, '3', 'gallery', '2022-08-03 15:02:35', '2022-08-14 12:58:46'),
(49, 29, 'App\\Models\\Tailor', 3, '2', 'gallery', '2022-08-03 15:02:35', '2022-08-14 12:58:46'),
(59, 26, 'App\\Models\\ProductColor', 6, '1', 'profile_image', '2022-08-04 12:55:30', '2022-08-04 12:55:30'),
(63, 29, 'App\\Models\\KandoraDesign', 4, '1', 'image', '2022-08-05 06:20:06', '2022-08-05 06:23:19'),
(65, 29, 'App\\Models\\KandoraPattern', 3, '1', 'image', '2022-08-05 09:41:11', '2022-08-05 09:41:11'),
(67, 29, 'App\\Models\\KandoraPattern', 4, '1', 'image', '2022-08-05 09:43:46', '2022-08-05 09:43:46'),
(68, 29, 'App\\Models\\KandoraDesignSleeve', 2, '1', 'image', '2022-08-05 10:38:06', '2022-08-05 10:38:06'),
(70, 26, 'App\\Models\\KandoraDesignSleeve', 3, '1', 'image', '2022-08-05 11:11:25', '2022-08-05 11:11:25'),
(73, 26, 'App\\Models\\KandoraSleeveLength', 2, '1', 'image', '2022-08-05 12:00:49', '2022-08-05 12:00:49'),
(74, 26, 'App\\Models\\KandoraSleeveLength', 3, '1', 'image', '2022-08-05 12:02:51', '2022-08-05 12:02:51'),
(75, 29, 'App\\Models\\KandoraSleeveLength', 4, '1', 'image', '2022-08-05 12:03:21', '2022-08-05 12:03:30'),
(76, 26, 'App\\Models\\KandoraSleeveLength', 5, '1', 'image', '2022-08-05 12:03:54', '2022-08-05 12:03:54'),
(78, 29, 'App\\Models\\KandoraNeckShape', 2, '1', 'image', '2022-08-05 12:41:39', '2022-08-05 12:41:39'),
(79, 29, 'App\\Models\\KandoraNeckShape', 3, '1', 'image', '2022-08-05 12:42:00', '2022-08-05 12:42:00'),
(81, 29, 'App\\Models\\KandoraNeckFrontLength', 2, '1', 'image', '2022-08-05 13:40:20', '2022-08-05 13:40:20'),
(86, 26, 'App\\Models\\KandoraWaistShapeTight', 2, '1', 'image', '2022-08-05 15:04:59', '2022-08-05 15:05:06'),
(94, 1, 'App\\Models\\Testimonail', 1, '1', 'image', '2022-08-09 19:44:40', '2022-08-09 20:02:27'),
(95, 1, 'App\\Models\\Testimonail', 1, '1', 'image_thumb', '2022-08-09 19:44:40', '2022-08-09 20:02:27'),
(97, 2, 'App\\Models\\Product', 3, '1', 'gallery', '2022-08-10 09:58:30', '2022-08-10 09:59:05'),
(98, 1, 'App\\Models\\Product', 3, '2', 'gallery', '2022-08-10 09:58:30', '2022-08-10 09:59:05'),
(99, 2, 'App\\Models\\Product', 3, '1', 'featured_image', '2022-08-10 09:59:05', '2022-08-10 09:59:05'),
(100, 2, 'App\\Models\\Product', 3, '1', 'featured_image_thumb', '2022-08-10 09:59:05', '2022-08-10 09:59:05'),
(101, 2, 'App\\Models\\Testimonial', 1, '1', 'image', '2022-08-10 10:43:32', '2022-08-10 10:53:18'),
(102, 1, 'App\\Models\\Testimonial', 1, '1', 'image_thumb', '2022-08-10 10:43:32', '2022-08-10 10:53:18'),
(109, 9, 'App\\Models\\Product', 4, '1', 'featured_image', '2022-08-10 19:21:55', '2022-08-15 09:57:16'),
(110, 10, 'App\\Models\\Product', 4, '1', 'featured_image_thumb', '2022-08-10 19:21:55', '2022-08-15 09:57:16'),
(111, 12, 'App\\Models\\Product', 4, '1', 'gallery', '2022-08-10 19:21:55', '2022-08-15 09:57:16'),
(112, 11, 'App\\Models\\Product', 4, '2', 'gallery', '2022-08-10 19:21:55', '2022-08-15 09:57:16'),
(119, 13, 'App\\Models\\Tailor', 1, '1', 'main_image', '2022-08-10 20:48:25', '2022-08-10 20:48:25'),
(120, 13, 'App\\Models\\Tailor', 2, '1', 'main_image', '2022-08-10 20:50:19', '2022-08-15 09:59:44'),
(121, 14, 'App\\Models\\Tailor', 2, '1', 'gallery', '2022-08-10 20:50:19', '2022-08-15 09:59:44'),
(122, 15, 'App\\Models\\Tailor', 2, '2', 'gallery', '2022-08-10 20:50:19', '2022-08-15 09:59:44'),
(123, 16, 'App\\Models\\Tailor', 2, '3', 'gallery', '2022-08-10 20:50:19', '2022-08-15 09:59:44'),
(124, 18, 'App\\Models\\Tailor', 2, '4', 'gallery', '2022-08-10 20:50:19', '2022-08-15 09:59:44'),
(127, 19, 'App\\Models\\Testimonial', 2, '1', 'image', '2022-08-10 22:20:41', '2022-09-21 09:20:44'),
(128, 20, 'App\\Models\\Testimonial', 2, '1', 'image_thumb', '2022-08-10 22:20:41', '2022-09-21 09:20:44'),
(133, 9, 'App\\Models\\Product', 6, '1', 'featured_image', '2022-08-12 16:00:39', '2022-08-15 09:57:30'),
(134, 10, 'App\\Models\\Product', 6, '1', 'featured_image_thumb', '2022-08-12 16:00:39', '2022-08-15 09:57:30'),
(135, 12, 'App\\Models\\Product', 6, '1', 'gallery', '2022-08-12 16:00:39', '2022-08-15 09:57:30'),
(136, 11, 'App\\Models\\Product', 6, '2', 'gallery', '2022-08-12 16:00:39', '2022-08-15 09:57:30'),
(137, 9, 'App\\Models\\Product', 7, '1', 'featured_image', '2022-08-12 16:01:47', '2022-08-15 09:57:38'),
(138, 10, 'App\\Models\\Product', 7, '1', 'featured_image_thumb', '2022-08-12 16:01:47', '2022-08-15 09:57:38'),
(139, 12, 'App\\Models\\Product', 7, '1', 'gallery', '2022-08-12 16:01:47', '2022-08-15 09:57:39'),
(140, 11, 'App\\Models\\Product', 7, '2', 'gallery', '2022-08-12 16:01:47', '2022-08-15 09:57:39'),
(141, 9, 'App\\Models\\Product', 8, '1', 'featured_image', '2022-08-12 20:50:37', '2022-08-15 09:58:05'),
(142, 10, 'App\\Models\\Product', 8, '1', 'featured_image_thumb', '2022-08-12 20:50:37', '2022-08-15 09:58:05'),
(143, 12, 'App\\Models\\Product', 8, '1', 'gallery', '2022-08-12 20:50:37', '2022-08-15 09:58:05'),
(144, 11, 'App\\Models\\Product', 8, '2', 'gallery', '2022-08-12 20:50:37', '2022-08-15 09:58:05'),
(145, 13, 'App\\Models\\Tailor', 4, '1', 'main_image', '2022-08-14 12:56:56', '2022-08-15 09:59:58'),
(146, 15, 'App\\Models\\Tailor', 4, '1', 'gallery', '2022-08-14 12:56:56', '2022-08-15 09:59:58'),
(147, 16, 'App\\Models\\Tailor', 4, '2', 'gallery', '2022-08-14 12:56:56', '2022-08-15 09:59:58'),
(148, 18, 'App\\Models\\Tailor', 4, '3', 'gallery', '2022-08-14 12:56:56', '2022-08-15 09:59:58'),
(149, 13, 'App\\Models\\Tailor', 5, '1', 'main_image', '2022-08-14 13:04:26', '2022-08-15 10:00:08'),
(150, 15, 'App\\Models\\Tailor', 5, '1', 'gallery', '2022-08-14 13:04:26', '2022-08-15 10:00:08'),
(151, 16, 'App\\Models\\Tailor', 5, '2', 'gallery', '2022-08-14 13:04:26', '2022-08-15 10:00:08'),
(152, 18, 'App\\Models\\Tailor', 5, '3', 'gallery', '2022-08-14 13:04:26', '2022-08-15 10:00:08'),
(153, 13, 'App\\Models\\Tailor', 6, '1', 'main_image', '2022-08-14 13:09:05', '2022-08-15 10:00:17'),
(154, 15, 'App\\Models\\Tailor', 6, '1', 'gallery', '2022-08-14 13:09:05', '2022-08-15 10:00:17'),
(155, 16, 'App\\Models\\Tailor', 6, '2', 'gallery', '2022-08-14 13:09:05', '2022-08-15 10:00:17'),
(156, 18, 'App\\Models\\Tailor', 6, '3', 'gallery', '2022-08-14 13:09:05', '2022-08-15 10:00:17'),
(157, 13, 'App\\Models\\Tailor', 7, '1', 'main_image', '2022-08-14 13:10:11', '2022-08-15 10:00:28'),
(158, 15, 'App\\Models\\Tailor', 7, '1', 'gallery', '2022-08-14 13:10:11', '2022-08-15 10:00:28'),
(159, 16, 'App\\Models\\Tailor', 7, '2', 'gallery', '2022-08-14 13:10:11', '2022-08-15 10:00:28'),
(160, 18, 'App\\Models\\Tailor', 7, '3', 'gallery', '2022-08-14 13:10:11', '2022-08-15 10:00:28'),
(161, 13, 'App\\Models\\Tailor', 8, '1', 'main_image', '2022-08-15 12:50:30', '2022-09-21 09:46:15'),
(162, 15, 'App\\Models\\Tailor', 8, '1', 'gallery', '2022-08-15 12:50:30', '2022-09-21 09:46:15'),
(163, 16, 'App\\Models\\Tailor', 8, '2', 'gallery', '2022-08-15 12:50:30', '2022-09-21 09:46:15'),
(164, 18, 'App\\Models\\Tailor', 8, '3', 'gallery', '2022-08-15 12:50:30', '2022-09-21 09:46:15'),
(165, 13, 'App\\Models\\Tailor', 9, '1', 'main_image', '2022-08-15 12:51:52', '2022-09-21 11:33:08'),
(166, 15, 'App\\Models\\Tailor', 9, '1', 'gallery', '2022-08-15 12:51:52', '2022-09-21 11:33:08'),
(167, 16, 'App\\Models\\Tailor', 9, '2', 'gallery', '2022-08-15 12:51:52', '2022-09-21 11:33:08'),
(168, 18, 'App\\Models\\Tailor', 9, '3', 'gallery', '2022-08-15 12:51:52', '2022-09-21 11:33:08'),
(169, 13, 'App\\Models\\Tailor', 10, '1', 'main_image', '2022-08-15 12:52:44', '2022-08-15 12:52:44'),
(170, 15, 'App\\Models\\Tailor', 10, '1', 'gallery', '2022-08-15 12:52:44', '2022-08-15 12:52:44'),
(171, 16, 'App\\Models\\Tailor', 10, '2', 'gallery', '2022-08-15 12:52:44', '2022-08-15 12:52:44'),
(172, 18, 'App\\Models\\Tailor', 10, '3', 'gallery', '2022-08-15 12:52:44', '2022-08-15 12:52:44'),
(173, 9, 'App\\Models\\Product', 9, '1', 'featured_image', '2022-08-15 12:59:11', '2022-10-04 09:53:31'),
(174, 10, 'App\\Models\\Product', 9, '1', 'featured_image_thumb', '2022-08-15 12:59:11', '2022-10-04 09:53:31'),
(175, 11, 'App\\Models\\Product', 9, '1', 'gallery', '2022-08-15 12:59:11', '2022-10-04 09:53:31'),
(176, 12, 'App\\Models\\Product', 9, '2', 'gallery', '2022-08-15 12:59:11', '2022-10-04 09:53:31'),
(177, 9, 'App\\Models\\Product', 10, '1', 'featured_image', '2022-08-15 13:04:40', '2022-09-21 08:12:19'),
(178, 10, 'App\\Models\\Product', 10, '1', 'featured_image_thumb', '2022-08-15 13:04:40', '2022-09-21 08:12:19'),
(179, 12, 'App\\Models\\Product', 10, '1', 'gallery', '2022-08-15 13:04:40', '2022-09-21 08:12:19'),
(180, 11, 'App\\Models\\Product', 10, '2', 'gallery', '2022-08-15 13:04:40', '2022-09-21 08:12:19'),
(181, 19, 'App\\Models\\Testimonial', 3, '1', 'image', '2022-08-15 14:20:50', '2022-09-21 09:20:52'),
(182, 20, 'App\\Models\\Testimonial', 3, '1', 'image_thumb', '2022-08-15 14:20:50', '2022-09-21 09:20:52'),
(183, 19, 'App\\Models\\Testimonial', 4, '1', 'image', '2022-08-15 14:21:33', '2022-09-21 09:23:03'),
(184, 20, 'App\\Models\\Testimonial', 4, '1', 'image_thumb', '2022-08-15 14:21:33', '2022-09-21 09:23:03'),
(185, 19, 'App\\Models\\Testimonial', 5, '1', 'image', '2022-08-15 14:22:25', '2022-09-21 09:21:04'),
(186, 20, 'App\\Models\\Testimonial', 5, '1', 'image_thumb', '2022-08-15 14:22:25', '2022-09-21 09:21:04'),
(197, 55, 'App\\Models\\Tailor', 11, '1', 'main_image', '2022-08-20 19:18:28', '2022-08-20 19:18:28'),
(198, 59, 'App\\Models\\Tailor', 11, '1', 'gallery', '2022-08-20 19:18:28', '2022-08-20 19:18:28'),
(199, 57, 'App\\Models\\Tailor', 11, '2', 'gallery', '2022-08-20 19:18:28', '2022-08-20 19:18:28'),
(200, 58, 'App\\Models\\Tailor', 11, '3', 'gallery', '2022-08-20 19:18:28', '2022-08-20 19:18:28'),
(209, 64, 'App\\Models\\Tailor', 12, '1', 'gallery', '2022-08-21 00:58:35', '2022-09-21 11:33:13'),
(210, 66, 'App\\Models\\Tailor', 12, '2', 'gallery', '2022-08-21 00:58:35', '2022-09-21 11:33:13'),
(211, 65, 'App\\Models\\Tailor', 12, '3', 'gallery', '2022-08-21 00:58:35', '2022-09-21 11:33:13'),
(213, 67, 'App\\Models\\Tailor', 12, '1', 'main_image', '2022-08-21 01:04:06', '2022-09-21 11:33:13'),
(215, 9, 'App\\Models\\Product', 11, '1', 'featured_image', '2022-08-24 15:40:01', '2022-08-24 16:39:22'),
(216, 10, 'App\\Models\\Product', 11, '1', 'featured_image_thumb', '2022-08-24 15:40:01', '2022-08-24 16:39:22'),
(217, 12, 'App\\Models\\Product', 11, '1', 'gallery', '2022-08-24 15:40:01', '2022-08-24 16:39:22'),
(218, 11, 'App\\Models\\Product', 11, '2', 'gallery', '2022-08-24 15:40:01', '2022-08-24 16:39:22'),
(219, 67, 'App\\Models\\KandoraDesign', 1, '1', 'image', '2022-09-08 10:14:11', '2022-09-08 10:14:11'),
(220, 85, 'App\\Models\\KandoraDesign', 2, '1', 'image', '2022-09-10 21:47:22', '2022-09-10 21:47:22'),
(221, 64, 'App\\Models\\KandoraPattern', 1, '1', 'image', '2022-09-12 09:24:21', '2022-09-12 09:24:21'),
(222, 18, 'App\\Models\\KandoraDesignSleeve', 1, '1', 'image', '2022-09-12 11:15:44', '2022-09-12 11:15:44'),
(223, 16, 'App\\Models\\KandoraPattern', 2, '1', 'image', '2022-09-12 12:01:30', '2022-09-12 12:01:30'),
(224, 12, 'App\\Models\\KandoraSleeveLength', 1, '1', 'image', '2022-09-12 12:36:15', '2022-09-12 12:36:15'),
(225, 14, 'App\\Models\\KandoraSleeveButton', 1, '1', 'image', '2022-09-13 06:48:03', '2022-09-13 06:48:03'),
(226, 64, 'App\\Models\\KandoraNeckShape', 1, '1', 'image', '2022-09-13 06:50:14', '2022-09-13 06:50:14'),
(227, 15, 'App\\Models\\KandoraNeckFrontLength', 1, '1', 'image', '2022-09-13 07:52:56', '2022-09-13 07:52:56'),
(228, 65, 'App\\Models\\KandoraWaistShapeTight', 1, '1', 'image', '2022-09-18 11:26:38', '2022-09-18 11:26:38'),
(229, 16, 'App\\Models\\KandoraTypeCrystal', 1, '1', 'image', '2022-09-18 12:16:23', '2022-09-18 12:16:23'),
(230, 15, 'App\\Models\\KandoraTypeCrystal', 2, '1', 'image', '2022-09-18 12:17:36', '2022-09-18 12:17:36'),
(231, 64, 'App\\Models\\KandoraSizeCrystal', 1, '1', 'image', '2022-09-18 14:04:17', '2022-09-18 14:04:17'),
(232, 67, 'App\\Models\\KandoraSizeCrystal', 2, '1', 'image', '2022-09-18 14:04:45', '2022-09-18 14:04:45'),
(233, 14, 'App\\Models\\KandoraAmountCrystal', 1, '1', 'image', '2022-09-18 14:53:54', '2022-09-18 14:53:54'),
(234, 63, 'App\\Models\\KandoraAmountCrystal', 2, '1', 'image', '2022-09-18 14:54:20', '2022-09-18 14:54:20'),
(235, 64, 'App\\Models\\KandoraDesign', 3, '1', 'image', '2022-09-20 06:56:04', '2022-09-20 06:56:04'),
(236, 19, 'App\\Models\\Testimonial', 6, '1', 'image', '2022-09-21 09:23:43', '2022-09-21 09:23:43'),
(237, 20, 'App\\Models\\Testimonial', 6, '1', 'image_thumb', '2022-09-21 09:23:43', '2022-09-21 09:23:43'),
(238, 19, 'App\\Models\\Testimonial', 7, '1', 'image', '2022-09-21 09:28:19', '2022-09-21 09:28:19'),
(239, 20, 'App\\Models\\Testimonial', 7, '1', 'image_thumb', '2022-09-21 09:28:19', '2022-09-21 09:28:19'),
(240, 19, 'App\\Models\\Testimonial', 8, '1', 'image', '2022-09-21 09:28:52', '2022-09-21 09:28:52'),
(241, 20, 'App\\Models\\Testimonial', 8, '1', 'image_thumb', '2022-09-21 09:28:52', '2022-09-21 09:28:52');

-- --------------------------------------------------------

--
-- Table structure for table `metas`
--

DROP TABLE IF EXISTS `metas`;
CREATE TABLE IF NOT EXISTS `metas` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `meta_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_id` int(11) NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `title_ar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description_ar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `metas`
--

INSERT INTO `metas` (`id`, `meta_type`, `meta_id`, `title`, `description`, `created_at`, `updated_at`, `title_ar`, `description_ar`) VALUES
(6, 'App\\Models\\Page', 1, 'Home', 'Home', '2022-08-10 22:32:30', '2022-10-03 14:12:26', NULL, NULL),
(7, 'App\\Models\\Page', 2, 'About US', 'About US', '2022-08-11 09:48:56', '2022-09-20 14:38:50', NULL, NULL),
(9, 'App\\Models\\Page', 3, 'SHOP', 'SHOP', '2022-08-11 10:02:38', '2022-08-11 10:02:38', NULL, NULL),
(10, 'App\\Models\\Page', 4, 'TAILORS', 'TAILORS', '2022-08-11 10:06:52', '2022-08-11 10:06:52', NULL, NULL),
(11, 'App\\Models\\Page', 5, 'TESTIMONIALS', 'TESTIMONIALS', '2022-08-11 12:30:31', '2022-08-11 12:30:31', NULL, NULL),
(12, 'App\\Models\\Page', 6, 'CONTACT US', 'CONTACT US', '2022-08-11 12:37:03', '2022-08-11 12:37:03', NULL, NULL),
(13, 'App\\Models\\Page', 1, 'Home', 'Home', '2022-08-12 08:17:47', '2022-10-03 14:12:26', NULL, NULL),
(30, 'App\\Models\\Page', 8, 'محل', 'محل', '2022-08-12 20:56:46', '2022-08-12 20:56:46', NULL, NULL),
(31, 'App\\Models\\Page', 9, 'الخياطون', 'الخياطون', '2022-08-12 21:04:32', '2022-08-12 21:04:32', NULL, NULL),
(32, 'App\\Models\\Page', 9, 'الخياطون', 'الخياطون', '2022-08-12 21:05:04', '2022-08-12 21:05:04', NULL, NULL),
(37, 'App\\Models\\Tailor', 8, 'Tailor One', 'Tailor One', '2022-08-15 12:50:30', '2022-09-21 09:46:15', 'خياط واحد', 'خياط واحد'),
(38, 'App\\Models\\Tailor', 9, 'Tailor Two', 'Tailor Two', '2022-08-15 12:51:52', '2022-09-21 11:33:08', 'خياط اثنين', 'خياط اثنين'),
(40, 'App\\Models\\Product', 9, 'Product One', 'Product One', '2022-08-15 12:59:11', '2022-10-04 09:53:31', 'المنتج الأول', 'المنتج الأول'),
(41, 'App\\Models\\Product', 10, 'Product Two', 'Product Two', '2022-08-15 13:04:40', '2022-09-21 08:12:19', 'المنتج الثاني', 'المنتج الثاني'),
(43, 'App\\Models\\Page', 10, 'مسكن', 'مسكن', '2022-08-15 13:12:42', '2022-09-02 12:48:01', NULL, NULL),
(44, 'App\\Models\\Page', 6, 'CONTACT US', 'CONTACT US', '2022-08-15 20:13:22', '2022-08-15 20:13:22', NULL, NULL),
(45, 'App\\Models\\Page', 11, 'اتصل بنا', 'اتصل بنا', '2022-08-16 11:42:13', '2022-08-16 11:42:13', NULL, NULL),
(46, 'App\\Models\\Page', 12, 'Cart', 'Cart', '2022-08-17 03:57:09', '2022-08-17 03:57:09', NULL, NULL),
(47, 'App\\Models\\Page', 13, 'عربة التسوق', 'عربة التسوق', '2022-08-17 03:59:16', '2022-08-17 03:59:16', NULL, NULL),
(57, 'App\\Models\\Tailor', 12, 'Tailor Three', 'Tailor Three', '2022-08-21 00:58:35', '2022-09-21 11:33:13', 'Tailor Three', 'Tailor Three'),
(58, 'App\\Models\\Page', 22, 'FAQ’S', 'FAQ’S', '2022-08-21 14:10:13', '2022-08-21 14:10:13', NULL, NULL),
(59, 'App\\Models\\Page', 23, 'أسئلة شائعة', 'أسئلة شائعة', '2022-08-21 14:35:08', '2022-08-21 14:35:08', NULL, NULL),
(60, 'App\\Models\\Page', 24, 'Terms and Condition', 'Terms and Condition', '2022-08-21 15:08:44', '2022-08-21 15:08:44', NULL, NULL),
(61, 'App\\Models\\Page', 25, 'Privacy Policy', 'Privacy Policy', '2022-08-21 15:11:02', '2022-08-21 15:11:02', NULL, NULL),
(66, 'App\\Models\\Page', 10, 'مسكن', 'مسكن', '2022-08-22 15:47:31', '2022-09-02 12:48:01', NULL, NULL),
(68, 'App\\Models\\Page', 25, 'Privacy Policy', 'Privacy Policy', '2022-08-24 15:14:44', '2022-08-24 15:14:44', NULL, NULL),
(69, 'App\\Models\\Page', 24, 'Terms and Condition', 'Terms and Condition', '2022-08-24 15:18:18', '2022-08-24 15:18:18', NULL, NULL),
(70, 'App\\Models\\Product', 11, 'Product Three', 'Product Three', '2022-08-24 15:40:01', '2022-08-24 16:39:22', 'المنتج الثالث', 'المنتج الثالث'),
(71, 'App\\Models\\Page', 26, 'Checkout', 'Checkout', '2022-08-24 20:47:57', '2022-08-24 20:47:57', NULL, NULL),
(72, 'App\\Models\\Page', 27, 'الدفع', 'الدفع', '2022-08-24 20:49:24', '2022-08-24 20:49:24', NULL, NULL),
(73, 'App\\Models\\Page', 26, 'Checkout', 'Checkout', '2022-08-24 21:04:34', '2022-08-24 21:04:34', NULL, NULL),
(74, 'App\\Models\\Page', 28, '404', '404', '2022-08-25 07:21:07', '2022-08-25 07:21:07', NULL, NULL),
(76, 'App\\Models\\Page', 29, 'لم يتم العثور على', 'لم يتم العثور على', '2022-08-25 07:32:13', '2022-08-25 07:32:13', NULL, NULL),
(77, 'App\\Models\\Page', 26, 'Checkout', 'Checkout', '2022-08-25 12:10:37', '2022-08-25 12:10:37', NULL, NULL),
(78, 'App\\Models\\Page', 30, 'Wishlist', 'Wishlist', '2022-08-25 18:03:36', '2022-08-25 18:03:36', NULL, NULL),
(79, 'App\\Models\\Page', 31, 'قائمة الرغبات', 'قائمة الرغبات', '2022-08-25 18:04:09', '2022-08-25 18:04:09', NULL, NULL),
(80, 'App\\Models\\Page', 33, 'About US', 'About US', '2022-08-31 10:12:54', '2022-08-31 10:12:54', NULL, NULL),
(81, 'App\\Models\\Page', 34, 'Terms and Condition', 'Terms and Condition', '2022-08-31 10:19:53', '2022-08-31 10:19:53', NULL, NULL),
(82, 'App\\Models\\Page', 35, 'Privacy Policy', 'Privacy Policy', '2022-08-31 10:20:42', '2022-08-31 10:20:42', NULL, NULL),
(85, 'App\\Models\\Page', 38, 'saddsa', 'sdsaddsa', '2022-09-02 14:55:06', '2022-09-02 14:55:06', NULL, NULL),
(86, 'App\\Models\\Page', 39, 'Custom Kandora', 'Custom Kandora', '2022-09-08 11:02:18', '2022-09-08 11:02:18', NULL, NULL),
(87, 'App\\Models\\Page', 40, 'كندورة مخصصة', 'كندورة مخصصة', '2022-09-10 20:24:48', '2022-09-10 20:24:48', NULL, NULL),
(88, 'App\\Models\\Page', 41, 'Custom Kandora Checkout', 'Custom Kandora Checkout', '2022-10-06 10:50:58', '2022-10-06 10:50:58', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=215 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_100000_create_password_resets_table', 1),
(5, '2022_02_04_134204_create_users_table', 1),
(29, '2022_01_28_190140_create_permission_tables', 1),
(30, '2019_08_19_000000_create_failed_jobs_table', 2),
(31, '2019_12_14_000001_create_personal_access_tokens_table', 2),
(32, '2022_05_28_230248_create_audits_table', 2),
(77, '2017_08_11_073824_create_menus_wp_table', 4),
(34, '2022_07_14_135929_create_media_relations_table', 3),
(78, '2017_08_11_074006_create_menu_items_wp_table', 4),
(79, '2022_07_14_140816_create_media_table', 5),
(80, '2022_07_20_160458_create_product_colors_table', 5),
(81, '2022_07_21_162509_create_product_sizes_table', 5),
(82, '2022_07_21_164633_create_product_shops_table', 5),
(83, '2022_07_21_172849_create_products_table', 5),
(84, '2022_07_22_015547_create_product_ratings_table', 5),
(85, '2022_07_22_020332_create_product_variants_table', 5),
(86, '2022_07_22_115223_create_tailors_table', 5),
(87, '2022_07_22_141312_create_languages_table', 5),
(88, '2022_07_22_144452_create_pages_table', 5),
(89, '2022_07_26_172410_create_templates_table', 5),
(90, '2022_07_26_172931_create_page_statuses_table', 5),
(91, '2022_07_27_124357_create_options_table', 5),
(92, '2022_08_02_165419_create_metas_table', 5),
(93, '2022_08_05_005015_create_kandora_designs_table', 5),
(94, '2022_08_05_113312_create_kandora_fabrics_table', 5),
(95, '2022_08_05_115450_create_statuses_table', 5),
(96, '2022_08_05_124102_create_kandora_patterns_table', 5),
(97, '2022_08_05_151036_create_kandora_design_sleeves_table', 5),
(98, '2022_08_05_164152_create_kandora_sleeve_lengths_table', 5),
(99, '2022_08_05_171204_create_kandora_sleeve_buttons_table', 5),
(100, '2022_08_05_173510_create_kandora_neck_shapes_table', 5),
(101, '2022_08_05_174851_create_kandora_neck_front_lengths_table', 5),
(102, '2022_08_05_184139_create_kandora_khawar_neck_lengths_table', 5),
(103, '2022_08_05_194317_create_kandora_waist_shape_tights_table', 5),
(104, '2022_08_06_015712_create_kandora_type_crystals_table', 5),
(105, '2022_08_06_060529_create_kandora_size_crystals_table', 5),
(106, '2022_08_06_184342_create_kandora_amount_crystals_table', 5),
(107, '2022_08_07_032200_create_product_fabrics_table', 5),
(111, '2022_08_09_230946_create_testimonials_table', 6),
(113, '2022_08_10_171042_create_f_a_q_s_table', 7),
(114, '2022_08_12_215747_add_slug_column_to_products_table', 8),
(127, '2022_08_13_024443_create_customers_table', 9),
(128, '2022_08_13_030627_create_customer_password_resets_table', 9),
(129, '2022_08_14_183327_add_slug_to_tailors_table', 10),
(130, '2022_08_15_141418_add_name_to_tailors_info_table', 11),
(131, '2022_08_15_142618_add_tailor_id_to_products_table', 11),
(133, '2022_08_15_171039_add_arabics_to_metas_table', 12),
(135, '2022_08_16_004304_create_contacts_table', 13),
(136, '2022_03_07_115358_create_seos_table', 14),
(137, '2022_08_17_030717_create_carts_table', 14),
(139, '2022_08_17_030847_create_cart_items_table', 15),
(141, '2022_08_17_215302_add_is_check_to_carts', 16),
(142, '2022_08_18_020000_create_cities_table', 17),
(148, '2022_08_18_192557_create_orders_table', 18),
(149, '2022_08_18_195117_create_order_products_table', 18),
(150, '2022_08_18_200416_create_order_statuses_table', 18),
(151, '2022_08_18_201028_create_customer_billing_addresses_table', 18),
(152, '2022_08_18_202947_create_customer_shipping_addresses_table', 18),
(153, '2022_08_19_191811_add_title_ar_to_order_statuses', 19),
(154, '2022_08_19_193949_add_columns_to_product_ratings', 20),
(155, '2022_08_20_234749_remove_title_field_from_faq_table', 21),
(156, '2022_08_21_192057_change_faq_columns_in_faqs_table', 22),
(157, '2022_08_22_160118_create_accept_statuses_table', 23),
(158, '2022_08_22_160316_add_accept_status_id_to_product_ratings', 23),
(165, '2022_08_22_163034_create_order_logs_table', 24),
(166, '2022_08_22_163943_create_payment_statuses_table', 24),
(167, '2022_08_22_164029_add_payment_status_id_to_orders_table', 24),
(168, '2022_08_23_134650_create_customer_measurements_table', 24),
(169, '2022_08_23_220916_add_slug_to_product_sizes_table', 24),
(170, '2022_08_23_221223_add_slug_to_product_fabrics_table', 24),
(172, '2022_08_23_225021_create_sort_filters_table', 25),
(175, '2022_08_25_151952_create_coupon_types_table', 26),
(176, '2022_08_25_152140_create_coupons_table', 26),
(177, '2022_08_25_155613_add_value_to_coupons_table', 27),
(178, '2022_08_25_160645_add_cart_columns_in_cart_table', 28),
(179, '2022_08_25_172957_add_coupon_columns_in_orders_table', 29),
(180, '2022_08_25_221845_create_wish_lists_table', 30),
(188, '2022_08_27_021321_create_social_providers_table', 31),
(189, '2022_08_27_023557_change_phone_number_column_in_customers_table', 31),
(190, '2022_08_27_030026_create_providers_table', 31),
(191, '2022_08_27_034837_add_key_to_social_providers_table', 31),
(192, '2022_08_27_042240_change_customer_id_in_social_providers_table', 31),
(193, '2022_08_31_171812_add_password_resets_table', 32),
(195, '2022_09_06_153614_create_email_templates_table', 33),
(197, '2022_09_10_003044_create_custom_kandoras_table', 34),
(198, '2022_09_15_112443_add_session_id_to_carts_table', 35),
(199, '2022_09_15_132339_change_customer_id_column_to_nullable_in_carts_table', 36),
(200, '2022_09_17_202131_change_value_column_in_options_table', 37),
(202, '2022_09_19_003504_change_email_column_in_contacts_table', 38),
(203, '2022_09_21_134904_add_order_column_in_testimonials_table', 39),
(204, '2022_09_21_143442_add_order_column_in_tailors_table', 40),
(205, '2022_09_21_163700_add_order_column_faqs_table', 41),
(206, '2022_09_27_160754_remove_columns_in_custom_kandoras_table', 42),
(207, '2022_10_07_173701_add_instructions_column_in_custom_kandoras_table', 43),
(211, '2022_10_08_214549_create_order_types_table', 44),
(212, '2022_10_08_215423_add_order_type_id_to_orders_table', 44),
(213, '2022_10_08_232156_create_order_kandoras_table', 44),
(214, '2022_10_09_153836_add_coupons_columns_in_custom_kandoras_table', 45);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

DROP TABLE IF EXISTS `model_has_permissions`;
CREATE TABLE IF NOT EXISTS `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_permissions`
--

INSERT INTO `model_has_permissions` (`permission_id`, `model_type`, `model_id`) VALUES
(106, 'App\\Models\\User', 166),
(107, 'App\\Models\\User', 166),
(108, 'App\\Models\\User', 166),
(109, 'App\\Models\\User', 166),
(110, 'App\\Models\\User', 166),
(111, 'App\\Models\\User', 166),
(112, 'App\\Models\\User', 166),
(113, 'App\\Models\\User', 166),
(114, 'App\\Models\\User', 166),
(115, 'App\\Models\\User', 166),
(116, 'App\\Models\\User', 166),
(117, 'App\\Models\\User', 166),
(118, 'App\\Models\\User', 166),
(119, 'App\\Models\\User', 166),
(120, 'App\\Models\\User', 166),
(121, 'App\\Models\\User', 166),
(122, 'App\\Models\\User', 166),
(123, 'App\\Models\\User', 166),
(124, 'App\\Models\\User', 166),
(125, 'App\\Models\\User', 166),
(126, 'App\\Models\\User', 166),
(127, 'App\\Models\\User', 166),
(128, 'App\\Models\\User', 166),
(129, 'App\\Models\\User', 166),
(130, 'App\\Models\\User', 166),
(131, 'App\\Models\\User', 166),
(132, 'App\\Models\\User', 166),
(133, 'App\\Models\\User', 166),
(134, 'App\\Models\\User', 166),
(135, 'App\\Models\\User', 166),
(136, 'App\\Models\\User', 166),
(137, 'App\\Models\\User', 166),
(138, 'App\\Models\\User', 166),
(139, 'App\\Models\\User', 166),
(140, 'App\\Models\\User', 166),
(141, 'App\\Models\\User', 166),
(142, 'App\\Models\\User', 166),
(143, 'App\\Models\\User', 166),
(144, 'App\\Models\\User', 166),
(145, 'App\\Models\\User', 166),
(146, 'App\\Models\\User', 166),
(147, 'App\\Models\\User', 166),
(148, 'App\\Models\\User', 166),
(149, 'App\\Models\\User', 166),
(150, 'App\\Models\\User', 166),
(151, 'App\\Models\\User', 166),
(152, 'App\\Models\\User', 166),
(153, 'App\\Models\\User', 166),
(154, 'App\\Models\\User', 166),
(155, 'App\\Models\\User', 166),
(156, 'App\\Models\\User', 166),
(157, 'App\\Models\\User', 166),
(158, 'App\\Models\\User', 166),
(159, 'App\\Models\\User', 166),
(160, 'App\\Models\\User', 166),
(161, 'App\\Models\\User', 166),
(162, 'App\\Models\\User', 166),
(163, 'App\\Models\\User', 166),
(164, 'App\\Models\\User', 166),
(165, 'App\\Models\\User', 166),
(166, 'App\\Models\\User', 166),
(167, 'App\\Models\\User', 166),
(168, 'App\\Models\\User', 166),
(169, 'App\\Models\\User', 166),
(170, 'App\\Models\\User', 166),
(171, 'App\\Models\\User', 166),
(172, 'App\\Models\\User', 166),
(173, 'App\\Models\\User', 166),
(174, 'App\\Models\\User', 166),
(175, 'App\\Models\\User', 166),
(176, 'App\\Models\\User', 166),
(177, 'App\\Models\\User', 166),
(178, 'App\\Models\\User', 166),
(179, 'App\\Models\\User', 166),
(180, 'App\\Models\\User', 166),
(181, 'App\\Models\\User', 166),
(182, 'App\\Models\\User', 166),
(183, 'App\\Models\\User', 166),
(184, 'App\\Models\\User', 166),
(185, 'App\\Models\\User', 166),
(186, 'App\\Models\\User', 166),
(187, 'App\\Models\\User', 166),
(192, 'App\\Models\\User', 166),
(193, 'App\\Models\\User', 166),
(194, 'App\\Models\\User', 166),
(195, 'App\\Models\\User', 166),
(196, 'App\\Models\\User', 166),
(197, 'App\\Models\\User', 166),
(198, 'App\\Models\\User', 166),
(199, 'App\\Models\\User', 166),
(200, 'App\\Models\\User', 166),
(201, 'App\\Models\\User', 166),
(202, 'App\\Models\\User', 166),
(203, 'App\\Models\\User', 166),
(204, 'App\\Models\\User', 166),
(205, 'App\\Models\\User', 166),
(206, 'App\\Models\\User', 166),
(207, 'App\\Models\\User', 166),
(208, 'App\\Models\\User', 166),
(209, 'App\\Models\\User', 166),
(210, 'App\\Models\\User', 166),
(211, 'App\\Models\\User', 166),
(212, 'App\\Models\\User', 166),
(213, 'App\\Models\\User', 166),
(214, 'App\\Models\\User', 166),
(215, 'App\\Models\\User', 166),
(216, 'App\\Models\\User', 166),
(217, 'App\\Models\\User', 166),
(218, 'App\\Models\\User', 166),
(219, 'App\\Models\\User', 166);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

DROP TABLE IF EXISTS `model_has_roles`;
CREATE TABLE IF NOT EXISTS `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(11, 'App\\Models\\User', 166);

-- --------------------------------------------------------

--
-- Table structure for table `options`
--

DROP TABLE IF EXISTS `options`;
CREATE TABLE IF NOT EXISTS `options` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `options`
--

INSERT INTO `options` (`id`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1, 'title', 'sadsad', '2022-08-08 13:14:20', '2022-08-08 13:14:20'),
(2, 'title_two', 'sadsad', '2022-08-08 13:14:20', '2022-08-08 13:14:20'),
(3, 'link', '{\"title\":\"dsasda\",\"link\":\"dasadasd\"}', '2022-08-08 13:14:20', '2022-08-08 13:14:20'),
(4, 'image', '1', '2022-08-08 13:14:36', '2022-08-08 13:14:36'),
(5, 'title_one', 'asdsad', '2022-08-08 13:14:36', '2022-08-08 13:14:36'),
(6, 'header_logo', '30', '2022-08-11 16:30:18', '2022-08-11 16:30:18'),
(7, 'footer_logo', '31', '2022-08-11 16:30:18', '2022-08-11 16:30:18'),
(8, 'buttom_text_one', 'TAILORED CLOTHING', '2022-08-11 16:30:18', '2022-08-11 16:30:18'),
(9, 'buttom_text_one_ar', 'ملابس مصممة', '2022-08-11 16:30:18', '2022-08-11 16:30:18'),
(10, 'bottom_image_one', '32', '2022-08-11 16:30:18', '2022-08-11 16:30:18'),
(11, 'buttom_text_two', '100% CUSTOMIZABLE', '2022-08-11 16:30:18', '2022-08-11 16:30:18'),
(12, 'buttom_text_two_ar', '100٪ قابل للتخصيص', '2022-08-11 16:30:18', '2022-08-11 16:30:18'),
(13, 'bottom_image_two', '33', '2022-08-11 16:30:18', '2022-08-11 16:30:18'),
(14, 'buttom_text_three', 'TAILORED CLOTHING', '2022-08-11 16:30:18', '2022-08-11 16:30:18'),
(15, 'buttom_text_three_ar', 'ملابس مصممة', '2022-08-11 16:30:18', '2022-08-11 16:30:18'),
(16, 'bottom_image_three', '34', '2022-08-11 16:30:18', '2022-08-11 16:30:18'),
(17, 'copyright_text', '© 2022 Digitailor. All Rights Reserved.', '2022-08-11 16:30:18', '2022-08-15 19:37:43'),
(18, 'copyright_text_ar', '2022 Digitailor. كل الحقوق محفوظة.', '2022-08-11 16:30:18', '2022-08-15 19:37:43'),
(19, 'twitter_image', '35', '2022-08-11 16:30:18', '2022-08-11 16:30:18'),
(20, 'twitter_link', '{\"title\":\"Link\",\"link\":\"https://twitter.com/\",\"target\":\"on\"}', '2022-08-11 16:30:18', '2022-09-17 16:07:14'),
(21, 'twitter_status', '1', '2022-08-11 16:30:18', '2022-08-11 17:31:46'),
(22, 'facebook_image', '36', '2022-08-11 16:30:18', '2022-08-11 16:30:18'),
(23, 'facebook_link', '{\"title\":\"Link\",\"link\":\"www.facebook.com\",\"target\":\"on\"}', '2022-08-11 16:30:18', '2022-08-11 16:30:18'),
(24, 'facebook_status', '1', '2022-08-11 16:30:18', '2022-08-11 17:31:46'),
(25, 'youtube_image', '37', '2022-08-11 16:30:18', '2022-08-11 16:30:18'),
(26, 'youtube_link', '{\"title\":\"Link\",\"link\":\"www.youtube.com\",\"target\":\"on\"}', '2022-08-11 16:30:18', '2022-08-11 16:30:18'),
(27, 'youtube_status', '1', '2022-08-11 16:30:18', '2022-08-11 17:31:46'),
(28, 'instagram_image', '38', '2022-08-11 16:30:18', '2022-08-11 16:30:18'),
(29, 'instagram_link', '{\"title\":\"Link\",\"link\":\"www.instagram.com\",\"target\":\"on\"}', '2022-08-11 16:30:18', '2022-08-11 16:30:18'),
(30, 'instagram_status', '1', '2022-08-11 16:30:18', '2022-08-11 17:31:47'),
(31, 'website_url_en', 'asddsa', '2022-08-15 19:37:43', '2022-08-15 19:37:43'),
(32, 'website_url_ar', 'sdasads', '2022-08-15 19:37:43', '2022-08-15 19:37:43'),
(33, 'tailor_main_title', 'TAILORS', '2022-08-16 07:42:57', '2022-08-16 07:42:57'),
(34, 'tailor_title', 'PERFECT', '2022-08-16 07:42:57', '2022-08-16 07:42:57'),
(35, 'tailor_sub_title', 'STITCH', '2022-08-16 07:42:57', '2022-08-16 07:42:57'),
(36, 'tailor_main_title_ar', 'الخياطون', '2022-08-16 07:42:57', '2022-08-16 07:42:57'),
(37, 'tailor_title_ar', 'في احسن الاحوال', '2022-08-16 07:42:57', '2022-08-16 07:42:57'),
(38, 'tailor_sub_title_ar', 'غرزة', '2022-08-16 07:42:57', '2022-08-16 07:42:57'),
(39, 'tailor_image', '44', '2022-08-16 07:42:57', '2022-08-16 07:42:57'),
(40, 'tailor_image_mobile', '44', '2022-08-16 07:45:38', '2022-08-16 07:45:38'),
(41, 'quality_image', '45', '2022-08-16 08:20:29', '2022-08-16 08:20:29'),
(42, 'quality_status', '1', '2022-08-16 08:20:29', '2022-08-16 08:20:29'),
(43, 'time_image', '46', '2022-08-16 08:20:29', '2022-08-16 08:20:29'),
(44, 'time_status', '1', '2022-08-16 08:20:29', '2022-08-16 08:20:29'),
(45, 'stiched_image', '47', '2022-08-16 08:20:29', '2022-08-16 08:20:29'),
(46, 'stiched_status', '1', '2022-08-16 08:20:29', '2022-08-16 08:20:29'),
(47, 'quality_text', 'QUALITY WARDROBE', '2022-08-16 08:30:18', '2022-08-16 08:30:18'),
(48, 'quality_text_ar', 'خزانة ملابس عالية الجودة', '2022-08-16 08:30:18', '2022-08-16 08:30:18'),
(49, 'time_text', 'ON TIME DELIVERY', '2022-08-16 08:30:18', '2022-08-16 08:30:18'),
(50, 'time_text_ar', 'التسليم في الوقت المحدد', '2022-08-16 08:30:18', '2022-08-16 08:30:18'),
(51, 'stiched_text', 'NEATLY STITCHED', '2022-08-16 08:30:18', '2022-08-16 08:30:18'),
(52, 'stiched_text_ar', 'مخيط تماما', '2022-08-16 08:30:18', '2022-08-16 08:30:18'),
(53, 'product_main_title', 'SHOP', '2022-08-16 09:28:04', '2022-08-16 09:28:04'),
(54, 'product_title', 'STORE', '2022-08-16 09:28:04', '2022-08-16 09:28:04'),
(55, 'product_sub_title', 'COLLECTION', '2022-08-16 09:28:04', '2022-08-16 09:28:04'),
(56, 'product_main_title_ar', 'متجر', '2022-08-16 09:28:04', '2022-08-16 09:28:04'),
(57, 'product_title_ar', 'متجر', '2022-08-16 09:28:04', '2022-08-16 09:28:04'),
(58, 'product_sub_title_ar', 'مجموعة', '2022-08-16 09:28:04', '2022-08-16 09:28:04'),
(59, 'product_image', '44', '2022-08-16 09:28:04', '2022-08-16 09:28:04'),
(60, 'product_image_mobile', '44', '2022-08-16 09:28:04', '2022-08-16 09:28:04'),
(61, 'delivery_charge', '150', '2022-08-22 09:27:13', '2022-09-27 08:37:50'),
(62, 'vat_percentage', '5', '2022-08-22 09:27:13', '2022-08-22 09:27:13'),
(63, 'currency', 'AED', '2022-08-22 17:23:20', '2022-08-22 17:23:20'),
(64, 'measurement_title_one', 'MEASUREMENT GUIDE', '2022-08-23 13:50:49', '2022-08-23 13:50:49'),
(65, 'measurement_title_one_ar', 'دليل القياس', '2022-08-23 13:50:49', '2022-08-23 13:50:49'),
(66, 'measurement_title_two', 'ADD YOUR MEASUREMENTS', '2022-08-23 13:50:49', '2022-08-23 13:50:49'),
(67, 'measurement_title_two_ar', 'أضف قياساتك', '2022-08-23 13:50:49', '2022-08-23 13:50:49'),
(68, 'measurement_description_one', 'dsasad', '2022-08-23 13:51:31', '2022-08-29 12:21:56'),
(69, 'measurement_description_one_ar', 'sadsda', '2022-08-23 13:51:31', '2022-08-29 12:21:56'),
(70, 'measurement_description_two', 'sadsda', '2022-08-23 13:51:31', '2022-08-29 12:21:56'),
(71, 'measurement_description_two_ar', 'sdasad', '2022-08-23 13:51:31', '2022-08-29 12:21:56'),
(72, 'measurement_video', 'https://player.vimeo.com/video/105517179', '2022-08-23 13:51:31', '2022-08-23 13:51:31'),
(73, 'size_chart', '<table style=\"border-collapse: collapse; width: 77.5709%; background-color: #ecf0f1; border-color: #000000; border-style: solid;\" border=\"4\">\r\n<tbody>\r\n<tr>\r\n<td style=\"width: 33.3629%;\"><span style=\"color: #000000;\">dsasdasad</span></td>\r\n<td style=\"width: 33.3629%;\"><span style=\"color: #000000;\">adsasdsad</span></td>\r\n<td style=\"width: 33.3629%;\"><span style=\"color: #000000;\">sadsad</span></td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 33.3629%;\"><span style=\"color: #000000;\">sadasd</span></td>\r\n<td style=\"width: 33.3629%;\"><span style=\"color: #000000;\">sadasdsd</span></td>\r\n<td style=\"width: 33.3629%;\"><span style=\"color: #000000;\">sadsad</span></td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 33.3629%;\"><span style=\"color: #000000;\">dsasad</span></td>\r\n<td style=\"width: 33.3629%;\"><span style=\"color: #000000;\">sadsad</span></td>\r\n<td style=\"width: 33.3629%;\"><span style=\"color: #000000;\">asdsad</span></td>\r\n</tr>\r\n</tbody>\r\n</table>', '2022-08-29 10:47:12', '2022-09-17 14:30:40'),
(74, 'email_logo', '90', '2022-09-30 11:20:35', '2022-09-30 11:20:35');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `product_total` double(8,2) NOT NULL,
  `delivery_charge` double(8,2) NOT NULL,
  `vat_charge` double(8,2) NOT NULL,
  `grand_total` double(8,2) NOT NULL,
  `is_same_address` int(11) NOT NULL DEFAULT '0',
  `order_status_id` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `payment_status_id` int(11) NOT NULL DEFAULT '1',
  `coupon_id` int(11) DEFAULT NULL,
  `coupon_charge` double(8,2) NOT NULL DEFAULT '0.00',
  `order_type_id` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `customer_id`, `product_total`, `delivery_charge`, `vat_charge`, `grand_total`, `is_same_address`, `order_status_id`, `created_at`, `updated_at`, `payment_status_id`, `coupon_id`, `coupon_charge`, `order_type_id`) VALUES
(1, 1, 546.00, 0.00, 0.00, 0.00, 1, 2, '2022-08-19 06:34:30', '2022-08-22 09:10:59', 1, NULL, 0.00, 1),
(6, 12, 100.00, 150.00, 5.00, 255.00, 0, 1, '2022-08-24 16:46:05', '2022-08-24 16:46:05', 1, NULL, 0.00, 1),
(7, 12, 98.00, 150.00, 4.90, 223.50, 1, 1, '2022-08-25 07:39:58', '2022-08-25 07:39:58', 1, 1, 29.40, 1),
(8, 12, 98.00, 150.00, 4.90, 223.50, 1, 1, '2022-08-25 08:39:54', '2022-08-25 08:39:54', 1, 1, 29.40, 1),
(9, 12, 50.00, 150.00, 2.50, 202.50, 1, 1, '2022-08-25 08:42:17', '2022-08-25 08:42:17', 1, NULL, 0.00, 1),
(10, 12, 50.00, 150.00, 2.50, 202.50, 1, 1, '2022-08-26 04:42:20', '2022-08-26 04:42:20', 1, NULL, 0.00, 1),
(11, 12, 98.00, 150.00, 4.90, 252.90, 1, 2, '2022-08-26 05:18:11', '2022-08-26 10:24:55', 1, NULL, 0.00, 1),
(12, 13, 98.00, 150.00, 4.90, 252.90, 1, 1, '2022-08-29 08:34:46', '2022-08-29 08:34:46', 1, NULL, 0.00, 1),
(13, 13, 500.00, 150.00, 25.00, 675.00, 1, 1, '2022-08-29 15:34:35', '2022-08-29 15:34:35', 1, NULL, 0.00, 1),
(15, 19, 102.00, 150.00, 5.10, 257.10, 1, 2, '2022-09-19 04:02:25', '2022-09-25 18:46:45', 1, NULL, 0.00, 1),
(16, 19, 34.00, 150.00, 1.70, 185.70, 1, 1, '2022-09-19 07:35:34', '2022-09-19 07:35:34', 1, NULL, 0.00, 1),
(17, 19, 34.00, 150.00, 1.70, 185.70, 1, 3, '2022-09-19 07:41:56', '2022-09-25 18:27:13', 1, NULL, 0.00, 1),
(19, 19, 34.00, 150.00, 1.70, 185.70, 1, 3, '2022-09-21 01:16:57', '2022-09-25 18:45:02', 1, NULL, 0.00, 1),
(74, 20, 3068.00, 150.00, 153.40, 3371.40, 1, 2, '2022-10-10 07:04:26', '2022-10-10 18:40:16', 1, NULL, 0.00, 2),
(75, 20, 3068.00, 150.00, 153.40, 3371.40, 1, 1, '2022-10-10 16:12:49', '2022-10-10 16:12:49', 1, NULL, 0.00, 2);

-- --------------------------------------------------------

--
-- Table structure for table `order_kandoras`
--

DROP TABLE IF EXISTS `order_kandoras`;
CREATE TABLE IF NOT EXISTS `order_kandoras` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `tailor_id` int(11) NOT NULL,
  `measurement_id` int(11) NOT NULL,
  `kandora_design_id` int(11) DEFAULT NULL,
  `kandora_design_price` double(8,2) NOT NULL DEFAULT '0.00',
  `kandora_fabric_id` int(11) DEFAULT NULL,
  `kandora_fabric_price` double(8,2) NOT NULL DEFAULT '0.00',
  `kandora_pattern_id` int(11) DEFAULT NULL,
  `kandora_pattern_price` double(8,2) NOT NULL DEFAULT '0.00',
  `kandora_design_sleeve_id` int(11) DEFAULT NULL,
  `kandora_design_sleeve_price` double(8,2) NOT NULL DEFAULT '0.00',
  `kandora_sleeve_length_id` int(11) DEFAULT NULL,
  `kandora_sleeve_length_price` double(8,2) NOT NULL DEFAULT '0.00',
  `kandora_sleeve_button_id` int(11) DEFAULT NULL,
  `kandora_sleeve_button_price` double(8,2) NOT NULL DEFAULT '0.00',
  `kandora_neck_shape_id` int(11) DEFAULT NULL,
  `kandora_neck_shape_price` double(8,2) NOT NULL DEFAULT '0.00',
  `kandora_neck_front_length_id` int(11) DEFAULT NULL,
  `kandora_neck_front_length_price` double(8,2) NOT NULL DEFAULT '0.00',
  `kandora_khawar_neck_length_id` int(11) DEFAULT NULL,
  `kandora_khawar_neck_length_price` double(8,2) NOT NULL DEFAULT '0.00',
  `kandora_waist_shape_tight_id` int(11) DEFAULT NULL,
  `kandora_waist_shape_tight_price` double(8,2) NOT NULL DEFAULT '0.00',
  `kandora_type_crystal_id` int(11) DEFAULT NULL,
  `kandora_type_crystal_price` double(8,2) NOT NULL DEFAULT '0.00',
  `kandora_size_crystal_id` int(11) DEFAULT NULL,
  `kandora_size_crystal_price` double(8,2) NOT NULL DEFAULT '0.00',
  `kandora_amount_crytal_id` int(11) DEFAULT NULL,
  `kandora_amount_crytal_price` double(8,2) NOT NULL DEFAULT '0.00',
  `instructions` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_kandoras`
--

INSERT INTO `order_kandoras` (`id`, `order_id`, `tailor_id`, `measurement_id`, `kandora_design_id`, `kandora_design_price`, `kandora_fabric_id`, `kandora_fabric_price`, `kandora_pattern_id`, `kandora_pattern_price`, `kandora_design_sleeve_id`, `kandora_design_sleeve_price`, `kandora_sleeve_length_id`, `kandora_sleeve_length_price`, `kandora_sleeve_button_id`, `kandora_sleeve_button_price`, `kandora_neck_shape_id`, `kandora_neck_shape_price`, `kandora_neck_front_length_id`, `kandora_neck_front_length_price`, `kandora_khawar_neck_length_id`, `kandora_khawar_neck_length_price`, `kandora_waist_shape_tight_id`, `kandora_waist_shape_tight_price`, `kandora_type_crystal_id`, `kandora_type_crystal_price`, `kandora_size_crystal_id`, `kandora_size_crystal_price`, `kandora_amount_crytal_id`, `kandora_amount_crytal_price`, `instructions`, `created_at`, `updated_at`) VALUES
(37, 74, 8, 1, 1, 400.00, 1, 100.00, 1, 300.00, 1, 35.00, 1, 400.00, 1, 100.00, 1, 100.00, 1, 100.00, 1, 400.00, 1, 300.00, 1, 300.00, 1, 333.00, 1, 300.00, 'saasa', '2022-10-10 07:04:26', '2022-10-10 07:04:26'),
(38, 75, 8, 1, 1, 400.00, 1, 100.00, 1, 300.00, 1, 35.00, 1, 400.00, 1, 100.00, 1, 100.00, 1, 100.00, 1, 400.00, 1, 300.00, 1, 300.00, 1, 333.00, 1, 300.00, 'saasa', '2022-10-10 16:12:49', '2022-10-10 16:12:49');

-- --------------------------------------------------------

--
-- Table structure for table `order_logs`
--

DROP TABLE IF EXISTS `order_logs`;
CREATE TABLE IF NOT EXISTS `order_logs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description_ar` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_logs`
--

INSERT INTO `order_logs` (`id`, `order_id`, `description`, `description_ar`, `created_at`, `updated_at`) VALUES
(2, 11, 'Your Order has been Placed', 'وقد وضعت طلبك', '2022-08-26 05:18:11', '2022-08-26 05:18:11'),
(3, 11, 'Your Order Status has been changed to Pending', 'قيد الانتظار تم تغيير حالة طلبك إلى', '2022-08-25 10:24:22', '2022-08-26 10:24:22'),
(4, 11, 'Your Order Status has been changed to Accepted', 'وافقت تم تغيير حالة طلبك إلى', '2022-08-26 10:24:55', '2022-08-26 10:24:55'),
(5, 12, 'Your Order has been Placed', 'وقد وضعت طلبك', '2022-08-29 08:34:46', '2022-08-29 08:34:46'),
(6, 13, 'Your Order has been Placed', 'وقد وضعت طلبك', '2022-08-29 15:34:35', '2022-08-29 15:34:35'),
(8, 15, 'Your Order has been Placed', 'وقد وضعت طلبك', '2022-09-19 04:02:25', '2022-09-19 04:02:25'),
(9, 16, 'Your Order has been Placed', 'وقد وضعت طلبك', '2022-09-19 07:35:34', '2022-09-19 07:35:34'),
(10, 17, 'Your Order has been Placed', 'وقد وضعت طلبك', '2022-09-19 07:41:56', '2022-09-19 07:41:56'),
(12, 19, 'Your Order has been Placed', 'وقد وضعت طلبك', '2022-09-21 01:16:57', '2022-09-21 01:16:57'),
(13, 19, 'Your Order Status has been changed to Accepted', 'وافقت تم تغيير حالة طلبك إلى', '2022-09-25 15:44:07', '2022-09-25 15:44:07'),
(14, 17, 'Your Order Status has been changed to Accepted', 'وافقت تم تغيير حالة طلبك إلى', '2022-09-25 17:00:28', '2022-09-25 17:00:28'),
(15, 17, 'Your Order Status has been changed to Rejected', 'مرفوض تم تغيير حالة طلبك إلى', '2022-09-25 17:01:28', '2022-09-25 17:01:28'),
(16, 17, 'Your Order Status has been changed to Accepted', 'وافقت تم تغيير حالة طلبك إلى', '2022-09-25 18:16:40', '2022-09-25 18:16:40'),
(17, 17, 'Your Order Status has been changed to Accepted', 'وافقت تم تغيير حالة طلبك إلى', '2022-09-25 18:18:05', '2022-09-25 18:18:05'),
(18, 17, 'Your Order Status has been changed to Rejected', 'مرفوض تم تغيير حالة طلبك إلى', '2022-09-25 18:27:13', '2022-09-25 18:27:13'),
(19, 19, 'Your Order Status has been changed to Rejected', 'مرفوض تم تغيير حالة طلبك إلى', '2022-09-25 18:36:14', '2022-09-25 18:36:14'),
(20, 19, 'Your Order Status has been changed to Accepted', 'وافقت تم تغيير حالة طلبك إلى', '2022-09-25 18:37:14', '2022-09-25 18:37:14'),
(21, 19, 'Your Order Status has been changed to Rejected', 'مرفوض تم تغيير حالة طلبك إلى', '2022-09-25 18:39:59', '2022-09-25 18:39:59'),
(22, 19, 'Your Order Status has been changed to Accepted', 'وافقت تم تغيير حالة طلبك إلى', '2022-09-25 18:40:17', '2022-09-25 18:40:17'),
(23, 19, 'Your Order Status has been changed to Accepted', 'وافقت تم تغيير حالة طلبك إلى', '2022-09-25 18:40:20', '2022-09-25 18:40:20'),
(24, 19, 'Your Order Status has been changed to Rejected', 'مرفوض تم تغيير حالة طلبك إلى', '2022-09-25 18:42:20', '2022-09-25 18:42:20'),
(25, 19, 'Your Order Status has been changed to Accepted', 'وافقت تم تغيير حالة طلبك إلى', '2022-09-25 18:44:16', '2022-09-25 18:44:16'),
(26, 19, 'Your Order Status has been changed to Rejected', 'مرفوض تم تغيير حالة طلبك إلى', '2022-09-25 18:45:02', '2022-09-25 18:45:02'),
(27, 15, 'Your Order Status has been changed to Accepted', 'وافقت تم تغيير حالة طلبك إلى', '2022-09-25 18:46:45', '2022-09-25 18:46:45'),
(63, 74, 'Your Order has been Placed', 'وقد وضعت طلبك', '2022-10-10 07:04:26', '2022-10-10 07:04:26'),
(64, 74, 'Your Order Status has been changed to Accepted', 'وافقت تم تغيير حالة طلبك إلى', '2022-10-10 18:40:16', '2022-10-10 18:40:16'),
(65, 75, 'Your Order has been Placed', 'وقد وضعت طلبك', '2022-10-10 16:12:49', '2022-10-10 16:12:49');

-- --------------------------------------------------------

--
-- Table structure for table `order_products`
--

DROP TABLE IF EXISTS `order_products`;
CREATE TABLE IF NOT EXISTS `order_products` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_fabric_id` int(11) NOT NULL,
  `product_size_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_products`
--

INSERT INTO `order_products` (`id`, `order_id`, `product_id`, `product_fabric_id`, `product_size_id`, `quantity`, `price`, `created_at`, `updated_at`) VALUES
(1, 1, 9, 3, 3, 2, 34.00, '2022-08-19 06:34:30', '2022-08-19 06:34:30'),
(2, 1, 10, 3, 3, 4, 57.00, '2022-08-19 06:34:30', '2022-08-19 06:34:30'),
(7, 6, 11, 3, 3, 2, 50.00, '2022-08-24 16:46:06', '2022-08-24 16:46:06'),
(8, 7, 10, 3, 4, 1, 98.00, '2022-08-25 07:39:58', '2022-08-25 07:39:58'),
(9, 8, 10, 3, 4, 1, 98.00, '2022-08-25 08:39:54', '2022-08-25 08:39:54'),
(10, 9, 11, 3, 3, 1, 50.00, '2022-08-25 08:42:17', '2022-08-25 08:42:17'),
(11, 10, 11, 3, 3, 1, 50.00, '2022-08-26 04:42:20', '2022-08-26 04:42:20'),
(12, 11, 10, 3, 4, 1, 98.00, '2022-08-26 05:18:11', '2022-08-26 05:18:11'),
(13, 12, 10, 3, 4, 1, 98.00, '2022-08-29 08:34:46', '2022-08-29 08:34:46'),
(14, 13, 11, 4, 3, 1, 500.00, '2022-08-29 15:34:35', '2022-08-29 15:34:35'),
(16, 15, 9, 3, 3, 3, 34.00, '2022-09-19 04:02:25', '2022-09-19 04:02:25'),
(17, 16, 9, 3, 3, 1, 34.00, '2022-09-19 07:35:34', '2022-09-19 07:35:34'),
(18, 17, 9, 3, 3, 1, 34.00, '2022-09-19 07:41:56', '2022-09-19 07:41:56'),
(20, 19, 9, 3, 3, 1, 34.00, '2022-09-21 01:16:57', '2022-09-21 01:16:57');

-- --------------------------------------------------------

--
-- Table structure for table `order_statuses`
--

DROP TABLE IF EXISTS `order_statuses`;
CREATE TABLE IF NOT EXISTS `order_statuses` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `title_ar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_statuses`
--

INSERT INTO `order_statuses` (`id`, `title`, `created_at`, `updated_at`, `title_ar`) VALUES
(1, 'Pending', NULL, NULL, 'قيد الانتظار'),
(2, 'Accepted', NULL, NULL, 'وافقت'),
(3, 'Rejected', NULL, NULL, 'مرفوض'),
(4, 'Completed', NULL, NULL, 'مكتمل');

-- --------------------------------------------------------

--
-- Table structure for table `order_types`
--

DROP TABLE IF EXISTS `order_types`;
CREATE TABLE IF NOT EXISTS `order_types` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
CREATE TABLE IF NOT EXISTS `pages` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `template_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `post_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `extras` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `language_id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `is_delete` int(11) NOT NULL DEFAULT '1',
  `page_status_id` int(11) NOT NULL,
  `is_slug` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `template_id`, `title`, `slug`, `post_type`, `content`, `extras`, `language_id`, `parent_id`, `is_delete`, `page_status_id`, `is_slug`, `created_at`, `updated_at`) VALUES
(1, '1', 'Home', 'home', 'pages', '_tokenXSOMneCQeq9zB3LDiljMlDF49zZTlu1SSuDMSjqRtemplate_id1titleHomeslughomeextrashero_banner_sectionmain_titleGETYOUROWNtitleFASHIONSTATEMENTdescriptionLoremIpsumissimplydummytextoftheprintingandtypesettingindustryLoremIpsumhasbeentheindustrysstandardbutton_linktitleShopNowlinkwwwgooglecomtargetonimage39mobile_image39main_titleGETYOUROWNtitleFASHIONSTATEMENTdescriptionLoremIpsumissimplydummytextoftheprintingandtypesettingindustryLoremIpsumhasbeentheindustrysstandardbutton_linktitleShopNowlinktargetonimage39mobile_image39main_titleGETYOUROWNtitleFASHIONSTATEMENTdescriptionLoremIpsumissimplydummytextoftheprintingandtypesettingindustryLoremIpsumhasbeentheindustrysstandardbutton_linktitleShowNowlinktargetonimage39mobile_image39how_it_works_sectiontitleHOWITWORKSsub_titleASTEPBYSTEPGUIDEsectionsstep_textstepstep_number01step_titleSELECTTAILORmain_textChiffonSatinFabricbutton_linktitleSELECTlinkclicktargetonstep_image40main_image42step_textstepstep_number01step_titleSELECTTAILORmain_textChiffonSatinFabricbutton_linktitleSELECTlinktargetonstep_image40main_image42step_textstepstep_number01step_titleSELECTTAILORmain_textChiffonSatinFabricbutton_linktitleSELECTlinktargetonstep_image40main_image42step_textstepstep_number01step_titleSELECTTAILORmain_textChiffonSatinFabricbutton_linktitleSelectlinktargetonstep_image40main_image42step_textstepstep_number01step_titleSELECTTAILORmain_textChiffonSatinFabricbutton_linktitleSELECTlinktargetonstep_image40main_image42top_design_sectionmain_titleKHAWARtitleTOPDESIGNSdesigns13about_us_sectionmain_titleABOUTUStitleTHESTYLEINSPIRATIONdescription_oneLoremIpsumissimplydummytextoftheprintingandtypesettingindustryLoremIpsumhasbeentheindustrysstandarddummytextdescription_twoLoremIpsumissimplydummytextoftheprintingandtypesettingindustryLoremIpsumhasbeentheindustrysstandarddummytexteversincethe1500swhenanunknownprintertookagalleyoftypeandscrambledittomakeatypespecimenbookIthassurvivednotonlyfivecenturiesbutalsotheleapintoelectronictypesettingremainingessentiallyunchangedItwaspopularisedinthe1960swiththereleaseread_more_buttontitleReadMorelinkleft_image7right_image8our_product_sectionmain_titleOURPRODUCTtitleOFFERINGAWIDERANGEOFKANDORASdescriptionLoremIpsumissimplydummytextoftheprintingandtypesettingindustryLoremIpsumhasbeentheindustrysstandarddummytexteveexplore_all_button_linktitleExploreAlllinkproducts91011featured_tailors_sectionmain_titleFEATUREDTAILORStitleTHEBESTINTHEBUSINESSexplore_all_button_linktitleExploreAlllinktailors8912testimonial_sectionmain_titleTESTIMONIALStitleWHATOURCLIENTSAYdescriptionLoremIpsumissimplydummytextoftheprintingandtypesettingindustryLoremIpsumhasbeentheindustrysstandarddummytexteversincethe1500swhenanunknownprintertookagalleryoftypeandscrambledittomakeatypespecimenbookexplore_all_button_linktitleExploreAlllinktestimonials234meta_titleHomemeta_descriptionHomepage_status_id2language_id1parent_idnullpost_typepages', '{\"hero_banner_section\":[{\"main_title\":\"GET YOUR OWN\",\"title\":\"FASHION STATEMENT\",\"description\":\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard.\",\"button_link\":\"{\\\"title\\\":\\\"Shop Now\\\",\\\"link\\\":\\\"www.google.com\\\",\\\"target\\\":\\\"on\\\"}\",\"image\":\"39\",\"mobile_image\":\"39\"},{\"main_title\":\"GET YOUR OWN\",\"title\":\"FASHION STATEMENT\",\"description\":\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard.\",\"button_link\":\"{\\\"title\\\":\\\"Shop Now\\\",\\\"link\\\":\\\"\\/\\\",\\\"target\\\":\\\"on\\\"}\",\"image\":\"39\",\"mobile_image\":\"39\"},{\"main_title\":\"GET YOUR OWN\",\"title\":\"FASHION STATEMENT\",\"description\":\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard.\",\"button_link\":\"{\\\"title\\\":\\\"Show Now\\\",\\\"link\\\":\\\"\\/\\\",\\\"target\\\":\\\"on\\\"}\",\"image\":\"39\",\"mobile_image\":\"39\"}],\"how_it_works_section\":{\"title\":\"HOW IT WORKS\",\"sub_title\":\"A STEP BY STEP GUIDE\",\"sections\":[{\"step_text\":\"step\",\"step_number\":\"01\",\"step_title\":\"SELECT TAILOR\",\"main_text\":\"Chiffon Satin Fabric\",\"button_link\":\"{\\\"title\\\":\\\"SELECT\\\",\\\"link\\\":\\\"\\/click\\\",\\\"target\\\":\\\"on\\\"}\",\"step_image\":\"40\",\"main_image\":\"42\"},{\"step_text\":\"step\",\"step_number\":\"01\",\"step_title\":\"SELECT TAILOR\",\"main_text\":\"Chiffon Satin Fabric\",\"button_link\":\"{\\\"title\\\":\\\"SELECT\\\",\\\"link\\\":\\\"\\/\\\",\\\"target\\\":\\\"on\\\"}\",\"step_image\":\"40\",\"main_image\":\"42\"},{\"step_text\":\"step\",\"step_number\":\"01\",\"step_title\":\"SELECT TAILOR\",\"main_text\":\"Chiffon Satin Fabric\",\"button_link\":\"{\\\"title\\\":\\\"SELECT\\\",\\\"link\\\":\\\"\\/\\\",\\\"target\\\":\\\"on\\\"}\",\"step_image\":\"40\",\"main_image\":\"42\"},{\"step_text\":\"step\",\"step_number\":\"01\",\"step_title\":\"SELECT TAILOR\",\"main_text\":\"Chiffon Satin Fabric\",\"button_link\":\"{\\\"title\\\":\\\"Select\\\",\\\"link\\\":\\\"\\/\\\",\\\"target\\\":\\\"on\\\"}\",\"step_image\":\"40\",\"main_image\":\"42\"},{\"step_text\":\"step\",\"step_number\":\"01\",\"step_title\":\"SELECT TAILOR\",\"main_text\":\"Chiffon Satin Fabric\",\"button_link\":\"{\\\"title\\\":\\\"SELECT\\\",\\\"link\\\":\\\"\\/\\\",\\\"target\\\":\\\"on\\\"}\",\"step_image\":\"40\",\"main_image\":\"42\"}]},\"top_design_section\":{\"main_title\":\"KHAWAR\",\"title\":\"TOP DESIGNS\",\"designs\":[\"1\",\"3\"]},\"about_us_section\":{\"main_title\":\"ABOUT US\",\"title\":\"THE STYLE INSPIRATION\",\"description_one\":\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text\",\"description_two\":\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It hassurvived not only five centuries, but also the leap into electronic typesetting,remaining essentially unchanged. It was popularised in the 1960s with the release\",\"read_more_button\":\"{\\\"title\\\":\\\"Read More\\\",\\\"link\\\":\\\"\\/\\\"}\",\"left_image\":\"7\",\"right_image\":\"8\"},\"our_product_section\":{\"main_title\":\"OUR PRODUCT\",\"title\":\"OFFERING A WIDE RANGE OF KANDORAS\",\"description\":\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text eve.\",\"explore_all_button_link\":\"{\\\"title\\\":\\\"Explore All\\\",\\\"link\\\":\\\"\\/\\\"}\",\"products\":[\"9\",\"10\",\"11\"]},\"featured_tailors_section\":{\"main_title\":\"FEATURED TAILORS\",\"title\":\"THE BEST IN THE BUSINESS\",\"explore_all_button_link\":\"{\\\"title\\\":\\\"Explore All\\\",\\\"link\\\":\\\"\\/\\\"}\",\"tailors\":[\"8\",\"9\",\"12\"]},\"testimonial_section\":{\"main_title\":\"TESTIMONIALS\",\"title\":\"WHAT OUR CLIENT SAY\",\"description\":\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a gallery of type and scrambled it to make a type specimen book.\",\"explore_all_button_link\":\"{\\\"title\\\":\\\"Explore All\\\",\\\"link\\\":\\\"\\/\\\"}\",\"testimonials\":[\"2\",\"3\",\"4\"]}}', 1, NULL, 1, 2, 1, '2022-08-10 22:32:30', '2022-10-03 14:12:26'),
(2, '2', 'About US', 'about-us', 'pages', '_tokenQFXg3ObIuzUTgQgR0aXSS7XjbO7JKVTQFMhUcqAAtemplate_id2titleAboutUSslugaboutusextrasbanner_sectionmain_titleABOUTUStitleWHATsub_titleWEDOimage21image_mobile21our_approach_sectiontitleOURAPPROACHdescriptionLoremIpsumissimplydummytextoftheprintingandtypesettingindustryLoremIpsumhasbeentheindustrysstandarddummytexteversincethe1500swhenanunknownprintertookagalleyoftypeandscrambledittomakeatypespecimenbookIthassurvivednotonlyfivecenturiesbutalsotheleapintoelectronictypesettingremainingessentiallyunchangedimage22mission_and_vision_sectiontitleMISSIONVISIONdescriptionLoremIpsumissimplydummytextoftheprintingandtypesettingindustryLoremIpsumhasbeentheindustrysstandarddummytexteversincethe1500swhenanunknownprintertookagalleyoftypeandscrambledittomakeatypespecimenbookIthassurvivednotonlyfivecenturiesbutalsotheleapintoelectronictypesettingremainingessentiallyunchangedimage23from_the_management_sectiontitleFROMTHEMANAGEMENTdescriptionLoremIpsumissimplydummytextoftheprintingandtypesettingindustryLoremIpsumhasbeentheindustrysstandarddummytexteversincethe1500swhenanunknownprintertookagalleyoftypeandscrambledittomakeatypespecimenbookIthassurvivednotonlyfivecenturiesbutalsotheleapintoelectronictypesettingimage23meta_titleAboutUSmeta_descriptionAboutUSpage_status_id2language_id1parent_idnullpost_typepages', '{\"banner_section\":{\"main_title\":\"ABOUT US\",\"title\":\"WHAT\",\"sub_title\":\"WE DO\",\"image\":\"21\",\"image_mobile\":\"21\"},\"our_approach_section\":{\"title\":\"OUR APPROACH\",\"description\":\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.\",\"image\":\"22\"},\"mission_and_vision_section\":{\"title\":\"MISSION & VISION\",\"description\":\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.\",\"image\":\"23\"},\"from_the_management_section\":{\"title\":\"FROM THE MANAGEMENT\",\"description\":\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting,\",\"image\":\"23\"}}', 1, NULL, 1, 2, 1, '2022-08-11 09:48:56', '2022-09-20 14:38:50'),
(3, '3', 'SHOP', 'shop', 'pages', '_tokenxlZvKJMyyvtM96jP0z9UcMp9n8IpiEwbrXObfxBQtitleSHOPmeta_titleSHOPmeta_descriptionSHOPextrasbanner_sectionmain_titleSHOPtitleSTOREsub_titleCOLLECTIONimage25image_mobile25kandoras_sectiontitleREADYMADEKANDOORASdescriptionLoremIpsumissimplydummytextoftheprintingandtypesettingindustryLoremIpsumhasbeentheindustrysstandarddummytexteversincethe1500swhenanunknownprintertookagalleyoftypeandscrambledittomakeatypespecimenbooktemplate_id3page_status_id2language_id1parent_idnullpost_typepages', '{\"banner_section\":{\"main_title\":\"SHOP\",\"title\":\"STORE\",\"sub_title\":\"COLLECTION\",\"image\":\"25\",\"image_mobile\":\"25\"},\"kandoras_section\":{\"title\":\"READYMADE KANDOORAS\",\"description\":\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.\"}}', 1, NULL, 0, 2, 1, '2022-08-11 10:02:38', '2022-08-11 10:02:38'),
(4, '4', 'TAILORS', 'tailors', 'pages', '_tokenxlZvKJMyyvtM96jP0z9UcMp9n8IpiEwbrXObfxBQtitleTAILORSmeta_titleTAILORSmeta_descriptionTAILORSextrasbanner_sectionmain_titleTAILORStitleBESTINsub_titleBUSINESSimage26image_mobile27tailors_sectiontitleTHEYMAKEITHAPPENdescriptionLoremIpsumissimplydummytextoftheprintingandtypesettingindustryLoremIpsumhasbeentheindustrysstandarddummytexteversincethe1500swhenanunknownprintertookagalleyoftypeandscrambledittomakeatypespecimenbooktemplate_id4page_status_id2language_id1parent_idnullpost_typepages', '{\"banner_section\":{\"main_title\":\"TAILORS\",\"title\":\"BEST IN\",\"sub_title\":\"BUSINESS\",\"image\":\"26\",\"image_mobile\":\"27\"},\"tailors_section\":{\"title\":\"THEY MAKE IT HAPPEN\",\"description\":\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.\"}}', 1, NULL, 0, 2, 1, '2022-08-11 10:06:52', '2022-08-11 10:06:52'),
(5, '5', 'TESTIMONIALS', 'testimonials', 'pages', '_tokenxlZvKJMyyvtM96jP0z9UcMp9n8IpiEwbrXObfxBQtitleTESTIMONIALSmeta_titleTESTIMONIALSmeta_descriptionTESTIMONIALSextrasbanner_sectionmain_titleTESTIMONIALStitleWHATsub_titleTHEYSAYimage28image_mobile28testimonials_sectiontitleTESTIMONIALSdescriptionLoremIpsumissimplydummytextoftheprintingandtypesettingindustryLoremIpsumhasbeentheindustrysstandarddummytextevetemplate_id5page_status_id2language_id1parent_idnullpost_typepages', '{\"banner_section\":{\"main_title\":\"TESTIMONIALS\",\"title\":\"WHAT\",\"sub_title\":\"THEY SAY\",\"image\":\"28\",\"image_mobile\":\"28\"},\"testimonials_section\":{\"title\":\"TESTIMONIALS\",\"description\":\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text eve.\"}}', 1, NULL, 0, 2, 1, '2022-08-11 12:30:31', '2022-08-11 12:30:31'),
(6, '6', 'CONTACT US', 'contact-us', 'pages', '_tokenaXojdK1Mb8PBtTOGI7N0meF8kWYDC3RCddVsiJletitleCONTACTUSslug_fieldcontactusmodel_fieldAppModelsPagemodel_field_id6slugcontactusmeta_titleCONTACTUSmeta_descriptionCONTACTUSextrasbanner_sectionmain_titleCONTACTUStitleLETSsub_titleCONNECTimage29image_mobile29write_to_us_sectiontitleWRITETOUSsub_titleFeelfreetoaskussupport_titleSUPPORTsupport_value97186525855email_titleEMAILemail_valuedigitailorexamplecomimage43template_id6page_status_id2language_id1parent_idnullpost_typepages', '{\"banner_section\":{\"main_title\":\"CONTACT US\",\"title\":\"LETS\",\"sub_title\":\"CONNECT\",\"image\":\"29\",\"image_mobile\":\"29\"},\"write_to_us_section\":{\"title\":\"WRITE TO US\",\"sub_title\":\"Feel free to ask us.\",\"support_title\":\"SUPPORT\",\"support_value\":\"+971 86525855\",\"email_title\":\"EMAIL\",\"email_value\":\"digitailor@example.com\",\"image\":\"43\"}}', 1, NULL, 1, 2, 1, '2022-08-11 12:37:03', '2022-08-15 20:13:22'),
(8, '3', 'محل', 'shop', 'pages', '_tokengji5TtyKWX2Nr9Z8DmjADIOH7BzHklLcR8geeDUptitleمحلmeta_titleمحلmeta_descriptionمحلextrasbanner_sectionmain_titleمحلtitleمتجرsub_titleمجموعةimage25image_mobile25kandoras_sectiontitleإعدادالكندوراتالجاهزةdescriptionلوريمإيبسومهوببساطةنصشكلييستخدمفيصناعةالطباعةوالتنضيدكانLoremIpsumهوالنصالوهميالقياسيفيالصناعةمنذالقرنالخامسعشرالميلاديعندماأخذتطابعةغيرمعروفةلوحامنالنوعوتدافعتعليهلعملكتابعينةtemplate_id3page_status_id2language_id2parent_id3post_typepages', '{\"banner_section\":{\"main_title\":\"\\u0645\\u062d\\u0644\",\"title\":\"\\u0645\\u062a\\u062c\\u0631\",\"sub_title\":\"\\u0645\\u062c\\u0645\\u0648\\u0639\\u0629\",\"image\":\"25\",\"image_mobile\":\"25\"},\"kandoras_section\":{\"title\":\"\\u0625\\u0639\\u062f\\u0627\\u062f \\u0627\\u0644\\u0643\\u0646\\u062f\\u0648\\u0631\\u0627\\u062a \\u0627\\u0644\\u062c\\u0627\\u0647\\u0632\\u0629\",\"description\":\"\\u0644\\u0648\\u0631\\u064a\\u0645 \\u0625\\u064a\\u0628\\u0633\\u0648\\u0645 \\u0647\\u0648 \\u0628\\u0628\\u0633\\u0627\\u0637\\u0629 \\u0646\\u0635 \\u0634\\u0643\\u0644\\u064a \\u064a\\u0633\\u062a\\u062e\\u062f\\u0645 \\u0641\\u064a \\u0635\\u0646\\u0627\\u0639\\u0629 \\u0627\\u0644\\u0637\\u0628\\u0627\\u0639\\u0629 \\u0648\\u0627\\u0644\\u062a\\u0646\\u0636\\u064a\\u062f. \\u0643\\u0627\\u0646 Lorem Ipsum \\u0647\\u0648 \\u0627\\u0644\\u0646\\u0635 \\u0627\\u0644\\u0648\\u0647\\u0645\\u064a \\u0627\\u0644\\u0642\\u064a\\u0627\\u0633\\u064a \\u0641\\u064a \\u0627\\u0644\\u0635\\u0646\\u0627\\u0639\\u0629 \\u0645\\u0646\\u0630 \\u0627\\u0644\\u0642\\u0631\\u0646 \\u0627\\u0644\\u062e\\u0627\\u0645\\u0633 \\u0639\\u0634\\u0631 \\u0627\\u0644\\u0645\\u064a\\u0644\\u0627\\u062f\\u064a \\u060c \\u0639\\u0646\\u062f\\u0645\\u0627 \\u0623\\u062e\\u0630\\u062a \\u0637\\u0627\\u0628\\u0639\\u0629 \\u063a\\u064a\\u0631 \\u0645\\u0639\\u0631\\u0648\\u0641\\u0629 \\u0644\\u0648\\u062d\\u064b\\u0627 \\u0645\\u0646 \\u0627\\u0644\\u0646\\u0648\\u0639 \\u0648\\u062a\\u062f\\u0627\\u0641\\u0639\\u062a \\u0639\\u0644\\u064a\\u0647 \\u0644\\u0639\\u0645\\u0644 \\u0643\\u062a\\u0627\\u0628 \\u0639\\u064a\\u0646\\u0629.\"}}', 2, 3, 0, 2, 1, '2022-08-12 20:56:46', '2022-08-12 20:56:46'),
(9, '4', 'الخياطون', 'tailors', 'pages', '_tokengji5TtyKWX2Nr9Z8DmjADIOH7BzHklLcR8geeDUptitleالخياطونmeta_titleالخياطونmeta_descriptionالخياطونextrasbanner_sectionmain_titleالخياطونtitleالخياطونsub_titleالخياطونimage25image_mobile25tailors_sectiontitleالخياطونdescriptionالخياطونtemplate_id4page_status_id2language_id2parent_id4post_typepages', '{\"banner_section\":{\"main_title\":\"\\u0627\\u0644\\u062e\\u064a\\u0627\\u0637\\u0648\\u0646\",\"title\":\"\\u0627\\u0644\\u062e\\u064a\\u0627\\u0637\\u0648\\u0646\",\"sub_title\":\"\\u0627\\u0644\\u062e\\u064a\\u0627\\u0637\\u0648\\u0646\",\"image\":\"25\",\"image_mobile\":\"25\"},\"tailors_section\":{\"title\":\"\\u0627\\u0644\\u062e\\u064a\\u0627\\u0637\\u0648\\u0646\",\"description\":\"\\u0627\\u0644\\u062e\\u064a\\u0627\\u0637\\u0648\\u0646\"}}', 2, 4, 0, 2, 1, '2022-08-12 21:04:32', '2022-08-12 21:05:04'),
(10, '1', 'مسكن', 'home', 'pages', '_tokenSUVG9R89HZq8Kk9uGk6eClbY6jnC5LvbQAjsumVqtemplate_id1titleمسكنslughomeextrashero_banner_sectionmain_titleGETYOUROWNtitleFASHIONSTATEMENTdescriptionLoremIpsumissimplydummytextoftheprintingandtypesettingindustryLoremIpsumhasbeentheindustrysstandardbutton_linktitleShopNowlinkwwwgooglecomtargetonimage39mobile_image39main_titleGETYOUROWNtitleFASHIONSTATEMENTdescriptionLoremIpsumissimplydummytextoftheprintingandtypesettingindustryLoremIpsumhasbeentheindustrysstandardbutton_linktitleShopNowlinktargetonimage39mobile_image39main_titleGETYOUROWNtitleFASHIONSTATEMENTdescriptionLoremIpsumissimplydummytextoftheprintingandtypesettingindustryLoremIpsumhasbeentheindustrysstandardbutton_linktitleShowNowlinktargetonimage39mobile_image39how_it_works_sectiontitleHOWITWORKSsub_titleASTEPBYSTEPGUIDEsectionsstep_textstepstep_number01step_titleSELECTTAILORmain_textChiffonSatinFabricbutton_linktitleSELECTlinkclicktargetonstep_image40main_image42step_textstepstep_number01step_titleSELECTTAILORmain_textChiffonSatinFabricbutton_linktitleSELECTlinktargetonstep_image40main_image42step_textstepstep_number01step_titleSELECTTAILORmain_textChiffonSatinFabricbutton_linktitleSELECTlinktargetonstep_image40main_image42step_textstepstep_number01step_titleSELECTTAILORmain_textChiffonSatinFabricbutton_linktitleSelectlinktargetonstep_image40main_image42step_textstepstep_number01step_titleSELECTTAILORmain_textChiffonSatinFabricbutton_linktitleSELECTlinktargetonstep_image40main_image42about_us_sectionmain_titleABOUTUStitleTHESTYLEINSPIRATIONdescription_oneLoremIpsumissimplydummytextoftheprintingandtypesettingindustryLoremIpsumhasbeentheindustrysstandarddummytextdescription_twoLoremIpsumissimplydummytextoftheprintingandtypesettingindustryLoremIpsumhasbeentheindustrysstandarddummytexteversincethe1500swhenanunknownprintertookagalleyoftypeandscrambledittomakeatypespecimenbookIthassurvivednotonlyfivecenturiesbutalsotheleapintoelectronictypesettingremainingessentiallyunchangedItwaspopularisedinthe1960swiththereleaseread_more_buttontitleReadMorelinkleft_image7right_image8our_product_sectionmain_titleOURPRODUCTtitleOFFERINGAWIDERANGEOFKANDORASdescriptionLoremIpsumissimplydummytextoftheprintingandtypesettingindustryLoremIpsumhasbeentheindustrysstandarddummytexteveexplore_all_button_linktitleExploreAlllinkproducts91011featured_tailors_sectionmain_titleFEATUREDTAILORStitleTHEBESTINTHEBUSINESSexplore_all_button_linktitleExploreAlllinktailors8912testimonial_sectionmain_titleTESTIMONIALStitleWHATOURCLIENTSAYdescriptionLoremIpsumissimplydummytextoftheprintingandtypesettingindustryLoremIpsumhasbeentheindustrysstandarddummytexteversincethe1500swhenanunknownprintertookagalleryoftypeandscrambledittomakeatypespecimenbookexplore_all_button_linktitleExploreAlllinktestimonials234meta_titleمسكنmeta_descriptionمسكنpage_status_id2language_id2parent_id1post_typepages', '{\"hero_banner_section\":[{\"main_title\":\"GET YOUR OWN\",\"title\":\"FASHION STATEMENT\",\"description\":\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard.\",\"button_link\":\"{\\\"title\\\":\\\"Shop Now\\\",\\\"link\\\":\\\"www.google.com\\\",\\\"target\\\":\\\"on\\\"}\",\"image\":\"39\",\"mobile_image\":\"39\"},{\"main_title\":\"GET YOUR OWN\",\"title\":\"FASHION STATEMENT\",\"description\":\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard.\",\"button_link\":\"{\\\"title\\\":\\\"Shop Now\\\",\\\"link\\\":\\\"\\/\\\",\\\"target\\\":\\\"on\\\"}\",\"image\":\"39\",\"mobile_image\":\"39\"},{\"main_title\":\"GET YOUR OWN\",\"title\":\"FASHION STATEMENT\",\"description\":\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard.\",\"button_link\":\"{\\\"title\\\":\\\"Show Now\\\",\\\"link\\\":\\\"\\/\\\",\\\"target\\\":\\\"on\\\"}\",\"image\":\"39\",\"mobile_image\":\"39\"}],\"how_it_works_section\":{\"title\":\"HOW IT WORKS\",\"sub_title\":\"A STEP BY STEP GUIDE\",\"sections\":[{\"step_text\":\"step\",\"step_number\":\"01\",\"step_title\":\"SELECT TAILOR\",\"main_text\":\"Chiffon Satin Fabric\",\"button_link\":\"{\\\"title\\\":\\\"SELECT\\\",\\\"link\\\":\\\"\\/click\\\",\\\"target\\\":\\\"on\\\"}\",\"step_image\":\"40\",\"main_image\":\"42\"},{\"step_text\":\"step\",\"step_number\":\"01\",\"step_title\":\"SELECT TAILOR\",\"main_text\":\"Chiffon Satin Fabric\",\"button_link\":\"{\\\"title\\\":\\\"SELECT\\\",\\\"link\\\":\\\"\\/\\\",\\\"target\\\":\\\"on\\\"}\",\"step_image\":\"40\",\"main_image\":\"42\"},{\"step_text\":\"step\",\"step_number\":\"01\",\"step_title\":\"SELECT TAILOR\",\"main_text\":\"Chiffon Satin Fabric\",\"button_link\":\"{\\\"title\\\":\\\"SELECT\\\",\\\"link\\\":\\\"\\/\\\",\\\"target\\\":\\\"on\\\"}\",\"step_image\":\"40\",\"main_image\":\"42\"},{\"step_text\":\"step\",\"step_number\":\"01\",\"step_title\":\"SELECT TAILOR\",\"main_text\":\"Chiffon Satin Fabric\",\"button_link\":\"{\\\"title\\\":\\\"Select\\\",\\\"link\\\":\\\"\\/\\\",\\\"target\\\":\\\"on\\\"}\",\"step_image\":\"40\",\"main_image\":\"42\"},{\"step_text\":\"step\",\"step_number\":\"01\",\"step_title\":\"SELECT TAILOR\",\"main_text\":\"Chiffon Satin Fabric\",\"button_link\":\"{\\\"title\\\":\\\"SELECT\\\",\\\"link\\\":\\\"\\/\\\",\\\"target\\\":\\\"on\\\"}\",\"step_image\":\"40\",\"main_image\":\"42\"}]},\"about_us_section\":{\"main_title\":\"ABOUT US\",\"title\":\"THE STYLE INSPIRATION\",\"description_one\":\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text\",\"description_two\":\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It hassurvived not only five centuries, but also the leap into electronic typesetting,remaining essentially unchanged. It was popularised in the 1960s with the release\",\"read_more_button\":\"{\\\"title\\\":\\\"Read More\\\",\\\"link\\\":\\\"\\/\\\"}\",\"left_image\":\"7\",\"right_image\":\"8\"},\"our_product_section\":{\"main_title\":\"OUR PRODUCT\",\"title\":\"OFFERING A WIDE RANGE OF KANDORAS\",\"description\":\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text eve.\",\"explore_all_button_link\":\"{\\\"title\\\":\\\"Explore All\\\",\\\"link\\\":\\\"\\/\\\"}\",\"products\":[\"9\",\"10\",\"11\"]},\"featured_tailors_section\":{\"main_title\":\"FEATURED TAILORS\",\"title\":\"THE BEST IN THE BUSINESS\",\"explore_all_button_link\":\"{\\\"title\\\":\\\"Explore All\\\",\\\"link\\\":\\\"\\/\\\"}\",\"tailors\":[\"8\",\"9\",\"12\"]},\"testimonial_section\":{\"main_title\":\"TESTIMONIALS\",\"title\":\"WHAT OUR CLIENT SAY\",\"description\":\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a gallery of type and scrambled it to make a type specimen book.\",\"explore_all_button_link\":\"{\\\"title\\\":\\\"Explore All\\\",\\\"link\\\":\\\"\\/\\\"}\",\"testimonials\":[\"2\",\"3\",\"4\"]}}', 2, 1, 1, 2, 1, '2022-08-10 22:32:30', '2022-09-02 12:48:01'),
(11, '6', 'اتصل بنا', 'contact-us', 'pages', '_tokenFfS9yHkKIIrUwuNgxADnDZ49Acl0cmSGUvuqCDPKtitleاتصلبناmeta_titleاتصلبناmeta_descriptionاتصلبناextrasbanner_sectionmain_titleاتصلبناtitleاتصلبناsub_titleاتصلبناimage29image_mobile29write_to_us_sectiontitleاكتبلناsub_titleاكتبلناsupport_titleاكتبلناsupport_value97186525855email_titleاكتبلناemail_valuedigitailorexamplecomimage43template_id6page_status_id2language_id2parent_id6post_typepagesslugcontactus', '{\"banner_section\":{\"main_title\":\"\\u0627\\u062a\\u0635\\u0644 \\u0628\\u0646\\u0627\",\"title\":\"\\u0627\\u062a\\u0635\\u0644 \\u0628\\u0646\\u0627\",\"sub_title\":\"\\u0627\\u062a\\u0635\\u0644 \\u0628\\u0646\\u0627\",\"image\":\"29\",\"image_mobile\":\"29\"},\"write_to_us_section\":{\"title\":\"\\u0627\\u0643\\u062a\\u0628 \\u0644\\u0646\\u0627\",\"sub_title\":\"\\u0627\\u0643\\u062a\\u0628 \\u0644\\u0646\\u0627\",\"support_title\":\"\\u0627\\u0643\\u062a\\u0628 \\u0644\\u0646\\u0627\",\"support_value\":\"+97186525855\",\"email_title\":\"\\u0627\\u0643\\u062a\\u0628 \\u0644\\u0646\\u0627\",\"email_value\":\"digitailor@example.com\",\"image\":\"43\"}}', 2, 6, 1, 2, 1, '2022-08-16 11:42:13', '2022-08-16 11:42:13'),
(12, '8', 'Cart', 'cart', 'pages', '_tokenNEwm4CqgyXx1j3ZXyPNjlOLJTbs6lkIpn8kE2Cq9titleCartmeta_titleCartmeta_descriptionCartextrascart_page_sectiontitle_oneYOURCARTtitle_twoCARTSUMMARYcheckout_button_textPROCEEDTOCHECKOUTshopping_button_textCONTINUESHOPPINGtemplate_id8page_status_id2language_id1parent_idnullpost_typepagesslugnull', '{\"cart_page_section\":{\"title_one\":\"YOUR CART\",\"title_two\":\"CART SUMMARY\",\"checkout_button_text\":\"PROCEED TO CHECKOUT\",\"shopping_button_text\":\"CONTINUE SHOPPING\"}}', 1, NULL, 0, 2, 1, '2022-08-17 03:57:09', '2022-08-17 03:57:09'),
(13, '8', 'عربة التسوق', 'cart', 'pages', '_tokenNEwm4CqgyXx1j3ZXyPNjlOLJTbs6lkIpn8kE2Cq9titleعربةالتسوقmeta_titleعربةالتسوقmeta_descriptionعربةالتسوقextrascart_page_sectiontitle_oneعربةالتسوقtitle_twoعربةالتسوقcheckout_button_textعربةالتسوقshopping_button_textعربةالتسوقtemplate_id8page_status_id2language_id2parent_id12post_typepagesslugcart', '{\"cart_page_section\":{\"title_one\":\"\\u0639\\u0631\\u0628\\u0629 \\u0627\\u0644\\u062a\\u0633\\u0648\\u0642\",\"title_two\":\"\\u0639\\u0631\\u0628\\u0629 \\u0627\\u0644\\u062a\\u0633\\u0648\\u0642\",\"checkout_button_text\":\"\\u0639\\u0631\\u0628\\u0629 \\u0627\\u0644\\u062a\\u0633\\u0648\\u0642\",\"shopping_button_text\":\"\\u0639\\u0631\\u0628\\u0629 \\u0627\\u0644\\u062a\\u0633\\u0648\\u0642\"}}', 2, 12, 0, 2, 1, '2022-08-17 03:59:16', '2022-08-17 03:59:16'),
(22, '7', 'FAQ’S', 'faq', 'pages', '_tokenAwiPM4z8wb42oB1wH1dereiOc61ltZjmcf4Z5fhatitleFAQSmeta_titleFAQSmeta_descriptionFAQSextrasbanner_sectionmain_titleFAQStitleFEELFREEsub_titleTOASKimage69image_mobile70faq_sectiontitleFREQUENTLYASKEDQUESTIONStemplate_id7page_status_id2language_id1parent_idnullpost_typepagesslugnull', '{\"banner_section\":{\"main_title\":\"FAQ\\u2019S\",\"title\":\"FEEL FREE\",\"sub_title\":\"TO ASK\",\"image\":\"69\",\"image_mobile\":\"70\"},\"faq_section\":{\"title\":\"FREQUENTLY ASKED QUESTIONS\"}}', 1, NULL, 1, 2, 1, '2022-08-21 14:10:13', '2022-08-21 14:10:13'),
(23, '7', 'أسئلة شائعة', 'faq', 'pages', '_tokenAwiPM4z8wb42oB1wH1dereiOc61ltZjmcf4Z5fhatitleأسئلةشائعةmeta_titleأسئلةشائعةmeta_descriptionأسئلةشائعةextrasbanner_sectionmain_titleأسئلةشائعةtitleأسئلةشائعةsub_titleأسئلةشائعةimage71image_mobile72faq_sectiontitleأسئلةشائعةtemplate_id7page_status_id2language_id2parent_id22post_typepagesslugfaqs', '{\"banner_section\":{\"main_title\":\"\\u0623\\u0633\\u0626\\u0644\\u0629 \\u0634\\u0627\\u0626\\u0639\\u0629\",\"title\":\"\\u0623\\u0633\\u0626\\u0644\\u0629 \\u0634\\u0627\\u0626\\u0639\\u0629\",\"sub_title\":\"\\u0623\\u0633\\u0626\\u0644\\u0629 \\u0634\\u0627\\u0626\\u0639\\u0629\",\"image\":\"71\",\"image_mobile\":\"72\"},\"faq_section\":{\"title\":\"\\u0623\\u0633\\u0626\\u0644\\u0629 \\u0634\\u0627\\u0626\\u0639\\u0629\"}}', 2, 22, 1, 2, 1, '2022-08-21 14:35:08', '2022-08-21 14:35:08'),
(24, '9', 'Terms and Condition', 'terms-and-condition', 'pages', '_tokencFcrSGTxdmiih5oRi2zOBcUlNpqZcHg9ugU4RMi2titleTermsandConditionslugtermsandconditionmeta_titleTermsandConditionmeta_descriptionTermsandConditionextrasbanner_sectionmain_titleTermstitleWHATsub_titleTHEYSAYimage74image_mobile74basictitleTermsAndConditiondescriptionpstyleboxsizingborderboxfontsize1125emfontfamilyRalewaysansserifmargin0px0px15emlineheight125backgroundcolore5e5e5LoremipsumdolorsitametconsecteturadipisicingelitTemporibusilloexcepturipraesentiummaiorestemporeeiusnostrumminusquisillumdoloremrepudiandaeevenietFugiatveniamfugitlaborevoluptasilloprovidentperferendisveritatisdoloribusfacilispariatureosSolutacumqueomnisquammolestiasnesciuntsitliberomagnihicullamdelectusvelitiuresuscipitipsammaioresveroofficiisestfugacorporiscumEarumvitaeillumveritatisomnisilloassumendavoluptatemconsecteturdignissimosquosquisquasidoloribuslaborumexcepturiEvenietdoloremsequiesselaboriosamofficiisquaeratfugiatducimusconsequaturnatusquasiofficianemoincidunttemporaperferendisblanditiisodiomaioresdictaatquequiavitaetemporeaprnpstyleboxsizingborderboxfontsize1125emfontfamilyRalewaysansserifmargin0px0px15emlineheight125backgroundcolore5e5e5LoremipsumdolorsitametconsecteturadipisicingelitTemporibusilloexcepturipraesentiummaiorestemporeeiusnostrumminusquisillumdoloremrepudiandaeevenietFugiatveniamfugitlaborevoluptasilloprovidentperferendisveritatisdoloribusfacilispariatureosSolutacumqueomnisquammolestiasnesciuntsitliberomagnihicullamdelectusvelitiuresuscipitipsammaioresveroofficiisestfugacorporiscumEarumvitaeillumveritatisomnisilloassumendavoluptatemconsecteturdignissimosquosquisquasidoloribuslaborumexcepturiEvenietdoloremsequiesselaboriosamofficiisquaeratfugiatducimusconsequaturnatusquasiofficianemoincidunttemporaperferendisblanditiisodiomaioresdictaatquequiavitaetemporeaptemplate_id9page_status_id2language_id1parent_idnullpost_typepages', '{\"banner_section\":{\"main_title\":\"Terms\",\"title\":\"WHAT\",\"sub_title\":\"THEY SAY\",\"image\":\"74\",\"image_mobile\":\"74\"},\"basic\":{\"title\":\"Terms And Condition\",\"description\":\"<p style=\\\"box-sizing: border-box; font-size: 1.125em; font-family: Raleway, sans-serif; margin: 0px 0px 1.5em; line-height: 1.25; background-color: #e5e5e5;\\\">Lorem ipsum, dolor sit amet consectetur adipisicing elit. Temporibus illo excepturi praesentium maiores tempore, eius nostrum minus quis illum dolorem, repudiandae eveniet! Fugiat veniam fugit labore voluptas illo provident perferendis veritatis doloribus facilis, pariatur eos. Soluta cumque omnis quam molestias nesciunt sit libero magni hic ullam delectus, velit iure suscipit ipsam maiores vero, officiis est fuga corporis cum. Earum vitae illum veritatis, omnis illo assumenda, voluptatem, consectetur dignissimos quos quis quasi doloribus laborum excepturi! Eveniet dolorem sequi esse laboriosam officiis quaerat fugiat ducimus consequatur natus quasi officia nemo incidunt, tempora perferendis blanditiis odio maiores dicta atque quia vitae tempore a.<\\/p>\\r\\n<p style=\\\"box-sizing: border-box; font-size: 1.125em; font-family: Raleway, sans-serif; margin: 0px 0px 1.5em; line-height: 1.25; background-color: #e5e5e5;\\\">Lorem ipsum, dolor sit amet consectetur adipisicing elit. Temporibus illo excepturi praesentium maiores tempore, eius nostrum minus quis illum dolorem, repudiandae eveniet! Fugiat veniam fugit labore voluptas illo provident perferendis veritatis doloribus facilis, pariatur eos. Soluta cumque omnis quam molestias nesciunt sit libero magni hic ullam delectus, velit iure suscipit ipsam maiores vero, officiis est fuga corporis cum. Earum vitae illum veritatis, omnis illo assumenda, voluptatem, consectetur dignissimos quos quis quasi doloribus laborum excepturi! Eveniet dolorem sequi esse laboriosam officiis quaerat fugiat ducimus consequatur natus quasi officia nemo incidunt, tempora perferendis blanditiis odio maiores dicta atque quia vitae tempore a.<\\/p>\"}}', 1, NULL, 1, 2, 1, '2022-08-21 15:08:44', '2022-08-24 15:18:18'),
(25, '10', 'Privacy Policy', 'privacy-policy', 'pages', '_tokencFcrSGTxdmiih5oRi2zOBcUlNpqZcHg9ugU4RMi2titlePrivacyPolicyslugprivacypolicymeta_titlePrivacyPolicymeta_descriptionPrivacyPolicyextrasbanner_sectionmain_titleprivacypolicytitleWHATsub_titleTHEYSAYimage74image_mobile74basictitlePrivacyPolicydescriptionpstyleboxsizingborderboxfontsize1125emfontfamilyRalewaysansserifmargin0px0px15emlineheight125backgroundcolore5e5e5LoremipsumdolorsitametconsecteturadipisicingelitTemporibusilloexcepturipraesentiummaiorestemporeeiusnostrumminusquisillumdoloremrepudiandaeevenietFugiatveniamfugitlaborevoluptasilloprovidentperferendisveritatisdoloribusfacilispariatureosSolutacumqueomnisquammolestiasnesciuntsitliberomagnihicullamdelectusvelitiuresuscipitipsammaioresveroofficiisestfugacorporiscumEarumvitaeillumveritatisomnisilloassumendavoluptatemconsecteturdignissimosquosquisquasidoloribuslaborumexcepturiEvenietdoloremsequiesselaboriosamofficiisquaeratfugiatducimusconsequaturnatusquasiofficianemoincidunttemporaperferendisblanditiisodiomaioresdictaatquequiavitaetemporeaprnpstyleboxsizingborderboxfontsize1125emfontfamilyRalewaysansserifmargin0px0px15emlineheight125backgroundcolore5e5e5LoremipsumdolorsitametconsecteturadipisicingelitTemporibusilloexcepturipraesentiummaiorestemporeeiusnostrumminusquisillumdoloremrepudiandaeevenietFugiatveniamfugitlaborevoluptasilloprovidentperferendisveritatisdoloribusfacilispariatureosSolutacumqueomnisquammolestiasnesciuntsitliberomagnihicullamdelectusvelitiuresuscipitipsammaioresveroofficiisestfugacorporiscumEarumvitaeillumveritatisomnisilloassumendavoluptatemconsecteturdignissimosquosquisquasidoloribuslaborumexcepturiEvenietdoloremsequiesselaboriosamofficiisquaeratfugiatducimusconsequaturnatusquasiofficianemoincidunttemporaperferendisblanditiisodiomaioresdictaatquequiavitaetemporeaptemplate_id10page_status_id2language_id1parent_idnullpost_typepages', '{\"banner_section\":{\"main_title\":\"privacy policy\",\"title\":\"WHAT\",\"sub_title\":\"THEY SAY\",\"image\":\"74\",\"image_mobile\":\"74\"},\"basic\":{\"title\":\"Privacy Policy\",\"description\":\"<p style=\\\"box-sizing: border-box; font-size: 1.125em; font-family: Raleway, sans-serif; margin: 0px 0px 1.5em; line-height: 1.25; background-color: #e5e5e5;\\\">Lorem ipsum, dolor sit amet consectetur adipisicing elit. Temporibus illo excepturi praesentium maiores tempore, eius nostrum minus quis illum dolorem, repudiandae eveniet! Fugiat veniam fugit labore voluptas illo provident perferendis veritatis doloribus facilis, pariatur eos. Soluta cumque omnis quam molestias nesciunt sit libero magni hic ullam delectus, velit iure suscipit ipsam maiores vero, officiis est fuga corporis cum. Earum vitae illum veritatis, omnis illo assumenda, voluptatem, consectetur dignissimos quos quis quasi doloribus laborum excepturi! Eveniet dolorem sequi esse laboriosam officiis quaerat fugiat ducimus consequatur natus quasi officia nemo incidunt, tempora perferendis blanditiis odio maiores dicta atque quia vitae tempore a.<\\/p>\\r\\n<p style=\\\"box-sizing: border-box; font-size: 1.125em; font-family: Raleway, sans-serif; margin: 0px 0px 1.5em; line-height: 1.25; background-color: #e5e5e5;\\\">Lorem ipsum, dolor sit amet consectetur adipisicing elit. Temporibus illo excepturi praesentium maiores tempore, eius nostrum minus quis illum dolorem, repudiandae eveniet! Fugiat veniam fugit labore voluptas illo provident perferendis veritatis doloribus facilis, pariatur eos. Soluta cumque omnis quam molestias nesciunt sit libero magni hic ullam delectus, velit iure suscipit ipsam maiores vero, officiis est fuga corporis cum. Earum vitae illum veritatis, omnis illo assumenda, voluptatem, consectetur dignissimos quos quis quasi doloribus laborum excepturi! Eveniet dolorem sequi esse laboriosam officiis quaerat fugiat ducimus consequatur natus quasi officia nemo incidunt, tempora perferendis blanditiis odio maiores dicta atque quia vitae tempore a.<\\/p>\"}}', 1, NULL, 1, 2, 1, '2022-08-21 15:11:02', '2022-08-24 15:14:44'),
(26, '11', 'Checkout', 'checkout', 'pages', '_tokenIzvbgoFrM5utYndQcWDZckuSZLcYN2DUlyHdDYI3titleCheckoutslugcheckoutmeta_titleCheckoutmeta_descriptionCheckoutextrascheckout_page_sectiontitle_oneSHIPPINGDETAILStitle_twoBILLINGDETAILStitle_threeCARTSUMMARYmessageThisproductwillbedeliveredinbusiness7workingdayscheckout_button_textPROCEEDTOCHECKOUTshopping_button_textCONTINUESHOPPINGtemplate_id11page_status_id2language_id1parent_idnullpost_typepages', '{\"checkout_page_section\":{\"title_one\":\"SHIPPING DETAILS\",\"title_two\":\"BILLING DETAILS\",\"title_three\":\"CART SUMMARY\",\"message\":\"This product will be delivered in business 7 working days\",\"checkout_button_text\":\"PROCEED TO CHECKOUT\",\"shopping_button_text\":\"CONTINUE SHOPPING\"}}', 1, NULL, 0, 2, 1, '2022-08-24 20:47:57', '2022-08-25 12:10:37'),
(27, '11', 'الدفع', 'checkout', 'pages', '_tokenHil5qLMYfgdeXTFtUPaBdrARXbntBDQVo3rvvtPgtitleالدفعmeta_titleالدفعmeta_descriptionالدفعextrascheckout_page_sectiontitle_oneالدفعtitle_twoالدفعcheckout_button_textالدفعshopping_button_textالدفعtemplate_id11page_status_id2language_id2parent_id26post_typepagesslugcheckout', '{\"checkout_page_section\":{\"title_one\":\"\\u0627\\u0644\\u062f\\u0641\\u0639\",\"title_two\":\"\\u0627\\u0644\\u062f\\u0641\\u0639\",\"checkout_button_text\":\"\\u0627\\u0644\\u062f\\u0641\\u0639\",\"shopping_button_text\":\"\\u0627\\u0644\\u062f\\u0641\\u0639\"}}', 2, 26, 0, 2, 1, '2022-08-24 20:49:24', '2022-08-24 20:49:24'),
(28, '12', '404', '404', 'pages', '_tokenldNzOvmvy4zYCLGCO5oyKSJzpsPKkAPtmIb4lX2utitle404slug404meta_title404meta_description404extrasbasicheadingErrornumber404main_titlePagenotFoundtitleThepageyouwerelookingfordoesntexistsub_titleYoumayhavemistypedtheaddressorthepagemayhavemovedbutton_textBacktoHometemplate_id12page_status_id2language_id1parent_idnullpost_typepages', '{\"basic\":{\"heading\":\"Error\",\"number\":\"404\",\"main_title\":\"Page not Found.\",\"title\":\"The page you were looking for doesn\'t exist.\",\"sub_title\":\"You may have mistyped the address or the page may have moved.\",\"button_text\":\"Back to Home\"}}', 1, NULL, 0, 2, 1, '2022-08-25 07:21:07', '2022-08-25 07:30:57'),
(29, '12', 'لم يتم العثور على', '404', 'pages', '_tokenldNzOvmvy4zYCLGCO5oyKSJzpsPKkAPtmIb4lX2utitleلميتمالعثورعلىmeta_titleلميتمالعثورعلىmeta_descriptionلميتمالعثورعلىextrasbasicheadingلميتمالعثورعلىnumber404main_titleلميتمالعثورعلىtitleلميتمالعثورعلىsub_titleلميتمالعثورعلىbutton_textلميتمالعثورعلىtemplate_id12page_status_id2language_id2parent_id28post_typepagesslug404', '{\"basic\":{\"heading\":\"\\u0644\\u0645 \\u064a\\u062a\\u0645 \\u0627\\u0644\\u0639\\u062b\\u0648\\u0631 \\u0639\\u0644\\u0649\",\"number\":\"404\",\"main_title\":\"\\u0644\\u0645 \\u064a\\u062a\\u0645 \\u0627\\u0644\\u0639\\u062b\\u0648\\u0631 \\u0639\\u0644\\u0649\",\"title\":\"\\u0644\\u0645 \\u064a\\u062a\\u0645 \\u0627\\u0644\\u0639\\u062b\\u0648\\u0631 \\u0639\\u0644\\u0649\",\"sub_title\":\"\\u0644\\u0645 \\u064a\\u062a\\u0645 \\u0627\\u0644\\u0639\\u062b\\u0648\\u0631 \\u0639\\u0644\\u0649\",\"button_text\":\"\\u0644\\u0645 \\u064a\\u062a\\u0645 \\u0627\\u0644\\u0639\\u062b\\u0648\\u0631 \\u0639\\u0644\\u0649\"}}', 2, 28, 0, 2, 1, '2022-08-25 07:32:13', '2022-08-25 07:32:13'),
(30, '13', 'Wishlist', 'wishlist', 'pages', '_tokenA488daCqpuBvVkbuYYABSGP0SRXVj0GH1f9DazTXtitleWishlistmeta_titleWishlistmeta_descriptionWishlistextrasbasicheadingWishlisttemplate_id13page_status_id2language_id1parent_idnullpost_typepagesslugnull', '{\"basic\":{\"heading\":\"Wishlist\"}}', 1, NULL, 0, 2, 1, '2022-08-25 18:03:36', '2022-08-25 18:03:36'),
(31, '13', 'قائمة الرغبات', 'wishlist', 'pages', '_tokenA488daCqpuBvVkbuYYABSGP0SRXVj0GH1f9DazTXtitleقائمةالرغباتmeta_titleقائمةالرغباتmeta_descriptionقائمةالرغباتextrasbasicheadingقائمةالرغباتtemplate_id13page_status_id2language_id2parent_id30post_typepagesslugwishlist', '{\"basic\":{\"heading\":\"\\u0642\\u0627\\u0626\\u0645\\u0629 \\u0627\\u0644\\u0631\\u063a\\u0628\\u0627\\u062a\"}}', 2, 30, 0, 2, 1, '2022-08-25 18:04:09', '2022-08-25 18:04:09'),
(33, '2', 'About US', 'about-us', 'pages', '_tokenpVYeqQhERnICoR4XRQUU5j7dBJ1oN3jfnqZd5vVXtitleAboutUSslugaboutusmeta_titleAboutUS1meta_descriptionAboutUS1extrasbanner_sectionmain_titleABOUTUStitleWHATsub_titleWEDOimage21image_mobile21our_approach_sectiontitleOURAPPROACHdescriptionLoremIpsumissimplydummytextoftheprintingandtypesettingindustryLoremIpsumhasbeentheindustrysstandarddummytexteversincethe1500swhenanunknownprintertookagalleyoftypeandscrambledittomakeatypespecimenbookIthassurvivednotonlyfivecenturiesbutalsotheleapintoelectronictypesettingremainingessentiallyunchangedimage22mission_and_vision_sectiontitleMISSIONVISIONdescriptionLoremIpsumissimplydummytextoftheprintingandtypesettingindustryLoremIpsumhasbeentheindustrysstandarddummytexteversincethe1500swhenanunknownprintertookagalleyoftypeandscrambledittomakeatypespecimenbookIthassurvivednotonlyfivecenturiesbutalsotheleapintoelectronictypesettingremainingessentiallyunchangedimage23from_the_management_sectiontitleFROMTHEMANAGEMENTdescriptionLoremIpsumissimplydummytextoftheprintingandtypesettingindustryLoremIpsumhasbeentheindustrysstandarddummytexteversincethe1500swhenanunknownprintertookagalleyoftypeandscrambledittomakeatypespecimenbookIthassurvivednotonlyfivecenturiesbutalsotheleapintoelectronictypesettingimage23template_id2page_status_id2language_id1parent_idnullpost_typepages', '{\"banner_section\":{\"main_title\":\"ABOUT US\",\"title\":\"WHAT\",\"sub_title\":\"WE DO\",\"image\":\"21\",\"image_mobile\":\"21\"},\"our_approach_section\":{\"title\":\"OUR APPROACH\",\"description\":\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.\",\"image\":\"22\"},\"mission_and_vision_section\":{\"title\":\"MISSION & VISION\",\"description\":\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.\",\"image\":\"23\"},\"from_the_management_section\":{\"title\":\"FROM THE MANAGEMENT\",\"description\":\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting,\",\"image\":\"23\"}}', 2, 2, 1, 2, 1, '2022-08-31 10:12:54', '2022-08-31 10:12:54'),
(34, '9', 'Terms and Condition', 'terms-and-condition', 'pages', '_tokencFcrSGTxdmiih5oRi2zOBcUlNpqZcHg9ugU4RMi2titleTermsandConditionslugtermsandconditionmeta_titleTermsandConditionmeta_descriptionTermsandConditionextrasbanner_sectionmain_titleTermstitleWHATsub_titleTHEYSAYimage74image_mobile74basictitleTermsAndConditiondescriptionpstyleboxsizingborderboxfontsize1125emfontfamilyRalewaysansserifmargin0px0px15emlineheight125backgroundcolore5e5e5LoremipsumdolorsitametconsecteturadipisicingelitTemporibusilloexcepturipraesentiummaiorestemporeeiusnostrumminusquisillumdoloremrepudiandaeevenietFugiatveniamfugitlaborevoluptasilloprovidentperferendisveritatisdoloribusfacilispariatureosSolutacumqueomnisquammolestiasnesciuntsitliberomagnihicullamdelectusvelitiuresuscipitipsammaioresveroofficiisestfugacorporiscumEarumvitaeillumveritatisomnisilloassumendavoluptatemconsecteturdignissimosquosquisquasidoloribuslaborumexcepturiEvenietdoloremsequiesselaboriosamofficiisquaeratfugiatducimusconsequaturnatusquasiofficianemoincidunttemporaperferendisblanditiisodiomaioresdictaatquequiavitaetemporeaprnpstyleboxsizingborderboxfontsize1125emfontfamilyRalewaysansserifmargin0px0px15emlineheight125backgroundcolore5e5e5LoremipsumdolorsitametconsecteturadipisicingelitTemporibusilloexcepturipraesentiummaiorestemporeeiusnostrumminusquisillumdoloremrepudiandaeevenietFugiatveniamfugitlaborevoluptasilloprovidentperferendisveritatisdoloribusfacilispariatureosSolutacumqueomnisquammolestiasnesciuntsitliberomagnihicullamdelectusvelitiuresuscipitipsammaioresveroofficiisestfugacorporiscumEarumvitaeillumveritatisomnisilloassumendavoluptatemconsecteturdignissimosquosquisquasidoloribuslaborumexcepturiEvenietdoloremsequiesselaboriosamofficiisquaeratfugiatducimusconsequaturnatusquasiofficianemoincidunttemporaperferendisblanditiisodiomaioresdictaatquequiavitaetemporeaptemplate_id9page_status_id2language_id1parent_idnullpost_typepages', '{\"banner_section\":{\"main_title\":\"Terms\",\"title\":\"WHAT\",\"sub_title\":\"THEY SAY\",\"image\":\"74\",\"image_mobile\":\"74\"},\"basic\":{\"title\":\"Terms And Condition\",\"description\":\"<p style=\\\"box-sizing: border-box; font-size: 1.125em; font-family: Raleway, sans-serif; margin: 0px 0px 1.5em; line-height: 1.25; background-color: #e5e5e5;\\\">Lorem ipsum, dolor sit amet consectetur adipisicing elit. Temporibus illo excepturi praesentium maiores tempore, eius nostrum minus quis illum dolorem, repudiandae eveniet! Fugiat veniam fugit labore voluptas illo provident perferendis veritatis doloribus facilis, pariatur eos. Soluta cumque omnis quam molestias nesciunt sit libero magni hic ullam delectus, velit iure suscipit ipsam maiores vero, officiis est fuga corporis cum. Earum vitae illum veritatis, omnis illo assumenda, voluptatem, consectetur dignissimos quos quis quasi doloribus laborum excepturi! Eveniet dolorem sequi esse laboriosam officiis quaerat fugiat ducimus consequatur natus quasi officia nemo incidunt, tempora perferendis blanditiis odio maiores dicta atque quia vitae tempore a.<\\/p>\\r\\n<p style=\\\"box-sizing: border-box; font-size: 1.125em; font-family: Raleway, sans-serif; margin: 0px 0px 1.5em; line-height: 1.25; background-color: #e5e5e5;\\\">Lorem ipsum, dolor sit amet consectetur adipisicing elit. Temporibus illo excepturi praesentium maiores tempore, eius nostrum minus quis illum dolorem, repudiandae eveniet! Fugiat veniam fugit labore voluptas illo provident perferendis veritatis doloribus facilis, pariatur eos. Soluta cumque omnis quam molestias nesciunt sit libero magni hic ullam delectus, velit iure suscipit ipsam maiores vero, officiis est fuga corporis cum. Earum vitae illum veritatis, omnis illo assumenda, voluptatem, consectetur dignissimos quos quis quasi doloribus laborum excepturi! Eveniet dolorem sequi esse laboriosam officiis quaerat fugiat ducimus consequatur natus quasi officia nemo incidunt, tempora perferendis blanditiis odio maiores dicta atque quia vitae tempore a.<\\/p>\"}}', 2, 24, 1, 2, 1, '2022-08-31 10:19:52', '2022-08-31 10:19:52');
INSERT INTO `pages` (`id`, `template_id`, `title`, `slug`, `post_type`, `content`, `extras`, `language_id`, `parent_id`, `is_delete`, `page_status_id`, `is_slug`, `created_at`, `updated_at`) VALUES
(35, '10', 'Privacy Policy', 'privacy-policy', 'pages', '_tokencFcrSGTxdmiih5oRi2zOBcUlNpqZcHg9ugU4RMi2titlePrivacyPolicyslugprivacypolicymeta_titlePrivacyPolicymeta_descriptionPrivacyPolicyextrasbanner_sectionmain_titleprivacypolicytitleWHATsub_titleTHEYSAYimage74image_mobile74basictitlePrivacyPolicydescriptionpstyleboxsizingborderboxfontsize1125emfontfamilyRalewaysansserifmargin0px0px15emlineheight125backgroundcolore5e5e5LoremipsumdolorsitametconsecteturadipisicingelitTemporibusilloexcepturipraesentiummaiorestemporeeiusnostrumminusquisillumdoloremrepudiandaeevenietFugiatveniamfugitlaborevoluptasilloprovidentperferendisveritatisdoloribusfacilispariatureosSolutacumqueomnisquammolestiasnesciuntsitliberomagnihicullamdelectusvelitiuresuscipitipsammaioresveroofficiisestfugacorporiscumEarumvitaeillumveritatisomnisilloassumendavoluptatemconsecteturdignissimosquosquisquasidoloribuslaborumexcepturiEvenietdoloremsequiesselaboriosamofficiisquaeratfugiatducimusconsequaturnatusquasiofficianemoincidunttemporaperferendisblanditiisodiomaioresdictaatquequiavitaetemporeaprnpstyleboxsizingborderboxfontsize1125emfontfamilyRalewaysansserifmargin0px0px15emlineheight125backgroundcolore5e5e5LoremipsumdolorsitametconsecteturadipisicingelitTemporibusilloexcepturipraesentiummaiorestemporeeiusnostrumminusquisillumdoloremrepudiandaeevenietFugiatveniamfugitlaborevoluptasilloprovidentperferendisveritatisdoloribusfacilispariatureosSolutacumqueomnisquammolestiasnesciuntsitliberomagnihicullamdelectusvelitiuresuscipitipsammaioresveroofficiisestfugacorporiscumEarumvitaeillumveritatisomnisilloassumendavoluptatemconsecteturdignissimosquosquisquasidoloribuslaborumexcepturiEvenietdoloremsequiesselaboriosamofficiisquaeratfugiatducimusconsequaturnatusquasiofficianemoincidunttemporaperferendisblanditiisodiomaioresdictaatquequiavitaetemporeaptemplate_id10page_status_id2language_id1parent_idnullpost_typepages', '{\"banner_section\":{\"main_title\":\"privacy policy\",\"title\":\"WHAT\",\"sub_title\":\"THEY SAY\",\"image\":\"74\",\"image_mobile\":\"74\"},\"basic\":{\"title\":\"Privacy Policy\",\"description\":\"<p style=\\\"box-sizing: border-box; font-size: 1.125em; font-family: Raleway, sans-serif; margin: 0px 0px 1.5em; line-height: 1.25; background-color: #e5e5e5;\\\">Lorem ipsum, dolor sit amet consectetur adipisicing elit. Temporibus illo excepturi praesentium maiores tempore, eius nostrum minus quis illum dolorem, repudiandae eveniet! Fugiat veniam fugit labore voluptas illo provident perferendis veritatis doloribus facilis, pariatur eos. Soluta cumque omnis quam molestias nesciunt sit libero magni hic ullam delectus, velit iure suscipit ipsam maiores vero, officiis est fuga corporis cum. Earum vitae illum veritatis, omnis illo assumenda, voluptatem, consectetur dignissimos quos quis quasi doloribus laborum excepturi! Eveniet dolorem sequi esse laboriosam officiis quaerat fugiat ducimus consequatur natus quasi officia nemo incidunt, tempora perferendis blanditiis odio maiores dicta atque quia vitae tempore a.<\\/p>\\r\\n<p style=\\\"box-sizing: border-box; font-size: 1.125em; font-family: Raleway, sans-serif; margin: 0px 0px 1.5em; line-height: 1.25; background-color: #e5e5e5;\\\">Lorem ipsum, dolor sit amet consectetur adipisicing elit. Temporibus illo excepturi praesentium maiores tempore, eius nostrum minus quis illum dolorem, repudiandae eveniet! Fugiat veniam fugit labore voluptas illo provident perferendis veritatis doloribus facilis, pariatur eos. Soluta cumque omnis quam molestias nesciunt sit libero magni hic ullam delectus, velit iure suscipit ipsam maiores vero, officiis est fuga corporis cum. Earum vitae illum veritatis, omnis illo assumenda, voluptatem, consectetur dignissimos quos quis quasi doloribus laborum excepturi! Eveniet dolorem sequi esse laboriosam officiis quaerat fugiat ducimus consequatur natus quasi officia nemo incidunt, tempora perferendis blanditiis odio maiores dicta atque quia vitae tempore a.<\\/p>\"}}', 2, 25, 1, 2, 1, '2022-08-31 10:20:42', '2022-08-31 10:20:42'),
(38, '12', 'sadsa', 'sadsa', 'pages', '_tokenSUVG9R89HZq8Kk9uGk6eClbY6jnC5LvbQAjsumVqtemplate_id12titlesadsaextrasbasicheadingsdasdanumber33main_titledsasdatitlesdadassub_titlesdasdabutton_textsdsadmeta_titlesaddsameta_descriptionsdsaddsapage_status_id2language_id1parent_idnullpost_typepagesslugnull', '{\"basic\":{\"heading\":\"sdasda\",\"number\":\"33\",\"main_title\":\"dsasda\",\"title\":\"sdadas\",\"sub_title\":\"sdasda\",\"button_text\":\"sdsad\"}}', 1, NULL, 1, 2, 1, '2022-09-02 14:55:06', '2022-09-02 14:55:06'),
(39, '14', 'Custom Kandora', 'custom-kandora', 'pages', '_tokenyUYstcENmQ3WnlQqdLA9ZT8HaFWwFLhWjY67sHYjtemplate_id14titleCustomKandoraextrasbasicheadingALJAZAIRTAILORSsummary_titleCUSTOMIZATIONSUMMARYdescriptionLoremIpsumissimplydummytextoftheprintingandtypesettingindustryLoremIpsumhasbeentheindustrysstandarddummytextevemeta_titleCustomKandorameta_descriptionCustomKandorapage_status_id2language_id1parent_idnullpost_typepagesslugnull', '{\"basic\":{\"heading\":\"AL-JAZAIR TAILORS\",\"summary_title\":\"CUSTOMIZATION SUMMARY\",\"description\":\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text eve.\"}}', 1, NULL, 1, 2, 1, '2022-09-08 11:02:17', '2022-09-08 11:02:17'),
(40, '14', 'كندورة مخصصة', 'custom-kandora', 'pages', '_tokenfzCVSleYHUvqTAV266XXBKI8ZIJOmXCMEy7AtU6ztemplate_id14titleكندورةمخصصةextrasbasicheadingكندورةمخصصةsummary_titleكندورةمخصصةdescriptionكندورةمخصصةmeta_titleكندورةمخصصةmeta_descriptionكندورةمخصصةpage_status_id2language_id2parent_id39post_typepagesslugcustomkandora', '{\"basic\":{\"heading\":\"\\u0643\\u0646\\u062f\\u0648\\u0631\\u0629 \\u0645\\u062e\\u0635\\u0635\\u0629\",\"summary_title\":\"\\u0643\\u0646\\u062f\\u0648\\u0631\\u0629 \\u0645\\u062e\\u0635\\u0635\\u0629\",\"description\":\"\\u0643\\u0646\\u062f\\u0648\\u0631\\u0629 \\u0645\\u062e\\u0635\\u0635\\u0629\"}}', 2, 39, 1, 2, 1, '2022-09-10 20:24:48', '2022-09-10 20:24:48'),
(41, '15', 'Custom Kandora Checkout', 'custom-kandora-checkout', 'pages', '_tokeneh5D9aBU9t3F1WaqygVqCQ0oOw951EU1OjbD2hVOtemplate_id15titleCustomKandoraCheckoutextrascheckout_page_sectiontitle_oneMEASUREMENTtitle_twoORDERSUMMARYtitle_threeBILLINGDETAILScheckout_button_textPROCEEDTOCHECKOUTmeta_titleCustomKandoraCheckoutmeta_descriptionCustomKandoraCheckoutpage_status_id2language_id1parent_idnullpost_typepagesslugnull', '{\"checkout_page_section\":{\"title_one\":\"MEASUREMENT\",\"title_two\":\"ORDER SUMMARY\",\"title_three\":\"BILLING DETAILS\",\"checkout_button_text\":\"PROCEED TO CHECKOUT\"}}', 1, NULL, 0, 2, 0, '2022-10-06 10:50:58', '2022-10-06 10:50:58');

-- --------------------------------------------------------

--
-- Table structure for table `page_statuses`
--

DROP TABLE IF EXISTS `page_statuses`;
CREATE TABLE IF NOT EXISTS `page_statuses` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `page_statuses`
--

INSERT INTO `page_statuses` (`id`, `title`, `created_at`, `updated_at`) VALUES
(1, 'InActive', NULL, NULL),
(2, 'Active', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('test777@yopmail.com', '$2y$10$3N9Nk.U.TN1CDgKWgtf8qO7yomrx03EqFMqVsMcGM2y0xD3Izw6h2', '2022-09-05 14:08:27'),
('admin@digitailor.com', '$2y$10$UGtu89uh4Bdlv8R5RJk5hOVihq7HfL4FA30fJbnILpkHKgfmuKKw.', '2022-09-06 08:35:44'),
('admim@yopmail.com', '$2y$10$JIEebEK9VksdCLdZHheSle5yTY8iDwI6rfFrSPPF77OCfDtu2K6zm', '2022-09-06 11:18:07');

-- --------------------------------------------------------

--
-- Table structure for table `payment_statuses`
--

DROP TABLE IF EXISTS `payment_statuses`;
CREATE TABLE IF NOT EXISTS `payment_statuses` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_ar` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_statuses`
--

INSERT INTO `payment_statuses` (`id`, `title`, `title_ar`, `created_at`, `updated_at`) VALUES
(1, 'Pending', 'قيد الانتظار', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_unique` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=220 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `display_name`, `name`, `status`, `guard_name`, `created_at`, `updated_at`) VALUES
(150, 'Product_Sizes Delete', 'product.sizes.delete', 'active', 'web', '2022-08-31 07:33:03', '2022-08-31 07:33:03'),
(149, 'Product_Sizes Edit', 'product.sizes.edit', 'active', 'web', '2022-08-31 07:33:03', '2022-08-31 07:33:03'),
(148, 'Product_Sizes Create', 'product.sizes.create', 'active', 'web', '2022-08-31 07:33:03', '2022-08-31 07:33:03'),
(147, 'Product_Fabrics List', 'product.fabrics.list', 'active', 'web', '2022-08-31 07:28:36', '2022-08-31 07:28:36'),
(146, 'Product_Fabrics Delete', 'product.fabrics.delete', 'active', 'web', '2022-08-31 07:28:36', '2022-08-31 07:28:36'),
(145, 'Product_Fabrics Edit', 'product.fabrics.edit', 'active', 'web', '2022-08-31 07:28:36', '2022-08-31 07:28:36'),
(144, 'Product_Fabrics Create', 'product.fabrics.create', 'active', 'web', '2022-08-31 07:28:36', '2022-08-31 07:28:36'),
(143, 'Contacts List', 'contacts.list', 'active', 'web', '2022-08-31 07:25:00', '2022-08-31 07:25:00'),
(142, 'Contacts Export', 'contacts.export', 'active', 'web', '2022-08-31 07:25:00', '2022-08-31 07:25:00'),
(141, 'Customers List', 'customers.list', 'active', 'web', '2022-08-31 07:25:00', '2022-08-31 07:25:00'),
(140, 'Customers Export', 'customers.export', 'active', 'web', '2022-08-31 07:25:00', '2022-08-31 07:25:00'),
(139, 'Coupons Delete', 'coupons.delete', 'active', 'web', '2022-08-31 07:23:50', '2022-08-31 07:23:50'),
(138, 'Coupons Edit', 'coupons.edit', 'active', 'web', '2022-08-31 07:23:50', '2022-08-31 07:23:50'),
(137, 'Coupons Create', 'coupons.create', 'active', 'web', '2022-08-31 07:23:50', '2022-08-31 07:23:50'),
(136, 'Coupons List', 'coupons.list', 'active', 'web', '2022-08-31 07:23:32', '2022-08-31 07:23:32'),
(135, 'Product_ratings List', 'product.ratings.list', 'active', 'web', '2022-08-31 07:12:06', '2022-08-31 07:12:06'),
(134, 'Product_ratings Edit', 'product.ratings.edit', 'active', 'web', '2022-08-31 07:12:06', '2022-08-31 07:12:06'),
(132, 'Orders Edit', 'orders.edit', 'active', 'web', '2022-08-31 07:12:06', '2022-08-31 07:12:06'),
(133, 'Orders List', 'orders.list', 'active', 'web', '2022-08-31 07:12:06', '2022-08-31 07:12:06'),
(131, 'Theme_Settings List', 'theme.settings.list', 'active', 'web', '2022-08-31 07:08:05', '2022-08-31 07:08:05'),
(130, 'Theme_Settings Edit', 'theme.settings.edit', 'active', 'web', '2022-08-31 07:08:05', '2022-08-31 07:08:05'),
(129, 'Tailors List', 'tailors.list', 'active', 'web', '2022-08-31 07:08:05', '2022-08-31 07:08:05'),
(128, 'Tailors Delete', 'tailors.delete', 'active', 'web', '2022-08-31 07:08:05', '2022-08-31 07:08:05'),
(127, 'Tailors Edit', 'tailors.edit', 'active', 'web', '2022-08-31 07:08:05', '2022-08-31 07:08:05'),
(126, 'Tailors Create', 'tailors.create', 'active', 'web', '2022-08-31 07:08:05', '2022-08-31 07:08:05'),
(125, 'Faqs List', 'faqs.list', 'active', 'web', '2022-08-31 07:08:05', '2022-08-31 07:08:05'),
(124, 'Faqs Delete', 'faqs.delete', 'active', 'web', '2022-08-31 07:08:05', '2022-08-31 07:08:05'),
(123, 'Faqs Edit', 'faqs.edit', 'active', 'web', '2022-08-31 07:08:05', '2022-08-31 07:08:05'),
(122, 'Faqs Create', 'faqs.create', 'active', 'web', '2022-08-31 07:08:05', '2022-08-31 07:08:05'),
(121, 'Testimonials List', 'testimonials.list', 'active', 'web', '2022-08-31 07:08:05', '2022-08-31 07:08:05'),
(119, 'Testimonials Edit', 'testimonials.edit', 'active', 'web', '2022-08-31 07:08:05', '2022-08-31 07:08:05'),
(120, 'Testimonials Delete', 'testimonials.delete', 'active', 'web', '2022-08-31 07:08:05', '2022-08-31 07:08:05'),
(117, 'Pages List', 'pages.list', 'active', 'web', '2022-08-31 07:08:05', '2022-08-31 07:08:05'),
(118, 'Testimonials Create', 'testimonials.create', 'active', 'web', '2022-08-31 07:08:05', '2022-08-31 07:08:05'),
(115, 'Pages Edit', 'pages.edit', 'active', 'web', '2022-08-31 07:08:05', '2022-08-31 07:08:05'),
(116, 'Pages Delete', 'pages.delete', 'active', 'web', '2022-08-31 07:08:05', '2022-08-31 07:08:05'),
(114, 'Pages Create', 'pages.create', 'active', 'web', '2022-08-31 07:08:05', '2022-08-31 07:08:05'),
(113, 'Menu List', 'menu.list', 'active', 'web', '2022-08-31 07:08:05', '2022-08-31 07:08:05'),
(112, 'Menu Delete', 'menu.delete', 'active', 'web', '2022-08-31 07:08:05', '2022-08-31 07:08:05'),
(111, 'Menu Edit', 'menu.edit', 'active', 'web', '2022-08-31 07:08:05', '2022-08-31 07:08:05'),
(110, 'Menu Create', 'menu.create', 'active', 'web', '2022-08-31 07:08:05', '2022-08-31 07:08:05'),
(108, 'Media Delete', 'media.delete', 'active', 'web', '2022-08-31 07:08:05', '2022-08-31 07:08:05'),
(109, 'Media List', 'media.list', 'active', 'web', '2022-08-31 07:08:05', '2022-08-31 07:08:05'),
(107, 'Media Edit', 'media.edit', 'active', 'web', '2022-08-31 07:08:05', '2022-08-31 07:08:05'),
(106, 'Media Upload', 'media.upload', 'active', 'web', '2022-08-31 07:08:05', '2022-08-31 07:08:05'),
(151, 'Product_Sizes List', 'product.sizes.list', 'active', 'web', '2022-08-31 07:33:03', '2022-08-31 07:33:03'),
(152, 'Products Create', 'products.create', 'active', 'web', '2022-08-31 07:33:03', '2022-08-31 07:33:03'),
(153, 'Products Edit', 'products.edit', 'active', 'web', '2022-08-31 07:33:03', '2022-08-31 07:33:03'),
(154, 'Products Delete', 'products.delete', 'active', 'web', '2022-08-31 07:33:03', '2022-08-31 07:33:03'),
(155, 'Products List', 'products.list', 'active', 'web', '2022-08-31 07:33:03', '2022-08-31 07:33:03'),
(156, 'Kandora_Designs Create', 'kandora.designs.create', 'active', 'web', '2022-08-31 08:07:26', '2022-08-31 08:07:26'),
(157, 'Kandora_Designs Edit', 'kandora.designs.edit', 'active', 'web', '2022-08-31 08:07:26', '2022-08-31 08:07:26'),
(158, 'Kandora_Designs Delete', 'kandora.designs.delete', 'active', 'web', '2022-08-31 08:07:26', '2022-08-31 08:07:26'),
(159, 'Kandora_Designs List', 'kandora.designs.list', 'active', 'web', '2022-08-31 08:07:26', '2022-08-31 08:07:26'),
(160, 'kandora_fabrics Create', 'kandora.fabrics.create', 'active', 'web', '2022-08-31 08:07:26', '2022-08-31 08:07:26'),
(161, 'kandora_fabrics Edit', 'kandora.fabrics.edit', 'active', 'web', '2022-08-31 08:07:26', '2022-08-31 08:07:26'),
(162, 'kandora_fabrics Delete', 'kandora.fabrics.delete', 'active', 'web', '2022-08-31 08:07:26', '2022-08-31 08:07:26'),
(163, 'kandora_fabrics List', 'kandora.fabrics.list', 'active', 'web', '2022-08-31 08:07:26', '2022-08-31 08:07:26'),
(164, 'kandora_patterns Create', 'kandora.patterns.create', 'active', 'web', '2022-08-31 08:07:26', '2022-08-31 08:07:26'),
(165, 'kandora_patterns Edit', 'kandora.patterns.edit', 'active', 'web', '2022-08-31 08:07:26', '2022-08-31 08:07:26'),
(166, 'kandora_patterns Delete', 'kandora.patterns.delete', 'active', 'web', '2022-08-31 08:07:27', '2022-08-31 08:07:27'),
(167, 'kandora_patterns List', 'kandora.patterns.list', 'active', 'web', '2022-08-31 08:07:27', '2022-08-31 08:07:27'),
(168, 'kandora_design_sleeves Create', 'kandora.design.sleeves.create', 'active', 'web', '2022-08-31 08:07:27', '2022-08-31 08:07:27'),
(169, 'kandora_design_sleeves Edit', 'kandora.design.sleeves.edit', 'active', 'web', '2022-08-31 08:07:27', '2022-08-31 08:07:27'),
(170, 'kandora_design_sleeves Delete', 'kandora.design.sleeves.delete', 'active', 'web', '2022-08-31 08:07:27', '2022-08-31 08:07:27'),
(171, 'kandora_design_sleeves List', 'kandora.design.sleeves.list', 'active', 'web', '2022-08-31 08:07:27', '2022-08-31 08:07:27'),
(172, 'kandora_sleeve_lengths Create', 'kandora.sleeve.lengths.create', 'active', 'web', '2022-08-31 08:07:27', '2022-08-31 08:07:27'),
(173, 'kandora_sleeve_lengths Edit', 'kandora.sleeve.lengths.edit', 'active', 'web', '2022-08-31 08:07:27', '2022-08-31 08:07:27'),
(174, 'kandora_sleeve_lengths Delete', 'kandora.sleeve.lengths.delete', 'active', 'web', '2022-08-31 08:07:27', '2022-08-31 08:07:27'),
(175, 'kandora_sleeve_lengths List', 'kandora.sleeve.lengths.list', 'active', 'web', '2022-08-31 08:07:27', '2022-08-31 08:07:27'),
(176, 'kandora_sleeve_buttons Create', 'kandora.sleeve.buttons.create', 'active', 'web', '2022-08-31 08:07:27', '2022-08-31 08:07:27'),
(177, 'kandora_sleeve_buttons Edit', 'kandora.sleeve.buttons.edit', 'active', 'web', '2022-08-31 08:07:27', '2022-08-31 08:07:27'),
(178, 'kandora_sleeve_buttons Delete', 'kandora.sleeve.buttons.delete', 'active', 'web', '2022-08-31 08:07:27', '2022-08-31 08:07:27'),
(179, 'kandora_sleeve_buttons List', 'kandora.sleeve.buttons.list', 'active', 'web', '2022-08-31 08:07:27', '2022-08-31 08:07:27'),
(180, 'kandora_neck_shapes Create', 'kandora.neck.shapes.create', 'active', 'web', '2022-08-31 08:07:27', '2022-08-31 08:07:27'),
(181, 'kandora_neck_shapes Edit', 'kandora.neck.shapes.edit', 'active', 'web', '2022-08-31 08:07:27', '2022-08-31 08:07:27'),
(182, 'kandora_neck_shapes Delete', 'kandora.neck.shapes.delete', 'active', 'web', '2022-08-31 08:07:27', '2022-08-31 08:07:27'),
(183, 'kandora_neck_shapes List', 'kandora.neck.shapes.list', 'active', 'web', '2022-08-31 08:07:27', '2022-08-31 08:07:27'),
(184, 'kandora_neck_front_lengths Create', 'kandora.neck.front.lengths.create', 'active', 'web', '2022-08-31 08:07:27', '2022-08-31 08:07:27'),
(185, 'kandora_neck_front_lengths Edit', 'kandora.neck.front.lengths.edit', 'active', 'web', '2022-08-31 08:07:27', '2022-08-31 08:07:27'),
(186, 'kandora_neck_front_lengths Delete', 'kandora.neck.front.lengths.delete', 'active', 'web', '2022-08-31 08:07:27', '2022-08-31 08:07:27'),
(187, 'kandora_neck_front_lengths List', 'kandora.neck.front.lengths.list', 'active', 'web', '2022-08-31 08:07:27', '2022-08-31 08:07:27'),
(188, 'kandora_khawar_neck_lengths Create', 'kandora.khawar.neck.lengths.create', 'active', 'web', '2022-08-31 08:07:27', '2022-08-31 08:07:27'),
(189, 'kandora_khawar_neck_lengths Edit', 'kandora.khawar.neck.lengths.edit', 'active', 'web', '2022-08-31 08:07:27', '2022-08-31 08:07:27'),
(190, 'kandora_khawar_neck_lengths Delete', 'kandora.khawar.neck.lengths.delete', 'active', 'web', '2022-08-31 08:07:27', '2022-08-31 08:07:27'),
(191, 'kandora_khawar_neck_lengths List', 'kandora.khawar.neck.lengths.list', 'active', 'web', '2022-08-31 08:07:27', '2022-08-31 08:07:27'),
(192, 'kandora_waist_shape_tights Create', 'kandora.waist.shape.tights.create', 'active', 'web', '2022-08-31 08:07:27', '2022-08-31 08:07:27'),
(193, 'kandora_waist_shape_tights Edit', 'kandora.waist.shape.tights.edit', 'active', 'web', '2022-08-31 08:07:27', '2022-08-31 08:07:27'),
(194, 'kandora_waist_shape_tights Delete', 'kandora.waist.shape.tights.delete', 'active', 'web', '2022-08-31 08:07:27', '2022-08-31 08:07:27'),
(195, 'kandora_waist_shape_tights List', 'kandora.waist.shape.tights.list', 'active', 'web', '2022-08-31 08:07:27', '2022-08-31 08:07:27'),
(196, 'kandora_type_crystals Create', 'kandora.type.crystals.create', 'active', 'web', '2022-08-31 08:07:27', '2022-08-31 08:07:27'),
(197, 'kandora_type_crystals Edit', 'kandora.type.crystals.edit', 'active', 'web', '2022-08-31 08:07:27', '2022-08-31 08:07:27'),
(198, 'kandora_type_crystals Delete', 'kandora.type.crystals.delete', 'active', 'web', '2022-08-31 08:07:27', '2022-08-31 08:07:27'),
(199, 'kandora_type_crystals List', 'kandora.type.crystals.list', 'active', 'web', '2022-08-31 08:07:27', '2022-08-31 08:07:27'),
(200, 'kandora_size_crystals Create', 'kandora.size.crystals.create', 'active', 'web', '2022-08-31 08:07:27', '2022-08-31 08:07:27'),
(201, 'kandora_size_crystals Edit', 'kandora.size.crystals.edit', 'active', 'web', '2022-08-31 08:07:27', '2022-08-31 08:07:27'),
(202, 'kandora_size_crystals Delete', 'kandora.size.crystals.delete', 'active', 'web', '2022-08-31 08:07:27', '2022-08-31 08:07:27'),
(203, 'kandora_size_crystals List', 'kandora.size.crystals.list', 'active', 'web', '2022-08-31 08:07:27', '2022-08-31 08:07:27'),
(204, 'kandora_amount_crystals Create', 'kandora.amount.crystals.create', 'active', 'web', '2022-08-31 08:07:27', '2022-08-31 08:07:27'),
(205, 'kandora_amount_crystals Edit', 'kandora.amount.crystals.edit', 'active', 'web', '2022-08-31 08:07:27', '2022-08-31 08:07:27'),
(206, 'kandora_amount_crystals Delete', 'kandora.amount.crystals.delete', 'active', 'web', '2022-08-31 08:07:27', '2022-08-31 08:07:27'),
(207, 'kandora_amount_crystals List', 'kandora.amount.crystals.list', 'active', 'web', '2022-08-31 08:07:27', '2022-08-31 08:07:27'),
(208, 'Roles Create', 'roles.create', 'active', 'web', '2022-08-31 08:07:27', '2022-08-31 08:07:27'),
(209, 'Roles Edit', 'roles.edit', 'active', 'web', '2022-08-31 08:07:27', '2022-08-31 08:07:27'),
(210, 'Roles Delete', 'roles.delete', 'active', 'web', '2022-08-31 08:07:27', '2022-08-31 08:07:27'),
(211, 'Roles List', 'roles.list', 'active', 'web', '2022-08-31 08:07:27', '2022-08-31 08:07:27'),
(212, 'Users Create', 'users.create', 'active', 'web', '2022-08-31 08:07:27', '2022-08-31 08:07:27'),
(213, 'Users Edit', 'users.edit', 'active', 'web', '2022-08-31 08:07:27', '2022-08-31 08:07:27'),
(214, 'Users Delete', 'users.delete', 'active', 'web', '2022-08-31 08:07:27', '2022-08-31 08:07:27'),
(215, 'Users List', 'users.list', 'active', 'web', '2022-08-31 08:07:27', '2022-08-31 08:07:27'),
(216, 'khawar_neck_lengths Create', 'khawar.neck.lengths.create', 'active', 'web', '2022-08-31 09:11:14', '2022-08-31 09:11:14'),
(217, 'khawar_neck_lengths Edit', 'khawar.neck.lengths.edit', 'active', 'web', '2022-08-31 09:11:14', '2022-08-31 09:11:14'),
(218, 'khawar_neck_lengths Delete', 'khawar.neck.lengths.delete', 'active', 'web', '2022-08-31 09:11:14', '2022-08-31 09:11:14'),
(219, 'khawar_neck_lengths List', 'khawar.neck.lengths.list', 'active', 'web', '2022-08-31 09:11:14', '2022-08-31 09:11:14');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_ar` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description_ar` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tailor_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `title_ar`, `description`, `description_ar`, `status_id`, `created_at`, `updated_at`, `slug`, `tailor_id`) VALUES
(9, 'Product One', 'المنتج الأول', '<p>Product One</p>', '<p>المنتج الأول</p>', 1, '2022-08-15 12:59:11', '2022-08-28 14:40:13', 'product-one', 8),
(10, 'Product Two', 'المنتج الثاني', '<p>Product Two</p>', '<p>المنتج الثاني</p>', 1, '2022-08-15 13:04:40', '2022-08-15 13:04:40', 'product-two', 8),
(11, 'Product Three', 'المنتج الثالث', '<p>Product Three</p>', '<p>المنتج الثالث</p>', 1, '2022-08-24 15:40:01', '2022-08-24 15:40:01', 'product-three', 8);

-- --------------------------------------------------------

--
-- Table structure for table `product_colors`
--

DROP TABLE IF EXISTS `product_colors`;
CREATE TABLE IF NOT EXISTS `product_colors` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_ar` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_fabrics`
--

DROP TABLE IF EXISTS `product_fabrics`;
CREATE TABLE IF NOT EXISTS `product_fabrics` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_ar` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_fabrics`
--

INSERT INTO `product_fabrics` (`id`, `title`, `title_ar`, `created_at`, `updated_at`, `slug`) VALUES
(3, 'Linen', 'الكتان', '2022-08-10 18:36:22', '2022-08-23 17:15:29', 'linen'),
(4, 'Cotton', 'قطن', '2022-08-24 15:31:40', '2022-08-24 15:31:40', 'cotton');

-- --------------------------------------------------------

--
-- Table structure for table `product_ratings`
--

DROP TABLE IF EXISTS `product_ratings`;
CREATE TABLE IF NOT EXISTS `product_ratings` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `review` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `accept_status_id` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_ratings`
--

INSERT INTO `product_ratings` (`id`, `product_id`, `rating`, `review`, `created_at`, `updated_at`, `customer_id`, `order_id`, `accept_status_id`) VALUES
(3, 9, 3, 'asdasdnkasdsdfahdskjhdsfkjsdfhjk jdfshdfksjhsdfkjsdh dfshksdfhsdkjfhsdfk sdfhkdsfhsdkjsd dfshkjdsfhsdkjfhs dfhkjdsfhkjsdf', '2022-08-19 11:37:28', '2022-08-22 13:29:03', 1, 1, 2),
(4, 10, 3, 'asdasd', '2022-08-19 11:37:28', '2022-08-22 13:29:03', 1, 1, 2),
(5, 10, 3, 'sadsadsad', '2022-08-29 09:40:25', '2022-08-29 15:15:22', 13, 12, 2),
(6, 9, 4, 'very good product', '2022-09-24 10:13:28', '2022-09-24 15:14:05', 19, 15, 2),
(7, 9, 3, 'brush', '2022-09-24 10:55:01', '2022-09-24 10:55:01', 19, 16, 1),
(8, 9, 4, 'asddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd', '2022-09-24 11:14:54', '2022-09-24 11:14:54', 19, 17, 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_shops`
--

DROP TABLE IF EXISTS `product_shops`;
CREATE TABLE IF NOT EXISTS `product_shops` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_ar` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_shops`
--

INSERT INTO `product_shops` (`id`, `title`, `title_ar`, `status_id`, `created_at`, `updated_at`) VALUES
(3, 'Shop', 'محل', 1, '2022-08-10 18:38:44', '2022-08-10 18:38:44');

-- --------------------------------------------------------

--
-- Table structure for table `product_sizes`
--

DROP TABLE IF EXISTS `product_sizes`;
CREATE TABLE IF NOT EXISTS `product_sizes` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_ar` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_sizes`
--

INSERT INTO `product_sizes` (`id`, `title`, `title_ar`, `created_at`, `updated_at`, `slug`) VALUES
(3, 'X', 'x', '2022-08-10 18:37:02', '2022-08-24 15:33:43', 'x'),
(4, 'XL', 'xl', '2022-08-15 08:28:16', '2022-08-24 15:33:51', 'xl'),
(5, 'S', 's', '2022-08-24 15:33:23', '2022-08-24 15:34:02', 's');

-- --------------------------------------------------------

--
-- Table structure for table `product_variants`
--

DROP TABLE IF EXISTS `product_variants`;
CREATE TABLE IF NOT EXISTS `product_variants` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `product_fabric_id` int(11) NOT NULL,
  `product_size_id` int(11) NOT NULL,
  `price` double(8,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_variants`
--

INSERT INTO `product_variants` (`id`, `product_id`, `product_fabric_id`, `product_size_id`, `price`, `quantity`, `created_at`, `updated_at`) VALUES
(10, 9, 3, 3, 34.00, 5, '2022-08-15 12:59:11', '2022-10-04 09:53:31'),
(11, 10, 3, 3, 57.00, 9, '2022-08-15 13:04:40', '2022-09-21 08:12:19'),
(12, 10, 3, 4, 98.00, 9, '2022-08-15 13:04:40', '2022-09-21 08:12:19'),
(13, 11, 3, 3, 50.00, 0, '2022-08-24 15:40:01', '2022-08-26 04:42:20'),
(14, 11, 4, 3, 500.00, 2, '2022-08-24 15:40:01', '2022-08-29 15:34:35'),
(16, 11, 4, 4, 300.00, 6, '2022-08-24 15:40:01', '2022-08-24 15:40:01'),
(17, 11, 3, 5, 600.00, 6, '2022-08-24 16:39:22', '2022-08-24 16:39:22');

-- --------------------------------------------------------

--
-- Table structure for table `providers`
--

DROP TABLE IF EXISTS `providers`;
CREATE TABLE IF NOT EXISTS `providers` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `status`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 'Super Admin', 'active', 'web', '2022-02-04 08:27:16', '2022-02-04 08:27:16'),
(11, 'test.role', 'Test Role', NULL, 'web', '2022-08-30 20:18:13', '2022-08-30 20:18:13');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

DROP TABLE IF EXISTS `role_has_permissions`;
CREATE TABLE IF NOT EXISTS `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(106, 11),
(107, 11),
(108, 11),
(109, 11),
(110, 11),
(111, 11),
(112, 11),
(113, 11),
(114, 11),
(115, 11),
(116, 11),
(117, 11),
(118, 11),
(119, 11),
(120, 11),
(121, 11),
(122, 11),
(123, 11),
(124, 11),
(125, 11),
(126, 11),
(127, 11),
(128, 11),
(129, 11),
(130, 11),
(131, 11),
(132, 11),
(133, 11),
(134, 11),
(135, 11),
(136, 11),
(137, 11),
(138, 11),
(139, 11),
(140, 11),
(141, 11),
(142, 11),
(143, 11),
(144, 11),
(145, 11),
(146, 11),
(147, 11),
(148, 11),
(149, 11),
(150, 11),
(151, 11),
(152, 11),
(153, 11),
(154, 11),
(155, 11),
(156, 11),
(157, 11),
(158, 11),
(159, 11),
(160, 11),
(161, 11),
(162, 11),
(163, 11),
(164, 11),
(165, 11),
(166, 11),
(167, 11),
(168, 11),
(169, 11),
(170, 11),
(171, 11),
(172, 11),
(173, 11),
(174, 11),
(175, 11),
(176, 11),
(177, 11),
(178, 11),
(179, 11),
(180, 11),
(181, 11),
(182, 11),
(183, 11),
(184, 11),
(185, 11),
(186, 11),
(187, 11),
(192, 11),
(193, 11),
(194, 11),
(195, 11),
(196, 11),
(197, 11),
(198, 11),
(199, 11),
(200, 11),
(201, 11),
(202, 11),
(203, 11),
(204, 11),
(205, 11),
(206, 11),
(207, 11),
(208, 11),
(209, 11),
(210, 11),
(211, 11),
(212, 11),
(213, 11),
(214, 11),
(215, 11),
(216, 11),
(217, 11),
(218, 11),
(219, 11);

-- --------------------------------------------------------

--
-- Table structure for table `seos`
--

DROP TABLE IF EXISTS `seos`;
CREATE TABLE IF NOT EXISTS `seos` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `seo_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `data` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `seos_seo_type_seo_id_index` (`seo_type`,`seo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `social_providers`
--

DROP TABLE IF EXISTS `social_providers`;
CREATE TABLE IF NOT EXISTS `social_providers` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) DEFAULT NULL,
  `provider_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sort_filters`
--

DROP TABLE IF EXISTS `sort_filters`;
CREATE TABLE IF NOT EXISTS `sort_filters` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_ar` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sort_filters`
--

INSERT INTO `sort_filters` (`id`, `title`, `title_ar`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Highest to Lowest', 'من الأعلى إلى الأدنى', 'high-to-low', NULL, NULL),
(2, 'Lowest to Highest', 'من الأدنى إلى الأعلى', 'lowest-to-highest', NULL, NULL),
(3, 'Newly Products', 'حديثا المنتجات', 'newly-products', NULL, NULL),
(4, 'Older Products', 'أقدم المنتجات', 'older-products', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `statuses`
--

DROP TABLE IF EXISTS `statuses`;
CREATE TABLE IF NOT EXISTS `statuses` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `statuses`
--

INSERT INTO `statuses` (`id`, `title`, `created_at`, `updated_at`) VALUES
(1, 'Active', NULL, NULL),
(2, 'InActive', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tailors_info`
--

DROP TABLE IF EXISTS `tailors_info`;
CREATE TABLE IF NOT EXISTS `tailors_info` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_ar` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description_ar` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` double(8,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tailors_info`
--

INSERT INTO `tailors_info` (`id`, `title`, `title_ar`, `description`, `description_ar`, `status_id`, `created_at`, `updated_at`, `slug`, `name`, `order`) VALUES
(8, 'Tailor One', 'خياط واحد', '<p>Tailor One</p>', '<p>خياط واحد</p>', 1, '2022-08-15 12:50:30', '2022-09-21 09:46:15', 'tailor-one', 'Tailor One', 2.00),
(9, 'Tailor Two', 'خياط اثنين', '<p>Tailor Two</p>', '<p>خياط اثنين</p>', 1, '2022-08-15 12:51:52', '2022-09-21 11:33:08', 'tailor-two', 'Tailor Two', 3.00),
(12, 'Tailor Three', 'Tailor Three', '<p>Tailor Three</p>', '<p>Tailor Three</p>', 1, '2022-08-21 00:58:35', '2022-09-21 11:33:13', 'tailor-three', 'Tailor Three', 5.00);

-- --------------------------------------------------------

--
-- Table structure for table `templates`
--

DROP TABLE IF EXISTS `templates`;
CREATE TABLE IF NOT EXISTS `templates` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `template` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `templates`
--

INSERT INTO `templates` (`id`, `title`, `template`, `created_at`, `updated_at`) VALUES
(1, 'Home', 'home', NULL, NULL),
(2, 'About US', 'about_us', NULL, NULL),
(3, 'Shop', 'shop', NULL, NULL),
(4, 'Tailors', 'tailors', NULL, NULL),
(5, 'Testimonials', 'testimonials', NULL, NULL),
(6, 'Contact US', 'contact_us', NULL, NULL),
(7, 'FAQ', 'faq', NULL, NULL),
(8, 'Cart', 'cart', NULL, NULL),
(9, 'Terms and Conditions', 'term_and_conditions', NULL, NULL),
(10, 'Privacy Policy', 'privacy_policy', NULL, NULL),
(11, 'Checkout', 'checkout', NULL, NULL),
(12, '404', 'not_found', NULL, NULL),
(13, 'Wishlist', 'wishlist', NULL, NULL),
(14, 'Custom Kandora', 'custom_kandora', NULL, NULL),
(15, 'Custom Kandora Checkout', 'custom_kandora_checkout', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `testimonials`
--

DROP TABLE IF EXISTS `testimonials`;
CREATE TABLE IF NOT EXISTS `testimonials` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_ar` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ratings` int(11) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description_ar` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `order` double(8,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `testimonials`
--

INSERT INTO `testimonials` (`id`, `title`, `title_ar`, `ratings`, `description`, `description_ar`, `status_id`, `created_at`, `updated_at`, `order`) VALUES
(2, 'EMMA KIMMS', 'إيما كيمس', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry.', 'لوريم إيبسوم هو ببساطة نص شكلي يستخدم في صناعة الطباعة والتنضيد. كان لوريم إيبسوم هو الصناعة.', 1, '2022-08-10 22:20:41', '2022-09-21 09:20:44', 2.00),
(3, 'Testimonial One', 'شهادة واحدة', 4, 'Testimonial One', 'شهادة واحدة', 1, '2022-08-15 14:20:50', '2022-09-21 09:20:52', 1.00),
(4, 'Testimonial Two', 'الشهادة الثانية', 3, 'Testimonial Two', 'الشهادة الثانية', 1, '2022-08-15 14:21:33', '2022-09-21 09:23:03', 5.00),
(5, 'Testimonials Three', 'شهادات ثلاثة', 4, 'Testimonials Three', 'شهادات ثلاثة', 1, '2022-08-15 14:22:25', '2022-09-21 09:21:04', 4.00),
(6, 'test', 'test', 4, 'test', 'test', 1, '2022-09-21 09:23:43', '2022-09-21 09:23:43', 7.00),
(7, 'saddsa', 'sadsd', 4, 'saddas', 'sadasd', 1, '2022-09-21 09:28:19', '2022-09-21 09:28:19', 7.00),
(8, 'test', 'test', 4, 'test', 'test', 1, '2022-09-21 09:28:52', '2022-09-21 09:28:52', 4.00);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_type` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=167 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `status`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `user_type`) VALUES
(1, 'Super Admin', 'admin@yopmail.com', 'active', NULL, '$2y$10$pOI34qk7GLbgszv8i2dt..rYFnbxEQuxwUL5NvLLQVJ4J52QhjWQS', NULL, '2022-02-04 09:15:56', '2022-07-20 10:21:27', NULL),
(166, 'Test User', 'test@digitailor.com', 'active', NULL, '$2y$10$GbZi/CWWGnr4GAPzSbzZfOAp/1tXVwMQ/eNqRKAnh227AT2yfe5qK', NULL, '2022-08-30 20:34:36', '2022-09-02 14:16:02', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wish_lists`
--

DROP TABLE IF EXISTS `wish_lists`;
CREATE TABLE IF NOT EXISTS `wish_lists` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wish_lists`
--

INSERT INTO `wish_lists` (`id`, `customer_id`, `product_id`, `created_at`, `updated_at`) VALUES
(1, 12, 10, '2022-08-26 04:41:01', '2022-08-26 04:41:01'),
(2, 19, 9, '2022-09-27 05:37:12', '2022-09-27 05:37:12');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
