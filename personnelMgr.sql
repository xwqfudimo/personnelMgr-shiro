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
  `fzr` varchar(5) DEFAULT NULL,
  `fzr_phone` varchar(11) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `department` */

insert  into `department`(`id`,`name`,`emp_num`,`fzr`,`fzr_phone`,`sort`) values (1,'研发部',2,NULL,NULL,1),(2,'行政部',1,NULL,NULL,2),(3,'财务部',1,NULL,NULL,3);

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
  `resume` varchar(64) DEFAULT NULL,
  `self_intro` varchar(128) DEFAULT NULL,
  `beizhu` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_emp_dept` (`dept_id`),
  CONSTRAINT `FK_Reference_emp_dept` FOREIGN KEY (`dept_id`) REFERENCES `department` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `employee` */

insert  into `employee`(`id`,`name`,`dept_id`,`sex`,`birthdate`,`nationality`,`zzmm`,`marriage`,`address`,`rzsj`,`xl`,`phone`,`email`,`card`,`resume`,`self_intro`,`beizhu`) values (1,'夏维强',1,'男',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,'钟山',1,'男','1994-03-17','汉族','群众','未婚','凌霄天庭','2015-02-11','无','1251239678','zs@qq.com','530521199402316678','无','吾乃帝皇',NULL),(3,'沈蔓歌',2,'女','2010-12-24','汉','群众','未婚','邻家','2015-06-24','本科','1251239678','mg@qq.com','530521199402316676','无','歌后',NULL),(4,'古千幽',3,'女',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,'沈万三',3,'男',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `event` */

DROP TABLE IF EXISTS `event`;

CREATE TABLE `event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_msg` varchar(64) NOT NULL,
  `record_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `event` */

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `jiaban` */

insert  into `jiaban`(`id`,`emp_id`,`emp_name`,`dept_name`,`start_time`,`end_time`,`day_num`,`hour_num`,`jb_reason`,`submit_time`,`audit_status`,`audit_person`) values (1,2,'钟山','研发部','2015-12-24 15:09:24','2015-12-24 20:09:29',0,5,'赶工','2016-01-04 13:30:28',0,'无');

/*Table structure for table `kaoqing` */

DROP TABLE IF EXISTS `kaoqing`;

CREATE TABLE `kaoqing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_id` int(11) DEFAULT NULL,
  `emp_name` varchar(5) DEFAULT NULL,
  `dept_name` varchar(16) DEFAULT NULL,
  `moring_sign_time` time DEFAULT NULL,
  `afternoon_sign_time` time DEFAULT NULL,
  `t_date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_kq_emp` (`emp_id`),
  CONSTRAINT `FK_Reference_kq_emp` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `kaoqing` */

insert  into `kaoqing`(`id`,`emp_id`,`emp_name`,`dept_name`,`moring_sign_time`,`afternoon_sign_time`,`t_date`) values (1,2,'钟山','研发部','08:52:24','17:34:22','2015-12-29'),(2,2,'钟山','研发部','08:55:24','18:25:43','2015-11-11'),(3,2,'钟山','研发部','08:46:24','18:12:43','2015-11-20');

/*Table structure for table `log` */

DROP TABLE IF EXISTS `log`;

CREATE TABLE `log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `log_msg` varchar(64) NOT NULL,
  `record_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `log` */

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `qingjia` */

insert  into `qingjia`(`id`,`emp_id`,`emp_name`,`dept_name`,`start_time`,`end_time`,`day_num`,`hour_num`,`qj_type`,`qj_reason`,`submit_time`,`audit_status`,`audit_person`) values (2,2,'钟山','研发部','2015-12-28 09:00:00','2015-12-28 17:30:00',1,0,'病假','感冒','2016-01-04 13:30:08',NULL,NULL),(3,2,'钟山','研发部','2015-12-29 09:00:00','2015-12-30 09:00:00',1,0,'事假','老婆生孩子','2016-01-04 13:30:06','1','无');

/*Table structure for table `resource` */

DROP TABLE IF EXISTS `resource`;

CREATE TABLE `resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(16) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `href` varchar(32) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `type` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

/*Data for the table `resource` */

insert  into `resource`(`id`,`name`,`level`,`parent_id`,`href`,`sort`,`type`) values (1,'员工资料',1,0,'#',1,'menu'),(2,'事务申请',1,0,'#',2,'menu'),(3,'考勤',1,0,'#',3,'menu'),(4,'薪资',1,0,'#',4,'menu'),(5,'业绩报告',1,0,'#',5,'menu'),(6,'我的资料',2,1,'/viewEmpInfo',11,'menu'),(7,'员工查询',2,1,'/empSearch',12,'menu'),(8,'修改登录密码',2,1,'/modifyPwd',13,'menu'),(9,'加班申请',2,2,'/jiabanApply',21,'menu'),(10,'请假申请',2,2,'/qingjiaApply',22,'menu'),(11,'我的考勤记录',2,3,'/viewKaoqingList',31,'menu'),(12,'我的业绩报告',2,5,'/yjReport',51,'menu'),(13,'角色管理',1,0,'/roleMgr',6,'menu'),(14,'权限管理',1,0,'/authMgr',7,'menu');

/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(16) DEFAULT NULL,
  `role_desc` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `role` */

insert  into `role`(`id`,`name`,`role_desc`) values (1,'administrator','超级管理员'),(2,'employee','普通员工');

/*Table structure for table `role_resource` */

DROP TABLE IF EXISTS `role_resource`;

CREATE TABLE `role_resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL,
  `res_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_ra_auth` (`res_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

/*Data for the table `role_resource` */

insert  into `role_resource`(`id`,`role_id`,`res_id`) values (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,7),(8,1,8),(9,1,9),(10,1,10),(11,1,11),(12,1,12),(13,1,13),(14,1,14);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `salary` */

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`id`,`emp_id`,`username`,`password`) values (1,1,'xwq','202cb962ac59075b964b07152d234b70'),(2,2,'zs','202cb962ac59075b964b07152d234b70');

/*Table structure for table `user_role` */

DROP TABLE IF EXISTS `user_role`;

CREATE TABLE `user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `user_role` */

insert  into `user_role`(`id`,`user_id`,`role_id`) values (1,2,1);

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
  `finish_state` text,
  `job_summary` varchar(256) DEFAULT NULL,
  `submit_date` date DEFAULT NULL,
  `audited` tinyint(1) DEFAULT NULL,
  `audit_person` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_yj_emp` (`emp_id`),
  CONSTRAINT `FK_Reference_yj_emp` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `yj_report` */

insert  into `yj_report`(`id`,`emp_id`,`emp_name`,`dept_name`,`title`,`finish_state`,`job_summary`,`submit_date`,`audited`,`audit_person`) values (1,2,'钟山','研发部','10月工作报告',NULL,NULL,'2015-11-02',1,NULL),(2,2,'钟山','研发部','11月工作报告111','111','11','2015-12-04',0,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
