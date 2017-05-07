/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50629
Source Host           : 127.0.0.1:3306
Source Database       : taskdb

Target Server Type    : MYSQL
Target Server Version : 50629
File Encoding         : 65001

Date: 2017-05-07 16:53:57
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `content` text,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `combine` (`user_id`,`product_id`),
  KEY `fk_userId` (`user_id`) USING BTREE,
  KEY `fk_productID` (`product_id`),
  CONSTRAINT `fk_productID` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `fk_userID` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=228 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comments
-- ----------------------------
INSERT INTO `comments` VALUES ('65', 'dddddddddddddd', '1', '6', '0');
INSERT INTO `comments` VALUES ('67', 'самсунг', '2', '6', '0');
INSERT INTO `comments` VALUES ('69', 'Привет', '2', '7', '0');
INSERT INTO `comments` VALUES ('74', 'Китаец', '2', '5', '0');
INSERT INTO `comments` VALUES ('91', 'Это же хиаоми', '1', '5', '0');
INSERT INTO `comments` VALUES ('95', 'a;sdlfkjas;dlfjj', '1', '7', '0');
INSERT INTO `comments` VALUES ('108', 'Хороший телефон', '2', '4', '0');
INSERT INTO `comments` VALUES ('227', null, '1', '4', '1');

-- ----------------------------
-- Table structure for comrat
-- ----------------------------
DROP TABLE IF EXISTS `comrat`;
CREATE TABLE `comrat` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `comment` text,
  `rating` tinyint(1) DEFAULT NULL,
  `status_c` tinyint(1) DEFAULT NULL,
  `status_r` tinyint(1) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `combine_comrat` (`user_id`,`product_id`),
  KEY `forkey_product_id` (`product_id`),
  KEY `forkey_user_id` (`user_id`),
  CONSTRAINT `forkey_product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `forkey_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comrat
-- ----------------------------
INSERT INTO `comrat` VALUES ('1', 'Это вот яблоко надкушенное', null, '0', null, '2', '4');
INSERT INTO `comrat` VALUES ('23', 'лж я пользовался, нормальные телефоны делают', null, '0', null, '2', '10');
INSERT INTO `comrat` VALUES ('30', 'А эта китайский популярный телефон', '4', '0', '0', '2', '5');
INSERT INTO `comrat` VALUES ('37', null, '2', null, '0', '2', '6');
INSERT INTO `comrat` VALUES ('40', null, '4', null, '0', '1', '10');
INSERT INTO `comrat` VALUES ('41', 'Начали с продаж модемов', null, '0', null, '1', '9');
INSERT INTO `comrat` VALUES ('42', 'Мейзу мейзу', '3', '0', '0', '1', '7');
INSERT INTO `comrat` VALUES ('44', null, '5', null, '0', '1', '6');
INSERT INTO `comrat` VALUES ('45', 'Это же хиаоми', '3', '0', '0', '1', '5');
INSERT INTO `comrat` VALUES ('46', null, '5', null, '0', '1', '4');

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES ('4', 'Apple iPhone 7 128Gb', 'смартфон, iOS 10\r\nэкран 4.7\", разрешение 1334x750\r\nкамера 12 МП, автофокус, F/1.8\r\nпамять 128 Гб, без слота для карт памяти');
INSERT INTO `products` VALUES ('5', 'Xiaomi Redmi 4 Prime', 'смартфон, Android 6.0\r\nподдержка двух SIM-карт\r\nэкран 5\", разрешение 1920x1080\r\nкамера 13 МП, автофокус, F/2.2\r\nпамять 32 Гб, слот для карты памяти');
INSERT INTO `products` VALUES ('6', 'Samsung Galaxy S7 Edge 32Gb', 'смартфон, Android 6.0\r\nподдержка двух SIM-карт\r\nэкран 5.5\", разрешение 2560x1440\r\nкамера 12 МП, автофокус, F/1.7\r\nпамять 32 Гб, слот для карты памяти');
INSERT INTO `products` VALUES ('7', 'Meizu M5 16Gb', 'смартфон, Android 6.0\r\nподдержка двух SIM-карт\r\nэкран 5.2\", разрешение 1280x720\r\nкамера 13 МП, автофокус, F/2.2\r\nпамять 16 Гб, слот для карты памяти');
INSERT INTO `products` VALUES ('8', 'ASUS ZenFone Go ‏ZB450KL 8Gb', 'смартфон, Android 6.0\r\nподдержка двух SIM-карт\r\nэкран 4.5\", разрешение 854x480\r\nкамера 8 МП, автофокус, F/2\r\nпамять 8 Гб, слот для карты памяти');
INSERT INTO `products` VALUES ('9', 'Huawei Nova', 'смартфон, Android 6.0\r\nподдержка двух SIM-карт\r\nэкран 5\", разрешение 1920x1080\r\nкамера 12 МП, автофокус\r\nпамять 32 Гб, слот для карты памяти');
INSERT INTO `products` VALUES ('10', 'LG G6 H870DS', 'смартфон, Android 7.0\r\nподдержка двух SIM-карт\r\nэкран 5.7\", разрешение 2880x1440\r\nкамера 13 МП, автофокус');

-- ----------------------------
-- Table structure for ratings
-- ----------------------------
DROP TABLE IF EXISTS `ratings`;
CREATE TABLE `ratings` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `score` tinyint(1) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `combine_index` (`user_id`,`product_id`),
  KEY `fk_product_id` (`product_id`),
  KEY `fk_user_id` (`user_id`),
  CONSTRAINT `fk_product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ratings
-- ----------------------------
INSERT INTO `ratings` VALUES ('2', '3', '1', '5', '0');
INSERT INTO `ratings` VALUES ('3', '2', '1', '6', '0');
INSERT INTO `ratings` VALUES ('8', '1', '1', '7', '0');
INSERT INTO `ratings` VALUES ('10', '2', '1', '4', '0');
INSERT INTO `ratings` VALUES ('15', null, '2', '4', '1');
INSERT INTO `ratings` VALUES ('16', '5', '2', '5', '0');
INSERT INTO `ratings` VALUES ('35', '2', '2', '6', '0');
INSERT INTO `ratings` VALUES ('46', '3', '2', '7', '0');
INSERT INTO `ratings` VALUES ('56', '5', '2', '10', '0');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'John', '123123');
INSERT INTO `users` VALUES ('2', 'Vasya', '111');
INSERT INTO `users` VALUES ('3', 'Dostoevskiy', '2222');
INSERT INTO `users` VALUES ('4', 'Путин', '12345');
INSERT INTO `users` VALUES ('5', 'Trump', '1212');
