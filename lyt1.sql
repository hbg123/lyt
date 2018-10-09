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

 Date: 09/10/2018 18:01:01
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
  `rID` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lyt_admin_member
-- ----------------------------
INSERT INTO `lyt_admin_member` VALUES (5, NULL, 5);
INSERT INTO `lyt_admin_member` VALUES (7, NULL, 5);

-- ----------------------------
-- Table structure for lyt_auth_menu
-- ----------------------------
DROP TABLE IF EXISTS `lyt_auth_menu`;
CREATE TABLE `lyt_auth_menu`  (
  `amID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `amName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `amParentID` int(11) NOT NULL,
  `amUrl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `amSort` tinyint(4) NULL DEFAULT NULL,
  `amActionType` tinyint(4) NOT NULL,
  `amHidden` tinyint(4) NOT NULL DEFAULT 1,
  `amModule` tinyint(4) NULL DEFAULT NULL,
  `amPath` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`amID`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lyt_auth_menu
-- ----------------------------
INSERT INTO `lyt_auth_menu` VALUES (1, '权限&管理员管理', 0, '', 0, 0, 0, 0, '0');
INSERT INTO `lyt_auth_menu` VALUES (2, '管理员列表', 1, '/admin/list', 0, 4, 0, 1, '0,1');
INSERT INTO `lyt_auth_menu` VALUES (3, '角色管理', 1, '/admin/role_list', 0, 4, 0, 1, '0,1');
INSERT INTO `lyt_auth_menu` VALUES (4, '权限管理', 1, '/admin/auth_list', 0, 4, 0, 1, '0,1');
INSERT INTO `lyt_auth_menu` VALUES (5, '管理员添加', 2, '/admin/add', 0, 1, 0, 1, '0,1,2');
INSERT INTO `lyt_auth_menu` VALUES (7, '管理员修改', 2, '/admin/edit', 0, 3, 0, 1, '0,1,2');
INSERT INTO `lyt_auth_menu` VALUES (8, '管理员删除', 2, '/admin/del', 0, 2, 0, 1, '0,1,2');

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
  `mRegdate` timestamp(0) NOT NULL,
  `mDel` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`mID`) USING BTREE,
  UNIQUE INDEX `mName`(`mName`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lyt_member
-- ----------------------------
INSERT INTO `lyt_member` VALUES (5, 'admin', NULL, 1, '2018-10-08 17:55:33', 0);
INSERT INTO `lyt_member` VALUES (7, 'admin1', NULL, 1, '2018-10-09 09:12:39', 0);

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
-- Records of lyt_phone_activation
-- ----------------------------
INSERT INTO `lyt_phone_activation` VALUES (5, '15824538351', 'rR9T', '2018-10-08 17:55:33', '891094e0e9ed18216bb504f2f80e02da');
INSERT INTO `lyt_phone_activation` VALUES (7, '15824538351', '0Leq', '2018-10-09 09:12:39', '5f9c4d71ff0341203a3117a6edb2c720');

-- ----------------------------
-- Table structure for lyt_roll
-- ----------------------------
DROP TABLE IF EXISTS `lyt_roll`;
CREATE TABLE `lyt_roll`  (
  `rID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `rName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `rDel` tinyint(4) NOT NULL DEFAULT 0,
  `rAddTime` timestamp(0) NOT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`rID`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lyt_roll
-- ----------------------------
INSERT INTO `lyt_roll` VALUES (6, 'ceshi]', 0, '2018-10-09 09:17:23');
INSERT INTO `lyt_roll` VALUES (5, '超级管理员', 0, '2018-10-08 13:01:44');

-- ----------------------------
-- Table structure for lyt_shop_member
-- ----------------------------
DROP TABLE IF EXISTS `lyt_shop_member`;
CREATE TABLE `lyt_shop_member`  (
  `smID` int(11) NOT NULL,
  `smInfo` json NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
