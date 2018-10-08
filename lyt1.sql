/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50711
 Source Host           : localhost:3306
 Source Schema         : lyt

 Target Server Type    : MySQL
 Target Server Version : 50711
 File Encoding         : 65001

 Date: 30/09/2018 18:01:58
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for lyt_admin_member
-- ----------------------------
DROP TABLE IF EXISTS `lyt_admin_member`;
CREATE TABLE `lyt_admin_member`  (
  `amID` int(11) NOT NULL,
  `amInfo` json NULL,
  `rID` int(11) NULL DEFAULT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for lyt_auth_menu
-- ----------------------------
DROP TABLE IF EXISTS `lyt_auth_menu`;
CREATE TABLE `lyt_auth_menu`  (
  `amID` int(11) NOT NULL,
  `amName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `amParentID` int(11) NOT NULL,
  `amUrl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `amSort` tinyint(4) NULL DEFAULT NULL,
  `amModule` tinyint(4) NOT NULL,
  `amActionType` tinyint(4) NOT NULL,
  `amHidden` tinyint(4) NOT NULL DEFAULT 1
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for lyt_auth_roll
-- ----------------------------
DROP TABLE IF EXISTS `lyt_auth_roll`;
CREATE TABLE `lyt_auth_roll`  (
  `amID` int(11) NOT NULL,
  `rID` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for lyt_auth_shop
-- ----------------------------
DROP TABLE IF EXISTS `lyt_auth_shop`;
CREATE TABLE `lyt_auth_shop`  (
  `amID` int(11) NOT NULL,
  `sID` int(11) NULL DEFAULT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for lyt_freezing_member
-- ----------------------------
DROP TABLE IF EXISTS `lyt_freezing_member`;
CREATE TABLE `lyt_freezing_member`  (
  `mID` int(11) NOT NULL,
  `fmEXP` timestamp(0) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for lyt_id_activation
-- ----------------------------
DROP TABLE IF EXISTS `lyt_id_activation`;
CREATE TABLE `lyt_id_activation`  (
  `mID` int(11) NOT NULL,
  `iaID` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `iaSalt` char(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `iaPW` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `iaChangePWDate` timestamp(0) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for lyt_member
-- ----------------------------
DROP TABLE IF EXISTS `lyt_member`;
CREATE TABLE `lyt_member`  (
  `mID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `mName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mInfo` json NULL,
  `mValidPhone` tinyint(4) NOT NULL DEFAULT 0,
  `mValidName` tinyint(4) NOT NULL DEFAULT 0,
  `mRegdate` timestamp(0) NOT NULL,
  `mDel` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`mID`) USING BTREE,
  UNIQUE INDEX `mName`(`mName`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for lyt_member_token
-- ----------------------------
DROP TABLE IF EXISTS `lyt_member_token`;
CREATE TABLE `lyt_member_token`  (
  `mID` int(11) NOT NULL,
  `mtEXP` timestamp(0) NOT NULL,
  `mtNBF` timestamp(0) NOT NULL,
  `mtIAT` timestamp(0) NOT NULL,
  `mtRFI` json NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for lyt_phone_activation
-- ----------------------------
DROP TABLE IF EXISTS `lyt_phone_activation`;
CREATE TABLE `lyt_phone_activation`  (
  `mID` int(11) NOT NULL,
  `paNum` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `paSalt` char(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `paRegdate` timestamp(0) NOT NULL,
  `paPW` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for lyt_roll
-- ----------------------------
DROP TABLE IF EXISTS `lyt_roll`;
CREATE TABLE `lyt_roll`  (
  `rID` int(11) NOT NULL,
  `rName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `rAddTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `rDel` tinyint(4) NOT NULL DEFAULT 0
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for lyt_shop_member
-- ----------------------------
DROP TABLE IF EXISTS `lyt_shop_member`;
CREATE TABLE `lyt_shop_member`  (
  `smID` int(11) NOT NULL,
  `smInfo` json NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
