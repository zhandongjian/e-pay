/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50713
Source Host           : localhost:3306
Source Database       : e-pay

Target Server Type    : MYSQL
Target Server Version : 50713
File Encoding         : 65001

Date: 2017-07-28 17:57:58
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for pay_account
-- ----------------------------
DROP TABLE IF EXISTS `pay_account`;
CREATE TABLE `pay_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(10) NOT NULL COMMENT '用户ID',
  `user_type` bigint(3) DEFAULT NULL COMMENT '用户类型',
  `user_name` varchar(16) DEFAULT NULL COMMENT '用户名',
  `account_id` varchar(32) NOT NULL COMMENT '虚拟账户',
  `account_pwd` varchar(32) DEFAULT NULL COMMENT '虚拟账户密码',
  `account_status` bigint(3) DEFAULT NULL COMMENT '0-冻结  1-正常',
  `balance_amount` decimal(10,2) DEFAULT '0.00' COMMENT '余额',
  `frozen_amount` decimal(10,2) DEFAULT '0.00' COMMENT '冻结金额',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pay_account
-- ----------------------------
INSERT INTO `pay_account` VALUES ('13', 'hyb', null, 'halbert', 'halbert', null, null, '0.00', '0.00', null, null);
INSERT INTO `pay_account` VALUES ('14', 'hyb', null, 'fsdfasdfasdfas', 'halbert', null, null, '0.00', '0.00', null, null);

-- ----------------------------
-- Table structure for pay_config
-- ----------------------------
DROP TABLE IF EXISTS `pay_config`;
CREATE TABLE `pay_config` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `mch_name` varchar(128) DEFAULT NULL COMMENT '商户名称',
  `mch_id` varchar(32) DEFAULT NULL COMMENT '商户ID',
  `pay_way` tinyint(3) DEFAULT NULL COMMENT '支付渠道',
  `pay_scene` tinyint(3) DEFAULT NULL COMMENT '支付场景',
  `status` tinyint(1) DEFAULT NULL COMMENT '0-停用  1-正常',
  `config` varchar(4096) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of pay_config
-- ----------------------------

-- ----------------------------
-- Table structure for pay_payment
-- ----------------------------
DROP TABLE IF EXISTS `pay_payment`;
CREATE TABLE `pay_payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gid` varchar(32) DEFAULT NULL COMMENT '全局ID',
  `mch_id` varchar(32) DEFAULT NULL COMMENT '商户平台ID',
  `user_id` varchar(10) NOT NULL COMMENT '用户id',
  `order_no` varchar(32) NOT NULL COMMENT '支付订单号',
  `order_type` int(3) NOT NULL COMMENT '支付订单类型',
  `trade_time` datetime NOT NULL COMMENT '支付时间',
  `pay_way` int(3) NOT NULL COMMENT '支付方式',
  `trade_no` varchar(32) NOT NULL COMMENT '商户支付流水号',
  `trade_amount` decimal(10,2) DEFAULT NULL COMMENT '支付金额',
  `trade_finish_time` datetime DEFAULT NULL COMMENT '支付完成时间',
  `trade_status` int(3) DEFAULT NULL COMMENT '支付状态',
  `third_trade_amount` decimal(10,2) DEFAULT NULL COMMENT '第三方实际支付金额',
  `third_trade_no` varchar(32) DEFAULT NULL COMMENT '第三方支付流水号',
  `trade_desc` varchar(256) DEFAULT NULL COMMENT '描述',
  `notify_url` varchar(256) DEFAULT NULL COMMENT '支付成功通知上游业务方地址',
  `notify_code` int(3) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pay_payment
-- ----------------------------
INSERT INTO `pay_payment` VALUES ('42', null, '999999', '234234', '234234', '1', '2017-07-25 15:17:39', '16', '201707250317396826', '20.00', null, '2', '0.00', null, 'test pay', 'www.baidu.com', null, '2017-07-25 15:17:39', '2017-07-25 15:17:39');

-- ----------------------------
-- Table structure for pay_payment_collect
-- ----------------------------
DROP TABLE IF EXISTS `pay_payment_collect`;
CREATE TABLE `pay_payment_collect` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pay_id` int(11) NOT NULL COMMENT '支付订单表主键ID',
  `user_id` varchar(10) NOT NULL COMMENT '收款用户',
  `user_name` varchar(16) DEFAULT NULL COMMENT '收款用户名',
  `collect_amount` decimal(10,2) DEFAULT NULL COMMENT '收款金额',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pay_payment_collect
-- ----------------------------

-- ----------------------------
-- Table structure for pay_refund
-- ----------------------------
DROP TABLE IF EXISTS `pay_refund`;
CREATE TABLE `pay_refund` (
  `id` int(11) NOT NULL,
  `gid` varchar(32) DEFAULT NULL,
  `user_id` varchar(10) NOT NULL,
  `mch_id` varchar(32) DEFAULT NULL,
  `trade_no` varchar(32) NOT NULL COMMENT '商户支付流水号',
  `refund_no` varchar(32) NOT NULL COMMENT '商户退款流水号',
  `pay_way` int(3) NOT NULL COMMENT '退款渠道',
  `refund_amount` decimal(10,2) DEFAULT NULL COMMENT '退款金额',
  `refund_time` datetime DEFAULT NULL COMMENT '退款时间',
  `refund_status` int(11) DEFAULT NULL COMMENT '退款状态',
  `refund_desc` varchar(256) DEFAULT NULL COMMENT '描述',
  `third_refund_no` varchar(32) DEFAULT NULL COMMENT '第三方退款流水号',
  `refund_finish_time` datetime DEFAULT NULL COMMENT '退款完成时间',
  `notify_url` varchar(256) DEFAULT NULL COMMENT '退款通知地址',
  `notify_code` int(11) DEFAULT NULL COMMENT '是否通知',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pay_refund
-- ----------------------------
