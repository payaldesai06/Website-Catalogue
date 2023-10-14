-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 14, 2023 at 09:14 PM
-- Server version: 5.7.24-log
-- PHP Version: 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `website_catalogue`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'Novels', 2, '2023-10-14 18:36:09', '2023-10-14 18:36:09'),
(2, 'Social Media', 2, '2023-10-14 18:36:38', '2023-10-14 18:42:53'),
(4, 'Media', 2, '2023-10-14 18:36:38', '2023-10-14 18:42:53'),
(5, 'Articles', 2, '2023-10-14 18:36:38', '2023-10-14 18:42:53'),
(6, 'Movies', 2, '2023-10-14 18:36:38', '2023-10-14 18:42:53'),
(7, 'Music', 2, '2023-10-14 18:36:09', '2023-10-14 18:36:09'),
(8, 'Dance', 2, '2023-10-14 18:36:38', '2023-10-14 18:42:53'),
(9, 'Books', 2, '2023-10-14 18:36:38', '2023-10-14 18:42:53'),
(10, 'Signing', 2, '2023-10-14 18:36:38', '2023-10-14 18:42:53'),
(11, 'Shopping', 2, '2023-10-14 18:36:38', '2023-10-14 18:42:53');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(2, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(3, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(4, '2016_06_01_000004_create_oauth_clients_table', 1),
(5, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(6, '2021_02_10_005736_create_roles_table', 1),
(7, '2021_03_10_002009_create_users_table', 1),
(8, '2022_02_12_075207_create_categories_table', 1),
(9, '2022_02_12_075251_create_websites_table', 1),
(10, '2023_10_13_135831_create_website_categories_table', 1),
(11, '2023_10_13_135921_create_website_votes_table', 1),
(12, '2023_10_13_140018_create_website_declined_reasons_table', 1),
(13, '2014_10_12_100000_create_password_resets_table', 2),
(14, '2019_08_19_000000_create_failed_jobs_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('397c5c75f19e475aa8bdad2803af8b943b4af619ee5a111e6452cb5eb245e9348abd6d41761272a7', 2, 1, 'authToken', '[]', 0, '2023-10-13 20:50:10', '2023-10-13 20:50:10', '2024-04-10 21:50:10'),
('40c41bc970fb14b834f9e9783f9c2a4e424e20927dc19477c0c216a2ffd972d9cefe4a6eb0d96998', 18, 1, 'authToken', '[]', 0, '2023-10-13 18:02:28', '2023-10-13 18:02:28', '2024-04-10 19:02:28'),
('445021a31cf83d18a99c3a5c8ff789f7c317948f51542da045c76ea7d29558cbb358d5fdf2a8bb63', 1, 1, 'authToken', '[]', 0, '2023-10-13 17:49:51', '2023-10-13 17:49:51', '2024-04-10 18:49:51'),
('54ee39ea96347ea707fb212e50314660566a30a193aaf594f1105b549e7f60cc960be4dcb392aec5', 18, 1, 'authToken', '[]', 1, '2023-10-13 18:00:25', '2023-10-13 18:00:25', '2024-04-10 19:00:25'),
('8f137e4ae5b58628d286f1444218fc832108b71b6571b39b5ddd939768f6d8196e3f9895d13676b3', 1, 1, 'authToken', '[]', 0, '2023-10-13 17:59:32', '2023-10-13 17:59:32', '2024-04-10 18:59:32'),
('919b14cdd67c83f7649f6f3560ee7503fc6b7fbdb71688b879226cbedb044820183caf15d2fea705', 5, 1, 'authToken', '[]', 0, '2023-10-13 18:02:46', '2023-10-13 18:02:46', '2024-04-10 19:02:46'),
('952e1f0ecca7a25fcc1c42204cb6079de2978fbce743895a3621e58f7a02570823285c2e5b0cf19a', 1, 1, 'authToken', '[]', 0, '2023-10-14 19:09:54', '2023-10-14 19:09:54', '2024-04-11 20:09:54'),
('a78015402a9c2638e5998c57f410a1c7070249b8d44c655caecaf3222d2e4c886ffafa4659ec4904', 1, 1, 'authToken', '[]', 0, '2023-10-14 18:34:50', '2023-10-14 18:34:50', '2024-04-11 19:34:50'),
('aeb3043b1181f2592990899c4852892233a1d25f397b3a6514506632c3e455311ed7b5c534148eb5', 2, 1, 'authToken', '[]', 0, '2023-10-13 17:46:59', '2023-10-13 17:46:59', '2024-04-10 18:46:59'),
('c1a2259b73cd7188b66d5ebd559eca97d86498e17dc9aa4b78771a362becb4f0c9b4fa1784a521f0', 1, 1, 'authToken', '[]', 1, '2023-10-13 17:56:19', '2023-10-13 17:56:19', '2024-04-10 18:56:19'),
('c2330b5dc315aed67d3a9976d44a6e81dcad69560e963291109038006d45cc2c4097afa0c1853083', 1, 1, 'authToken', '[]', 0, '2023-10-13 20:42:44', '2023-10-13 20:42:44', '2024-04-10 21:42:44'),
('c7cf3e1c70773e58fb738dc52b7074e40e634c7afe3cbf7cee6d10d9f654ac9051a2a388d1fa7b06', 1, 1, 'authToken', '[]', 0, '2023-10-14 19:08:11', '2023-10-14 19:08:11', '2024-04-11 20:08:11'),
('f0c3caa8a3ea8b4f2ca1159172fd15e9b3614382fc812a4ea07fce6ae691333143ee581ef90a1edf', 2, 1, 'authToken', '[]', 0, '2023-10-13 20:43:22', '2023-10-13 20:43:22', '2024-04-10 21:43:22'),
('f179bad3d9c98f20ed4eccbc16f0766118601ce111c1075b4e005ca1fdf9f22a53da0a4c65811f25', 2, 1, 'authToken', '[]', 1, '2023-10-13 17:51:10', '2023-10-13 17:51:10', '2024-04-10 18:51:10'),
('fe6e4084b27b4bf4258bb6b8305f7cc683b53b10c31e4b5c30b574dafacc3e8dd8cf7c635dab5802', 2, 1, 'authToken', '[]', 0, '2023-10-13 17:46:35', '2023-10-13 17:46:35', '2024-04-10 18:46:35');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'WebsiteCatalogue Personal Access Client', '4kSlQQAMlWWMcodOhvwwTzSM4G0wRliFTaUo2h4p', NULL, 'http://localhost', 1, 0, 0, '2023-10-13 15:38:56', '2023-10-13 15:38:56'),
(2, NULL, 'WebsiteCatalogue Password Grant Client', '54me1PRuvk1CUoEkCOJ9Y0rWbNFUAtA8sK5DaS8Z', 'users', 'http://localhost', 0, 1, 0, '2023-10-13 15:38:56', '2023-10-13 15:38:56');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2023-10-13 15:38:56', '2023-10-13 15:38:56');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', '2023-10-13 15:56:00', '2023-10-13 15:56:00'),
(2, 'User', '2023-10-13 15:56:00', '2023-10-13 15:56:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL DEFAULT '2',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `role_id`, `is_active`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Admin', 'admin@admin.com', '$2y$10$vG6c6yc2PpXCBwWeysjnPO8YnpwLtwzYvc4WnKn8tPNXdmhhchZiO', 1, 1, NULL, '2023-10-13 15:56:00', '2023-10-13 15:56:00', NULL),
(2, 'Payal Desai', 'payal.desai06@gmail.com', '$2y$10$AOkixt4OqNdQnByul/Z5E.ZbjGqO41qTUtZp82ijttAXM.6cbwYyq', 2, 1, NULL, '2023-10-13 15:56:00', '2023-10-13 15:56:00', NULL),
(3, 'Kale Schiller', 'jillian.johns@example.net', '$2y$10$8yQs0MGR/XZiInQTCUFUneddI1cePPciUQzNJ2PpZfje.SDxzfSUS', 2, 1, NULL, '2023-10-13 15:56:03', '2023-10-13 15:56:03', NULL),
(4, 'Makayla Ruecker', 'ken74@example.com', '$2y$10$gHrbX6rU9zzpf2EIsmFSI.bWeOYsSvXWrWyy5GNR.ObjNlcci2Hy6', 2, 1, NULL, '2023-10-13 15:56:03', '2023-10-13 15:56:03', NULL),
(5, 'Lisette Volkman', 'jaylan.schmitt@example.org', '$2y$10$B4iDFPdmV2ADZ.L2bQg36O7bkqypR5ZXOH4wbBh58RNBHF6Hda0wG', 2, 1, NULL, '2023-10-13 15:56:03', '2023-10-13 15:56:03', NULL),
(6, 'River O\'Conner', 'kay29@example.org', '$2y$10$3sHdokGaFHO7Uu67t4LEjeQXZhiJbHky/kttDZmSTyDmllQppI0Nm', 2, 1, NULL, '2023-10-13 15:56:03', '2023-10-13 15:56:03', NULL),
(7, 'Maynard Daugherty', 'madelyn.harvey@example.com', '$2y$10$OeZUiuzaKmMq.o/vVuD9BuPUfdN5jkq5Q7/SHGUy/tuJ74TK470Ku', 2, 1, NULL, '2023-10-13 15:56:03', '2023-10-13 15:56:03', NULL),
(8, 'Marques Huel', 'logan61@example.com', '$2y$10$CSuBeWWwoOGdI56xoyOJZuLjPG3Livp0vNy9ZdKSuRTyF64xzpR7a', 2, 1, NULL, '2023-10-13 15:56:03', '2023-10-13 15:56:03', NULL),
(9, 'Roslyn Hyatt', 'loconner@example.com', '$2y$10$GNjK54Pmidb0rcPoUwYjVOcV4zzuXUQSPsgcNOpWowhByDDF8ht8u', 2, 1, NULL, '2023-10-13 15:56:03', '2023-10-13 15:56:03', NULL),
(10, 'Laverna O\'Conner III', 'ernser.hal@example.net', '$2y$10$zde68VO16LK3SVCMw2gKNe33LUiqX7KFMku6krr7VjSc4WnkJS2kG', 2, 1, NULL, '2023-10-13 15:56:03', '2023-10-13 15:56:03', NULL),
(11, 'Prof. Lacey Cartwright V', 'rudolph.prohaska@example.com', '$2y$10$9wXUFBZXgHrfER9rrIk9ne.nTUHU/RxseciZBdrz3CiToRuM3O4.W', 2, 1, NULL, '2023-10-13 15:56:03', '2023-10-13 15:56:03', NULL),
(12, 'Miss Christy Kuphal', 'freeda88@example.org', '$2y$10$uEN1FRF7S21LjH.PwGiEdeFF923u4/91XrUiL8KIx8QcsSMQFz1rq', 2, 1, NULL, '2023-10-13 15:56:03', '2023-10-13 15:56:03', NULL),
(13, 'Emmett Metz', 'hhills@example.org', '$2y$10$BsMcxEiSQFLsA.FnAA6bse8FFBk0GOuEXbWdEM/2552f3HnsqGiza', 2, 1, NULL, '2023-10-13 15:56:03', '2023-10-13 15:56:03', NULL),
(14, 'Cornelius Schaden', 'adrien.prosacco@example.org', '$2y$10$gmeVnw1RqKkAAofmqXkvAuktNI7fveWXTFOz1tYKKbTfvPqu2rcuO', 2, 1, NULL, '2023-10-13 15:56:03', '2023-10-13 15:56:03', NULL),
(15, 'Mr. Caleb Bailey', 'keeling.walter@example.net', '$2y$10$sqBMkEidhmi8UzRsRN5PrOdpufmVfLhSYvGhTNydxUS6b6xaajsfy', 2, 1, NULL, '2023-10-13 15:56:03', '2023-10-13 15:56:03', NULL),
(16, 'Dr. Tracey Hyatt', 'korbin.lind@example.org', '$2y$10$6fZvAHt7bkTuOK2srOL/0unaqX1qfhMQU0ckYxHG85.G3hhVjsW9q', 2, 1, NULL, '2023-10-13 15:56:03', '2023-10-13 15:56:03', NULL),
(17, 'Stephanie Hammes', 'beaulah.ondricka@example.com', '$2y$10$BifgEhSPHyd.DbXYsxHO2.bXOQaT/qx.HMDYXI2VFYxe68zTmJZY2', 2, 1, NULL, '2023-10-13 15:56:03', '2023-10-13 15:56:03', NULL),
(18, 'Payal desai', 'payal.desai092@gmail.com', '$2y$10$X0CBSkeDN1nXx4joNlDbdubNkk9e3zcWjYVbAnQMl5GoShr6KhATe', 2, 1, NULL, '2023-10-13 18:00:25', '2023-10-13 18:00:25', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `websites`
--

CREATE TABLE `websites` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '0->pending, 1->active, 2->declined',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `websites`
--

INSERT INTO `websites` (`id`, `user_id`, `name`, `link`, `description`, `image`, `status`, `created_at`, `updated_at`) VALUES
(5, 2, 'Facebook', 'www.facebook.com', 'Testing', '1697313149.png', 2, '2023-10-14 18:52:29', '2023-10-14 19:12:22'),
(6, 2, 'Snapchat', 'www.snapchat.com', 'Testing', '1697313498.png', 1, '2023-10-14 18:58:18', '2023-10-14 19:22:56'),
(7, 1, 'Instagram', 'www.instagram.com', 'Testing', NULL, 1, '2023-10-14 18:58:40', '2023-10-14 20:03:45'),
(9, 3, 'Twitter', 'www.facebook.com', 'Testing', NULL, 1, '2023-10-14 19:45:52', '2023-10-14 19:45:52');

-- --------------------------------------------------------

--
-- Table structure for table `website_categories`
--

CREATE TABLE `website_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `website_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `website_categories`
--

INSERT INTO `website_categories` (`id`, `website_id`, `category_id`) VALUES
(5, 5, 1),
(6, 5, 2),
(7, 6, 1),
(8, 6, 2),
(13, 9, 1),
(14, 9, 2),
(19, 7, 1),
(20, 7, 2);

-- --------------------------------------------------------

--
-- Table structure for table `website_declined_reasons`
--

CREATE TABLE `website_declined_reasons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `website_id` bigint(20) UNSIGNED NOT NULL,
  `reason` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `website_declined_reasons`
--

INSERT INTO `website_declined_reasons` (`id`, `website_id`, `reason`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 5, 'This is not good site.', 1, '2023-10-14 19:22:21', '2023-10-14 19:22:21');

-- --------------------------------------------------------

--
-- Table structure for table `website_votes`
--

CREATE TABLE `website_votes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `website_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_created_by_foreign` (`created_by`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Indexes for table `websites`
--
ALTER TABLE `websites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `websites_user_id_foreign` (`user_id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `website_categories`
--
ALTER TABLE `website_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `website_categories_website_id_foreign` (`website_id`),
  ADD KEY `website_categories_category_id_foreign` (`category_id`);

--
-- Indexes for table `website_declined_reasons`
--
ALTER TABLE `website_declined_reasons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `website_declined_reasons_website_id_foreign` (`website_id`),
  ADD KEY `website_declined_reasons_created_by_foreign` (`created_by`);

--
-- Indexes for table `website_votes`
--
ALTER TABLE `website_votes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `website_votes_website_id_foreign` (`website_id`),
  ADD KEY `website_votes_user_id_foreign` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `websites`
--
ALTER TABLE `websites`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `website_categories`
--
ALTER TABLE `website_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `website_declined_reasons`
--
ALTER TABLE `website_declined_reasons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `website_votes`
--
ALTER TABLE `website_votes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `websites`
--
ALTER TABLE `websites`
  ADD CONSTRAINT `websites_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `website_categories`
--
ALTER TABLE `website_categories`
  ADD CONSTRAINT `website_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `website_categories_website_id_foreign` FOREIGN KEY (`website_id`) REFERENCES `websites` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `website_declined_reasons`
--
ALTER TABLE `website_declined_reasons`
  ADD CONSTRAINT `website_declined_reasons_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `website_declined_reasons_website_id_foreign` FOREIGN KEY (`website_id`) REFERENCES `websites` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `website_votes`
--
ALTER TABLE `website_votes`
  ADD CONSTRAINT `website_votes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `website_votes_website_id_foreign` FOREIGN KEY (`website_id`) REFERENCES `websites` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
