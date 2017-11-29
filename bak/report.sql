/*
SQLyog  v12.2.6 (64 bit)
MySQL - 5.1.73-community : Database - report
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`report` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `report`;

/*Table structure for table `dimension_browser` */

DROP TABLE IF EXISTS `dimension_browser`;

CREATE TABLE `dimension_browser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `browser_name` varchar(45) NOT NULL DEFAULT '' COMMENT '浏览器名称',
  `browser_version` varchar(255) NOT NULL DEFAULT '' COMMENT '浏览器版本号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='浏览器维度信息表';

/*Data for the table `dimension_browser` */

insert  into `dimension_browser`(`id`,`browser_name`,`browser_version`) values 
(2,'Chrome','46.0.2490.71'),
(3,'Chrome','all'),
(4,'IE','11.0'),
(5,'IE','all'),
(6,'IE','10.0'),
(7,'IE','9.0'),
(8,'Chrome','45.0.125.2'),
(9,'Sogo','11.0'),
(10,'Sogo','10.0'),
(11,'Sogo','all');

/*Table structure for table `dimension_currency_type` */

DROP TABLE IF EXISTS `dimension_currency_type`;

CREATE TABLE `dimension_currency_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `currency_name` varchar(10) DEFAULT NULL COMMENT '货币名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='支付货币类型维度信息表';

/*Data for the table `dimension_currency_type` */

insert  into `dimension_currency_type`(`id`,`currency_name`) values 
(1,'RMB'),
(2,'all');

/*Table structure for table `dimension_date` */

DROP TABLE IF EXISTS `dimension_date`;

CREATE TABLE `dimension_date` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `year` int(11) DEFAULT NULL,
  `season` int(11) DEFAULT NULL,
  `month` int(11) DEFAULT NULL,
  `week` int(11) DEFAULT NULL,
  `day` int(11) DEFAULT NULL,
  `calendar` date DEFAULT NULL,
  `type` enum('year','season','month','week','day') DEFAULT NULL COMMENT '日期格式',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='时间维度信息表';

/*Data for the table `dimension_date` */

insert  into `dimension_date`(`id`,`year`,`season`,`month`,`week`,`day`,`calendar`,`type`) values 
(1,2015,4,12,50,12,'2015-12-12','day'),
(2,2015,4,12,51,13,'2015-12-13','day'),
(3,2015,4,12,51,14,'2015-12-14','day'),
(4,2015,4,12,51,15,'2015-12-15','day'),
(5,2015,4,12,50,12,'2015-12-11','day'),
(6,2015,4,12,50,8,'2015-12-08','day'),
(7,2016,1,1,2,9,'2016-01-09','day'),
(8,2016,1,1,2,10,'2016-01-10','day');

/*Table structure for table `dimension_event` */

DROP TABLE IF EXISTS `dimension_event`;

CREATE TABLE `dimension_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(255) DEFAULT NULL COMMENT '事件种类category',
  `action` varchar(255) DEFAULT NULL COMMENT '事件action名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='事件维度信息表';

/*Data for the table `dimension_event` */

insert  into `dimension_event`(`id`,`category`,`action`) values 
(1,'订单产生事件','订单开始'),
(2,'订单产生事件','添加购物车'),
(3,'订单产生事件','确认订单信息'),
(4,'订单产生事件','订单支付');

/*Table structure for table `dimension_inbound` */

DROP TABLE IF EXISTS `dimension_inbound`;

CREATE TABLE `dimension_inbound` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL COMMENT '父级外链id',
  `name` varchar(45) DEFAULT NULL COMMENT '外链名称',
  `url` varchar(255) DEFAULT NULL COMMENT '外链url',
  `type` int(11) DEFAULT NULL COMMENT '外链类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='外链源数据维度信息表';

/*Data for the table `dimension_inbound` */

insert  into `dimension_inbound`(`id`,`parent_id`,`name`,`url`,`type`) values 
(1,NULL,'all',NULL,1),
(2,NULL,'其他外链',NULL,1),
(3,NULL,'baidu','www.baidu.com',0),
(4,NULL,'google','www.google.*',0),
(5,NULL,'搜狗','www.sogou.com',0),
(6,NULL,'yahoo','[\\w|.]+.yahoo.com',0),
(7,NULL,'搜搜','www.soso.com',0),
(8,NULL,'114','so.114.com.cn',0),
(9,NULL,'有道','www.youdao.com',0),
(10,NULL,'狗狗搜索','www.gougou.hk',0),
(11,NULL,'bing','cn.bing.com',0),
(12,NULL,'360搜索','www.360sosou.com',0),
(13,NULL,'好搜','www.haosou.com',0);

/*Table structure for table `dimension_kpi` */

DROP TABLE IF EXISTS `dimension_kpi`;

CREATE TABLE `dimension_kpi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kpi_name` varchar(45) DEFAULT NULL COMMENT 'kpi维度名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='kpi维度相关信息表';

/*Data for the table `dimension_kpi` */

insert  into `dimension_kpi`(`id`,`kpi_name`) values 
(1,'hourly_active_user'),
(2,'hourly_sessions'),
(3,'hourly_sessions_length'),
(4,'view_depth_of_user'),
(5,'view_depth_of_session');

/*Table structure for table `dimension_location` */

DROP TABLE IF EXISTS `dimension_location`;

CREATE TABLE `dimension_location` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country` varchar(45) DEFAULT NULL COMMENT '国家名称',
  `province` varchar(45) DEFAULT NULL COMMENT '省份名称',
  `city` varchar(45) DEFAULT NULL COMMENT '城市名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='地域信息维度表';

/*Data for the table `dimension_location` */

insert  into `dimension_location`(`id`,`country`,`province`,`city`) values 
(1,'中国','all','all'),
(2,'中国','上海市','all'),
(3,'中国','上海市','unknown'),
(4,'中国','广东省','all'),
(5,'中国','广东省','广州市');

/*Table structure for table `dimension_os` */

DROP TABLE IF EXISTS `dimension_os`;

CREATE TABLE `dimension_os` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `os_name` varchar(45) NOT NULL DEFAULT '' COMMENT '操作系统名称',
  `os_version` varchar(45) NOT NULL DEFAULT '' COMMENT '操作系统版本号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='操作系统信息维度表';

/*Data for the table `dimension_os` */

/*Table structure for table `dimension_payment_type` */

DROP TABLE IF EXISTS `dimension_payment_type`;

CREATE TABLE `dimension_payment_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_type` varchar(255) DEFAULT NULL COMMENT '支付方式名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='支付方式维度信息表';

/*Data for the table `dimension_payment_type` */

insert  into `dimension_payment_type`(`id`,`payment_type`) values 
(1,'alipay'),
(2,'weixinpay'),
(3,'all');

/*Table structure for table `dimension_platform` */

DROP TABLE IF EXISTS `dimension_platform`;

CREATE TABLE `dimension_platform` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `platform_name` varchar(45) DEFAULT NULL COMMENT '平台名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='平台维度信息表';

/*Data for the table `dimension_platform` */

insert  into `dimension_platform`(`id`,`platform_name`) values 
(1,'all'),
(2,'website');

/*Table structure for table `event_info` */

DROP TABLE IF EXISTS `event_info`;

CREATE TABLE `event_info` (
  `event_dimension_id` int(11) NOT NULL DEFAULT '0',
  `key` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `times` int(11) DEFAULT '0' COMMENT '触发次数',
  PRIMARY KEY (`event_dimension_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='描述event的属性信息，在本次项目中不会用到';

/*Data for the table `event_info` */

/*Table structure for table `member_info` */

DROP TABLE IF EXISTS `member_info`;

CREATE TABLE `member_info` (
  `member_id` varchar(32) NOT NULL DEFAULT '' COMMENT '会员id，是一个最多32位的字母数字字符串',
  `last_visit_date` date DEFAULT NULL COMMENT '最后访问日期',
  `created` date DEFAULT NULL,
  PRIMARY KEY (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `member_info` */

insert  into `member_info`(`member_id`,`last_visit_date`,`created`) values 
('beifengnet','2015-12-14','2015-12-14'),
('gerryliu','2015-12-12','2015-12-12');

/*Table structure for table `order_info` */

DROP TABLE IF EXISTS `order_info`;

CREATE TABLE `order_info` (
  `order_id` varchar(50) NOT NULL DEFAULT '',
  `platform` varchar(50) NOT NULL DEFAULT 'unknown',
  `s_time` bigint(20) DEFAULT NULL,
  `currency_type` varchar(50) DEFAULT NULL,
  `payment_type` varchar(50) DEFAULT NULL,
  `amount` int(11) NOT NULL DEFAULT '0' COMMENT '订单金额',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='描述订单的相关信息，该table在本次项目中的主要目标就是为了去重数据';

/*Data for the table `order_info` */

insert  into `order_info`(`order_id`,`platform`,`s_time`,`currency_type`,`payment_type`,`amount`) values 
('201601010001','website',NULL,'RMB','alipay',100),
('201601010002','website',NULL,'RMB','alipay',200),
('201601010003','website',NULL,'RMB','weixinpay',250),
('201601020001','website',NULL,'RMB','weixinpay',130),
('201601020002','website',NULL,'RMB','alipay',120),
('201601020003','website',NULL,'RMB','alipay',110),
('201601020004','website',NULL,'RMB','weixinpay',78);

/*Table structure for table `stats_device_browser` */

DROP TABLE IF EXISTS `stats_device_browser`;

CREATE TABLE `stats_device_browser` (
  `date_dimension_id` int(11) NOT NULL,
  `platform_dimension_id` int(11) NOT NULL,
  `browser_dimension_id` int(11) NOT NULL DEFAULT '0',
  `active_users` int(11) DEFAULT '0' COMMENT '活跃用户数',
  `new_install_users` int(11) DEFAULT '0' COMMENT '新增用户数',
  `total_install_users` int(11) DEFAULT '0' COMMENT '总用户数',
  `sessions` int(11) DEFAULT '0' COMMENT '会话个数',
  `sessions_length` int(11) DEFAULT '0' COMMENT '会话长度',
  `total_members` int(11) unsigned DEFAULT '0' COMMENT '总会员数',
  `active_members` int(11) unsigned DEFAULT '0' COMMENT '活跃会员数',
  `new_members` int(11) unsigned DEFAULT '0' COMMENT '新增会员数',
  `pv` int(11) DEFAULT '0' COMMENT 'pv数',
  `created` date DEFAULT NULL,
  PRIMARY KEY (`platform_dimension_id`,`date_dimension_id`,`browser_dimension_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='统计浏览器相关分析数据的统计表';

/*Data for the table `stats_device_browser` */

insert  into `stats_device_browser`(`date_dimension_id`,`platform_dimension_id`,`browser_dimension_id`,`active_users`,`new_install_users`,`total_install_users`,`sessions`,`sessions_length`,`total_members`,`active_members`,`new_members`,`pv`,`created`) values 
(7,1,2,72,72,72,164,725,18,18,18,415,'2016-01-09'),
(7,1,3,72,72,72,164,725,18,18,18,415,'2016-01-09'),
(7,1,4,19,19,19,44,168,6,6,6,55,'2016-01-09'),
(7,1,5,19,19,19,44,168,6,6,6,55,'2016-01-09'),
(7,1,9,9,9,9,27,101,3,3,3,42,'2016-01-09'),
(7,1,11,9,9,9,27,101,3,3,3,42,'2016-01-09'),
(8,1,2,74,38,110,150,330,25,15,7,234,'2016-01-10'),
(8,1,3,82,46,118,195,333,28,18,10,266,'2016-01-10'),
(8,1,4,29,18,37,83,986,10,8,4,254,'2016-01-10'),
(8,1,5,33,18,41,90,1025,11,9,5,277,'2016-01-10'),
(8,1,6,1,1,1,2,25,0,0,0,5,'2016-01-10'),
(8,1,7,3,3,3,5,14,1,1,1,18,'2016-01-10'),
(8,1,8,8,8,8,19,45,3,3,3,32,'2016-01-10'),
(8,1,9,67,25,34,188,938,4,3,1,361,'2016-01-10'),
(8,1,10,2,2,2,5,12,0,0,0,14,'2016-01-10'),
(8,1,11,69,27,36,200,950,4,3,1,375,'2016-01-10'),
(7,2,2,72,72,72,164,725,18,18,18,415,'2016-01-09'),
(7,2,3,72,72,72,164,725,18,18,18,415,'2016-01-09'),
(7,2,4,19,19,19,44,168,6,6,6,55,'2016-01-09'),
(7,2,5,19,19,19,44,168,6,6,6,55,'2016-01-09'),
(7,2,9,9,9,9,27,101,3,3,3,42,'2016-01-09'),
(7,2,11,9,9,9,27,101,3,3,3,42,'2016-01-09'),
(8,2,2,74,38,110,150,330,25,15,7,234,'2016-01-10'),
(8,2,3,82,46,118,195,333,28,18,10,266,'2016-01-10'),
(8,2,4,29,18,37,83,986,10,8,4,254,'2016-01-10'),
(8,2,5,33,18,41,90,1025,11,9,5,277,'2016-01-10'),
(8,2,6,1,1,1,2,25,0,0,0,5,'2016-01-10'),
(8,2,7,3,3,3,5,14,1,1,1,18,'2016-01-10'),
(8,2,8,8,8,8,19,45,3,3,3,32,'2016-01-10'),
(8,2,9,67,25,34,188,938,4,3,1,361,'2016-01-10'),
(8,2,10,2,2,2,5,12,0,0,0,14,'2016-01-10'),
(8,2,11,69,27,36,200,950,4,3,1,375,'2016-01-10');

/*Table structure for table `stats_device_location` */

DROP TABLE IF EXISTS `stats_device_location`;

CREATE TABLE `stats_device_location` (
  `date_dimension_id` int(11) NOT NULL,
  `platform_dimension_id` int(11) NOT NULL,
  `location_dimension_id` int(11) NOT NULL DEFAULT '0',
  `active_users` int(11) DEFAULT '0' COMMENT '活跃用户数',
  `sessions` int(11) DEFAULT '0' COMMENT '会话个数',
  `bounce_sessions` int(11) DEFAULT '0' COMMENT '跳出会话个数',
  `created` date DEFAULT NULL,
  PRIMARY KEY (`platform_dimension_id`,`date_dimension_id`,`location_dimension_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='统计地域相关分析数据的统计表';

/*Data for the table `stats_device_location` */

insert  into `stats_device_location`(`date_dimension_id`,`platform_dimension_id`,`location_dimension_id`,`active_users`,`sessions`,`bounce_sessions`,`created`) values 
(7,1,1,100,235,45,'2016-01-09'),
(7,1,2,85,187,28,'2016-01-09'),
(7,1,3,85,187,28,'2016-01-09'),
(7,1,4,15,48,17,'2016-01-09'),
(7,1,5,15,48,17,'2016-01-09'),
(8,1,1,184,452,78,'2016-01-10'),
(8,1,2,168,384,64,'2016-01-10'),
(8,1,3,168,384,64,'2016-01-10'),
(8,1,4,16,68,14,'2016-01-10'),
(8,1,5,16,68,14,'2016-01-10'),
(7,2,1,100,235,45,'2016-01-09'),
(7,2,2,85,187,28,'2016-01-09'),
(7,2,3,85,187,28,'2016-01-09'),
(7,2,4,15,48,17,'2016-01-09'),
(7,2,5,15,48,17,'2016-01-09'),
(8,2,1,184,452,78,'2016-01-10'),
(8,2,2,168,384,64,'2016-01-10'),
(8,2,3,168,384,64,'2016-01-10'),
(8,2,4,16,68,14,'2016-01-10'),
(8,2,5,16,68,14,'2016-01-10');

/*Table structure for table `stats_event` */

DROP TABLE IF EXISTS `stats_event`;

CREATE TABLE `stats_event` (
  `platform_dimension_id` int(11) NOT NULL DEFAULT '0',
  `date_dimension_id` int(11) NOT NULL DEFAULT '0',
  `event_dimension_id` int(11) NOT NULL DEFAULT '0',
  `times` int(11) DEFAULT '0' COMMENT '触发次数',
  `created` date DEFAULT NULL,
  PRIMARY KEY (`platform_dimension_id`,`date_dimension_id`,`event_dimension_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='统计事件相关分析数据的统计表';

/*Data for the table `stats_event` */

insert  into `stats_event`(`platform_dimension_id`,`date_dimension_id`,`event_dimension_id`,`times`,`created`) values 
(1,7,1,251,'2016-01-09'),
(1,7,2,186,'2016-01-09'),
(1,7,3,23,'2016-01-09'),
(1,7,4,4,'2016-01-09'),
(1,8,1,243,'2016-01-10'),
(1,8,2,153,'2016-01-10'),
(1,8,3,18,'2016-01-10'),
(1,8,4,7,'2016-01-10'),
(2,7,1,251,'2016-01-09'),
(2,7,2,186,'2016-01-09'),
(2,7,3,23,'2016-01-09'),
(2,7,4,4,'2016-01-09'),
(2,8,1,243,'2016-01-10'),
(2,8,2,153,'2016-01-10'),
(2,8,3,18,'2016-01-10'),
(2,8,4,7,'2016-01-10');

/*Table structure for table `stats_hourly` */

DROP TABLE IF EXISTS `stats_hourly`;

CREATE TABLE `stats_hourly` (
  `platform_dimension_id` int(11) NOT NULL,
  `date_dimension_id` int(11) NOT NULL,
  `kpi_dimension_id` int(11) NOT NULL,
  `hour_00` int(11) DEFAULT '0',
  `hour_01` int(11) DEFAULT '0',
  `hour_02` int(11) DEFAULT '0',
  `hour_03` int(11) DEFAULT '0',
  `hour_04` int(11) DEFAULT '0',
  `hour_05` int(11) DEFAULT '0',
  `hour_06` int(11) DEFAULT '0',
  `hour_07` int(11) DEFAULT '0',
  `hour_08` int(11) DEFAULT '0',
  `hour_09` int(11) DEFAULT '0',
  `hour_10` int(11) DEFAULT '0',
  `hour_11` int(11) DEFAULT '0',
  `hour_12` int(11) DEFAULT '0',
  `hour_13` int(11) DEFAULT '0',
  `hour_14` int(11) DEFAULT '0',
  `hour_15` int(11) DEFAULT '0',
  `hour_16` int(11) DEFAULT '0',
  `hour_17` int(11) DEFAULT '0',
  `hour_18` int(11) DEFAULT '0',
  `hour_19` int(11) DEFAULT '0',
  `hour_20` int(11) DEFAULT '0',
  `hour_21` int(11) DEFAULT '0',
  `hour_22` int(11) DEFAULT '0',
  `hour_23` int(11) DEFAULT '0',
  `created` date DEFAULT NULL,
  PRIMARY KEY (`platform_dimension_id`,`date_dimension_id`,`kpi_dimension_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='按小时统计信息的统计表';

/*Data for the table `stats_hourly` */

insert  into `stats_hourly`(`platform_dimension_id`,`date_dimension_id`,`kpi_dimension_id`,`hour_00`,`hour_01`,`hour_02`,`hour_03`,`hour_04`,`hour_05`,`hour_06`,`hour_07`,`hour_08`,`hour_09`,`hour_10`,`hour_11`,`hour_12`,`hour_13`,`hour_14`,`hour_15`,`hour_16`,`hour_17`,`hour_18`,`hour_19`,`hour_20`,`hour_21`,`hour_22`,`hour_23`,`created`) values 
(1,7,1,10,1,1,1,0,1,2,3,5,23,24,28,14,29,38,27,26,28,14,25,35,23,22,21,'2016-01-09'),
(1,7,2,12,2,1,1,0,1,5,6,8,30,35,40,24,65,81,62,55,72,36,60,82,45,28,26,'2016-01-09'),
(1,7,3,52,5,0,0,0,0,16,23,29,140,86,98,76,180,236,135,168,256,103,216,254,125,70,54,'2016-01-09'),
(1,8,1,12,1,1,0,1,0,3,2,5,25,29,31,16,31,41,43,31,27,16,18,21,22,22,19,'2016-01-10'),
(1,8,2,16,2,1,0,3,0,5,4,8,45,56,72,32,72,92,102,72,58,34,36,45,48,45,38,'2016-01-10'),
(1,8,3,72,15,0,0,25,0,53,59,87,451,443,568,321,689,1021,1125,850,620,210,250,365,380,355,340,'2016-01-10'),
(2,7,1,10,1,1,1,0,1,2,3,5,23,24,28,14,29,38,27,26,28,14,25,35,23,22,21,'2016-01-09'),
(2,7,2,12,2,1,1,0,1,5,6,8,30,35,40,24,65,81,62,55,72,36,60,82,45,28,26,'2016-01-09'),
(2,7,3,52,5,0,0,0,0,16,23,29,140,86,98,76,180,236,135,168,256,103,216,254,125,70,54,'2016-01-09'),
(2,8,1,12,1,1,0,1,0,3,2,5,25,29,31,16,31,41,43,31,27,16,18,21,22,22,19,'2016-01-10'),
(2,8,2,16,2,1,0,3,0,5,4,8,45,56,72,32,72,92,102,72,58,34,36,45,48,45,38,'2016-01-10'),
(2,8,3,72,15,0,0,25,0,53,59,87,451,443,568,321,689,1021,1125,850,620,210,250,365,380,355,340,'2016-01-10');

/*Table structure for table `stats_inbound` */

DROP TABLE IF EXISTS `stats_inbound`;

CREATE TABLE `stats_inbound` (
  `platform_dimension_id` int(11) NOT NULL DEFAULT '0',
  `date_dimension_id` int(11) NOT NULL,
  `inbound_dimension_id` int(11) NOT NULL,
  `active_users` int(11) DEFAULT '0' COMMENT '活跃用户数',
  `sessions` int(11) DEFAULT '0' COMMENT '会话个数',
  `bounce_sessions` int(11) DEFAULT '0' COMMENT '跳出会话个数',
  `created` date DEFAULT NULL,
  PRIMARY KEY (`platform_dimension_id`,`date_dimension_id`,`inbound_dimension_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='统计外链信息的统计表';

/*Data for the table `stats_inbound` */

insert  into `stats_inbound`(`platform_dimension_id`,`date_dimension_id`,`inbound_dimension_id`,`active_users`,`sessions`,`bounce_sessions`,`created`) values 
(1,7,1,41,77,29,'2016-01-09'),
(1,7,2,1,2,1,'2016-01-09'),
(1,7,3,24,53,9,'2016-01-09'),
(1,7,4,15,21,18,'2016-01-09'),
(1,7,12,1,1,1,'2016-01-09'),
(1,8,1,45,120,33,'2016-01-10'),
(1,8,2,2,2,1,'2016-01-10'),
(1,8,3,28,72,19,'2016-01-10'),
(1,8,4,19,37,11,'2016-01-10'),
(1,8,12,3,9,2,'2016-01-10'),
(2,7,1,41,77,29,'2016-01-09'),
(2,7,2,1,2,1,'2016-01-09'),
(2,7,3,24,53,9,'2016-01-09'),
(2,7,4,15,21,18,'2016-01-09'),
(2,7,12,1,1,1,'2016-01-09'),
(2,8,1,45,120,33,'2016-01-10'),
(2,8,2,2,2,1,'2016-01-10'),
(2,8,3,28,72,19,'2016-01-10'),
(2,8,4,19,37,11,'2016-01-10'),
(2,8,12,3,9,2,'2016-01-10');

/*Table structure for table `stats_order` */

DROP TABLE IF EXISTS `stats_order`;

CREATE TABLE `stats_order` (
  `platform_dimension_id` int(11) NOT NULL DEFAULT '0',
  `date_dimension_id` int(11) NOT NULL DEFAULT '0',
  `currency_type_dimension_id` int(11) NOT NULL DEFAULT '0',
  `payment_type_dimension_id` int(11) NOT NULL DEFAULT '0',
  `orders` int(11) DEFAULT '0' COMMENT '订单个数',
  `success_orders` int(11) DEFAULT '0' COMMENT '成功支付的订单个数',
  `refund_orders` int(11) DEFAULT '0' COMMENT '退款订单个数',
  `order_amount` int(11) DEFAULT '0' COMMENT '订单金额',
  `revenue_amount` int(11) DEFAULT '0' COMMENT '收入金额，也就是成功支付过的金额',
  `refund_amount` int(11) DEFAULT '0' COMMENT '退款金额',
  `total_revenue_amount` int(11) DEFAULT '0' COMMENT '迄今为止，总的订单交易额',
  `total_refund_amount` int(11) DEFAULT '0' COMMENT '迄今为止，总的退款金额',
  `created` date DEFAULT NULL,
  PRIMARY KEY (`platform_dimension_id`,`date_dimension_id`,`currency_type_dimension_id`,`payment_type_dimension_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='统计订单信息的统计表';

/*Data for the table `stats_order` */

insert  into `stats_order`(`platform_dimension_id`,`date_dimension_id`,`currency_type_dimension_id`,`payment_type_dimension_id`,`orders`,`success_orders`,`refund_orders`,`order_amount`,`revenue_amount`,`refund_amount`,`total_revenue_amount`,`total_refund_amount`,`created`) values 
(1,7,1,1,2,2,0,300,300,0,300,0,'2016-01-09'),
(1,7,1,2,1,0,0,250,0,0,0,0,'2016-01-09'),
(1,7,1,3,3,2,0,550,300,0,300,0,'2016-01-09'),
(1,7,2,1,2,2,0,300,300,0,300,0,'2016-01-09'),
(1,7,2,2,1,0,0,250,0,0,0,0,'2016-01-09'),
(1,7,2,3,3,2,0,550,300,0,300,0,'2016-01-09'),
(1,8,1,1,2,2,2,230,230,230,530,230,'2016-01-10'),
(1,8,1,2,2,2,1,208,208,78,208,78,'2016-01-10'),
(1,8,1,3,4,4,3,438,438,308,738,308,'2016-01-10'),
(1,8,2,1,2,2,2,230,230,230,530,230,'2016-01-10'),
(1,8,2,2,2,2,1,208,208,78,208,78,'2016-01-10'),
(1,8,2,3,4,4,3,438,438,308,738,308,'2016-01-10'),
(2,7,1,1,2,2,0,300,300,0,300,0,'2016-01-09'),
(2,7,1,2,1,0,0,250,0,0,0,0,'2016-01-09'),
(2,7,1,3,3,2,0,550,300,0,300,0,'2016-01-09'),
(2,7,2,1,2,2,0,300,300,0,300,0,'2016-01-09'),
(2,7,2,2,1,0,0,250,0,0,0,0,'2016-01-09'),
(2,7,2,3,3,2,0,550,300,0,300,0,'2016-01-09'),
(2,8,1,1,2,2,2,230,230,230,530,230,'2016-01-10'),
(2,8,1,2,2,2,1,208,208,78,208,78,'2016-01-10'),
(2,8,1,3,4,4,3,438,438,308,738,308,'2016-01-10'),
(2,8,2,1,2,2,2,230,230,230,530,230,'2016-01-10'),
(2,8,2,2,2,2,1,208,208,78,208,78,'2016-01-10'),
(2,8,2,3,4,4,3,438,438,308,738,308,'2016-01-10');

/*Table structure for table `stats_user` */

DROP TABLE IF EXISTS `stats_user`;

CREATE TABLE `stats_user` (
  `date_dimension_id` int(11) NOT NULL,
  `platform_dimension_id` int(11) NOT NULL,
  `active_users` int(11) DEFAULT '0' COMMENT '活跃用户数',
  `new_install_users` int(11) DEFAULT '0' COMMENT '新增用户数',
  `total_install_users` int(11) DEFAULT '0' COMMENT '总用户数',
  `sessions` int(11) DEFAULT '0' COMMENT '会话个数',
  `sessions_length` int(11) DEFAULT '0' COMMENT '会话长度',
  `total_members` int(11) unsigned DEFAULT '0' COMMENT '总会员数',
  `active_members` int(11) unsigned DEFAULT '0' COMMENT '活跃会员数',
  `new_members` int(11) unsigned DEFAULT '0' COMMENT '新增会员数',
  `created` date DEFAULT NULL,
  PRIMARY KEY (`platform_dimension_id`,`date_dimension_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='统计用户基本信息的统计表';

/*Data for the table `stats_user` */

insert  into `stats_user`(`date_dimension_id`,`platform_dimension_id`,`active_users`,`new_install_users`,`total_install_users`,`sessions`,`sessions_length`,`total_members`,`active_members`,`new_members`,`created`) values 
(7,1,100,100,100,235,994,27,27,27,'2016-01-09'),
(8,1,184,95,195,452,2350,50,30,23,'2016-01-10'),
(7,2,100,100,100,235,994,27,27,27,'2016-01-09'),
(8,2,184,95,195,452,2350,50,30,23,'2016-01-10');

/*Table structure for table `stats_view_depth` */

DROP TABLE IF EXISTS `stats_view_depth`;

CREATE TABLE `stats_view_depth` (
  `platform_dimension_id` int(11) NOT NULL DEFAULT '0',
  `date_dimension_id` int(11) NOT NULL DEFAULT '0',
  `kpi_dimension_id` int(11) NOT NULL DEFAULT '0',
  `pv1` int(11) DEFAULT '0',
  `pv2` int(11) DEFAULT '0',
  `pv3` int(11) DEFAULT '0',
  `pv4` int(11) DEFAULT '0',
  `pv5_10` int(11) DEFAULT '0',
  `pv10_30` int(11) DEFAULT '0',
  `pv30_60` int(11) DEFAULT '0',
  `pv60_plus` int(11) DEFAULT '0',
  `created` date DEFAULT NULL,
  PRIMARY KEY (`platform_dimension_id`,`date_dimension_id`,`kpi_dimension_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='统计用户浏览深度相关分析数据的统计表';

/*Data for the table `stats_view_depth` */

insert  into `stats_view_depth`(`platform_dimension_id`,`date_dimension_id`,`kpi_dimension_id`,`pv1`,`pv2`,`pv3`,`pv4`,`pv5_10`,`pv10_30`,`pv30_60`,`pv60_plus`,`created`) values 
(1,7,4,12,35,38,5,3,3,1,3,'2016-01-09'),
(1,7,5,25,79,90,13,14,7,2,5,'2016-01-09'),
(1,8,4,21,53,70,17,13,6,3,1,'2016-01-10'),
(1,8,5,56,142,167,45,31,8,2,1,'2016-01-10'),
(2,7,4,12,35,38,5,3,3,1,3,'2016-01-09'),
(2,7,5,25,79,90,13,14,7,2,5,'2016-01-09'),
(2,8,4,21,53,70,17,13,6,3,1,'2016-01-10'),
(2,8,5,56,142,167,45,31,8,2,1,'2016-01-10');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
