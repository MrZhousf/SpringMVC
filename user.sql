/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : office

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2017-03-17 14:15:23
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(100) NOT NULL,
  `sex` varchar(10) DEFAULT NULL,
  `age` int(5) DEFAULT NULL,
  `department` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '张三', '男', '21', '移动研发部');
INSERT INTO `user` VALUES ('2', '王红', '女', '23', '移动研发部');
INSERT INTO `user` VALUES ('3', '葛正华', '男', '31', '市场部');
INSERT INTO `user` VALUES ('4', '钱显', '男', '22', '财务部');
INSERT INTO `user` VALUES ('5', '宋妍妍', '女', '36', '运营部');
INSERT INTO `user` VALUES ('7', '测试', '男', '23', '测试运维部');
INSERT INTO `user` VALUES ('8', '文芳', '女', '26', '客服部');
INSERT INTO `user` VALUES ('9', '琴婷华', '女', '23', '客服部');
