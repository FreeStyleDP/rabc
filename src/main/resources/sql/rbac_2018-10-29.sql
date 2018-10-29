# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.19)
# Database: rbac
# Generation Time: 2018-10-29 12:05:27 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table menu
# ------------------------------------------------------------

DROP TABLE IF EXISTS `menu`;

CREATE TABLE `menu` (
  `name` varchar(50) DEFAULT NULL COMMENT '菜单显示名字',
  `parent_name` varchar(50) DEFAULT NULL COMMENT '父菜单',
  `ordering` int(11) DEFAULT NULL COMMENT '排列序号',
  `id` varchar(50) NOT NULL,
  `icon` varchar(100) DEFAULT NULL COMMENT '图标地址',
  `parent_ordering` int(11) DEFAULT NULL COMMENT '父菜单排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table permission
# ------------------------------------------------------------

DROP TABLE IF EXISTS `permission`;

CREATE TABLE `permission` (
  `id` varchar(50) NOT NULL DEFAULT '' COMMENT '权限id',
  `remark` varchar(50) NOT NULL DEFAULT '' COMMENT '权限描述',
  `project_id` varchar(50) NOT NULL DEFAULT '' COMMENT '所属项目',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `permission` WRITE;
/*!40000 ALTER TABLE `permission` DISABLE KEYS */;

INSERT INTO `permission` (`id`, `remark`, `project_id`)
VALUES
	('/permission/deletePermission.do','删除权限','permission'),
	('/permission/insertPermission.do','插入权限','permission'),
	('/permission/selectPermission.do','查询权限','permission'),
	('/permission/toPermission','进入权限修改页面','permission'),
	('/permission/updatePermission.do','更新权限','permission'),
	('/role/toRole','进入角色页面','role');

/*!40000 ALTER TABLE `permission` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table role
# ------------------------------------------------------------

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `id` varchar(50) NOT NULL DEFAULT '' COMMENT '角色id',
  `remark` varchar(50) DEFAULT NULL COMMENT '角色描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;

INSERT INTO `role` (`id`, `remark`)
VALUES
	('logManager','日志监测员'),
	('manager','管理员'),
	('permissionManager','权限管理员'),
	('superManager','超级管理员'),
	('user1','一级用户'),
	('user2','二级用户'),
	('user3','三级用户');

/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table role_permission
# ------------------------------------------------------------

DROP TABLE IF EXISTS `role_permission`;

CREATE TABLE `role_permission` (
  `role_id` varchar(50) NOT NULL DEFAULT '' COMMENT '角色id',
  `permission_id` varchar(50) NOT NULL DEFAULT '' COMMENT '权限id',
  UNIQUE KEY `role_id` (`role_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `role_permission` WRITE;
/*!40000 ALTER TABLE `role_permission` DISABLE KEYS */;

INSERT INTO `role_permission` (`role_id`, `permission_id`)
VALUES
	('manager','/user'),
	('superManager','/role'),
	('superManager','/user'),
	('user1','/user/selectUser.do'),
	('user2','/user/updateUser.do');

/*!40000 ALTER TABLE `role_permission` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` varchar(50) NOT NULL DEFAULT '' COMMENT '用户id',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '用户名字',
  `password` varchar(50) NOT NULL DEFAULT '' COMMENT '密码',
  `sex` int(1) NOT NULL DEFAULT '0' COMMENT '0:男 1:女 2:不详',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;

INSERT INTO `user` (`id`, `name`, `password`, `sex`)
VALUES
	('11','王五','202cb962ac59075b964b07152d234b70',1),
	('33','张三1211','d41d8cd98f00b204e9800998ecf8427e',1),
	('66','2312','202cb962ac59075b964b07152d234b70',1),
	('a','a1','d41d8cd98f00b204e9800998ecf8427e',0),
	('b','b1','d41d8cd98f00b204e9800998ecf8427e',0),
	('c','c12','d41d8cd98f00b204e9800998ecf8427e',0),
	('dengping','邓平','202cb962ac59075b964b07152d234b70',1),
	('dp','dp','202cb962ac59075b964b07152d234b70',0),
	('dp3','邓平3','202cb962ac59075b964b07152d234b70',2),
	('test12','','202cb962ac59075b964b07152d234b70',1),
	('test122','','202cb962ac59075b964b07152d234b70',1),
	('test13','','202cb962ac59075b964b07152d234b70',1);

/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table user_role
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_role`;

CREATE TABLE `user_role` (
  `user_id` varchar(50) NOT NULL DEFAULT '' COMMENT '用户id',
  `role_id` varchar(50) NOT NULL DEFAULT '' COMMENT '角色id',
  KEY `user_id` (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;

INSERT INTO `user_role` (`user_id`, `role_id`)
VALUES
	('1','1'),
	('1','1'),
	('1','1'),
	('1','1'),
	('2','1'),
	('2','1'),
	('2','1'),
	('2','1'),
	('2','1'),
	('2','1'),
	('2','1'),
	('2','1'),
	('2','1'),
	('2','1'),
	('2','1'),
	('2','1'),
	('2','1'),
	('2','1'),
	('2','1'),
	('2','1'),
	('2','1'),
	('2','1'),
	('2','1'),
	('2','1'),
	('2','1'),
	('2','1'),
	('2','1'),
	('2','1'),
	('2','1'),
	('2','1'),
	('2','1'),
	('2','1'),
	('2','1'),
	('2','1'),
	('2','1'),
	('a','logManager'),
	('a','manager'),
	('a','permissionManager'),
	('a','user1'),
	('a','user2'),
	('b','permissionManager'),
	('b','superManager'),
	('b','user1'),
	('c','user2'),
	('dp','manager'),
	('dp','superManager'),
	('dp','user1'),
	('dp','user2'),
	('dp3','manager'),
	('dp3','superManager'),
	('dp3','user1'),
	('dp3','user2'),
	('superManager','superManager'),
	('test122','manager'),
	('test122','superManager'),
	('test122','user1'),
	('test122','user2');

/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
