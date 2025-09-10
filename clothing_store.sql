-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 11, 2025 at 12:35 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `clothing_store`
--

-- --------------------------------------------------------

--
-- Table structure for table `agences`
--

CREATE TABLE `agences` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL DEFAULT '1',
  `gps` varchar(255) NOT NULL DEFAULT '1',
  `commune_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category_product`
--

CREATE TABLE `category_product` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `communes`
--

CREATE TABLE `communes` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `is_deliverable` tinyint(1) NOT NULL DEFAULT 1,
  `has_stop_desk` tinyint(1) NOT NULL DEFAULT 1,
  `wilaya_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `firstName` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL DEFAULT '',
  `password` varchar(255) NOT NULL DEFAULT '',
  `phone_number` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer_target_sizes`
--

CREATE TABLE `customer_target_sizes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date_of_birth` date NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL
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
-- Table structure for table `measurement_types`
--

CREATE TABLE `measurement_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `part` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL
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
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_08_14_101336_create_personal_access_tokens_table', 1),
(5, '2025_08_14_103147_create_products_table', 1),
(6, '2025_08_14_104530_create_sizes_table', 1),
(7, '2025_08_14_104557_create_variants_table', 1),
(8, '2025_08_14_113200_create_measurement_types_table', 1),
(9, '2025_08_14_120554_create_product_measurement_table', 1),
(10, '2025_08_17_101515_create_product_images_table', 1),
(11, '2025_08_28_195216_create_categories_table', 1),
(12, '2025_08_28_201822_create_category_product_table', 1),
(13, '2025_08_30_152939_create_wilayas_table', 1),
(14, '2025_08_31_180143_create_communes_table', 1),
(15, '2025_08_31_215318_create_agences_table', 1),
(16, '2025_09_01_205233_create_shipping_prices_table', 1),
(17, '2025_09_03_181456_create_customers_table', 1),
(18, '2025_09_03_181515_create_customer_target_sizes_table', 1),
(19, '2025_09_03_181533_create_sales_table', 1),
(20, '2025_09_03_181653_create_sale_detailles_table', 1);

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
  `name` text NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `sex` char(255) NOT NULL,
  `preview_image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `sex`, `preview_image`, `created_at`, `updated_at`) VALUES
(11, 'Affnane', NULL, 4900.00, 'F', 'https://res.cloudinary.com/dpmow9eng/image/upload/v1757448520/a93d03c4-32cf-48ad-9233-c677f9012872_cxsgen.jpg', NULL, NULL),
(12, 'Anes', NULL, 5800.00, 'M', 'https://res.cloudinary.com/dpmow9eng/image/upload/v1757540843/Creativ1_fkdqjq_drufcq.webp', NULL, NULL),
(13, 'Lea', NULL, 4800.00, 'F', 'https://res.cloudinary.com/dpmow9eng/image/upload/v1757539336/2515907c-7bb9-43b2-b42b-4ffc29fde972_ge4t9u.jpg', NULL, NULL),
(14, 'Chahin', NULL, 5200.00, 'M', 'https://res.cloudinary.com/dpmow9eng/image/upload/v1757452350/eef5cbeb-e1c7-4278-a508-e2890798c2c2_carwp5.jpg', NULL, NULL),
(15, 'Zahra', NULL, 4300.00, 'F', 'https://res.cloudinary.com/dpmow9eng/image/upload/v1757542153/956f07d6-2dc8-442f-b139-0ca85429313a_n5d03x.jpg', NULL, NULL),
(16, 'Adem', NULL, 4000.00, 'M', 'https://res.cloudinary.com/dpmow9eng/image/upload/v1757541608/7a3917c6-0225-4257-a0f5-20e943ec76d5_jw0c0i.jpg', NULL, NULL),
(17, 'Iyad', NULL, 5600.00, 'M', 'https://res.cloudinary.com/dpmow9eng/image/upload/v1757540106/66100bba-0065-4b67-bbe0-09c0245220c8_gkpaae.jpg', NULL, NULL),
(18, 'Racim', NULL, 4400.00, 'M', 'https://res.cloudinary.com/dpmow9eng/image/upload/v1757542802/1000010143_r9jkjs.jpg', NULL, NULL),
(19, 'Imad', NULL, 3800.00, 'M', 'https://res.cloudinary.com/dpmow9eng/image/upload/v1757446687/ab79b2ca-50a7-41b4-9690-b1d4be3c5074_vzsrl1.jpg', NULL, NULL),
(20, 'Podest', NULL, 4800.00, 'M', 'https://res.cloudinary.com/dpmow9eng/image/upload/v1757537251/download_r76aqs.jpg', NULL, NULL),
(21, 'Sara', NULL, 5200.00, 'F', 'https://res.cloudinary.com/dpmow9eng/image/upload/v1757451619/44539d72-2ff7-45a9-94fd-bded69455823_sv5hqn.jpg', NULL, NULL),
(22, 'Malek', NULL, 5500.00, 'M', 'https://res.cloudinary.com/dpmow9eng/image/upload/v1757448448/9315328d-7674-494c-a435-e2b46916dd7a_xoiezp.jpg', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `image_url`, `product_id`) VALUES
(1, 'https://res.cloudinary.com/dpmow9eng/image/upload/v1757446687/d420af11-defc-4fbf-9462-65f548023f9c_uhizvm.jpg', 19),
(2, 'https://res.cloudinary.com/dpmow9eng/image/upload/v1757446687/57b5bb3d-6f31-442e-b818-b0a18a10ef7f_kodd6d.jpg', 19),
(3, 'https://res.cloudinary.com/dpmow9eng/image/upload/v1757446687/546104ef-9841-49ec-b06c-2dfd136ccbdc_i7v3xk.jpg', 19),
(4, 'https://res.cloudinary.com/dpmow9eng/image/upload/v1757448521/994ecc96-5e67-48f0-8710-4c3809592612_zpmhlj.jpg', 11),
(5, 'https://res.cloudinary.com/dpmow9eng/image/upload/v1757448521/c9b9bd9e-6acf-443c-8f93-e2eacc0ed121_n9q48j.jpg', 11),
(6, 'https://res.cloudinary.com/dpmow9eng/image/upload/v1757448521/538617169_1287606546390016_8514082764540144558_n_yetssn.jpg', 11),
(7, 'https://res.cloudinary.com/dpmow9eng/image/upload/v1757448448/15baea5f-37de-40e7-80a7-2b1345d06fed_mzayal.jpg', 22),
(8, 'https://res.cloudinary.com/dpmow9eng/image/upload/v1757448448/c6d0bc83-459f-4809-a080-593359c44634_xv0hld.jpg', 22),
(9, 'https://res.cloudinary.com/dpmow9eng/image/upload/v1757448449/cf776b1b-5720-488a-8241-3126bc3f9e44_m5dh21.jpg', 22),
(10, 'https://res.cloudinary.com/dpmow9eng/image/upload/v1757448449/6c5cf93d-222e-49f6-91c7-320f8396e148_b5cwph.jpg', 22),
(11, 'https://res.cloudinary.com/dpmow9eng/image/upload/v1757451618/91e86d4f-e1e9-4773-8a96-f385f64cf0dd_gizbhz.jpg', 21),
(12, 'https://res.cloudinary.com/dpmow9eng/image/upload/v1757451619/c1d2242c-daf2-4910-8280-d7a31813db5f_xky42d.jpg', 21),
(13, 'https://res.cloudinary.com/dpmow9eng/image/upload/v1757451618/297f1d3a-b301-43a6-a7aa-a11a15da5501_o72rsf.jpg', 21),
(14, 'https://res.cloudinary.com/dpmow9eng/image/upload/v1757451621/fdfbb532-457d-4a29-b7a6-7f3ddf1f3313_hmckf6.jpg', 21),
(15, 'https://res.cloudinary.com/dpmow9eng/image/upload/v1757451620/cda75b1a-9765-4676-98d1-154d984ca030_g161rm.jpg', 21),
(16, 'https://res.cloudinary.com/dpmow9eng/image/upload/v1757452350/89b601b6-5a98-458e-ae7c-f9077428b0e0_uypcms.jpg', 14),
(17, 'https://res.cloudinary.com/dpmow9eng/image/upload/v1757452347/a39b6844-1455-4a60-b1a4-8cf1d390a23d_ni5tp4.jpg', 14),
(18, 'https://res.cloudinary.com/dpmow9eng/image/upload/v1757452348/cb1f3394-78f3-4543-8139-9a6dea1a1fe2_rdode6.jpg', 14),
(19, 'https://res.cloudinary.com/dpmow9eng/image/upload/v1757452348/d86f1ac9-5bcc-4934-baa2-58dd1d7a7ba6_vzohih.jpg', 14),
(20, 'https://res.cloudinary.com/dpmow9eng/image/upload/v1757452347/536633384_1522536912238600_8876055921681244459_n_ullvff.jpg', 14),
(21, 'https://res.cloudinary.com/dpmow9eng/image/upload/v1757452346/539898235_808577288170642_7455580805696015718_n_mszjkz.jpg', 14),
(37, 'https://res.cloudinary.com/dpmow9eng/image/upload/v1757537230/download_kx9dta.jpg', 20),
(38, 'https://res.cloudinary.com/dpmow9eng/image/upload/v1757537230/d2f44159-4d5e-42a4-afdf-ee567172e59e_zqnkq3.jpg', 20),
(39, 'https://res.cloudinary.com/dpmow9eng/image/upload/v1757537230/81bf4807-ff9c-4ebc-b63d-386941537515_dxvhd0.jpg', 20),
(40, 'https://res.cloudinary.com/dpmow9eng/image/upload/v1757539335/cc2b879d-4c8e-4b02-9909-344fe8dc8b61_bifuyp.jpg', 20),
(44, 'https://res.cloudinary.com/dpmow9eng/image/upload/v1757539335/cc2b879d-4c8e-4b02-9909-344fe8dc8b61_bifuyp.jpg', 13),
(45, 'https://res.cloudinary.com/dpmow9eng/image/upload/v1757539335/1000010023_cfg2s3.jpg', 13),
(46, 'https://res.cloudinary.com/dpmow9eng/image/upload/v1757539361/1000010019_ww0gj3.jpg', 13),
(47, 'https://res.cloudinary.com/dpmow9eng/image/upload/v1757539335/0d474f5a-17e1-4d11-90a8-d8c84b941c1f_o1ps9b.jpg', 13),
(48, 'https://res.cloudinary.com/dpmow9eng/image/upload/v1757540106/cd5f5dfd-2b03-421f-8242-b0a567efba49_uubhkb.jpg', 17),
(49, 'https://res.cloudinary.com/dpmow9eng/image/upload/v1757540107/021c93e2-b903-4427-a381-dc156d564a0a_ddr0jx.jpg', 17),
(50, 'https://res.cloudinary.com/dpmow9eng/image/upload/v1757540107/03770a22-3fbf-45fb-a049-58852eff285b_rakbvx.jpg', 17),
(51, 'https://res.cloudinary.com/dpmow9eng/image/upload/v1757540840/117b9b3b-ae37-4236-a1f6-ea1c9e31b420_yvbdns.jpg', 12),
(52, 'https://res.cloudinary.com/dpmow9eng/image/upload/v1757540844/1a2a7f5b-80de-4aa4-939a-d53c02ec7e37_nismbo.jpg', 12),
(53, 'https://res.cloudinary.com/dpmow9eng/image/upload/v1757540840/35ab52f6-30af-4c5d-8466-d6f0f39b9db8_pbbujc.jpg', 12),
(54, 'https://res.cloudinary.com/dpmow9eng/image/upload/v1757540842/be3ef529-bfa0-4fc2-a9c1-d94013db6485_xpuhjc.jpg', 12),
(55, 'https://res.cloudinary.com/dpmow9eng/image/upload/v1757540841/ad16c675-8035-4dd1-9ffd-fcbcd3646429_v4ohru.jpg', 12),
(56, 'https://res.cloudinary.com/dpmow9eng/image/upload/v1757540839/5bc30ce7-b9cf-45db-80da-3c84fee22b06_jjukfy.jpg', 12),
(57, 'https://res.cloudinary.com/dpmow9eng/image/upload/v1757541609/eac5d2a5-454d-4f89-95a9-c8f1414189bd_iq4g6y.jpg', 16),
(58, 'https://res.cloudinary.com/dpmow9eng/image/upload/v1757541607/540003150_1311719083681490_6341225223022705954_n_bhzwu1.jpg', 16),
(59, 'https://res.cloudinary.com/dpmow9eng/image/upload/v1757542266/a1ac6a5d-cd19-4e64-b656-329f1e8e3d04_x1luvo.jpg', 19),
(60, 'https://res.cloudinary.com/dpmow9eng/image/upload/v1757542803/1000010146_pq4dr1.jpg', 18);

-- --------------------------------------------------------

--
-- Table structure for table `product_measurement`
--

CREATE TABLE `product_measurement` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `measurement_type_id` bigint(20) UNSIGNED NOT NULL,
  `size_id` bigint(20) UNSIGNED NOT NULL,
  `value` varchar(255) NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `shipping_label` varchar(255) NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sale_detailles`
--

CREATE TABLE `sale_detailles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `variant_id` bigint(20) UNSIGNED NOT NULL,
  `selling_price` decimal(8,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `sale_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
('sdd2TJa3T9CpKTuXPkVIGcxWeBMrzivPdu6Z6uSs', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ3dDNmRXNmt6ZEV4MHBRczJIb0Z5NDJ1ejNRUURkazBFVUdUcVkxZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1757447431);

-- --------------------------------------------------------

--
-- Table structure for table `shipping_prices`
--

CREATE TABLE `shipping_prices` (
  `id` varchar(255) NOT NULL,
  `minStopDeskTarif` varchar(255) NOT NULL,
  `maxStopDeskTarif` varchar(255) NOT NULL,
  `minHomeTarif` varchar(255) NOT NULL,
  `maxHomeTarif` varchar(255) NOT NULL,
  `defrence` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sizes`
--

CREATE TABLE `sizes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `size` varchar(255) NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sizes`
--

INSERT INTO `sizes` (`id`, `size`, `product_id`) VALUES
(1, '1-2', 19),
(2, '2-3', 19),
(3, '3-4', 19),
(4, '4-5', 19),
(5, '5-6', 19),
(6, '1-2', 11),
(7, '2-3', 11),
(8, '3-4', 11),
(9, '4-5', 11),
(10, '5-6', 11),
(11, '1-2', 22),
(12, '2-3', 22),
(13, '3-4', 22),
(14, '4-5', 22),
(15, '5-6', 22),
(16, '1-2', 21),
(17, '2-3', 21),
(18, '3-4', 21),
(19, '4-5', 21),
(20, '5-6', 21),
(21, '1-2', 14),
(22, '2-3', 14),
(23, '3-4', 14),
(24, '4-5', 14),
(25, '5-6', 14),
(35, '1-2', 20),
(36, '2-3', 20),
(37, '3-4', 20),
(38, '4-5', 20),
(39, '5-6', 20),
(45, '1-2', 13),
(46, '2-3', 13),
(47, '3-4', 13),
(48, '4-5', 13),
(49, '5-6', 13),
(50, '1-2', 17),
(51, '2-3', 17),
(52, '3-4', 17),
(53, '4-5', 17),
(54, '5-6', 17),
(55, '1-2', 12),
(56, '2-3', 12),
(57, '3-4', 12),
(58, '4-5', 12),
(59, '5-6', 12),
(60, '1-2', 16),
(61, '2-3', 16),
(62, '3-4', 16),
(63, '4-5', 16),
(64, '5-6', 16),
(65, '1-2', 15),
(66, '2-3', 15),
(67, '3-4', 15),
(68, '4-5', 15),
(69, '5-6', 15),
(70, '1-2', 18),
(71, '2-3', 18),
(72, '3-4', 18),
(73, '4-5', 18),
(74, '5-6', 18);

-- --------------------------------------------------------

--
-- Table structure for table `temp_table`
--

CREATE TABLE `temp_table` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `preview_image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `temp_table`
--

INSERT INTO `temp_table` (`id`, `name`, `price`, `sex`, `preview_image`) VALUES
(1, 'Eline', '4400.00', 'F', NULL),
(2, 'Dream', '4400.00', 'F', NULL),
(3, 'Sabrina', '5800.00', 'F', NULL),
(4, 'LoB', '4400.00', 'U', NULL),
(5, 'Werda', '5800.00', 'F', NULL),
(6, 'Hiphop', '5400.00', 'M', NULL),
(7, 'Lee rose', '5800.00', 'U', NULL),
(8, 'Rayane', '5800.00', 'U', NULL),
(9, 'Anias', '5800.00', 'F', NULL),
(10, 'Meriem', '5400.00', 'F', NULL),
(11, 'Affnane', '4900.00', 'F', 'https://res.cloudinary.com/dpmow9eng/image/upload/v1757448520/a93d03c4-32cf-48ad-9233-c677f9012872_cxsgen.jpg'),
(12, 'Anes', '5800.00', 'M', 'https://res.cloudinary.com/dpmow9eng/image/upload/v1757540843/Creativ1_fkdqjq_drufcq.webp'),
(13, 'Lea', '4800.00', 'F', 'https://res.cloudinary.com/dpmow9eng/image/upload/v1757539336/2515907c-7bb9-43b2-b42b-4ffc29fde972_ge4t9u.jpg'),
(14, 'Chahin', '5200.00', 'M', 'https://res.cloudinary.com/dpmow9eng/image/upload/v1757452350/eef5cbeb-e1c7-4278-a508-e2890798c2c2_carwp5.jpg'),
(15, 'Zahra', '4300.00', 'F', 'https://res.cloudinary.com/dpmow9eng/image/upload/v1757542153/956f07d6-2dc8-442f-b139-0ca85429313a_n5d03x.jpg'),
(16, 'Adem', '4000.00', 'M', 'https://res.cloudinary.com/dpmow9eng/image/upload/v1757541608/7a3917c6-0225-4257-a0f5-20e943ec76d5_jw0c0i.jpg'),
(17, 'Iyad', '5600.00', 'M', 'https://res.cloudinary.com/dpmow9eng/image/upload/v1757540106/66100bba-0065-4b67-bbe0-09c0245220c8_gkpaae.jpg'),
(18, 'Racim', '4400.00', 'M', 'https://res.cloudinary.com/dpmow9eng/image/upload/v1757542802/1000010143_r9jkjs.jpg'),
(19, 'Imad', '3800.00', 'M', 'https://res.cloudinary.com/dpmow9eng/image/upload/v1757446687/ab79b2ca-50a7-41b4-9690-b1d4be3c5074_vzsrl1.jpg'),
(20, 'Podest', '4800.00', 'M', 'https://res.cloudinary.com/dpmow9eng/image/upload/v1757537251/download_r76aqs.jpg'),
(21, 'Sara', '5200.00', 'F', 'https://res.cloudinary.com/dpmow9eng/image/upload/v1757451619/44539d72-2ff7-45a9-94fd-bded69455823_sv5hqn.jpg'),
(22, 'Malek', '5500.00', 'M', 'https://res.cloudinary.com/dpmow9eng/image/upload/v1757448448/9315328d-7674-494c-a435-e2b46916dd7a_xoiezp.jpg'),
(23, 'Sta', '5800.00', 'F', NULL);

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
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `variants`
--

CREATE TABLE `variants` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `color` varchar(255) NOT NULL,
  `size_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 0,
  `product_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `variants`
--

INSERT INTO `variants` (`id`, `color`, `size_id`, `quantity`, `product_id`) VALUES
(1, 'Marron', 1, 1, 19),
(2, 'Marron', 2, 1, 19),
(3, 'Marron', 3, 1, 19),
(4, 'Marron', 4, 1, 19),
(5, 'Marron', 5, 1, 19),
(6, 'Mauve', 6, 1, 11),
(7, 'Mauve', 7, 1, 11),
(8, 'Mauve', 8, 1, 11),
(9, 'Mauve', 9, 1, 11),
(10, 'Mauve', 10, 1, 11),
(11, 'Bleu', 11, 1, 22),
(12, 'Bleu', 12, 1, 22),
(13, 'Bleu', 13, 1, 22),
(14, 'Bleu', 14, 1, 22),
(15, 'Bleu', 15, 1, 22),
(16, 'Gris', 11, 1, 22),
(17, 'Gris', 12, 1, 22),
(18, 'Gris', 13, 1, 22),
(19, 'Gris', 14, 1, 22),
(20, 'Gris', 15, 1, 22),
(21, 'Marron', 16, 1, 21),
(22, 'Marron', 17, 1, 21),
(23, 'Marron', 18, 1, 21),
(24, 'Marron', 19, 1, 21),
(25, 'Marron', 20, 1, 21),
(26, 'Bleu', 21, 1, 14),
(27, 'Bleu', 22, 1, 14),
(28, 'Bleu', 23, 1, 14),
(29, 'Bleu', 24, 1, 14),
(30, 'Bleu', 25, 1, 14),
(31, 'Blanc', 21, 1, 14),
(32, 'Blanc', 22, 1, 14),
(33, 'Blanc', 23, 1, 14),
(34, 'Blanc', 24, 1, 14),
(35, 'Blanc', 25, 1, 14),
(42, 'Marron', 35, 1, 20),
(43, 'Marron', 36, 1, 20),
(44, 'Marron', 37, 1, 20),
(45, 'Marron', 38, 1, 20),
(46, 'Marron', 39, 1, 20),
(47, 'Vert', 35, 1, 20),
(48, 'Vert', 36, 1, 20),
(49, 'Vert', 37, 1, 20),
(50, 'Vert', 38, 1, 20),
(51, 'Vert', 39, 1, 20),
(72, 'Rose-Blanc', 45, 1, 13),
(73, 'Rose-Blanc', 46, 1, 13),
(74, 'Rose-Blanc', 47, 1, 13),
(75, 'Rose-Blanc', 48, 1, 13),
(76, 'Rose-Blanc', 49, 1, 13),
(77, 'Blanc-Move', 45, 1, 13),
(78, 'Blanc-Move', 46, 1, 13),
(79, 'Blanc-Move', 47, 1, 13),
(80, 'Blanc-Move', 48, 1, 13),
(81, 'Blanc-Move', 49, 1, 13),
(82, 'Vert', 50, 1, 17),
(83, 'Vert', 51, 1, 17),
(84, 'Vert', 52, 1, 17),
(85, 'Vert', 53, 1, 17),
(86, 'Vert', 54, 1, 17),
(87, 'Vert', 55, 1, 12),
(88, 'Vert', 56, 1, 12),
(89, 'Vert', 57, 1, 12),
(90, 'Vert', 58, 1, 12),
(91, 'Vert', 59, 1, 12),
(92, 'Bleu', 55, 1, 12),
(93, 'Bleu', 56, 1, 12),
(94, 'Bleu', 57, 1, 12),
(95, 'Bleu', 58, 1, 12),
(96, 'Bleu', 59, 1, 12),
(97, 'Blanc', 60, 1, 16),
(98, 'Blanc', 61, 1, 16),
(99, 'Blanc', 62, 1, 16),
(100, 'Blanc', 63, 1, 16),
(101, 'Blanc', 64, 1, 16),
(102, 'Marron', 65, 1, 15),
(103, 'Marron', 66, 1, 15),
(104, 'Marron', 67, 1, 15),
(105, 'Marron', 68, 1, 15),
(106, 'Marron', 69, 1, 15),
(107, 'Beige', 70, 1, 18),
(108, 'Beige', 71, 1, 18),
(109, 'Beige', 72, 1, 18),
(110, 'Beige', 73, 1, 18),
(111, 'Beige', 74, 1, 18);

-- --------------------------------------------------------

--
-- Table structure for table `wilayas`
--

CREATE TABLE `wilayas` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `stopDeskTarif` int(11) NOT NULL DEFAULT 0,
  `homeTarif` int(11) NOT NULL DEFAULT 0,
  `is_deliverable` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agences`
--
ALTER TABLE `agences`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_product`
--
ALTER TABLE `category_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_product_product_id_foreign` (`product_id`),
  ADD KEY `category_product_category_id_foreign` (`category_id`);

--
-- Indexes for table `communes`
--
ALTER TABLE `communes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_target_sizes`
--
ALTER TABLE `customer_target_sizes`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `measurement_types`
--
ALTER TABLE `measurement_types`
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
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  ADD KEY `personal_access_tokens_expires_at_index` (`expires_at`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_images_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_measurement`
--
ALTER TABLE `product_measurement`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_measurement_measurement_type_id_foreign` (`measurement_type_id`),
  ADD KEY `product_measurement_size_id_foreign` (`size_id`),
  ADD KEY `product_measurement_product_id_foreign` (`product_id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sale_detailles`
--
ALTER TABLE `sale_detailles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sale_detailles_sale_id_foreign` (`sale_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `shipping_prices`
--
ALTER TABLE `shipping_prices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sizes`
--
ALTER TABLE `sizes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sizes_product_id_foreign` (`product_id`);

--
-- Indexes for table `temp_table`
--
ALTER TABLE `temp_table`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `variants`
--
ALTER TABLE `variants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variants_size_id_foreign` (`size_id`),
  ADD KEY `variants_product_id_foreign` (`product_id`);

--
-- Indexes for table `wilayas`
--
ALTER TABLE `wilayas`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `category_product`
--
ALTER TABLE `category_product`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer_target_sizes`
--
ALTER TABLE `customer_target_sizes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

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
-- AUTO_INCREMENT for table `measurement_types`
--
ALTER TABLE `measurement_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `product_measurement`
--
ALTER TABLE `product_measurement`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sale_detailles`
--
ALTER TABLE `sale_detailles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sizes`
--
ALTER TABLE `sizes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT for table `temp_table`
--
ALTER TABLE `temp_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `variants`
--
ALTER TABLE `variants`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `category_product`
--
ALTER TABLE `category_product`
  ADD CONSTRAINT `category_product_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `category_product_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `product_images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_measurement`
--
ALTER TABLE `product_measurement`
  ADD CONSTRAINT `product_measurement_measurement_type_id_foreign` FOREIGN KEY (`measurement_type_id`) REFERENCES `measurement_types` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_measurement_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_measurement_size_id_foreign` FOREIGN KEY (`size_id`) REFERENCES `sizes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sale_detailles`
--
ALTER TABLE `sale_detailles`
  ADD CONSTRAINT `sale_detailles_sale_id_foreign` FOREIGN KEY (`sale_id`) REFERENCES `sales` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sizes`
--
ALTER TABLE `sizes`
  ADD CONSTRAINT `sizes_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `variants`
--
ALTER TABLE `variants`
  ADD CONSTRAINT `variants_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `variants_size_id_foreign` FOREIGN KEY (`size_id`) REFERENCES `sizes` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
