/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50710
Source Host           : localhost:3306
Source Database       : projectma

Target Server Type    : MYSQL
Target Server Version : 50710
File Encoding         : 65001

Date: 2022-06-07 21:54:27
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for image
-- ----------------------------
DROP TABLE IF EXISTS `image`;
CREATE TABLE `image` (
  `imageid` int(11) NOT NULL AUTO_INCREMENT,
  `imageurl` varchar(255) NOT NULL,
  `imagestate` int(11) NOT NULL DEFAULT '1' COMMENT '图片状态',
  PRIMARY KEY (`imageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of image
-- ----------------------------

-- ----------------------------
-- Table structure for member
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
  `userid` int(11) NOT NULL,
  `projectid` int(11) NOT NULL,
  `office` int(11) NOT NULL COMMENT '4-''创建者''3-‘承包商’2-‘组长’1-‘员工’'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of member
-- ----------------------------

-- ----------------------------
-- Table structure for progress
-- ----------------------------
DROP TABLE IF EXISTS `progress`;
CREATE TABLE `progress` (
  `projectid` int(11) NOT NULL,
  `stage` varchar(255) NOT NULL COMMENT '阶段',
  `task` varchar(255) NOT NULL COMMENT '任务描述',
  `pace` decimal(10,0) NOT NULL COMMENT '完成度',
  `imageid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of progress
-- ----------------------------

-- ----------------------------
-- Table structure for project
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project` (
  `projectid` int(11) NOT NULL AUTO_INCREMENT,
  `prpjectname` varchar(255) NOT NULL,
  `createrid` int(11) NOT NULL,
  `state` int(11) NOT NULL COMMENT '0-‘正在进行’、1-‘竣工’',
  `imageid` int(11) DEFAULT NULL,
  `price` decimal(10,0) NOT NULL,
  PRIMARY KEY (`projectid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of project
-- ----------------------------

-- ----------------------------
-- Table structure for reibursement
-- ----------------------------
DROP TABLE IF EXISTS `reibursement`;
CREATE TABLE `reibursement` (
  `reid` int(11) NOT NULL AUTO_INCREMENT,
  `imageid` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `state` varchar(255) NOT NULL DEFAULT '0' COMMENT '0-''未通过或正在审批''1-‘通过’',
  `money` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`reid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of reibursement
-- ----------------------------

-- ----------------------------
-- Table structure for requirement
-- ----------------------------
DROP TABLE IF EXISTS `requirement`;
CREATE TABLE `requirement` (
  `requirementid` int(11) NOT NULL AUTO_INCREMENT,
  `projectid` int(11) NOT NULL,
  `message` varchar(255) NOT NULL,
  `office` int(11) NOT NULL COMMENT '发布人的职务',
  `imageid` int(11) DEFAULT NULL,
  `userid` int(11) NOT NULL,
  PRIMARY KEY (`requirementid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of requirement
-- ----------------------------

-- ----------------------------
-- Table structure for sgin
-- ----------------------------
DROP TABLE IF EXISTS `sgin`;
CREATE TABLE `sgin` (
  `userid` int(11) NOT NULL,
  `projectid` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `salary` decimal(10,0) NOT NULL,
  `days` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sgin
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `tel` varchar(255) NOT NULL,
  `sex` int(11) NOT NULL COMMENT '0-‘男’--1-‘女’',
  `imageid` int(11) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
