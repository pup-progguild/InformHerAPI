-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.5.32 - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL Version:             8.2.0.4675
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for informher_db
CREATE DATABASE IF NOT EXISTS `informher_db` /*!40100 DEFAULT CHARACTER SET latin1 */;
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
	('informherconfirmation_email_1', 'eyJpdiI6Ilc1U1VFU0w5MGd5MW9KdWtuZEx2SjBcL3hIbk5JamUrM29RV2ZUcnhPbnk4PSIsInZhbHVlIjoiZlUycDBlSDJCTGE3T2J2ZXpzZ1dkcEFFbGRERURlY0l0V3dhUUVUOWNyST0iLCJtYWMiOiI0NDU4YjM2MTRjMGM2MDc3YjdlNzhlMzNjMTg4MGVjYTUyNWM0ZGFiZmYxM2NjOTRjYzI0ZTBjMDIxZDE4NDRkIn0=', 1392943934),
	('informherconfirmation_email_2', 'eyJpdiI6ImpcL2dkamhtR3FYSGJ0UDcrNlRxQVd3UDVCODJxSGdvTzRvNWIzRjJpbTZ3PSIsInZhbHVlIjoiVWhaTDNsd1ZLRGJsZ0ViSXpaWFhMc2w1b2pGeG4rTE13MjArYUc5a0I3ND0iLCJtYWMiOiI5NTlkYjQyYmZhYzI1OTI1MWUyNWNlMjczYTcwZWU1MjdiODY2MGZhNzY2OTBjZGNmZTYyMjFkNDY3ZDYxNDIxIn0=', 1392943934),
	('informherconfirmation_email_3', 'eyJpdiI6InQzWHI0aXR0ekNXZitUamx4YXZPMFwvaDdhdWs4RGE0Z0JTYnFSVDNsQ1ZVPSIsInZhbHVlIjoicm1cL2ZLcTVvN3MyaDBTNFRBUWFcL2xHM0haVTFhdmhQdlhYcmp2NHhOdEFrPSIsIm1hYyI6IjI4OGJkOTNlMmY3NGM3ZWNjMTM2ODc2NDY2ODFjNzk5MmQyOWE0NWE5OTAzMGUwZDVmYWQ1YTI0ZDU3NmY1ODMifQ==', 1392943934),
	('informherconfirmation_email_4', 'eyJpdiI6InZJb0xHNVd1WlwvK0p6SUo5dEQ2eTRwK3VhMFNOb2FHaUg1SGJSR1cySlBVPSIsInZhbHVlIjoiMUQyZlFudE90elpKR0JBYWtaZ0JLa3FFbkF6V0dMZGo3akVSTUJGekNQVT0iLCJtYWMiOiJjMDQ2OWFmNzEzMjQxZDZhNzU0NDQxNDY5YmRkNmIxNzkwNDRiOWNmYTQ1ODliYWE4NTJjZTg3NWU0ZmNiNTE0In0=', 1392943935),
	('informherconfirmation_email_5', 'eyJpdiI6Ind6M0RaS21zaWdkOHhLTmx5b1V1UnZoWEVJNFVcL3VMblhKSk96bW5WdlNRPSIsInZhbHVlIjoiYzZJVHRBanNKdnUxSlVHNUpDRWI3eXNXakx2Nis3SVBCZWZCdUc4R01pbz0iLCJtYWMiOiI4NmJlM2EyNmRhZTg5MGUxZjBmZDFkMTMyYTIxYjZmNzZiNjQwYTFjYTc1MjUzZDk0NWU0N2Q0YTc2ODVlYTk0In0=', 1392943935),
	('informherconfirmation_email_6', 'eyJpdiI6InQ3TFVSUWNySk9vZjMxUXZzcjRtVkRXQnRQaDNtejl4T3N2aVE4bTVPYmc9IiwidmFsdWUiOiIrXC9hUTNFNXR0S0VicndsRk1SMkc2eVVJekNtMnlBU1N3NmtvbEE2dDI5QT0iLCJtYWMiOiI2YjI0YmUyYzY3ZmQ3M2IzZjQ1YzVmNzBkM2I5Njk1MmI4YTVjYjYyMWI0NGEwOThlZDI1NDJiOGI1NzkxNjE1In0=', 1392943935);
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
	(1, 'ask', 'Something to ask? Want to be asked? Do it here!', '2014-02-21 06:52:15', '2014-02-21 06:52:15'),
	(2, 'relate', 'Want to share something? Want to let them know about it? Post it!', '2014-02-21 06:52:15', '2014-02-21 06:52:15'),
	(3, 'shoutout', 'Abused? In pain? You think you are being left out at work? Report it.', '2014-02-21 06:52:15', '2014-02-21 06:52:15');
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
	(1, 'Lorem ipsum dolor sit amet, mutat utinam nonumy ea mel.', 2, 1, '2014-02-21 06:52:16', '2014-02-21 06:52:16', NULL),
	(2, 'Lorem ipsum dolor sit amet, sale ceteros liberavisse duo ex, nam mazim maiestatis dissentiunt no. Iusto nominavi cu sed, has.', 1, 1, '2014-02-21 06:52:16', '2014-02-21 06:52:16', NULL),
	(3, 'Et consul eirmod feugait mel! Te vix iuvaret feugiat repudiandae. Solet dolore lobortis mei te, saepe habemus imperdiet ex vim. Consequat signiferumque per no, ne pri erant vocibus invidunt te.', 3, 1, '2014-02-21 06:52:16', '2014-02-21 06:52:16', NULL),
	(4, 'Lorem ipsum dolor sit amet, mutat utinam nonumy ea mel.', 1, 2, '2014-02-21 06:52:16', '2014-02-21 06:52:16', NULL),
	(5, 'Lorem ipsum dolor sit amet, sale ceteros liberavisse duo ex, nam mazim maiestatis dissentiunt no. Iusto nominavi cu sed, has.', 1, 2, '2014-02-21 06:52:16', '2014-02-21 06:52:16', NULL),
	(6, 'Lorem ipsum dolor sit amet, mutat utinam nonumy ea mel.', 2, 3, '2014-02-21 06:52:16', '2014-02-21 06:52:16', NULL),
	(7, 'Lorem ipsum dolor sit amet, mutat utinam nonumy ea mel.', 3, 2, '2014-02-21 06:52:16', '2014-02-21 06:52:16', NULL),
	(8, 'Lorem ipsum dolor sit amet, sale ceteros liberavisse duo ex, nam mazim maiestatis dissentiunt no. Iusto nominavi cu sed, has.', 1, 3, '2014-02-21 06:52:16', '2014-02-21 06:52:16', NULL),
	(9, 'Et consul eirmod feugait mel! Te vix iuvaret feugiat repudiandae. Solet dolore lobortis mei te, saepe habemus imperdiet ex vim. Consequat signiferumque per no, ne pri erant vocibus invidunt te.', 4, 4, '2014-02-21 06:52:16', '2014-02-21 06:52:16', NULL),
	(10, 'Lorem ipsum dolor sit amet, mutat utinam nonumy ea mel.', 5, 2, '2014-02-21 06:52:16', '2014-02-21 06:52:16', NULL),
	(11, 'Lorem ipsum dolor sit amet, sale ceteros liberavisse duo ex, nam mazim maiestatis dissentiunt no. Iusto nominavi cu sed, has.', 2, 2, '2014-02-21 06:52:16', '2014-02-21 06:52:16', NULL),
	(12, 'Lorem ipsum dolor sit amet, mutat utinam nonumy ea mel.', 1, 3, '2014-02-21 06:52:16', '2014-02-21 06:52:16', NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table informher_db.likes: ~10 rows (approximately)
DELETE FROM `likes`;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` (`id`, `user_id`, `likeable_id`, `likeable_type`, `created_at`, `updated_at`) VALUES
	(1, 1, 1, 'post', '2014-02-21 06:52:16', '2014-02-21 06:52:16'),
	(2, 1, 2, 'post', '2014-02-21 06:52:17', '2014-02-21 06:52:17'),
	(3, 1, 1, 'comment', '2014-02-21 06:52:17', '2014-02-21 06:52:17'),
	(4, 2, 1, 'post', '2014-02-21 06:52:17', '2014-02-21 06:52:17'),
	(5, 2, 3, 'post', '2014-02-21 06:52:17', '2014-02-21 06:52:17'),
	(6, 2, 3, 'comment', '2014-02-21 06:52:17', '2014-02-21 06:52:17'),
	(7, 3, 1, 'comment', '2014-02-21 06:52:17', '2014-02-21 06:52:17'),
	(8, 3, 2, 'post', '2014-02-21 06:52:17', '2014-02-21 06:52:17'),
	(9, 3, 3, 'post', '2014-02-21 06:52:17', '2014-02-21 06:52:17'),
	(12, 4, 3, 'Post', '2014-02-21 08:04:35', '2014-02-21 08:04:35');
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
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`),
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
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
	(1, 'Is it normal for women to submit to men?', 'To make your document look professionally produced, Word provides header, footer, cover page, and text box designs that complement each other. For example, you can add a matching cover page, header, and sidebar.', NULL, NULL, 1, 1, '2014-02-21 06:52:16', '2014-02-21 06:52:16', NULL),
	(2, 'Is it alright to ask a question here?', 'To make your document look professionally produced, Word provides header, footer, cover page, and text box designs that complement each other. For example, you can add a matching cover page, header, and sidebar.', NULL, NULL, 2, 1, '2014-02-21 06:52:16', '2014-02-21 06:52:16', NULL),
	(3, 'I am a Doctor. Ask me anything', 'To make your document look professionally produced, Word provides header, footer, cover page, and text box designs that complement each other. For example, you can add a matching cover page, header, and sidebar.', NULL, NULL, 1, 1, '2014-02-21 06:52:16', '2014-02-21 06:52:16', NULL),
	(4, 'I am a Teacher. Ask me anything', 'To make your document look professionally produced, Word provides header, footer, cover page, and text box designs that complement each other. For example, you can add a matching cover page, header, and sidebar.', NULL, NULL, 2, 2, '2014-02-21 06:52:16', '2014-02-21 06:52:16', NULL),
	(5, 'I am a Soldier. Ask me anything', 'To make your document look professionally produced, Word provides header, footer, cover page, and text box designs that complement each other. For example, you can add a matching cover page, header, and sidebar.', NULL, NULL, 3, 2, '2014-02-21 06:52:16', '2014-02-21 06:52:16', NULL);
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;


-- Dumping structure for table informher_db.post_tags
CREATE TABLE IF NOT EXISTS `post_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` int(10) unsigned NOT NULL,
  `tag_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `post_tags_post_id_foreign` (`post_id`),
  KEY `post_tags_tag_id_foreign` (`tag_id`),
  CONSTRAINT `post_tags_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`),
  CONSTRAINT `post_tags_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`)
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
  `badge` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `twt_handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `facebook_username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `bio` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hompage_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `profiles_user_id_foreign` (`user_id`),
  CONSTRAINT `profiles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table informher_db.profiles: ~0 rows (approximately)
DELETE FROM `profiles`;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;


-- Dumping structure for table informher_db.properties
CREATE TABLE IF NOT EXISTS `properties` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `is_shown` tinyint(4) NOT NULL,
  `is_featured` tinyint(4) NOT NULL,
  `approved_by` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `properties_id` int(10) unsigned NOT NULL,
  `properties_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table informher_db.properties: ~17 rows (approximately)
DELETE FROM `properties`;
/*!40000 ALTER TABLE `properties` DISABLE KEYS */;
INSERT INTO `properties` (`id`, `is_shown`, `is_featured`, `approved_by`, `properties_id`, `properties_type`) VALUES
	(1, 1, 1, 'awkwardusername', 1, 'post'),
	(2, 1, 0, 'awkwardusername', 2, 'post'),
	(3, 1, 0, 'awkwardusername', 3, 'post'),
	(4, 1, 1, 'awkwardusername', 4, 'Post'),
	(5, 1, 0, 'awkwardusername', 5, 'post'),
	(6, 1, 0, 'awkwardusername', 1, 'comment'),
	(7, 1, 0, 'awkwardusername', 2, 'comment'),
	(8, 1, 0, 'awkwardusername', 3, 'comment'),
	(9, 1, 0, 'awkwardusername', 4, 'comment'),
	(10, 1, 0, 'awkwardusername', 5, 'comment'),
	(11, 1, 0, 'awkwardusername', 6, 'comment'),
	(12, 1, 1, 'awkwardusername', 7, 'comment'),
	(13, 1, 0, 'awkwardusername', 8, 'comment'),
	(14, 1, 0, 'awkwardusername', 9, 'comment'),
	(15, 1, 0, 'awkwardusername', 10, 'comment'),
	(16, 1, 1, 'awkwardusername', 11, 'comment'),
	(17, 1, 0, 'awkwardusername', 12, 'comment');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table informher_db.roles: ~5 rows (approximately)
DELETE FROM `roles`;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
	(1, 'User', 'Ordinary User', '2014-02-21 06:52:17', '2014-02-21 06:52:17'),
	(2, 'Expert', 'Able to post in #Relate', '2014-02-21 06:52:17', '2014-02-21 06:52:17'),
	(3, 'Response', 'Able to see posts in #Shoutout', '2014-02-21 06:52:17', '2014-02-21 06:52:17'),
	(4, 'Moderator', 'Can approve of posts in #Ask.', '2014-02-21 06:52:17', '2014-02-21 06:52:17'),
	(5, 'Administrator', 'The administrator who can do everything.', '2014-02-21 06:52:17', '2014-02-21 06:52:17');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;


-- Dumping structure for table informher_db.sessions
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payload` text COLLATE utf8_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL,
  UNIQUE KEY `sessions_id_unique` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table informher_db.sessions: ~4 rows (approximately)
DELETE FROM `sessions`;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` (`id`, `payload`, `last_activity`) VALUES
	('55d6b67b7180d6a255619a7b094ac3a1f91e8562', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibHdoMVdnMjhiT2hFTVVHdmNpY3RuWnlwalV5ckpZOFdLV2dwb1FWSCI7czo1OiJmbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjk6Il9zZjJfbWV0YSI7YTozOntzOjE6InUiO2k6MTM5Mjk1NzA1NztzOjE6ImMiO2k6MTM5Mjk1NzA0MTtzOjE6ImwiO3M6MToiMCI7fX0=', 1392957062),
	('973ded5b3eddabd00276265d3b2fd8c261796729', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia0NxR0Y5Szg5SmMzc1JHemtnbUY3ZFR2WDNxUjVSUWUwUHJHeFNjcyI7czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjEzOTI5NTY5OTI7czoxOiJjIjtpOjEzOTI5NTY5OTI7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1392956995),
	('cc591c49530e5c57960903e90eee545ddb6dadc9', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiVXBnMkdCd0ZsZWdOczZYYUxuekVuUUc2dHdubWpzSnhiUUl4ZkpLcCI7czo1OiJmbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjM4OiJsb2dpbl84MmU1ZDJjNTZiZGQwODExMzE4ZjBjZjA3OGI3OGJmYyI7aTo0O3M6OToiX3NmMl9tZXRhIjthOjM6e3M6MToidSI7aToxMzkyOTQxNDUwO3M6MToiYyI7aToxMzkyOTM2NzYwO3M6MToibCI7czoxOiIwIjt9fQ==', 1392941454),
	('cd0082e7f950aa9df205ea47f610b7803b5268cf', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNVFxeWJCdFpYeDRpOWxoNXRDclhKSUhydWJNV2FwcWNUb1FrcFN1TCI7czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjEzOTI5NTg1Mzg7czoxOiJjIjtpOjEzOTI5NTg1Mzg7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1392958540);
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
	(1, 'education', '2014-02-21 06:52:15', '2014-02-21 06:52:15'),
	(2, 'health', '2014-02-21 06:52:16', '2014-02-21 06:52:16'),
	(3, 'abuse', '2014-02-21 06:52:16', '2014-02-21 06:52:16'),
	(4, 'government', '2014-02-21 06:52:16', '2014-02-21 06:52:16'),
	(5, 'news', '2014-02-21 06:52:16', '2014-02-21 06:52:16'),
	(6, 'InformHer: Bug', '2014-02-21 06:52:16', '2014-02-21 06:52:16');
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
	(1, 'ichi-san', '$2y$10$LPqXkdFpbZ.U6ORFSjjX5.GUJOThCw1EZ2XF1rdkwRZ3waWT/yRv6', 'ichi-san@informher.com', '4ff7622ed2432fe1175dc52976e3630b', 0, '2014-02-21 06:52:14', '2014-02-21 06:52:14'),
	(2, 'ni-kun', '$2y$10$XK9zUZPFbDicpLm8GFOymuBOiNuCwIkH8owC.PXp8PzlAxGwTBiyi', 'ni-kun@informher.com', 'e988695905b4183e88d259978844548c', 0, '2014-02-21 06:52:14', '2014-02-21 06:52:14'),
	(3, 'san-kun', '$2y$10$S1FfzGG18Ek4WNsflhGkYeZTHpQTo.AJxMgkPMSjfEnSEQy2zAc3G', 'san-kun@informher.com', 'eb0fd01c028968077c7610b1fd3b24c5', 0, '2014-02-21 06:52:14', '2014-02-21 06:52:14'),
	(4, 'awkwardusername', '$2y$10$AuWQ.LFRVwzjk6erjcv23e5/1mSe0ZiEbwzyH67GW7AYPZMdgmwXG', 'markjayson.fuentes@outlook.com', 'a786b937f27dacabc39d87626bd2796d', 0, '2014-02-21 06:52:15', '2014-02-21 06:52:15'),
	(5, 'Temoto-kun', '$2y$10$wBDsCWdX7f09Xy3I/qooyO3NUZlfX6BAsQ/vNfBsr7kSBDFVyILSa', 'kiirofuriku@hotmail.com', 'b5b0eb10c39205ce1319006ed4d8b3b9', 0, '2014-02-21 06:52:15', '2014-02-21 06:52:15'),
	(6, 'engJEHneer', '$2y$10$9OeNLeD2d3KLYCfDkzNB8OjTuDOGmrWnEKk2DVTigV5Whb0n4mEAC', 'tabing.jeremiah@gmail.com', '2169427e3fa93fddddc7c4855657e663', 0, '2014-02-21 06:52:15', '2014-02-21 06:52:15');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
