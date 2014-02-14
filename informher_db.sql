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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table informher_db.assigned_roles: ~0 rows (approximately)
DELETE FROM `assigned_roles`;
/*!40000 ALTER TABLE `assigned_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `assigned_roles` ENABLE KEYS */;


-- Dumping structure for table informher_db.cache
CREATE TABLE IF NOT EXISTS `cache` (
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  `expiration` int(11) NOT NULL,
  UNIQUE KEY `cache_key_unique` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table informher_db.cache: ~5 rows (approximately)
DELETE FROM `cache`;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
	('informherconfirmation_email_1', 'eyJpdiI6IlUwVThnUGVLK1pVdG14TWFzaEZqREFPbE9CbklUNmRzOXpTXC83bUhIZTFBPSIsInZhbHVlIjoibFM1cDNEYlU2TlFcL0t1bFhPcjN0RDRMWmxVb2VzV1JCV0xEUG13MFRxWUE9IiwibWFjIjoiNmU1MzYwN2JmZjFjOTQzNmY2ODdjOTMxNDY4OWY0YmFmZWVjNzE0ZDljODZiMDljNDQ5Zjk4NmIzY2E0N2ZhNiJ9', 1392383659),
	('informherconfirmation_email_2', 'eyJpdiI6IjR6d00zVTNMVmNNUitXMGhSNWdiZXZITTFzZ0hRZmJva1ArMXd1dzVBR009IiwidmFsdWUiOiJGdlRzSlA3WlRPR25XMGNJTnNDVnphbEZ1MjFCdnd4dG5ROG9XajlCSHlZPSIsIm1hYyI6ImRmZjIzZGM3NDk0ZDMyZTRiOTUxNzNkMjE1ZGRlYTQ0YzBlNzExNDE2YjFhMGU2MTFmMWQxN2UwNDQ0MDRiMDEifQ==', 1392383659),
	('informherconfirmation_email_3', 'eyJpdiI6ImF6dzJFYncrQWp6RzFlUHh6azBiM0NzVFlSbk1wMzFEZDk2NFB4allXam89IiwidmFsdWUiOiJpZnVYbitIUDZzOFBHamtzR21uR1F2ZkM3bDNZR3YwUlNKbDB5UFwvYnRzaz0iLCJtYWMiOiJlZDM1YTY2M2FkNjZhMGUyOGRhZGFhNjJmYjkyNTViNjczZDAzYjk3YTFjNTEzZmE1NmNkZjAyMjFhN2M5ZGYzIn0=', 1392383659),
	('informherconfirmation_email_4', 'eyJpdiI6Ilppdk1YNUE5RXlZVG1aMnJYeVJUaVpTd2Qra25xeGN1dWdhV0J6eTBHa2M9IiwidmFsdWUiOiIyRDVvc2dON3BybllyTjh0a0JLWTd2MGx0VXBlZjRBRTFJelBxNTYyV0NJPSIsIm1hYyI6Ijc3NzZmYzY2OGNmM2VlMGI2N2JiMTkyZTVjMmNiYWUxOWZhZjc4ZGVjZjgxMWU0NTA2MTk3ZGE5OTYyZGMyYTEifQ==', 1392383660),
	('informherconfirmation_email_5', 'eyJpdiI6IldvRExURVhyZzRCb3pEQlJUSXhoUVMxNGdjTVBRZW9CZkVMZ2lGZ2U5WTg9IiwidmFsdWUiOiJwSGVaSDJPRWpTSU1NS2tLMnVqRmtTRDUydnQ1QVwvbk1jZzRlWG50Q3NBaz0iLCJtYWMiOiJmNzM1YzA2MmMzNmRkY2NlZDdkZDY4Y2RhMzQyYzFkNGZiNTU0ZGNlMzg5ZDI5NTYzYzgyYTRjNzc1ZGEzOWQxIn0=', 1392383660);
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
	(1, 'ask', 'Something to ask? Want to be asked? Do it here!', '2014-02-14 19:14:20', '2014-02-14 19:14:20'),
	(2, 'relate', 'Want to share something? Want to let them know about it? Post it!', '2014-02-14 19:14:20', '2014-02-14 19:14:20'),
	(3, 'shoutout', 'Abused? In pain? You think you are being left out at work? Report it.', '2014-02-14 19:14:20', '2014-02-14 19:14:20');
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table informher_db.comments: ~15 rows (approximately)
DELETE FROM `comments`;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` (`id`, `message`, `user_id`, `post_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'Lorem ipsum dolor sit amet, mutat utinam nonumy ea mel.', 2, 1, '2014-02-14 19:14:21', '2014-02-14 22:39:04', NULL),
	(2, 'Lorem ipsum dolor sit amet, sale ceteros liberavisse duo ex, nam mazim maiestatis dissentiunt no. Iusto nominavi cu sed, has.', 1, 1, '2014-02-14 19:14:21', '2014-02-14 22:39:04', NULL),
	(3, 'Edited!', 1, 1, '2014-02-14 19:14:21', '2014-02-15 01:38:35', NULL),
	(4, 'Lorem ipsum dolor sit amet, mutat utinam nonumy ea mel.', 1, 2, '2014-02-14 19:14:21', '2014-02-14 22:38:06', NULL),
	(5, 'Lorem ipsum dolor sit amet, sale ceteros liberavisse duo ex, nam mazim maiestatis dissentiunt no. Iusto nominavi cu sed, has.', 1, 2, '2014-02-14 19:14:21', '2014-02-14 22:38:06', NULL),
	(6, 'Lorem ipsum dolor sit amet, mutat utinam nonumy ea mel.', 2, 3, '2014-02-14 19:14:21', '2014-02-14 19:14:21', NULL),
	(7, 'Lorem ipsum dolor sit amet, mutat utinam nonumy ea mel.', 3, 2, '2014-02-14 19:14:21', '2014-02-14 19:14:21', NULL),
	(8, 'Lorem ipsum dolor sit amet, sale ceteros liberavisse duo ex, nam mazim maiestatis dissentiunt no. Iusto nominavi cu sed, has.', 1, 3, '2014-02-14 19:14:21', '2014-02-14 22:38:06', NULL),
	(9, 'Et consul eirmod feugait mel! Te vix iuvaret feugiat repudiandae. Solet dolore lobortis mei te, saepe habemus imperdiet ex vim. Consequat signiferumque per no, ne pri erant vocibus invidunt te.', 4, 4, '2014-02-14 19:14:21', '2014-02-14 19:14:21', NULL),
	(10, 'Lorem ipsum dolor sit amet, mutat utinam nonumy ea mel.', 5, 2, '2014-02-14 19:14:21', '2014-02-14 19:14:21', NULL),
	(11, 'Lorem ipsum dolor sit amet, sale ceteros liberavisse duo ex, nam mazim maiestatis dissentiunt no. Iusto nominavi cu sed, has.', 2, 2, '2014-02-14 19:14:21', '2014-02-14 19:14:21', NULL),
	(12, 'Lorem ipsum dolor sit amet, mutat utinam nonumy ea mel.', 1, 3, '2014-02-14 19:14:21', '2014-02-14 22:38:06', NULL),
	(13, 'Asduff!', 1, 1, '2014-02-14 23:10:58', '2014-02-14 23:10:58', NULL),
	(14, 'Asduff!', 1, 1, '2014-02-15 00:55:01', '2014-02-15 00:55:01', NULL),
	(15, 'I love this post!', 1, 6, '2014-02-15 01:44:16', '2014-02-15 01:44:16', NULL);
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;


-- Dumping structure for table informher_db.likes
CREATE TABLE IF NOT EXISTS `likes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `imageable_id` int(11) NOT NULL,
  `imageable_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `likes_user_id_foreign` (`user_id`),
  CONSTRAINT `likes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table informher_db.likes: ~9 rows (approximately)
DELETE FROM `likes`;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` (`id`, `user_id`, `imageable_id`, `imageable_type`, `created_at`, `updated_at`) VALUES
	(1, 1, 1, 'post', '2014-02-14 19:14:21', '2014-02-14 19:14:21'),
	(2, 1, 2, 'post', '2014-02-14 19:14:21', '2014-02-14 19:14:21'),
	(3, 1, 1, 'comment', '2014-02-14 19:14:21', '2014-02-14 19:14:21'),
	(4, 2, 1, 'post', '2014-02-14 19:14:21', '2014-02-14 19:14:21'),
	(5, 2, 3, 'post', '2014-02-14 19:14:21', '2014-02-14 19:14:21'),
	(6, 2, 3, 'comment', '2014-02-14 19:14:21', '2014-02-14 19:14:21'),
	(7, 3, 1, 'comment', '2014-02-14 19:14:21', '2014-02-14 19:14:21'),
	(8, 3, 2, 'post', '2014-02-14 19:14:21', '2014-02-14 19:14:21'),
	(9, 3, 3, 'post', '2014-02-14 19:14:22', '2014-02-14 19:14:22');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table informher_db.posts: ~6 rows (approximately)
DELETE FROM `posts`;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` (`id`, `title`, `content`, `geolocation`, `srclink`, `user_id`, `category_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'Is it normal for women to submit to men?', 'To make your document look professionally produced, Word provides header, footer, cover page, and text box designs that complement each other. For example, you can add a matching cover page, header, and sidebar.', NULL, NULL, 1, 1, '2014-02-14 19:14:21', '2014-02-14 22:39:04', NULL),
	(2, 'Is it alright to ask a question here?', 'To make your document look professionally produced, Word provides header, footer, cover page, and text box designs that complement each other. For example, you can add a matching cover page, header, and sidebar.', NULL, NULL, 2, 1, '2014-02-14 19:14:21', '2014-02-14 19:14:21', NULL),
	(3, 'I am a Doctor. Ask me anything', 'To make your document look professionally produced, Word provides header, footer, cover page, and text box designs that complement each other. For example, you can add a matching cover page, header, and sidebar.', NULL, NULL, 1, 1, '2014-02-14 19:14:21', '2014-02-14 19:14:21', NULL),
	(4, 'I just edited this!', 'THis is the shit.', NULL, NULL, 1, 1, '2014-02-14 19:14:21', '2014-02-15 01:48:23', NULL),
	(5, 'I am a Soldier. Ask me anything', 'To make your document look professionally produced, Word provides header, footer, cover page, and text box designs that complement each other. For example, you can add a matching cover page, header, and sidebar.', NULL, NULL, 3, 2, '2014-02-14 19:14:21', '2014-02-14 19:14:21', NULL),
	(6, 'I am a happy man', 'And so am I', NULL, NULL, 1, 1, '2014-02-15 01:43:31', '2014-02-15 01:43:31', NULL);
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


-- Dumping structure for table informher_db.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table informher_db.roles: ~0 rows (approximately)
DELETE FROM `roles`;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;


-- Dumping structure for table informher_db.sessions
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payload` text COLLATE utf8_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL,
  UNIQUE KEY `sessions_id_unique` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table informher_db.sessions: ~1 rows (approximately)
DELETE FROM `sessions`;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` (`id`, `payload`, `last_activity`) VALUES
	('3d6a73bb4ac79391d1a0812e16866e7f1c6a5f51', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiMzlOQkY4TzBJWUtNSTI4UlQ0Q3k3N1BvaXZFSDN5TG54aldRSnB3dSI7czo1OiJmbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjM4OiJsb2dpbl84MmU1ZDJjNTZiZGQwODExMzE4ZjBjZjA3OGI3OGJmYyI7aToxO3M6OToiX3NmMl9tZXRhIjthOjM6e3M6MToidSI7aToxMzkyNDA3MTgxO3M6MToiYyI7aToxMzkyMzg4Njc3O3M6MToibCI7czoxOiIwIjt9fQ==', 1392407181);
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
	(1, 'education', '2014-02-14 19:14:20', '2014-02-14 19:14:20'),
	(2, 'health', '2014-02-14 19:14:20', '2014-02-14 19:14:20'),
	(3, 'abuse', '2014-02-14 19:14:20', '2014-02-14 19:14:20'),
	(4, 'government', '2014-02-14 19:14:20', '2014-02-14 19:14:20'),
	(5, 'news', '2014-02-14 19:14:20', '2014-02-14 19:14:20'),
	(6, 'InformHer: Bug', '2014-02-14 19:14:20', '2014-02-14 19:14:20');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;


-- Dumping structure for table informher_db.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(35) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `twt_handle` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `confirmation_code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table informher_db.users: ~5 rows (approximately)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `username`, `password`, `email`, `twt_handle`, `confirmation_code`, `confirmed`, `created_at`, `updated_at`) VALUES
	(1, 'ichi-san', '$2y$10$.86.SkVjRf.EKPr21Cy6MuIMoJVsIUqedFF18jBzaU2866vDgQEO2', 'ichi-san@informher.com', 'ichi-san', '5a403e88d586e2b38f68c0e231ffb395', 0, '2014-02-14 19:14:18', '2014-02-14 19:14:18'),
	(2, 'ni-kun', '$2y$10$sMpQx8IuoNjnI0i2dmwNpOQw9fHl3gRhbSA4yWmSHVmI0Tj1oHuF.', 'ni-kun@informher.com', 'ni-kun', '249a57f93ff0431b0835baf52c8b16a2', 0, '2014-02-14 19:14:19', '2014-02-14 19:14:19'),
	(3, 'san-kun', '$2y$10$C56j9SX1YFgYgRtw4CJEFOp04iaZ/O8AIvibuF20gtmCDy2Plrp3K', 'san-kun@informher.com', 'san-kun', '18fdfb4c89bffa58b4c8cad167733b4e', 0, '2014-02-14 19:14:19', '2014-02-14 19:14:19'),
	(4, 'awkwardusername', '$2y$10$tnUCiS54fURNdpQwh9Y4ZuAiP/P0ieL/pfdrjZsT.eSPXpzh3OkWa', 'markjayson.fuentes@outlook.com', 'the_dead_poetic', 'da830992e957a6ecf3e6857579aae340', 0, '2014-02-14 19:14:20', '2014-02-14 19:14:20'),
	(5, 'Temoto-kun', '$2y$10$Gb2kizKMTfgkV1XfXhkb7.ZxsLCrsi4uCio2lBfmkq4xh8q7PRjoC', 'kiirofuriku@hotmail.com', 'temotoKun', '38bfbb53c466c3a8a7201a434cc0dc38', 0, '2014-02-14 19:14:20', '2014-02-14 19:14:20');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
