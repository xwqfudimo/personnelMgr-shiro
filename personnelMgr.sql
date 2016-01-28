/*
SQLyog Ultimate v11.24 (32 bit)
MySQL - 5.5.19 : Database - personnelmgr
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`personnelmgr` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `personnelmgr`;

/*Table structure for table `department` */

DROP TABLE IF EXISTS `department`;

CREATE TABLE `department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(16) NOT NULL,
  `emp_num` int(11) DEFAULT NULL,
  `fzr_emp_id` int(11) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `department` */

insert  into `department`(`id`,`name`,`emp_num`,`fzr_emp_id`,`sort`) values (1,'研发部',4,2,1),(2,'行政部',1,2,2),(3,'财务部',1,3,3),(4,'人事部',1,6,4);

/*Table structure for table `employee` */

DROP TABLE IF EXISTS `employee`;

CREATE TABLE `employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(5) NOT NULL,
  `dept_id` int(11) NOT NULL,
  `sex` varchar(2) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `nationality` varchar(10) DEFAULT NULL,
  `zzmm` varchar(5) DEFAULT NULL,
  `marriage` varchar(2) DEFAULT NULL,
  `address` varchar(64) DEFAULT NULL,
  `rzsj` date DEFAULT NULL,
  `xl` varchar(16) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `email` varchar(32) DEFAULT NULL,
  `card` varchar(18) DEFAULT NULL,
  `self_intro` varchar(128) DEFAULT NULL,
  `beizhu` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_emp_dept` (`dept_id`),
  CONSTRAINT `FK_Reference_emp_dept` FOREIGN KEY (`dept_id`) REFERENCES `department` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `employee` */

insert  into `employee`(`id`,`name`,`dept_id`,`sex`,`birthdate`,`nationality`,`zzmm`,`marriage`,`address`,`rzsj`,`xl`,`phone`,`email`,`card`,`self_intro`,`beizhu`) values (1,'青帝',1,'男',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,'钟山',1,'男','1994-03-17','汉族','群众','未婚','凌霄天庭','2015-02-11','无','1251239678','zs@qq.com','530521199402316678','吾乃帝皇',NULL),(3,'沈蔓歌',2,'女','2010-12-24','汉','群众','未婚','邻家','2015-06-24','本科','1251239678','mg@qq.com','530521199402316676','歌后',NULL),(4,'古千幽',3,'女',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,'沈万三',3,'男',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,'念悠悠',4,'女','2009-01-21','汉族','群众','未婚','','2015-01-21','高中','','','',NULL,''),(7,'研发1',1,'男','2016-01-25','汉族','群众','未婚','','2016-01-25','高中','','','',NULL,''),(8,'研发2',1,'男','2016-01-25','汉族','群众','未婚','','2016-01-25','高中','','','',NULL,'');

/*Table structure for table `jiaban` */

DROP TABLE IF EXISTS `jiaban`;

CREATE TABLE `jiaban` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_id` int(11) DEFAULT NULL,
  `emp_name` varchar(5) DEFAULT NULL,
  `dept_name` varchar(16) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `day_num` int(11) DEFAULT NULL,
  `hour_num` int(11) DEFAULT NULL,
  `jb_reason` varchar(32) NOT NULL,
  `submit_time` datetime DEFAULT NULL,
  `audit_status` tinyint(1) DEFAULT NULL,
  `audit_person` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_jb_emp` (`emp_id`),
  CONSTRAINT `FK_Reference_jb_emp` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `jiaban` */

insert  into `jiaban`(`id`,`emp_id`,`emp_name`,`dept_name`,`start_time`,`end_time`,`day_num`,`hour_num`,`jb_reason`,`submit_time`,`audit_status`,`audit_person`) values (1,2,'钟山','研发部','2015-12-24 15:09:24','2015-12-24 20:09:29',0,5,'赶工','2016-01-04 13:30:28',0,'无'),(2,7,'研发1','研发部','2016-01-25 00:00:00','2016-01-25 03:00:00',0,3,'更新网站','2016-01-25 14:29:55',1,'钟山'),(3,7,'研发1','研发部','2016-01-25 00:00:00','2016-01-25 12:00:00',0,12,'编码','2016-01-25 17:03:00',0,'钟山'),(4,7,'研发1','研发部','2016-01-28 01:00:00','2016-01-28 03:00:00',0,3,'服务器文件更新','2016-01-28 16:28:12',1,'钟山'),(5,7,'研发1','研发部','2016-01-28 00:00:00','2016-01-28 02:00:00',0,2,'更新游戏','2016-01-28 16:32:42',1,'钟山'),(6,7,'研发1','研发部','2016-01-28 00:00:00','2016-01-29 00:00:00',1,0,'aaaabbbb','2016-01-28 16:36:35',1,'钟山');

/*Table structure for table `kaoqin` */

DROP TABLE IF EXISTS `kaoqin`;

CREATE TABLE `kaoqin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_id` int(11) DEFAULT NULL,
  `emp_name` varchar(5) DEFAULT NULL,
  `dept_name` varchar(16) DEFAULT NULL,
  `morning_sign_time` time DEFAULT NULL,
  `afternoon_sign_time` time DEFAULT NULL,
  `t_date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_kq_emp` (`emp_id`),
  CONSTRAINT `FK_Reference_kq_emp` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `kaoqin` */

insert  into `kaoqin`(`id`,`emp_id`,`emp_name`,`dept_name`,`morning_sign_time`,`afternoon_sign_time`,`t_date`) values (1,2,'钟山','研发部','08:52:24','17:34:22','2015-12-29'),(2,2,'钟山','研发部','08:55:24','18:25:43','2015-11-11'),(3,2,'钟山','研发部','08:46:24','18:12:43','2015-11-20'),(4,7,'研发1','研发部','08:56:34','17:34:23','2016-01-26');

/*Table structure for table `log` */

DROP TABLE IF EXISTS `log`;

CREATE TABLE `log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(16) NOT NULL,
  `log_msg` varchar(64) NOT NULL,
  `record_time` datetime NOT NULL,
  `url` varchar(128) DEFAULT NULL,
  `param` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=193 DEFAULT CHARSET=utf8;

/*Data for the table `log` */

insert  into `log`(`id`,`uname`,`log_msg`,`record_time`,`url`,`param`) values (2,'zs','修改部门','2016-01-21 13:02:12','/dept_edit_submit','{\"name\":[\"市场部3\"],\"sort\":[\"5\"],\"id\":[\"5\"],\"fzr_phone\":[\"\"],\"fzr\":[\"\"]}'),(3,'zs','删除部门','2016-01-21 13:03:05','/dept_del/5','{}'),(4,'zs','新增部门','2016-01-21 13:07:23','/dept_add','{\"name\":[\"市场部\"],\"sort\":[\"5\"],\"fzr_phone\":[\"\"],\"fzr\":[\"\"]}'),(5,'zs','删除部门','2016-01-21 13:07:27','/dept_del/6','{}'),(6,'zs','登录','2016-01-21 13:35:51','/login','{\"password\":[\"1\"],\"username\":[\"zs\"]}'),(7,'zs','登录','2016-01-21 13:37:41','/login','{\"password\":[\"1\"],\"username\":[\"zs\"]}'),(8,'zs','登录','2016-01-21 13:41:13','/login','{\"password\":[\"1\"],\"username\":[\"zs\"]}'),(9,'zs','登录','2016-01-21 13:44:28','/login','{\"password\":[\"1\"],\"username\":[\"zs\"]}'),(10,'zs','登录','2016-01-21 13:46:23','/login','{\"password\":[\"1\"],\"username\":[\"zs\"]}'),(11,'zs','登录','2016-01-21 13:49:00','/login','{\"password\":[\"1\"],\"username\":[\"zs\"]}'),(12,'zs','登录','2016-01-21 13:50:40','/login','{\"password\":[\"1\"],\"username\":[\"zs\"]}'),(13,'zs','登录系统','2016-01-21 13:56:55','/login','{\"password\":[\"1\"],\"username\":[\"zs\"]}'),(14,'zs','登录系统','2016-01-21 14:14:07','/login','{\"password\":[\"1\"],\"username\":[\"zs\"]}'),(15,'zs','登录系统','2016-01-21 14:17:27','/login','{\"password\":[\"1\"],\"username\":[\"zs\"]}'),(16,'zs','登录系统','2016-01-21 14:32:44','/login','{\"password\":[\"1\"],\"username\":[\"zs\"]}'),(17,'zs','登录系统','2016-01-21 14:34:24','/login','{\"password\":[\"1\"],\"username\":[\"zs\"]}'),(18,'zs','登录系统','2016-01-21 14:38:43','/login','{\"password\":[\"1\"],\"username\":[\"zs\"]}'),(19,'zs','登录系统','2016-01-21 14:40:15','/login','{\"password\":[\"1\"],\"username\":[\"zs\"]}'),(20,'zs','登录系统','2016-01-21 14:51:16','/login','{\"password\":[\"1\"],\"username\":[\"zs\"]}'),(21,'zs','登录系统','2016-01-21 14:52:57','/login','{\"password\":[\"1\"],\"username\":[\"zs\"]}'),(22,'zs','登录系统','2016-01-21 14:55:36','/login','{\"password\":[\"1\"],\"username\":[\"zs\"]}'),(23,'zs','登录系统','2016-01-21 15:03:39','/login','{\"password\":[\"1\"],\"username\":[\"zs\"]}'),(24,'zs','登录系统','2016-01-22 09:21:18','/login','{\"remember_pwd\":[\"1\"],\"password\":[\"1\"],\"username\":[\"zs\"]}'),(25,'zs','登录系统','2016-01-22 09:23:40','/login','{\"remember_pwd\":[\"1\"],\"password\":[\"1\"],\"username\":[\"zs\"]}'),(26,'zs','更新角色','2016-01-22 09:25:12','/role_edit_submit','{\"name\":[\"administrator\"],\"id\":[\"1\"],\"privilegeId\":[\"16\",\"17\",\"18\",\"19\",\"20\",\"6\",\"7\",\"8\",\"9\",\"10\",\"1\",\"2\",\"3\",\"4\",\"5\",\"11\",\"12\",\"13\",\"14\",\"15\",\"36\",\"37\",\"38\",\"39\",\"40\",\"41\",\"42\",\"43\",\"44\",\"45\",\"26\",\"27\",\"28\",\"29\",\"30\",\"21\",\"22\",\"23\",\"24\",\"25\",\"31\",\"32\",\"33\",\"34\",\"35\"],\"menuIds\":[\"1,6,7,8,6,7,8,2,9,10,9,10,3,11,11,4,22,22,5,12,12,13,14,20,15,16,21,14,20,15,16,21,17,19,18,19,18\"],\"desc\":[\"超级管理员\"]}'),(27,'zs','登录系统','2016-01-22 09:25:43','/login','{\"remember_pwd\":[\"1\"],\"password\":[\"1\"],\"username\":[\"zs\"]}'),(28,'zs','登录系统','2016-01-22 09:36:36','/login','{\"remember_pwd\":[\"1\"],\"password\":[\"1\"],\"username\":[\"zs\"]}'),(29,'zs','登录系统','2016-01-22 09:42:00','/login','{\"remember_pwd\":[\"1\"],\"password\":[\"1\"],\"username\":[\"zs\"]}'),(30,'zs','登录系统','2016-01-22 09:44:14','/login','{\"remember_pwd\":[\"1\"],\"password\":[\"1\"],\"username\":[\"zs\"]}'),(31,'zs','登录系统','2016-01-22 09:55:21','/login','{\"remember_pwd\":[\"1\"],\"password\":[\"1\"],\"username\":[\"zs\"]}'),(32,'zs','登录系统','2016-01-22 10:06:57','/login','{\"remember_pwd\":[\"1\"],\"password\":[\"1\"],\"username\":[\"zs\"]}'),(33,'zs','登录系统','2016-01-22 10:23:52','/login','{\"remember_pwd\":[\"1\"],\"password\":[\"1\"],\"username\":[\"zs\"]}'),(34,'zs','登录系统','2016-01-22 10:30:40','/login','{\"remember_pwd\":[\"1\"],\"password\":[\"1\"],\"username\":[\"zs\"]}'),(35,'zs','登录系统','2016-01-22 10:46:29','/login','{\"remember_pwd\":[\"1\"],\"password\":[\"1\"],\"username\":[\"zs\"]}'),(36,'zs','登录系统','2016-01-22 11:16:17','/login','{\"remember_pwd\":[\"1\"],\"password\":[\"1\"],\"username\":[\"zs\"]}'),(37,'zs','登录系统','2016-01-22 11:24:04','/login','{\"remember_pwd\":[\"1\"],\"password\":[\"1\"],\"username\":[\"zs\"]}'),(38,'zs','登录系统','2016-01-22 11:27:35','/login','{\"remember_pwd\":[\"1\"],\"password\":[\"1\"],\"username\":[\"zs\"]}'),(39,'zs','登录系统','2016-01-22 11:31:40','/login','{\"remember_pwd\":[\"1\"],\"password\":[\"1\"],\"username\":[\"zs\"]}'),(40,'zs','登录系统','2016-01-22 13:07:22','/login','{\"remember_pwd\":[\"1\"],\"password\":[\"1\"],\"username\":[\"zs\"]}'),(41,'zs','登录系统','2016-01-22 13:10:08','/login','{\"remember_pwd\":[\"1\"],\"password\":[\"1\"],\"username\":[\"zs\"]}'),(42,'zs','登录系统','2016-01-22 13:12:25','/login','{\"remember_pwd\":[\"1\"],\"password\":[\"1\"],\"username\":[\"zs\"]}'),(43,'zs','登录系统','2016-01-22 13:14:11','/login','{\"remember_pwd\":[\"1\"],\"password\":[\"1\"],\"username\":[\"zs\"]}'),(44,'zs','新增部门','2016-01-22 13:18:11','/dept_add','{\"name\":[\"stes\"],\"fzr_id\":[\"4\"],\"sort\":[\"33\"]}'),(45,'zs','修改部门','2016-01-22 13:18:38','/dept_edit_submit','{\"name\":[\"stes22\"],\"sort\":[\"331\"],\"id\":[\"5\"],\"fzr_id\":[\"5\"]}'),(46,'zs','删除部门','2016-01-22 13:18:44','/dept_del/5','{}'),(47,'zs','新增部门','2016-01-22 13:18:56','/dept_add','{\"name\":[\"aa\"],\"fzr_id\":[\"-1\"],\"sort\":[\"1\"]}'),(48,'zs','新增部门','2016-01-22 13:19:10','/dept_add','{\"name\":[\"aaa\"],\"fzr_id\":[\"-1\"],\"sort\":[\"11\"]}'),(49,'zs','登录系统','2016-01-22 13:21:07','/login','{\"remember_pwd\":[\"1\"],\"password\":[\"1\"],\"username\":[\"zs\"]}'),(50,'zs','新增部门','2016-01-22 13:21:18','/dept_add','{\"name\":[\"tt\"],\"fzr_id\":[\"-1\"],\"sort\":[\"111\"]}'),(51,'zs','新增部门','2016-01-22 13:21:31','/dept_add','{\"name\":[\"ddd\"],\"fzr_id\":[\"1\"],\"sort\":[\"111\"]}'),(52,'zs','删除部门','2016-01-22 13:21:36','/dept_del/9','{}'),(53,'zs','登录系统','2016-01-22 13:47:17','/login','{\"remember_pwd\":[\"1\"],\"password\":[\"1\"],\"username\":[\"zs\"]}'),(54,'zs','新增部门','2016-01-22 13:47:32','/dept_add','{\"name\":[\"bb\"],\"fzr_id\":[\"-1\"],\"sort\":[\"21\"]}'),(55,'zs','登录系统','2016-01-22 14:08:25','/login','{\"remember_pwd\":[\"1\"],\"password\":[\"1\"],\"username\":[\"zs\"]}'),(56,'zs','登录系统','2016-01-22 14:12:37','/login','{\"remember_pwd\":[\"1\"],\"password\":[\"1\"],\"username\":[\"zs\"]}'),(57,'zs','删除部门','2016-01-22 14:12:50','/dept_del/10','{}'),(58,'zs','删除部门','2016-01-22 14:12:53','/dept_del/8','{}'),(59,'zs','删除部门','2016-01-22 14:12:56','/dept_del/7','{}'),(60,'zs','删除部门','2016-01-22 14:12:59','/dept_del/6','{}'),(61,'zs','登录系统','2016-01-22 14:47:03','/login','{\"remember_pwd\":[\"1\"],\"password\":[\"1\"],\"username\":[\"zs\"]}'),(62,'zs','更新角色','2016-01-22 14:48:00','/role_edit_submit','{\"name\":[\"administrator\"],\"id\":[\"1\"],\"privilegeId\":[\"16\",\"17\",\"18\",\"19\",\"20\",\"6\",\"7\",\"8\",\"9\",\"10\",\"1\",\"2\",\"3\",\"4\",\"5\",\"11\",\"12\",\"13\",\"14\",\"15\",\"36\",\"37\",\"38\",\"39\",\"40\",\"41\",\"42\",\"43\",\"44\",\"45\",\"26\",\"27\",\"28\",\"29\",\"30\",\"21\",\"22\",\"23\",\"24\",\"25\",\"31\",\"32\",\"33\",\"34\",\"35\"],\"menuIds\":[\"1,6,7,8,6,7,8,2,9,10,9,10,3,11,11,4,22,22,5,12,12,13,14,20,15,16,21,23,14,20,15,16,21,23,17,19,18,19,18,24,25,26,25,26,27,28,29,28,29\"],\"desc\":[\"超级管理员\"]}'),(63,'zs','登录系统','2016-01-22 14:48:04','/login','{\"remember_pwd\":[\"1\"],\"password\":[\"1\"],\"username\":[\"zs\"]}'),(64,'zs','更新角色','2016-01-22 14:54:53','/role_edit_submit','{\"name\":[\"administrator\"],\"id\":[\"1\"],\"privilegeId\":[\"16\",\"17\",\"18\",\"19\",\"20\",\"6\",\"7\",\"8\",\"9\",\"10\",\"1\",\"2\",\"3\",\"4\",\"5\",\"11\",\"12\",\"13\",\"14\",\"15\",\"36\",\"37\",\"38\",\"39\",\"40\",\"41\",\"42\",\"43\",\"44\",\"45\",\"26\",\"27\",\"28\",\"29\",\"30\",\"21\",\"22\",\"23\",\"24\",\"25\",\"31\",\"32\",\"33\",\"34\",\"35\"],\"menuIds\":[\"1,6,7,8,6,7,8,2,9,10,9,10,3,11,11,4,22,22,5,12,12,13,14,20,15,16,21,23,14,20,15,16,21,23,17,19,18,19,18,24,25,26,30,25,26,30,27,28,29,28,29\"],\"desc\":[\"超级管理员\"]}'),(65,'zs','登录系统','2016-01-22 14:54:56','/login','{\"remember_pwd\":[\"1\"],\"password\":[\"1\"],\"username\":[\"zs\"]}'),(66,'zs','登录系统','2016-01-25 11:23:56','/login','{\"password\":[\"1\"],\"username\":[\"zs\"]}'),(67,'zs','登录系统','2016-01-25 11:30:45','/login','{\"remember_pwd\":[\"1\"],\"password\":[\"1\"],\"username\":[\"zs\"]}'),(68,'zs','登录系统','2016-01-25 14:25:39','/login','{\"remember_pwd\":[\"1\"],\"password\":[\"1\"],\"username\":[\"zs\"]}'),(69,'zs','新增员工','2016-01-25 14:28:29','/emp_add','{\"birthdate\":[\"2016-01-25\"],\"address\":[\"\"],\"sex\":[\"MALE\"],\"deptId\":[\"1\"],\"rzsj\":[\"2016-01-25\"],\"nationality\":[\"汉族\"],\"xl\":[\"高中\"],\"phone\":[\"\"],\"marriage\":[\"未婚\"],\"name\":[\"研发1\"],\"zzmm\":[\"群众\"],\"beizhu\":[\"\"],\"email\":[\"\"],\"card\":[\"\"]}'),(70,'zs','新增用户','2016-01-25 14:28:59','/user_add','{\"empId\":[\"7\"],\"password\":[\"1\"],\"roleIds\":[\"2\"],\"username\":[\"yf1\"]}'),(71,'yf1','登录系统','2016-01-25 14:29:13','/login','{\"remember_pwd\":[\"1\"],\"password\":[\"1\"],\"username\":[\"yf1\"]}'),(72,'yf1','新增加班申请','2016-01-25 14:29:55','/jiabanApply_add','{\"end_time\":[\"2016-01-25 03:00:00\"],\"day_num\":[\"0\"],\"reason\":[\"更新网站\"],\"start_time\":[\"2016-01-25 00:00:00\"],\"hour_num\":[\"3\"]}'),(73,'zs','登录系统','2016-01-25 14:30:05','/login','{\"remember_pwd\":[\"1\"],\"password\":[\"1\"],\"username\":[\"zs\"]}'),(74,'zs','登录系统','2016-01-25 14:33:12','/login','{\"remember_pwd\":[\"1\"],\"password\":[\"1\"],\"username\":[\"zs\"]}'),(75,'zs','修改部门','2016-01-25 14:34:25','/dept_edit_submit','{\"name\":[\"研发部\"],\"sort\":[\"1\"],\"id\":[\"1\"],\"fzr_id\":[\"2\"]}'),(76,'zs','登录系统','2016-01-25 15:25:40','/login','{\"remember_pwd\":[\"1\"],\"password\":[\"1\"],\"username\":[\"zs\"]}'),(77,'zs','新增员工','2016-01-25 15:28:19','/emp_add','{\"birthdate\":[\"2016-01-25\"],\"address\":[\"\"],\"sex\":[\"MALE\"],\"deptId\":[\"1\"],\"rzsj\":[\"2016-01-25\"],\"nationality\":[\"汉族\"],\"xl\":[\"高中\"],\"phone\":[\"\"],\"marriage\":[\"未婚\"],\"name\":[\"研发2\"],\"zzmm\":[\"群众\"],\"beizhu\":[\"\"],\"email\":[\"\"],\"card\":[\"\"]}'),(78,'zs','登录系统','2016-01-25 16:28:55','/login','{\"remember_pwd\":[\"1\"],\"password\":[\"1\"],\"username\":[\"zs\"]}'),(79,'zs','登录系统','2016-01-25 16:31:08','/login','{\"remember_pwd\":[\"1\"],\"password\":[\"1\"],\"username\":[\"zs\"]}'),(80,'zs','登录系统','2016-01-25 16:36:17','/login','{\"remember_pwd\":[\"1\"],\"password\":[\"1\"],\"username\":[\"zs\"]}'),(81,'zs','登录系统','2016-01-25 16:40:20','/login','{\"remember_pwd\":[\"1\"],\"password\":[\"1\"],\"username\":[\"zs\"]}'),(82,'zs','登录系统','2016-01-25 16:44:46','/login','{\"remember_pwd\":[\"1\"],\"password\":[\"1\"],\"username\":[\"zs\"]}'),(83,'zs','登录系统','2016-01-25 16:56:29','/login','{\"remember_pwd\":[\"1\"],\"password\":[\"1\"],\"username\":[\"zs\"]}'),(84,'yf1','登录系统','2016-01-25 17:00:51','/login','{\"password\":[\"1\"],\"username\":[\"yf1\"]}'),(85,'yf1','新增加班申请','2016-01-25 17:03:00','/jiabanApply_add','{\"end_time\":[\"2016-01-25 12:00:00\"],\"day_num\":[\"0\"],\"start_time\":[\"2016-01-25 00:00:00\"],\"reason\":[\"编码\"],\"hour_num\":[\"12\"]}'),(86,'zs','不批准加班','2016-01-25 17:03:17','/jiabanApproval_against/3','{}'),(87,'zs','登录系统','2016-01-25 17:05:28','/login','{\"remember_pwd\":[\"1\"],\"password\":[\"1\"],\"username\":[\"zs\"]}'),(88,'zs','登录系统','2016-01-25 17:14:49','/login','{\"remember_pwd\":[\"1\"],\"password\":[\"1\"],\"username\":[\"zs\"]}'),(89,'zs','登录系统','2016-01-25 17:28:13','/login','{\"remember_pwd\":[\"1\"],\"password\":[\"1\"],\"username\":[\"zs\"]}'),(90,'zs','登录系统','2016-01-25 17:29:26','/login','{\"remember_pwd\":[\"1\"],\"password\":[\"1\"],\"username\":[\"zs\"]}'),(91,'yf1','登录系统','2016-01-25 17:29:46','/login','{\"password\":[\"1\"],\"username\":[\"yf1\"]}'),(92,'yf1','新增请假申请','2016-01-25 17:30:12','/qingjiaApply_add','{\"start_time\":[\"2016-01-25 00:00:00\"],\"reason\":[\"头疼\"],\"hour_num\":[\"0\"],\"end_time\":[\"2016-01-26 00:00:00\"],\"day_num\":[\"1\"],\"type\":[\"SICK\"]}'),(93,'zs','批准请假','2016-01-25 17:30:22','/qingjiaApproval_approve/4','{}'),(94,'yf1','新增请假申请','2016-01-25 17:30:46','/qingjiaApply_add','{\"start_time\":[\"2016-01-25 00:00:00\"],\"reason\":[\"家中有事\"],\"hour_num\":[\"0\"],\"end_time\":[\"2016-01-27 00:00:00\"],\"day_num\":[\"2\"],\"type\":[\"AFFAIR\"]}'),(95,'zs','不批准请假','2016-01-25 17:30:55','/qingjiaApproval_against/5','{}'),(96,'zs','登录系统','2016-01-26 08:57:37','/login','{\"remember_pwd\":[\"1\"],\"password\":[\"1\"],\"username\":[\"zs\"]}'),(97,'yf1','登录系统','2016-01-26 09:31:00','/login','{\"password\":[\"1\"],\"username\":[\"yf1\"]}'),(98,'yf1','登录系统','2016-01-26 09:34:32','/login','{\"remember_pwd\":[\"1\"],\"password\":[\"1\"],\"username\":[\"yf1\"]}'),(99,'yf1','登录系统','2016-01-26 09:36:51','/login','{\"remember_pwd\":[\"1\"],\"password\":[\"1\"],\"username\":[\"yf1\"]}'),(100,'yf1','新增业绩报告','2016-01-26 09:37:14','/yjReport_add','{\"title\":[\"aaa\"],\"finish_situation\":[\"aaa\"],\"job_summary\":[\"aaa\"]}'),(101,'zs','登录系统','2016-01-26 09:37:26','/login','{\"remember_pwd\":[\"1\"],\"password\":[\"1\"],\"username\":[\"zs\"]}'),(102,'zs','登录系统','2016-01-26 09:42:26','/login','{\"remember_pwd\":[\"1\"],\"password\":[\"1\"],\"username\":[\"zs\"]}'),(103,'zs','登录系统','2016-01-26 09:45:02','/login','{\"remember_pwd\":[\"1\"],\"password\":[\"1\"],\"username\":[\"zs\"]}'),(104,'zs','登录系统','2016-01-26 09:51:35','/login','{\"remember_pwd\":[\"1\"],\"password\":[\"1\"],\"username\":[\"zs\"]}'),(105,'zs','登录系统','2016-01-26 09:53:29','/login','{\"remember_pwd\":[\"1\"],\"password\":[\"1\"],\"username\":[\"zs\"]}'),(106,'zs','登录系统','2016-01-26 10:13:10','/login','{\"remember_pwd\":[\"1\"],\"password\":[\"1\"],\"username\":[\"zs\"]}'),(107,'zs','登录系统','2016-01-26 10:22:09','/login','{\"remember_pwd\":[\"1\"],\"password\":[\"1\"],\"username\":[\"zs\"]}'),(108,'yf1','登录系统','2016-01-26 10:23:45','/login','{\"remember_pwd\":[\"1\"],\"password\":[\"1\"],\"username\":[\"yf1\"]}'),(109,'yf1','登录系统','2016-01-26 10:26:28','/login','{\"remember_pwd\":[\"1\"],\"password\":[\"1\"],\"username\":[\"yf1\"]}'),(110,'yf1','登录系统','2016-01-26 10:26:53','/login','{\"remember_pwd\":[\"1\"],\"password\":[\"1\"],\"username\":[\"yf1\"]}'),(111,'yf1','登录系统','2016-01-26 10:28:25','/login','{\"password\":[\"1\"],\"username\":[\"yf1\"]}'),(112,'yf1','新增业绩报告','2016-01-26 10:28:38','/yjReport_add','{\"title\":[\"bbb\"],\"finish_situation\":[\"bbb\"],\"job_summary\":[\"bbb\"]}'),(113,'zs','登录系统','2016-01-26 10:28:45','/login','{\"remember_pwd\":[\"1\"],\"password\":[\"1\"],\"username\":[\"zs\"]}'),(114,'yf1','新增业绩报告','2016-01-26 10:30:16','/yjReport_add','{\"title\":[\"dccc\"],\"finish_situation\":[\"ccc\"],\"job_summary\":[\"cc\"]}'),(115,'zs','登录系统','2016-01-26 10:55:18','/login','{\"remember_pwd\":[\"1\"],\"password\":[\"1\"],\"username\":[\"zs\"]}'),(116,'zs','登录系统','2016-01-26 10:55:39','/login','{\"password\":[\"1\"],\"username\":[\"zs\"]}'),(117,'zs','更新角色','2016-01-26 10:56:03','/role_edit_submit','{\"name\":[\"employee\"],\"id\":[\"2\"],\"privilegeId\":[\"16\",\"17\",\"18\",\"19\",\"20\",\"2\",\"12\",\"13\",\"14\",\"15\",\"26\",\"27\",\"28\",\"29\",\"30\",\"21\",\"22\",\"23\",\"24\",\"25\",\"31\",\"32\",\"33\",\"34\",\"35\"],\"menuIds\":[\"1,6,7,8,6,7,8,2,9,10,9,10,3,11,11,4,22,22,5,12,12\"],\"desc\":[\"普通员工\"]}'),(118,'zs','更新角色','2016-01-26 10:56:15','/role_edit_submit','{\"name\":[\"administrator\"],\"id\":[\"1\"],\"privilegeId\":[\"16\",\"17\",\"18\",\"19\",\"20\",\"6\",\"7\",\"8\",\"9\",\"10\",\"1\",\"2\",\"3\",\"4\",\"5\",\"11\",\"12\",\"13\",\"14\",\"15\",\"36\",\"37\",\"38\",\"39\",\"40\",\"41\",\"42\",\"43\",\"44\",\"45\",\"26\",\"27\",\"28\",\"29\",\"30\",\"21\",\"22\",\"23\",\"24\",\"25\",\"46\",\"47\",\"31\",\"32\",\"33\",\"34\",\"35\"],\"menuIds\":[\"1,6,7,8,6,7,8,2,9,10,9,10,3,11,11,4,22,22,5,12,12,13,14,20,15,16,21,23,14,20,15,16,21,23,17,19,18,19,18,24,25,26,30,25,26,30,27,28,29,28,29\"],\"desc\":[\"超级管理员\"]}'),(119,'zs','登录系统','2016-01-26 11:00:52','/login','{\"password\":[\"1\"],\"username\":[\"zs\"]}'),(120,'zs','登录系统','2016-01-26 11:02:54','/login','{\"password\":[\"1\"],\"username\":[\"zs\"]}'),(121,'zs','登录系统','2016-01-26 12:32:37','/login','{\"password\":[\"1\"],\"username\":[\"zs\"]}'),(122,'zs','登录系统','2016-01-26 12:33:54','/login','{\"password\":[\"1\"],\"username\":[\"zs\"]}'),(123,'zs','登录系统','2016-01-26 13:00:28','/login','{\"password\":[\"1\"],\"username\":[\"zs\"]}'),(124,'zs','登录系统','2016-01-26 13:02:38','/login','{\"password\":[\"1\"],\"username\":[\"zs\"]}'),(125,'zs','新增考勤记录','2016-01-26 13:03:29','/kaoqin_add','{\"date\":[\"2016-01-26\"],\"morning_sign_time\":[\"08:53:12\"],\"emp_id\":[\"7\"],\"afternoon_sign_time\":[\"17:34:22\"]}'),(126,'zs','登录系统','2016-01-26 13:05:44','/login','{\"password\":[\"1\"],\"username\":[\"zs\"]}'),(127,'zs','新增考勤记录','2016-01-26 13:08:48','/kaoqin_add','{\"date\":[\"2016-01-26\"],\"morning_sign_time\":[\"08:58:32\"],\"emp_id\":[\"6\"],\"afternoon_sign_time\":[\"17:30:33\"]}'),(128,'zs','修改考勤记录','2016-01-26 13:10:32','/kaoqin_edit_submit','{\"date\":[\"2016-01-26\"],\"morning_sign_time\":[\"08:56:34\"],\"id\":[\"4\"],\"afternoon_sign_time\":[\"17:34:23\"]}'),(129,'zs','删除考勤记录','2016-01-26 13:10:39','/kaoqin_del/5','{}'),(130,'zs','登录系统','2016-01-26 13:12:57','/login','{\"password\":[\"1\"],\"username\":[\"zs\"]}'),(131,'zs','登录系统','2016-01-26 13:54:35','/login','{\"password\":[\"1\"],\"username\":[\"zs\"]}'),(132,'zs','登录系统','2016-01-26 13:58:08','/login','{\"password\":[\"1\"],\"username\":[\"zs\"]}'),(133,'zs','新增薪资','2016-01-26 13:58:41','/salary_add','{\"date\":[\"2016-01-26\"],\"empId\":[\"-1\"],\"kaoqin_minus\":[\"\"],\"butie\":[\"200\"],\"bonus\":[\"100\"],\"shebao\":[\"\"],\"basic_salary\":[\"1000\"],\"shifa_money\":[\"1300\"],\"yingde_money\":[\"1300\"],\"gongjijin\":[\"\"],\"jiaban_plus\":[\"\"]}'),(134,'zs','登录系统','2016-01-26 13:59:51','/login','{\"password\":[\"1\"],\"username\":[\"zs\"]}'),(135,'zs','新增薪资','2016-01-26 14:00:17','/salary_add','{\"date\":[\"2016-01-26\"],\"empId\":[\"-1\"],\"kaoqin_minus\":[\"\"],\"butie\":[\"110\"],\"bonus\":[\"100\"],\"shebao\":[\"\"],\"basic_salary\":[\"1000\"],\"shifa_money\":[\"1210\"],\"yingde_money\":[\"1210\"],\"gongjijin\":[\"\"],\"jiaban_plus\":[\"\"]}'),(136,'zs','新增薪资','2016-01-26 14:01:00','/salary_add','{\"date\":[\"2016-01-26\"],\"empId\":[\"-1\"],\"kaoqin_minus\":[\"\"],\"butie\":[\"110\"],\"bonus\":[\"100\"],\"shebao\":[\"\"],\"basic_salary\":[\"1000\"],\"shifa_money\":[\"1210\"],\"yingde_money\":[\"1210\"],\"gongjijin\":[\"\"],\"jiaban_plus\":[\"\"]}'),(137,'zs','登录系统','2016-01-26 14:02:42','/login','{\"password\":[\"1\"],\"username\":[\"zs\"]}'),(138,'zs','登录系统','2016-01-26 14:05:21','/login','{\"password\":[\"1\"],\"username\":[\"zs\"]}'),(139,'zs','新增薪资','2016-01-26 14:05:51','/salary_add','{\"date\":[\"2016-01-26\"],\"empId\":[\"7\"],\"kaoqin_minus\":[\"1\"],\"butie\":[\"110\"],\"bonus\":[\"1\"],\"shebao\":[\"1\"],\"basic_salary\":[\"11\"],\"shifa_money\":[\"1100\"],\"yingde_money\":[\"1100\"],\"gongjijin\":[\"1\"],\"jiaban_plus\":[\"1\"]}'),(140,'zs','登录系统','2016-01-26 14:07:39','/login','{\"password\":[\"1\"],\"username\":[\"zs\"]}'),(141,'zs','登录系统','2016-01-26 14:09:32','/login','{\"password\":[\"1\"],\"username\":[\"zs\"]}'),(142,'zs','登录系统','2016-01-26 14:10:59','/login','{\"password\":[\"1\"],\"username\":[\"zs\"]}'),(143,'zs','修改薪资','2016-01-26 14:11:20','/salary_edit_submit','{\"date\":[\"2016-01-26\"],\"kaoqin_minus\":[\"4.0\"],\"butie\":[\"410.0\"],\"bonus\":[\"4.0\"],\"shebao\":[\"4.0\"],\"basic_salary\":[\"41.0\"],\"shifa_money\":[\"4100.0\"],\"id\":[\"2\"],\"yingde_money\":[\"4100.0\"],\"gongjijin\":[\"4.0\"],\"jiaban_plus\":[\"4.0\"]}'),(144,'zs','修改薪资','2016-01-26 14:11:34','/salary_edit_submit','{\"date\":[\"2016-01-08\"],\"kaoqin_minus\":[\"4.0\"],\"butie\":[\"410.0\"],\"bonus\":[\"4.0\"],\"shebao\":[\"4.0\"],\"basic_salary\":[\"41.0\"],\"shifa_money\":[\"4100.0\"],\"id\":[\"2\"],\"yingde_money\":[\"4100.0\"],\"gongjijin\":[\"4.0\"],\"jiaban_plus\":[\"4.0\"]}'),(145,'zs','删除薪资','2016-01-26 14:11:38','/salary_del/2','{}'),(146,'zs','登录系统','2016-01-26 14:17:45','/login','{\"password\":[\"1\"],\"username\":[\"zs\"]}'),(147,'zs','登录系统','2016-01-26 14:19:27','/login','{\"password\":[\"1\"],\"username\":[\"zs\"]}'),(148,'zs','登录系统','2016-01-26 16:32:34','/login','{\"password\":[\"1\"],\"username\":[\"zs\"]}'),(149,'zs','登录系统','2016-01-27 09:17:06','/login','{\"password\":[\"1\"],\"username\":[\"zs\"]}'),(150,'zs','登录系统','2016-01-27 10:51:38','/login','{\"password\":[\"1\"],\"username\":[\"zs\"]}'),(151,'zs','登录系统','2016-01-27 10:58:57','/login','{\"password\":[\"1\"],\"username\":[\"zs\"]}'),(152,'zs','登录系统','2016-01-27 11:01:42','/login','{\"password\":[\"1\"],\"username\":[\"zs\"]}'),(153,'zs','更新角色','2016-01-27 11:02:18','/role_edit_submit','{\"name\":[\"administrator\"],\"id\":[\"1\"],\"privilegeId\":[\"48\",\"16\",\"17\",\"18\",\"19\",\"20\",\"6\",\"7\",\"8\",\"9\",\"10\",\"1\",\"2\",\"3\",\"4\",\"5\",\"11\",\"12\",\"13\",\"14\",\"15\",\"36\",\"37\",\"38\",\"39\",\"40\",\"41\",\"42\",\"43\",\"44\",\"45\",\"26\",\"27\",\"28\",\"29\",\"30\",\"21\",\"22\",\"23\",\"24\",\"25\",\"46\",\"47\",\"31\",\"32\",\"33\",\"34\",\"35\"],\"menuIds\":[\"1,6,7,8,6,7,8,2,9,10,9,10,3,11,11,4,22,22,5,12,12,13,14,20,15,16,21,23,14,20,15,16,21,23,17,19,18,19,18,24,25,26,30,25,26,30,27,28,29,28,29\"],\"desc\":[\"超级管理员\"]}'),(154,'zs','登录系统','2016-01-27 11:02:32','/login','{\"password\":[\"1\"],\"username\":[\"zs\"]}'),(155,'zs','登录系统','2016-01-27 15:02:02','/login','{\"password\":[\"1\"],\"username\":[\"zs\"]}'),(156,'zs','登录系统','2016-01-27 15:49:05','/login','{\"password\":[\"1\"],\"username\":[\"zs\"]}'),(157,'zs','新增部门','2016-01-27 15:49:27','/dept_add','{\"name\":[\"\"],\"fzr_id\":[\"-1\"],\"sort\":[\"7\"]}'),(158,'zs','登录系统','2016-01-27 15:52:26','/login','{\"password\":[\"1\"],\"username\":[\"zs\"]}'),(159,'zs','登录系统','2016-01-27 16:01:47','/login','{\"password\":[\"1\"],\"username\":[\"zs\"]}'),(160,'zs','登录系统','2016-01-27 16:03:53','/login','{\"password\":[\"1\"],\"username\":[\"zs\"]}'),(161,'zs','登录系统','2016-01-28 13:06:39','/login','{\"password\":[\"1\"],\"username\":[\"zs\"]}'),(162,'zs','登录系统','2016-01-28 13:17:38','/login','{\"password\":[\"1\"],\"username\":[\"zs\"]}'),(163,'zs','登录系统','2016-01-28 13:52:12','/login','{\"password\":[\"1\"],\"username\":[\"zs\"]}'),(164,'zs','登录系统','2016-01-28 14:00:54','/login','{\"password\":[\"1\"],\"username\":[\"zs\"]}'),(165,'zs','登录系统','2016-01-28 14:09:41','/login','{\"password\":[\"1\"],\"username\":[\"zs\"]}'),(166,'zs','登录系统','2016-01-28 14:13:06','/login','{\"password\":[\"1\"],\"username\":[\"zs\"]}'),(167,'zs','登录系统','2016-01-28 14:22:58','/login','{\"password\":[\"1\"],\"username\":[\"zs\"]}'),(168,'zs','登录系统','2016-01-28 14:30:43','/login','{\"password\":[\"1\"],\"username\":[\"zs\"]}'),(169,'yf1','登录系统','2016-01-28 14:31:31','/login','{\"password\":[\"1\"],\"username\":[\"yf1\"]}'),(170,'zs','登录系统','2016-01-28 14:47:50','/login','{\"password\":[\"1\"],\"username\":[\"zs\"]}'),(171,'yf1','登录系统','2016-01-28 14:48:16','/login','{\"password\":[\"1\"],\"username\":[\"yf1\"]}'),(172,'zs','登录系统','2016-01-28 15:03:29','/login','{\"password\":[\"1\"],\"username\":[\"zs\"]}'),(173,'yf1','登录系统','2016-01-28 15:09:34','/login','{\"password\":[\"1\"],\"username\":[\"yf1\"]}'),(174,'zs','登录系统','2016-01-28 15:11:30','/login','{\"password\":[\"1\"],\"username\":[\"zs\"]}'),(175,'zs','登录系统','2016-01-28 16:27:12','/login','{\"password\":[\"1\"],\"username\":[\"zs\"]}'),(176,'yf1','登录系统','2016-01-28 16:27:34','/login','{\"password\":[\"1\"],\"username\":[\"yf1\"]}'),(177,'yf1','新增加班申请','2016-01-28 16:28:12','/jiabanApply_add','{\"end_time\":[\"2016-01-28 03:00:00\"],\"day_num\":[\"0\"],\"start_time\":[\"2016-01-28 01:00:00\"],\"reason\":[\"服务器文件更新\"],\"hour_num\":[\"3\"]}'),(178,'zs','批准加班','2016-01-28 16:29:55','/jiabanApproval_approve/4','{}'),(179,'yf1','新增加班申请','2016-01-28 16:32:42','/jiabanApply_add','{\"end_time\":[\"2016-01-28 02:00:00\"],\"day_num\":[\"0\"],\"start_time\":[\"2016-01-28 00:00:00\"],\"reason\":[\"更新游戏\"],\"hour_num\":[\"2\"]}'),(180,'zs','批准加班','2016-01-28 16:32:59','/jiabanApproval_approve/5','{}'),(181,'zs','登录系统','2016-01-28 16:35:32','/login','{\"password\":[\"1\"],\"username\":[\"zs\"]}'),(182,'yf1','登录系统','2016-01-28 16:36:16','/login','{\"password\":[\"1\"],\"username\":[\"yf1\"]}'),(183,'yf1','新增加班申请','2016-01-28 16:36:35','/jiabanApply_add','{\"end_time\":[\"2016-01-29 00:00:00\"],\"day_num\":[\"1\"],\"start_time\":[\"2016-01-28 00:00:00\"],\"reason\":[\"aaaabbbb\"],\"hour_num\":[\"0\"]}'),(184,'zs','批准加班','2016-01-28 16:38:07','/jiabanApproval_approve/6','{}'),(185,'yf1','登录系统','2016-01-28 16:40:07','/login','{\"password\":[\"1\"],\"username\":[\"yf1\"]}'),(186,'zs','登录系统','2016-01-28 16:40:21','/login','{\"password\":[\"1\"],\"username\":[\"zs\"]}'),(187,'yf1','新增请假申请','2016-01-28 16:40:41','/qingjiaApply_add','{\"start_time\":[\"2016-01-28 00:00:00\"],\"reason\":[\"肝炎\"],\"hour_num\":[\"0\"],\"end_time\":[\"2016-01-29 00:00:00\"],\"day_num\":[\"1\"],\"type\":[\"SICK\"]}'),(188,'zs','不批准请假','2016-01-28 16:41:09','/qingjiaApproval_against/6','{}'),(189,'yf1','登录系统','2016-01-28 16:50:19','/login','{\"password\":[\"1\"],\"username\":[\"yf1\"]}'),(190,'zs','登录系统','2016-01-28 16:50:24','/login','{\"password\":[\"1\"],\"username\":[\"zs\"]}'),(191,'yf1','新增业绩报告','2016-01-28 16:50:43','/yjReport_add','{\"title\":[\"ttt\"],\"finish_situation\":[\"ttt\"],\"job_summary\":[\"ttt\"]}'),(192,'yf1','新增业绩报告','2016-01-28 16:52:11','/yjReport_add','{\"title\":[\"大大大\"],\"finish_situation\":[\"点点滴滴\"],\"job_summary\":[\"大大大\"]}');

/*Table structure for table `menu` */

DROP TABLE IF EXISTS `menu`;

CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(8) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `href` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

/*Data for the table `menu` */

insert  into `menu`(`id`,`name`,`level`,`parent_id`,`sort`,`href`) values (1,'员工信息',1,NULL,1,'#'),(2,'事务申请',1,NULL,2,'#'),(3,'考勤',1,NULL,3,'#'),(4,'薪资',1,NULL,4,'#'),(5,'业绩报告',1,NULL,5,'#'),(6,'我的资料',2,1,11,'/viewEmpInfo '),(7,'员工查询',2,1,12,'/empSearch '),(8,'修改登录密码',2,1,13,'/modifyPwd'),(9,'加班申请',2,2,21,'/jiabanApply '),(10,'请假申请',2,2,22,'/qingjiaApply'),(11,'我的考勤记录',2,3,31,'/viewKaoqinList'),(12,'我的业绩报告',2,5,51,'/yjReport'),(13,'系统管理',1,NULL,6,'#'),(14,'用户管理 ',2,13,61,'/userMgr '),(15,'角色管理',2,13,63,'/roleMgr'),(16,'权限管理',2,13,64,'/authMgr'),(17,'企业管理',1,NULL,7,'#'),(18,'员工管理',2,17,72,'/empMgr'),(19,'部门管理',2,17,71,'/deptMgr'),(20,'菜单管理',2,13,62,'/menuMgr'),(21,'系统日志',2,13,65,'/syslog'),(22,'我的月工资列表',2,4,41,'/viewSalaryList'),(23,'数据备份与恢复',2,13,66,'/dataBackupRestore'),(24,'事务审批',1,NULL,8,'#'),(25,'加班审批',2,24,81,'/jiabanApproval'),(26,'请假审批',2,24,82,'/qingjiaApproval'),(27,'人事管理',1,NULL,9,'#'),(28,'考勤管理',2,27,91,'/kaoqinMgr'),(29,'薪资管理',2,27,92,'/salaryMgr'),(30,'业绩报告审核',2,24,83,'/yjReportAudit');

/*Table structure for table `module` */

DROP TABLE IF EXISTS `module`;

CREATE TABLE `module` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(16) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `module` */

insert  into `module`(`id`,`name`,`sort`) values (1,'员工资料',1),(2,'事务申请',2),(3,'考勤',3),(4,'薪资',4),(5,'业绩报告',5);

/*Table structure for table `privilege` */

DROP TABLE IF EXISTS `privilege`;

CREATE TABLE `privilege` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(16) DEFAULT NULL,
  `uri` varchar(32) DEFAULT NULL,
  `group_name` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

/*Data for the table `privilege` */

insert  into `privilege`(`id`,`name`,`uri`,`group_name`) values (1,'员工列表','emp/list','员工管理'),(2,'查询员工','emp/view','员工管理'),(3,'新增员工','emp/add','员工管理'),(4,'修改员工','emp/update','员工管理'),(5,'删除员工','emp/delete','员工管理'),(6,'部门列表','dept/list','部门管理'),(7,'查询部门','dept/view','部门管理'),(8,'新增部门','dept/add','部门管理'),(9,'修改部门','dept/update','部门管理'),(10,'删除部门','dept/delete','部门管理'),(11,'用户列表','user/list','用户管理'),(12,'新增用户','user/add','用户管理'),(13,'查询用户','user/view','用户管理'),(14,'修改用户','user/update','用户管理'),(15,'删除用户','user/delete','用户管理'),(16,'加班列表','jiaban/list','加班管理'),(17,'新增加班','jiaban/add','加班管理'),(18,'查询加班','jiaban/view','加班管理'),(19,'修改加班','jiaban/update','加班管理'),(20,'删除加班','jiaban/delete','加班管理'),(21,'请假列表','qingjia/list','请假管理'),(22,'查询请假','qingjia/view','请假管理'),(23,'新增请假','qingjia/add','请假管理'),(24,'修改请假','qingjia/update','请假管理'),(25,'删除请假','qingjia/delete','请假管理'),(26,'业绩列表','yj/list','业绩管理'),(27,'查询业绩','yj/view','业绩管理'),(28,'新增业绩','yj/add','业绩管理'),(29,'修改业绩','yj/update','业绩管理'),(30,'删除业绩','yj/delete','业绩管理'),(31,'角色列表','role/list','角色管理'),(32,'查询角色','role/view','角色管理'),(33,'新增角色','role/add','角色管理'),(34,'修改角色','role/update','角色管理'),(35,'删除角色','role/update','角色管理'),(36,'权限列表','auth/list','权限管理'),(37,'查询权限','auth/view','权限管理'),(38,'新增权限','auth/add','权限管理'),(39,'修改权限','auth/update','权限管理'),(40,'删除权限','auth/delete','权限管理'),(41,'菜单列表','menu/list','菜单管理'),(42,'新增菜单','menu/add','菜单管理'),(43,'查询菜单','menu/view','菜单管理'),(44,'修改菜单','menu/update','菜单管理'),(45,'删除菜单','menu/delete','菜单管理'),(46,'考勤管理','hr/kaoqinMgr','人事管理'),(47,'薪资管理','hr/salaryMgr','人事管理'),(48,'数据库备份与恢复','data/backupRestore','数据管理');

/*Table structure for table `qingjia` */

DROP TABLE IF EXISTS `qingjia`;

CREATE TABLE `qingjia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_id` int(11) DEFAULT NULL,
  `emp_name` varchar(5) DEFAULT NULL,
  `dept_name` varchar(16) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `day_num` int(11) DEFAULT NULL,
  `hour_num` int(11) DEFAULT NULL,
  `qj_type` varchar(5) DEFAULT NULL,
  `qj_reason` varchar(32) NOT NULL,
  `submit_time` datetime DEFAULT NULL,
  `audit_status` varchar(5) DEFAULT NULL,
  `audit_person` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_qj_emp` (`emp_id`),
  CONSTRAINT `FK_Reference_qj_emp` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `qingjia` */

insert  into `qingjia`(`id`,`emp_id`,`emp_name`,`dept_name`,`start_time`,`end_time`,`day_num`,`hour_num`,`qj_type`,`qj_reason`,`submit_time`,`audit_status`,`audit_person`) values (3,2,'钟山','研发部','2015-12-29 09:00:00','2015-12-30 09:00:00',1,0,'事假','老婆生孩子','2016-01-04 13:30:06','1','无'),(4,7,'研发1','研发部','2016-01-25 00:00:00','2016-01-26 00:00:00',1,0,'病假','头疼','2016-01-25 17:30:12','1','钟山'),(5,7,'研发1','研发部','2016-01-25 00:00:00','2016-01-27 00:00:00',2,0,'事假','家中有事','2016-01-25 17:30:46','0','钟山'),(6,7,'研发1','研发部','2016-01-28 00:00:00','2016-01-29 00:00:00',1,0,'病假','肝炎','2016-01-28 16:40:41','0','钟山');

/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(16) DEFAULT NULL,
  `role_desc` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `role` */

insert  into `role`(`id`,`name`,`role_desc`) values (1,'administrator','超级管理员'),(2,'employee','普通员工'),(3,'hr','人事');

/*Table structure for table `role_menu` */

DROP TABLE IF EXISTS `role_menu`;

CREATE TABLE `role_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL,
  `menu_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=260 DEFAULT CHARSET=utf8;

/*Data for the table `role_menu` */

insert  into `role_menu`(`id`,`role_id`,`menu_id`) values (89,3,11),(90,3,12),(91,3,13),(92,3,14),(93,3,17),(94,3,18),(95,3,19),(96,3,1),(97,3,2),(98,3,3),(99,3,4),(100,3,5),(101,3,6),(102,3,7),(103,3,8),(104,3,9),(105,3,10),(187,2,11),(188,2,22),(189,2,12),(190,2,1),(191,2,2),(192,2,3),(193,2,4),(194,2,5),(195,2,6),(196,2,7),(197,2,8),(198,2,9),(199,2,10),(230,1,22),(231,1,23),(232,1,24),(233,1,25),(234,1,26),(235,1,27),(236,1,28),(237,1,29),(238,1,30),(239,1,10),(240,1,11),(241,1,12),(242,1,13),(243,1,14),(244,1,15),(245,1,16),(246,1,17),(247,1,18),(248,1,19),(249,1,1),(250,1,2),(251,1,3),(252,1,4),(253,1,5),(254,1,6),(255,1,7),(256,1,8),(257,1,9),(258,1,20),(259,1,21);

/*Table structure for table `role_privilege` */

DROP TABLE IF EXISTS `role_privilege`;

CREATE TABLE `role_privilege` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL,
  `privilege_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_ra_auth` (`privilege_id`)
) ENGINE=InnoDB AUTO_INCREMENT=431 DEFAULT CHARSET=utf8;

/*Data for the table `role_privilege` */

insert  into `role_privilege`(`id`,`role_id`,`privilege_id`) values (146,3,16),(147,3,17),(148,3,18),(149,3,19),(150,3,20),(151,3,6),(152,3,7),(153,3,8),(154,3,9),(155,3,10),(156,3,1),(157,3,2),(158,3,3),(159,3,4),(160,3,5),(161,3,11),(162,3,12),(163,3,13),(164,3,14),(165,3,15),(166,3,26),(167,3,27),(168,3,28),(169,3,29),(170,3,30),(171,3,21),(172,3,22),(173,3,23),(174,3,24),(175,3,25),(311,2,16),(312,2,17),(313,2,18),(314,2,19),(315,2,20),(316,2,2),(317,2,12),(318,2,13),(319,2,14),(320,2,15),(321,2,26),(322,2,27),(323,2,28),(324,2,29),(325,2,30),(326,2,21),(327,2,22),(328,2,23),(329,2,24),(330,2,25),(331,2,31),(332,2,32),(333,2,33),(334,2,34),(335,2,35),(383,1,48),(384,1,16),(385,1,17),(386,1,18),(387,1,19),(388,1,20),(389,1,6),(390,1,7),(391,1,8),(392,1,9),(393,1,10),(394,1,1),(395,1,2),(396,1,3),(397,1,4),(398,1,5),(399,1,11),(400,1,12),(401,1,13),(402,1,14),(403,1,15),(404,1,36),(405,1,37),(406,1,38),(407,1,39),(408,1,40),(409,1,41),(410,1,42),(411,1,43),(412,1,44),(413,1,45),(414,1,26),(415,1,27),(416,1,28),(417,1,29),(418,1,30),(419,1,21),(420,1,22),(421,1,23),(422,1,24),(423,1,25),(424,1,46),(425,1,47),(426,1,31),(427,1,32),(428,1,33),(429,1,34),(430,1,35);

/*Table structure for table `salary` */

DROP TABLE IF EXISTS `salary`;

CREATE TABLE `salary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_id` int(11) DEFAULT NULL,
  `emp_name` varchar(5) DEFAULT NULL,
  `dept_name` varchar(16) DEFAULT NULL,
  `basic_salary` double DEFAULT NULL,
  `butie` double DEFAULT NULL,
  `bonus` double DEFAULT NULL,
  `jiaban_plus` double DEFAULT NULL,
  `kaoqing_minus` double DEFAULT NULL,
  `gongjijin` double DEFAULT NULL,
  `shebao` double DEFAULT NULL,
  `yingde_money` double DEFAULT NULL,
  `shifa_money` double DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_salary_emp` (`emp_id`),
  CONSTRAINT `FK_Reference_salary_emp` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `salary` */

insert  into `salary`(`id`,`emp_id`,`emp_name`,`dept_name`,`basic_salary`,`butie`,`bonus`,`jiaban_plus`,`kaoqing_minus`,`gongjijin`,`shebao`,`yingde_money`,`shifa_money`,`date`) values (1,2,'钟山','研发部',1000,200,0,0,0,0,0,1200,1200,'2015-11-10');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_id` int(11) DEFAULT NULL,
  `username` varchar(16) NOT NULL,
  `password` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `AK_Key_2` (`username`),
  KEY `FK_Reference_user_emp` (`emp_id`),
  CONSTRAINT `FK_Reference_user_emp` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`id`,`emp_id`,`username`,`password`) values (1,1,'xwq','698d51a19d8a121ce581499d7b701668'),(2,2,'zs','c4ca4238a0b923820dcc509a6f75849b'),(4,3,'smg','c4ca4238a0b923820dcc509a6f75849b'),(5,5,'test','698d51a19d8a121ce581499d7b701668'),(6,6,'nyy','c4ca4238a0b923820dcc509a6f75849b'),(7,7,'yf1','c4ca4238a0b923820dcc509a6f75849b');

/*Table structure for table `user_role` */

DROP TABLE IF EXISTS `user_role`;

CREATE TABLE `user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Data for the table `user_role` */

insert  into `user_role`(`id`,`user_id`,`role_id`) values (5,5,1),(6,5,2),(9,4,2),(10,3,2),(11,2,1),(12,6,3),(13,7,2);

/*Table structure for table `waichu` */

DROP TABLE IF EXISTS `waichu`;

CREATE TABLE `waichu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_id` int(11) DEFAULT NULL,
  `emp_name` varchar(5) DEFAULT NULL,
  `dept_name` varchar(16) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `day_num` int(11) DEFAULT NULL,
  `hour_num` int(11) DEFAULT NULL,
  `wc_reason` varchar(32) NOT NULL,
  `audit_status` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_wc_emp` (`emp_id`),
  CONSTRAINT `FK_Reference_wc_emp` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `waichu` */

/*Table structure for table `yj_report` */

DROP TABLE IF EXISTS `yj_report`;

CREATE TABLE `yj_report` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_id` int(11) DEFAULT NULL,
  `emp_name` varchar(5) DEFAULT NULL,
  `dept_name` varchar(16) DEFAULT NULL,
  `title` varchar(64) DEFAULT NULL,
  `finish_situation` text,
  `job_summary` varchar(256) DEFAULT NULL,
  `submit_date` date DEFAULT NULL,
  `audited` tinyint(1) DEFAULT NULL,
  `audit_person` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_yj_emp` (`emp_id`),
  CONSTRAINT `FK_Reference_yj_emp` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `yj_report` */

insert  into `yj_report`(`id`,`emp_id`,`emp_name`,`dept_name`,`title`,`finish_situation`,`job_summary`,`submit_date`,`audited`,`audit_person`) values (1,2,'钟山','研发部','10月工作报告',NULL,NULL,'2015-11-02',1,NULL),(2,7,'研发1','研发部','aaa','aaa','aaa','2016-01-26',1,NULL),(3,7,'研发1','研发部','bbb','bbb','bbb','2016-01-26',1,NULL),(4,7,'研发1','研发部','dccc','ccc','cc','2016-01-26',1,'钟山'),(5,7,'研发1','研发部','ttt','ttt','ttt','2016-01-28',1,'钟山'),(6,7,'研发1','研发部','大大大','点点滴滴','大大大','2016-01-28',1,'钟山');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
