-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 11, 2025 at 01:12 PM
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
(22, 'Malek', NULL, 5500.00, 'M', 'https://res.cloudinary.com/dpmow9eng/image/upload/v1757448448/9315328d-7674-494c-a435-e2b46916dd7a_xoiezp.jpg', NULL, NULL),
(24, 'Eline', NULL, 4400.00, 'F', 'https://res.cloudinary.com/dpmow9eng/image/upload/v1757587290/540626152_752410570734565_104250468323788192_n_patnns.jpg', NULL, NULL),
(25, 'Dream', NULL, 4400.00, 'F', 'https://res.cloudinary.com/dpmow9eng/image/upload/v1757587530/539284803_122105627042990052_3798334608979933827_n_ervkcz.jpg', NULL, NULL),
(26, 'Sabrina', NULL, 5800.00, 'F', 'https://res.cloudinary.com/dpmow9eng/image/upload/v1757587691/539586338_122105627306990052_6126068052166348555_n_daxiv0.jpg', NULL, NULL),
(27, 'LoB', NULL, 4400.00, 'U', 'https://res.cloudinary.com/dpmow9eng/image/upload/v1757587858/540960399_733281659699691_110313565692672285_n_n2nopo.jpg', NULL, NULL),
(28, 'Werda', NULL, 5800.00, 'F', 'https://res.cloudinary.com/dpmow9eng/image/upload/v1757585616/1_b9lemg.jpg', NULL, NULL),
(29, 'Hiphop', NULL, 5400.00, 'M', 'https://res.cloudinary.com/dpmow9eng/image/upload/v1757587942/de27b3f3-67d8-4940-a085-a46e17aada79_rdmu4n.jpg', NULL, NULL),
(30, 'Lee rose', NULL, 5800.00, 'U', 'https://res.cloudinary.com/dpmow9eng/image/upload/v1757588214/537049920_1096388082094454_7138684394785157816_n_gdowur.jpg', NULL, NULL),
(31, 'Rayane', NULL, 5800.00, 'U', 'https://res.cloudinary.com/dpmow9eng/image/upload/v1757588362/540474686_122105626940990052_2166092508004331718_n_hqxjlr.jpg', NULL, NULL),
(32, 'Anias', NULL, 5800.00, 'F', 'https://res.cloudinary.com/dpmow9eng/image/upload/v1757588717/8b502e37-449a-46e7-975b-3cd9e12b7b39_xbjso8.jpg', NULL, NULL),
(33, 'Meriem', NULL, 5400.00, 'F', 'https://res.cloudinary.com/dpmow9eng/image/upload/v1757586877/f4b8bc4f-c27f-4ca5-8679-22d4a3325dc3_sb6mzr.jpg', NULL, NULL),
(34, 'Sta', NULL, 5800.00, 'F', 'https://res.cloudinary.com/dpmow9eng/image/upload/v1757588806/7fd022ac-ae0a-400c-b7a0-728c83bfc5bb_q3ebgt.jpg', NULL, NULL);

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
(60, 'https://res.cloudinary.com/dpmow9eng/image/upload/v1757542803/1000010146_pq4dr1.jpg', 18),
(61, 'https://res.cloudinary.com/dpmow9eng/image/upload/v1757584881/14ba5e1e-ea80-40ba-b70b-da8b4a1385c1_y47clk.jpg', 18),
(63, 'https://res.cloudinary.com/dpmow9eng/image/upload/v1757585299/541615393_1310578730708908_7528865646795856426_n_tsutqs.jpg', 28),
(64, 'https://res.cloudinary.com/dpmow9eng/image/upload/v1757587289/540579884_24533786012926921_1810634633863646449_n_hppi5h.jpg', 24),
(65, 'https://res.cloudinary.com/dpmow9eng/image/upload/v1757587286/540094015_662322016912376_5719907579624128300_n_wxsmpm.jpg', 24),
(66, 'https://res.cloudinary.com/dpmow9eng/image/upload/v1757588212/541656826_2178153406002856_6422103395469501148_n_vh4w4d.jpg', 30),
(67, 'https://res.cloudinary.com/dpmow9eng/image/upload/v1757588211/541039554_2848600852196851_7890263054864876422_n_zpcbs4.jpg', 30),
(68, 'https://res.cloudinary.com/dpmow9eng/image/upload/v1757588718/541056553_641487675691886_2731846566878630149_n_ankcyq.jpg', 32);

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
(74, '5-6', 18),
(75, '6-7', 28),
(76, '8-9', 28),
(77, '10-11', 28),
(78, '12-13', 28),
(79, '14-15', 28),
(80, '6-7', 33),
(81, '8-9', 33),
(82, '10-11', 33),
(83, '12-13', 33),
(84, '14-15', 33),
(85, '6-7', 24),
(86, '8-9', 24),
(87, '10-11', 24),
(88, '12-13', 24),
(89, '14-15', 24),
(90, '6-7', 25),
(91, '8-9', 25),
(92, '10-11', 25),
(93, '12-13', 25),
(94, '14-15', 25),
(95, '6-7', 26),
(96, '8-9', 26),
(97, '10-11', 26),
(98, '12-13', 26),
(99, '14-15', 26),
(100, '6-7', 27),
(101, '8-9', 27),
(102, '10-11', 27),
(103, '12-13', 27),
(104, '14-15', 27),
(105, '6-7', 29),
(106, '8-9', 29),
(107, '10-11', 29),
(108, '12-13', 29),
(109, '14-15', 29),
(110, '6-7', 30),
(111, '8-9', 30),
(112, '10-11', 30),
(113, '12-13', 30),
(114, '14-15', 30),
(115, '6-7', 31),
(116, '8-9', 31),
(117, '10-11', 31),
(118, '12-13', 31),
(119, '14-15', 31),
(120, '6-7', 32),
(121, '8-9', 32),
(122, '10-11', 32),
(123, '12-13', 32),
(124, '14-15', 32),
(130, '6-7', 34),
(131, '8-9', 34),
(132, '10-11', 34),
(133, '12-13', 34),
(134, '14-15', 34);

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
(87, 'Vert', 55, 2, 12),
(88, 'Vert', 56, 2, 12),
(89, 'Vert', 57, 2, 12),
(90, 'Vert', 58, 2, 12),
(91, 'Vert', 59, 2, 12),
(92, 'Bleu', 55, 2, 12),
(93, 'Bleu', 56, 2, 12),
(94, 'Bleu', 57, 2, 12),
(95, 'Bleu', 58, 2, 12),
(96, 'Bleu', 59, 2, 12),
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
(111, 'Beige', 74, 1, 18),
(112, 'Rose', 75, 1, 28),
(113, 'Rose', 76, 1, 28),
(114, 'Rose', 77, 1, 28),
(115, 'Rose', 78, 1, 28),
(116, 'Rose', 79, 1, 28),
(117, 'Bleu', 75, 1, 28),
(118, 'Bleu', 76, 1, 28),
(119, 'Bleu', 77, 1, 28),
(120, 'Bleu', 78, 1, 28),
(121, 'Bleu', 79, 1, 28),
(122, 'Beige', 75, 1, 28),
(123, 'Beige', 76, 1, 28),
(124, 'Beige', 77, 1, 28),
(125, 'Beige', 78, 1, 28),
(126, 'Beige', 79, 1, 28),
(127, 'Motard', 80, 1, 33),
(128, 'Motard', 81, 1, 33),
(129, 'Motard', 82, 1, 33),
(130, 'Motard', 83, 1, 33),
(131, 'Motard', 84, 1, 33),
(132, 'Vert', 85, 1, 24),
(133, 'Vert', 86, 1, 24),
(134, 'Vert', 87, 1, 24),
(135, 'Vert', 88, 1, 24),
(136, 'Vert', 89, 1, 24),
(137, 'Noir', 85, 1, 24),
(138, 'Noir', 86, 1, 24),
(139, 'Noir', 87, 1, 24),
(140, 'Noir', 88, 1, 24),
(141, 'Noir', 89, 1, 24),
(142, 'Motard', 85, 1, 24),
(143, 'Motard', 86, 1, 24),
(144, 'Motard', 87, 1, 24),
(145, 'Motard', 88, 1, 24),
(146, 'Motard', 89, 1, 24),
(147, 'Vert', 90, 1, 25),
(148, 'Vert', 91, 1, 25),
(149, 'Vert', 92, 1, 25),
(150, 'Vert', 93, 1, 25),
(151, 'Vert', 94, 1, 25),
(152, 'Noir', 90, 1, 25),
(153, 'Noir', 91, 1, 25),
(154, 'Noir', 92, 1, 25),
(155, 'Noir', 93, 1, 25),
(156, 'Noir', 94, 1, 25),
(157, 'Beige', 90, 1, 25),
(158, 'Beige', 91, 1, 25),
(159, 'Beige', 92, 1, 25),
(160, 'Beige', 93, 1, 25),
(161, 'Beige', 94, 1, 25),
(162, 'Rose', 95, 2, 26),
(163, 'Rose', 96, 2, 26),
(164, 'Rose', 97, 2, 26),
(165, 'Rose', 98, 2, 26),
(166, 'Rose', 99, 2, 26),
(167, 'Motard', 95, 1, 26),
(168, 'Motard', 96, 1, 26),
(169, 'Motard', 97, 1, 26),
(170, 'Motard', 98, 1, 26),
(171, 'Motard', 99, 1, 26),
(172, 'Vert', 100, 1, 27),
(173, 'Vert', 101, 1, 27),
(174, 'Vert', 102, 1, 27),
(175, 'Vert', 103, 1, 27),
(176, 'Vert', 104, 1, 27),
(177, 'Noir', 100, 1, 27),
(178, 'Noir', 101, 1, 27),
(179, 'Noir', 102, 1, 27),
(180, 'Noir', 103, 1, 27),
(181, 'Noir', 104, 1, 27),
(182, 'Vert', 105, 1, 29),
(183, 'Vert', 106, 1, 29),
(184, 'Vert', 107, 1, 29),
(185, 'Vert', 108, 1, 29),
(186, 'Vert', 109, 1, 29),
(187, 'Noir', 105, 1, 29),
(188, 'Noir', 106, 1, 29),
(189, 'Noir', 107, 1, 29),
(190, 'Noir', 108, 1, 29),
(191, 'Noir', 109, 1, 29),
(192, 'Marron', 105, 1, 29),
(193, 'Marron', 106, 1, 29),
(194, 'Marron', 107, 1, 29),
(195, 'Marron', 108, 1, 29),
(196, 'Marron', 109, 1, 29),
(197, 'Beige', 105, 1, 29),
(198, 'Beige', 106, 1, 29),
(199, 'Beige', 107, 1, 29),
(200, 'Beige', 108, 1, 29),
(201, 'Beige', 109, 1, 29),
(202, 'Motard', 110, 1, 30),
(203, 'Motard', 111, 1, 30),
(204, 'Motard', 112, 1, 30),
(205, 'Motard', 113, 1, 30),
(206, 'Motard', 114, 1, 30),
(207, 'Noir', 110, 1, 30),
(208, 'Noir', 111, 1, 30),
(209, 'Noir', 112, 1, 30),
(210, 'Noir', 113, 1, 30),
(211, 'Noir', 114, 1, 30),
(212, 'Marron', 110, 1, 30),
(213, 'Marron', 111, 1, 30),
(214, 'Marron', 112, 1, 30),
(215, 'Marron', 113, 1, 30),
(216, 'Marron', 114, 1, 30),
(217, 'Beige', 110, 1, 30),
(218, 'Beige', 111, 1, 30),
(219, 'Beige', 112, 1, 30),
(220, 'Beige', 113, 1, 30),
(221, 'Beige', 114, 1, 30),
(222, 'Marron', 115, 1, 31),
(223, 'Marron', 116, 1, 31),
(224, 'Marron', 117, 1, 31),
(225, 'Marron', 118, 1, 31),
(226, 'Marron', 119, 1, 31),
(227, 'Beige', 120, 1, 32),
(228, 'Beige', 121, 1, 32),
(229, 'Beige', 122, 1, 32),
(230, 'Beige', 123, 1, 32),
(231, 'Beige', 124, 1, 32),
(232, 'Rose', 120, 1, 32),
(233, 'Rose', 121, 1, 32),
(234, 'Rose', 122, 1, 32),
(235, 'Rose', 123, 1, 32),
(236, 'Rose', 124, 1, 32),
(247, 'Rose', 130, 1, 34),
(248, 'Rose', 131, 1, 34),
(249, 'Rose', 132, 1, 34),
(250, 'Rose', 133, 1, 34),
(251, 'Rose', 134, 1, 34);

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=135;

--
-- AUTO_INCREMENT for table `temp_table`
--
ALTER TABLE `temp_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `variants`
--
ALTER TABLE `variants`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=252;

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
