-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.5.33a-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             8.2.0.4675
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for informher_db
CREATE DATABASE IF NOT EXISTS `informher_db` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `informher_db`;


-- Dumping structure for table informher_db.assigned_roles
CREATE TABLE IF NOT EXISTS `assigned_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `assigned_roles_user_id_foreign` (`user_id`),
  KEY `assigned_roles_role_id_foreign` (`role_id`),
  CONSTRAINT `assigned_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  CONSTRAINT `assigned_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table informher_db.assigned_roles: ~18 rows (approximately)
DELETE FROM `assigned_roles`;
/*!40000 ALTER TABLE `assigned_roles` DISABLE KEYS */;
INSERT INTO `assigned_roles` (`id`, `user_id`, `role_id`) VALUES
	(1, 1, 1),
	(2, 2, 1),
	(3, 3, 1),
	(4, 4, 1),
	(5, 5, 1),
	(6, 6, 1),
	(7, 4, 2),
	(8, 5, 2),
	(9, 6, 2),
	(10, 4, 3),
	(11, 5, 3),
	(12, 6, 3),
	(13, 4, 4),
	(14, 5, 4),
	(15, 6, 4),
	(16, 4, 5),
	(17, 5, 5),
	(18, 6, 5);
/*!40000 ALTER TABLE `assigned_roles` ENABLE KEYS */;


-- Dumping structure for table informher_db.cache
CREATE TABLE IF NOT EXISTS `cache` (
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  `expiration` int(11) NOT NULL,
  UNIQUE KEY `cache_key_unique` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table informher_db.cache: ~6 rows (approximately)
DELETE FROM `cache`;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
	('informherconfirmation_email_1', 'eyJpdiI6IjNLRmxzREZFSVJiMWo4ckhaOHd5b05sQjF1ZTgySHVycnZBMGNwZ2VBcWs9IiwidmFsdWUiOiJQV2NpaDRVNXh0aEE3ek9sanhiVlplbDhOYXNGb0dtK1BRZ2JzZk56UWRBPSIsIm1hYyI6ImU3MmViMWFmNmJlZGQwOGYzMmYxOTE3ZGM0Y2NiNjM2MTc1OTA4ZDc2YWMyMDQ5ZTY4ODg2ZDI3ODkzMDQ5YTgifQ==', 1393465219),
	('informherconfirmation_email_2', 'eyJpdiI6IklnS09FS01QMGJhK3lnUWZLa1MyMFF6UmVrVmhJbVoxQUlWWnZJODh6T1k9IiwidmFsdWUiOiJmWUFzQU5GSzljZlhsZkE1d2ZxWVNXM3FtMFB2bEhxYUYwaTREa1VYNFA0PSIsIm1hYyI6ImZmOGMzMjdhMjg5MjM5N2ZlMGJlNzQ5Yzg3NWEzMmQ3NDJkNjdiMjcyOWVmZWQxOGE3NGUxY2FhMTc5YWY0ZDgifQ==', 1393465220),
	('informherconfirmation_email_3', 'eyJpdiI6ImsrTFF1Y21wZkp3QTRQMjQ2ZXVlWTRiMTEwZWhsdlVwbDdrNEFsblNVMlk9IiwidmFsdWUiOiJmd2swcjJLbU9ITkZXUkNsZHVDTUU4YzRHM0U1K1YrVWdMcFNFQkFEMDZFPSIsIm1hYyI6IjljNDg5ZDgyZWI4NmQ5ZTg3MTYwZTljYzdlNTNjNzE2ZmMzMThkMTcxYjNjMzI5MjRhNThjNWUxYzI4NzI5ODIifQ==', 1393465220),
	('informherconfirmation_email_4', 'eyJpdiI6IkdaZVhUOXpIVzYxdUdBaktFMnBCaXlzb3dLdDMwVHhUNUhJYkVxMm1obkk9IiwidmFsdWUiOiJLajlmck0xXC9sSUIwSFBsXC9UTjM4U0tvc1VVXC9nUWRIUndCdUxkK3ZydllZPSIsIm1hYyI6ImRkZjgxODZiYmNmMjk1Mzc3YTY0N2I1NGMzMjc5NGZiODU0M2Y3NzRkZDNmYWNmYzNjNzE1NzM5ODA2NDdhNzYifQ==', 1393465220),
	('informherconfirmation_email_5', 'eyJpdiI6IlY4VmFsdHRGMVwvWFFjT3hZa2g5a2VSaVwvUTdNZXcxd0lSRVhqSXl0Yyt4Zz0iLCJ2YWx1ZSI6IkM2UFlBT2JJRldqbzhWV3J4ck1qdmpZK09UMyttYzFRRmd4UjNwZzRUdGc9IiwibWFjIjoiNzU0YjQxMDE1YTExM2I2MjI1NDEzZDNkMTM0MDk4YTliYTk3OGQ1NTU1MjU0NzI4MzI0MDJkNjk3NzlkNmY5OCJ9', 1393465220),
	('informherconfirmation_email_6', 'eyJpdiI6ImFFRjRYQjFMMTNcL28yZ29NeHhoK3RJdFlzV1wvWnIydkliemFKN1dCSlBvdz0iLCJ2YWx1ZSI6Ik9jU1wvR1pRZ1NXaUo5aVwvXC9ER09CUVpBeWd3Y3MxN3V5SFwvOElTQXlPMHo4PSIsIm1hYyI6ImQ3ZmEwZmJlN2ZiNzU1YmQyODk5MmNmZmU2ZjhhNGZkMmNhNmExNmZiMjFjYjlhY2Q4ZmYzZWRmYzE1ZGU4ZmUifQ==', 1393465220);
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;


-- Dumping structure for table informher_db.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table informher_db.categories: ~3 rows (approximately)
DELETE FROM `categories`;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
	(1, 'ask', 'Something to ask? Want to be asked? Do it here!', '2014-02-27 07:40:20', '2014-02-27 07:40:20'),
	(2, 'relate', 'Want to share something? Want to let them know about it? Post it!', '2014-02-27 07:40:20', '2014-02-27 07:40:20'),
	(3, 'shoutout', 'Abused? In pain? You think you are being left out at work? Report it.', '2014-02-27 07:40:20', '2014-02-27 07:40:20');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;


-- Dumping structure for table informher_db.comments
CREATE TABLE IF NOT EXISTS `comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `post_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comments_user_id_foreign` (`user_id`),
  KEY `comments_post_id_foreign` (`post_id`),
  CONSTRAINT `comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`),
  CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table informher_db.comments: ~12 rows (approximately)
DELETE FROM `comments`;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` (`id`, `message`, `user_id`, `post_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'Lorem ipsum dolor sit amet, mutat utinam nonumy ea mel.', 2, 1, '2014-02-27 07:40:21', '2014-02-27 07:40:21', NULL),
	(2, 'Lorem ipsum dolor sit amet, sale ceteros liberavisse duo ex, nam mazim maiestatis dissentiunt no. Iusto nominavi cu sed, has.', 1, 1, '2014-02-27 07:40:21', '2014-02-27 07:40:21', NULL),
	(3, 'Et consul eirmod feugait mel! Te vix iuvaret feugiat repudiandae. Solet dolore lobortis mei te, saepe habemus imperdiet ex vim. Consequat signiferumque per no, ne pri erant vocibus invidunt te.', 3, 1, '2014-02-27 07:40:21', '2014-02-27 07:40:21', NULL),
	(4, 'Lorem ipsum dolor sit amet, mutat utinam nonumy ea mel.', 1, 2, '2014-02-27 07:40:21', '2014-02-27 07:40:21', NULL),
	(5, 'Lorem ipsum dolor sit amet, sale ceteros liberavisse duo ex, nam mazim maiestatis dissentiunt no. Iusto nominavi cu sed, has.', 1, 2, '2014-02-27 07:40:21', '2014-02-27 07:40:21', NULL),
	(6, 'Lorem ipsum dolor sit amet, mutat utinam nonumy ea mel.', 2, 3, '2014-02-27 07:40:21', '2014-02-27 07:40:21', NULL),
	(7, 'Lorem ipsum dolor sit amet, mutat utinam nonumy ea mel.', 3, 2, '2014-02-27 07:40:21', '2014-02-27 07:40:21', NULL),
	(8, 'Lorem ipsum dolor sit amet, sale ceteros liberavisse duo ex, nam mazim maiestatis dissentiunt no. Iusto nominavi cu sed, has.', 1, 3, '2014-02-27 07:40:21', '2014-02-27 07:40:21', NULL),
	(9, 'Et consul eirmod feugait mel! Te vix iuvaret feugiat repudiandae. Solet dolore lobortis mei te, saepe habemus imperdiet ex vim. Consequat signiferumque per no, ne pri erant vocibus invidunt te.', 4, 4, '2014-02-27 07:40:21', '2014-02-27 07:40:21', NULL),
	(10, 'Lorem ipsum dolor sit amet, mutat utinam nonumy ea mel.', 5, 2, '2014-02-27 07:40:21', '2014-02-27 07:40:21', NULL),
	(11, 'Lorem ipsum dolor sit amet, sale ceteros liberavisse duo ex, nam mazim maiestatis dissentiunt no. Iusto nominavi cu sed, has.', 2, 2, '2014-02-27 07:40:22', '2014-02-27 07:40:22', NULL),
	(12, 'Lorem ipsum dolor sit amet, mutat utinam nonumy ea mel.', 1, 3, '2014-02-27 07:40:22', '2014-02-27 07:40:22', NULL);
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;


-- Dumping structure for table informher_db.likes
CREATE TABLE IF NOT EXISTS `likes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `likeable_id` int(10) unsigned NOT NULL,
  `likeable_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `likes_user_id_foreign` (`user_id`),
  CONSTRAINT `likes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table informher_db.likes: ~9 rows (approximately)
DELETE FROM `likes`;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` (`id`, `user_id`, `likeable_id`, `likeable_type`, `created_at`, `updated_at`) VALUES
	(1, 1, 1, 'post', '2014-02-27 07:40:22', '2014-02-27 07:40:22'),
	(2, 1, 2, 'post', '2014-02-27 07:40:22', '2014-02-27 07:40:22'),
	(3, 1, 1, 'comment', '2014-02-27 07:40:22', '2014-02-27 07:40:22'),
	(4, 2, 1, 'post', '2014-02-27 07:40:22', '2014-02-27 07:40:22'),
	(5, 2, 3, 'post', '2014-02-27 07:40:22', '2014-02-27 07:40:22'),
	(6, 2, 3, 'comment', '2014-02-27 07:40:22', '2014-02-27 07:40:22'),
	(7, 3, 1, 'comment', '2014-02-27 07:40:22', '2014-02-27 07:40:22'),
	(8, 3, 2, 'post', '2014-02-27 07:40:22', '2014-02-27 07:40:22'),
	(9, 3, 3, 'post', '2014-02-27 07:40:22', '2014-02-27 07:40:22');
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;


-- Dumping structure for table informher_db.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table informher_db.migrations: ~1 rows (approximately)
DELETE FROM `migrations`;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`migration`, `batch`) VALUES
	('2014_01_01_170206_create_tables', 1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;


-- Dumping structure for table informher_db.password_reminders
CREATE TABLE IF NOT EXISTS `password_reminders` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  KEY `password_reminders_email_index` (`email`),
  KEY `password_reminders_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table informher_db.password_reminders: ~0 rows (approximately)
DELETE FROM `password_reminders`;
/*!40000 ALTER TABLE `password_reminders` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reminders` ENABLE KEYS */;


-- Dumping structure for table informher_db.permissions
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table informher_db.permissions: ~0 rows (approximately)
DELETE FROM `permissions`;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;


-- Dumping structure for table informher_db.permission_role
CREATE TABLE IF NOT EXISTS `permission_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `permission_role_permission_id_foreign` (`permission_id`),
  KEY `permission_role_role_id_foreign` (`role_id`),
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table informher_db.permission_role: ~0 rows (approximately)
DELETE FROM `permission_role`;
/*!40000 ALTER TABLE `permission_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `permission_role` ENABLE KEYS */;


-- Dumping structure for table informher_db.posts
CREATE TABLE IF NOT EXISTS `posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(140) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `geolocation` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `srclink` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `category_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `posts_user_id_foreign` (`user_id`),
  KEY `posts_category_id_foreign` (`category_id`),
  CONSTRAINT `posts_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table informher_db.posts: ~5 rows (approximately)
DELETE FROM `posts`;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` (`id`, `title`, `content`, `geolocation`, `srclink`, `user_id`, `category_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'Is it normal for women to submit to men?', 'To make your document look professionally produced, Word provides header, footer, cover page, and text box designs that complement each other. For example, you can add a matching cover page, header, and sidebar.', NULL, NULL, 1, 1, '2014-02-27 07:40:21', '2014-02-27 07:40:21', NULL),
	(2, 'Is it alright to ask a question here?', 'To make your document look professionally produced, Word provides header, footer, cover page, and text box designs that complement each other. For example, you can add a matching cover page, header, and sidebar.', NULL, NULL, 2, 1, '2014-02-27 07:40:21', '2014-02-27 07:40:21', NULL),
	(3, 'I am a Doctor. Ask me anything', 'To make your document look professionally produced, Word provides header, footer, cover page, and text box designs that complement each other. For example, you can add a matching cover page, header, and sidebar.', NULL, NULL, 1, 1, '2014-02-27 07:40:21', '2014-02-27 07:40:21', NULL),
	(4, 'I am a Teacher. Ask me anything', 'To make your document look professionally produced, Word provides header, footer, cover page, and text box designs that complement each other. For example, you can add a matching cover page, header, and sidebar.', NULL, NULL, 2, 2, '2014-02-27 07:40:21', '2014-02-27 07:40:21', NULL),
	(5, 'I am a Soldier. Ask me anything', 'To make your document look professionally produced, Word provides header, footer, cover page, and text box designs that complement each other. For example, you can add a matching cover page, header, and sidebar.', NULL, NULL, 3, 2, '2014-02-27 07:40:21', '2014-02-27 07:40:21', NULL);
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;


-- Dumping structure for table informher_db.post_tags
CREATE TABLE IF NOT EXISTS `post_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` int(10) unsigned NOT NULL,
  `tag_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `post_tags_post_id_foreign` (`post_id`),
  KEY `post_tags_tag_id_foreign` (`tag_id`),
  CONSTRAINT `post_tags_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`),
  CONSTRAINT `post_tags_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table informher_db.post_tags: ~6 rows (approximately)
DELETE FROM `post_tags`;
/*!40000 ALTER TABLE `post_tags` DISABLE KEYS */;
INSERT INTO `post_tags` (`id`, `post_id`, `tag_id`) VALUES
	(1, 1, 1),
	(2, 1, 2),
	(3, 2, 5),
	(4, 3, 2),
	(5, 4, 3),
	(6, 5, 6);
/*!40000 ALTER TABLE `post_tags` ENABLE KEYS */;


-- Dumping structure for table informher_db.profiles
CREATE TABLE IF NOT EXISTS `profiles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `badge` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `twt_handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `facebook_username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bio` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hompage_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `profiles_user_id_foreign` (`user_id`),
  CONSTRAINT `profiles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table informher_db.profiles: ~6 rows (approximately)
DELETE FROM `profiles`;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
INSERT INTO `profiles` (`id`, `badge`, `twt_handle`, `facebook_username`, `bio`, `hompage_url`, `user_id`, `created_at`, `updated_at`) VALUES
	(1, 'The First User', 'ichi-san', 'ichi-san', 'This is the first User. Name was taken from the Japanese word for \'one\'', 'http://ichi-san.com', 1, '2014-02-27 07:40:23', '2014-02-27 07:40:23'),
	(2, 'The Second User', 'ni-kun', 'ni-kun', 'This is the second user. Name was taken from the Japanese word for \'two\'', 'http://ni-kun.com', 2, '2014-02-27 07:40:23', '2014-02-27 07:40:23'),
	(3, 'The Third User', 'san-kun', 'san-kun', 'This is the third user. Name was taken from the Japanese word for \'three\'', 'http://san-kun.com', 3, '2014-02-27 07:40:23', '2014-02-27 07:40:23'),
	(4, 'Mark Jayson', 'the_dead_poetic', 'existencemodulus', 'I\'m the one responsible for the API. It\'s hard. Don\'t try it at home.', 'http://iamexistent.wordpress.com', 4, '2014-02-27 07:40:23', '2014-02-27 07:40:23'),
	(5, 'Allan', 'temotoKun', 'theoryofnekomata', 'The front-end is his accident of a creation. In HTML5. Purely web technologies. Purely.', 'http://github.com/temoto-kun', 5, '2014-02-27 07:40:23', '2014-02-27 07:40:23'),
	(6, 'Jeremiah', 'engJEHneer', 'jeremiah.tabing', 'Actually an electronics expert - deals with PR, profitability, graphics, business rules. Really.', 'http://facebook.com/jeremiah.tabing', 6, '2014-02-27 07:40:23', '2014-02-27 07:40:23');
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;


-- Dumping structure for table informher_db.properties
CREATE TABLE IF NOT EXISTS `properties` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `is_shown` tinyint(4) NOT NULL,
  `is_featured` tinyint(4) NOT NULL,
  `last_modified_by` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `properties_id` int(10) unsigned NOT NULL,
  `properties_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table informher_db.properties: ~17 rows (approximately)
DELETE FROM `properties`;
/*!40000 ALTER TABLE `properties` DISABLE KEYS */;
INSERT INTO `properties` (`id`, `is_shown`, `is_featured`, `last_modified_by`, `properties_id`, `properties_type`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 1, 1, 'awkwardusername', 1, 'post', '2014-02-27 07:40:23', '2014-02-27 07:40:23', NULL),
	(2, 1, 0, 'awkwardusername', 2, 'post', '2014-02-27 07:40:23', '2014-02-27 07:40:23', NULL),
	(3, 1, 0, 'awkwardusername', 3, 'post', '2014-02-27 07:40:23', '2014-02-27 07:40:23', NULL),
	(4, 1, 1, 'awkwardusername', 4, 'post', '2014-02-27 07:40:23', '2014-02-27 07:40:23', NULL),
	(5, 1, 0, 'awkwardusername', 5, 'post', '2014-02-27 07:40:24', '2014-02-27 07:40:24', NULL),
	(6, 1, 0, 'awkwardusername', 1, 'comment', '2014-02-27 07:40:24', '2014-02-27 07:40:24', NULL),
	(7, 1, 0, 'awkwardusername', 2, 'comment', '2014-02-27 07:40:24', '2014-02-27 07:40:24', NULL),
	(8, 1, 0, 'awkwardusername', 3, 'comment', '2014-02-27 07:40:24', '2014-02-27 07:40:24', NULL),
	(9, 1, 0, 'awkwardusername', 4, 'comment', '2014-02-27 07:40:24', '2014-02-27 07:40:24', NULL),
	(10, 1, 0, 'awkwardusername', 5, 'comment', '2014-02-27 07:40:24', '2014-02-27 07:40:24', NULL),
	(11, 1, 0, 'awkwardusername', 6, 'comment', '2014-02-27 07:40:24', '2014-02-27 07:40:24', NULL),
	(12, 1, 1, 'awkwardusername', 7, 'comment', '2014-02-27 07:40:24', '2014-02-27 07:40:24', NULL),
	(13, 1, 0, 'awkwardusername', 8, 'comment', '2014-02-27 07:40:24', '2014-02-27 07:40:24', NULL),
	(14, 1, 0, 'awkwardusername', 9, 'comment', '2014-02-27 07:40:24', '2014-02-27 07:40:24', NULL),
	(15, 1, 0, 'awkwardusername', 10, 'comment', '2014-02-27 07:40:24', '2014-02-27 07:40:24', NULL),
	(16, 1, 1, 'awkwardusername', 11, 'comment', '2014-02-27 07:40:24', '2014-02-27 07:40:24', NULL),
	(17, 1, 0, 'awkwardusername', 12, 'comment', '2014-02-27 07:40:24', '2014-02-27 07:40:24', NULL);
/*!40000 ALTER TABLE `properties` ENABLE KEYS */;


-- Dumping structure for table informher_db.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table informher_db.roles: ~6 rows (approximately)
DELETE FROM `roles`;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
	(1, 'User', 'Ordinary User', '2014-02-27 07:40:22', '2014-02-27 07:40:22'),
	(2, 'Expert', 'Able to post in #Relate', '2014-02-27 07:40:22', '2014-02-27 07:40:22'),
	(3, 'Response', 'Able to see posts in #Shoutout', '2014-02-27 07:40:22', '2014-02-27 07:40:22'),
	(4, 'Moderator', 'Can approve of posts in #Ask.', '2014-02-27 07:40:22', '2014-02-27 07:40:22'),
	(5, 'Administrator', 'The administrator who can do everything.', '2014-02-27 07:40:22', '2014-02-27 07:40:22'),
	(6, 'Banned', 'Banned', '2014-02-27 07:40:22', '2014-02-27 07:40:22');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;


-- Dumping structure for table informher_db.sessions
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payload` text COLLATE utf8_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL,
  UNIQUE KEY `sessions_id_unique` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table informher_db.sessions: ~0 rows (approximately)
DELETE FROM `sessions`;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;


-- Dumping structure for table informher_db.tags
CREATE TABLE IF NOT EXISTS `tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tagname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `tags_tagname_unique` (`tagname`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table informher_db.tags: ~6 rows (approximately)
DELETE FROM `tags`;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` (`id`, `tagname`, `created_at`, `updated_at`) VALUES
	(1, 'education', '2014-02-27 07:40:21', '2014-02-27 07:40:21'),
	(2, 'health', '2014-02-27 07:40:21', '2014-02-27 07:40:21'),
	(3, 'abuse', '2014-02-27 07:40:21', '2014-02-27 07:40:21'),
	(4, 'government', '2014-02-27 07:40:21', '2014-02-27 07:40:21'),
	(5, 'news', '2014-02-27 07:40:21', '2014-02-27 07:40:21'),
	(6, 'InformHer: Bug', '2014-02-27 07:40:21', '2014-02-27 07:40:21');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;


-- Dumping structure for table informher_db.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(35) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `confirmation_code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table informher_db.users: ~6 rows (approximately)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `username`, `password`, `email`, `confirmation_code`, `confirmed`, `created_at`, `updated_at`) VALUES
	(1, 'ichi-san', '$2y$10$24KNlvOPUBsR6j6JxTNVEO8l9oPXLzNqTaS3oWFsfWFCJaKfRhtSq', 'ichi-san@informher.com', '6e133bdd567ad968142dd96be1438bbf', 0, '2014-02-27 07:40:19', '2014-02-27 07:40:19'),
	(2, 'ni-kun', '$2y$10$e44.F5TU3Z2o6wNIMXPdCuvbOZoUictn17I.q6WuyKxpP/LiS4G4u', 'ni-kun@informher.com', '618f7302ab8d62c0bcc0418952d5d303', 0, '2014-02-27 07:40:20', '2014-02-27 07:40:20'),
	(3, 'san-kun', '$2y$10$gQ9ae3UT/CiO2ulbLlnm3uGEhHaI/W/IqGOhX6fiQ2l7rZAVs6iUK', 'san-kun@informher.com', 'dcfe03131f011a08f5286ca530b54bda', 0, '2014-02-27 07:40:20', '2014-02-27 07:40:20'),
	(4, 'awkwardusername', '$2y$10$.cnexRux4/6Fsx9F9dxVruvB.obrH7pbfDF9x5l60Yl.45qSwOYcS', 'markjayson.fuentes@outlook.com', '1a7d1556611d8df6ea732ed8192470a2', 0, '2014-02-27 07:40:20', '2014-02-27 07:40:20'),
	(5, 'Temoto-kun', '$2y$10$Bzwhqz9eoXJcssqfoDveJ.KKsbBJCl94grmutoRL8F1uuDHK6dwTC', 'kiirofuriku@hotmail.com', '5c9e919996d0e86f9bcde5806c3a55d7', 0, '2014-02-27 07:40:20', '2014-02-27 07:40:20'),
	(6, 'engJEHneer', '$2y$10$0AJT99CqGnS1k9rdKUBbp.u0Y3.TzM8.1WKyY4enESHeCClY4CA8q', 'tabing.jeremiah@gmail.com', '68d11bc075498c2eb53890a945095ffa', 0, '2014-02-27 07:40:20', '2014-02-27 07:40:20');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
