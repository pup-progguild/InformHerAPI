-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.5.32 - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL Version:             8.2.0.4675
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT = @@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS = 0 */;
/*!40101 SET @OLD_SQL_MODE = @@SQL_MODE, SQL_MODE = 'NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for informher_db
CREATE DATABASE IF NOT EXISTS `informher_db` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `informher_db`;


-- Dumping structure for table informher_db.comments
CREATE TABLE IF NOT EXISTS `comments` (
  `id`         INT(10) UNSIGNED        NOT NULL AUTO_INCREMENT,
  `message`    TEXT
               COLLATE utf8_unicode_ci NOT NULL,
  `user_id`    INT(10) UNSIGNED        NOT NULL,
  `post_id`    INT(10) UNSIGNED        NOT NULL,
  `comment_id` INT(10) UNSIGNED        NOT NULL,
  `created_at` TIMESTAMP               NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` TIMESTAMP               NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` TIMESTAMP               NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comments_user_id_foreign` (`user_id`),
  KEY `comments_post_id_foreign` (`post_id`),
  KEY `comments_comment_id_foreign` (`comment_id`),
  CONSTRAINT `comments_comment_id_foreign` FOREIGN KEY (`comment_id`) REFERENCES `comments` (`id`),
  CONSTRAINT `comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`),
  CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
)
  ENGINE =InnoDB
  DEFAULT CHARSET =utf8
  COLLATE =utf8_unicode_ci;

-- Data exporting was unselected.


-- Dumping structure for table informher_db.likes
CREATE TABLE IF NOT EXISTS `likes` (
  `id`      INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `post_id` INT(10) UNSIGNED NOT NULL,
  `comment_id` INT(10) UNSIGNED NOT NULL,
  `user_id` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `likes_post_id_foreign` (`post_id`),
  KEY `likes_comment_id_foreign` (`comment_id`),
  KEY `likes_user_id_foreign` (`user_id`),
  CONSTRAINT `likes_comment_id_foreign` FOREIGN KEY (`comment_id`) REFERENCES `comments` (`id`),
  CONSTRAINT `likes_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`),
  CONSTRAINT `likes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
)
  ENGINE =InnoDB
  DEFAULT CHARSET =utf8
  COLLATE =utf8_unicode_ci;

-- Data exporting was unselected.


-- Dumping structure for table informher_db.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `migration` VARCHAR(255)
              COLLATE utf8_unicode_ci NOT NULL,
  `batch`     INT(11)                 NOT NULL
)
  ENGINE =InnoDB
  DEFAULT CHARSET =utf8
  COLLATE =utf8_unicode_ci;

-- Data exporting was unselected.


-- Dumping structure for table informher_db.password_reminders
CREATE TABLE IF NOT EXISTS `password_reminders` (
  `email`      VARCHAR(255)
               COLLATE utf8_unicode_ci NOT NULL,
  `token`      VARCHAR(255)
               COLLATE utf8_unicode_ci NOT NULL,
  `created_at` TIMESTAMP               NOT NULL DEFAULT '0000-00-00 00:00:00',
  KEY `password_reminders_email_index` (`email`),
  KEY `password_reminders_token_index` (`token`)
)
  ENGINE =InnoDB
  DEFAULT CHARSET =utf8
  COLLATE =utf8_unicode_ci;

-- Data exporting was unselected.


-- Dumping structure for table informher_db.posts
CREATE TABLE IF NOT EXISTS `posts` (
  `id`         INT(10) UNSIGNED        NOT NULL AUTO_INCREMENT,
  `type`       ENUM('ask', 'relate', 'shoutout')
               COLLATE utf8_unicode_ci NOT NULL,
  `title`      VARCHAR(140)
               COLLATE utf8_unicode_ci NOT NULL,
  `content`    TEXT
               COLLATE utf8_unicode_ci NOT NULL,
  `user_id`    INT(10) UNSIGNED        NOT NULL,
  `created_at` TIMESTAMP               NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` TIMESTAMP               NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` TIMESTAMP               NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `posts_user_id_foreign` (`user_id`),
  CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
)
  ENGINE =InnoDB
  DEFAULT CHARSET =utf8
  COLLATE =utf8_unicode_ci;

-- Data exporting was unselected.


-- Dumping structure for table informher_db.post_tags
CREATE TABLE IF NOT EXISTS `post_tags` (
  `id`     INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `post_id` INT(10) UNSIGNED NOT NULL,
  `tag_id` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `post_tags_post_id_foreign` (`post_id`),
  KEY `post_tags_tag_id_foreign` (`tag_id`),
  CONSTRAINT `post_tags_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`),
  CONSTRAINT `post_tags_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`)
)
  ENGINE =InnoDB
  DEFAULT CHARSET =utf8
  COLLATE =utf8_unicode_ci;

-- Data exporting was unselected.


-- Dumping structure for table informher_db.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `id`      INT(10) UNSIGNED        NOT NULL AUTO_INCREMENT,
  `user_id` INT(10) UNSIGNED        NOT NULL,
  `role`    ENUM('admin', 'mod-exp', 'mod', 'expert', 'user', 'resp')
            COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `roles_user_id_foreign` (`user_id`),
  CONSTRAINT `roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
)
  ENGINE =InnoDB
  DEFAULT CHARSET =utf8
  COLLATE =utf8_unicode_ci;

-- Data exporting was unselected.


-- Dumping structure for table informher_db.sessions
CREATE TABLE IF NOT EXISTS `sessions` (
  `id`            VARCHAR(255)
                  COLLATE utf8_unicode_ci NOT NULL,
  `payload`       TEXT
                  COLLATE utf8_unicode_ci NOT NULL,
  `last_activity` INT(11)                 NOT NULL,
  `created_at`    TIMESTAMP               NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at`    TIMESTAMP               NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE KEY `sessions_id_unique` (`id`)
)
  ENGINE =InnoDB
  DEFAULT CHARSET =utf8
  COLLATE =utf8_unicode_ci;

-- Data exporting was unselected.


-- Dumping structure for table informher_db.tags
CREATE TABLE IF NOT EXISTS `tags` (
  `id`      INT(10) UNSIGNED        NOT NULL AUTO_INCREMENT,
  `tagname` VARCHAR(255)
            COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tags_tagname_unique` (`tagname`)
)
  ENGINE =InnoDB
  DEFAULT CHARSET =utf8
  COLLATE =utf8_unicode_ci;

-- Data exporting was unselected.


-- Dumping structure for table informher_db.users
CREATE TABLE IF NOT EXISTS `users` (
  `id`         INT(10) UNSIGNED        NOT NULL AUTO_INCREMENT,
  `username`   VARCHAR(35)
               COLLATE utf8_unicode_ci NOT NULL,
  `password`   VARCHAR(60)
               COLLATE utf8_unicode_ci NOT NULL,
  `email`      VARCHAR(100)
               COLLATE utf8_unicode_ci NOT NULL,
  `twt_handle` VARCHAR(15)
               COLLATE utf8_unicode_ci NOT NULL,
  `created_at` TIMESTAMP               NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` TIMESTAMP               NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_username_unique` (`username`)
)
  ENGINE =InnoDB
  DEFAULT CHARSET =utf8
  COLLATE =utf8_unicode_ci;

-- Data exporting was unselected.
/*!40101 SET SQL_MODE = IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS = IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT = @OLD_CHARACTER_SET_CLIENT */;
