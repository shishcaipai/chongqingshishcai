/*
SQLyog Ultimate v11.24 (32 bit)
MySQL - 5.5.38 : Database - 1000wcj
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`jj1000w` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `jj1000w`;

/*Table structure for table `member_user` */

DROP TABLE IF EXISTS `member_user`;

CREATE TABLE `member_user` (
  `id` varchar(32) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `real_name` varchar(255) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `birthday` varchar(32) DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `state` varchar(64) DEFAULT NULL,
  `city` varchar(64) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `telephone` varchar(64) DEFAULT NULL,
  `bank_code` varchar(64) DEFAULT NULL,
  `identity_card` varchar(64) DEFAULT NULL,
  `sex` varchar(8) DEFAULT NULL,
  `bank_name` varchar(64) DEFAULT NULL,
  `activated` tinyint(1) DEFAULT NULL,
  `random_code` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `member_user` */

insert  into `member_user`(`id`,`user_name`,`password`,`real_name`,`age`,`birthday`,`email`,`address`,`state`,`city`,`create_date`,`update_date`,`telephone`,`bank_code`,`identity_card`,`sex`,`bank_name`,`activated`,`random_code`) values (1,'543201721@qq.com','E10ADC3949BA59ABBE56E057F20F883E','陈文安',0,'07/30/2014','543201721@qq.com','三元里','辽宁','大连','2014-07-28 21:28:14','2014-08-02 14:19:29','18665686291','543201721@qq.com','430523198807134399','女',NULL,1,NULL),(2,'wenanthree@126.com','E10ADC3949BA59ABBE56E057F20F883E','陈文安',NULL,'07/26/2014',NULL,'测试地址','广东','深圳','2014-07-30 22:31:17','2014-08-01 23:07:59','18565381928','543201721@qq.com','430523198807131316','女',NULL,NULL,NULL),(3,'wenanthree@163.com','E10ADC3949BA59ABBE56E057F20F883E',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-08-02 00:37:40','2014-08-02 00:37:40',NULL,NULL,NULL,NULL,NULL,NULL,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
