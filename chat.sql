/*
SQLyog Ultimate v11.11 (32 bit)
MySQL - 5.5.5-10.1.25-MariaDB : Database - chat
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`chat` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;

USE `chat`;

/*Table structure for table `chat` */

DROP TABLE IF EXISTS `chat`;

CREATE TABLE `chat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `chat` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pengirim` int(11) NOT NULL,
  `penerima` int(11) NOT NULL,
  `group_chat` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `waktu` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `chat` */

insert  into `chat`(`id`,`chat`,`pengirim`,`penerima`,`group_chat`,`waktu`) values (1,'Tes aja',2,3,'xyxy','2019-03-01 01:00:00'),(2,'Tes juga',3,2,'xyxy','2019-03-19 00:00:00'),(8,'Node js',3,2,'xyxy','2019-03-22 13:03:37'),(9,'Sokcet aja',3,2,'xyxy','2019-03-22 13:03:40'),(10,'NOde',2,3,'xyxy','2019-03-22 13:03:48'),(11,'Siip, mantap',3,2,'xyxy','2019-03-22 13:03:35');

/*Table structure for table `chat_bootstrap` */

DROP TABLE IF EXISTS `chat_bootstrap`;

CREATE TABLE `chat_bootstrap` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `chat` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_pengirim` varchar(35) COLLATE utf8mb4_unicode_ci NOT NULL,
  `waktu` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `chat_bootstrap` */

insert  into `chat_bootstrap`(`id`,`chat`,`nama_pengirim`,`waktu`) values (1,'Hallo','Abi','2019-03-27 08:36:31'),(2,'Hai','Umi','2019-03-27 08:36:34'),(3,'Pagi','Umi','2019-03-28 07:03:34'),(4,'Pagi','Muhamad','2019-03-28 07:03:05'),(5,'Tes','andi','2019-03-28 07:03:42'),(6,'P','andi','2019-03-28 07:03:42'),(7,'Opo','Muhamad','2019-03-28 07:03:05'),(8,'Ora opo','andi','2019-03-28 07:03:42'),(9,'Pagi','Muhamad','2019-03-28 08:03:18'),(10,'Jugak','andi','2019-03-28 08:03:40'),(11,'Malam Bi','Umi','2019-06-15 02:06:24'),(12,'Malam juga','Abi','2019-06-15 02:06:08'),(13,'Tesss','Abi','2019-06-15 02:06:08');

/*Table structure for table `groups` */

DROP TABLE IF EXISTS `groups`;

CREATE TABLE `groups` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `groups` */

insert  into `groups`(`id`,`name`,`description`) values (1,'admin','Administrator'),(2,'members','General User'),(3,'Message','Contoh Pesan');

/*Table structure for table `login_attempts` */

DROP TABLE IF EXISTS `login_attempts`;

CREATE TABLE `login_attempts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(45) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `login_attempts` */

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(45) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(254) NOT NULL,
  `activation_selector` varchar(255) DEFAULT NULL,
  `activation_code` varchar(255) DEFAULT NULL,
  `forgotten_password_selector` varchar(255) DEFAULT NULL,
  `forgotten_password_code` varchar(255) DEFAULT NULL,
  `forgotten_password_time` int(11) unsigned DEFAULT NULL,
  `remember_selector` varchar(255) DEFAULT NULL,
  `remember_code` varchar(255) DEFAULT NULL,
  `created_on` int(11) unsigned NOT NULL,
  `last_login` int(11) unsigned DEFAULT NULL,
  `active` tinyint(1) unsigned DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `foto` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uc_email` (`email`),
  UNIQUE KEY `uc_activation_selector` (`activation_selector`),
  UNIQUE KEY `uc_forgotten_password_selector` (`forgotten_password_selector`),
  UNIQUE KEY `uc_remember_selector` (`remember_selector`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `users` */

insert  into `users`(`id`,`ip_address`,`username`,`password`,`email`,`activation_selector`,`activation_code`,`forgotten_password_selector`,`forgotten_password_code`,`forgotten_password_time`,`remember_selector`,`remember_code`,`created_on`,`last_login`,`active`,`first_name`,`last_name`,`company`,`phone`,`foto`) values (1,'127.0.0.1','administrator','$2y$12$qkFQ8DV9quBpGnF0vnbo7uwTyddZUmIfXUs/sCQB1072nbR9Hrbue','admin@admin.com',NULL,'',NULL,NULL,NULL,NULL,NULL,1268889823,1553734276,1,'Admin','istrator','ADMIN','0',NULL),(2,'::1','umi@sebuahhobi.com','$2y$10$myxh8hM0gwwnqukR6psBfOJi5wSgXxf9a3iyFgud6Zy.5XdCqrQ1W','umi@sebuahhobi.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1552930156,1560541583,1,'Umi','..','Sebuahhobi','080811222121',NULL),(3,'::1','abi@sebuahhobi.com','$2y$10$MtHxqKv9vLTy2Agh1SW6i.e424vcvH3m85nULWi9NRsC5eNCXiV0W','abi@sebuahhobi.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1552930191,1560541505,1,'Abi','...','Sebuahhobi','080811222121',NULL),(4,'192.168.43.55','muhamadilhan.ox@gmail.com','$2y$10$P8FFRbvupIo6y2Xbk4LWPOyrbzt3sarBOioZ1nsvObrvYpFuqPjLy','muhamadilhan.ox@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1553734310,1553734442,1,'Muhamad','Ilham','Indo','082284302026',NULL),(5,'192.168.43.97','andi2000@gmail.com','$2y$10$Lc.TX1r1pvf4B06ByGCQzeFW890lpjPAWY.r.2.vPAGo7I7bru5we','andi2000@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1553734511,1553736639,1,'andi','Cahyo','Uirunggul','123456',NULL);

/*Table structure for table `users_groups` */

DROP TABLE IF EXISTS `users_groups`;

CREATE TABLE `users_groups` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uc_users_groups` (`user_id`,`group_id`),
  KEY `fk_users_groups_users1_idx` (`user_id`),
  KEY `fk_users_groups_groups1_idx` (`group_id`),
  CONSTRAINT `fk_users_groups_groups1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_groups_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `users_groups` */

insert  into `users_groups`(`id`,`user_id`,`group_id`) values (1,1,1),(2,1,2),(3,2,2),(4,3,2),(5,4,2),(6,5,2);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
