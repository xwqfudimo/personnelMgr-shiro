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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `department` */

insert  into `department`(`id`,`name`,`emp_num`,`fzr`,`fzr_phone`,`sort`) values (1,'研发部',2,NULL,NULL,1),(2,'行政部',1,NULL,NULL,2),(3,'财务部',1,NULL,NULL,3),(4,'人事部',1,'','',4);

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `employee` */

insert  into `employee`(`id`,`name`,`dept_id`,`sex`,`birthdate`,`nationality`,`zzmm`,`marriage`,`address`,`rzsj`,`xl`,`phone`,`email`,`card`,`resume`,`self_intro`,`beizhu`) values (1,'夏维强',1,'男',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,'钟山',1,'男','1994-03-17','汉族','群众','未婚','凌霄天庭','2015-02-11','无','1251239678','zs@qq.com','530521199402316678','无','吾乃帝皇',NULL),(3,'沈蔓歌',2,'女','2010-12-24','汉','群众','未婚','邻家','2015-06-24','本科','1251239678','mg@qq.com','530521199402316676','无','歌后',NULL),(4,'古千幽',3,'女',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,'沈万三',3,'男',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,'念悠悠',4,'女','2009-01-21','汉族','群众','未婚','','2015-01-21','高中','','','',NULL,NULL,'');

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
  `uname` varchar(16) NOT NULL,
  `log_msg` varchar(64) NOT NULL,
  `record_time` datetime NOT NULL,
  `url` varchar(128) DEFAULT NULL,
  `param` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

/*Data for the table `log` */

insert  into `log`(`id`,`uname`,`log_msg`,`record_time`,`url`,`param`) values (2,'zs','修改部门','2016-01-21 13:02:12','/dept_edit_submit','{\"name\":[\"市场部3\"],\"sort\":[\"5\"],\"id\":[\"5\"],\"fzr_phone\":[\"\"],\"fzr\":[\"\"]}'),(3,'zs','删除部门','2016-01-21 13:03:05','/dept_del/5','{}'),(4,'zs','新增部门','2016-01-21 13:07:23','/dept_add','{\"name\":[\"市场部\"],\"sort\":[\"5\"],\"fzr_phone\":[\"\"],\"fzr\":[\"\"]}'),(5,'zs','删除部门','2016-01-21 13:07:27','/dept_del/6','{}'),(6,'zs','登录','2016-01-21 13:35:51','/login','{\"password\":[\"1\"],\"username\":[\"zs\"]}'),(7,'zs','登录','2016-01-21 13:37:41','/login','{\"password\":[\"1\"],\"username\":[\"zs\"]}'),(8,'zs','登录','2016-01-21 13:41:13','/login','{\"password\":[\"1\"],\"username\":[\"zs\"]}'),(9,'zs','登录','2016-01-21 13:44:28','/login','{\"password\":[\"1\"],\"username\":[\"zs\"]}'),(10,'zs','登录','2016-01-21 13:46:23','/login','{\"password\":[\"1\"],\"username\":[\"zs\"]}'),(11,'zs','登录','2016-01-21 13:49:00','/login','{\"password\":[\"1\"],\"username\":[\"zs\"]}'),(12,'zs','登录','2016-01-21 13:50:40','/login','{\"password\":[\"1\"],\"username\":[\"zs\"]}'),(13,'zs','登录系统','2016-01-21 13:56:55','/login','{\"password\":[\"1\"],\"username\":[\"zs\"]}'),(14,'zs','登录系统','2016-01-21 14:14:07','/login','{\"password\":[\"1\"],\"username\":[\"zs\"]}'),(15,'zs','登录系统','2016-01-21 14:17:27','/login','{\"password\":[\"1\"],\"username\":[\"zs\"]}');

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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

/*Data for the table `menu` */

insert  into `menu`(`id`,`name`,`level`,`parent_id`,`sort`,`href`) values (1,'员工信息',1,NULL,1,'#'),(2,'事务申请',1,NULL,2,'#'),(3,'考勤',1,NULL,3,'#'),(4,'薪资',1,NULL,4,'#'),(5,'业绩报告',1,NULL,5,'#'),(6,'我的资料',2,1,11,'/viewEmpInfo '),(7,'员工查询',2,1,12,'/empSearch '),(8,'修改登录密码',2,1,13,'/modifyPwd'),(9,'加班申请',2,2,21,'/jiabanApply '),(10,'请假申请',2,2,22,'/qingjiaApply'),(11,'我的考勤记录',2,3,31,'/viewKaoqingList'),(12,'我的业绩报告',2,5,51,'/yjReport'),(13,'系统管理',1,NULL,6,'#'),(14,'用户管理 ',2,13,61,'/userMgr '),(15,'角色管理',2,13,63,'/roleMgr'),(16,'权限管理',2,13,64,'/authMgr'),(17,'企业管理',1,NULL,7,'#'),(18,'员工管理',2,17,72,'/empMgr'),(19,'部门管理',2,17,71,'/deptMgr'),(20,'菜单管理',2,13,62,'/menuMgr'),(21,'系统日志',2,13,65,'/syslog');

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
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

/*Data for the table `privilege` */

insert  into `privilege`(`id`,`name`,`uri`,`group_name`) values (1,'员工列表','emp/list','员工管理'),(2,'查询员工','emp/view','员工管理'),(3,'新增员工','emp/add','员工管理'),(4,'修改员工','emp/update','员工管理'),(5,'删除员工','emp/delete','员工管理'),(6,'部门列表','dept/list','部门管理'),(7,'查询部门','dept/view','部门管理'),(8,'新增部门','dept/add','部门管理'),(9,'修改部门','dept/update','部门管理'),(10,'删除部门','dept/delete','部门管理'),(11,'用户列表','user/list','用户管理'),(12,'新增用户','user/add','用户管理'),(13,'查询用户','user/view','用户管理'),(14,'修改用户','user/update','用户管理'),(15,'删除用户','user/delete','用户管理'),(16,'加班列表','jiaban/list','加班管理'),(17,'新增加班','jiaban/add','加班管理'),(18,'查询加班','jiaban/view','加班管理'),(19,'修改加班','jiaban/update','加班管理'),(20,'删除加班','jiaban/delete','加班管理'),(21,'请假列表','qingjia/list','请假管理'),(22,'查询请假','qingjia/view','请假管理'),(23,'新增请假','qingjia/add','请假管理'),(24,'修改请假','qingjia/update','请假管理'),(25,'删除请假','qingjia/delete','请假管理'),(26,'业绩列表','yj/list','业绩管理'),(27,'查询业绩','yj/view','业绩管理'),(28,'新增业绩','yj/add','业绩管理'),(29,'修改业绩','yj/update','业绩管理'),(30,'删除业绩','yj/delete','业绩管理'),(31,'角色列表','role/list','角色管理'),(32,'查询角色','role/view','角色管理'),(33,'新增角色','role/add','角色管理'),(34,'修改角色','role/update','角色管理'),(35,'删除角色','role/update','角色管理'),(36,'权限列表','auth/list','权限管理'),(37,'查询权限','auth/view','权限管理'),(38,'新增权限','auth/add','权限管理'),(39,'修改权限','auth/update','权限管理'),(40,'删除权限','auth/delete','权限管理'),(41,'菜单列表','menu/list','菜单管理'),(42,'新增菜单','menu/add','菜单管理'),(43,'查询菜单','menu/view','菜单管理'),(44,'修改菜单','menu/update','菜单管理'),(45,'删除菜单','menu/delete','菜单管理');

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

insert  into `qingjia`(`id`,`emp_id`,`emp_name`,`dept_name`,`start_time`,`end_time`,`day_num`,`hour_num`,`qj_type`,`qj_reason`,`submit_time`,`audit_status`,`audit_person`) values (3,2,'钟山','研发部','2015-12-29 09:00:00','2015-12-30 09:00:00',1,0,'事假','老婆生孩子','2016-01-04 13:30:06','1','无');

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
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8;

/*Data for the table `role_menu` */

insert  into `role_menu`(`id`,`role_id`,`menu_id`) values (22,2,11),(23,2,1),(24,2,12),(25,2,2),(26,2,3),(27,2,4),(28,2,5),(29,2,6),(30,2,7),(31,2,8),(32,2,9),(33,2,10),(34,1,11),(35,1,12),(36,1,13),(37,1,14),(38,1,15),(39,1,16),(40,1,17),(41,1,18),(42,1,19),(43,1,1),(44,1,2),(45,1,3),(46,1,4),(47,1,5),(48,1,6),(49,1,7),(50,1,8),(51,1,9),(52,1,20),(53,1,10),(54,1,21),(89,3,11),(90,3,12),(91,3,13),(92,3,14),(93,3,17),(94,3,18),(95,3,19),(96,3,1),(97,3,2),(98,3,3),(99,3,4),(100,3,5),(101,3,6),(102,3,7),(103,3,8),(104,3,9),(105,3,10);

/*Table structure for table `role_privilege` */

DROP TABLE IF EXISTS `role_privilege`;

CREATE TABLE `role_privilege` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL,
  `privilege_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_ra_auth` (`privilege_id`)
) ENGINE=InnoDB AUTO_INCREMENT=176 DEFAULT CHARSET=utf8;

/*Data for the table `role_privilege` */

insert  into `role_privilege`(`id`,`role_id`,`privilege_id`) values (15,2,16),(16,2,17),(17,2,18),(18,2,19),(19,2,20),(20,2,2),(21,2,12),(22,2,13),(23,2,14),(24,2,15),(25,2,26),(26,2,27),(27,2,28),(28,2,29),(29,2,30),(30,2,21),(31,2,22),(32,2,23),(33,2,24),(34,2,25),(35,2,31),(36,2,32),(37,2,33),(38,2,34),(39,2,35),(40,1,16),(41,1,17),(42,1,18),(43,1,19),(44,1,20),(45,1,6),(46,1,7),(47,1,8),(48,1,9),(49,1,10),(50,1,1),(51,1,2),(52,1,3),(53,1,4),(54,1,5),(55,1,11),(56,1,12),(57,1,13),(58,1,14),(59,1,15),(60,1,36),(61,1,37),(62,1,38),(63,1,39),(64,1,40),(65,1,41),(66,1,42),(67,1,43),(68,1,44),(69,1,45),(70,1,26),(71,1,27),(72,1,28),(73,1,29),(74,1,30),(75,1,21),(76,1,22),(77,1,23),(78,1,24),(79,1,25),(80,1,31),(81,1,32),(82,1,33),(83,1,34),(84,1,35),(146,3,16),(147,3,17),(148,3,18),(149,3,19),(150,3,20),(151,3,6),(152,3,7),(153,3,8),(154,3,9),(155,3,10),(156,3,1),(157,3,2),(158,3,3),(159,3,4),(160,3,5),(161,3,11),(162,3,12),(163,3,13),(164,3,14),(165,3,15),(166,3,26),(167,3,27),(168,3,28),(169,3,29),(170,3,30),(171,3,21),(172,3,22),(173,3,23),(174,3,24),(175,3,25);

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`id`,`emp_id`,`username`,`password`) values (1,1,'xwq','698d51a19d8a121ce581499d7b701668'),(2,2,'zs','c4ca4238a0b923820dcc509a6f75849b'),(4,3,'smg','c4ca4238a0b923820dcc509a6f75849b'),(5,5,'test','698d51a19d8a121ce581499d7b701668'),(6,6,'nyy','c4ca4238a0b923820dcc509a6f75849b');

/*Table structure for table `user_role` */

DROP TABLE IF EXISTS `user_role`;

CREATE TABLE `user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

/*Data for the table `user_role` */

insert  into `user_role`(`id`,`user_id`,`role_id`) values (5,5,1),(6,5,2),(9,4,2),(10,3,2),(11,2,1),(12,6,3);

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `yj_report` */

insert  into `yj_report`(`id`,`emp_id`,`emp_name`,`dept_name`,`title`,`finish_state`,`job_summary`,`submit_date`,`audited`,`audit_person`) values (1,2,'钟山','研发部','10月工作报告',NULL,NULL,'2015-11-02',1,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
