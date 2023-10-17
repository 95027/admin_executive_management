-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 17, 2023 at 03:06 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `aem`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category`, `created_at`, `updated_at`) VALUES
(1, 'Hot', '2023-10-17 02:28:09', '2023-10-17 02:28:09'),
(2, 'Warm', '2023-10-17 03:08:56', '2023-10-17 03:08:56'),
(3, 'Cold', '2023-10-17 03:09:32', '2023-10-17 03:09:32');

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
-- Table structure for table `leads`
--

CREATE TABLE `leads` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `remarks` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `userid` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `leads`
--

INSERT INTO `leads` (`id`, `name`, `email`, `phone`, `category`, `remarks`, `created_at`, `updated_at`, `userid`, `status`) VALUES
(1, 'santhosh', 'kumarchembeti26@gmail.com', '9502734186', 'Hot', 'nothing', '2023-10-17 03:47:20', '2023-10-17 05:25:35', '2', 'active'),
(2, 'shiva', 'admin@gmail.com', '950273418', 'Cold', 'no', '2023-10-17 04:09:42', '2023-10-17 05:16:44', '2', 'active'),
(3, 'admin', 'user1@gmail.com', '95027341', 'Cold', 'no', '2023-10-17 04:10:34', '2023-10-17 04:10:34', '1', 'active'),
(6, 'shankar', 'kumarchembeti1998@gmail.com', '9502734182', 'Warm', 'dqw', '2023-10-17 05:17:16', '2023-10-17 05:17:16', '2', 'active'),
(7, 'executive2', 'executive2@gmail.com', '435345432', 'Cold', 'essay', '2023-10-17 05:19:01', '2023-10-17 06:04:18', '4', 'active'),
(8, 'mani', 'mani@gmail.com', '4353466256', 'Hot', 'not', '2023-10-17 05:19:30', '2023-10-17 06:15:33', '4', 'active'),
(9, 'executive1', 'user133@gmail.com', '5254624646', 'Warm', 'so', '2023-10-17 05:20:09', '2023-10-17 06:06:58', '3', 'active'),
(10, 'shabin', 'user1@gmail.com', '344354323', 'Hot', 'r34r', '2023-10-17 05:20:32', '2023-10-17 06:48:59', '3', 'not active'),
(11, 'admin', 'user1@gmail.com', '950273418', 'Cold', 'saS', '2023-10-17 06:35:48', '2023-10-17 06:35:56', '2', 'active'),
(12, 'admin', 'user1@gmail.com', '950273418', 'Warm', 'SDASD', '2023-10-17 06:41:58', '2023-10-17 06:41:58', '2', 'active'),
(13, 'admin', 'user1@gmail.com', '950273418', 'Hot', 'bkjlbj', '2023-10-17 06:42:15', '2023-10-17 07:08:14', '2', 'active'),
(14, 'hello', 'user1@gmail.com', '950273418', 'Warm', 'as', '2023-10-17 06:42:54', '2023-10-17 07:20:55', '2', 'not active');

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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_10_17_072640_create_leads_table', 2),
(6, '2023_10_17_074351_create_categories_table', 3),
(7, '2023_10_17_093222_alter_leads_table', 4),
(8, '2023_10_17_110151_alter_leads_table', 5);

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

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `usertype` varchar(255) NOT NULL DEFAULT 'executive',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `usertype`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'executive', 'executive@gmail.com', NULL, '$2y$10$8VZg94MhQiv1LZOxjMjDDOvi9.mmIy258Q2VVxPQyDQ.Wtt4.zQS2', 'executive', NULL, '2023-10-17 01:22:20', '2023-10-17 01:22:20'),
(2, 'admin', 'admin@gmail.com', NULL, '$2y$10$XRQW59/o5FQBSJ3WIHtBu.mvMJod/Kr/FMVYpt1xWsLCcWYsIkpN6', 'admin', NULL, '2023-10-17 01:35:37', '2023-10-17 01:35:37'),
(3, 'executive1', 'executive1@gmail.com', NULL, '$2y$10$IYiohmIKnusvqJm1La/VXuxrXD4d1CYdB4bD5IfcVuxpqBrSXqdtG', 'executive', NULL, '2023-10-17 03:56:42', '2023-10-17 03:56:42'),
(4, 'executive2', 'executive2@gmail.com', NULL, '$2y$10$d3YSBjNGwRs68SNg.SodT.2fkVHM/oWx5Bgpp.cafEeSwbmtD8/iW', 'executive', NULL, '2023-10-17 04:25:59', '2023-10-17 04:25:59');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `leads`
--
ALTER TABLE `leads`
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
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `leads`
--
ALTER TABLE `leads`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
