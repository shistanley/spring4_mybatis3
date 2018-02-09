/*
Navicat MySQL Data Transfer

Source Server         : MyConn
Source Server Version : 50616
Source Host           : localhost:3306
Source Database       : spring4_mybatis3

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2018-02-05 09:51:06
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order` (
  `order_id` char(32) NOT NULL,
  `user_id` char(32) NOT NULL,
  `product_id` char(32) NOT NULL,
  `email` varchar(60) NOT NULL,
  `address` varchar(255) NOT NULL,
  `status` char(32) NOT NULL,
  `createdata` date NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `user_id` (`user_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `product_id` FOREIGN KEY (`product_id`) REFERENCES `t_product` (`product_id`) ON DELETE NO ACTION,
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`user_id`) ON DELETE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_order
-- ----------------------------

-- ----------------------------
-- Table structure for t_product
-- ----------------------------
DROP TABLE IF EXISTS `t_product`;
CREATE TABLE `t_product` (
  `product_id` char(32) NOT NULL,
  `product_name` varchar(60) NOT NULL,
  `product_desc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_product
-- ----------------------------

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `user_id` char(32) NOT NULL,
  `user_name` varchar(30) NOT NULL,
  `user_birthday` date DEFAULT NULL,
  `user_salary` double DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('0f2906805cda408ca619457282a152eb', 'user_name', '2018-01-10', '10000');
INSERT INTO `t_user` VALUES ('11b97fff7fd440a6aace1e5cd683e10c', 'xdp_gacl_白虎神皇1', '2018-01-31', '10000');
INSERT INTO `t_user` VALUES ('18ba005fc77744b5bea030707e9a4e3f', 'xdp_gacl_白虎神皇1', '2018-01-31', '10000');
INSERT INTO `t_user` VALUES ('2c0403971e50432ba3a65dad54079a00', '白虎神皇xdp', '2017-12-28', '10000');
INSERT INTO `t_user` VALUES ('3439dc5e28b74584a6c12147421c032e', '%^$%#@i#>?<', '2018-01-31', '23123');
INSERT INTO `t_user` VALUES ('37a1040b93ad4748ba132bf3236a55ee', 'stanley', '1982-01-02', '13000');
INSERT INTO `t_user` VALUES ('3acdc418e1f04fd99fdba35b90a988a6', '白虎神皇xdp', '2017-12-28', '10000');
INSERT INTO `t_user` VALUES ('5dcc2d66658440fd9b1d1d196ab03f95', 'user_name', '2018-01-11', '10000');
INSERT INTO `t_user` VALUES ('64c5aa22cf1b48bcb0827a0c45ce8a87', '你们说的', '2013-01-02', '13425');
INSERT INTO `t_user` VALUES ('6a8ed086e6914e74b707348592f4088f', 'xdp_gacl_白虎神皇1', '2018-01-08', '10000');
INSERT INTO `t_user` VALUES ('8af62c0468814c54963cea5db76cf8d9', 'testing', '2018-01-12', '12300');
INSERT INTO `t_user` VALUES ('b5ec97e3a22540c98cdf78fe51c243c6', '测试用户来了', '1982-01-02', '13000');
INSERT INTO `t_user` VALUES ('bc02fe1924aa43938ce78a51207471dd', '白虎神皇xdp', '2017-12-28', '10000');
INSERT INTO `t_user` VALUES ('d03c411776b14765ab62367c562645dc', 'abc', '2018-01-22', '10000');
INSERT INTO `t_user` VALUES ('dcd7dbf12cbf464daeac4a1b4114b48f', 'xdp_gacl_白虎神皇1', '2018-01-31', '10000');
INSERT INTO `t_user` VALUES ('e0a57b14157b4af09fb2f0486b1da8e5', 'abc', '2018-01-08', '10000');
INSERT INTO `t_user` VALUES ('e51c5dbf77e945d787372382a3266795', 'xdp_gacl_白虎神皇', '2017-12-28', '10000');
INSERT INTO `t_user` VALUES ('eef85a0879544792951a094b66d9b91c', 'xdp_gacl_白虎神皇1', '2018-01-31', '10000');
INSERT INTO `t_user` VALUES ('f628e252e98f4c818b2e224a81be4151', 'xdp_gacl_白虎神皇', '2017-12-28', '10000');
