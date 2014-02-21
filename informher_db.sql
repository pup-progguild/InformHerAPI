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
	('informherconfirmation_email_1', 'eyJpdiI6Inh3UVFNNkJ5TDNCN0xHMk4rN3NrWnFud3hVOHlvbDF0aDZRVHR1QlhHMk09IiwidmFsdWUiOiJhcURMSVhsWm1uQ2EyTWxxNTJ2ZlV3UEs5SjNjRDF0bjVuWUZ2Sm1pS0MwPSIsIm1hYyI6ImQ1ZWFlYmI0Yjg3MjI5YjM2Njg1OTZmMjhiZGQ3YjBlN2M3NGM5YjhjNWUzNTVlMGUwNmJhZGQ3ZDNlZTdjODIifQ==', 1392935716),
	('informherconfirmation_email_2', 'eyJpdiI6IkNXejVEbUxpOUR4bWduQW5ibXhvZXdhcW9BaDYwbStWT0gzYnowbGpwZ0E9IiwidmFsdWUiOiJzVEp1STRQV3Y0QStYaFNxTmYyd0hxR0JnTkl1VU1OOWhYTUN2bXVSS0hRPSIsIm1hYyI6IjkzZmNkYTI1M2QxNDIzMmU2YzFkMDQ2ZDE0YTM0NGFhN2U2OTY2ZTE2ZWRhZjNhYjQ2MDM3Mjc5ZDg4NDc2YmQifQ==', 1392935716),
	('informherconfirmation_email_3', 'eyJpdiI6Im9idysyeHdvajJGYVQyNVZsZFNjaTRrZzdabmpLVUVodnY5K2Vwc0VqNkU9IiwidmFsdWUiOiJBZGI0MkZRU0tMa0lPUCtYdW9YVFZKQnZcLzhcL2JSckl4cDZrb2tsbmlzeWs9IiwibWFjIjoiMDU0N2QyYTNkMGFkYjlhZGZhNTU1NjQyZjI1ODdjMzQ1ZTM2YmYyOTE0ODVmZjdlMDhiODk5NzUwY2YxNjNjNCJ9', 1392935716),
	('informherconfirmation_email_4', 'eyJpdiI6IkRtR2EyRThNdk1ubG5ZbEtTZnc2RDh1QnpzT0x2ZkxtV2FWdFlVXC9sQUdJPSIsInZhbHVlIjoiamhGQitVZndNR09BRFBSUmFKOUtrUjdhXC8rOXhlK1RFM1lvSzl6cUkrM2c9IiwibWFjIjoiMWUzZjJlMzdkMmUxZTdhNDkyYTE3NjExODIwMWY1YTM2YjU0ZDYzY2IyYWQ5MjNmNjJjMzQzZDg4ZWIwMTcxMCJ9', 1392935717),
	('informherconfirmation_email_5', 'eyJpdiI6IllcL1g0YnN2cFhEc0t6ektIWDN3Ulg2bjRFOHZqbGsyR01heU51d3NoWHVvPSIsInZhbHVlIjoidVN4U0dYQURCSWRhV1FSSys0MXU2d1lTU2Y3cGxuZnFtbSthZGZuK3ZoOD0iLCJtYWMiOiIzYmU0MGU4YjA1YmI5YWZmNDQzN2FiMTgzNmYxMmFjMzFmNDJjZDMwNGVjYjhmNzg5NTMzYzQ0YWMyYjBlMGZlIn0=', 1392935717),
	('informherconfirmation_email_6', 'eyJpdiI6ImdZZTNrRkxhN0ZxZnI0RFZObndIR0MzZEZSY0ZMcFk1MTRcLzExRHRnb084PSIsInZhbHVlIjoiTGxrazlPc3FEWitNXC9kZGZIN1phY1YxVnJZNlRjS3Z6WUdEWHNFMDNleDg9IiwibWFjIjoiNjJkZDVjMTc5NGYxODhkMTcyNGMzZDI0ZmZkNjIzMzg1Y2RiZWM3ZjZiODY3YmQ3NDgwYzg4NWEyNWIzNjEyOSJ9', 1392935717);
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
	(1, 'ask', 'Something to ask? Want to be asked? Do it here!', '2014-02-21 04:35:17', '2014-02-21 04:35:17'),
	(2, 'relate', 'Want to share something? Want to let them know about it? Post it!', '2014-02-21 04:35:17', '2014-02-21 04:35:17'),
	(3, 'shoutout', 'Abused? In pain? You think you are being left out at work? Report it.', '2014-02-21 04:35:17', '2014-02-21 04:35:17');
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
	(1, 'Lorem ipsum dolor sit amet, mutat utinam nonumy ea mel.', 2, 1, '2014-02-21 04:35:18', '2014-02-21 04:35:18', NULL),
	(2, 'Lorem ipsum dolor sit amet, sale ceteros liberavisse duo ex, nam mazim maiestatis dissentiunt no. Iusto nominavi cu sed, has.', 1, 1, '2014-02-21 04:35:18', '2014-02-21 04:35:18', NULL),
	(3, 'Et consul eirmod feugait mel! Te vix iuvaret feugiat repudiandae. Solet dolore lobortis mei te, saepe habemus imperdiet ex vim. Consequat signiferumque per no, ne pri erant vocibus invidunt te.', 3, 1, '2014-02-21 04:35:18', '2014-02-21 04:35:18', NULL),
	(4, 'Lorem ipsum dolor sit amet, mutat utinam nonumy ea mel.', 1, 2, '2014-02-21 04:35:18', '2014-02-21 04:35:18', NULL),
	(5, 'Lorem ipsum dolor sit amet, sale ceteros liberavisse duo ex, nam mazim maiestatis dissentiunt no. Iusto nominavi cu sed, has.', 1, 2, '2014-02-21 04:35:18', '2014-02-21 04:35:18', NULL),
	(6, 'Lorem ipsum dolor sit amet, mutat utinam nonumy ea mel.', 2, 3, '2014-02-21 04:35:18', '2014-02-21 04:35:18', NULL),
	(7, 'Lorem ipsum dolor sit amet, mutat utinam nonumy ea mel.', 3, 2, '2014-02-21 04:35:18', '2014-02-21 04:35:18', NULL),
	(8, 'Lorem ipsum dolor sit amet, sale ceteros liberavisse duo ex, nam mazim maiestatis dissentiunt no. Iusto nominavi cu sed, has.', 1, 3, '2014-02-21 04:35:18', '2014-02-21 04:35:18', NULL),
	(9, 'Et consul eirmod feugait mel! Te vix iuvaret feugiat repudiandae. Solet dolore lobortis mei te, saepe habemus imperdiet ex vim. Consequat signiferumque per no, ne pri erant vocibus invidunt te.', 4, 4, '2014-02-21 04:35:18', '2014-02-21 04:35:18', NULL),
	(10, 'Lorem ipsum dolor sit amet, mutat utinam nonumy ea mel.', 5, 2, '2014-02-21 04:35:18', '2014-02-21 04:35:18', NULL),
	(11, 'Lorem ipsum dolor sit amet, sale ceteros liberavisse duo ex, nam mazim maiestatis dissentiunt no. Iusto nominavi cu sed, has.', 2, 2, '2014-02-21 04:35:18', '2014-02-21 04:35:18', NULL),
	(12, 'Lorem ipsum dolor sit amet, mutat utinam nonumy ea mel.', 1, 3, '2014-02-21 04:35:18', '2014-02-21 04:35:18', NULL);
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
	(1, 1, 1, 'post', '2014-02-21 04:35:18', '2014-02-21 04:35:18'),
	(2, 1, 2, 'post', '2014-02-21 04:35:18', '2014-02-21 04:35:18'),
	(3, 1, 1, 'comment', '2014-02-21 04:35:18', '2014-02-21 04:35:18'),
	(4, 2, 1, 'post', '2014-02-21 04:35:18', '2014-02-21 04:35:18'),
	(5, 2, 3, 'post', '2014-02-21 04:35:18', '2014-02-21 04:35:18'),
	(6, 2, 3, 'comment', '2014-02-21 04:35:18', '2014-02-21 04:35:18'),
	(7, 3, 1, 'comment', '2014-02-21 04:35:18', '2014-02-21 04:35:18'),
	(8, 3, 2, 'post', '2014-02-21 04:35:18', '2014-02-21 04:35:18'),
	(9, 3, 3, 'post', '2014-02-21 04:35:18', '2014-02-21 04:35:18');
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
  `is_shown` tinyint(4) NOT NULL,
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
INSERT INTO `posts` (`id`, `title`, `content`, `geolocation`, `srclink`, `is_shown`, `user_id`, `category_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'Is it normal for women to submit to men?', 'To make your document look professionally produced, Word provides header, footer, cover page, and text box designs that complement each other. For example, you can add a matching cover page, header, and sidebar.', NULL, NULL, 1, 1, 1, '2014-02-21 04:35:17', '2014-02-21 04:35:17', NULL),
	(2, 'Is it alright to ask a question here?', 'To make your document look professionally produced, Word provides header, footer, cover page, and text box designs that complement each other. For example, you can add a matching cover page, header, and sidebar.', NULL, NULL, 1, 2, 1, '2014-02-21 04:35:17', '2014-02-21 04:35:17', NULL),
	(3, 'I am a Doctor. Ask me anything', 'To make your document look professionally produced, Word provides header, footer, cover page, and text box designs that complement each other. For example, you can add a matching cover page, header, and sidebar.', NULL, NULL, 1, 1, 1, '2014-02-21 04:35:17', '2014-02-21 04:35:17', NULL),
	(4, 'I am a Teacher. Ask me anything', 'To make your document look professionally produced, Word provides header, footer, cover page, and text box designs that complement each other. For example, you can add a matching cover page, header, and sidebar.', NULL, NULL, 1, 2, 2, '2014-02-21 04:35:17', '2014-02-21 04:35:17', NULL),
	(5, 'I am a Soldier. Ask me anything', 'To make your document look professionally produced, Word provides header, footer, cover page, and text box designs that complement each other. For example, you can add a matching cover page, header, and sidebar.', NULL, NULL, 1, 3, 2, '2014-02-21 04:35:17', '2014-02-21 04:35:17', NULL);
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
  `badge` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `twt_handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `facebook_username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `bio` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hompage_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `profiles_user_id_foreign` (`user_id`),
  CONSTRAINT `profiles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table informher_db.profiles: ~0 rows (approximately)
DELETE FROM `profiles`;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;


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
	(1, 'User', 'Ordinary User', '2014-02-21 04:35:18', '2014-02-21 04:35:18'),
	(2, 'Expert', 'Able to post in #Relate', '2014-02-21 04:35:18', '2014-02-21 04:35:18'),
	(3, 'Response', 'Able to see posts in #Shoutout', '2014-02-21 04:35:18', '2014-02-21 04:35:18'),
	(4, 'Moderator', 'Can approve of posts in #Ask.', '2014-02-21 04:35:18', '2014-02-21 04:35:18'),
	(5, 'Administrator', 'The administrator who can do everything.', '2014-02-21 04:35:18', '2014-02-21 04:35:18');
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
	(1, 'education', '2014-02-21 04:35:17', '2014-02-21 04:35:17'),
	(2, 'health', '2014-02-21 04:35:17', '2014-02-21 04:35:17'),
	(3, 'abuse', '2014-02-21 04:35:17', '2014-02-21 04:35:17'),
	(4, 'government', '2014-02-21 04:35:17', '2014-02-21 04:35:17'),
	(5, 'news', '2014-02-21 04:35:17', '2014-02-21 04:35:17'),
	(6, 'InformHer: Bug', '2014-02-21 04:35:17', '2014-02-21 04:35:17');
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
	(1, 'ichi-san', '$2y$10$PXaZYv.8EXwoXVymugjm3eoIHPKj3c1iUcZgBhcmYqCnD6Flk/R5O', 'ichi-san@informher.com', 'b76cc8e7fdb40c4a83fdbf5b8b821329', 0, '2014-02-21 04:35:16', '2014-02-21 04:35:16'),
	(2, 'ni-kun', '$2y$10$9lKHKSfe872G2dCKy6Nn/ev4WJXruwE.ckAxTGygldb57Ni7mO0ym', 'ni-kun@informher.com', 'f011ebeae15804afba073e09a9b6b799', 0, '2014-02-21 04:35:16', '2014-02-21 04:35:16'),
	(3, 'san-kun', '$2y$10$RbMoqdvNCwLYu4MVGkeuSupXmPXPAgMXhMHbxedJZoFOGYjLx27kW', 'san-kun@informher.com', '4d45fb29050e1ea68e599cbd39f14b19', 0, '2014-02-21 04:35:16', '2014-02-21 04:35:16'),
	(4, 'awkwardusername', '$2y$10$mJlAKiPtkhYjWT23Talg7O95MWisZ1SAyd8wgtSIXFN5Qq0aVulmG', 'markjayson.fuentes@outlook.com', '49495bd520e9d6ca15a07779d2b3b0df', 0, '2014-02-21 04:35:17', '2014-02-21 04:35:17'),
	(5, 'Temoto-kun', '$2y$10$2CM5RKAkRnxN.KJFyR6Dy.0mnwjm3HC/n6tVLOtQm/3F6ClWILiJa', 'kiirofuriku@hotmail.com', '8bf1dc53b234f6829974b6945192461c', 0, '2014-02-21 04:35:17', '2014-02-21 04:35:17'),
	(6, 'engJEHneer', '$2y$10$alFtTLGKnmUfIonAvADAzOnYmz78gS.JqoWSqmCmXHLxadvWt8E0G', 'tabing.jeremiah@gmail.com', '00200ad90683bae6c537c627876bf713', 0, '2014-02-21 04:35:17', '2014-02-21 04:35:17');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
