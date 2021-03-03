/*
Navicat MySQL Data Transfer

Source Server         : shorif
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : mysql

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2020-07-27 01:42:30
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `customer type`
-- ----------------------------
DROP TABLE IF EXISTS `customer type`;
CREATE TABLE `customer type` (
  `Customer_Type_Code` varchar(5) NOT NULL,
  `Customer_Type_Name` varchar(100) DEFAULT '',
  PRIMARY KEY (`Customer_Type_Code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of customer type
-- ----------------------------
INSERT INTO `customer type` VALUES ('RC ', 'Retail Customer ');
INSERT INTO `customer type` VALUES ('WC', 'Wholesale Customer');

-- ----------------------------
-- Table structure for `customeritem`
-- ----------------------------
DROP TABLE IF EXISTS `customeritem`;
CREATE TABLE `customeritem` (
  `Customer_No` int(11) DEFAULT NULL,
  `Item_Number` varchar(5) DEFAULT NULL,
  `Customer_Item_No` varchar(5) NOT NULL,
  PRIMARY KEY (`Customer_Item_No`),
  KEY `FK_3` (`Item_Number`),
  KEY `FK_4` (`Customer_No`),
  CONSTRAINT `FK_3` FOREIGN KEY (`Item_Number`) REFERENCES `item` (`Item_Number`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_4` FOREIGN KEY (`Customer_No`) REFERENCES `customers` (`Customre_No`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of customeritem
-- ----------------------------
INSERT INTO `customeritem` VALUES ('37', null, '');
INSERT INTO `customeritem` VALUES ('37', '099', 'C1001');
INSERT INTO `customeritem` VALUES ('37', '0101', 'C1003');
INSERT INTO `customeritem` VALUES ('37', '098', 'C1004');
INSERT INTO `customeritem` VALUES ('37', '078', 'C1005');

-- ----------------------------
-- Table structure for `customers`
-- ----------------------------
DROP TABLE IF EXISTS `customers`;
CREATE TABLE `customers` (
  `Customre_No` int(11) NOT NULL,
  `Customer_Name` varchar(100) DEFAULT NULL,
  `Customer_Type_Code` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`Customre_No`),
  KEY `FK_1` (`Customer_Type_Code`),
  CONSTRAINT `FK_1` FOREIGN KEY (`Customer_Type_Code`) REFERENCES `customer type` (`Customer_Type_Code`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of customers
-- ----------------------------
INSERT INTO `customers` VALUES ('37', 'Jagpal Singh', 'RC');

-- ----------------------------
-- Table structure for `item`
-- ----------------------------
DROP TABLE IF EXISTS `item`;
CREATE TABLE `item` (
  `Item_Number` varchar(5) NOT NULL,
  `Item_Name` varchar(100) DEFAULT NULL,
  `Item_Price` float(3,2) DEFAULT NULL,
  `Supplier_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Item_Number`),
  KEY `FK_2` (`Supplier_ID`),
  KEY `Item_Name` (`Item_Name`),
  CONSTRAINT `FK_2` FOREIGN KEY (`Supplier_ID`) REFERENCES `supplier` (`Supplier_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of item
-- ----------------------------
INSERT INTO `item` VALUES ('0100', 'Sable Brush Set', '3.50', 'S2');
INSERT INTO `item` VALUES ('0101', 'Extended Colour Set', '3.75', 'S1');
INSERT INTO `item` VALUES ('078', 'Mixed Brush Set', '3.99', 'S2');
INSERT INTO `item` VALUES ('098', 'Metallic Paint Se', '3.99', 'S1');
INSERT INTO `item` VALUES ('099', 'Basic Paint Se', '3.00', 'S1');

-- ----------------------------
-- Table structure for `supplier`
-- ----------------------------
DROP TABLE IF EXISTS `supplier`;
CREATE TABLE `supplier` (
  `Supplier_ID` varchar(10) NOT NULL,
  `Supplier_Name` varchar(60) DEFAULT NULL,
  `Supplier_Address` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Supplier_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of supplier
-- ----------------------------
INSERT INTO `supplier` VALUES ('S1', 'Smith and Co ', 'Dhaka');
INSERT INTO `supplier` VALUES ('S2', 'Acro ', 'Cumilla');
