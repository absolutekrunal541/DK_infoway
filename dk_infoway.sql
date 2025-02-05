-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 05, 2025 at 07:26 AM
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
-- Database: `dk_infoway`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `phone_no` varchar(150) NOT NULL,
  `password` varchar(255) NOT NULL,
  `profile` varchar(10) NOT NULL,
  `login_ip` varchar(16) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `phone_no`, `password`, `profile`, `login_ip`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 'super_admin@gmail.com', '8956235263', '$2y$12$CZQnuwtW6dI8wKgX2y2UJuiprHGjYv.3gwWw6m2ca/JOG0iMnIJF2', '', '127.0.0.1', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(8, '2025_02_04_152929_table_stock', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(19, 'App\\Models\\User', 11, 'authToken', 'b4de21b3aa8b23cd5100460458a91e003ec57b13d3a80f0fae53e4d782f34464', '[\"*\"]', '2025-02-05 00:38:55', NULL, '2025-02-04 23:53:32', '2025-02-05 00:38:55');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('cFweCzL1tXKHFFfIlVRYw3DtTZ2vL9yMICIqmVlP', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWmF1aEx1TEJnSnpwQVVuSm5XYjZhaVZuS0ZpbVp3RGtVWDhrck5MNyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9zdG9jay9hZGQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1738736123),
('OQGPnBzOxztoBkn1HbnwE5M4ThOzhmvi2aNVJiZj', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNnJSUDR6dXJRYXFLaGU5QUFveGsxMkR3cFZ4S0pOMjFoWm9tSVNaZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1738732761);

-- --------------------------------------------------------

--
-- Table structure for table `stocks`
--

CREATE TABLE `stocks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `item_code` varchar(255) DEFAULT NULL,
  `item_name` varchar(255) DEFAULT NULL,
  `quantity` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `status` int(11) NOT NULL,
  `stock_update_date` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stocks`
--

INSERT INTO `stocks` (`id`, `item_code`, `item_name`, `quantity`, `location`, `store_id`, `status`, `stock_update_date`, `created_at`, `updated_at`) VALUES
(7, '9ZDONHGCIX', 'dolor', '67', 'Ronport', 1, 1, NULL, '2025-02-04 10:21:08', '2025-02-05 00:20:59'),
(8, 'BLA6A242I2', 'dolorem', '28', 'Stehrview', 1, 1, NULL, '2025-02-04 10:21:08', '2025-02-05 00:20:59'),
(9, 'YDJCLYV0I5', 'consectetur', '7', 'Lake Lauriefort', 1, 1, NULL, '2025-02-04 10:21:08', '2025-02-05 00:20:59'),
(10, 'XVJ85LLAMM', 'accusantium', '75', 'Cristburgh', 1, 1, NULL, '2025-02-04 10:21:08', '2025-02-05 00:20:59'),
(12, 'YXZLIEOC4S', 'blanditiis', '80', 'West Wilbermouth', 1, 1, NULL, '2025-02-04 10:21:08', '2025-02-05 00:20:59'),
(13, 'QTUXXSEVIS', 'dicta', '95', 'Lake Laury', 1, 1, NULL, '2025-02-04 10:21:08', '2025-02-05 00:20:59'),
(14, 'CDDQWBC8XA', 'voluptates', '81', 'Keelyberg', 1, 1, NULL, '2025-02-04 10:21:08', '2025-02-05 00:20:59'),
(15, 'TUQWQBOUBI', 'quo', '51', 'Lake Selmerville', 1, 1, NULL, '2025-02-04 10:21:08', '2025-02-05 00:20:59'),
(16, 'NU1EIKDVMQ', 'quae', '14', 'Lydafort', 1, 1, NULL, '2025-02-04 10:21:08', '2025-02-05 00:20:59'),
(17, 'IHPH4TPLBI', 'et', '24', 'New Avismouth', 1, 1, NULL, '2025-02-04 10:21:08', '2025-02-05 00:20:59'),
(18, 'AI0AM79ND3', 'incidunt', '76', 'Mertzchester', 1, 1, NULL, '2025-02-04 10:21:08', '2025-02-05 00:20:59'),
(19, 'HTBPVMU8BN', 'et', '92', 'Jacquelynmouth', 1, 1, NULL, '2025-02-04 10:21:08', '2025-02-05 00:20:59'),
(20, 'KDTZKFCXSE', 'voluptatem', '99', 'Reyesport', 1, 1, NULL, '2025-02-04 10:21:08', '2025-02-05 00:20:59'),
(21, '6UPZVIFIZ5', 'enim', '90', 'Wittingmouth', 1, 1, NULL, '2025-02-04 10:21:08', '2025-02-05 00:20:59'),
(22, '309BTYONHJ', 'odio', '23', 'Wymantown', 1, 1, NULL, '2025-02-04 10:21:08', '2025-02-05 00:20:59'),
(23, 'PWYKH9Z3PT', 'porro', '97', 'Kristabury', 1, 1, NULL, '2025-02-04 10:21:08', '2025-02-05 00:20:59'),
(24, 'OEF6HTZYGC', 'aut', '69', 'Anastasiaburgh', 1, 1, NULL, '2025-02-04 10:21:08', '2025-02-05 00:20:59'),
(25, 'R9YHWMHY5J', 'reprehenderit', '62', 'Port Orionborough', 1, 1, NULL, '2025-02-04 10:21:08', '2025-02-05 00:20:59'),
(26, 'VOYAGDMFLS', 'harum', '42', 'Vitaview', 1, 1, NULL, '2025-02-04 10:21:08', '2025-02-05 00:20:59'),
(27, 'NLL1MPEKQU', 'minima', '93', 'Ellabury', 1, 1, NULL, '2025-02-04 10:21:08', '2025-02-05 00:20:59'),
(28, 'NYRTMR2KJL', 'quis', '84', 'New Rosalia', 1, 1, NULL, '2025-02-04 10:21:08', '2025-02-05 00:20:59'),
(29, 'OEJ9VITGWL', 'praesentium', '81', 'Lake Dayanaside', 1, 1, NULL, '2025-02-04 10:21:08', '2025-02-05 00:20:59'),
(30, 'VM48HGCYA0', 'fugiat', '63', 'Parkerberg', 1, 1, NULL, '2025-02-04 10:21:08', '2025-02-05 00:20:59'),
(31, 'L08QPBWY3Y', 'sed', '53', 'Ransomfurt', 1, 1, NULL, '2025-02-04 10:21:08', '2025-02-05 00:20:59'),
(32, '4VK3U5K6Z3', 'dolorem', '48', 'South Katelynn', 1, 1, NULL, '2025-02-04 10:21:08', '2025-02-05 00:20:59'),
(33, 'RH9K3U2AUV', 'voluptas', '44', 'North Roger', 1, 1, NULL, '2025-02-04 10:21:08', '2025-02-05 00:20:59'),
(34, 'BK9ORPDRFX', 'aut', '55', 'Hilmashire', 1, 1, NULL, '2025-02-04 10:21:08', '2025-02-05 00:20:59'),
(35, '8R8QTVRJN7', 'quis', '69', 'Schulistborough', 1, 1, NULL, '2025-02-04 10:21:08', '2025-02-05 00:20:59'),
(36, 'W6WJUR3K35', 'totam', '43', 'Port Yvonnemouth', 1, 1, NULL, '2025-02-04 10:21:08', '2025-02-05 00:20:59'),
(37, 'QT1FLNPJU3', 'voluptate', '50', 'West Else', 1, 1, NULL, '2025-02-04 10:21:08', '2025-02-05 00:20:59'),
(38, 'KVLYLXAYKM', 'quia', '59', 'Ashleighfort', 1, 1, NULL, '2025-02-04 10:21:08', '2025-02-05 00:20:59'),
(39, 'AIFWIMH02V', 'corporis', '6', 'West Clarabelleland', 1, 1, NULL, '2025-02-04 10:21:08', '2025-02-05 00:20:59'),
(40, 'XU20WAL65Y', 'neque', '7', 'Kennyview', 1, 1, NULL, '2025-02-04 10:21:08', '2025-02-05 00:20:59'),
(41, 'H7NNOFDPUG', 'et', '42', 'Watersshire', 1, 1, NULL, '2025-02-04 10:21:08', '2025-02-05 00:20:59'),
(42, 'NLED3HODMN', 'et', '82', 'Sisterville', 1, 1, NULL, '2025-02-04 10:21:08', '2025-02-05 00:20:59'),
(43, '5CUABSNEYP', 'iste', '44', 'New Allie', 1, 1, NULL, '2025-02-04 10:21:08', '2025-02-05 00:20:59'),
(44, 'RWXHANMSLK', 'est', '6', 'Lake Wendyside', 1, 1, NULL, '2025-02-04 10:21:08', '2025-02-05 00:20:59'),
(45, 'HMYAMHWFQE', 'incidunt', '8', 'North Dannie', 1, 1, NULL, '2025-02-04 10:21:08', '2025-02-05 00:20:59'),
(46, 'F9QN3AQVC6', 'qui', '91', 'Waltonchester', 1, 1, NULL, '2025-02-04 10:21:08', '2025-02-05 00:20:59'),
(47, 'RGP8TG5ITY', 'ratione', '63', 'Lake Nolaburgh', 1, 1, NULL, '2025-02-04 10:21:08', '2025-02-05 00:20:59'),
(48, 'HYRPYM3UQU', 'velit', '49', 'South Lesleyland', 1, 1, NULL, '2025-02-04 10:21:08', '2025-02-05 00:20:59'),
(49, 'KSVXVJG9PW', 'assumenda', '7', 'Emmettburgh', 1, 1, NULL, '2025-02-04 10:21:08', '2025-02-05 00:20:59'),
(50, '87RQH3IHYP', 'sint', '60', 'West Cynthiashire', 1, 1, NULL, '2025-02-04 10:21:08', '2025-02-05 00:20:59'),
(51, 'TR2VM1NSO3', 'labore', '92', 'Jaclynmouth', 1, 1, NULL, '2025-02-04 10:21:08', '2025-02-05 00:20:59'),
(52, '123452', 'Test1', '25142', 'Surat', 1, 1, NULL, '2025-02-04 23:03:00', '2025-02-05 00:20:59'),
(53, '256351', 'Test2', '254', 'Ahmedabad', 1, 1, NULL, '2025-02-04 23:03:00', '2025-02-05 00:20:59'),
(54, '452165', 'Test3', '52', 'Tapi', 1, 1, NULL, '2025-02-04 23:03:00', '2025-02-05 00:20:59'),
(55, '859652', 'Test4', '65', 'Ankleshvar', 1, 1, NULL, '2025-02-04 23:03:00', '2025-02-05 00:20:59'),
(56, '123452', 'Test1', '25142', 'Surat', 1, 1, NULL, '2025-02-04 23:03:33', '2025-02-05 00:20:59'),
(57, '256351', 'Test2', '254', 'Ahmedabad', 1, 1, NULL, '2025-02-04 23:03:33', '2025-02-05 00:20:59'),
(58, '452165', 'Test3', '52', 'Tapi', 1, 1, NULL, '2025-02-04 23:03:33', '2025-02-05 00:20:59'),
(59, '859652', 'Test4', '65', 'Ankleshvar', 1, 1, NULL, '2025-02-04 23:03:33', '2025-02-05 00:20:59'),
(60, '125352', 'Test1', '52', 'Surat', 1, 1, NULL, '2025-02-04 23:14:48', '2025-02-05 00:20:59'),
(61, 'test3', '2121', '1212', '12', 1, 1, NULL, '2025-02-04 23:15:37', '2025-02-05 00:20:59'),
(62, '7842212', '859654', '12', 'Surat', 1, 1, NULL, '2025-02-04 23:16:50', '2025-02-05 00:20:59'),
(63, 'ds1d12', 'dsd152', 'd121', '12d1s2', 2, 1, NULL, '2025-02-05 00:07:32', '2025-02-05 00:20:59'),
(64, 'X59WL7SLC9', 'quia', '28', 'Port Gennaro', 1, 1, '2025-02-05 05:58:07', '2025-02-05 00:28:07', '2025-02-05 00:28:07'),
(65, 'MPUK6GHCFI', 'ut', '67', 'Lake Jaidaport', 1, 0, '2025-02-05 05:58:07', '2025-02-05 00:28:07', '2025-02-05 00:28:07'),
(66, 'MFN6WPV2QI', 'sequi', '89', 'Dillonfort', 1, 0, '2025-02-05 05:58:07', '2025-02-05 00:28:07', '2025-02-05 00:28:07'),
(67, 'BALEFHLHVK', 'reiciendis', '71', 'Lillaberg', 1, 1, '2025-02-05 05:58:07', '2025-02-05 00:28:07', '2025-02-05 00:28:07'),
(68, 'MME9GHPOPD', 'aspernatur', '71', 'Lake Dayneshire', 1, 0, '2025-02-05 05:58:07', '2025-02-05 00:28:07', '2025-02-05 00:28:07'),
(69, '8MWJZKIJCJ', 'aliquam', '38', 'Heaneyhaven', 1, 1, '2025-02-05 05:58:07', '2025-02-05 00:28:07', '2025-02-05 00:28:07'),
(70, 'EEZXDZBCZK', 'qui', '23', 'West Aliciamouth', 1, 0, '2025-02-05 05:58:07', '2025-02-05 00:28:07', '2025-02-05 00:28:07'),
(71, 'FTHEQ87GQG', 'molestiae', '49', 'West Karlee', 1, 1, '2025-02-05 05:58:07', '2025-02-05 00:28:07', '2025-02-05 00:28:07'),
(72, '3MZWBRWX0O', 'eum', '30', 'West Soniaton', 1, 0, '2025-02-05 05:58:07', '2025-02-05 00:28:07', '2025-02-05 00:28:07'),
(73, 'PZG67BIGXE', 'sit', '24', 'Smithberg', 1, 0, '2025-02-05 05:58:07', '2025-02-05 00:28:07', '2025-02-05 00:28:07'),
(74, 'CIEE98CPHL', 'similique', '55', 'Mortimermouth', 1, 1, '2025-02-05 05:58:07', '2025-02-05 00:28:07', '2025-02-05 00:28:07'),
(75, 'NI3CUULQOJ', 'sequi', '95', 'Anahibury', 1, 1, '2025-02-05 05:58:07', '2025-02-05 00:28:07', '2025-02-05 00:28:07'),
(76, 'MG0MINWCAX', 'est', '63', 'Douglastown', 1, 1, '2025-02-05 05:58:07', '2025-02-05 00:28:07', '2025-02-05 00:28:07'),
(77, 'G2BXLK3KX0', 'ut', '65', 'Hammesbury', 1, 0, '2025-02-05 05:58:07', '2025-02-05 00:28:07', '2025-02-05 00:28:07'),
(78, 'R7JYE7RAEE', 'quae', '46', 'Hyattside', 1, 0, '2025-02-05 05:58:07', '2025-02-05 00:28:07', '2025-02-05 00:28:07'),
(79, 'BSZGWCVBAU', 'deserunt', '83', 'West Orphahaven', 1, 1, '2025-02-05 05:58:07', '2025-02-05 00:28:07', '2025-02-05 00:28:07'),
(80, 'YODDAH07EM', 'sapiente', '56', 'Guillermobury', 1, 1, '2025-02-05 05:58:07', '2025-02-05 00:28:07', '2025-02-05 00:28:07'),
(81, 'L6BUGF1IWN', 'delectus', '50', 'Port Danyka', 1, 0, '2025-02-05 05:58:07', '2025-02-05 00:28:07', '2025-02-05 00:28:07'),
(82, 'DLLW62HKGH', 'accusantium', '77', 'West Chrisborough', 1, 1, '2025-02-05 05:58:07', '2025-02-05 00:28:07', '2025-02-05 00:28:07'),
(83, '5JPQHWDTZE', 'earum', '24', 'New Arnetown', 1, 0, '2025-02-05 05:58:07', '2025-02-05 00:28:07', '2025-02-05 00:28:07'),
(84, 'J4AYRZKMXH', 'molestias', '92', 'Kaciburgh', 1, 0, '2025-02-05 05:58:07', '2025-02-05 00:28:07', '2025-02-05 00:28:07'),
(85, 'S95DYGO5RQ', 'sequi', '27', 'Kesslerhaven', 1, 1, '2025-02-05 05:58:07', '2025-02-05 00:28:07', '2025-02-05 00:28:07'),
(86, 'EPKLXHKUXU', 'magnam', '26', 'East Bernhard', 1, 0, '2025-02-05 05:58:07', '2025-02-05 00:28:07', '2025-02-05 00:28:07'),
(87, 'L1AF57LIEO', 'omnis', '51', 'South Angelicaburgh', 1, 0, '2025-02-05 05:58:07', '2025-02-05 00:28:07', '2025-02-05 00:28:07'),
(88, 'WFX72MLRIT', 'fugiat', '42', 'Lake Janessafort', 1, 0, '2025-02-05 05:58:07', '2025-02-05 00:28:07', '2025-02-05 00:28:07'),
(89, 'BHVWSPWTWV', 'et', '62', 'East Shayne', 1, 0, '2025-02-05 05:58:07', '2025-02-05 00:28:07', '2025-02-05 00:28:07'),
(90, 'VHWOQXNSWA', 'vitae', '81', 'Lake Demond', 1, 0, '2025-02-05 05:58:07', '2025-02-05 00:28:07', '2025-02-05 00:28:07'),
(91, 'LI62LQQL5Z', 'sapiente', '86', 'Lake Cleta', 1, 0, '2025-02-05 05:58:07', '2025-02-05 00:28:07', '2025-02-05 00:28:07'),
(92, 'JNU9ETZEYU', 'sequi', '9', 'Sipesmouth', 1, 0, '2025-02-05 05:58:07', '2025-02-05 00:28:07', '2025-02-05 00:28:07'),
(93, 'REWSTCVEDN', 'nostrum', '23', 'Ullrichview', 1, 0, '2025-02-05 05:58:07', '2025-02-05 00:28:07', '2025-02-05 00:28:07'),
(94, 'UB2130Y6RQ', 'non', '4', 'Jacobsfort', 1, 1, '2025-02-05 05:58:07', '2025-02-05 00:28:07', '2025-02-05 00:28:07'),
(95, 'DZHWWTX8QL', 'unde', '94', 'Deliashire', 1, 0, '2025-02-05 05:58:07', '2025-02-05 00:28:07', '2025-02-05 00:28:07'),
(96, '6HTNLWAJQ8', 'odit', '91', 'Mozelletown', 1, 0, '2025-02-05 05:58:07', '2025-02-05 00:28:07', '2025-02-05 00:28:07'),
(97, '9DC3CFCK4W', 'non', '53', 'Kuvalisview', 1, 0, '2025-02-05 05:58:07', '2025-02-05 00:28:07', '2025-02-05 00:28:07'),
(98, 'OMC1YPLLRI', 'voluptas', '89', 'New Jason', 1, 1, '2025-02-05 05:58:07', '2025-02-05 00:28:07', '2025-02-05 00:28:07'),
(99, 'YLFYQAS2TY', 'tempore', '66', 'Ebbachester', 1, 1, '2025-02-05 05:58:07', '2025-02-05 00:28:07', '2025-02-05 00:28:07'),
(100, 'XFDAEDFBP2', 'ipsum', '60', 'East Rosalia', 1, 1, '2025-02-05 05:58:07', '2025-02-05 00:28:07', '2025-02-05 00:28:07'),
(101, 'YTUNPQMU8G', 'ipsum', '68', 'East Meghan', 1, 1, '2025-02-05 05:58:07', '2025-02-05 00:28:07', '2025-02-05 00:28:07'),
(102, 'KBEFF4P1XX', 'qui', '20', 'South Kimberlyview', 1, 0, '2025-02-05 05:58:07', '2025-02-05 00:28:07', '2025-02-05 00:28:07'),
(103, 'SQLPJ1RA90', 'commodi', '5', 'Lake Rosalia', 1, 1, '2025-02-05 05:58:07', '2025-02-05 00:28:07', '2025-02-05 00:28:07'),
(104, '5N3I3JBNCX', 'ex', '68', 'North Kenny', 1, 1, '2025-02-05 05:58:07', '2025-02-05 00:28:07', '2025-02-05 00:28:07'),
(105, 'LMH0WP9RVN', 'aut', '4', 'Alisonmouth', 1, 0, '2025-02-05 05:58:07', '2025-02-05 00:28:07', '2025-02-05 00:28:07'),
(106, 'UBW9M9BLZI', 'sint', '42', 'North Elliottland', 1, 0, '2025-02-05 05:58:07', '2025-02-05 00:28:07', '2025-02-05 00:28:07'),
(107, 'WNYFZIYYPD', 'asperiores', '70', 'New Giovanni', 1, 0, '2025-02-05 05:58:07', '2025-02-05 00:28:07', '2025-02-05 00:28:07'),
(108, '13ZY2I15KK', 'ut', '22', 'Israelshire', 1, 0, '2025-02-05 05:58:07', '2025-02-05 00:28:07', '2025-02-05 00:28:07'),
(109, 'BXWOO3S2YU', 'repellat', '24', 'South Elroyhaven', 1, 1, '2025-02-05 05:58:07', '2025-02-05 00:28:07', '2025-02-05 00:28:07'),
(110, 'PPH748SIWE', 'ipsa', '45', 'Shaniehaven', 1, 0, '2025-02-05 05:58:07', '2025-02-05 00:28:07', '2025-02-05 00:28:07'),
(111, 'EVIKBIMVGI', 'omnis', '98', 'Naderfurt', 1, 1, '2025-02-05 05:58:07', '2025-02-05 00:28:07', '2025-02-05 00:28:07'),
(112, '5V8UYSWIAV', 'neque', '42', 'Angusburgh', 1, 0, '2025-02-05 05:58:07', '2025-02-05 00:28:07', '2025-02-05 00:28:07'),
(113, 'IOEN9KM3JL', 'nesciunt', '36', 'Gradyhaven', 1, 0, '2025-02-05 05:58:07', '2025-02-05 00:28:07', '2025-02-05 00:28:07'),
(114, '4s5s56', 'TEst-KP', '25', 'Surat', 2, 1, NULL, '2025-02-05 00:34:23', '2025-02-05 00:34:23');

-- --------------------------------------------------------

--
-- Table structure for table `stores`
--

CREATE TABLE `stores` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `mobile_number` varchar(20) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stores`
--

INSERT INTO `stores` (`id`, `name`, `email`, `mobile_number`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Adajan', 'adajan@gmail.com', '85258565852', 1, NULL, '2025-02-05 00:12:09'),
(2, 'Vesu', 'vesu@gmail.com', '85258565852', 1, NULL, '2025-02-05 00:12:09');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `dob` date NOT NULL,
  `city` varchar(30) NOT NULL,
  `state` varchar(50) NOT NULL,
  `address` text NOT NULL,
  `phone_no` varchar(15) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(100) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `dob`, `city`, `state`, `address`, `phone_no`, `username`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(11, 'Jinaam', '1963-04-03', 'Surat', 'Gujarat', 'dsd', '8956526385', 'admin@gmail.com', 'admin@gmail.com', NULL, '$2y$12$/DUui/3Des7t9UhLQnikgeFcsg/C8tdhrpp.UR1HezA2u8.Is.h72', NULL, '2024-08-17 12:04:18', '2024-08-27 11:29:19'),
(13, 'Unit Holder', '1964-06-03', 'Surat', 'Surat', 'dsds', '8956526385', 'admin@123', 'admin@gmail.comsss', NULL, '$2y$12$86eQQeLB.yzPtpK.XfwiFOw3Qz.vHz2hwYioNeOaNqIjfewvelfaK', NULL, '2024-08-20 00:54:16', '2024-08-20 00:54:16'),
(16, 'dsds', '1966-05-06', 'Surat', 'Surat', 'dsdsd', '8956526385', 'admin@123d', 'admin@gmail.in', NULL, '$2y$12$Os8baa6rEvW7AliFxNBehektNA4ArzF3NIc.s1FFS324Ar1MQFNdS', NULL, '2024-08-20 02:33:24', '2025-01-27 05:50:13'),
(17, 'Nilesh', '1960-03-02', 'Surat', 'gujarat', 'Surat', '9856256352', 'krunal_patel', 'krunal.mlzs@gmail.com', NULL, '$2y$12$RrX8QHV0487g4auhlu4lN.ubWU6wQbXPbU.Qozv5iKY.QP6eYNjje', NULL, '2024-08-20 02:42:14', '2024-08-20 02:43:22');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`),
  ADD UNIQUE KEY `admins_phone_no_unique` (`phone_no`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `stocks`
--
ALTER TABLE `stocks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stocks_store_id_foreign` (`store_id`);

--
-- Indexes for table `stores`
--
ALTER TABLE `stores`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `stocks`
--
ALTER TABLE `stocks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;

--
-- AUTO_INCREMENT for table `stores`
--
ALTER TABLE `stores`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `stocks`
--
ALTER TABLE `stocks`
  ADD CONSTRAINT `stocks_store_id_foreign` FOREIGN KEY (`store_id`) REFERENCES `stores` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
