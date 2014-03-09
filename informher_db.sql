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


-- Adminer 4.0.3 MySQL dump

SET NAMES utf8;
SET foreign_key_checks = 0;
SET time_zone = '+00:00';
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `assigned_roles`;
CREATE TABLE `assigned_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `assigned_roles_user_id_foreign` (`user_id`),
  KEY `assigned_roles_role_id_foreign` (`role_id`),
  CONSTRAINT `assigned_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  CONSTRAINT `assigned_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `assigned_roles` (`id`, `user_id`, `role_id`) VALUES
(1,	1,	1),
(2,	2,	1),
(3,	3,	1),
(4,	4,	1),
(5,	5,	1),
(6,	6,	1),
(7,	4,	2),
(8,	5,	2),
(9,	6,	2),
(10,	4,	3),
(11,	5,	3),
(12,	6,	3),
(13,	4,	4),
(14,	5,	4),
(15,	6,	4),
(16,	4,	5),
(17,	5,	5),
(18,	6,	5),
(19,	7,	1),
(20,	8,	1),
(21,	9,	1),
(22,	10,	1),
(23,	11,	1),
(24,	12,	1),
(25,	13,	1),
(26,	14,	1),
(27,	15,	1),
(28,	16,	1),
(29,	17,	1),
(30,	18,	1),
(31,	19,	1),
(32,	20,	1);

DROP TABLE IF EXISTS `cache`;
CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  `expiration` int(11) NOT NULL,
  UNIQUE KEY `cache_key_unique` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('informherconfide_flogin_attempt_112.198.77.246',	'eyJpdiI6IjAwK0tWUlBxRnVIK29pVUVlaGFcL21yZkRCRHR4dWlHUHlTTTRBUVplSUxFPSIsInZhbHVlIjoiS0VPQ0VNMUZtNDY0SVhNNlplSjcxZVlOb3g3S1Ridkt1QmtHcDd2MzBITT0iLCJtYWMiOiJjNTBhYzM3YWViNjI1MzI2NWYxMTA4MDU1YzQ2YTAwMzBhZmQyODUzOGViMmZlZGE1YjgyZDM5NDUwYjMyYjIxIn0=',	1393459231),
('informherconfide_flogin_attempt_23.23.103.218',	'eyJpdiI6IlJzUWN3NHdOakNpcmRxbnloQUFDMW4rMXZYM1Z2TlVsaHVNT25oWU56Yjg9IiwidmFsdWUiOiJ5V1JqY0JtNnByRGtOWjB6bWlZQTV2K2piZTlzWmp1VHJ3Y1hxR2ZmaWdZPSIsIm1hYyI6IjU0NjY4NDg4Y2E1Mjg5OGZhZjllMzQ5YThhNDQ2NGU4YzhkMjI0ZWM0NmZlMDc4OWQ0Njg2YWRkZmUxODM3NWQifQ==',	1393504962),
('informherconfirmation_email_1',	'eyJpdiI6IjNLRmxzREZFSVJiMWo4ckhaOHd5b05sQjF1ZTgySHVycnZBMGNwZ2VBcWs9IiwidmFsdWUiOiJQV2NpaDRVNXh0aEE3ek9sanhiVlplbDhOYXNGb0dtK1BRZ2JzZk56UWRBPSIsIm1hYyI6ImU3MmViMWFmNmJlZGQwOGYzMmYxOTE3ZGM0Y2NiNjM2MTc1OTA4ZDc2YWMyMDQ5ZTY4ODg2ZDI3ODkzMDQ5YTgifQ==',	1393465219),
('informherconfirmation_email_2',	'eyJpdiI6IklnS09FS01QMGJhK3lnUWZLa1MyMFF6UmVrVmhJbVoxQUlWWnZJODh6T1k9IiwidmFsdWUiOiJmWUFzQU5GSzljZlhsZkE1d2ZxWVNXM3FtMFB2bEhxYUYwaTREa1VYNFA0PSIsIm1hYyI6ImZmOGMzMjdhMjg5MjM5N2ZlMGJlNzQ5Yzg3NWEzMmQ3NDJkNjdiMjcyOWVmZWQxOGE3NGUxY2FhMTc5YWY0ZDgifQ==',	1393465220),
('informherconfirmation_email_3',	'eyJpdiI6ImsrTFF1Y21wZkp3QTRQMjQ2ZXVlWTRiMTEwZWhsdlVwbDdrNEFsblNVMlk9IiwidmFsdWUiOiJmd2swcjJLbU9ITkZXUkNsZHVDTUU4YzRHM0U1K1YrVWdMcFNFQkFEMDZFPSIsIm1hYyI6IjljNDg5ZDgyZWI4NmQ5ZTg3MTYwZTljYzdlNTNjNzE2ZmMzMThkMTcxYjNjMzI5MjRhNThjNWUxYzI4NzI5ODIifQ==',	1393465220),
('informherconfirmation_email_4',	'eyJpdiI6IkdaZVhUOXpIVzYxdUdBaktFMnBCaXlzb3dLdDMwVHhUNUhJYkVxMm1obkk9IiwidmFsdWUiOiJLajlmck0xXC9sSUIwSFBsXC9UTjM4U0tvc1VVXC9nUWRIUndCdUxkK3ZydllZPSIsIm1hYyI6ImRkZjgxODZiYmNmMjk1Mzc3YTY0N2I1NGMzMjc5NGZiODU0M2Y3NzRkZDNmYWNmYzNjNzE1NzM5ODA2NDdhNzYifQ==',	1393465220),
('informherconfirmation_email_5',	'eyJpdiI6IlY4VmFsdHRGMVwvWFFjT3hZa2g5a2VSaVwvUTdNZXcxd0lSRVhqSXl0Yyt4Zz0iLCJ2YWx1ZSI6IkM2UFlBT2JJRldqbzhWV3J4ck1qdmpZK09UMyttYzFRRmd4UjNwZzRUdGc9IiwibWFjIjoiNzU0YjQxMDE1YTExM2I2MjI1NDEzZDNkMTM0MDk4YTliYTk3OGQ1NTU1MjU0NzI4MzI0MDJkNjk3NzlkNmY5OCJ9',	1393465220),
('informherconfirmation_email_6',	'eyJpdiI6ImFFRjRYQjFMMTNcL28yZ29NeHhoK3RJdFlzV1wvWnIydkliemFKN1dCSlBvdz0iLCJ2YWx1ZSI6Ik9jU1wvR1pRZ1NXaUo5aVwvXC9ER09CUVpBeWd3Y3MxN3V5SFwvOElTQXlPMHo4PSIsIm1hYyI6ImQ3ZmEwZmJlN2ZiNzU1YmQyODk5MmNmZmU2ZjhhNGZkMmNhNmExNmZiMjFjYjlhY2Q4ZmYzZWRmYzE1ZGU4ZmUifQ==',	1393465220);

DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `categories` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1,	'ask',	'Something to ask? Want to be asked? Do it here!',	'2014-02-27 07:40:20',	'2014-02-27 07:40:20'),
(2,	'relate',	'Want to share something? Want to let them know about it? Post it!',	'2014-02-27 07:40:20',	'2014-02-27 07:40:20'),
(3,	'shoutout',	'Abused? In pain? You think you are being left out at work? Report it.',	'2014-02-27 07:40:20',	'2014-02-27 07:40:20');

DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `comments` (`id`, `message`, `user_id`, `post_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1,	'Lorem ipsum dolor sit amet, mutat utinam nonumy ea mel.',	2,	1,	'2014-02-27 07:40:21',	'2014-02-27 07:40:21',	NULL),
(2,	'Lorem ipsum dolor sit amet, sale ceteros liberavisse duo ex, nam mazim maiestatis dissentiunt no. Iusto nominavi cu sed, has.',	1,	1,	'2014-02-27 07:40:21',	'2014-02-27 07:40:21',	NULL),
(3,	'Et consul eirmod feugait mel! Te vix iuvaret feugiat repudiandae. Solet dolore lobortis mei te, saepe habemus imperdiet ex vim. Consequat signiferumque per no, ne pri erant vocibus invidunt te.',	3,	1,	'2014-02-27 07:40:21',	'2014-02-27 07:40:21',	NULL),
(4,	'Lorem ipsum dolor sit amet, mutat utinam nonumy ea mel.',	1,	2,	'2014-02-27 07:40:21',	'2014-02-27 07:40:21',	NULL),
(5,	'Lorem ipsum dolor sit amet, sale ceteros liberavisse duo ex, nam mazim maiestatis dissentiunt no. Iusto nominavi cu sed, has.',	1,	2,	'2014-02-27 07:40:21',	'2014-02-27 07:40:21',	NULL),
(6,	'Lorem ipsum dolor sit amet, mutat utinam nonumy ea mel.',	2,	3,	'2014-02-27 07:40:21',	'2014-02-27 07:40:21',	NULL),
(7,	'Lorem ipsum dolor sit amet, mutat utinam nonumy ea mel.',	3,	2,	'2014-02-27 07:40:21',	'2014-02-27 07:40:21',	NULL),
(8,	'Lorem ipsum dolor sit amet, sale ceteros liberavisse duo ex, nam mazim maiestatis dissentiunt no. Iusto nominavi cu sed, has.',	1,	3,	'2014-02-27 07:40:21',	'2014-02-27 07:40:21',	NULL),
(9,	'Et consul eirmod feugait mel! Te vix iuvaret feugiat repudiandae. Solet dolore lobortis mei te, saepe habemus imperdiet ex vim. Consequat signiferumque per no, ne pri erant vocibus invidunt te.',	4,	4,	'2014-02-27 07:40:21',	'2014-02-27 07:40:21',	NULL),
(10,	'Lorem ipsum dolor sit amet, mutat utinam nonumy ea mel.',	5,	2,	'2014-02-27 07:40:21',	'2014-02-27 07:40:21',	NULL),
(11,	'Lorem ipsum dolor sit amet, sale ceteros liberavisse duo ex, nam mazim maiestatis dissentiunt no. Iusto nominavi cu sed, has.',	2,	2,	'2014-02-27 07:40:22',	'2014-02-27 07:40:22',	NULL),
(12,	'Lorem ipsum dolor sit amet, mutat utinam nonumy ea mel.',	1,	3,	'2014-02-27 07:40:22',	'2014-02-27 07:40:22',	NULL),
(13,	'Asduff!',	1,	1,	'2014-02-28 01:41:26',	'2014-02-28 01:41:26',	NULL),
(14,	'Asduff!',	1,	1,	'2014-02-28 02:12:27',	'2014-02-28 02:12:27',	NULL),
(15,	'Asduff!',	1,	1,	'2014-02-28 02:12:38',	'2014-02-28 02:12:38',	NULL),
(16,	'asdasdasd',	4,	1,	'2014-02-28 04:20:32',	'2014-02-28 04:20:32',	NULL),
(17,	'',	1,	1,	'2014-02-28 06:38:38',	'2014-02-28 06:38:38',	NULL),
(18,	'This is a post by Temotius.',	1,	1,	'2014-02-28 06:56:52',	'2014-02-28 06:56:52',	NULL),
(19,	'Temotius Lives!',	1,	1,	'2014-02-28 07:08:41',	'2014-02-28 07:08:41',	NULL),
(20,	'blaaaarrrrrgh',	1,	1,	'2014-02-28 07:12:54',	'2014-02-28 07:12:54',	NULL),
(21,	'???~!',	1,	1,	'2014-02-28 07:13:57',	'2014-02-28 07:13:57',	NULL),
(22,	'???~!',	1,	1,	'2014-02-28 07:15:26',	'2014-02-28 07:15:26',	NULL),
(23,	'sample@',	4,	2,	'2014-02-28 07:19:22',	'2014-02-28 07:19:22',	NULL),
(24,	'HNNNNGGGGGHHHHH',	1,	1,	'2014-02-28 07:23:29',	'2014-02-28 07:23:29',	NULL),
(25,	'Asduff!',	4,	1,	'2014-02-28 07:23:30',	'2014-02-28 07:23:30',	NULL),
(26,	'Asduff!',	4,	1,	'2014-02-28 07:25:06',	'2014-02-28 07:25:06',	NULL),
(27,	'Sessions.',	1,	1,	'2014-02-28 07:25:57',	'2014-02-28 07:25:57',	NULL),
(28,	'Asduff!',	4,	1,	'2014-02-28 07:27:16',	'2014-02-28 07:27:16',	NULL),
(29,	'Asduff!',	4,	1,	'2014-02-28 07:27:31',	'2014-02-28 07:27:31',	NULL),
(30,	'Asduff!',	4,	1,	'2014-02-28 07:28:04',	'2014-02-28 07:28:04',	NULL),
(31,	'Asduff!',	4,	1,	'2014-02-28 07:32:20',	'2014-02-28 07:32:20',	NULL),
(32,	'WAI YOU SO DEMANDING @Temto-kun????',	4,	1,	'2014-02-28 07:32:53',	'2014-02-28 07:32:53',	NULL),
(33,	'I\'M GOING TO FLOOD YOU WITH THIS COMMENTS. :/',	4,	1,	'2014-02-28 07:33:19',	'2014-02-28 07:33:19',	NULL),
(34,	'Post-uh',	1,	1,	'2014-02-28 07:33:31',	'2014-02-28 07:33:31',	NULL),
(35,	'REFRESH TILL YOU DROP, DEVELOPER - :P',	4,	1,	'2014-02-28 07:33:40',	'2014-02-28 07:33:40',	NULL),
(36,	'Boobies.',	1,	1,	'2014-02-28 07:35:00',	'2014-02-28 07:35:00',	NULL),
(37,	'I liek bacun.',	1,	1,	'2014-02-28 07:35:35',	'2014-02-28 07:35:35',	NULL),
(38,	'Asduff!',	4,	1,	'2014-02-28 07:36:10',	'2014-02-28 07:36:10',	NULL),
(39,	'I can has pantsu',	1,	1,	'2014-02-28 07:36:32',	'2014-02-28 07:36:32',	NULL),
(40,	'Beefcaek!',	1,	1,	'2014-02-28 07:37:16',	'2014-02-28 07:37:16',	NULL),
(41,	'BACON BACON BACON BACON BACON BACON BACON BACON BACON BACON BACON BACON BACON BACON BACON BACON BACON BACON BACON BACON BACON BACON BACON BACON BACON BACON BACON BACON BACON BACON BACON BACON BACON BACON BACON BACON BACON BACON BACON BACON BACON BACON BACON BACON BACON BACON BACON BACON BACON BACON BACON BACON BACON BACON BACON BACON BACON BACON BACON BACON BACON BACON BACON BACON BACON BACON BACON BACON BACON BACON BACON BACON BACON BACON BACON BACON BACON BACON BACON BACON BACON BACON BACON BACON BACON BACON BACON BACON BACON BACON BACON BACON BACON BACON BACON BACON BACON BACON BACON BACON BACON BACON BACON BACON BACON BACON BACON BACON BACON BACON BACON BACON BACON BACON BACON BACON',	1,	1,	'2014-02-28 07:38:30',	'2014-02-28 07:38:30',	NULL),
(42,	'Hello',	1,	1,	'2014-02-28 14:58:32',	'2014-02-28 14:58:32',	NULL),
(43,	'test',	1,	1,	'2014-02-28 16:34:59',	'2014-02-28 16:34:59',	NULL),
(44,	'Blurb',	1,	2,	'2014-02-28 16:35:57',	'2014-02-28 16:35:57',	NULL),
(45,	'I am a friendly ice cream truck.',	1,	2,	'2014-02-28 16:36:40',	'2014-02-28 16:36:40',	NULL),
(46,	'Commentationalisticalificationaritionisapalinozafication.',	1,	3,	'2014-02-28 16:38:24',	'2014-02-28 16:38:24',	NULL),
(47,	'Dolores Haze.',	1,	4,	'2014-02-28 16:39:15',	'2014-02-28 16:39:15',	NULL),
(48,	'Pwede.',	6,	1,	'2014-03-01 05:41:58',	'2014-03-01 05:41:58',	NULL),
(49,	'Yess. with wings if u want!',	6,	6,	'2014-03-01 05:50:42',	'2014-03-01 05:50:42',	NULL),
(50,	'I love bacon so much',	4,	1,	'2014-03-01 12:25:19',	'2014-03-01 12:25:19',	NULL),
(51,	'Hello, world!',	4,	18,	'2014-03-01 20:49:11',	'2014-03-01 20:49:11',	NULL),
(52,	'Hahahaha. Loool',	6,	18,	'2014-03-02 02:14:48',	'2014-03-02 02:14:48',	NULL),
(53,	'',	7,	4,	'2014-03-03 19:45:08',	'2014-03-03 19:45:08',	NULL),
(54,	'',	7,	3,	'2014-03-03 19:50:30',	'2014-03-03 19:50:30',	NULL),
(55,	'Ryrgy',	7,	21,	'2014-03-03 19:52:16',	'2014-03-03 19:52:16',	NULL),
(56,	'Fhfryg',	7,	1,	'2014-03-03 19:52:37',	'2014-03-03 19:52:37',	NULL),
(57,	'Test',	8,	3,	'2014-03-03 20:25:19',	'2014-03-03 20:25:19',	NULL),
(58,	'',	11,	3,	'2014-03-06 10:41:07',	'2014-03-06 10:41:07',	NULL),
(59,	'Yctchvhjbbkninknkbuvyc',	10,	4,	'2014-03-06 10:41:53',	'2014-03-06 10:41:53',	NULL),
(60,	'This is the app. Yo.',	4,	3,	'2014-03-07 16:45:06',	'2014-03-07 16:45:06',	NULL),
(61,	'Asduff!',	5,	1,	'2014-03-09 14:20:28',	'2014-03-09 14:20:28',	NULL),
(62,	'Cheeses cries.',	5,	1,	'2014-03-09 14:22:16',	'2014-03-09 14:22:16',	NULL),
(63,	'',	5,	1,	'2014-03-09 14:24:10',	'2014-03-09 14:24:10',	NULL),
(64,	'',	5,	1,	'2014-03-09 14:25:43',	'2014-03-09 14:25:43',	NULL),
(65,	'Hurr hurr hurr.',	5,	1,	'2014-03-09 14:27:52',	'2014-03-09 14:27:52',	NULL),
(66,	'Oh, pies.',	5,	1,	'2014-03-09 14:28:04',	'2014-03-09 14:28:04',	NULL);

DROP TABLE IF EXISTS `likes`;
CREATE TABLE `likes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `likeable_id` int(10) unsigned NOT NULL,
  `likeable_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `likes_user_id_foreign` (`user_id`),
  CONSTRAINT `likes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `likes` (`id`, `user_id`, `likeable_id`, `likeable_type`, `created_at`, `updated_at`) VALUES
(2,	1,	2,	'post',	'2014-02-27 07:40:22',	'2014-02-27 07:40:22'),
(3,	1,	1,	'comment',	'2014-02-27 07:40:22',	'2014-02-27 07:40:22'),
(4,	2,	1,	'post',	'2014-02-27 07:40:22',	'2014-02-27 07:40:22'),
(5,	2,	3,	'post',	'2014-02-27 07:40:22',	'2014-02-27 07:40:22'),
(6,	2,	3,	'comment',	'2014-02-27 07:40:22',	'2014-02-27 07:40:22'),
(7,	3,	1,	'comment',	'2014-02-27 07:40:22',	'2014-02-27 07:40:22'),
(8,	3,	2,	'post',	'2014-02-27 07:40:22',	'2014-02-27 07:40:22'),
(9,	3,	3,	'post',	'2014-02-27 07:40:22',	'2014-02-27 07:40:22'),
(14,	4,	4,	'Comment',	'2014-02-28 11:30:34',	'2014-02-28 11:30:34'),
(15,	1,	1,	'Post',	'2014-02-28 15:09:01',	'2014-02-28 15:09:01'),
(16,	4,	2,	'Post',	'2014-03-01 04:55:50',	'2014-03-01 04:55:50'),
(17,	4,	1,	'Post',	'2014-03-01 04:56:12',	'2014-03-01 04:56:12'),
(20,	4,	18,	'Post',	'2014-03-01 20:48:55',	'2014-03-01 20:48:55'),
(23,	6,	18,	'Post',	'2014-03-02 02:15:00',	'2014-03-02 02:15:00'),
(26,	8,	57,	'Comment',	'2014-03-03 20:25:26',	'2014-03-03 20:25:26'),
(30,	8,	4,	'Post',	'2014-03-03 20:36:09',	'2014-03-03 20:36:09'),
(31,	11,	5,	'Post',	'2014-03-06 10:40:31',	'2014-03-06 10:40:31'),
(32,	4,	4,	'Post',	'2014-03-07 16:41:28',	'2014-03-07 16:41:28'),
(33,	4,	60,	'Comment',	'2014-03-07 16:45:11',	'2014-03-07 16:45:11'),
(34,	5,	1,	'Post',	'2014-03-08 09:04:14',	'2014-03-08 09:04:14'),
(37,	6,	9,	'Comment',	'2014-03-09 00:29:11',	'2014-03-09 00:29:11');

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `migrations` (`migration`, `batch`) VALUES
('2014_01_01_170206_create_tables',	1);

DROP TABLE IF EXISTS `password_reminders`;
CREATE TABLE `password_reminders` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  KEY `password_reminders_email_index` (`email`),
  KEY `password_reminders_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `permission_role`;
CREATE TABLE `permission_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `permission_role_permission_id_foreign` (`permission_id`),
  KEY `permission_role_role_id_foreign` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`),
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `posts` (`id`, `title`, `content`, `geolocation`, `srclink`, `user_id`, `category_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1,	'Is it normal for women to submit to men?',	'To make your document look professionally produced, Word provides header, footer, cover page, and text box designs that complement each other. For example, you can add a matching cover page, header, and sidebar.\n\nEDIT: Pantsu.',	NULL,	NULL,	5,	1,	'2014-02-27 07:40:21',	'2014-03-08 10:18:23',	NULL),
(2,	'Is it alright to ask a question here?',	'To make your document look professionally produced, Word provides header, footer, cover page, and text box designs that complement each other. For example, you can add a matching cover page, header, and sidebar.',	NULL,	NULL,	2,	1,	'2014-02-27 07:40:21',	'2014-02-27 07:40:21',	NULL),
(3,	'I am a Doctor. Ask me anything',	'To make your document look professionally produced, Word provides header, footer, cover page, and text box designs that complement each other. For example, you can add a matching cover page, header, and sidebar.',	NULL,	NULL,	1,	1,	'2014-02-27 07:40:21',	'2014-02-27 07:40:21',	NULL),
(4,	'I am a Teacher. Ask me anything',	'To make your document look professionally produced, Word provides header, footer, cover page, and text box designs that complement each other. For example, you can add a matching cover page, header, and sidebar.',	NULL,	NULL,	2,	2,	'2014-02-27 07:40:21',	'2014-02-27 07:40:21',	NULL),
(5,	'I am a Soldier. Ask me anything',	'To make your document look professionally produced, Word provides header, footer, cover page, and text box designs that complement each other. For example, you can add a matching cover page, header, and sidebar.',	NULL,	NULL,	3,	2,	'2014-02-27 07:40:21',	'2014-02-27 07:40:21',	NULL),
(6,	'Can I has extra napkinz?',	'I has the menstrueishunzz.',	NULL,	NULL,	1,	1,	'2014-02-28 11:49:08',	'2014-02-28 11:49:08',	NULL),
(7,	'Can I has extra napkinz?',	'I has the menstrueishunzz. Rly nao.',	NULL,	NULL,	1,	2,	'2014-02-28 15:18:14',	'2014-02-28 15:18:14',	NULL),
(8,	'Can I has extra hotdawgz?',	'I has the sechs.',	NULL,	NULL,	1,	2,	'2014-02-28 15:20:42',	'2014-02-28 15:20:42',	NULL),
(9,	'Can I has extra napkinz?',	'I has the menstrueishunzz.',	NULL,	NULL,	1,	1,	'2014-02-28 15:21:20',	'2014-02-28 15:21:20',	NULL),
(10,	'',	'',	NULL,	NULL,	4,	3,	'2014-03-01 04:52:54',	'2014-03-01 04:52:54',	NULL),
(11,	'Hello, World',	'Hi!',	NULL,	NULL,	4,	2,	'2014-03-01 04:53:25',	'2014-03-01 04:53:25',	NULL),
(12,	'',	'',	NULL,	NULL,	4,	1,	'2014-03-01 05:09:38',	'2014-03-01 05:09:38',	NULL),
(13,	'hahaha.',	'I dont know what to say',	NULL,	NULL,	6,	1,	'2014-03-01 05:37:55',	'2014-03-01 05:37:55',	NULL),
(14,	'',	'',	NULL,	NULL,	6,	3,	'2014-03-01 05:59:05',	'2014-03-01 05:59:05',	NULL),
(15,	'postthis isa nue l',	'Asduffffzxcvnn',	NULL,	NULL,	6,	1,	'2014-03-01 06:00:16',	'2014-03-01 06:00:16',	NULL),
(16,	'postthis isa nue l',	'Asduffffzxcvnn',	NULL,	NULL,	6,	1,	'2014-03-01 06:00:37',	'2014-03-01 06:00:37',	NULL),
(17,	'this is a nue powst',	'Asduffffzxcvnn',	NULL,	NULL,	6,	2,	'2014-03-01 06:01:35',	'2014-03-01 06:01:35',	NULL),
(18,	'THIS IS OKAY',	'NOT REALLY',	NULL,	NULL,	4,	1,	'2014-03-01 20:48:32',	'2014-03-01 20:48:32',	NULL),
(19,	'',	'',	NULL,	NULL,	7,	3,	'2014-03-03 19:42:49',	'2014-03-03 19:42:49',	NULL),
(20,	'',	'',	NULL,	NULL,	7,	3,	'2014-03-03 19:42:50',	'2014-03-03 19:42:50',	NULL),
(21,	'dugjettethr',	'Geyeyeeyeyey',	NULL,	NULL,	7,	1,	'2014-03-03 19:49:40',	'2014-03-03 19:49:40',	NULL),
(22,	'',	'',	NULL,	NULL,	8,	3,	'2014-03-03 20:27:04',	'2014-03-03 20:27:04',	NULL),
(23,	'',	'',	NULL,	NULL,	8,	3,	'2014-03-03 20:27:06',	'2014-03-03 20:27:06',	NULL),
(24,	'',	'',	NULL,	NULL,	8,	3,	'2014-03-03 20:35:36',	'2014-03-03 20:35:36',	NULL),
(25,	'test',	'?..q',	NULL,	NULL,	8,	1,	'2014-03-03 20:36:53',	'2014-03-03 20:36:53',	NULL),
(26,	'This is an awesome post',	'Haaaaar!!!!',	NULL,	NULL,	4,	1,	'2014-03-07 17:04:56',	'2014-03-07 17:04:56',	NULL),
(27,	'I liek bacun so much',	'I culd eat a kitteh for bacun',	NULL,	NULL,	5,	1,	'2014-03-07 17:11:29',	'2014-03-07 17:11:29',	NULL),
(28,	'oyeah',	'Awesome!!!!!',	NULL,	NULL,	4,	1,	'2014-03-07 19:00:58',	'2014-03-07 19:00:58',	NULL),
(29,	'Bakit po ba masakit?',	'Napakasakit, pero masarap.',	NULL,	NULL,	5,	1,	'2014-03-08 08:58:52',	'2014-03-08 08:58:52',	NULL),
(30,	'bacun',	'Post.',	NULL,	NULL,	5,	1,	'2014-03-08 10:18:54',	'2014-03-08 10:18:54',	NULL),
(31,	'Relate',	'hurr',	NULL,	NULL,	5,	2,	'2014-03-08 10:20:25',	'2014-03-08 10:20:25',	NULL),
(32,	'Does caching really work?',	'Yes, it does work.',	NULL,	NULL,	5,	1,	'2014-03-08 18:14:37',	'2014-03-08 18:14:37',	NULL),
(33,	'Do you even caching?',	'Yes, Teitoku~!',	NULL,	NULL,	5,	2,	'2014-03-08 18:28:01',	'2014-03-08 18:28:01',	NULL);

DROP TABLE IF EXISTS `post_tags`;
CREATE TABLE `post_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` int(10) unsigned NOT NULL,
  `tag_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `post_tags_post_id_foreign` (`post_id`),
  KEY `post_tags_tag_id_foreign` (`tag_id`),
  CONSTRAINT `post_tags_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`),
  CONSTRAINT `post_tags_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `post_tags` (`id`, `post_id`, `tag_id`) VALUES
(1,	1,	1),
(2,	1,	2),
(3,	2,	5),
(4,	3,	2),
(5,	4,	3),
(6,	5,	6),
(7,	6,	1),
(8,	6,	2),
(9,	6,	7),
(10,	6,	5),
(11,	7,	1),
(12,	7,	2),
(13,	7,	7),
(14,	7,	5),
(15,	8,	1),
(16,	8,	2),
(17,	8,	7),
(18,	8,	5),
(19,	9,	1),
(20,	9,	2),
(21,	9,	7),
(22,	9,	5),
(23,	10,	4),
(24,	10,	2),
(25,	10,	5),
(26,	11,	1),
(27,	11,	4),
(28,	11,	2),
(29,	11,	5),
(30,	12,	4),
(31,	12,	2),
(32,	13,	1),
(33,	13,	4),
(34,	14,	3),
(35,	15,	3),
(36,	15,	4),
(37,	15,	2),
(38,	16,	3),
(39,	16,	4),
(40,	16,	2),
(41,	17,	3),
(42,	17,	4),
(43,	17,	2),
(44,	18,	1),
(45,	18,	5),
(46,	19,	1),
(47,	19,	2),
(48,	20,	1),
(49,	20,	2),
(50,	21,	1),
(51,	21,	2),
(52,	22,	2),
(53,	22,	7),
(54,	23,	2),
(55,	23,	7),
(56,	24,	4),
(57,	24,	7),
(58,	25,	1),
(59,	26,	3),
(60,	26,	1),
(61,	26,	4),
(62,	26,	2),
(63,	26,	7),
(64,	26,	5),
(65,	27,	3),
(66,	27,	1),
(67,	27,	7),
(68,	28,	1),
(69,	29,	2),
(70,	29,	7),
(71,	30,	1),
(72,	30,	7),
(73,	31,	7),
(74,	32,	5),
(75,	33,	7);

DROP TABLE IF EXISTS `profiles`;
CREATE TABLE `profiles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `avatar_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `profiles` (`id`, `avatar_url`, `badge`, `twt_handle`, `facebook_username`, `bio`, `hompage_url`, `user_id`, `created_at`, `updated_at`) VALUES
(1,	'https://secure.gravatar.com/avatar/b86d0f31ca3e556c9e4809c4a8723fbe?s=80&amp;r=g&amp;d=identicon',	'The First User',	'ecchi-san',	'ecchi-san',	'This is the first User. Name was taken from the Japanese word for \'one\'',	'http://ecchi-san.com',	1,	'2014-02-27 07:40:23',	'2014-02-28 16:26:04'),
(2,	'https://secure.gravatar.com/avatar/fabe04b0ebf26d5e9bd05a504778f382?s=80&amp;r=g&amp;d=identicon',	'The Second User',	'ni-kun',	'ni-kun',	'This is the second user. Name was taken from the Japanese word for \'two\'',	'http://ni-kun.com',	2,	'2014-02-27 07:40:23',	'2014-02-27 07:40:23'),
(3,	'https://secure.gravatar.com/avatar/df4aae0f6c2b678e71ae071a589eceac?s=80&amp;r=g&amp;d=identicon',	'The Third User',	'san-kun',	'san-kun',	'This is the third user. Name was taken from the Japanese word for \'three\'',	'http://san-kun.com',	3,	'2014-02-27 07:40:23',	'2014-02-27 07:40:23'),
(4,	'https://secure.gravatar.com/avatar/ca1c39e23e366a3db249c0c3c5a24331?s=80&amp;r=g&amp;d=identicon',	'Mark Jayson',	'the_dead_poetic',	'existencemodulus',	'I\'m the one responsible for the API. It\'s hard. Don\'t try it at home.',	'http://iamexistent.wordpress.com',	4,	'2014-02-27 07:40:23',	'2014-02-27 07:40:23'),
(5,	'https://secure.gravatar.com/avatar/1c423587890936228f560d7fcc5a3104?s=80&amp;r=g&amp;d=identicon',	'Allan',	'temotoKun',	'theoryofnekomata',	'The front-end is his accident of a creation. In HTML5. Purely web technologies. Purely.',	'http://nihilist-philanthropy.uni.me',	5,	'2014-02-27 07:40:23',	'2014-03-08 13:43:14'),
(6,	'https://secure.gravatar.com/avatar/1b8bfc3fc5136a60bce50c81afb3dc3d?s=80&amp;r=g&amp;d=identicon',	'Jeremiah',	'engJEHneer',	'jeremiah.tabing',	'Actually an electronics expert - deals with PR, profitability, graphics, business rules. Really.',	'http://facebook.com/jeremiah.tabing',	6,	'2014-02-27 07:40:23',	'2014-02-27 07:40:23'),
(12,	'https://secure.gravatar.com/avatar/b86d0f31ca3e556c9e4809c4a8723fbe?s=80&amp;r=g&amp;d=identicon',	NULL,	NULL,	NULL,	NULL,	NULL,	7,	'2014-03-03 19:40:17',	'2014-03-03 19:40:17'),
(13,	'https://secure.gravatar.com/avatar/b86d0f31ca3e556c9e4809c4a8723fbe?s=80&amp;r=g&amp;d=identicon',	NULL,	NULL,	NULL,	NULL,	NULL,	8,	'2014-03-03 20:19:55',	'2014-03-03 20:19:55'),
(14,	'https://secure.gravatar.com/avatar/b86d0f31ca3e556c9e4809c4a8723fbe?s=80&amp;r=g&amp;d=identicon',	NULL,	NULL,	NULL,	NULL,	NULL,	9,	'2014-03-04 08:31:10',	'2014-03-04 08:31:10'),
(15,	'https://secure.gravatar.com/avatar/b86d0f31ca3e556c9e4809c4a8723fbe?s=80&amp;r=g&amp;d=identicon',	NULL,	NULL,	NULL,	NULL,	NULL,	10,	'2014-03-06 10:36:07',	'2014-03-06 10:36:07'),
(16,	'https://secure.gravatar.com/avatar/b86d0f31ca3e556c9e4809c4a8723fbe?s=80&amp;r=g&amp;d=identicon',	NULL,	NULL,	NULL,	NULL,	NULL,	11,	'2014-03-06 10:36:46',	'2014-03-06 10:36:46'),
(17,	'https://secure.gravatar.com/avatar/b86d0f31ca3e556c9e4809c4a8723fbe?s=80&amp;r=g&amp;d=identicon',	NULL,	NULL,	NULL,	NULL,	NULL,	12,	'2014-03-06 10:42:23',	'2014-03-06 10:42:23'),
(18,	'https://secure.gravatar.com/avatar/b86d0f31ca3e556c9e4809c4a8723fbe?s=80&amp;r=g&amp;d=identicon',	NULL,	NULL,	NULL,	NULL,	NULL,	13,	'2014-03-06 10:43:05',	'2014-03-06 10:43:05'),
(19,	'https://secure.gravatar.com/avatar/b86d0f31ca3e556c9e4809c4a8723fbe?s=80&amp;r=g&amp;d=identicon',	NULL,	NULL,	NULL,	NULL,	NULL,	14,	'2014-03-06 10:43:27',	'2014-03-06 10:43:27'),
(20,	'https://secure.gravatar.com/avatar/b86d0f31ca3e556c9e4809c4a8723fbe?s=80&amp;r=g&amp;d=identicon',	NULL,	NULL,	NULL,	NULL,	NULL,	15,	'2014-03-06 18:09:31',	'2014-03-06 18:09:31'),
(21,	'https://secure.gravatar.com/avatar/b86d0f31ca3e556c9e4809c4a8723fbe?s=80&amp;r=g&amp;d=identicon',	NULL,	NULL,	NULL,	NULL,	NULL,	16,	'2014-03-07 10:33:01',	'2014-03-07 10:33:01'),
(22,	'https://secure.gravatar.com/avatar/b86d0f31ca3e556c9e4809c4a8723fbe?s=80&amp;r=g&amp;d=identicon',	NULL,	NULL,	NULL,	NULL,	NULL,	17,	'2014-03-07 10:34:01',	'2014-03-07 10:34:01'),
(23,	'https://secure.gravatar.com/avatar/b86d0f31ca3e556c9e4809c4a8723fbe?s=80&amp;r=g&amp;d=identicon',	NULL,	NULL,	NULL,	NULL,	NULL,	18,	'2014-03-07 10:57:34',	'2014-03-07 10:57:34'),
(24,	'https://secure.gravatar.com/avatar/7744121b293cc3cd96ff7ff0c16d4785?s=80&amp;r=g&amp;d=identicon',	NULL,	NULL,	NULL,	NULL,	NULL,	19,	'2014-03-07 11:57:10',	'2014-03-07 11:57:10'),
(25,	'https://secure.gravatar.com/avatar/f3763de0c886febaa70b49ac252497f7?s=80&amp;r=g&amp;d=identicon',	NULL,	NULL,	NULL,	NULL,	NULL,	20,	'2014-03-07 19:06:03',	'2014-03-07 19:06:03');

DROP TABLE IF EXISTS `properties`;
CREATE TABLE `properties` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `properties` (`id`, `is_shown`, `is_featured`, `last_modified_by`, `properties_id`, `properties_type`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1,	1,	1,	'awkwardusername',	1,	'post',	'2014-02-27 07:40:23',	'2014-02-27 07:40:23',	NULL),
(2,	1,	0,	'awkwardusername',	2,	'post',	'2014-02-27 07:40:23',	'2014-02-27 07:40:23',	NULL),
(3,	1,	0,	'awkwardusername',	3,	'post',	'2014-02-27 07:40:23',	'2014-02-27 07:40:23',	NULL),
(4,	1,	1,	'awkwardusername',	4,	'post',	'2014-02-27 07:40:23',	'2014-02-27 07:40:23',	NULL),
(5,	1,	0,	'awkwardusername',	5,	'post',	'2014-02-27 07:40:24',	'2014-02-27 07:40:24',	NULL),
(6,	1,	0,	'awkwardusername',	1,	'comment',	'2014-02-27 07:40:24',	'2014-02-27 07:40:24',	NULL),
(7,	1,	0,	'awkwardusername',	2,	'comment',	'2014-02-27 07:40:24',	'2014-02-27 07:40:24',	NULL),
(8,	1,	0,	'awkwardusername',	3,	'comment',	'2014-02-27 07:40:24',	'2014-02-27 07:40:24',	NULL),
(9,	1,	0,	'awkwardusername',	4,	'comment',	'2014-02-27 07:40:24',	'2014-02-27 07:40:24',	NULL),
(10,	1,	0,	'awkwardusername',	5,	'comment',	'2014-02-27 07:40:24',	'2014-02-27 07:40:24',	NULL),
(11,	1,	0,	'awkwardusername',	6,	'comment',	'2014-02-27 07:40:24',	'2014-02-27 07:40:24',	NULL),
(12,	1,	1,	'awkwardusername',	7,	'comment',	'2014-02-27 07:40:24',	'2014-02-27 07:40:24',	NULL),
(13,	1,	0,	'awkwardusername',	8,	'comment',	'2014-02-27 07:40:24',	'2014-02-27 07:40:24',	NULL),
(14,	1,	0,	'awkwardusername',	9,	'comment',	'2014-02-27 07:40:24',	'2014-02-27 07:40:24',	NULL),
(15,	1,	0,	'awkwardusername',	10,	'comment',	'2014-02-27 07:40:24',	'2014-02-27 07:40:24',	NULL),
(16,	1,	1,	'awkwardusername',	11,	'comment',	'2014-02-27 07:40:24',	'2014-02-27 07:40:24',	NULL),
(17,	1,	0,	'awkwardusername',	12,	'comment',	'2014-02-27 07:40:24',	'2014-02-27 07:40:24',	NULL),
(18,	1,	0,	NULL,	13,	'Comment',	'2014-02-28 01:41:26',	'2014-02-28 01:41:26',	NULL),
(19,	1,	0,	NULL,	14,	'Comment',	'2014-02-28 02:12:28',	'2014-02-28 02:12:28',	NULL),
(20,	1,	0,	NULL,	15,	'Comment',	'2014-02-28 02:12:39',	'2014-02-28 02:12:39',	NULL),
(21,	1,	0,	NULL,	16,	'Comment',	'2014-02-28 04:20:32',	'2014-02-28 04:20:32',	NULL),
(22,	1,	0,	NULL,	17,	'Comment',	'2014-02-28 06:38:38',	'2014-02-28 06:38:38',	NULL),
(23,	1,	0,	NULL,	18,	'Comment',	'2014-02-28 06:56:52',	'2014-02-28 06:56:52',	NULL),
(24,	1,	0,	NULL,	19,	'Comment',	'2014-02-28 07:08:41',	'2014-02-28 07:08:41',	NULL),
(25,	1,	0,	NULL,	20,	'Comment',	'2014-02-28 07:12:54',	'2014-02-28 07:12:54',	NULL),
(26,	1,	0,	NULL,	21,	'Comment',	'2014-02-28 07:13:57',	'2014-02-28 07:13:57',	NULL),
(27,	1,	0,	NULL,	22,	'Comment',	'2014-02-28 07:15:26',	'2014-02-28 07:15:26',	NULL),
(28,	1,	0,	NULL,	23,	'Comment',	'2014-02-28 07:19:23',	'2014-02-28 07:19:23',	NULL),
(29,	1,	0,	NULL,	24,	'Comment',	'2014-02-28 07:23:29',	'2014-02-28 07:23:29',	NULL),
(30,	1,	0,	NULL,	25,	'Comment',	'2014-02-28 07:23:30',	'2014-02-28 07:23:30',	NULL),
(31,	1,	0,	NULL,	26,	'Comment',	'2014-02-28 07:25:06',	'2014-02-28 07:25:06',	NULL),
(32,	1,	0,	NULL,	27,	'Comment',	'2014-02-28 07:25:57',	'2014-02-28 07:25:57',	NULL),
(33,	1,	0,	NULL,	28,	'Comment',	'2014-02-28 07:27:16',	'2014-02-28 07:27:16',	NULL),
(34,	1,	0,	NULL,	29,	'Comment',	'2014-02-28 07:27:31',	'2014-02-28 07:27:31',	NULL),
(35,	1,	0,	NULL,	30,	'Comment',	'2014-02-28 07:28:04',	'2014-02-28 07:28:04',	NULL),
(36,	1,	0,	NULL,	31,	'Comment',	'2014-02-28 07:32:20',	'2014-02-28 07:32:20',	NULL),
(37,	1,	0,	NULL,	32,	'Comment',	'2014-02-28 07:32:53',	'2014-02-28 07:32:53',	NULL),
(38,	1,	0,	NULL,	33,	'Comment',	'2014-02-28 07:33:19',	'2014-02-28 07:33:19',	NULL),
(39,	1,	0,	NULL,	34,	'Comment',	'2014-02-28 07:33:31',	'2014-02-28 07:33:31',	NULL),
(40,	1,	0,	NULL,	35,	'Comment',	'2014-02-28 07:33:40',	'2014-02-28 07:33:40',	NULL),
(41,	1,	0,	NULL,	36,	'Comment',	'2014-02-28 07:35:00',	'2014-02-28 07:35:00',	NULL),
(42,	1,	0,	NULL,	37,	'Comment',	'2014-02-28 07:35:35',	'2014-02-28 07:35:35',	NULL),
(43,	1,	0,	NULL,	38,	'Comment',	'2014-02-28 07:36:10',	'2014-02-28 07:36:10',	NULL),
(44,	1,	0,	NULL,	39,	'Comment',	'2014-02-28 07:36:32',	'2014-02-28 07:36:32',	NULL),
(45,	1,	0,	NULL,	40,	'Comment',	'2014-02-28 07:37:16',	'2014-02-28 07:37:16',	NULL),
(46,	1,	0,	NULL,	41,	'Comment',	'2014-02-28 07:38:30',	'2014-02-28 07:38:30',	NULL),
(47,	0,	0,	NULL,	6,	'Post',	'2014-02-28 11:49:08',	'2014-02-28 11:49:08',	NULL),
(48,	1,	0,	NULL,	42,	'Comment',	'2014-02-28 14:58:32',	'2014-02-28 14:58:32',	NULL),
(49,	0,	0,	NULL,	7,	'Post',	'2014-02-28 15:18:15',	'2014-02-28 15:18:15',	NULL),
(50,	0,	0,	NULL,	8,	'Post',	'2014-02-28 15:20:42',	'2014-02-28 15:20:42',	NULL),
(51,	0,	0,	NULL,	9,	'Post',	'2014-02-28 15:21:21',	'2014-02-28 15:21:21',	NULL),
(52,	1,	0,	NULL,	43,	'Comment',	'2014-02-28 16:34:59',	'2014-02-28 16:34:59',	NULL),
(53,	1,	0,	NULL,	44,	'Comment',	'2014-02-28 16:35:57',	'2014-02-28 16:35:57',	NULL),
(54,	1,	0,	NULL,	45,	'Comment',	'2014-02-28 16:36:41',	'2014-02-28 16:36:41',	NULL),
(55,	1,	0,	NULL,	46,	'Comment',	'2014-02-28 16:38:24',	'2014-02-28 16:38:24',	NULL),
(56,	1,	0,	NULL,	47,	'Comment',	'2014-02-28 16:39:15',	'2014-02-28 16:39:15',	NULL),
(57,	0,	0,	NULL,	10,	'Post',	'2014-03-01 04:52:54',	'2014-03-01 04:52:54',	NULL),
(58,	0,	0,	NULL,	11,	'Post',	'2014-03-01 04:53:25',	'2014-03-01 04:53:25',	NULL),
(59,	0,	0,	NULL,	12,	'Post',	'2014-03-01 05:09:38',	'2014-03-01 05:09:38',	NULL),
(60,	0,	0,	NULL,	13,	'Post',	'2014-03-01 05:37:55',	'2014-03-01 05:37:55',	NULL),
(61,	1,	0,	NULL,	48,	'Comment',	'2014-03-01 05:41:58',	'2014-03-01 05:41:58',	NULL),
(62,	1,	0,	NULL,	49,	'Comment',	'2014-03-01 05:50:42',	'2014-03-01 05:50:42',	NULL),
(63,	0,	0,	NULL,	14,	'Post',	'2014-03-01 05:59:05',	'2014-03-01 05:59:05',	NULL),
(64,	0,	0,	NULL,	15,	'Post',	'2014-03-01 06:00:17',	'2014-03-01 06:00:17',	NULL),
(65,	0,	0,	NULL,	16,	'Post',	'2014-03-01 06:00:38',	'2014-03-01 06:00:38',	NULL),
(66,	0,	0,	NULL,	17,	'Post',	'2014-03-01 06:01:35',	'2014-03-01 06:01:35',	NULL),
(67,	1,	0,	NULL,	50,	'Comment',	'2014-03-01 12:25:19',	'2014-03-01 12:25:19',	NULL),
(68,	1,	0,	NULL,	18,	'Post',	'2014-03-01 20:48:33',	'2014-03-01 20:48:33',	NULL),
(69,	1,	0,	NULL,	51,	'Comment',	'2014-03-01 20:49:11',	'2014-03-01 20:49:11',	NULL),
(70,	1,	0,	NULL,	52,	'Comment',	'2014-03-02 02:14:48',	'2014-03-02 02:14:48',	NULL),
(71,	1,	0,	NULL,	19,	'Post',	'2014-03-03 19:42:50',	'2014-03-03 19:42:50',	NULL),
(72,	1,	0,	NULL,	20,	'Post',	'2014-03-03 19:42:51',	'2014-03-03 19:42:51',	NULL),
(73,	1,	0,	NULL,	53,	'Comment',	'2014-03-03 19:45:08',	'2014-03-03 19:45:08',	NULL),
(74,	1,	0,	NULL,	21,	'Post',	'2014-03-03 19:49:40',	'2014-03-03 19:49:40',	NULL),
(75,	1,	0,	NULL,	54,	'Comment',	'2014-03-03 19:50:30',	'2014-03-03 19:50:30',	NULL),
(76,	1,	0,	NULL,	55,	'Comment',	'2014-03-03 19:52:16',	'2014-03-03 19:52:16',	NULL),
(77,	1,	0,	NULL,	56,	'Comment',	'2014-03-03 19:52:37',	'2014-03-03 19:52:37',	NULL),
(78,	1,	0,	NULL,	57,	'Comment',	'2014-03-03 20:25:19',	'2014-03-03 20:25:19',	NULL),
(79,	1,	0,	NULL,	22,	'Post',	'2014-03-03 20:27:05',	'2014-03-03 20:27:05',	NULL),
(80,	1,	0,	NULL,	23,	'Post',	'2014-03-03 20:27:06',	'2014-03-03 20:27:06',	NULL),
(81,	1,	0,	NULL,	24,	'Post',	'2014-03-03 20:35:37',	'2014-03-03 20:35:37',	NULL),
(82,	1,	0,	NULL,	25,	'Post',	'2014-03-03 20:36:53',	'2014-03-03 20:36:53',	NULL),
(83,	1,	0,	NULL,	58,	'Comment',	'2014-03-06 10:41:07',	'2014-03-06 10:41:07',	NULL),
(84,	1,	0,	NULL,	59,	'Comment',	'2014-03-06 10:41:53',	'2014-03-06 10:41:53',	NULL),
(85,	1,	0,	NULL,	60,	'Comment',	'2014-03-07 16:45:06',	'2014-03-07 16:45:06',	NULL),
(86,	1,	0,	NULL,	26,	'Post',	'2014-03-07 17:04:57',	'2014-03-07 17:04:57',	NULL),
(87,	1,	0,	NULL,	27,	'Post',	'2014-03-07 17:11:29',	'2014-03-07 17:11:29',	NULL),
(88,	1,	0,	NULL,	28,	'Post',	'2014-03-07 19:00:58',	'2014-03-07 19:00:58',	NULL),
(89,	1,	0,	NULL,	29,	'Post',	'2014-03-08 08:58:52',	'2014-03-08 08:58:52',	NULL),
(90,	1,	0,	NULL,	30,	'Post',	'2014-03-08 10:18:54',	'2014-03-08 10:18:54',	NULL),
(91,	1,	0,	NULL,	31,	'Post',	'2014-03-08 10:20:25',	'2014-03-08 10:20:25',	NULL),
(92,	1,	0,	NULL,	32,	'Post',	'2014-03-08 18:14:37',	'2014-03-08 18:14:37',	NULL),
(93,	1,	0,	NULL,	33,	'Post',	'2014-03-08 18:28:01',	'2014-03-08 18:28:01',	NULL),
(94,	1,	0,	NULL,	61,	'Comment',	'2014-03-09 14:20:28',	'2014-03-09 14:20:28',	NULL),
(95,	1,	0,	NULL,	62,	'Comment',	'2014-03-09 14:22:16',	'2014-03-09 14:22:16',	NULL),
(96,	1,	0,	NULL,	63,	'Comment',	'2014-03-09 14:24:10',	'2014-03-09 14:24:10',	NULL),
(97,	1,	0,	NULL,	64,	'Comment',	'2014-03-09 14:25:43',	'2014-03-09 14:25:43',	NULL),
(98,	1,	0,	NULL,	65,	'Comment',	'2014-03-09 14:27:52',	'2014-03-09 14:27:52',	NULL),
(99,	1,	0,	NULL,	66,	'Comment',	'2014-03-09 14:28:04',	'2014-03-09 14:28:04',	NULL);

DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `roles` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1,	'User',	'Ordinary User',	'2014-02-27 07:40:22',	'2014-02-27 07:40:22'),
(2,	'Expert',	'Able to post in #Relate',	'2014-02-27 07:40:22',	'2014-02-27 07:40:22'),
(3,	'Response',	'Able to see posts in #Shoutout',	'2014-02-27 07:40:22',	'2014-02-27 07:40:22'),
(4,	'Moderator',	'Can approve of posts in #Ask.',	'2014-02-27 07:40:22',	'2014-02-27 07:40:22'),
(5,	'Administrator',	'The administrator who can do everything.',	'2014-02-27 07:40:22',	'2014-02-27 07:40:22'),
(6,	'Banned',	'Banned',	'2014-02-27 07:40:22',	'2014-02-27 07:40:22');

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payload` text COLLATE utf8_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL,
  UNIQUE KEY `sessions_id_unique` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `tags`;
CREATE TABLE `tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tagname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `tags_tagname_unique` (`tagname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `tags` (`id`, `tagname`, `created_at`, `updated_at`) VALUES
(1,	'education',	'2014-02-27 07:40:21',	'2014-02-27 07:40:21'),
(2,	'health',	'2014-02-27 07:40:21',	'2014-02-27 07:40:21'),
(3,	'abuse',	'2014-02-27 07:40:21',	'2014-02-27 07:40:21'),
(4,	'government',	'2014-02-27 07:40:21',	'2014-02-27 07:40:21'),
(5,	'news',	'2014-02-27 07:40:21',	'2014-02-27 07:40:21'),
(6,	'InformHer: Bug',	'2014-02-27 07:40:21',	'2014-02-27 07:40:21'),
(7,	'moe',	'2014-02-28 08:32:04',	'2014-02-28 08:32:04');

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `users` (`id`, `username`, `password`, `email`, `confirmation_code`, `confirmed`, `created_at`, `updated_at`) VALUES
(1,	'ichi-san',	'$2y$10$24KNlvOPUBsR6j6JxTNVEO8l9oPXLzNqTaS3oWFsfWFCJaKfRhtSq',	'ichi-san@informher.com',	'6e133bdd567ad968142dd96be1438bbf',	0,	'2014-02-27 07:40:19',	'2014-02-27 07:40:19'),
(2,	'ni-kun',	'$2y$10$e44.F5TU3Z2o6wNIMXPdCuvbOZoUictn17I.q6WuyKxpP/LiS4G4u',	'ni-kun@informher.com',	'618f7302ab8d62c0bcc0418952d5d303',	0,	'2014-02-27 07:40:20',	'2014-02-27 07:40:20'),
(3,	'san-kun',	'$2y$10$gQ9ae3UT/CiO2ulbLlnm3uGEhHaI/W/IqGOhX6fiQ2l7rZAVs6iUK',	'san-kun@informher.com',	'dcfe03131f011a08f5286ca530b54bda',	0,	'2014-02-27 07:40:20',	'2014-02-27 07:40:20'),
(4,	'awkwardusername',	'$2y$10$.cnexRux4/6Fsx9F9dxVruvB.obrH7pbfDF9x5l60Yl.45qSwOYcS',	'markjayson.fuentes@outlook.com',	'1a7d1556611d8df6ea732ed8192470a2',	0,	'2014-02-27 07:40:20',	'2014-02-27 07:40:20'),
(5,	'Temoto-kun',	'$2y$10$Bzwhqz9eoXJcssqfoDveJ.KKsbBJCl94grmutoRL8F1uuDHK6dwTC',	'kiirofuriku@hotmail.com',	'5c9e919996d0e86f9bcde5806c3a55d7',	0,	'2014-02-27 07:40:20',	'2014-02-27 07:40:20'),
(6,	'engJEHneer',	'$2y$10$0AJT99CqGnS1k9rdKUBbp.u0Y3.TzM8.1WKyY4enESHeCClY4CA8q',	'tabing.jeremiah@gmail.com',	'68d11bc075498c2eb53890a945095ffa',	0,	'2014-02-27 07:40:20',	'2014-02-27 07:40:20'),
(7,	'randy',	'$2y$10$nQC9ueANXwt8GZq5Ylyh8ujzFOYOBL/iZIPMYPhDfdl8Oz5NX4ccu',	'randy.virtucio@gmail.com',	'fc5165ac16605e1e3ae0965667a05547',	1,	'2014-03-03 19:40:13',	'2014-03-03 19:40:13'),
(8,	'alice',	'$2y$10$uRfcjCLs81McRyubrrcY6uDmLmNib1bhk1Rh/nqfxKGoOq.KiOrwu',	'sample@sample.com',	'9b841d7a5e9ff84be331bd8837c248ce',	0,	'2014-03-03 20:19:52',	'2014-03-03 20:19:52'),
(9,	'new user',	'$2y$10$81IyEzaYY8G5nmmr5kDVJOyiISElOidPDJ7csA0nuBeUIpQSd/jJ.',	'newuser@gmail.com',	'8bbc45c5674242cbfe78ffd6593bd527',	0,	'2014-03-04 08:31:06',	'2014-03-04 08:31:06'),
(10,	'ynna',	'$2y$10$nWk8Yq8QM2zzr5MRqzx1WOdTxN0bUBJTRY.ND3HRUI7asJbuAItha',	'maggsymagsumbol@gmail.com',	'cf8a0ca6adb79ac243e3fbfc7beacc69',	0,	'2014-03-06 10:36:03',	'2014-03-06 10:36:03'),
(11,	'Felicity',	'$2y$10$8.fVLEEq0AuOACccuj/eE.MXLgUNHXoWOlVplcrM1umLcgW7GmQHW',	'rosemariebestal@gmail.com',	'e166b82931d6f57814b57c585f5df2fe',	0,	'2014-03-06 10:36:42',	'2014-03-06 10:36:42'),
(12,	'jamek',	'$2y$10$t4mbQOhwwIOi/0xIu5WHFenUXZy7/3ttT9zkh3U1a9tzJ8VBF.7ES',	'jmk@gmail.com',	'53401d96e485813acc5039f37420abd8',	0,	'2014-03-06 10:42:20',	'2014-03-06 10:42:20'),
(13,	'karen',	'$2y$10$P6WE//PD.DKV89EC35aIx.i/.wVVrf/OSwq.l6g7gcwMnXZPb.V52',	'karendagnalan07@gmail.com',	'2ffe2a782a7d0fda0c7d109a6dedc77f',	0,	'2014-03-06 10:43:01',	'2014-03-06 10:43:01'),
(14,	'jmk',	'$2y$10$e3.BRGyIJ40FQfF5eQlmneB7G7dwBeuUl1novNgb95wVmBAKT.GZ.',	'jmkindipan@gmail.com',	'f5d70b016ab0f342d53baff7abacd9d3',	0,	'2014-03-06 10:43:23',	'2014-03-06 10:43:23'),
(15,	'pangetAko',	'$2y$10$K0Dfv7FUOnMaFMQXLHQbfu8pPUZ8qztW1DX82MnH9eLiWcXBHv4I2',	'pangetAko@gmail.com',	'c298a1dbbcbecdec4f0c82477bb92b9e',	0,	'2014-03-06 18:09:27',	'2014-03-06 18:09:27'),
(16,	'fghfgh',	'$2y$10$80OE92UO.ctQ/LHxwyL/2eD0RZ5lnpa0VmwQFxSq.rEGyrhqIh5Ui',	'jhgf@gfs.com',	'cf6714f53c63906fb44f7a8186b9a47f',	0,	'2014-03-07 10:32:57',	'2014-03-07 10:32:57'),
(17,	'Bacun',	'$2y$10$GpM7Af65nA/kZUoZCS.D8.UETnwsLzHn7rDQI0wmHj1H.88az1DEu',	'e1706336@drdrb.com',	'a7a7c996074280a9c59b7ac11c466d51',	1,	'2014-03-07 10:33:57',	'2014-03-07 10:33:57'),
(18,	'SAmpleUser',	'$2y$10$hXrN1cgUc6JOGibFZgE3ZehDaA7WNxovWqVtIwR9B0PIQlVpHnuJa',	'awkwakrakwrawk@gmail.com',	'391adef5265e060853eb7539427655eb',	0,	'2014-03-07 10:57:30',	'2014-03-07 10:57:30'),
(19,	'nyaa-edu',	'$2y$10$RCroB5f0g50I6UU/eq55ROmtRB6bnsQpelntYHjef48U58x9GuKlm',	'nyaa-edu@gfx.com',	'a44ac5cf88713f9e9f2aad54c3a42082',	0,	'2014-03-07 11:57:06',	'2014-03-07 11:57:06'),
(20,	'abcanlas',	'$2y$10$aK1OsB9azCL591ehPuiDxefUQWr75B5DtVMTkcM7dWm67nFjk6qW6',	'abcanlas@yahoo.com',	'8da531ea726085fd6ef0e632427e8a31',	0,	'2014-03-07 19:05:59',	'2014-03-07 19:05:59');

-- 2014-03-09 08:34:55
