/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50710
Source Host           : localhost:3306
Source Database       : manage

Target Server Type    : MYSQL
Target Server Version : 50710
File Encoding         : 65001

Date: 2017-06-16 21:07:00
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for ps_article
-- ----------------------------
DROP TABLE IF EXISTS `ps_article`;
CREATE TABLE `ps_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_title` varchar(255) DEFAULT NULL COMMENT '标题',
  `item_content` text COMMENT '内容',
  `type_id` int(2) DEFAULT NULL,
  `add_time` datetime DEFAULT NULL,
  `view_count` int(11) DEFAULT '0' COMMENT '浏览量',
  `is_publish` int(2) DEFAULT NULL COMMENT '是否发布',
  `author` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ps_article
-- ----------------------------
INSERT INTO `ps_article` VALUES ('8', '第一篇文章', '<p>vv线程V型从v程序需宣传册vv&nbsp; 说的归属感</p><p>胜多负少否</p><p><img src=\"/TrainingProject/resources/Uploads/images/56e38322-1789-451f-baf5-5384ddce3c4f.png\" alt=\"2017-04-19_130831\" style=\"max-width: 100%; width: 620px; height: 419px;\" class=\"\"></p><p><br></p>', '7', '2017-06-16 00:00:00', '0', '1', 'mingshan');

-- ----------------------------
-- Table structure for ps_article_type
-- ----------------------------
DROP TABLE IF EXISTS `ps_article_type`;
CREATE TABLE `ps_article_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_type` varchar(255) DEFAULT NULL,
  `item_flag` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_sys_article_type` (`item_type`),
  UNIQUE KEY `idx_sys_article_flag` (`item_flag`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ps_article_type
-- ----------------------------
INSERT INTO `ps_article_type` VALUES ('1', '好书相伴', 'book');
INSERT INTO `ps_article_type` VALUES ('2', '教师风采', 'teacher');
INSERT INTO `ps_article_type` VALUES ('5', '爱在身边', 'love');
INSERT INTO `ps_article_type` VALUES ('7', '读书心得', 'read');

-- ----------------------------
-- Table structure for ps_friend_link
-- ----------------------------
DROP TABLE IF EXISTS `ps_friend_link`;
CREATE TABLE `ps_friend_link` (
  `id` int(11) NOT NULL,
  `link_name` varchar(20) DEFAULT NULL,
  `link_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ps_friend_link
-- ----------------------------

-- ----------------------------
-- Table structure for ps_security_permission
-- ----------------------------
DROP TABLE IF EXISTS `ps_security_permission`;
CREATE TABLE `ps_security_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permission_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ps_security_permission
-- ----------------------------
INSERT INTO `ps_security_permission` VALUES ('7', 'student:select');

-- ----------------------------
-- Table structure for ps_security_resources
-- ----------------------------
DROP TABLE IF EXISTS `ps_security_resources`;
CREATE TABLE `ps_security_resources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(255) DEFAULT NULL COMMENT 'url',
  `permission` varchar(255) DEFAULT NULL COMMENT 'permission',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ps_security_resources
-- ----------------------------
INSERT INTO `ps_security_resources` VALUES ('34', '/admin/user/**', 'anon');
INSERT INTO `ps_security_resources` VALUES ('37', '/admin/teacher/findStudentList', 'perms[student:select]');
INSERT INTO `ps_security_resources` VALUES ('38', '/admin/authority/**', 'roleOrFilter[\"superadmin\"]');
INSERT INTO `ps_security_resources` VALUES ('39', '//admin/teacher/**', 'roleOrFilter[\"superadmin,teacher\"]');

-- ----------------------------
-- Table structure for ps_security_role
-- ----------------------------
DROP TABLE IF EXISTS `ps_security_role`;
CREATE TABLE `ps_security_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_code` varchar(255) DEFAULT NULL,
  `role_name` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `idx_sys_security_role_name` (`role_name`) USING BTREE,
  UNIQUE KEY `idx_sys_security_role_code` (`role_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ps_security_role
-- ----------------------------
INSERT INTO `ps_security_role` VALUES ('1', 'superadmin', '超级管理员', null);
INSERT INTO `ps_security_role` VALUES ('2', 'guest', '游客', null);
INSERT INTO `ps_security_role` VALUES ('3', 'teacher', '老师', null);
INSERT INTO `ps_security_role` VALUES ('8', 'student', '学生', null);

-- ----------------------------
-- Table structure for ps_security_role_to_permission
-- ----------------------------
DROP TABLE IF EXISTS `ps_security_role_to_permission`;
CREATE TABLE `ps_security_role_to_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `permission_id` bigint(20) DEFAULT NULL,
  `role_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `idx_sys_security_role_to_resource_role_id` (`role_id`),
  KEY `idx_sys_security_role_to_resource_resource_id` (`permission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ps_security_role_to_permission
-- ----------------------------
INSERT INTO `ps_security_role_to_permission` VALUES ('7', '7', '1');
INSERT INTO `ps_security_role_to_permission` VALUES ('8', '7', '3');

-- ----------------------------
-- Table structure for ps_security_user
-- ----------------------------
DROP TABLE IF EXISTS `ps_security_user`;
CREATE TABLE `ps_security_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `status` int(1) DEFAULT '1' COMMENT '用户状态 1为正常，0为禁用',
  `email` varchar(255) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL COMMENT '工号',
  `add_time` datetime DEFAULT NULL,
  `out_date` double DEFAULT NULL,
  `validataCode` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `idx_sys_security_username` (`username`) USING BTREE,
  UNIQUE KEY `idx_sys_security_email` (`email`) USING BTREE,
  UNIQUE KEY `idx_sys_security_number` (`number`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ps_security_user
-- ----------------------------
INSERT INTO `ps_security_user` VALUES ('2', 'mingshan', '5f9d2c655e00de34e468083421a4d4ef', 'mingshan', '1', '715604127@qq.com', '345', '2017-04-22 00:00:00', null, null);
INSERT INTO `ps_security_user` VALUES ('3', 'admin', '038bdaf98f2037b31f1e75b5b4c9b26e', 'admin', '1', '499445428@qq.com', '2233', '2017-04-22 00:00:00', null, null);
INSERT INTO `ps_security_user` VALUES ('21', 'wwww', 'f9c67f2d435360ce6b67791fba882b28', 'wwww', '1', '123313123@qq.com', null, '2017-05-22 19:35:29', null, null);

-- ----------------------------
-- Table structure for ps_security_user_to_role
-- ----------------------------
DROP TABLE IF EXISTS `ps_security_user_to_role`;
CREATE TABLE `ps_security_user_to_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `sys_security_user_to_role_user_id` (`user_id`) USING BTREE,
  KEY `sys_security_user_to_role_role_id` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ps_security_user_to_role
-- ----------------------------
INSERT INTO `ps_security_user_to_role` VALUES ('5', '3', '2');
INSERT INTO `ps_security_user_to_role` VALUES ('9', '1', '3');
INSERT INTO `ps_security_user_to_role` VALUES ('12', '2', '20');
INSERT INTO `ps_security_user_to_role` VALUES ('13', '8', '21');
INSERT INTO `ps_security_user_to_role` VALUES ('14', '8', '22');
INSERT INTO `ps_security_user_to_role` VALUES ('15', '2', '23');
