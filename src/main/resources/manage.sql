/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50716
Source Host           : localhost:3306
Source Database       : manage

Target Server Type    : MYSQL
Target Server Version : 50716
File Encoding         : 65001

Date: 2017-06-18 20:19:28
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
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ps_article
-- ----------------------------
INSERT INTO `ps_article` VALUES ('26', 'mmm', '<p>vvxv<br></p><p>wqee<br></p><p><br></p>', '1', '2017-06-18 15:05:56', '0', '0', 'aaweq');
INSERT INTO `ps_article` VALUES ('27', 'eqweq', '<p>weqe<br></p>', '5', '2017-06-18 15:07:41', '0', '1', 'eqw');
INSERT INTO `ps_article` VALUES ('28', 'sdadadas', '<p>weqeq<br></p>', '7', '2017-06-18 15:07:49', '0', '1', 'asddasd');
INSERT INTO `ps_article` VALUES ('29', 'mmmgrer', '<p>weqeqq<br></p>', '8', '2017-06-18 15:07:58', '0', '1', 'asa');
INSERT INTO `ps_article` VALUES ('30', 'lllllllllllllllllluytrfdsxAsdxad', '<p>weqeqqw<br></p>', '9', '2017-06-18 15:08:09', '0', '1', 'asa');
INSERT INTO `ps_article` VALUES ('31', 'ppppppppppppppppppppppppppp', '<p>wqeq<br></p>', '10', '2017-06-18 15:08:17', '0', '1', 'asa');
INSERT INTO `ps_article` VALUES ('32', '2323424242', '<p>恶趣味鹅鹅鹅鹅鹅鹅鹅鹅鹅鹅鹅鹅鹅鹅鹅鹅<br></p>', '1', '2017-06-18 15:28:36', '0', '1', '啊啊');
INSERT INTO `ps_article` VALUES ('33', '恶气企鹅企鹅请问', '<p>请问委屈<br></p>', '1', '2017-06-18 15:28:42', '0', '1', '啊啊');
INSERT INTO `ps_article` VALUES ('34', '请问恶气恶气恶气恶气', '<p>请问去<br></p>', '1', '2017-06-18 15:28:47', '0', '1', '啊啊');
INSERT INTO `ps_article` VALUES ('35', 'e请问发顺丰到付是', '<p>请问去恶趣味企鹅<br></p>', '1', '2017-06-18 15:28:53', '0', '1', '啊啊');
INSERT INTO `ps_article` VALUES ('36', 'e驱蚊器恶趣味驱蚊器恶气', '<p>请问q<br></p>', '1', '2017-06-18 15:29:05', '0', '1', '啊啊');
INSERT INTO `ps_article` VALUES ('37', '恶趣味驱蚊器饿q', '<p>请问q额请问去<br></p>', '1', '2017-06-18 15:29:19', '5', '1', '啊啊');

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ps_article_type
-- ----------------------------
INSERT INTO `ps_article_type` VALUES ('1', '好书相伴', 'book');
INSERT INTO `ps_article_type` VALUES ('2', '教师风采', 'teacher');
INSERT INTO `ps_article_type` VALUES ('5', '爱在身边', 'love');
INSERT INTO `ps_article_type` VALUES ('7', '读书心得', 'read');
INSERT INTO `ps_article_type` VALUES ('8', '智慧课堂', 'class');
INSERT INTO `ps_article_type` VALUES ('9', '教育教研', 'education');
INSERT INTO `ps_article_type` VALUES ('10', '特色活动', 'activity');
INSERT INTO `ps_article_type` VALUES ('12', '我的诸国', 'aaaaa');

-- ----------------------------
-- Table structure for ps_friend_link
-- ----------------------------
DROP TABLE IF EXISTS `ps_friend_link`;
CREATE TABLE `ps_friend_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `link_name` varchar(20) DEFAULT NULL,
  `link_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ps_friend_link
-- ----------------------------
INSERT INTO `ps_friend_link` VALUES ('1', '222', 'www.baidu.com');

-- ----------------------------
-- Table structure for ps_security_permission
-- ----------------------------
DROP TABLE IF EXISTS `ps_security_permission`;
CREATE TABLE `ps_security_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permission_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ps_security_permission
-- ----------------------------
INSERT INTO `ps_security_permission` VALUES ('8', 'upload:pic');

-- ----------------------------
-- Table structure for ps_security_resources
-- ----------------------------
DROP TABLE IF EXISTS `ps_security_resources`;
CREATE TABLE `ps_security_resources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(255) DEFAULT NULL COMMENT 'url',
  `permission` varchar(255) DEFAULT NULL COMMENT 'permission',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ps_security_resources
-- ----------------------------
INSERT INTO `ps_security_resources` VALUES ('34', '/admin/user/**', 'anon');
INSERT INTO `ps_security_resources` VALUES ('38', '/admin/authority/**', 'roleOrFilter[\"superadmin\"]');
INSERT INTO `ps_security_resources` VALUES ('39', '/admin/teacher/**', 'roleOrFilter[\"superadmin\"]');
INSERT INTO `ps_security_resources` VALUES ('40', '/admin/link/**', 'roleOrFilter[\"superadmin\"]');
INSERT INTO `ps_security_resources` VALUES ('41', '/admin/category/**', 'roleOrFilter[\"superadmin\"]');
INSERT INTO `ps_security_resources` VALUES ('42', '/admin/article/**', 'roleOrFilter[\"superadmin\"]');
INSERT INTO `ps_security_resources` VALUES ('43', '/admin/upload/uploadpic', 'perms[upload:pic]');

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ps_security_role_to_permission
-- ----------------------------
INSERT INTO `ps_security_role_to_permission` VALUES ('9', '8', '1');

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
