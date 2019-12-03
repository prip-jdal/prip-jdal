/*
 Navicat Premium Data Transfer

 Source Server         : mysql2
 Source Server Type    : MySQL
 Source Server Version : 50720
 Source Host           : localhost:3307
 Source Schema         : ins_claim_jiegou

 Target Server Type    : MySQL
 Target Server Version : 50720
 File Encoding         : 65001

 Date: 20/11/2019 16:10:18
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for commondata
-- ----------------------------
DROP TABLE IF EXISTS `commondata`;
CREATE TABLE `commondata`  (
  `ID` decimal(16, 0) NOT NULL COMMENT '主键',
  `DATATYPE` varchar(22) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据类型',
  `DATACODE` varchar(22) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据代码',
  `DATANAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据名称',
  `PRETYPE` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '父节点类型',
  `PRECODE` varchar(22) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VALIDSTATUS` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `IDX_COMMONDATA_DATATYPE_CODE`(`DATATYPE`, `DATACODE`) USING BTREE,
  INDEX `IDX_COMMONDATA_PRECODE`(`PRECODE`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '公共数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prpdaccbankname
-- ----------------------------
DROP TABLE IF EXISTS `prpdaccbankname`;
CREATE TABLE `prpdaccbankname`  (
  `BANKCODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '银行账号',
  `BANKNAME` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '银行名称',
  `ADDRESS` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址',
  `BANKLEVEL` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '银行级别',
  `BELONGBANK` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '归属银行大类名称',
  `PROVINCIAL` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '省份',
  `CITY` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '城市',
  `F01` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `F02` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `F03` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FLAG` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标志',
  `VALIDSTATUS` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '有效状态',
  `REMARK` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL,
  INDEX `IDX_PRPDACCBANKNAME_BBANK`(`BELONGBANK`) USING BTREE,
  INDEX `IDX_PRPDACCBANKNAME_CITY`(`CITY`) USING BTREE,
  INDEX `IDX_PRPDACCBANKNAME_PCAL`(`PROVINCIAL`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prpdaccident
-- ----------------------------
DROP TABLE IF EXISTS `prpdaccident`;
CREATE TABLE `prpdaccident`  (
  `AccidentNo` decimal(16, 0) NOT NULL,
  `AccidentSubject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AccidentDate` date NULL DEFAULT NULL,
  `DamageReasonType` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DamageCode` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `NationFlag` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DamageAreaCode` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DamageArea` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DamageAddress` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `IsMajorAccident` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CreateUser` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OperateUser` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `InsertTimeForHis` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OperateTimeForHis` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`AccidentNo`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prpdaccidentdirectory
-- ----------------------------
DROP TABLE IF EXISTS `prpdaccidentdirectory`;
CREATE TABLE `prpdaccidentdirectory`  (
  `ID` decimal(13, 0) NOT NULL,
  `FIRSTCLASSACCIDENTCODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FIRSTCLASSACCIDENTNAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SECONDCLASSACCIDENTCODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SECONDCLASSACCIDENTNAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ACCIDENTDATE` datetime(0) NULL DEFAULT NULL,
  `ACCIDENTAREA` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ACCIDENTADDRESS` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ACCIDENTTYPE` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REMARK` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATEUSER` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATETIME` datetime(0) NULL DEFAULT NULL,
  `UPDATEUSER` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UPDATETIME` datetime(0) NULL DEFAULT NULL,
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prpdaddress
-- ----------------------------
DROP TABLE IF EXISTS `prpdaddress`;
CREATE TABLE `prpdaddress`  (
  `CODE` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `NAME` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `PARENT` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VALIDSTATUS` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1',
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL,
  INDEX `IDX_PRPDADDRESS_PARENT`(`PARENT`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prpdagencydirectory
-- ----------------------------
DROP TABLE IF EXISTS `prpdagencydirectory`;
CREATE TABLE `prpdagencydirectory`  (
  `AGENCYCODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `AGENCYNAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AGENCYTYPE` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CERTIFICATELEVEL` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `COMCODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CONTRACTFLAG` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AGENTTYPE` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PHONENUMBER` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MOBILENUMBER` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FAXNUMBER` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ADDRESS` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `POSTCODE` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EMAIL` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RISKFLAG` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VALIDFLAG` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MAKECOM` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`AGENCYCODE`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prpdagencydirectoryext
-- ----------------------------
DROP TABLE IF EXISTS `prpdagencydirectoryext`;
CREATE TABLE `prpdagencydirectoryext`  (
  `AGENCYCODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `COUNTRYCODE` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `COUNTRYCNAME` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `COUNTRYENAME` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PORTCODE` char(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `PORTNAME` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORDERNUMBER` decimal(8, 0) NOT NULL,
  `IDENTIFIERTYPE` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `MARK` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`AGENCYCODE`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prpdagencypersondirectory
-- ----------------------------
DROP TABLE IF EXISTS `prpdagencypersondirectory`;
CREATE TABLE `prpdagencypersondirectory`  (
  `AGENCYCODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `SERIALNO` decimal(8, 0) NOT NULL,
  `PERSONTYPE` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PERSONNAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `IDENTIFYNUMBER` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CERTIFICATETYPE` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CERTIFICATENUMBER` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CONTACT` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EMAIL` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MAKECOM` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`AGENCYCODE`, `SERIALNO`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prpdbank
-- ----------------------------
DROP TABLE IF EXISTS `prpdbank`;
CREATE TABLE `prpdbank`  (
  `BANKCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '银行编码',
  `BANKNAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '银行名称',
  `BANKNATURE` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '银行性质',
  `FLAG` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ARTICLECODE` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '专项代码',
  `BANKID` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '资金银行代码',
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prpdcoderisk
-- ----------------------------
DROP TABLE IF EXISTS `prpdcoderisk`;
CREATE TABLE `prpdcoderisk`  (
  `CODETYPE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '对照类型类型',
  `CODECODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '出险原因代码',
  `RISKCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '险类代码',
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`CODETYPE`, `CODECODE`, `RISKCODE`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '险种与出险原因对照表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prpdcompany
-- ----------------------------
DROP TABLE IF EXISTS `prpdcompany`;
CREATE TABLE `prpdcompany`  (
  `ID` decimal(16, 0) NOT NULL,
  `COMCODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `COMCNAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `COMENAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ADDRESSCNAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ADDRESSENAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `POSTCODE` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PHONENUMBER` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TAXNUMBER` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FAXNUMBER` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UPPERCOMCODE` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSURERNAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `COMATTRIBUTE` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `COMTYPE` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `COMLEVEL` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MANAGER` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ACCOUNTLEADER` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CASHIER` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ACCOUNTANT` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REMARK` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `NEWCOMCODE` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VALIDSTATUS` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ACNTUNIT` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ARTICLECODE` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ACCCODE` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CENTERFLAG` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OUTERPAYCODE` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INNERPAYCODE` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FLAG` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `WEBADDRESS` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SERVICEPHONE` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REPORTPHONE` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AGENTCODE` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AGREEMENTNO` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SYSAREACODE` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `COMBVISITRATE` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PRINTCOMNAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PRINTADDRESS` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PRINGPOSTCODE` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SALESCHANNELCODE` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prpddisasterdirectory
-- ----------------------------
DROP TABLE IF EXISTS `prpddisasterdirectory`;
CREATE TABLE `prpddisasterdirectory`  (
  `ID` decimal(16, 0) NOT NULL,
  `FIRSTCLASSDISASTERCODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FIRSTCLASSDISASTERNAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SECONDCLASSDISASTERCODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SECONDCLASSDISASTERNAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DISASTERDATE` datetime(0) NULL DEFAULT NULL,
  `DISASTERAREA` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DISASTERADDRESS` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DISASTERTYPE` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REMARK` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATEUSER` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATETIME` datetime(0) NULL DEFAULT NULL,
  `UPDATEUSER` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UPDATETIME` datetime(0) NULL DEFAULT NULL,
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL,
  `DISAENDDATE` datetime(0) NULL DEFAULT NULL,
  `DISADAY` decimal(5, 0) NULL DEFAULT NULL,
  `DISASTERTEXT` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ACCIDENTKIND` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prpdexchrate
-- ----------------------------
DROP TABLE IF EXISTS `prpdexchrate`;
CREATE TABLE `prpdexchrate`  (
  `Id` decimal(16, 0) NOT NULL,
  `exchDate` datetime(0) NULL DEFAULT NULL,
  `baseAmount` decimal(14, 2) NULL DEFAULT NULL,
  `baseCurrency` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `exchCurrency` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `exchRate` decimal(8, 4) NULL DEFAULT NULL,
  `validState` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `exchType` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Inserttimeforhis` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `Operatetimeforhis` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prpdhospital
-- ----------------------------
DROP TABLE IF EXISTS `prpdhospital`;
CREATE TABLE `prpdhospital`  (
  `CODE` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PROVINCE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CITY` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AREA` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LEVELS` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `GRADE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`CODE`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prpdinsurance
-- ----------------------------
DROP TABLE IF EXISTS `prpdinsurance`;
CREATE TABLE `prpdinsurance`  (
  `Id` bigint(20) NOT NULL,
  `datatype` varchar(22) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `datacode` varchar(22) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `dataname` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `pretype` varchar(22) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `precode` varchar(22) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `basecode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `validstatus` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `inserttimeforhis` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `operatetimeforhis` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prpdmaimitem
-- ----------------------------
DROP TABLE IF EXISTS `prpdmaimitem`;
CREATE TABLE `prpdmaimitem`  (
  `ID` decimal(16, 0) NOT NULL,
  `MAIMITEM` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `MAIMLEVEL` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `MAIMCODE` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `STANDARD` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prpdnode
-- ----------------------------
DROP TABLE IF EXISTS `prpdnode`;
CREATE TABLE `prpdnode`  (
  `NODECODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `NODENAME` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `UPPERNODE` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `SERIALNO` decimal(4, 0) NULL DEFAULT NULL,
  `VALIDSTATUS` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ACCEPTOVERMINUTES` decimal(6, 0) NULL DEFAULT NULL,
  `OUTOVERMINUTES` decimal(6, 0) NULL DEFAULT NULL,
  `NODETYPE` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REMARK` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CREATETIME` datetime(0) NULL DEFAULT NULL,
  `CREATEUSER` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UPDATETIME` datetime(0) NULL DEFAULT NULL,
  `UPDATEUSER` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`NODECODE`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prpduser
-- ----------------------------
DROP TABLE IF EXISTS `prpduser`;
CREATE TABLE `prpduser`  (
  `USERCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `USERNAME` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `USERENAME` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PASSWORD` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SEAL` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PASSWORDSETDATE` datetime(0) NULL DEFAULT NULL,
  `PASSWORDEXPIREDATE` datetime(0) NOT NULL,
  `COMCODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MAKECOM` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ACCOUNTCODE` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PHONE` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MOBILE` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ADDRESS` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `POSTCODE` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EMAIL` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `USERFLAG` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LOGINSYSTEM` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `NEWUSERCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `VALIDSTATUS` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ARTICLECODE` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FLAG` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MAXOVERDUECOUNT` decimal(6, 0) NULL DEFAULT NULL,
  `MAXOVERDUEFEE` decimal(14, 2) NULL DEFAULT NULL,
  `PWDEXPMONTH` decimal(2, 0) NULL DEFAULT 12,
  `PWDDEPTH` decimal(1, 0) NULL DEFAULT NULL,
  `SENDLOGINMSG` decimal(2, 0) NULL DEFAULT NULL,
  `OAUSERCODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATETIME` datetime(0) NULL DEFAULT NULL,
  `UPDATETIME` datetime(0) NULL DEFAULT NULL,
  `IDENTIFYNUMBER` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REMARK` varchar(4000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL,
  INDEX `IDX_PRDUSER_USERCODE`(`USERCODE`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prplaccident
-- ----------------------------
DROP TABLE IF EXISTS `prplaccident`;
CREATE TABLE `prplaccident`  (
  `ID` decimal(8, 0) NOT NULL,
  `CLAIMNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ACCIDENTCODE` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ACCIDENTNAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OPERATORCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MAKECOM` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UPDATETIME` datetime(0) NULL DEFAULT NULL,
  `SECONDACCIDENTCODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SECONDACCIDENTNAME` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prplagency
-- ----------------------------
DROP TABLE IF EXISTS `prplagency`;
CREATE TABLE `prplagency`  (
  `ID` decimal(16, 0) NOT NULL,
  `PRPLCHECKID` decimal(16, 0) NULL DEFAULT NULL,
  `PRPLCHECKTASKID` decimal(16, 0) NULL DEFAULT NULL,
  `BUSINESSID` decimal(16, 0) NULL DEFAULT NULL,
  `REGISTNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AGENCYCODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AGENCYTYPE` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AGENCYNAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AGENTMODE` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CHARGERATE` decimal(7, 4) NULL DEFAULT NULL,
  `MAKECOMADDRESS` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CERTIFICATELEVEL` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AGENTTYPE` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BUSINESSTYPE` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CHARGEFLAG` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CHARGETYPE` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `WORKCODE` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `WORKNAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CONTACTNAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AGENCYSCOPETYPE` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PHONENUMBER` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MOBILENUMBER` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FAXNUMBER` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ADDRESS` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `POSTCODE` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EMAIL` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `STATUS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SOURCEFLAG` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FLAG` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REMARK` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `MAKECOM` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL,
  `prpLClaimKindId` decimal(16, 0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prplagencyappr
-- ----------------------------
DROP TABLE IF EXISTS `prplagencyappr`;
CREATE TABLE `prplagencyappr`  (
  `ID` decimal(16, 0) NOT NULL,
  `PRPLAGENCYID` decimal(16, 0) NULL DEFAULT NULL,
  `REGISTNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AGENCYCODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PERSONNAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RECOMMENDFLAG` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPRTYPE` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TYPE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CURRENCY` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SUMFEE` decimal(14, 2) NULL DEFAULT NULL,
  `SCORE` decimal(8, 0) NULL DEFAULT NULL,
  `APPRCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPRNAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPRDATE` datetime(0) NULL DEFAULT NULL,
  `APPRINFO` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MAKECOM` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `IDX_PRPLAGENCYAPPR_PRPLID`(`PRPLAGENCYID`) USING BTREE,
  INDEX `IDX_PRPLAGENCYAPPR_REGISTNO`(`REGISTNO`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prplagencyfee
-- ----------------------------
DROP TABLE IF EXISTS `prplagencyfee`;
CREATE TABLE `prplagencyfee`  (
  `ID` decimal(16, 0) NOT NULL,
  `PRPLAGENCYAPPRID` decimal(16, 0) NULL DEFAULT NULL,
  `REGISTNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AGENCYCODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FEETYPECODE` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CURRENCY` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EXCHANGERATE` decimal(14, 2) NULL DEFAULT NULL,
  `EXCHANGESUM` decimal(14, 2) NULL DEFAULT NULL,
  `FEEAMOUNT` decimal(14, 2) NULL DEFAULT NULL,
  `MAKECOM` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `IDX_PRPLAGENCYFEE_PRPLAPPRID`(`PRPLAGENCYAPPRID`) USING BTREE,
  INDEX `IDX_PRPLAGENCYFEE_REGISTNO`(`REGISTNO`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prplagencyperson
-- ----------------------------
DROP TABLE IF EXISTS `prplagencyperson`;
CREATE TABLE `prplagencyperson`  (
  `ID` decimal(16, 0) NOT NULL,
  `PRPLAGENCYID` decimal(16, 0) NULL DEFAULT NULL,
  `AGENCYCODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SERIALNO` decimal(8, 0) NULL DEFAULT NULL,
  `REGISTNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PERSONTYPE` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PERSONNAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `IDENTIFYNUMBER` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CERTIFICATETYPE` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CERTIFICATENUMBER` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CERTIFICATELEVEL` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CERTIFICATELEVELNAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RECOMMENDLEVEL` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CONTACT` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FLAG` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MAKECOM` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EMAIL` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PHONENUMBER` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL,
  `PERSONCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `IDX_PRPLAGENCYPERSON_PID`(`PRPLAGENCYID`) USING BTREE,
  INDEX `IDX_PRPLAGENCYPERSON_RNO`(`REGISTNO`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prplagencyscore
-- ----------------------------
DROP TABLE IF EXISTS `prplagencyscore`;
CREATE TABLE `prplagencyscore`  (
  `ID` decimal(16, 0) NOT NULL,
  `PRPLAGENCYAPPRID` decimal(16, 0) NULL DEFAULT NULL,
  `REGISTNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AGENCYCODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SCOREINDEX` decimal(8, 0) NULL DEFAULT NULL,
  `SCORE` decimal(8, 0) NULL DEFAULT NULL,
  `MAKECOM` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `IDX_PRPLAGENCYSCORE_PID`(`PRPLAGENCYAPPRID`) USING BTREE,
  INDEX `IDX_PRPLAGENCYSCORE_RNO`(`REGISTNO`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prplapprove
-- ----------------------------
DROP TABLE IF EXISTS `prplapprove`;
CREATE TABLE `prplapprove`  (
  `ID` decimal(16, 0) NOT NULL,
  `BUSINESSID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REGISTNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CLAIMNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPROVETYPE` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPLICANTCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPLICANTNAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPLICANTDATE` datetime(0) NULL DEFAULT NULL,
  `APPROVERCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPROVERNAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CONTENT` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `APPROVEDATE` datetime(0) NULL DEFAULT NULL,
  `APPROVEFLAG` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FLAG` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MAKECOM` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `IDX_PRPLAPPROVE_BUSINESSID`(`BUSINESSID`) USING BTREE,
  INDEX `IDX_PRPLAPPROVE_REGISTNO`(`REGISTNO`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prplarrangeduty
-- ----------------------------
DROP TABLE IF EXISTS `prplarrangeduty`;
CREATE TABLE `prplarrangeduty`  (
  `ID` decimal(16, 0) NOT NULL,
  `USERCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `USERNAME` varchar(22) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `PERMITCOMCODE` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DUTYBEGINTIME` datetime(0) NULL DEFAULT NULL,
  `DUTYENDTIME` datetime(0) NULL DEFAULT NULL,
  `DUTYPROVINCE` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DUTYCITY` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DUTYAREA` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `GRADETYPE` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TELPHONE` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PERMITBUSINESSPLATE` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CUSTOMERTYPE` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CASETYPE` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MAKECOM` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OPERATORCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATETIME` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATETIME` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `DUTYADDRESS` varchar(900) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VALIDFLAG` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1',
  `PERMITCOMNAME` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL,
  `PERMITTHREECOMCODE` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SCHEDULEMODE` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ISLOCAL` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CLASSCODE` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RISKCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DATEFLAG` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DUTYSTARTTIME` decimal(5, 0) NULL DEFAULT NULL,
  `DUTYFINISHTIME` decimal(5, 0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prplassure
-- ----------------------------
DROP TABLE IF EXISTS `prplassure`;
CREATE TABLE `prplassure`  (
  `ID` decimal(16, 0) NOT NULL,
  `REGISTNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RISKCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `assureNo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ASSURETYPECODE` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ACCEPTASSURER` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `GUARANTOR` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ASSURER` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SHIPNAMEORVOYAGE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `HANDLERCODE` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ASSUREDATE` datetime(0) NULL DEFAULT NULL,
  `CURRENCY` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REVERSEAMOUNT` decimal(14, 2) NULL DEFAULT NULL,
  `OPPOSITEASSURE` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPROVEFLAG` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RETURNDATE` datetime(0) NULL DEFAULT NULL,
  `ASSUREREASON` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `OPERATORCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATETIME` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATETIME` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `IDX_PRPLASSURE_ASSURENO`(`assureNo`) USING BTREE,
  INDEX `IDX_PRPLASSURE_REGISTNO`(`REGISTNO`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prplbatchimportrecord
-- ----------------------------
DROP TABLE IF EXISTS `prplbatchimportrecord`;
CREATE TABLE `prplbatchimportrecord`  (
  `BatchNo` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '批次号',
  `TotalNum` int(11) NULL DEFAULT NULL COMMENT '总条数 ',
  `FailNum` int(11) NULL DEFAULT NULL COMMENT '失败条数 ',
  `BatchType` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '批量导入类型 责任，财产等',
  `BatchNode` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '批量导入节点 核赔，结案等 ',
  `BatchSource` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '批量导入来源 临分、损余回收等',
  `OperatorCode` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '导入人代码',
  `OperatorName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '导入人姓名',
  `Status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态',
  `InsertTimeForHis` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OperateTimeForHis` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`BatchNo`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '批量导入记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prplbeneficiary
-- ----------------------------
DROP TABLE IF EXISTS `prplbeneficiary`;
CREATE TABLE `prplbeneficiary`  (
  `Id` decimal(16, 0) NOT NULL,
  `RegistNo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PolicyNo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `COMPENSATENO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BeneficiaryName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `IdentifyType` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `IdentifyNo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Sex` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Birthday` date NULL DEFAULT NULL,
  `BenefitRate` int(11) NULL DEFAULT NULL,
  `BenefitOrder` int(11) NULL DEFAULT NULL,
  `PayeeRalationShip` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PayeeId` decimal(16, 0) NULL DEFAULT NULL,
  `PayeeName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CreateUser` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OperatorCode` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `InsertTimeForHis` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OperateTimeForHis` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prplbenefitpers
-- ----------------------------
DROP TABLE IF EXISTS `prplbenefitpers`;
CREATE TABLE `prplbenefitpers`  (
  `ID` decimal(16, 0) NOT NULL,
  `REGISTNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INJUREDID` decimal(16, 0) NULL DEFAULT NULL,
  `PAYPERSONNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `IDNUMBER` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RELATIONSHIP` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INPUTTIME` datetime(0) NULL DEFAULT NULL,
  `VALIDFLAG` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REMARK` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FLAG` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATEUSER` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATETIME` datetime(0) NULL DEFAULT NULL,
  `UPDATEUSER` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UPDATETIME` datetime(0) NULL DEFAULT NULL,
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `IDX_PRPLBENEFITPERS_RNO`(`REGISTNO`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prplbuyer
-- ----------------------------
DROP TABLE IF EXISTS `prplbuyer`;
CREATE TABLE `prplbuyer`  (
  `ID` decimal(16, 0) NOT NULL,
  `PAYEENAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BUYERNO` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BUYERNAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PAYOBJECTTYPE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BUYERTYPE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VALIDFALG` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REMARK` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSERTTIMEFORHIS` date NULL DEFAULT NULL,
  `OPERATETIMEFORHIS` date NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prplcanceltrace
-- ----------------------------
DROP TABLE IF EXISTS `prplcanceltrace`;
CREATE TABLE `prplcanceltrace`  (
  `ID` decimal(16, 0) NOT NULL,
  `BUSINESSNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RISKCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TEXTTYPE` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEALREASON` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPLYREASON` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPLYUSERCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPLYDATE` datetime(0) NULL DEFAULT NULL,
  `OPERATORCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INPUTTIME` datetime(0) NULL DEFAULT NULL,
  `STATUS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CANCELCODE` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CANCELTEXT` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CANCELDATE` datetime(0) NULL DEFAULT NULL,
  `DEALERCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MAKECOM` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `COMCODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VALIDFLAG` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `cancelSubject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `IDX_PRPLCANCELTRACE_BNO`(`BUSINESSNO`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prplcaregiverinfo
-- ----------------------------
DROP TABLE IF EXISTS `prplcaregiverinfo`;
CREATE TABLE `prplcaregiverinfo`  (
  `ID` decimal(16, 0) NOT NULL,
  `REGISTNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INJUREDID` decimal(16, 0) NULL DEFAULT NULL,
  `PAYPERSONNAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SEX` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OCCUPATIONNAME` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INCOME` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RELATIONSHIP` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INPUTTIME` datetime(0) NULL DEFAULT NULL,
  `NURSINGDAYS` decimal(5, 0) NULL DEFAULT NULL,
  `NURSINGFEE` decimal(10, 2) NULL DEFAULT NULL,
  `DOMICILEPLACE` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `WORKPLACE` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VALIDFLAG` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REMARK` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FLAG` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATEUSER` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATETIME` datetime(0) NULL DEFAULT NULL,
  `UPDATEUSER` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UPDATETIME` datetime(0) NULL DEFAULT NULL,
  `AGE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INDUSTRY` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `IDX_PRPLCAREGIVERINFO_IID`(`INJUREDID`) USING BTREE,
  INDEX `IDX_PRPLCAREGIVERINFO_RNO`(`REGISTNO`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prplcasemonitor
-- ----------------------------
DROP TABLE IF EXISTS `prplcasemonitor`;
CREATE TABLE `prplcasemonitor`  (
  `ID` decimal(16, 0) NOT NULL,
  `REGISTNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `POLICYNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CLAIMNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RISKCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSUREDCODE` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSUREDNAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OPERATORCODE` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OPERATORNAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `STARTDATE` datetime(0) NULL DEFAULT NULL,
  `ENDDATE` datetime(0) NULL DEFAULT NULL,
  `STATUS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VALIDFLAG` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FLAG` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prplccoins
-- ----------------------------
DROP TABLE IF EXISTS `prplccoins`;
CREATE TABLE `prplccoins`  (
  `ID` decimal(16, 0) NOT NULL,
  `REGISTNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SERIALNO` int(11) NULL DEFAULT NULL,
  `CLAIMNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PRPLCMAINID` decimal(16, 0) NULL DEFAULT NULL,
  `POLICYNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MAINPOLICYNO` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `COINSCODE` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `COINSNAME` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `COINSTYPE` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `COINSRATE` decimal(8, 4) NULL DEFAULT NULL,
  `COINSAMOUNT` decimal(14, 2) NULL DEFAULT NULL,
  `COINSPREMIUM` decimal(14, 2) NULL DEFAULT NULL,
  `CHIEFFLAG` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PROPORTIONFLAG` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REINSCIFLAG` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `COINSFLAG` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FLAG` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REMARK` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OPERATORCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATETIME` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `HANDLERCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UPDATETIME` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `IDX_PRPLCCOINS_CLAIMNO`(`CLAIMNO`) USING BTREE,
  INDEX `IDX_PRPLCCOINS_MAINPOLICYNO`(`MAINPOLICYNO`) USING BTREE,
  INDEX `IDX_PRPLCCOINS_POLICYNO`(`POLICYNO`) USING BTREE,
  INDEX `IDX_PRPLCCOINS_PRPLCMAINID`(`PRPLCMAINID`) USING BTREE,
  INDEX `IDX_PRPLCCOINS_REGISTNO`(`REGISTNO`) USING BTREE,
  INDEX `IDX_PRPLCCOINS_SERIALNO`(`SERIALNO`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prplccustomerinfo
-- ----------------------------
DROP TABLE IF EXISTS `prplccustomerinfo`;
CREATE TABLE `prplccustomerinfo`  (
  `ID` decimal(16, 0) NOT NULL,
  `REGISTNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PAYEEID` decimal(16, 0) NULL DEFAULT NULL,
  `INSURECOMNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSURECOMADDRESS` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSURECOMBUSSSCOPE` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSURECOMBUSINESSCODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSURECOMLICENSENAME` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSURECOMLICENSENO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSURECOMLICENSEDATE` datetime(0) NULL DEFAULT NULL,
  `INSURECOMLICENSEVALIDFLAG` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSURECOMCERTIFYNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSURECOMCERTIFYNO` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSURECOMCERTIFYDATE` datetime(0) NULL DEFAULT NULL,
  `INSURECOMCERTIFYVALIDFLAG` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSURECOMFILENAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSURECOMFILENO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSURECOMFILEDATE` datetime(0) NULL DEFAULT NULL,
  `INSURECOMFILEVALIDFLAG` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSURECOMUSCCNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSURECOMUSCCNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSURECOMUSCCDATE` datetime(0) NULL DEFAULT NULL,
  `INSURECOMUSCCVALIDFLAG` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `COMSHAREHOLDERNAME` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `COMSHAREHOLDERCERTIFYTYPE` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `COMSHAREHOLDERCERTIFYNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `COMSHAREHOLDERVALIDDATE` datetime(0) NULL DEFAULT NULL,
  `CORPORATIONNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CORPORATIONCERTIFYTYPE` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CORPORATIONCERTIFYNO` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CORPORATIONCERTIFYVALIDDATE` datetime(0) NULL DEFAULT NULL,
  `COMPRINCIPALNAME` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `COMPRINCIPALCERTIFYTYPE` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `COMPRINCIPALCERTIFYNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `COMPRINCIPALVALIDDATE` datetime(0) NULL DEFAULT NULL,
  `AUTHORITYNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AUTHORITYCERTIFYTYPE` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AUTHORITYCERTIFYNO` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AUTHORITYCERTIFYVALIDDATE` datetime(0) NULL DEFAULT NULL,
  `BENEFICIARYNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BENEFICIARYNATIONALITY` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BENEFICIARYCERTIFYTYPE` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BENEFICIARYCERTIFYNO` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BENEFICIARYCERTIFYVALIDDATE` datetime(0) NULL DEFAULT NULL,
  `BENEFICIARYOCCUPATION` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BENEFICIARYADDRESSTYPE` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BENEFICIARYADDRESS` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATEUSER` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATETIME` datetime(0) NULL DEFAULT NULL,
  `UPDATEUSER` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UPDATETIME` datetime(0) NULL DEFAULT NULL,
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `IDX_PRPLCCUSTOMERINFO_PAYEEID`(`PAYEEID`) USING BTREE,
  INDEX `IDX_PRPLCCUSTOMERINFO_RNO`(`REGISTNO`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prplcdangeritem
-- ----------------------------
DROP TABLE IF EXISTS `prplcdangeritem`;
CREATE TABLE `prplcdangeritem`  (
  `ID` decimal(19, 0) NOT NULL,
  `POLICYNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RISKCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DANGERNO` decimal(8, 0) NOT NULL,
  `SERIALNO` decimal(16, 0) NULL DEFAULT NULL,
  `KINDCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `KINDNAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ITEMCODE` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ITEMDETAILNAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AMOUNT` decimal(14, 2) NULL DEFAULT NULL,
  `PREMIUM` decimal(14, 2) NULL DEFAULT NULL,
  `PRPLCMAINID` decimal(19, 0) NULL DEFAULT NULL,
  `CURRENCY` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CALCULATEFLAG` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `IDX_PRPLCDANGERITEM_CMAINID`(`PRPLCMAINID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prplcdangerunit
-- ----------------------------
DROP TABLE IF EXISTS `prplcdangerunit`;
CREATE TABLE `prplcdangerunit`  (
  `ID` decimal(16, 0) NOT NULL,
  `REGISTNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PRPLCMAINID` decimal(16, 0) NULL DEFAULT NULL,
  `POLICYNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RISKCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DANGERNO` decimal(8, 0) NOT NULL,
  `DANGERDESC` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ADDRESSNAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RISKLEVEL` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RISKLEVELDESC` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ITEMKIND` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ITEMKINDDESC` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CURRENCY` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AMOUNT` decimal(14, 2) NULL DEFAULT NULL,
  `PREMIUM` decimal(14, 2) NULL DEFAULT NULL,
  `DISFEE` decimal(14, 2) NULL DEFAULT NULL,
  `DANGERSHARE` decimal(8, 4) NULL DEFAULT NULL,
  `RETCURRENCY` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RETENTIONVALUE` decimal(14, 2) NULL DEFAULT NULL,
  `SPECURRENCY` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SPERATE` decimal(9, 6) NULL DEFAULT NULL,
  `SPEVALUE` decimal(14, 2) NULL DEFAULT NULL,
  `GROUPFLAG` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REINSUREFLAG` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RISKCLASSDESC` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BUSINESS` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BUSINESSDESC` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RISKCLASS` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `COINSFLAG` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SHAREHOLDERFLAG` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BUSINESSFLAG` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OPENFACFLAG` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OPENCOVERSHARE` decimal(8, 4) NULL DEFAULT NULL,
  `REMARKS` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FLAG` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ENDORSETIMES` decimal(8, 0) NULL DEFAULT NULL,
  `TAXFLAG` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VATFLAG` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UNDERWRITEENDDATE` datetime(0) NULL DEFAULT NULL,
  `STARTDATE` datetime(0) NULL DEFAULT NULL,
  `USEKINDCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TAXALLOWANCEFLAG` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OPERATORCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATETIME` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `HANDLERCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UPDATETIME` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `REINSMODE3` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CLAIMTERMFLAG` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CLAIMTERMBALANCE` decimal(14, 2) NULL DEFAULT NULL,
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `IDX_PRPLCDANGERUNIT_POLICYNO`(`POLICYNO`) USING BTREE,
  INDEX `IDX_PRPLCDANGERUNIT_REGISTNO`(`REGISTNO`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prplcfeecoins
-- ----------------------------
DROP TABLE IF EXISTS `prplcfeecoins`;
CREATE TABLE `prplcfeecoins`  (
  `ID` decimal(19, 0) NOT NULL,
  `COMPENSATENO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `POLICYNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REGISTNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RISKCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `COINSFLAG` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `COINSCODE` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `COINSNAME` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `COINSTYPE` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `COINSRATE` decimal(8, 6) NULL DEFAULT NULL,
  `CHIEFFLAG` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LOSSFEETYPE` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CHARGECODE` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CHARGENAME` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SUMPAID` decimal(14, 2) NULL DEFAULT NULL,
  `COINSSUMPAID` decimal(14, 2) NULL DEFAULT NULL,
  `COINSSTATE` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `KINDCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CURRENCY` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EXCHRATE` decimal(8, 2) NULL DEFAULT NULL,
  `VALIDFLAG` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REMARK` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATETIME` datetime(0) NULL DEFAULT NULL,
  `UPDATETIME` datetime(0) NULL DEFAULT NULL,
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prplcharge
-- ----------------------------
DROP TABLE IF EXISTS `prplcharge`;
CREATE TABLE `prplcharge`  (
  `ID` decimal(16, 0) NOT NULL,
  `COMPENSATENO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `POLICYNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RISKCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `KINDCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CHARGECODE` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CHARGENAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PAYOBJECT` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AREACODE` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DIVIDEFLAG` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CURRENCY` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BILLTYPE` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ADDRATE` decimal(12, 4) NULL DEFAULT NULL,
  `ADDAMT` decimal(12, 2) NULL DEFAULT NULL,
  `NORATEAMT` decimal(12, 2) NULL DEFAULT NULL,
  `EXCHRATE` decimal(8, 2) NULL DEFAULT NULL,
  `FEEAMT` decimal(12, 2) NULL DEFAULT NULL,
  `OFFAMT` decimal(12, 2) NULL DEFAULT NULL,
  `OFFPREAMT` decimal(12, 2) NULL DEFAULT NULL,
  `FEEREALAMT` decimal(12, 2) NULL DEFAULT NULL,
  `OTHERFLAG` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OTHERCAUSE` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PAYEENAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PAYEEIDFNO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BANKNAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ACCOUNTNO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PAYEEID` decimal(16, 0) NULL DEFAULT NULL,
  `DEDUCTFLAG` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RELATEID` decimal(16, 0) NULL DEFAULT NULL,
  `VALIDFLAG` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REMARK` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATETIME` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATETIME` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPPOCHARGEID` decimal(16, 0) NULL DEFAULT NULL,
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `IDX_PRPLCHARGE_COMPENSATENO`(`COMPENSATENO`) USING BTREE,
  INDEX `IDX_PRPLCHARGE_POLICYNO`(`POLICYNO`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prplcheck
-- ----------------------------
DROP TABLE IF EXISTS `prplcheck`;
CREATE TABLE `prplcheck`  (
  `ID` decimal(16, 0) NOT NULL,
  `REGISTNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RISKCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DAMAGETYPECODE` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MANAGETYPE` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DAMAGECODE` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CLAIMTYPE` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MERCYFLAG` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LOSSTYPE` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CHECKTYPE` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CHECKCLASS` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ISPROPLOSS` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ISPERSONLOSS` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ISSUBROGATION` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RECONCILEFLAG` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MAJORCASEFLAG` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CHKSUBMITTIME` datetime(0) NULL DEFAULT NULL,
  `RECHKSUBMITTIME` datetime(0) NULL DEFAULT NULL,
  `VALIDFLAG` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FLAG` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REMARK` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MAKECOM` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OPERATORCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `HANDLERCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CREATETIME` datetime(0) NOT NULL,
  `UPDATEUSER` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `UPDATETIME` datetime(0) NOT NULL,
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `IDX_PRPLCHECK_REGISTNO`(`REGISTNO`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prplchecktask
-- ----------------------------
DROP TABLE IF EXISTS `prplchecktask`;
CREATE TABLE `prplchecktask`  (
  `ID` decimal(16, 0) NOT NULL,
  `CHECKID` decimal(16, 0) NOT NULL,
  `REGISTNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LINKERNAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LINKERNUMBER` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LINKERMOBILE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CHECKDATE` datetime(0) NULL DEFAULT NULL,
  `DEMAGEDATE` datetime(0) NULL DEFAULT NULL,
  `NATIONFLAG` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DAMAGEAREA` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CHECKADDRESS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CHECKADDRESSDETAIL` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CHECKERCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CHECKER` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CHECKER2CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CHECKER2` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CHECKERIDFNO` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CONTEXTS` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SUMRESCUEFEE` decimal(14, 2) NULL DEFAULT NULL,
  `SUMLOSSCARFEE` decimal(14, 2) NULL DEFAULT NULL,
  `SUMLOSSPROPFEE` decimal(14, 2) NULL DEFAULT NULL,
  `SUMLOSSPERSNFEE` decimal(14, 2) NULL DEFAULT NULL,
  `SUMINJURIENUM` decimal(14, 0) NULL DEFAULT NULL,
  `SUMDEATHSNUM` decimal(14, 0) NULL DEFAULT NULL,
  `SUMLOSSFEE` decimal(14, 2) NULL DEFAULT NULL,
  `ISTHIRDAGENCY` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CURRENCY` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `THIRDAGENCY` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CONTEXTS1` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `CONTEXTS2` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `CONTEXTS3` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `CONTEXTS4` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `CONTEXTS5` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `KEYCHECK` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `COMCODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MAKECOM` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VERIFYCHECKFLAG` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UNDERWRITESTATE` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEFLOSSREPAIRTYPE` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REPAIRFEE` decimal(14, 2) NULL DEFAULT NULL,
  `UNDERWRITEDATE` datetime(0) NULL DEFAULT NULL,
  `UNDERWRITEUSERCODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VERIFYCHECKCONTEXT` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VALIDFLAG` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FLAG` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `STATUS` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TASKFLAG` decimal(16, 0) NULL DEFAULT NULL,
  `REMARK` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OPERATORCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `HANDLERCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CREATETIME` datetime(0) NOT NULL,
  `UPDATEUSER` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `UPDATETIME` datetime(0) NOT NULL,
  `CHECK1PHONE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CHECK2PHONE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `IDX_PRPLCHECKTASK_CHECKID`(`CHECKID`) USING BTREE,
  INDEX `IDX_PRPLCHECKTASK_REGISTNO`(`REGISTNO`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prplcinsured
-- ----------------------------
DROP TABLE IF EXISTS `prplcinsured`;
CREATE TABLE `prplcinsured`  (
  `ID` decimal(16, 0) NOT NULL,
  `POLICYNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PRPLCMAINID` decimal(16, 0) NULL DEFAULT NULL,
  `RISKCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LANGUAGE` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSUREDTYPE` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSUREDCODE` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSUREDNAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSUREDADDRESS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSUREDNATURE` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSUREDFLAG` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSUREDIDENTITY` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RELATESERIALNO` decimal(15, 0) NULL DEFAULT NULL,
  `IDENTIFYTYPE` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `IDENTIFYNUMBER` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREDITLEVEL` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `POSSESSNATURE` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BUSINESSSOURCE` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BUSINESSSORT` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OCCUPATIONCODE` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EDUCATIONCODE` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BANK` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ACCOUNTNAME` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ACCOUNT` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LINKERNAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `POSTADDRESS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `POSTCODE` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PHONENUMBER` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MOBILE` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EMAIL` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BENEFITRATE` decimal(5, 2) NULL DEFAULT NULL,
  `BENEFITFLAG` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OCCUPATIONGRADE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VALIDFLAG` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FLAG` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REMARK` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OPERATORCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATETIME` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `HANDLERCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UPDATETIME` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `SEX` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AGE` decimal(15, 0) NULL DEFAULT NULL,
  `SERIALNO` decimal(15, 0) NULL DEFAULT NULL,
  `CUTOMERSEQUENCENO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `IDX_PRPLCINSURED_INSUREDCODE`(`INSUREDCODE`) USING BTREE,
  INDEX `IDX_PRPLCINSURED_INSUREDFLAG`(`INSUREDFLAG`) USING BTREE,
  INDEX `IDX_PRPLCINSURED_POLICYNO`(`POLICYNO`) USING BTREE,
  INDEX `IDX_PRPLCINSURED_PRPLCMAINID`(`PRPLCMAINID`) USING BTREE,
  INDEX `IDX_PRPLCINSURED_SERIALNO`(`SERIALNO`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prplcinsuredidvlist
-- ----------------------------
DROP TABLE IF EXISTS `prplcinsuredidvlist`;
CREATE TABLE `prplcinsuredidvlist`  (
  `ID` decimal(8, 0) NOT NULL,
  `POLICYNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FARMERNAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `IDENTIFYNUMBER` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CLAUSECODE` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `GROUPNO` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ANIMALAGE` int(11) NULL DEFAULT NULL,
  `ITEMNAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UNITAMOUNT` decimal(8, 0) NULL DEFAULT NULL,
  `LOSSID` decimal(8, 0) NULL DEFAULT NULL,
  `UDID` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `KINDCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `QUANTITY` decimal(8, 0) NULL DEFAULT NULL,
  `ITEMDETAILNAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prplcitemdevice
-- ----------------------------
DROP TABLE IF EXISTS `prplcitemdevice`;
CREATE TABLE `prplcitemdevice`  (
  `ID` decimal(16, 0) NOT NULL,
  `POLICYNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PRPLCMAIMID` decimal(16, 0) NULL DEFAULT NULL,
  `RISKCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ITEMNO` decimal(19, 0) NULL DEFAULT NULL,
  `DEVICENO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REMARK` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prplcitemkind
-- ----------------------------
DROP TABLE IF EXISTS `prplcitemkind`;
CREATE TABLE `prplcitemkind`  (
  `ID` decimal(16, 0) NOT NULL,
  `REGISTNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ITEMKINDNO` decimal(19, 0) NULL DEFAULT NULL,
  `CLAIMNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PRPLCMAINID` decimal(16, 0) NULL DEFAULT NULL,
  `POLICYNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RISKCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FAMILYNO` decimal(19, 0) NULL DEFAULT NULL,
  `FAMILYNAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `KINDCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `KINDNAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ITEMNO` decimal(19, 0) NULL DEFAULT NULL,
  `ITEMCODE` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ITEMDETAILNAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MODECODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MODENAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `STARTTIME` datetime(0) NULL DEFAULT NULL,
  `ENDTIME` datetime(0) NULL DEFAULT NULL,
  `MODEL` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BUYDATE` datetime(0) NULL DEFAULT NULL,
  `ADDRESSNO` decimal(19, 0) NULL DEFAULT NULL,
  `CALCULATEFLAG` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CURRENCY` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UNITAMOUNT` decimal(14, 2) NULL DEFAULT NULL,
  `QUANTITY` decimal(14, 2) NULL DEFAULT NULL,
  `UNIT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VALUE` decimal(14, 2) NULL DEFAULT NULL,
  `AMOUNT` decimal(14, 2) NULL DEFAULT NULL,
  `RATEPERIOD` decimal(19, 0) NULL DEFAULT NULL,
  `RATE` decimal(14, 5) NULL DEFAULT NULL,
  `SHORTRATEFLAG` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SHORTRATE` decimal(8, 4) NULL DEFAULT NULL,
  `BASEPREMIUM` decimal(14, 2) NULL DEFAULT NULL,
  `BENCHMARKPREMIUM` decimal(14, 2) NULL DEFAULT NULL,
  `DISCOUNT` decimal(8, 4) NULL DEFAULT NULL,
  `ADJUSTRATE` decimal(8, 4) NULL DEFAULT NULL,
  `PREMIUM` decimal(14, 2) NULL DEFAULT NULL,
  `DEDUCTIBLERATE` decimal(8, 4) NULL DEFAULT NULL,
  `DEDUCTIBLE` decimal(12, 2) NULL DEFAULT NULL,
  `VALIDFLAG` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FLAG` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REMARK` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OPERATORCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATETIME` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `HANDLERCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UPDATETIME` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `NODUTYFLAG` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TRAFFICAMOUNTLIMIT` decimal(14, 2) NULL DEFAULT NULL,
  `CHASSISNUMBER` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL,
  `PLANCODE` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DamageReasonType` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DamageResult` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `IDX_PRPLCITEMKIND_CLAIMNO`(`CLAIMNO`) USING BTREE,
  INDEX `IDX_PRPLCITEMKIND_PCID`(`PRPLCMAINID`) USING BTREE,
  INDEX `IDX_PRPLCITEMKIND_POLICYNO`(`POLICYNO`) USING BTREE,
  INDEX `IDX_PRPLCITEMKIND_REGISTNO`(`REGISTNO`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prplcitemship
-- ----------------------------
DROP TABLE IF EXISTS `prplcitemship`;
CREATE TABLE `prplcitemship`  (
  `ID` decimal(19, 0) NOT NULL,
  `REGISTNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PRPLCMAINID` decimal(19, 0) NULL DEFAULT NULL,
  `POLICYNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RISKCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ITEMNO` decimal(15, 0) NULL DEFAULT NULL,
  `FLEETNO` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SHIPCODE` varchar(14) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SHIPCNAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SHIPOWNER` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `COUNTRYCODE` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MAKEFACTORY` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sailareacode` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SAILAREANAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL,
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prplclaim
-- ----------------------------
DROP TABLE IF EXISTS `prplclaim`;
CREATE TABLE `prplclaim`  (
  `CLAIMNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `MainClaimNo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REGISTNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `COMCODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MAKECOM` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `POLICYNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RISKCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CLASSCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REPORTTIME` datetime(0) NOT NULL,
  `CLAIMTIME` datetime(0) NULL DEFAULT NULL,
  `CLAIMTYPE` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AccidentNo` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AccidentSubject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DamageReasonType` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DamageResult` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ReportorName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ReportorPhone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ReportorEmail` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LinkerName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LinkerPhone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LinkerEmail` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `HospitalCode` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `HospitalName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ISSUBROGATION` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MERCYFLAG` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SUMDEFLOSS` decimal(12, 2) NULL DEFAULT NULL,
  `SUMCLAIM` decimal(12, 2) NULL DEFAULT NULL,
  `SUMESTIPAID` decimal(12, 2) NULL DEFAULT NULL,
  `SUMESTIFEE` decimal(12, 2) NULL DEFAULT NULL,
  `SUMPAID` decimal(12, 2) NULL DEFAULT NULL,
  `SUMREPLEVY` decimal(12, 2) NULL DEFAULT NULL,
  `SUMRESERVE` decimal(14, 2) NULL DEFAULT NULL,
  `SUMLOSSRESERVE` decimal(14, 2) NULL DEFAULT NULL,
  `SUMCOSTRESERVE` decimal(14, 2) NULL DEFAULT NULL,
  `SUMCHARGEFEE` decimal(12, 2) NULL DEFAULT NULL,
  `DOCUMENTCODE` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CASENO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ENDCASETIME` datetime(0) NULL DEFAULT NULL,
  `ENDCASERCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CANCELCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CANCELREASON` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CANCELTIME` datetime(0) NULL DEFAULT NULL,
  `DEALERCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VALIDFLAG` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FLAG` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REMARK` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATEUSER` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CREATETIME` datetime(0) NULL DEFAULT NULL,
  `UPDATEUSER` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `UPDATETIME` datetime(0) NULL DEFAULT NULL,
  `CLAIMFLAG` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `COMPENSATESTATUS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ESTITIMES` int(11) NULL DEFAULT NULL,
  `DOCCOLLFLAG` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DOCCOLLENDTIME` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `DAMAGEDETAIL` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ENDCASEFLAG` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSUREDCODE` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSUREDNAME` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OPINIONTYPE` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RELATERESPONSIBLEPARTY` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RELATERECOVERY` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RELATECHECK` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UNDWRTREJECTFLAG` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ZEROREASONCODE` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ZEROREMARK` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ZEROCLAIMFLAG` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CASETYPE` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SUMPREPAID` decimal(14, 2) NULL DEFAULT NULL,
  `SUMOUTSTANDING` decimal(14, 2) NULL DEFAULT NULL,
  `ESTIDATE` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ORICURRENCY` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORISUMESTIPAID` decimal(14, 2) NULL DEFAULT NULL,
  `ORISUMCLAIM` decimal(14, 2) NULL DEFAULT NULL,
  `ORISUMCHARGE` decimal(14, 2) NULL DEFAULT NULL,
  `CASEDESCRIPTION` varchar(900) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CLAIMAMOUNT` decimal(14, 2) NULL DEFAULT NULL,
  `CLAIMAPPLYDATE` datetime(0) NULL DEFAULT NULL,
  `CLAIMEVALUATION` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DAMAGENAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DAMAGEADDRESS` varchar(600) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DAMAGETIME` datetime(0) NOT NULL,
  `DAMAGECODE` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DAMAGETYPECODE` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DAMAGEAREACODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `STARTDATE` datetime(0) NULL DEFAULT NULL,
  `ENDDATE` datetime(0) NULL DEFAULT NULL,
  `CURRENCY` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LOSSNAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LTEXT` varchar(900) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `HANDLERCODE` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `OPERATORCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `OPERATORNAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INJURYNUMBER` decimal(14, 2) NULL DEFAULT NULL,
  `DIENUMBER` decimal(14, 2) NULL DEFAULT NULL,
  `SUMAMOUNT` decimal(14, 2) NULL DEFAULT NULL,
  `SUMQUANTITY` int(11) NULL DEFAULT NULL,
  `SUMPREMIUM` decimal(14, 2) NULL DEFAULT NULL,
  `SUMLOSS` decimal(14, 2) NULL DEFAULT NULL,
  `LOSSCURRENCY` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DLOSSPERSSUMLOSS` decimal(14, 2) NULL DEFAULT NULL,
  `DLOSSPERSLOSSCURRENCY` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `NATIONFLAG` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DAMAGEAREA` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BUSINESSPLATE` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AMLFLAG` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL,
  `SERIALNO` decimal(38, 0) NULL DEFAULT NULL,
  PRIMARY KEY (`CLAIMNO`) USING BTREE,
  INDEX `IDX_PRPLCLAIM_CASENO`(`CASENO`) USING BTREE,
  INDEX `IDX_PRPLCLAIM_POLICYNO`(`POLICYNO`) USING BTREE,
  INDEX `IDX_PRPLCLAIM_REGISTNO`(`REGISTNO`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prplclaimavgset
-- ----------------------------
DROP TABLE IF EXISTS `prplclaimavgset`;
CREATE TABLE `prplclaimavgset`  (
  `ID` decimal(16, 0) NOT NULL,
  `AVGYEAR` decimal(8, 0) NULL DEFAULT NULL,
  `COMCODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RISKCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RISKITEMCODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BUSINESSPLATE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AVGTYPE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AVGAMOUNT` decimal(10, 2) NULL DEFAULT NULL,
  `STATUS` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OPERATEEMPCODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OPERATEEMPNAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OPERATEDPTCODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OPERATEDPTNAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VALIDSTATUS` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FLAG` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REMARK` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATEUSER` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATETIME` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATEUSER` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UPDATETIME` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL,
  `KINDCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PLANCODE` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prplclaimfee
-- ----------------------------
DROP TABLE IF EXISTS `prplclaimfee`;
CREATE TABLE `prplclaimfee`  (
  `ID` decimal(16, 0) NOT NULL,
  `REGISTNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CLAIMNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DamageResult` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DutyStartTime` datetime(0) NULL DEFAULT NULL,
  `DutyEndTime` datetime(0) NULL DEFAULT NULL,
  `RISKCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FEETYPE` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `NODENAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `KINDCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `KINDNAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CLAUSECODE` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CLAUSENAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OPERATORCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MAKECOM` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FEECODE` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FEENAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PAYFEE` decimal(14, 2) NULL DEFAULT NULL,
  `LOSSRESERVE` decimal(14, 2) NULL DEFAULT NULL,
  `REGIONCODE` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REGIONNAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LOSSITEMNO` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LOSSITEMNAME` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CURRENCY` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EXCHRATE` decimal(8, 4) NULL DEFAULT NULL,
  `DEFLOSS` decimal(12, 2) NULL DEFAULT NULL,
  `INSUREDNAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LOSSNAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AMOUNT` decimal(14, 2) NULL DEFAULT NULL,
  `RESCUEFEE` decimal(12, 2) NULL DEFAULT NULL,
  `RESTFEE` decimal(12, 2) NULL DEFAULT NULL,
  `CLAIMLOSS` decimal(12, 2) NULL DEFAULT NULL,
  `COSTRESERVE` decimal(14, 2) NULL DEFAULT NULL,
  `PAIDLOSS` decimal(12, 2) NULL DEFAULT NULL,
  `DEDUCTIBLERATE` decimal(8, 4) NULL DEFAULT NULL,
  `DEDUCTIBLE` decimal(12, 2) NULL DEFAULT NULL,
  `ADJUSTTIMES` decimal(38, 0) NULL DEFAULT NULL,
  `ADJUSTREASON` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ADJUSTTIME` datetime(0) NOT NULL,
  `COMPSTATUS` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CANCELFLAG` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DANGERUNIT` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VALIDFLAG` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FLAG` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REMARK` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATEUSER` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CREATETIME` datetime(0) NOT NULL,
  `UPDATEUSER` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `UPDATETIME` datetime(0) NOT NULL,
  `ITEMKINDNO` decimal(19, 0) NULL DEFAULT NULL,
  `DANGERNO` decimal(8, 0) NULL DEFAULT NULL,
  `CERTIFYTYPENAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CERTIFYNO` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CERTIFYTYPECODE` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL,
  `agencyType` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `agencyCodeType` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `agencyName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `agencyCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REMANENTAMOUNT` decimal(14, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `IDX_PRPLCLAIMKIND_CLAIMNO`(`CLAIMNO`) USING BTREE,
  INDEX `IDX_PRPLCLAIMKIND_REGISTNO`(`REGISTNO`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prplclaimfeehis
-- ----------------------------
DROP TABLE IF EXISTS `prplclaimfeehis`;
CREATE TABLE `prplclaimfeehis`  (
  `ID` decimal(16, 0) NOT NULL,
  `REGISTNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CLAIMNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DamageResult` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DutyStartTime` datetime(0) NULL DEFAULT NULL,
  `DutyEndTime` datetime(0) NULL DEFAULT NULL,
  `RISKCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FEETYPE` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `NODENAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `KINDCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `KINDNAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CLAUSECODE` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CLAUSENAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OPERATORCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MAKECOM` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FEECODE` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FEENAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PAYFEE` decimal(14, 2) NULL DEFAULT NULL,
  `LOSSRESERVE` decimal(14, 2) NULL DEFAULT NULL,
  `REGIONCODE` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REGIONNAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LOSSITEMNO` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LOSSITEMNAME` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CURRENCY` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'CNY',
  `EXCHRATE` decimal(8, 4) NULL DEFAULT NULL,
  `DEFLOSS` decimal(12, 2) NULL DEFAULT NULL,
  `INSUREDNAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LOSSNAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AMOUNT` decimal(14, 2) NULL DEFAULT NULL,
  `RESCUEFEE` decimal(12, 2) NULL DEFAULT NULL,
  `RESTFEE` decimal(12, 2) NULL DEFAULT NULL,
  `CLAIMLOSS` decimal(12, 2) NULL DEFAULT NULL,
  `COSTRESERVE` decimal(14, 2) NULL DEFAULT NULL,
  `PAIDLOSS` decimal(12, 2) NULL DEFAULT NULL,
  `DEDUCTIBLERATE` decimal(8, 4) NULL DEFAULT NULL,
  `DEDUCTIBLE` decimal(12, 2) NULL DEFAULT NULL,
  `ADJUSTTIMES` int(11) NOT NULL,
  `ADJUSTREASON` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ADJUSTTIME` datetime(0) NOT NULL,
  `COMPSTATUS` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CANCELFLAG` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DANGERUNIT` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VALIDFLAG` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FLAG` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REMARK` varchar(800) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATEUSER` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CREATETIME` datetime(0) NOT NULL,
  `UPDATEUSER` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `UPDATETIME` datetime(0) NOT NULL,
  `HISFLAG` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ITEMKINDNO` decimal(19, 0) NULL DEFAULT NULL,
  `DANGERNO` decimal(8, 0) NULL DEFAULT NULL,
  `CERTIFYTYPENAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CERTIFYNO` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CERTIFYTYPECODE` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BEFORECHANGECLAIMLOSS` decimal(12, 2) NULL DEFAULT NULL,
  `BEFORECHANGELOSSRESERVE` decimal(12, 2) NULL DEFAULT NULL,
  `BEFORECHANGEPAYFEE` decimal(12, 2) NULL DEFAULT NULL,
  `BEFORECHANGECOSTRESERVE` decimal(12, 2) NULL DEFAULT NULL,
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL,
  `REMANENTAMOUNT` decimal(14, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `IDX_PRPLCLAIMKINDHIS_CLAIMNO`(`CLAIMNO`) USING BTREE,
  INDEX `IDX_PRPLCLAIMKINDHIS_REGISTNO`(`REGISTNO`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prplclaimfeetemp
-- ----------------------------
DROP TABLE IF EXISTS `prplclaimfeetemp`;
CREATE TABLE `prplclaimfeetemp`  (
  `ID` decimal(16, 0) NOT NULL,
  `REGISTNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CLAIMNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DamageResult` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DutyStartTime` datetime(0) NULL DEFAULT NULL,
  `DutyEndTime` datetime(0) NULL DEFAULT NULL,
  `RISKCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FEETYPE` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `NODENAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `KINDCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `KINDNAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CLAUSECODE` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CLAUSENAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OPERATORCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MAKECOM` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FEECODE` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FEENAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PAYFEE` decimal(14, 2) NULL DEFAULT NULL,
  `COSTRESERVE` decimal(14, 2) NULL DEFAULT NULL,
  `REGIONCODE` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REGIONNAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LOSSITEMNO` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LOSSITEMNAME` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CURRENCY` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EXCHRATE` decimal(8, 4) NULL DEFAULT NULL,
  `DEFLOSS` decimal(12, 2) NULL DEFAULT NULL,
  `INSUREDNAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LOSSNAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AMOUNT` decimal(14, 2) NULL DEFAULT NULL,
  `RESCUEFEE` decimal(12, 2) NULL DEFAULT NULL,
  `RESTFEE` decimal(12, 2) NULL DEFAULT NULL,
  `CLAIMLOSS` decimal(12, 2) NULL DEFAULT NULL,
  `LOSSRESERVE` decimal(14, 2) NULL DEFAULT NULL,
  `PAIDLOSS` decimal(12, 2) NULL DEFAULT NULL,
  `DEDUCTIBLERATE` decimal(8, 4) NULL DEFAULT NULL,
  `DEDUCTIBLE` decimal(12, 2) NULL DEFAULT NULL,
  `ADJUSTTIMES` decimal(38, 0) NULL DEFAULT NULL,
  `ADJUSTREASON` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ADJUSTTIME` datetime(0) NOT NULL,
  `COMPSTATUS` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CANCELFLAG` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DANGERUNIT` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VALIDFLAG` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FLAG` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REMARK` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATEUSER` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CREATETIME` datetime(0) NOT NULL,
  `UPDATEUSER` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `UPDATETIME` datetime(0) NOT NULL,
  `ITEMKINDNO` decimal(19, 0) NULL DEFAULT NULL,
  `DANGERNO` decimal(8, 0) NULL DEFAULT NULL,
  `CERTIFYTYPENAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CERTIFYNO` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL,
  `REMANENTAMOUNT` decimal(14, 2) NULL DEFAULT NULL,
  `agencyType` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `agencyCodeType` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `agencyName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `agencyCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `IDX_PRPLCLAIMFEETEMP_CLAIMNO`(`CLAIMNO`) USING BTREE,
  INDEX `IDX_PRPLCLAIMFEETEMP_REGISTNO`(`REGISTNO`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prplclaimforcerec
-- ----------------------------
DROP TABLE IF EXISTS `prplclaimforcerec`;
CREATE TABLE `prplclaimforcerec`  (
  `ID` decimal(16, 0) NOT NULL,
  `REGISTNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `POLICYNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CLAIMNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ERRORFLAG` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ERRORSUMMARY` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MAKECOM` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INPUTTIME` datetime(0) NULL DEFAULT NULL,
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `IDX_PRPLCLAIMFORCEREC_CLAIMNO`(`CLAIMNO`) USING BTREE,
  INDEX `IDX_PRPLCLAIMFORCEREC_POLICYNO`(`POLICYNO`) USING BTREE,
  INDEX `IDX_PRPLCLAIMFORCEREC_REGISTNO`(`REGISTNO`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prplclaimnote
-- ----------------------------
DROP TABLE IF EXISTS `prplclaimnote`;
CREATE TABLE `prplclaimnote`  (
  `REGISTNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CLAIMNOTE` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `MAKECOM` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `NUM` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`REGISTNO`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prplclaimopinion
-- ----------------------------
DROP TABLE IF EXISTS `prplclaimopinion`;
CREATE TABLE `prplclaimopinion`  (
  `ID` decimal(16, 0) NOT NULL,
  `COMPENSATENO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REGISTNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PRPLCHECKTASKID` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PRPLDEFLOSSMAINID` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PRPLPROPMAINID` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PRPLRECLAIMID` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SUMPAID` decimal(14, 2) NULL DEFAULT NULL,
  `SUMVERILOSSFEE` decimal(14, 2) NULL DEFAULT NULL,
  `SUMVERIREMNANT` decimal(14, 2) NULL DEFAULT NULL,
  `OPINIONTYPE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DESCRIPTION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `RECLAIMFEE` decimal(14, 2) NULL DEFAULT NULL,
  `PRPLPERSONID` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AUDITSTATE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AUDISTATEEXPLAIN` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PRPLWFMAINID` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OPERATORNODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OPERATORCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OPERATORNAME` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `COMCODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `COMNAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OPERATEDATE` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `STATUS` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VALIDFLAG` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FLAG` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REMARK` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATEUSER` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATETIME` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATEUSER` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UPDATETIME` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `RENEWPROPOSAL` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `IDX_PRPLCLAIMOPINION_CNO`(`COMPENSATENO`) USING BTREE,
  INDEX `IDX_PRPLCLAIMOPINION_PCTID`(`PRPLCHECKTASKID`) USING BTREE,
  INDEX `IDX_PRPLCLAIMOPINION_PPID`(`PRPLPERSONID`) USING BTREE,
  INDEX `IDX_PRPLCLAIMOPINION_PPMID`(`PRPLPROPMAINID`) USING BTREE,
  INDEX `IDX_PRPLCLAIMOPINION_PRCID`(`PRPLRECLAIMID`) USING BTREE,
  INDEX `IDX_PRPLCLAIMOPINION_PRPLLMID`(`PRPLDEFLOSSMAINID`) USING BTREE,
  INDEX `IDX_PRPLCLAIMOPINION_REGISTNO`(`REGISTNO`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prplclaimtrack
-- ----------------------------
DROP TABLE IF EXISTS `prplclaimtrack`;
CREATE TABLE `prplclaimtrack`  (
  `ID` decimal(16, 0) NOT NULL,
  `CLAIMNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MODIFYTIME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `MODIFYUSERCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `MODIFYUSERNAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `MODIFYITEM` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `BEFVALUE` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AFTVALUE` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MODIFYCOUNT` decimal(8, 0) NULL DEFAULT NULL,
  `MAKECOM` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `IDX_PRPLCLAIMTRACK_CNO`(`CLAIMNO`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prplclassiccase
-- ----------------------------
DROP TABLE IF EXISTS `prplclassiccase`;
CREATE TABLE `prplclassiccase`  (
  `ID` decimal(16, 0) NOT NULL,
  `MAINID` decimal(16, 0) NULL DEFAULT NULL,
  `RISKCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `COMCODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BASICINFO` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `HANDLEINFO` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `EXPERIENCE` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `FEEDBACK` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `REGISTNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `IDX_PRPLCLASSICCASE_MAINID`(`MAINID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prplclimitinfo
-- ----------------------------
DROP TABLE IF EXISTS `prplclimitinfo`;
CREATE TABLE `prplclimitinfo`  (
  `ID` decimal(8, 0) NOT NULL,
  `POLICYNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PRPLCMAINID` decimal(19, 0) NULL DEFAULT NULL,
  `RISKCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LIMITGRADE` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LIMITNO` decimal(19, 0) NULL DEFAULT NULL,
  `LIMITTYPE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LIMITNAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CURRENCY` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LIMITFEE` decimal(14, 2) NULL DEFAULT NULL,
  `LIMITFLAG` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prplcmain
-- ----------------------------
DROP TABLE IF EXISTS `prplcmain`;
CREATE TABLE `prplcmain`  (
  `ID` decimal(16, 0) NOT NULL,
  `REGISTNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CLAIMNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `POLICYNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `GROUPID` varchar(22) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `GROUPNAME` varchar(22) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CLASSCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RISKCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PROPOSALNO` varchar(22) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CONTRACTNO` varchar(22) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `POLICYSORT` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PRINTNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BUSINESSNATURE` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LANGUAGE` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `POLICYTYPE` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPLICODE` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPLINAME` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPLIADDRESS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSUREDCODE` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSUREDNAME` varchar(320) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSUREDADDRESS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OPERATEDATE` datetime(0) NULL DEFAULT NULL,
  `STARTDATE` datetime(0) NULL DEFAULT NULL,
  `ENDDATE` datetime(0) NULL DEFAULT NULL,
  `PURERATE` decimal(8, 4) NULL DEFAULT NULL,
  `DISRATE` decimal(8, 4) NULL DEFAULT NULL,
  `DISCOUNT` decimal(8, 4) NULL DEFAULT NULL,
  `CURRENCY` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SUMVALUE` decimal(14, 2) NULL DEFAULT NULL,
  `SUMAMOUNT` decimal(14, 2) NULL DEFAULT NULL,
  `SUMDISCOUNT` decimal(14, 2) NULL DEFAULT NULL,
  `SUMPREMIUM` decimal(14, 2) NULL DEFAULT NULL,
  `SUMSUBPREM` decimal(14, 2) NULL DEFAULT NULL,
  `SUMQUANTITY` decimal(19, 0) NULL DEFAULT NULL,
  `JUDICALSCOPE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AUTOTRANSRENEWFLAG` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ARGUESOLUTION` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ARBITBOARDNAME` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PAYTIMES` decimal(19, 0) NULL DEFAULT NULL,
  `ENDORSETIMES` decimal(19, 0) NULL DEFAULT NULL,
  `REGISTTIMES` decimal(19, 0) NULL DEFAULT NULL,
  `CLAIMTIMES` decimal(19, 0) NULL DEFAULT NULL,
  `SUMCLAIM` decimal(14, 2) NULL DEFAULT NULL,
  `MAKECOM` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OPERATESITE` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `COMCODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `HANDLERCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `HANDLER1CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPROVERCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UNDERWRITECODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UNDERWRITENAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OPERATORCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INPUTDATE` datetime(0) NULL DEFAULT NULL,
  `INPUTHOUR` decimal(19, 0) NULL DEFAULT NULL,
  `UNDERWRITEENDDATE` datetime(0) NULL DEFAULT NULL,
  `STATISTICSYM` datetime(0) NULL DEFAULT NULL,
  `AGENTCODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `COINSFLAG` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REINSFLAG` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ALLINSFLAG` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UNDERWRITEFLAG` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OTHFLAG` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VALIDFLAG` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AGRIFYPE` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BUSINESSKIND` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `JUDICALCODE` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DISRATE1` decimal(8, 4) NULL DEFAULT NULL,
  `BUSINESSFLAG` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UPDATERCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UPDATEDATE` datetime(0) NULL DEFAULT NULL,
  `UPDATEHOUR` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SIGNDATE` datetime(0) NULL DEFAULT NULL,
  `AGREEMENTNO` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INQUIRYNO` varchar(22) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PAYMODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SHAREHOLDERFLAG` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VISACODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MANUALTYPE` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `NATIONFLAG` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `JFEEFLAG` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PRECHECKDATE` datetime(0) NULL DEFAULT NULL,
  `HANDLERNAME` varchar(21) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `HANDLER1NAME` varchar(21) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PAYREFCODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PAYREFNAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PAYREFTIME` datetime(0) NULL DEFAULT NULL,
  `PRINTTIME` datetime(0) NULL DEFAULT NULL,
  `AGRINATURE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SERVICEPROVIDERS` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SERVICETYPE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SERVICES` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BILLINGWAY` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BUSINESSCHANNEL` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BUSINESSAGENTTYPE` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UNITEAGENTCHANNEL` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CURRENCY1` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CURRENCY2` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TWOAVOID` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BUSINATURENO` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FLAG` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REMARK` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATEUSER` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATETIME` datetime(0) NULL DEFAULT NULL,
  `UPDATEUSER` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UPDATETIME` datetime(0) NULL DEFAULT NULL,
  `RENEWAL` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `STOCKHOLDERCODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `STOCKHOLDERNAME` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FARMFLAG` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OTHERBUSINESSFLAG` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BUSINESSCLASS` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `STARTHOUR` decimal(15, 0) NULL DEFAULT NULL,
  `ENDHOUR` decimal(15, 0) NULL DEFAULT NULL,
  `SUBBUSINESSNATURE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PECCANCYCOEFF` decimal(14, 2) NULL DEFAULT NULL,
  `CLAIMCOEFF` decimal(14, 2) NULL DEFAULT NULL,
  `RATEFLOATFLAG` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AGENTNAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ENDORNO` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `POLICYSEQUENCENO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL,
  `ISSUETIME` date NULL DEFAULT NULL,
  `CHANNELNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSURECARDTYPE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSURECARD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSUREDCARDTYPE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSUREDCARD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RELATEFLAG` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RELATENAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RELATECODE` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VATRATE` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PLANCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `T0CODE` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `T1CODE` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `T2CODE` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ACCCHANNEL` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `IDX_PRPLCMAIN_CLAIMNO`(`CLAIMNO`) USING BTREE,
  INDEX `IDX_PRPLCMAIN_GROUPID`(`GROUPID`) USING BTREE,
  INDEX `IDX_PRPLCMAIN_POLICYNO`(`POLICYNO`) USING BTREE,
  INDEX `IDX_PRPLCMAIN_REGISTNO`(`REGISTNO`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prplcmaincargo
-- ----------------------------
DROP TABLE IF EXISTS `prplcmaincargo`;
CREATE TABLE `prplcmaincargo`  (
  `ID` decimal(19, 0) NOT NULL,
  `REGISTNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PRPLCMAINID` decimal(19, 0) NULL DEFAULT NULL,
  `POLICYNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RISKCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CARRYBILLNO` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `STARTSITECODE` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `STARTSITENAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VIASITECODE` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VIASITENAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ENDSITECODE` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ENDSITENAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL,
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `IDX_PRPLCMAINCARGO_REGISTNO`(`REGISTNO`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prplcompensate
-- ----------------------------
DROP TABLE IF EXISTS `prplcompensate`;
CREATE TABLE `prplcompensate`  (
  `COMPENSATENO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `MainCompensateNo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CLAIMNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REGISTNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CASENO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `POLICYNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RISKCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MAKECOM` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `COMCODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TIMES` decimal(14, 0) NOT NULL,
  `CURRENCY` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `COMPENSATETYPE` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SUMAMT` decimal(14, 2) NULL DEFAULT NULL,
  `SUMPREAMT` decimal(14, 2) NULL DEFAULT NULL,
  `SUMPAIDAMT` decimal(14, 2) NULL DEFAULT NULL,
  `SUMFEE` decimal(14, 2) NULL DEFAULT NULL,
  `SUMPREFEE` decimal(14, 2) NULL DEFAULT NULL,
  `SUMPAIDFEE` decimal(14, 2) NULL DEFAULT NULL,
  `SUMREALPAY` decimal(14, 2) NULL DEFAULT NULL,
  `SumRealPayCny` decimal(14, 2) NULL DEFAULT NULL,
  `sumPrePayCny` decimal(14, 2) NULL DEFAULT NULL,
  `PAYSTATUS` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RECOVERYFLAG` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LAWSUITFLAG` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ALLOWFLAG` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AGREEAMT` decimal(10, 2) NULL DEFAULT NULL,
  `AGREEDESC` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LCTEXT` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `LASTMODIFYUSER` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `HANDLERCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `HANDLERUSER` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `COMPENSATEDATE` datetime(0) NULL DEFAULT NULL,
  `FIRSTCOMPENSATEDATE` datetime(0) NULL DEFAULT NULL,
  `UNDERWRITEFLAG` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UNDERWRITEUSER` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UNDERWRITEDATE` datetime(0) NULL DEFAULT NULL,
  `REMARK` varchar(3000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATETIME` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATETIME` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CASETYPE` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSUREDNAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSUREDCODE` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ENDCASEFLAG` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `COINSFLAG` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL,
  `SETTLENO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ZEROENDCASETEXT` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ZEROENDCASEDESC` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FIRSTCOMPENSATEPAIDFLAG` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REDUCEDPREPAYFLAG` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`COMPENSATENO`) USING BTREE,
  INDEX `IDX_PRPLCOMPENSATE_CASENO`(`CASENO`) USING BTREE,
  INDEX `IDX_PRPLCOMPENSATE_CLAIMNO`(`CLAIMNO`) USING BTREE,
  INDEX `IDX_PRPLCOMPENSATE_POLICYNO`(`POLICYNO`) USING BTREE,
  INDEX `IDX_PRPLCOMPENSATE_RNO`(`REGISTNO`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prplcompensatedfloss
-- ----------------------------
DROP TABLE IF EXISTS `prplcompensatedfloss`;
CREATE TABLE `prplcompensatedfloss`  (
  `Id` decimal(16, 0) NOT NULL,
  `CompensateNo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `dfId` decimal(16, 0) NULL DEFAULT NULL,
  `dfType` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CreateUser` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OperateUser` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `InsertTimeForHis` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OperateTimeForHis` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prplcompensateext
-- ----------------------------
DROP TABLE IF EXISTS `prplcompensateext`;
CREATE TABLE `prplcompensateext`  (
  `ID` decimal(16, 0) NOT NULL,
  `REGISTNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `COMPENSATENO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LASTCOMPENSATEFLAG` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AUTOCOMPENSATEFLAG` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `KEYREMARK` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OPPOCOMPENSATENO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CHECKDEDUCTFLAG` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PAYBACKSTATE` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ISPAYFLAG` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ISCOMPDEDUCT` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `HURTNUM` int(11) NULL DEFAULT NULL,
  `DEATHNUM` int(11) NULL DEFAULT NULL,
  `INJURENUM` int(11) NULL DEFAULT NULL,
  `CREATETIME` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATETIME` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `PAYBACKTYPE` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PAYBACKEXPLAIN` varchar(3000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PAYBACKREASON` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `IDX_PRPLCOMPENSATEEXT_RNO`(`REGISTNO`) USING BTREE,
  INDEX `IDX_PRPLPSTEEXT_CNO`(`COMPENSATENO`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prplconfigdefine
-- ----------------------------
DROP TABLE IF EXISTS `prplconfigdefine`;
CREATE TABLE `prplconfigdefine`  (
  `CONFIGCODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CONFIGNAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CONFIGDESC` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATORCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INPUTTIME` datetime(0) NULL DEFAULT NULL,
  `LASTMODIFYCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LASTMODIFYTIME` datetime(0) NULL DEFAULT NULL,
  `VALIDDATE` datetime(0) NULL DEFAULT NULL,
  `INVALIDDATE` datetime(0) NULL DEFAULT NULL,
  `REMARK` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VALIDSTATUS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`CONFIGCODE`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prplconfigvalue
-- ----------------------------
DROP TABLE IF EXISTS `prplconfigvalue`;
CREATE TABLE `prplconfigvalue`  (
  `COMCODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `RISKCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CONFIGCODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CONFIGVALUE` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATORCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INPUTTIME` datetime(0) NULL DEFAULT NULL,
  `LASTMODIFYCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LASTMODIFYTIME` datetime(0) NULL DEFAULT NULL,
  `VALIDDATE` datetime(0) NULL DEFAULT NULL,
  `INVALIDDATE` datetime(0) NULL DEFAULT NULL,
  `REMARK` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VALIDFLAG` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`COMCODE`, `RISKCODE`, `CONFIGCODE`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prplconsigner
-- ----------------------------
DROP TABLE IF EXISTS `prplconsigner`;
CREATE TABLE `prplconsigner`  (
  `ID` decimal(16, 0) NOT NULL,
  `USERCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `NODEID` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CONSIGNERCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `STARTTIME` datetime(0) NULL DEFAULT NULL,
  `ENDTIME` datetime(0) NULL DEFAULT NULL,
  `INPUTTIME` datetime(0) NULL DEFAULT NULL,
  `CANCELTIME` datetime(0) NULL DEFAULT NULL,
  `VALIDFLAG` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FLAG` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prplconsignerrec
-- ----------------------------
DROP TABLE IF EXISTS `prplconsignerrec`;
CREATE TABLE `prplconsignerrec`  (
  `ID` decimal(16, 0) NOT NULL,
  `USERCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `NODEID` decimal(8, 0) NULL DEFAULT NULL,
  `CONSIGNERCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REGISTNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BUSINESSMAINID` varchar(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TASKID` decimal(16, 0) NULL DEFAULT NULL,
  `INPUTTIME` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `STATUS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FLAG` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `IDX_PRPLCONSIGNERREC_RNO`(`REGISTNO`) USING BTREE,
  INDEX `IDX_PRPLCONSIGNERREC_UCODE`(`USERCODE`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prplcreinsure
-- ----------------------------
DROP TABLE IF EXISTS `prplcreinsure`;
CREATE TABLE `prplcreinsure`  (
  `ID` decimal(19, 0) NOT NULL,
  `REGISTNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PRPLCMAINID` decimal(19, 0) NULL DEFAULT NULL,
  `POLICYNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DANGERNO` decimal(8, 0) NULL DEFAULT NULL,
  `REINSMODE` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SHARERETESUM` decimal(9, 6) NULL DEFAULT NULL,
  `AMOUNTSUM` decimal(14, 2) NULL DEFAULT NULL,
  `PREMIUMSUM` decimal(14, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `IDX_PRPLCREINSURE_REGISTNO`(`REGISTNO`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prpldependent
-- ----------------------------
DROP TABLE IF EXISTS `prpldependent`;
CREATE TABLE `prpldependent`  (
  `ID` decimal(16, 0) NULL DEFAULT NULL,
  `REGISTNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INJUREDID` decimal(16, 0) NULL DEFAULT NULL,
  `PAYPERSONNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SEX` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AGE` decimal(3, 0) NULL DEFAULT NULL,
  `PERMANENTADDRESS` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DOMICILEPLACE` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `WORKPLACE` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DOMICILE` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RELATIONSHIP` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INPUTTIME` datetime(0) NULL DEFAULT NULL,
  `VALIDFLAG` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REMARK` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FLAG` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATEUSER` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATETIME` datetime(0) NULL DEFAULT NULL,
  `UPDATEUSER` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UPDATETIME` datetime(0) NULL DEFAULT NULL,
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prpldflosspersbill
-- ----------------------------
DROP TABLE IF EXISTS `prpldflosspersbill`;
CREATE TABLE `prpldflosspersbill`  (
  `Id` decimal(16, 0) NOT NULL,
  `RegistNo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BillNo` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BillType` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TreatmentMode` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Hospitalcode` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Hospitalname` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `HospitalType` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Hospitallevel` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `HospitalGrade` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Appointflag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `NationFlag` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DamageAreaCode` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DamageArea` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BillDate` date NULL DEFAULT NULL,
  `SumBillAmount` decimal(14, 2) NULL DEFAULT NULL,
  `SumBillAmountCorrect` decimal(14, 2) NULL DEFAULT NULL,
  `MedicalInsFlag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Currency` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SocialInsPay` decimal(14, 2) NULL DEFAULT NULL,
  `SocialInsPayCorrect` decimal(14, 2) NULL DEFAULT NULL,
  `OwnPay` decimal(14, 2) NULL DEFAULT NULL,
  `OwnPayCorrect` decimal(14, 2) NULL DEFAULT NULL,
  `OwnExpense` decimal(14, 2) NULL DEFAULT NULL,
  `OwnExpenseCorrect` decimal(14, 2) NULL DEFAULT NULL,
  `CashPay` decimal(14, 2) NULL DEFAULT NULL,
  `CashPayCorrect` decimal(14, 2) NULL DEFAULT NULL,
  `SelfAccountPay` decimal(14, 2) NULL DEFAULT NULL,
  `SelfAccountPayCorrect` decimal(14, 2) NULL DEFAULT NULL,
  `ExtraPay` decimal(14, 2) NULL DEFAULT NULL,
  `ExtraPayCorrect` decimal(14, 2) NULL DEFAULT NULL,
  `UnreasonableFee` decimal(14, 2) NULL DEFAULT NULL,
  `ThirdPartyPay` decimal(14, 2) NULL DEFAULT NULL,
  `InHospitalDays` int(11) NULL DEFAULT NULL,
  `InHospitalDate` date NULL DEFAULT NULL,
  `OutHospitalDate` date NULL DEFAULT NULL,
  `Remark` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OcrFlag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VaildFlag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CreateUser` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OperateUser` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Inserttimeforhis` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `Operatetimeforhis` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prpldflosspersbilldetail
-- ----------------------------
DROP TABLE IF EXISTS `prpldflosspersbilldetail`;
CREATE TABLE `prpldflosspersbilldetail`  (
  `Id` decimal(16, 0) NOT NULL,
  `DflossPersBillId` decimal(16, 0) NOT NULL,
  `MedicineType` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MedicineName` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MedicineFee` decimal(14, 2) NULL DEFAULT NULL,
  `MedicineFeeCorrect` decimal(14, 2) NULL DEFAULT NULL,
  `MedicineClass` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MedicineClassCorrect` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OwnPayRate` decimal(14, 2) NULL DEFAULT NULL,
  `OwnPayRateCorrect` decimal(14, 2) NULL DEFAULT NULL,
  `OwnPay` decimal(14, 2) NULL DEFAULT NULL,
  `OwnPayCorrect` decimal(14, 2) NULL DEFAULT NULL,
  `Spec` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Form` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Unit` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Quantity` int(11) NULL DEFAULT NULL,
  `Unitprice` decimal(14, 2) NULL DEFAULT NULL,
  `CreateUser` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OperateUser` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Inserttimeforhis` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `Operatetimeforhis` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prpldflosspersbillfee
-- ----------------------------
DROP TABLE IF EXISTS `prpldflosspersbillfee`;
CREATE TABLE `prpldflosspersbillfee`  (
  `Id` decimal(16, 0) NOT NULL,
  `DflossPersBillId` decimal(16, 0) NOT NULL,
  `MedicineType` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SumAmount` decimal(14, 2) NULL DEFAULT NULL,
  `OwnPay` decimal(14, 2) NULL DEFAULT NULL,
  `OwnExpense` decimal(14, 2) NULL DEFAULT NULL,
  `CreateUser` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OperateUser` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Inserttimeforhis` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `Operatetimeforhis` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prpldisability
-- ----------------------------
DROP TABLE IF EXISTS `prpldisability`;
CREATE TABLE `prpldisability`  (
  `Id` decimal(16, 0) NOT NULL,
  `RegistNo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `IdentifyOrgCode` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `IdentifyDate` date NULL DEFAULT NULL,
  `IdentifyCriteria` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `IdentifyLevel` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DisabilityEvaluationCode` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CreateUser` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OperatorCode` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `InsertTimeForHis` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OperateTimeForHis` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prpldisaster
-- ----------------------------
DROP TABLE IF EXISTS `prpldisaster`;
CREATE TABLE `prpldisaster`  (
  `ID` decimal(16, 0) NOT NULL,
  `CLAIMNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DISASTERCODE` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DISASTERNAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OPERATORCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MAKECOM` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UPDATETIME` datetime(0) NULL DEFAULT NULL,
  `SECONDDISASTERCODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SECONDDISASTERNAME` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `IDX_PRPLDISASTER_CLAIMNO`(`CLAIMNO`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prpldlosspersfee
-- ----------------------------
DROP TABLE IF EXISTS `prpldlosspersfee`;
CREATE TABLE `prpldlosspersfee`  (
  `ID` decimal(16, 0) NOT NULL,
  `INJUREDID` decimal(16, 0) NULL DEFAULT NULL,
  `REGISTNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RISKCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FEETYPECODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FEETYPENAME` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UNITAMOUNT` decimal(14, 2) NULL DEFAULT NULL,
  `QUANTITY` decimal(10, 0) NULL DEFAULT NULL,
  `REALFEE` decimal(14, 2) NULL DEFAULT NULL,
  `DEDUCTIONFEE` decimal(14, 2) NULL DEFAULT NULL,
  `SUMDEFLOSS` decimal(14, 2) NULL DEFAULT NULL,
  `REMARK` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VALIDFLAG` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FLAG` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATEUSER` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATETIME` datetime(0) NULL DEFAULT NULL,
  `UPDATEUSER` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UPDATETIME` datetime(0) NULL DEFAULT NULL,
  `ESTIMATELOSS` decimal(14, 2) NULL DEFAULT NULL,
  `DISABLEDGRADE` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DISABLEDPAYRATE` decimal(5, 2) NULL DEFAULT NULL,
  `CREATEFLAG` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CAREFEE` decimal(14, 2) NULL DEFAULT NULL,
  `PAYPERSDAY` decimal(14, 2) NULL DEFAULT NULL,
  `INHOSIPTALDAY` decimal(14, 2) NULL DEFAULT NULL,
  `OUTPAYDAY` decimal(14, 2) NULL DEFAULT NULL,
  `DEDUCTIONCONTENT` varchar(3000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `IDX_PRPLDLOSSPERSFEE_INJUREDID`(`INJUREDID`) USING BTREE,
  INDEX `IDX_PRPLDLOSSPERSFEE_REGISTNO`(`REGISTNO`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prpldlosspershospital
-- ----------------------------
DROP TABLE IF EXISTS `prpldlosspershospital`;
CREATE TABLE `prpldlosspershospital`  (
  `ID` decimal(16, 0) NOT NULL,
  `INJUREDID` decimal(16, 0) NULL DEFAULT NULL COMMENT '??????ID',
  `REGISTNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PERSONNAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '????????????',
  `RISKCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INHOSPITALDAYS` decimal(4, 0) NULL DEFAULT NULL COMMENT '????????',
  `HOSPITALBED` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INHOSPITALDATE` datetime(0) NULL DEFAULT NULL COMMENT '????????',
  `OUTHOSPITALDATE` datetime(0) NULL DEFAULT NULL COMMENT '????????',
  `HOSPITALPROVINCE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '??????????',
  `HOSPITALCITY` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '??????????',
  `HOSPITALCODE` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '????????',
  `HOSPITALNAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '????????',
  `HOSPITALGRADE` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '????????',
  `ISRELATIVEHOSPITAL` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MAINPHYSICIAN` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MAINPHYSICIANPHONE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ADMINOFFICE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ISTRANSFERS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MAJORDIAGNOSIS` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `HOSPITALCOURSE` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REMARK` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VALIDFLAG` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '????????',
  `FLAG` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '????',
  `CREATEUSER` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '??????',
  `CREATETIME` datetime(0) NULL DEFAULT NULL COMMENT '????????',
  `UPDATEUSER` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '??????',
  `UPDATETIME` datetime(0) NULL DEFAULT NULL COMMENT '????????',
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '????????',
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL COMMENT '????????',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '??????????' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prpldlosspersinjured
-- ----------------------------
DROP TABLE IF EXISTS `prpldlosspersinjured`;
CREATE TABLE `prpldlosspersinjured`  (
  `ID` decimal(16, 0) NOT NULL COMMENT '主键',
  `REGISTNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PERSTRACEMAINID` decimal(16, 0) NULL DEFAULT NULL,
  `RISKCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PERSONNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TRACEREQUIRED` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `CERTITYPE` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CERTICODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PHONENUMBER` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PERSONAGE` decimal(4, 0) NULL DEFAULT NULL,
  `PERSONSEX` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `WORKUNIT` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `WORKCOMMENT` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DOMICILEPLACECODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DOMICILEPLACE` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PAMANENTADDRESSCODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PAMANENTADDRESS` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `WORKADDRESS` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ACCREDITATIONNAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DISABLEDDEGREE` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REFERENCESTANDARD` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEMAGECODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DISABLEDSITUATION` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TRACEFEEDBACK` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TICCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TICNAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INCOME` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DOMICILE` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SUMREPORTFEE` decimal(14, 2) NULL DEFAULT NULL,
  `SUMREALFEE` decimal(14, 2) NULL DEFAULT NULL,
  `SUMDETRACTIONFEE` decimal(14, 2) NULL DEFAULT NULL,
  `SUMDEFLOSS` decimal(14, 2) NULL DEFAULT NULL,
  `SUMVERIREPORTFEE` decimal(14, 2) NULL DEFAULT NULL,
  `SUMVERIREALFEE` decimal(14, 2) NULL DEFAULT NULL,
  `SUMVERIDETRACTIONFEE` decimal(14, 2) NULL DEFAULT NULL,
  `SUMVERIDEFLOSS` decimal(14, 2) NULL DEFAULT NULL,
  `CURRENCY` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INJURYPART` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VALIDFLAG` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATEUSER` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATETIME` datetime(0) NULL DEFAULT NULL,
  `UPDATEUSER` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UPDATETIME` datetime(0) NULL DEFAULT NULL,
  `CASETYPE` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CLASSCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UNDWRTVALIDFLAG` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SUMCLAIMDELOSS` decimal(14, 2) NULL DEFAULT NULL,
  `ISSIGN` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CONSCIOUS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `HIREDATE` datetime(0) NULL DEFAULT NULL,
  `DOMICILEAREA` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LIVEAREA` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MIAMITEM` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INDENTIFYWAY` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '受伤人员信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prpldlossperstracemain
-- ----------------------------
DROP TABLE IF EXISTS `prpldlossperstracemain`;
CREATE TABLE `prpldlossperstracemain`  (
  `ID` decimal(16, 0) NOT NULL,
  `POLICYNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REGISTNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RISKCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSUREDNAME` varchar(320) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TRACEPERSONCODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TRACEPERSON` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `NEARLYTRACETIME` datetime(0) NULL DEFAULT NULL,
  `UNDERWRITEDATE` datetime(0) NULL DEFAULT NULL,
  `UNDERWRITEFLAG` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UNDERWRITECODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UNDERWRITENAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UNDERWRITEENDDATE` datetime(0) NULL DEFAULT NULL,
  `VALIDFLAG` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATEUSER` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATETIME` datetime(0) NULL DEFAULT NULL,
  `UPDATEUSER` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UPDATETIME` datetime(0) NULL DEFAULT NULL,
  `ISSURVEY` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SURVEYINFO` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `LAUNCHSURVEY` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `TASKID` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CLASSCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prpldlosspropfee
-- ----------------------------
DROP TABLE IF EXISTS `prpldlosspropfee`;
CREATE TABLE `prpldlosspropfee`  (
  `LOSSITEMNAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LOSSSPECIESCODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LOSSSPECIESNAME` varchar(320) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FEETYPECODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FEETYPENAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LOSSQUANTITY` decimal(14, 2) NULL DEFAULT NULL,
  `UNITPRICE` decimal(14, 2) NULL DEFAULT NULL,
  `RECYCLEFLAG` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RECYCLEPRICE` decimal(14, 2) NULL DEFAULT NULL,
  `SUMDEFLOSS` decimal(14, 3) NULL DEFAULT NULL,
  `VERILOSSQUANTITY` decimal(14, 2) NULL DEFAULT NULL,
  `VERIUNITPRICE` decimal(14, 2) NULL DEFAULT NULL,
  `VERIRECYLEPRICE` decimal(14, 2) NULL DEFAULT NULL,
  `SUMVERILOSS` decimal(14, 2) NULL DEFAULT NULL,
  `ID` decimal(16, 0) NOT NULL,
  `PRPLPROPMAINID` decimal(16, 0) NOT NULL,
  `REGISTNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RISKCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VALIDFLAG` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATEUSER` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATETIME` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATEUSER` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UPDATETIME` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `UNITNAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MODELCODE` decimal(8, 0) NULL DEFAULT NULL,
  `MODELNAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UNITCODE` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CURRENCY` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL,
  `DEPRERATE` decimal(8, 2) NULL DEFAULT NULL,
  `LOSSLEVEL` decimal(8, 2) NULL DEFAULT NULL,
  `ITEMVALUE` decimal(14, 2) NULL DEFAULT NULL,
  `REMARK` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `IDX_PRPLDLOSSPROPFEE_REGISTNO`(`REGISTNO`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prpldlosspropmain
-- ----------------------------
DROP TABLE IF EXISTS `prpldlosspropmain`;
CREATE TABLE `prpldlosspropmain`  (
  `ID` decimal(16, 0) NOT NULL,
  `REGISTNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MERCYFLAG` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LOSSTYPE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INTERMEDIARYFLAG` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `HANDLERNAME` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `HANDLERIDCARD` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEFLOSSDATE` datetime(0) NULL DEFAULT NULL,
  `SUMDEFLOSS` decimal(14, 2) NULL DEFAULT NULL,
  `SUMLOSSFEE` decimal(14, 2) NULL DEFAULT NULL,
  `DEFRESCUEFEE` decimal(14, 2) NULL DEFAULT NULL,
  `DEFRESCUEREMARK` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UNDERWRITENAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UNDERWRITEIDCARD` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SUMVERILOSS` decimal(14, 2) NULL DEFAULT NULL,
  `SUMVERIFEE` decimal(14, 2) NULL DEFAULT NULL,
  `VERIRESCUEFEE` decimal(14, 2) NULL DEFAULT NULL,
  `VERIRESCUEOPINION` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UNDERWRITEDETAIL` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SCHEDULEDEFLOSSID` decimal(16, 0) NULL DEFAULT NULL,
  `INTERMEDIARYINFOID` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CHECKPROPID` decimal(16, 0) NULL DEFAULT NULL,
  `HANDLERCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RISKCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RELOSSPROPID` decimal(16, 0) NULL DEFAULT NULL,
  `DEFLOSSSOURCEFLAG` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CASETASKFLAG` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UNDERWRITECODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UNDERWRITECOM` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UNDERWRITEENDDATE` datetime(0) NULL DEFAULT NULL,
  `UNDERWRITEFLAG` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `COMCODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MAKECOM` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LOSSSTATE` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VALIDFLAG` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FLAG` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REMARK` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATEUSER` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATETIME` datetime(0) NULL DEFAULT NULL,
  `UPDATEUSER` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UPDATETIME` datetime(0) NULL DEFAULT NULL,
  `CLAIMTYPE` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LICENSE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AUDITSTATUS` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FRAMENO` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEFENDDATE` datetime(0) NULL DEFAULT NULL,
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `IDX_PRPLDLOSSPROPMAIN_REGISTNO`(`REGISTNO`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prpldoccollectguide
-- ----------------------------
DROP TABLE IF EXISTS `prpldoccollectguide`;
CREATE TABLE `prpldoccollectguide`  (
  `ID` decimal(16, 0) NOT NULL,
  `REGISTNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `POLICYNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RISKCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DOCCODE` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `DOCNAME` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PICCOUNT` decimal(8, 0) NULL DEFAULT NULL,
  `ENDDATE` datetime(0) NULL DEFAULT NULL,
  `PROVIDEIND` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `COLLECTIND` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OPERATORCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OPERATEDATE` datetime(0) NULL DEFAULT NULL,
  `COMCODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MAKECOM` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VALIDFLAG` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REMARK` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OTHERCONTENT` varchar(600) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `IDX_PRPLDOCCOLLECTGUIDE_PNO`(`POLICYNO`) USING BTREE,
  INDEX `IDX_PRPLDOCCOLLECTGUIDE_RNO`(`REGISTNO`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prplendcase
-- ----------------------------
DROP TABLE IF EXISTS `prplendcase`;
CREATE TABLE `prplendcase`  (
  `ID` decimal(16, 0) NOT NULL,
  `REGISTNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CLAIMNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `POLICYNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `COMPENSATENO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ENDCASETYPE` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REGRESSNO` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ENDCASENO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RISKCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ISAUTOENDCASE` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ENDCASEDATE` datetime(0) NULL DEFAULT NULL,
  `VALIDFLAG` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REMARK` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FLAG` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATEUSER` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATETIME` datetime(0) NULL DEFAULT NULL,
  `UPDATEUSER` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UPDATETIME` datetime(0) NULL DEFAULT NULL,
  `MAKECOM` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `COMCODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OPERATORCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `HANDLERCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `IDX_PRPLENDCASE_CLAIMNO`(`CLAIMNO`) USING BTREE,
  INDEX `IDX_PRPLENDCASE_COMPENSATENO`(`COMPENSATENO`) USING BTREE,
  INDEX `IDX_PRPLENDCASE_POLICYNO`(`POLICYNO`) USING BTREE,
  INDEX `IDX_PRPLENDCASE_REGISTNO`(`REGISTNO`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prplfiletypeset
-- ----------------------------
DROP TABLE IF EXISTS `prplfiletypeset`;
CREATE TABLE `prplfiletypeset`  (
  `FILETYPECODE` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `FILETYPENAME` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CLASSCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VALIDDATE` datetime(0) NULL DEFAULT NULL,
  `OPERATORCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OPERATORNAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INPUTTIME` datetime(0) NULL DEFAULT NULL,
  `UPPERTYPECODE` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FLAG` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`FILETYPECODE`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prplhistorypayperson
-- ----------------------------
DROP TABLE IF EXISTS `prplhistorypayperson`;
CREATE TABLE `prplhistorypayperson`  (
  `PAYEENAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CERTIFYTYPE` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CERTIFYNO` varchar(22) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PAYEEMOBILE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PAYOBJECTTYPE` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PAYOBJECTKIND` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BANKNAME` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BANKOUTLETS` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BANKTYPE` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ACCOUNTNO` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PROVINCECODE` decimal(10, 0) NULL DEFAULT NULL,
  `PROVINCE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CITYCODE` decimal(10, 0) NULL DEFAULT NULL,
  `CITY` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BANKADRESSCODE` decimal(20, 0) NULL DEFAULT NULL,
  `BANKADRESS` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BANKNO` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PRIORITYFLAG` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PURPOSE` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CURRENCY` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL,
  `BIRTHDAY` date NULL DEFAULT NULL,
  `BUYERCODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BUYERNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REMARK` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prplinjuredpart
-- ----------------------------
DROP TABLE IF EXISTS `prplinjuredpart`;
CREATE TABLE `prplinjuredpart`  (
  `ID` decimal(16, 0) NOT NULL,
  `INJUREDID` decimal(16, 0) NULL DEFAULT NULL,
  `INJUREDPARTCODE` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INJUREDPARTNAME` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INJUREDDIAGNOSISCODE` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INJUREDDIAGNOSISNAME` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TREATMENT` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TREATWAY` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SPECIFICDIAGNOSIS` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATEUSER` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATETIME` datetime(0) NULL DEFAULT NULL,
  `UPDATEUSER` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UPDATETIME` datetime(0) NULL DEFAULT NULL,
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `IDX_PRPLINJUREDPART_INJUREDID`(`INJUREDID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prplintegritytask
-- ----------------------------
DROP TABLE IF EXISTS `prplintegritytask`;
CREATE TABLE `prplintegritytask`  (
  `ID` decimal(16, 0) NOT NULL,
  `REGISTNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TASKTYPE` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SUBTASK` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `STATUS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TASKPARAMS` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `STARTDATE` datetime(0) NULL DEFAULT NULL,
  `ENDDATE` datetime(0) NULL DEFAULT NULL,
  `LASTDATE` datetime(0) NULL DEFAULT NULL,
  `REMARK` varchar(3000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VERSION` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REDOTIMES` int(11) NULL DEFAULT NULL,
  `jsonMessage` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `IDX_PRPLINTEGRITYTASK_REDOS`(`REDOTIMES`) USING BTREE,
  INDEX `IDX_PRPLINTEGRITYTASK_REGISTNO`(`REGISTNO`) USING BTREE,
  INDEX `IDX_PRPLINTEGRITYTASK_STATUS`(`STATUS`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prplinvoice
-- ----------------------------
DROP TABLE IF EXISTS `prplinvoice`;
CREATE TABLE `prplinvoice`  (
  `id` decimal(16, 0) NOT NULL COMMENT 'id',
  `taxpayerId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '销售方识别码',
  `taxpayerName` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '销售方名称',
  `comCode` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '购买方机构代码',
  `comName` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '购买方名称',
  `invoiceCode` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发票代码',
  `invoiceType` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发票类型',
  `invoiceNo` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发票号码',
  `invoiceDate` datetime(0) NULL DEFAULT NULL COMMENT '开票日期',
  `sumAmount` decimal(14, 2) NULL DEFAULT NULL COMMENT '发票总金额',
  `priceAmount` decimal(14, 2) NULL DEFAULT NULL COMMENT '发票价额',
  `taxAmount` decimal(14, 2) NULL DEFAULT NULL COMMENT '税额',
  `taxRate` decimal(14, 2) NULL DEFAULT NULL COMMENT '税率',
  `remark` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `validFlag` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发票有效状态',
  `operatorCode` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作人',
  `insertTimeForHis` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `operateTimeForHis` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prplinvoicerel
-- ----------------------------
DROP TABLE IF EXISTS `prplinvoicerel`;
CREATE TABLE `prplinvoicerel`  (
  `id` decimal(16, 0) NOT NULL COMMENT '主键',
  `payDetailId` decimal(16, 0) NOT NULL COMMENT '金额拆分信息表主键',
  `invoiceId` decimal(16, 0) NOT NULL COMMENT '发票主表id',
  `registNo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '报案号',
  `claimNo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '立案号',
  `compensateNo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '计算书号',
  `invoiceRelDate` datetime(0) NULL DEFAULT NULL COMMENT '发票关联时间',
  `deduction` decimal(14, 2) NULL DEFAULT NULL COMMENT '抵扣金额',
  `surplusDeduction` decimal(14, 2) NULL DEFAULT NULL COMMENT '剩余抵扣金额',
  `splitTaxAmount` decimal(14, 2) NULL DEFAULT NULL COMMENT '拆分增值税发票分摊税额',
  `splitPriceAmount` decimal(14, 2) NULL DEFAULT NULL COMMENT '拆分增值税发票分摊价额',
  `tailDifference` decimal(14, 2) NULL DEFAULT NULL COMMENT '拆分增值税发票分摊尾差',
  `insertTimeForHis` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `operateTimeForHis` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `PRPLINVOICEREL_PAYDETAILID`(`payDetailId`) USING BTREE,
  INDEX `PRPLINVOICEREL_INVOICEID`(`invoiceId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prplkeycontrol
-- ----------------------------
DROP TABLE IF EXISTS `prplkeycontrol`;
CREATE TABLE `prplkeycontrol`  (
  `ID` decimal(16, 0) NOT NULL,
  `REGISTNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `STATUS` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CONTENT` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `INPUTTIME` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `LASTHANDERCODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LASTMODIFYDATE` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `COMCODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MAKECOM` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OPERATORCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OPERATORNAME` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VALIDFLAG` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REMARK` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FLAG` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `IDX_PRPLKEYCONTROL_REGISTNO`(`REGISTNO`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prplknowledgebase
-- ----------------------------
DROP TABLE IF EXISTS `prplknowledgebase`;
CREATE TABLE `prplknowledgebase`  (
  `ID` decimal(16, 0) NOT NULL,
  `CATEGORYCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SUBCATEGORYCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TITLE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `KEYWORDS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SUMMARY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CONTENT` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `RECOMMENDATIONLEVEL` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OPERATORCODE` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OPERATORNAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `COMCODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATETIME` datetime(0) NULL DEFAULT NULL,
  `MODIFYCODE` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MODIFYTIME` datetime(0) NULL DEFAULT NULL,
  `REMARK` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `STATUS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VALIDFLAG` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FLAG` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `IDX_PRPLKLG_CATEGORYCODE`(`CATEGORYCODE`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prplknowledgebasecomment
-- ----------------------------
DROP TABLE IF EXISTS `prplknowledgebasecomment`;
CREATE TABLE `prplknowledgebasecomment`  (
  `ID` decimal(16, 0) NOT NULL,
  `MAINID` decimal(16, 0) NULL DEFAULT NULL,
  `CONTENT` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `OPERATORCODE` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OPERATORNAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `COMCODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATETIME` datetime(0) NULL DEFAULT NULL,
  `MODIFYCODE` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MODIFYTIME` datetime(0) NULL DEFAULT NULL,
  `REMARK` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `STATUS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VALIDFLAG` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FLAG` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `IDX_PRPLKLGCOMMENT_MAINID`(`MAINID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prplknowledgebaseenclosure
-- ----------------------------
DROP TABLE IF EXISTS `prplknowledgebaseenclosure`;
CREATE TABLE `prplknowledgebaseenclosure`  (
  `ID` decimal(16, 0) NOT NULL,
  `MAINID` decimal(16, 0) NULL DEFAULT NULL,
  `SERIALNO` int(11) NULL DEFAULT NULL,
  `FILENAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SYSFILENAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TYPECODE` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FILEPATH` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FILEDESC` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SITECODE` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FILEADDRESS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SERVICENAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FILESIZE` decimal(8, 0) NULL DEFAULT NULL,
  `INPUTTIME` datetime(0) NULL DEFAULT NULL,
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `IDX_KLGCLOSURE_MAINID`(`MAINID`) USING BTREE,
  INDEX `IDX_PRPLKLGCU_SERIALNO`(`SERIALNO`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prplknowledgebasekeyword
-- ----------------------------
DROP TABLE IF EXISTS `prplknowledgebasekeyword`;
CREATE TABLE `prplknowledgebasekeyword`  (
  `ID` decimal(16, 0) NOT NULL,
  `MAINID` decimal(16, 0) NULL DEFAULT NULL,
  `KEYWORDNAME` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `IDX_PRPLKWGWORD_MAINID`(`MAINID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prpllawsuit
-- ----------------------------
DROP TABLE IF EXISTS `prpllawsuit`;
CREATE TABLE `prpllawsuit`  (
  `ID` decimal(8, 0) NOT NULL,
  `LAWSUITNO` varchar(22) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REGISTNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `POLICYNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CAUSENO` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '诉讼案由 存编号',
  `ACCUSER` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '原告人',
  `ACCUSERPHONENO` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '原告电话',
  `ACCUSERD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '被告',
  `ACCUSERDPHONENO` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '被告电话',
  `COURT` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '法院',
  `CASENO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '案号',
  `CASESTARTTIME` datetime(0) NULL DEFAULT NULL COMMENT '开始日期',
  `RECEIPTTIME` datetime(0) NULL DEFAULT NULL COMMENT '传票接收日期',
  `JUDGETIME` datetime(0) NULL DEFAULT NULL COMMENT '接收判决书日期',
  `CASEMONEY` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '诉讼仲裁请求金额',
  `NEWCASEMONEY` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新的诉讼金额',
  `LAWYERMONEY` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '律师扣前金额',
  `GRANTMONEY` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '我方授权扣前金额',
  `ENDMONEY` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '最终扣前金额',
  `SENTENCEMONEY` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '裁决判决我方赔偿金额',
  `WANTMONEY` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '对方索偿法律费用',
  `PAYMONEY` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '我方赔偿法律费用',
  `COURTSTARTTIME` datetime(0) NULL DEFAULT NULL COMMENT '庭审开始时间',
  `COURTENDTIME` datetime(0) NULL DEFAULT NULL COMMENT '庭审终止日期',
  `COURTER` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '庭审法官',
  `COURTPHONENO` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '法官电话',
  `WRITTER` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '书记员',
  `COURTERRESULT` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '庭审结果',
  `COURTFLAG` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否和解',
  `UPCOURTFLAG` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否上诉',
  `ENDFLAG` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否已经结束',
  `REASON` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '胜诉或败诉原因',
  `TIMES` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '1一审 2二审 3再审',
  `INSERTTIME` datetime(0) NULL DEFAULT NULL COMMENT '插入时间',
  `UPDATETIME` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `OPTCODE` varchar(22) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作人',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '诉讼记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prplloginfo
-- ----------------------------
DROP TABLE IF EXISTS `prplloginfo`;
CREATE TABLE `prplloginfo`  (
  `ID` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `REQUESTINFO` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RESPONSEINFO` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LOGTYPE` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ISDONE` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PAYNO` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REGISTNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `POLICYNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CLAIMNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `COMPENSATENO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CASENO` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OPERATORCODE` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UPDATETIME` datetime(0) NULL DEFAULT NULL,
  `CREATEDATE` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL,
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `IDX_PRPLLOGINFO_CASENO`(`CASENO`) USING BTREE,
  INDEX `IDX_PRPLLOGINFO_CLAIMNO`(`CLAIMNO`) USING BTREE,
  INDEX `IDX_PRPLLOGINFO_COMPENSATENO`(`COMPENSATENO`) USING BTREE,
  INDEX `IDX_PRPLLOGINFO_PAYNO`(`PAYNO`) USING BTREE,
  INDEX `IDX_PRPLLOGINFO_POLICYNO`(`POLICYNO`) USING BTREE,
  INDEX `IDX_PRPLLOGINFO_REGISTNO`(`REGISTNO`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prpllosshealth
-- ----------------------------
DROP TABLE IF EXISTS `prpllosshealth`;
CREATE TABLE `prpllosshealth`  (
  `Id` decimal(16, 0) NOT NULL,
  `CompensateNo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `PolicyNo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `RegistNo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `RiskCode` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ClauseCode` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ClauseName` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `KindCode` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `KindName` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ItemKindNo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LossFeeType` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CurrencyA` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Amount` decimal(14, 2) NULL DEFAULT NULL,
  `AmountRemain` decimal(14, 2) NULL DEFAULT NULL,
  `DutyStartDate` datetime(0) NULL DEFAULT NULL,
  `DutyEndDate` datetime(0) NULL DEFAULT NULL,
  `DeductAmt` decimal(14, 2) NULL DEFAULT NULL,
  `DeductRate` decimal(14, 2) NULL DEFAULT NULL,
  `AmountPerDay` decimal(14, 2) NULL DEFAULT NULL,
  `DeductDays` int(11) NULL DEFAULT NULL,
  `CurrencyL` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SumLossL` decimal(14, 2) NULL DEFAULT NULL,
  `CurrencyP` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SumLoss` decimal(14, 4) NULL DEFAULT NULL,
  `PayRate` decimal(8, 4) NULL DEFAULT NULL,
  `InHospitalDays` decimal(8, 2) NULL DEFAULT NULL,
  `IdentifyLevel` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Formula` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ExchRateL` decimal(8, 4) NULL DEFAULT NULL,
  `SumCalcPay` decimal(14, 2) NULL DEFAULT NULL,
  `SumRealPay` decimal(14, 2) NULL DEFAULT NULL,
  `SumRealPayCny` decimal(14, 2) NULL DEFAULT NULL,
  `SumRealPayA` decimal(14, 2) NULL DEFAULT NULL,
  `ExcessAmountFlag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CreateUser` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OperatorCode` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `InsertTimeForHis` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OperateTimeForHis` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prpllosshealthgetduty
-- ----------------------------
DROP TABLE IF EXISTS `prpllosshealthgetduty`;
CREATE TABLE `prpllosshealthgetduty`  (
  `Id` decimal(16, 0) NOT NULL,
  `LossHealthId` decimal(16, 0) NULL DEFAULT NULL,
  `ClauseCode` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ClauseName` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `KindCode` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `KindName` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ItemKindNo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `GetDutyCode` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TreatmentMode` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `NationFlag` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CurrencyL` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SumBillFee` decimal(14, 2) NULL DEFAULT NULL,
  `SocialInsPay` decimal(14, 2) NULL DEFAULT NULL,
  `ExtraPay` decimal(14, 2) NULL DEFAULT NULL,
  `OwnPay` decimal(14, 2) NULL DEFAULT NULL,
  `OwnExpense` decimal(14, 2) NULL DEFAULT NULL,
  `RejectFee` decimal(14, 2) NULL DEFAULT NULL,
  `ThirdPartyPay` decimal(14, 2) NULL DEFAULT NULL,
  `CurrencyA` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Amount` decimal(14, 2) NULL DEFAULT NULL,
  `AmountRemain` decimal(14, 2) NULL DEFAULT NULL,
  `DeductAmt` decimal(14, 2) NULL DEFAULT NULL,
  `PayRate` decimal(8, 4) NULL DEFAULT NULL,
  `ExchRateL` decimal(8, 4) NULL DEFAULT NULL,
  `CurrencyP` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SumLoss` decimal(14, 4) NULL DEFAULT NULL,
  `SumCalcPay` decimal(14, 2) NULL DEFAULT NULL,
  `SumRealPay` decimal(14, 2) NULL DEFAULT NULL,
  `SumRealPayA` decimal(14, 2) NULL DEFAULT NULL,
  `CreateUser` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OperateUser` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `InsertTimeForHis` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OperateTimeForHis` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prpllosshealthgetdutybill
-- ----------------------------
DROP TABLE IF EXISTS `prpllosshealthgetdutybill`;
CREATE TABLE `prpllosshealthgetdutybill`  (
  `Id` decimal(16, 0) NOT NULL,
  `CompensateNo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `PolicyNo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `RegistNo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `LossHealthGetDutyId` decimal(16, 0) NOT NULL,
  `DflossPersBillId` decimal(16, 0) NOT NULL,
  `CreateUser` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OperatorCode` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `InsertTimeForHis` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OperateTimeForHis` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prpllosshealthgetdutydetail
-- ----------------------------
DROP TABLE IF EXISTS `prpllosshealthgetdutydetail`;
CREATE TABLE `prpllosshealthgetdutydetail`  (
  `Id` decimal(16, 0) NOT NULL,
  `LossHealthGetDutyId` decimal(16, 0) NULL DEFAULT NULL,
  `MedicineType` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CurrencyL` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SumBillFee` decimal(14, 2) NULL DEFAULT NULL,
  `OwnPay` decimal(14, 2) NULL DEFAULT NULL,
  `OwnExpense` decimal(14, 2) NULL DEFAULT NULL,
  `CurrencyA` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Amount` decimal(14, 2) NULL DEFAULT NULL,
  `ExchRateL` decimal(8, 4) NULL DEFAULT NULL,
  `CurrencyP` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SumLoss` decimal(14, 4) NULL DEFAULT NULL,
  `SumCalcPay` decimal(14, 2) NULL DEFAULT NULL,
  `SumRealPay` decimal(14, 2) NULL DEFAULT NULL,
  `CreateUser` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OperateUser` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `InsertTimeForHis` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OperateTimeForHis` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prpllossperson
-- ----------------------------
DROP TABLE IF EXISTS `prpllossperson`;
CREATE TABLE `prpllossperson`  (
  `ID` decimal(16, 0) NOT NULL,
  `COMPENSATENO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `POLICYNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REGISTNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RISKCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DLOSSID` decimal(16, 0) NULL DEFAULT NULL,
  `PERSONID` decimal(16, 0) NULL DEFAULT NULL,
  `ITEMID` decimal(3, 0) NULL DEFAULT NULL,
  `ITEMNAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ITEMKINDNO` decimal(5, 0) NULL DEFAULT NULL,
  `KINDCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CLAUSECODE` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ITEMAMOUNT` decimal(14, 2) NULL DEFAULT NULL,
  `LOSSTYPE` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INJURYTYPE` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PERSONNAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PERSONAGE` decimal(5, 0) NULL DEFAULT NULL,
  `CERTITYPE` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CERTICODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PERSONSEX` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CURRENCY` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EXCHRATE` decimal(8, 2) NULL DEFAULT NULL,
  `SUMLOSS` decimal(14, 2) NULL DEFAULT NULL,
  `SUMREALPAY` decimal(14, 2) NULL DEFAULT NULL,
  `SUMOFFLOSS` decimal(14, 2) NULL DEFAULT NULL,
  `OFFPREAMT` decimal(14, 2) NULL DEFAULT NULL,
  `BZPAIDLOSS` decimal(14, 2) NULL DEFAULT NULL,
  `DUTYRATE` decimal(8, 4) NULL DEFAULT NULL,
  `CLAIMRATE` decimal(8, 4) NULL DEFAULT NULL,
  `DEDUCTDUTYRATE` decimal(8, 4) NULL DEFAULT NULL,
  `DEDUCTDUTYAMT` decimal(8, 4) NULL DEFAULT NULL,
  `DEDUCTABSRATE` decimal(8, 4) NULL DEFAULT NULL,
  `DEDUCTABSAMT` decimal(8, 4) NULL DEFAULT NULL,
  `DEDUCTADDRATE` decimal(8, 4) NULL DEFAULT NULL,
  `DEDUCTADDAMT` decimal(12, 2) NULL DEFAULT NULL,
  `DEDUCTOFFRATE` decimal(8, 4) NULL DEFAULT NULL,
  `DEDUCTOFFAMT` decimal(12, 2) NULL DEFAULT NULL,
  `DEDUCTAMOUT` decimal(14, 2) NULL DEFAULT NULL,
  `FLAG` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REMARK` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATETIME` datetime(0) NULL DEFAULT NULL,
  `UPDATETIME` datetime(0) NULL DEFAULT NULL,
  `OPPOLOSSID` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL,
  `REMANENTAMOUNT` decimal(14, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `IDX_PRPLLOSSPERSON_DLOSSID`(`DLOSSID`) USING BTREE,
  INDEX `IDX_PRPLLOSSPERSON_ITEMID`(`ITEMID`) USING BTREE,
  INDEX `IDX_PRPLLOSSPERSON_ITEMKINDNO`(`ITEMKINDNO`) USING BTREE,
  INDEX `IDX_PRPLLOSSPERSON_PERSONID`(`PERSONID`) USING BTREE,
  INDEX `IDX_PRPLLOSSPERSON_POLICYNO`(`POLICYNO`) USING BTREE,
  INDEX `IDX_PRPLLOSSPERSON_REGISTNO`(`REGISTNO`) USING BTREE,
  INDEX `IDX_PRPLPON_COMPENSATENO`(`COMPENSATENO`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prpllosspersonfee
-- ----------------------------
DROP TABLE IF EXISTS `prpllosspersonfee`;
CREATE TABLE `prpllosspersonfee`  (
  `ID` decimal(16, 0) NOT NULL,
  `COMPENSATENO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `POLICYNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LOSSPERSONID` decimal(16, 0) NULL DEFAULT NULL,
  `KINDCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LOSSTYPE` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LOSSITEMNO` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CHARGECODE` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CHARGENAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REALFEE` decimal(14, 2) NULL DEFAULT NULL,
  `FEEOFFLOSS` decimal(14, 2) NULL DEFAULT NULL,
  `ITEMAMOUNT` decimal(14, 2) NULL DEFAULT NULL,
  `THIRDFEE` decimal(14, 2) NULL DEFAULT NULL,
  `FEELOSS` decimal(14, 2) NULL DEFAULT NULL,
  `DEDUCTAMOUT` decimal(14, 2) NULL DEFAULT NULL,
  `CLAIMRATE` decimal(8, 4) NULL DEFAULT NULL,
  `FEEREALPAY` decimal(14, 2) NULL DEFAULT NULL,
  `OFFPREAMT` decimal(14, 2) NULL DEFAULT NULL,
  `BZPAIDLOSS` decimal(14, 2) NULL DEFAULT NULL,
  `FLAG` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REMARK` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSUREDRATE` decimal(8, 4) NULL DEFAULT NULL,
  `AMTPERDAY` decimal(14, 2) NULL DEFAULT NULL,
  `HOSDAYS` decimal(8, 2) NULL DEFAULT NULL,
  `DEDUCTDAYS` decimal(8, 2) NULL DEFAULT NULL,
  `MAIMLEVEL` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FORMULA` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `THIRDFEEDETAIL` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FEEOFFDETAIL` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `OPPOID` decimal(16, 0) NULL DEFAULT NULL,
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL,
  `CLAIMRATEINFO` varchar(3000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `IDX_PRPLLOSSPERSONFEE_CNO`(`COMPENSATENO`) USING BTREE,
  INDEX `IDX_PRPLLOSSPERSONFEE_LPID`(`LOSSPERSONID`) USING BTREE,
  INDEX `IDX_PRPLLOSSPERSONFEE_POLICYNO`(`POLICYNO`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prpllossprop
-- ----------------------------
DROP TABLE IF EXISTS `prpllossprop`;
CREATE TABLE `prpllossprop`  (
  `ID` decimal(16, 0) NOT NULL,
  `COMPENSATENO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `POLICYNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REGISTNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RISKCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PROPTYPE` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DLOSSID` decimal(16, 0) NULL DEFAULT NULL,
  `DLOSSCARINFOID` decimal(16, 0) NULL DEFAULT NULL,
  `ITEMID` decimal(4, 0) NULL DEFAULT NULL,
  `ITEMNAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ITEMKINDNO` decimal(5, 0) NULL DEFAULT NULL,
  `KINDCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CLAUSECODE` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEPRERATE` decimal(8, 4) NULL DEFAULT NULL,
  `ITEMAMOUNT` decimal(14, 2) NULL DEFAULT NULL,
  `ITEMVALUE` decimal(14, 2) NULL DEFAULT NULL,
  `CURRENCY` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EXCHRATE` decimal(8, 2) NULL DEFAULT NULL,
  `LOSSTYPE` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LOSSNAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LOSSQUANTITY` decimal(14, 2) NULL DEFAULT NULL,
  `UNIT` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UNITPRICE` decimal(14, 2) NULL DEFAULT NULL,
  `SUMLOSS` decimal(14, 2) NULL DEFAULT NULL,
  `SUMREALPAY` decimal(14, 2) NULL DEFAULT NULL,
  `SUMREST` decimal(14, 2) NULL DEFAULT NULL,
  `DUTYRATE` decimal(8, 4) NULL DEFAULT NULL,
  `CLAIMRATE` decimal(8, 4) NULL DEFAULT NULL,
  `BZPAIDRESCUEFEE` decimal(14, 2) NULL DEFAULT NULL,
  `BZPAIDLOSS` decimal(14, 2) NULL DEFAULT NULL,
  `OFFPREAMT` decimal(14, 2) NULL DEFAULT NULL,
  `SUMDEFLOSS` decimal(14, 2) NULL DEFAULT NULL,
  `DEDUCTABSRATE` decimal(8, 4) NULL DEFAULT NULL,
  `DEDUCTABSAMT` decimal(12, 2) NULL DEFAULT NULL,
  `DEDUCTADDRATE` decimal(8, 4) NULL DEFAULT NULL,
  `DEDUCTADDAMT` decimal(12, 2) NULL DEFAULT NULL,
  `OTHERDEDUCTAMT` decimal(14, 2) NULL DEFAULT NULL,
  `RESCUEFEE` decimal(14, 2) NULL DEFAULT NULL,
  `PAYFLAG` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FLAG` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REMARK` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATETIME` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATETIME` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `OPPOLOSSID` decimal(16, 0) NULL DEFAULT NULL,
  `INSUREDRATE` decimal(8, 0) NULL DEFAULT NULL,
  `DANGERNO` decimal(22, 0) NULL DEFAULT NULL,
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL,
  `RESIDUEAMOUNT` decimal(14, 2) NULL DEFAULT NULL,
  `REMANENTAMOUNT` decimal(14, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `IDX_PRPLLOSSPROP_COMPENSATENO`(`COMPENSATENO`) USING BTREE,
  INDEX `IDX_PRPLLOSSPROP_DLOSSID`(`DLOSSID`) USING BTREE,
  INDEX `IDX_PRPLLOSSPROP_ITEMKINDNO`(`ITEMKINDNO`) USING BTREE,
  INDEX `IDX_PRPLLOSSPROP_POLICYNO`(`POLICYNO`) USING BTREE,
  INDEX `IDX_PRPLLOSSPROP_REGISTNO`(`REGISTNO`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prpllosstravel
-- ----------------------------
DROP TABLE IF EXISTS `prpllosstravel`;
CREATE TABLE `prpllosstravel`  (
  `Id` decimal(16, 0) NOT NULL,
  `CompensateNo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `PolicyNo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ClauseCode` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ClauseName` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RegistNo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `RiskCode` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `KindCode` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `KindName` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ItemKindNo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LossFeeType` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CurrencyA` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Amount` decimal(14, 2) NULL DEFAULT NULL,
  `AmountRemain` decimal(14, 2) NULL DEFAULT NULL,
  `DutyStartDate` datetime(0) NULL DEFAULT NULL,
  `DutyEndDate` datetime(0) NULL DEFAULT NULL,
  `DeductAmt` decimal(14, 2) NULL DEFAULT NULL,
  `DeductRate` decimal(14, 2) NULL DEFAULT NULL,
  `PayRate` decimal(8, 4) NULL DEFAULT NULL,
  `DelayIntervalHours` int(11) NULL DEFAULT NULL,
  `DelayIntervalAmount` decimal(14, 2) NULL DEFAULT NULL,
  `PlanFlightNo` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PlanDepartureTime` datetime(0) NULL DEFAULT NULL,
  `PlanArrivalTime` datetime(0) NULL DEFAULT NULL,
  `ActualFlightNo` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ActualDepartureTime` datetime(0) NULL DEFAULT NULL,
  `ActualArrivalTime` datetime(0) NULL DEFAULT NULL,
  `FlightCancelFlag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FlightChangeFlag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SumDelayHours` int(11) NULL DEFAULT NULL,
  `CurrencyL` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VisaFeeL` decimal(14, 2) NULL DEFAULT NULL,
  `SumLossL` decimal(14, 2) NULL DEFAULT NULL,
  `ExchRateL` decimal(8, 4) NULL DEFAULT NULL,
  `CurrencyP` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SumLoss` decimal(14, 2) NULL DEFAULT NULL,
  `SumCalcPay` decimal(14, 2) NULL DEFAULT NULL,
  `SumRealPay` decimal(14, 2) NULL DEFAULT NULL,
  `SumRealPayCny` decimal(14, 2) NULL DEFAULT NULL,
  `SumRealPayA` decimal(14, 2) NULL DEFAULT NULL,
  `Remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CreateUser` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OperatorCode` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `InsertTimeForHis` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OperateTimeForHis` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prpllosstraveldetail
-- ----------------------------
DROP TABLE IF EXISTS `prpllosstraveldetail`;
CREATE TABLE `prpllosstraveldetail`  (
  `ID` decimal(16, 0) NOT NULL,
  `LossTravelId` decimal(16, 0) NOT NULL,
  `RegistNo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `LossFeeType` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LossItemName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CurrencyL` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LossQuantity` decimal(14, 2) NULL DEFAULT NULL,
  `UnitPrice` decimal(14, 2) NULL DEFAULT NULL,
  `SumDefLoss` decimal(14, 2) NULL DEFAULT NULL,
  `VeriLossQuantity` decimal(14, 2) NULL DEFAULT NULL,
  `VeriUnitPrice` decimal(14, 2) NULL DEFAULT NULL,
  `UnitName` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DepreRate` decimal(14, 2) NULL DEFAULT NULL,
  `LossLevel` decimal(14, 2) NULL DEFAULT NULL,
  `SumLossL` decimal(14, 2) NULL DEFAULT NULL,
  `VeriRecylePrice` decimal(14, 2) NULL DEFAULT NULL,
  `ExchRateL` decimal(8, 4) NULL DEFAULT NULL,
  `CurrencyP` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SumLoss` decimal(14, 2) NULL DEFAULT NULL,
  `Remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CreateUser` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OperatorCode` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `InsertTimeForHis` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OperateTimeForHis` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prplmedicalrecordtrace
-- ----------------------------
DROP TABLE IF EXISTS `prplmedicalrecordtrace`;
CREATE TABLE `prplmedicalrecordtrace`  (
  `ID` decimal(16, 0) NULL DEFAULT NULL,
  `REGISTNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INJUREDID` decimal(16, 0) NULL DEFAULT NULL,
  `TRACEDATE` datetime(0) NULL DEFAULT NULL,
  `CURRENCY` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PAYWAY` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INCURREDFEE` decimal(10, 2) NULL DEFAULT NULL,
  `REQUIREDFEE` decimal(10, 2) NULL DEFAULT NULL,
  `TREAMENTCONTENT` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TRACEPERSCODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TRACEPERSNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PAYPERSONTYPE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PAYPERSONNAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INPUTTIME` datetime(0) NULL DEFAULT NULL,
  `VALIDFLAG` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REMARK` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FLAG` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATEUSER` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATETIME` datetime(0) NULL DEFAULT NULL,
  `UPDATEUSER` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UPDATETIME` datetime(0) NULL DEFAULT NULL,
  `BODYSTATUS` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UNENDREASON` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prplpaycustom
-- ----------------------------
DROP TABLE IF EXISTS `prplpaycustom`;
CREATE TABLE `prplpaycustom`  (
  `ID` decimal(16, 0) NOT NULL,
  `REGISTNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CERTIFYTYPE` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CERTIFYNO` varchar(22) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PAYOBJECTTYPE` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PAYOBJECTKIND` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PAYEENAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PAYEEMOBILE` decimal(20, 0) NULL DEFAULT NULL,
  `BANKNAME` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BANKOUTLETS` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BANKTYPE` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ACCOUNTNO` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PROVINCECODE` decimal(10, 0) NULL DEFAULT NULL,
  `PROVINCE` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CITYCODE` decimal(10, 0) NULL DEFAULT NULL,
  `CITY` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BANKNO` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PRIORITYFLAG` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PURPOSE` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSURERELATION` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CERTIFYSTARTDATE` datetime(0) NULL DEFAULT NULL,
  `CERTIFYENDDATE` datetime(0) NULL DEFAULT NULL,
  `ADRESSTYPE` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ADRESS` varchar(22) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PERSONSEX` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `NATIONALITY` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PROFESSION` varchar(22) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TAXNO` varchar(22) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PERMITNO` varchar(22) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LEGALPERSON` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AUTHORITYNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AUTHORITYNO` varchar(22) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AUTHORITYVALIDDATE` datetime(0) NULL DEFAULT NULL,
  `AUTHORITYCERTIFYTYPE` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `COMPENSATEFLAG` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FEETYPE` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VALIDFLAG` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FLAG` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REMARK` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATEUSER` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATETIME` datetime(0) NULL DEFAULT NULL,
  `UPDATEUSER` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UPDATETIME` datetime(0) NULL DEFAULT NULL,
  `CURRENCY` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL,
  `PAYEEADDRESS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RECEIVINGBANKADDRESS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FOREIGNBANKUNIQUECODEONE` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FOREIGNBANKUNIQUECODETWO` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BIRTHDAY` date NULL DEFAULT NULL,
  `BUYERNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BUYERCODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `IDX_PRPLPAYCUSTOM_BANKNO`(`BANKNO`) USING BTREE,
  INDEX `IDX_PRPLPAYCUSTOM_CERTIFYNO`(`CERTIFYNO`) USING BTREE,
  INDEX `IDX_PRPLPAYCUSTOM_REGISTNO`(`REGISTNO`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prplpayeedetail
-- ----------------------------
DROP TABLE IF EXISTS `prplpayeedetail`;
CREATE TABLE `prplpayeedetail`  (
  `ID` decimal(16, 0) NOT NULL,
  `LOSSID` decimal(16, 0) NOT NULL,
  `lossItemType` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PAYEEID` decimal(16, 0) NOT NULL,
  `PAYEEFEE` decimal(14, 2) NULL DEFAULT NULL,
  `COMPENSATENO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `REMARK` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PREPAYFEE` decimal(14, 2) NULL DEFAULT NULL,
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`, `COMPENSATENO`, `LOSSID`, `PAYEEID`) USING BTREE,
  INDEX `IDX_PRPLPAYMENTEX_COMPENSATENO`(`COMPENSATENO`) USING BTREE,
  INDEX `IDX_PRPLPAYMENTEX_LOSSID`(`LOSSID`) USING BTREE,
  INDEX `IDX_PRPLPAYMENTEX_PAYEEID`(`PAYEEID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prplpayeeinfo
-- ----------------------------
DROP TABLE IF EXISTS `prplpayeeinfo`;
CREATE TABLE `prplpayeeinfo`  (
  `ID` decimal(16, 0) NOT NULL,
  `COMPENSATENO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PAYEEID` decimal(16, 0) NULL DEFAULT NULL,
  `OTHERFLAG` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `OTHERCAUSE` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SUMREALPAY` decimal(14, 2) NOT NULL,
  `PAYSTATUS` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SENDPAYSTATUS` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATETIME` datetime(0) NULL DEFAULT NULL,
  `UPDATETIME` datetime(0) NULL DEFAULT NULL,
  `REGISTNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LOGMESSAGE` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ERROEMESSAGE` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ACCOUNTNO` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REMARK` varchar(4000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PREPAYFEE` decimal(14, 2) NULL DEFAULT NULL,
  `PayNowFlag` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL,
  `SETTLENO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PAYMENT` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `batchNo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `IDX_PRPLPAYMENT_COMPENSATENO`(`COMPENSATENO`) USING BTREE,
  INDEX `IDX_PRPLPAYMENT_PAYEEID`(`PAYEEID`) USING BTREE,
  INDEX `IDX_PRPLPAYMENT_REGISTNO`(`REGISTNO`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prplpayperson
-- ----------------------------
DROP TABLE IF EXISTS `prplpayperson`;
CREATE TABLE `prplpayperson`  (
  `ID` decimal(16, 0) NOT NULL,
  `REGISTNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `POLICYNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CERTIFYTYPE` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CERTIFYNO` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PAYOBJECTTYPE` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PAYOBJECTKIND` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PAYEENAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PAYEEMOBILE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BANKNAME` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BANKOUTLETS` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BANKTYPE` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ACCOUNTNO` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PROVINCECODE` decimal(10, 0) NULL DEFAULT NULL,
  `PROVINCE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CITYCODE` decimal(10, 0) NULL DEFAULT NULL,
  `CITY` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BANKADRESSCODE` decimal(20, 0) NULL DEFAULT NULL,
  `BANKADRESS` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BANKNO` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PRIORITYFLAG` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PURPOSE` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `COMPENSATEFLAG` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FEETYPE` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CURRENCY` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VALIDFLAG` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FLAG` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REMARK` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATEUSER` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATETIME` datetime(0) NULL DEFAULT NULL,
  `UPDATEUSER` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UPDATETIME` datetime(0) NULL DEFAULT NULL,
  `INTFACCNO` varchar(22) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL,
  `PAYEEADDRESS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RECEIVINGBANKADDRESS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FOREIGNBANKUNIQUECODEONE` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FOREIGNBANKUNIQUECODETWO` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BIRTHDAY` date NULL DEFAULT NULL,
  `BUYERNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BUYERCODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OLDPAYEENAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `IDX_PRPLPAYEE_ACCOUNTNO`(`ACCOUNTNO`) USING BTREE,
  INDEX `IDX_PRPLPAYEE_BANKNO`(`BANKNO`) USING BTREE,
  INDEX `IDX_PRPLPAYEE_CERTIFYNO`(`CERTIFYNO`) USING BTREE,
  INDEX `IDX_PRPLPAYEE_PAYEEMOBILE`(`PAYEEMOBILE`) USING BTREE,
  INDEX `IDX_PRPLPAYEE_POLICYNO`(`POLICYNO`) USING BTREE,
  INDEX `IDX_PRPLPAYEE_REGISTNO`(`REGISTNO`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prplpcustomerinfo
-- ----------------------------
DROP TABLE IF EXISTS `prplpcustomerinfo`;
CREATE TABLE `prplpcustomerinfo`  (
  `ID` decimal(16, 0) NOT NULL,
  `REGISTNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PAYEEID` decimal(16, 0) NULL DEFAULT NULL,
  `INSUREDNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSUREDNATIONALITY` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSUREDOCCUPATION` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSUREDADDRESSTYPE` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSUREDADDRESS` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSUREDMOBILE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSUREDCERTIFYTYPE` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSUREDCERTIFYNO` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSUREDCERTIFYVALIDDATE` datetime(0) NULL DEFAULT NULL,
  `CREATEUSER` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATETIME` datetime(0) NULL DEFAULT NULL,
  `UPDATEUSER` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UPDATETIME` datetime(0) NULL DEFAULT NULL,
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `IDX_PRPLPCUSTOMERINFO_PAYEEID`(`PAYEEID`) USING BTREE,
  INDEX `IDX_PRPLPCUSTOMERINFO_REGISTNO`(`REGISTNO`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prplpersdlossexp
-- ----------------------------
DROP TABLE IF EXISTS `prplpersdlossexp`;
CREATE TABLE `prplpersdlossexp`  (
  `ID` decimal(16, 0) NOT NULL,
  `INJUREDID` decimal(16, 0) NULL DEFAULT NULL,
  `FEETYPECODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FEETYPENAME` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UNITAMOUNT` decimal(14, 2) NULL DEFAULT NULL,
  `QUANTITY` decimal(10, 0) NULL DEFAULT NULL,
  `DISABLEDGRADE` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DISABLEDPAYRATE` decimal(5, 2) NULL DEFAULT NULL,
  `ESTIMATELOSS` decimal(14, 2) NULL DEFAULT NULL,
  `VALIDFLAG` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REMARK` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CAREFEE` decimal(14, 2) NULL DEFAULT NULL,
  `PAYPERSDAY` decimal(14, 2) NULL DEFAULT NULL,
  `INHOSIPTALDAY` decimal(14, 2) NULL DEFAULT NULL,
  `OUTPAYDAY` decimal(14, 2) NULL DEFAULT NULL,
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prplpersondetail
-- ----------------------------
DROP TABLE IF EXISTS `prplpersondetail`;
CREATE TABLE `prplpersondetail`  (
  `ID` decimal(16, 0) NOT NULL,
  `SERIALNO` decimal(19, 0) NULL DEFAULT NULL,
  `REGISTNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CLAIMNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PERSONTYPE` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CLAIMNAME` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PHONENUMBER` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ANTTYPE` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RISKCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `POLICYNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PERSONNO` decimal(19, 0) NULL DEFAULT NULL,
  `PERSONNAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `IDENTIFYNUMBER` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AREACODE` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FIXEDINCOMEFLAG` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `JOBCODE` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `JOBNAME` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OCCUPATIONCODE` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OCCUPATIONNAME` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PERSONSEX` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PERSONAGE` decimal(19, 0) NULL DEFAULT NULL,
  `PERSONADDRESS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `POSTCODE` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MOBILE` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EMAIL` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UNIT` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UNITADDRESS` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UNITPOSTCODE` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CLAIMDAY` datetime(0) NULL DEFAULT NULL,
  `CURRENCY` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CLAIMFEE` decimal(14, 2) NULL DEFAULT NULL,
  `INPUTDATE` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATORCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MAKECOM` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REMARK` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FLAG` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `IDX_PRPLPERSONDETAIL_CLAIMNO`(`CLAIMNO`) USING BTREE,
  INDEX `IDX_PRPLPERSONDETAIL_PERSONNO`(`PERSONNO`) USING BTREE,
  INDEX `IDX_PRPLPERSONDETAIL_POLICYNO`(`POLICYNO`) USING BTREE,
  INDEX `IDX_PRPLPERSONDETAIL_REGISTNO`(`REGISTNO`) USING BTREE,
  INDEX `IDX_PRPLPERSONDETAIL_SERIALNO`(`SERIALNO`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prplprepay
-- ----------------------------
DROP TABLE IF EXISTS `prplprepay`;
CREATE TABLE `prplprepay`  (
  `ID` decimal(16, 0) NOT NULL,
  `COMPENSATENO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `POLICYNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RISKCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `KINDCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FEETYPE` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CHARGECODE` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CHARGENAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CURRENCY` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EXCHRATE` decimal(8, 2) NULL DEFAULT NULL,
  `INSUREDCODE` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSUREDNAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PAYAMT` decimal(14, 2) NULL DEFAULT NULL,
  `PAYCLAIMAMT` decimal(14, 2) NULL DEFAULT NULL,
  `PAYEENAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BANKNAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ACCOUNTNO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OTHERFLAG` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OTHERCAUSE` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RELATEID` decimal(16, 0) NULL DEFAULT NULL,
  `VALIDFLAG` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FLAG` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REMARK` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATETIME` datetime(0) NULL DEFAULT NULL,
  `UPDATETIME` datetime(0) NULL DEFAULT NULL,
  `itemid` decimal(19, 0) NULL DEFAULT NULL,
  `ITEMDETAIL` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL,
  `ENDCURRENCY` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EXCHANGERATE` decimal(14, 4) NULL DEFAULT NULL,
  `ENDPAYAMT` decimal(14, 2) NULL DEFAULT NULL,
  `REMANENTAMOUNT` decimal(14, 2) NULL DEFAULT NULL,
  `PRERATIO` decimal(14, 2) NULL DEFAULT NULL,
  `FEELOSS` decimal(14, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `IDX_PRPLPREPAY_COMPENSATENO`(`COMPENSATENO`) USING BTREE,
  INDEX `IDX_PRPLPREPAY_POLICYNO`(`POLICYNO`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prplpropmainext
-- ----------------------------
DROP TABLE IF EXISTS `prplpropmainext`;
CREATE TABLE `prplpropmainext`  (
  `ID` decimal(16, 0) NOT NULL,
  `CHECKTASKID` decimal(16, 0) NOT NULL,
  `REGISTNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RISKCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SHIPNAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SUMLOSS` decimal(14, 2) NULL DEFAULT NULL,
  `REPAIRFACTORYCODE` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REPAIRFACTORYNAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REPAIRSTARTDATE` datetime(0) NULL DEFAULT NULL,
  `REPAIRENDDATE` datetime(0) NULL DEFAULT NULL,
  `LOADING` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DISCHARGE` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DELIVER` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `WAYBILLNUMBER` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `NATIONFLAGEXT` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DAMAGEAREAEXT` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CHECKADDRESSEXT` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CONTEXTS` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `VALIDFLAG` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REMARK` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FLAG` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `IDX_PRPLPROPMAINEXT_CHECKTID`(`CHECKTASKID`) USING BTREE,
  INDEX `IDX_PRPLPROPMAINEXT_REGISTNO`(`REGISTNO`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prplrecase
-- ----------------------------
DROP TABLE IF EXISTS `prplrecase`;
CREATE TABLE `prplrecase`  (
  `ID` decimal(16, 0) NOT NULL,
  `REGISTNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CLAIMNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ENDCASENO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `COMPENSATENO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OPENREASONCODE` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OPENREASON` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OPENREASONDETAIL` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `ENDCASEHANDLERCODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ENDCASEDATE` datetime(0) NULL DEFAULT NULL,
  `OPENCASEUSERCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OPENCASEUSERNAME` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CHECKCASEUSERCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CHECKCASEUSERNAME` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OPENCASEDATE` datetime(0) NULL DEFAULT NULL,
  `DEALCASEDATE` datetime(0) NULL DEFAULT NULL,
  `STATUS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CHECKSTATUS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VALIDFLAG` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REMARK` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FLAG` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATEUSER` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATETIME` datetime(0) NULL DEFAULT NULL,
  `UPDATEUSER` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UPDATETIME` datetime(0) NULL DEFAULT NULL,
  `OPENCASEHANDLERCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OPENCASEHANDLERNAME` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PREHANDLERCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FEEDBACK` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `IDX_PRPLRECASE_CLAIMNO`(`CLAIMNO`) USING BTREE,
  INDEX `IDX_PRPLRECASE_COMPENSATENO`(`COMPENSATENO`) USING BTREE,
  INDEX `IDX_PRPLRECASE_ENDCASENO`(`ENDCASENO`) USING BTREE,
  INDEX `IDX_PRPLRECASE_REGISTNO`(`REGISTNO`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prplreclaim
-- ----------------------------
DROP TABLE IF EXISTS `prplreclaim`;
CREATE TABLE `prplreclaim`  (
  `ID` decimal(16, 0) NOT NULL,
  `REGISTNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `POLICYNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CLAIMNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `STATUS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSUREDNAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LOSSHANDLERNAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RECLAIMHANDLERNAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RECLAIMHANDLERTEL` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RECLAIMPLACE` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RECLAIMDATE` datetime(0) NULL DEFAULT NULL,
  `SUMLOSSFEE` decimal(14, 2) NULL DEFAULT NULL,
  `CURRENCY` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VALIDFLAG` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OPERATORCODE` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `OPERATORNAME` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MAKECOM` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `COMCODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL,
  `RECLAIMNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INVOICEFLAG` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1',
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `IDX_PRPLRECLAIM_CLAIMNO`(`CLAIMNO`) USING BTREE,
  INDEX `IDX_PRPLRECLAIM_POLICYNO`(`POLICYNO`) USING BTREE,
  INDEX `IDX_PRPLRECLAIM_REGISTNO`(`REGISTNO`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prplreclaimext
-- ----------------------------
DROP TABLE IF EXISTS `prplreclaimext`;
CREATE TABLE `prplreclaimext`  (
  `ID` decimal(16, 0) NOT NULL,
  `KINDCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `KINDNAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LOSSNAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LOSSCOUNT` decimal(8, 0) NULL DEFAULT NULL,
  `LOSSFEE` decimal(14, 2) NULL DEFAULT NULL,
  `CURRENCY` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LOSSHANDLEDATE` datetime(0) NULL DEFAULT NULL,
  `REMARK` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VALIDFLAG` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MAKECOM` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `COMCODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL,
  `RECLAIMGOODSNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BATCHNO` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ISBOOKED` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RECLAIMNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prplregist
-- ----------------------------
DROP TABLE IF EXISTS `prplregist`;
CREATE TABLE `prplregist`  (
  `REGISTNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `MainRegistNo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `POLICYNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TEMPREGISTNO` varchar(22) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '临时报案号',
  `TEMPREGISTFLAG` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否临时报案标志',
  `REPORTTIME` datetime(0) NULL DEFAULT NULL COMMENT '报案时间',
  `ConsultationTime` datetime(0) NULL DEFAULT NULL,
  `REPORTORNAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '报案人姓名',
  `REPORTORPHONE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '报案人电话',
  `ReportorEmail` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REPORTORIDFNO` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '报案人身份证号码',
  `LINKERNAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系人姓名',
  `LINKERPHONE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系人电话',
  `LinkerEmail` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REPORTORRELATION` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '报案人与被保险人关系',
  `FIRSTREGUSERCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '初登人员代码',
  `FIRSTREGCOMCODE` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '初登人员所属机构',
  `MERCYFLAG` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '案件紧急程度',
  `CALLID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '呼叫中心ID',
  `CUSTOMERLEVEL` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客户等级',
  `CANCELFLAG` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '注销/拒赔标志（1、正在注销中，2、已注销0、默认为0）',
  `CANCELTIME` datetime(0) NULL DEFAULT NULL COMMENT '注销/拒赔时间',
  `CANCELREASON` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '案件注销原因',
  `CANCELUSER` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '案件注销人',
  `CANCELREASONDETAIL` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '案件注销详细原因',
  `ISMAJORCASE` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否重大案件',
  `SUBMITSOURCE` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '案件提交来源',
  `QDCASETYPE` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CASEFLAG` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DOCCOLLREMARK` varchar(600) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VALIDFLAG` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FLAG` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REMARK` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MAKECOME` char(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `RISKCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `COMCODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OPERATORCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `HANDLERCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATETIME` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATETIME` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `SHDAMAGEAREACODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SHDAMAGEADDRESS` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CASENAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CLAIMANTAPPLYDATE` datetime(0) NULL DEFAULT NULL,
  `DOCUMENTINFORMDATE` datetime(0) NULL DEFAULT NULL,
  `REPORTTYPE` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL,
  `reportchannel` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CLAIMANT` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CLAIMANTPHONE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REPORTEMAIL` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `processFlag` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CERTIFYCOLLECTSTATE` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`REGISTNO`) USING BTREE,
  INDEX `IDX_PRPLREGIST_CANCELFLAG`(`CANCELFLAG`) USING BTREE,
  INDEX `IDX_PRPLREGIST_POLICYNO`(`POLICYNO`) USING BTREE,
  INDEX `IDX_PRPLREGIST_REPORTORNAME`(`REPORTORNAME`) USING BTREE,
  INDEX `IDX_PRPLREGIST_TEMPREGISTFLAG`(`TEMPREGISTFLAG`) USING BTREE,
  INDEX `IDX_PRPLREGIST_TEMPREGISTNO`(`TEMPREGISTNO`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '报案信息主表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prplregistdamage
-- ----------------------------
DROP TABLE IF EXISTS `prplregistdamage`;
CREATE TABLE `prplregistdamage`  (
  `REGISTNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `DAMAGETIME` datetime(0) NULL DEFAULT NULL,
  `DAMAGEREMARK` varchar(3000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DAMAGENAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEMAGEPHONE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ISDEAD` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DamageReasonType` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DAMAGECODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DamageResult` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DAMAGEAREACODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DAMAGEADDRESS` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DAMAGEMAPCODE` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ISOFFSITE` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LOSSPARTY` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ISPERSONLOSS` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ISPROPLOSS` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INJUREDCOUNT` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEATHCOUNT` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `HOSPITALCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `HOSPITALNAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PERSONCURRENCY` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PERSONDISCOUNT` decimal(14, 2) NULL DEFAULT NULL,
  `LOSSITEMNAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VisaApplyDate` date NULL DEFAULT NULL,
  `CURRENCY` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REPORTEDLOSS` decimal(14, 2) NULL DEFAULT NULL,
  `VALIDFLAG` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FLAG` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REMARK` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OPERATORCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATETIME` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `HANDLERCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UPDATETIME` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `DAMAGEAREA` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `NATIONFLAG` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FROMPLACE` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DESTINATION` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SHIPNAME` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CERTIFYTYPENAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CERTIFYNO` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL,
  `SERIALNO` decimal(15, 0) NULL DEFAULT NULL,
  `INSUREDCODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DISASTERCODE` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DISASTERNAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SECONDDISASTERCODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SECONDDISASTERNAME` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BuyerName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `STATESCODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `STATES` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CITYSCODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CITYS` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ACCIDENTNO` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AccidentSubject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MajorAccidentCode` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MajorAccidentName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`REGISTNO`) USING BTREE,
  INDEX `IDX_PRPLREGDEMAGE_DEMAGENAME`(`DAMAGENAME`) USING BTREE,
  INDEX `IDX_PRPLREGISTDEMAGE_CERTIFYNO`(`CERTIFYNO`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prplregistdamagebagdelay
-- ----------------------------
DROP TABLE IF EXISTS `prplregistdamagebagdelay`;
CREATE TABLE `prplregistdamagebagdelay`  (
  `RegistNo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `PlanPickupTime` datetime(0) NULL DEFAULT NULL,
  `ActualPickupTime` datetime(0) NULL DEFAULT NULL,
  `CreateUser` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OperateUser` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `InsertTimeForHis` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OperateTimeForHis` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`RegistNo`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prplregistdamageperson
-- ----------------------------
DROP TABLE IF EXISTS `prplregistdamageperson`;
CREATE TABLE `prplregistdamageperson`  (
  `RegistNo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CustomerId` varchar(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DamagePersonName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `IdentifyType` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `IdentifyNo` varchar(22) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DamagePersonAge` int(11) NULL DEFAULT NULL,
  `DamagePersonSex` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DamagePersonOccupation` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DamagePersonPhone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DamagePersonBirthday` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ReportorRelation` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CreateUser` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OperateUser` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `InsertTimeForHis` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OperateTimeForHis` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`RegistNo`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prplregistdamagetraveldelay
-- ----------------------------
DROP TABLE IF EXISTS `prplregistdamagetraveldelay`;
CREATE TABLE `prplregistdamagetraveldelay`  (
  `ID` decimal(16, 0) NOT NULL,
  `RegistNo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SerialNo` int(11) NULL DEFAULT NULL,
  `FlightCancelFlag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FlightChangeFlag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PlanFlightNo` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PlanDepartureAirport` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PlanArrivalAirport` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PlanDepartureTime` datetime(0) NULL DEFAULT NULL,
  `PlanArrivalTime` datetime(0) NULL DEFAULT NULL,
  `PlanActualDepartureTime` datetime(0) NULL DEFAULT NULL,
  `PlanActualArrivalTime` datetime(0) NULL DEFAULT NULL,
  `ActualFlightNo` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ActualDepartureAirport` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ActualArrivalAirport` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ActualDepartureTime` datetime(0) NULL DEFAULT NULL,
  `ActualArrivalTime` datetime(0) NULL DEFAULT NULL,
  `ActualPlanDepartureTime` datetime(0) NULL DEFAULT NULL,
  `ActualPlanArrivalTime` datetime(0) NULL DEFAULT NULL,
  `IdentifyType` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `IdentifyNo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ExistFlag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TicketNo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PassengerName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TicketStatus` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CreateUser` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OperateUser` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `InsertTimeForHis` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OperateTimeForHis` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prplregistfact
-- ----------------------------
DROP TABLE IF EXISTS `prplregistfact`;
CREATE TABLE `prplregistfact`  (
  `ID` decimal(16, 0) NOT NULL,
  `REGISTNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ADDOPERATORNAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ADDDATE` datetime(0) NULL DEFAULT NULL,
  `ADDTIME` char(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `COMCODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VALIDFLAG` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FLAG` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REMARK` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OPERATORCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATETIME` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `HANDLERCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UPDATETIME` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `CONTENT` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `IDX_PRPLREGISTFACT_REGISTNO`(`REGISTNO`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prplregistsummary
-- ----------------------------
DROP TABLE IF EXISTS `prplregistsummary`;
CREATE TABLE `prplregistsummary`  (
  `ID` decimal(16, 0) NOT NULL,
  `REGISTNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `POLICYNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CLASSCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RISKCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DAMAGEDATE` datetime(0) NULL DEFAULT NULL,
  `DAMAGEHOUR` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DAMAGEADDRESS` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REPORTDATE` datetime(0) NULL DEFAULT NULL,
  `OPERATORCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSUREDNAME` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CUSTOMERLEVEL` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `STARTDATE` datetime(0) NULL DEFAULT NULL,
  `ENDDATE` datetime(0) NULL DEFAULT NULL,
  `COMCODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEDUCTIBLE` decimal(14, 2) NULL DEFAULT NULL,
  `CREATETIME` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATETIME` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `VALIDFLAG` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SUMAMOUNT` decimal(14, 2) NULL DEFAULT NULL,
  `OPERATEDATE` datetime(0) NULL DEFAULT NULL,
  `AGENTNAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `IDX_PRPLREGISTSUMMARY_POLICYNO`(`POLICYNO`) USING BTREE,
  INDEX `IDX_PRPLREGISTSUMMARY_REGISTNO`(`REGISTNO`) USING BTREE,
  INDEX `IDX_REGISTSUMMARY_REPORTDATE`(`REPORTDATE`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prplregisttrack
-- ----------------------------
DROP TABLE IF EXISTS `prplregisttrack`;
CREATE TABLE `prplregisttrack`  (
  `ID` decimal(16, 0) NOT NULL,
  `REGISTNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MODIFYTIME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `MODIFYUSERCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `MODIFYUSERNAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `MODIFYITEM` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `BEFVALUE` varchar(3000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AFTVALUE` varchar(3000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MODIFYCOUNT` decimal(8, 0) NULL DEFAULT NULL,
  `COMCODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VALIDFLAG` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FLAG` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REMARK` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OPERATORCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATETIME` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `HANDLERCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UPDATETIME` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `IDX_PRPLREGISTTRACK_REGISTNO`(`REGISTNO`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prplreplevycharge
-- ----------------------------
DROP TABLE IF EXISTS `prplreplevycharge`;
CREATE TABLE `prplreplevycharge`  (
  `ID` decimal(16, 0) NOT NULL,
  `REPLEVYDETAILID` decimal(16, 0) NOT NULL,
  `REGISTNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CLAUSECODE` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `KINDCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CHARGETYPE` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PAYOBJECT` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CHARGEAREA` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CURRENCY` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CHARGEMONEY` decimal(14, 2) NULL DEFAULT NULL,
  `APPROVEFLAG` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATETIME` datetime(0) NULL DEFAULT NULL,
  `UPDATETIME` datetime(0) NULL DEFAULT NULL,
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `IDX_PRPLREPLEVYCHARGE_REGISTNO`(`REGISTNO`) USING BTREE,
  INDEX `FK_PRPLREPLEVYCHARGE_REPLEVYID`(`REPLEVYDETAILID`) USING BTREE,
  CONSTRAINT `FK_PRPLREPLEVYCHARGE_REPLEVYID` FOREIGN KEY (`REPLEVYDETAILID`) REFERENCES `prplreplevydetail` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prplreplevychargedetail
-- ----------------------------
DROP TABLE IF EXISTS `prplreplevychargedetail`;
CREATE TABLE `prplreplevychargedetail`  (
  `ID` decimal(16, 0) NOT NULL,
  `REPLEVYDETAILID` decimal(16, 0) NOT NULL,
  `USERNAME` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `GRADELEVEL` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `STARTDATE` datetime(0) NULL DEFAULT NULL,
  `ENDDATE` datetime(0) NULL DEFAULT NULL,
  `HOTELDAYS` decimal(8, 0) NULL DEFAULT NULL,
  `HOTELFEE` decimal(8, 2) NULL DEFAULT NULL,
  `TRANSFEE` decimal(8, 2) NULL DEFAULT NULL,
  `TOLLFEE` decimal(8, 2) NULL DEFAULT NULL,
  `MEALFEE` decimal(8, 2) NULL DEFAULT NULL,
  `ALLOWFEE` decimal(8, 2) NULL DEFAULT NULL,
  `CURRENCY` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `MAKECOM` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATETIME` datetime(0) NULL DEFAULT NULL,
  `OPERATETIME` datetime(0) NULL DEFAULT NULL,
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK_PRPLREPLEVYCHARGEDETAIL`(`REPLEVYDETAILID`) USING BTREE,
  CONSTRAINT `FK_PRPLREPLEVYCHARGEDETAIL` FOREIGN KEY (`REPLEVYDETAILID`) REFERENCES `prplreplevydetail` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prplreplevydetail
-- ----------------------------
DROP TABLE IF EXISTS `prplreplevydetail`;
CREATE TABLE `prplreplevydetail`  (
  `ID` decimal(16, 0) NOT NULL,
  `REPLEVYID` decimal(16, 0) NULL DEFAULT NULL,
  `REGISTNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CLAUSECODE` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `KINDCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REPLEVIEDPERSON` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REPLEVIEDMOBILE` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REPLEVIEDPHONE` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REPLEVIEDADDRESS` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REPLEVIEDPOSTCODE` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REPLEVIEDTAX` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REPLEVIEDEMAIL` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REPLEVYTYPE` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REPLEVYAGENCY` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REPLEVYPERSON` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REPLEVYDATE` datetime(0) NULL DEFAULT NULL,
  `REPLEVYHANDLEDATE` datetime(0) NULL DEFAULT NULL,
  `TRANSFERDATE` datetime(0) NULL DEFAULT NULL,
  `REPLEVYEFFECTDATE` datetime(0) NULL DEFAULT NULL,
  `REPLEVYWAY` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REPLEVYREASON` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REALREPLEVY` decimal(14, 2) NULL DEFAULT NULL,
  `REPLEVYFEE` decimal(14, 2) NULL DEFAULT NULL,
  `STATUS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPROVEFLAG` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATEUSER` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATETIME` datetime(0) NULL DEFAULT NULL,
  `UPDATEUSER` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UPDATETIME` datetime(0) NULL DEFAULT NULL,
  `CURRENCY` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REPLEVYPROGRESS` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `REPLEVIEDAREA` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REPLEVIEDAREACODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REPLEVYAPPROVEFLAG` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPROVEPERSON` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPROVEDATE` datetime(0) NULL DEFAULT NULL,
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `IDX_PRPLREPLEVYDETAIL_REGISTNO`(`REGISTNO`) USING BTREE,
  INDEX `FK_REPLEVYDETAIL_REPLEVYID`(`REPLEVYID`) USING BTREE,
  CONSTRAINT `FK_REPLEVYDETAIL_REPLEVYID` FOREIGN KEY (`REPLEVYID`) REFERENCES `prplreplevymain` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prplreplevyloss
-- ----------------------------
DROP TABLE IF EXISTS `prplreplevyloss`;
CREATE TABLE `prplreplevyloss`  (
  `ID` decimal(16, 0) NOT NULL,
  `REPLEVYDETAILID` decimal(16, 0) NOT NULL,
  `CLAUSECODE` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `KINDCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REPLEVIEDTYPE` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REPLEVIEDLOSS` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CURRENCY` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REPLEVIEDMONEY` decimal(14, 2) NULL DEFAULT NULL,
  `APPROVEFLAG` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATETIME` datetime(0) NULL DEFAULT NULL,
  `UPDATETIME` datetime(0) NULL DEFAULT NULL,
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK_PRPLREPLEVYLOSS_REPLEVYID`(`REPLEVYDETAILID`) USING BTREE,
  CONSTRAINT `FK_PRPLREPLEVYLOSS_REPLEVYID` FOREIGN KEY (`REPLEVYDETAILID`) REFERENCES `prplreplevydetail` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prplreplevymain
-- ----------------------------
DROP TABLE IF EXISTS `prplreplevymain`;
CREATE TABLE `prplreplevymain`  (
  `ID` decimal(16, 0) NOT NULL,
  `REGISTNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CLAIMNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `POLICYNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RISKCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REPLEVYCURRENCY` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SUMPLANREPLEVY` decimal(14, 2) NULL DEFAULT NULL,
  `SUMREALREPLEVY` decimal(14, 2) NULL DEFAULT NULL,
  `SUMREPLEVYFEE` decimal(14, 2) NULL DEFAULT NULL,
  `REPLEVYOPINION` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OPINIONTEXT` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REPLEVYFLAG` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REPLEVYTEXT` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CANCELDATE` datetime(0) NULL DEFAULT NULL,
  `CANCELREASON` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `STATUS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MAKECOM` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `COMCODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `HANDLERCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATEUSER` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATETIME` datetime(0) NULL DEFAULT NULL,
  `UPDATEUSER` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UPDATETIME` datetime(0) NULL DEFAULT NULL,
  `COMPENSATENO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPROVEFLAG` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `IDX_PRPLREPLEVYMAIN_CLAIMNO`(`CLAIMNO`) USING BTREE,
  INDEX `IDX_PRPLREPLEVYMAIN_POLICYNO`(`POLICYNO`) USING BTREE,
  INDEX `IDX_PRPLREPLEVYMAIN_REGISTNO`(`REGISTNO`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prplreplevysuggest
-- ----------------------------
DROP TABLE IF EXISTS `prplreplevysuggest`;
CREATE TABLE `prplreplevysuggest`  (
  `ID` decimal(16, 0) NOT NULL,
  `REGISTNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `NODETYPE` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OPERATORCODE` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OPERATORNAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MAKECOM` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SUGGESTTEXT` varchar(4000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATETIME` datetime(0) NULL DEFAULT NULL,
  `UPDATETIME` datetime(0) NULL DEFAULT NULL,
  `MESSAGETYPE` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `IDX_PRPLREPLEVYSUGGEST_REGNO`(`REGISTNO`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prplreplevytext
-- ----------------------------
DROP TABLE IF EXISTS `prplreplevytext`;
CREATE TABLE `prplreplevytext`  (
  `ID` decimal(16, 0) NOT NULL,
  `REPLEVYID` decimal(16, 0) NOT NULL,
  `REGISTNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REPLEVYROLE` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OPINIONTYPE` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OPERATORCODE` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OPERATORNAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MAKECOM` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPROVEOPINION` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `HANDLETEXT` varchar(1500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `HANDLEDATE` datetime(0) NULL DEFAULT NULL,
  `CREATETIME` datetime(0) NULL DEFAULT NULL,
  `UPDATETIME` datetime(0) NULL DEFAULT NULL,
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `IDX_PRPLREPLEVYTEXT_REGISTNO`(`REGISTNO`) USING BTREE,
  INDEX `FK_PRPLREPLEVYTEXT_REPLEVYID`(`REPLEVYID`) USING BTREE,
  CONSTRAINT `FK_PRPLREPLEVYTEXT_REPLEVYID` FOREIGN KEY (`REPLEVYID`) REFERENCES `prplreplevymain` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prplreturnticket
-- ----------------------------
DROP TABLE IF EXISTS `prplreturnticket`;
CREATE TABLE `prplreturnticket`  (
  `ID` decimal(16, 0) NOT NULL,
  `PAYEEID` decimal(16, 0) NOT NULL,
  `OLDPAYEEID` decimal(16, 0) NOT NULL,
  `PAYMENTID` decimal(16, 0) NOT NULL,
  `REGISTNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `POLICYNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BUSINESSNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OPERATORCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OPERATORNAME` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BUSSTATUS` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REMARK` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AUDITCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AUDITNAME` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MAKECOM` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RETURNDATE` datetime(0) NULL DEFAULT NULL,
  `MODIFYDATE` datetime(0) NULL DEFAULT NULL,
  `MODIFYNAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATETIME` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATETIME` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `IDX_PRPLRETURNTICKET_BNO`(`BUSINESSNO`) USING BTREE,
  INDEX `IDX_PRPLRETURNTICKET_OLDPID`(`OLDPAYEEID`) USING BTREE,
  INDEX `IDX_PRPLRETURNTICKET_PAYEEID`(`PAYEEID`) USING BTREE,
  INDEX `IDX_PRPLRETURNTICKET_PMID`(`PAYMENTID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prplrevisit
-- ----------------------------
DROP TABLE IF EXISTS `prplrevisit`;
CREATE TABLE `prplrevisit`  (
  `ID` decimal(8, 0) NOT NULL,
  `REGISTNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CASENO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TASKID` varchar(22) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PLACE` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '回访地点',
  `LIABLER` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '回访责任人',
  `PHONENO` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '电话',
  `VISITCOUNT` decimal(8, 0) NULL DEFAULT NULL COMMENT '回访人数',
  `RECEIVEFLAG` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否全部领取',
  `RECEIVEREMARK` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '领取说明',
  `WAYFLAG` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'l领取方式标志',
  `WAYREMARK` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '方式说明',
  `LISTFLAG` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '清单标志',
  `LISTREMARK` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '清单说明',
  `PERCENTFLAG` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '回访比例',
  `PERCENTREMARK` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '比例说明',
  `ENDFLAG` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '回访完毕',
  `STARTTIME` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '回访开始时间',
  `ENDTIME` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '回访结束时间',
  `INSERTTIME` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
  `UPDATETIME` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `OPTCODE` varchar(22) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作人代码',
  `STATUS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '流程状态',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '回访记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prplriskroster
-- ----------------------------
DROP TABLE IF EXISTS `prplriskroster`;
CREATE TABLE `prplriskroster`  (
  `CUSTID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CUSTNAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `IDENTIFYTYPE` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `IDENTIFYNO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CUSTTYPE` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VALIDSTATUS` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATEREASON` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATECODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UPDATECODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATEDATE` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATEDATE` datetime(0) NULL DEFAULT NULL,
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL,
  `phoneNumber` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`CUSTID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prplscheduletask
-- ----------------------------
DROP TABLE IF EXISTS `prplscheduletask`;
CREATE TABLE `prplscheduletask`  (
  `ID` decimal(16, 0) NOT NULL,
  `REGISTNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `POSITION` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CUSTOMERLEVEL` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MERCYFLAG` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LINKERMAN` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LINKERMANPHONE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SCHEDULEMODE` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SCHEDULEDCOMCODE` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SCHEDULEDCOMNAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SCHEDULEDUSERCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SCHEDULEDUSERNAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SCHEDULESTATUS` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CANCELORREASSIGNCONTENT` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CANCELORREASSINMODIFYTIME` datetime(0) NULL DEFAULT NULL,
  `SCHEDULEDREMARK` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SCHEDULEDTIME` datetime(0) NULL DEFAULT NULL,
  `SCHEDULETYPE` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OPERATORNAME` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ISPERSONFLAG` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VALIDFLAG` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SUBMITSOURCE` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MAKECOME` char(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `COMCODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RISKCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FLAG` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REMARK` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OPERATORCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATETIME` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `HANDLERCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UPDATETIME` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `SCHEDULEDTIMES` decimal(10, 0) NULL DEFAULT NULL,
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `IDX_PRPLSCHEDULETASK_REGISTNO`(`REGISTNO`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prplschedulework
-- ----------------------------
DROP TABLE IF EXISTS `prplschedulework`;
CREATE TABLE `prplschedulework`  (
  `ID` decimal(16, 0) NOT NULL,
  `USERID` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BEGINDATE` datetime(0) NULL DEFAULT NULL,
  `BEGINTIME` char(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ENDDATE` datetime(0) NULL DEFAULT NULL,
  `ENDTIME` char(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `STATE` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CORPCORD` char(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TELEPHONENUM` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `COMCODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATETIME` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATETIME` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `IDX_PRPLSCHEDULEWORK_USERID`(`USERID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prplsmscontent
-- ----------------------------
DROP TABLE IF EXISTS `prplsmscontent`;
CREATE TABLE `prplsmscontent`  (
  `ID` decimal(16, 0) NOT NULL,
  `TEMPLATEID` decimal(8, 0) NOT NULL,
  `TEMPLATECONTENT` varchar(600) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TEMPLATEVAR` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VARBEGINCUT` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VARENDCUT` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`, `TEMPLATEID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prplsmssend
-- ----------------------------
DROP TABLE IF EXISTS `prplsmssend`;
CREATE TABLE `prplsmssend`  (
  `ID` decimal(16, 0) NOT NULL,
  `REGISTNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BUSINESSNODE` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `templateCode` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LINKERNAME` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `LINKERPHONE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `SENDTIME` datetime(0) NOT NULL,
  `CONTENT` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MSSENDFLAG` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FLAG` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `errorinfo` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `COMCODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MAKECOME` char(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `OPERATORCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `HANDLERCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATETIME` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATETIME` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `MSGID` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `IDX_PRPLSMSSEND_REGISTNO`(`REGISTNO`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prplsmstemplate
-- ----------------------------
DROP TABLE IF EXISTS `prplsmstemplate`;
CREATE TABLE `prplsmstemplate`  (
  `TEMPLATEID` decimal(16, 0) NOT NULL,
  `TEMPLATECODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TYPECODE` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TEMPLATENAME` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TEMPLATEADDNAME` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TEMPLATETYPE` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AUTOFLAG` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VALID` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `NODENAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `COMCODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`TEMPLATEID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prplspecialclaim
-- ----------------------------
DROP TABLE IF EXISTS `prplspecialclaim`;
CREATE TABLE `prplspecialclaim`  (
  `CLAIMNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CLAIMNATURECODE` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CLAIMNATURENAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RELATIONCONTACTSINSUREDCODE` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RELATIONCONTACTSINSUREDNAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RELATIONCDANGERINSUREDCODE` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RELATIONDANGERINSUREDNAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ACCIDENTTYPCODE` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ACCIDENTTYPNAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ACCIDENTREASONCODE` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ACCIDENTREASONNAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ACCIDENTREGIONCODE` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ACCIDENTREGIONNAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ASSETSHOMEUNITCODE` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ASSETSHOMEUNITNAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TRANSPORTMODECODE` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TRANSPORTMODENAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SHIPNAME` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `STARTPORT` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TRANSITPORT` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DESTINATIONPORT` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `STARTDATE` datetime(0) NULL DEFAULT NULL,
  `TRANSITDATE` datetime(0) NULL DEFAULT NULL,
  `DESTINATIONDATE` datetime(0) NULL DEFAULT NULL,
  `CREATETIME` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATETIME` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL,
  `ACCIDENTAREATYPCODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ACCIDENTAREATYPNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`CLAIMNO`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prplsurvey
-- ----------------------------
DROP TABLE IF EXISTS `prplsurvey`;
CREATE TABLE `prplsurvey`  (
  `ID` decimal(16, 0) NOT NULL,
  `REGISTNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `POLICYNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SPONSORNAME` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INFORMANTNAME` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INFORMANTDEPARTMENT` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SURVEYSTARTDATE` datetime(0) NULL DEFAULT NULL,
  `SURVEYENDDATE` datetime(0) NULL DEFAULT NULL,
  `INJURED` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TASKSTATUS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SURVEYREASON` varchar(900) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SURVEYPROCESS` varchar(900) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SURVEYCONCLUTION` varchar(900) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `COMCODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MAKECOM` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INFORMANTCODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `IDX_PRPLSURVEY_POLICYNO`(`POLICYNO`) USING BTREE,
  INDEX `IDX_PRPLSURVEY_REGISTNO`(`REGISTNO`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prplsustransactions
-- ----------------------------
DROP TABLE IF EXISTS `prplsustransactions`;
CREATE TABLE `prplsustransactions`  (
  `ID` decimal(8, 0) NOT NULL,
  `CLAIMNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REGISTNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `COMPENSTATENO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CHARACTERISTICCODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CAUSATION` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SUSTFROMFXQFLAG` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SUSCODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SUSCHARACTERISTIC` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SUSCAUSATION` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UNDWRTSUSFLAG` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UNDWRTCAUSATION` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATETIME` datetime(0) NULL DEFAULT NULL,
  `SUSTFLAG` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UPDATETIME` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prpltimelimitcfg
-- ----------------------------
DROP TABLE IF EXISTS `prpltimelimitcfg`;
CREATE TABLE `prpltimelimitcfg`  (
  `ID` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `classCode` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '产品线（险类）',
  `riskCode` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '产品（险种）',
  `DamageResult` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '理赔类型',
  `timeLimit` int(4) NULL DEFAULT NULL COMMENT '时效天数',
  `channel` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '渠道',
  `reportType` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '报案途径',
  `operatorCode` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '配置人代码',
  `operatorName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '时效配置人',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态',
  `InsertTimeForHis` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OperateTimeForHis` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '时效配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prpltimelimitmonitor
-- ----------------------------
DROP TABLE IF EXISTS `prpltimelimitmonitor`;
CREATE TABLE `prpltimelimitmonitor`  (
  `claimNo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '立案号',
  `registNo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '报案号',
  `classCode` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '险类',
  `riskCode` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '险种',
  `reportType` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '报案类型',
  `channel` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '渠道',
  `comCode` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '承保机构',
  `insuredName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '被保人',
  `damageTime` datetime(0) NULL DEFAULT NULL COMMENT '出险时间',
  `damageArea` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '出险区域',
  `damageAddress` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '出险地点',
  `damageCode` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '出险原因',
  `damageResult` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '理赔类型',
  `sumClaim` decimal(12, 2) NULL DEFAULT NULL COMMENT '总估损金额',
  `sumRealPay` decimal(12, 2) NULL DEFAULT NULL COMMENT '总赔付金额',
  `docCollFlag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '资料上传标记',
  `docCollRequestTime` datetime(0) NULL DEFAULT NULL COMMENT '资料补充请求时间',
  `docCollResponseTime` datetime(0) NULL DEFAULT NULL COMMENT '资料补充回复时间',
  `timeOutHours` int(4) NULL DEFAULT 0 COMMENT '资料暂停累计时长（小时制）',
  `docCollStatus` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '资料配对状态,',
  `timeLimit` int(4) NULL DEFAULT 0 COMMENT '时效天数',
  PRIMARY KEY (`claimNo`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '时效监控表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prpltmpcmain
-- ----------------------------
DROP TABLE IF EXISTS `prpltmpcmain`;
CREATE TABLE `prpltmpcmain`  (
  `POLICYNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `COMPANY` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSURANT` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `STARTDATE` datetime(0) NULL DEFAULT NULL,
  `ENDDATE` datetime(0) NULL DEFAULT NULL,
  `INPUTTIME` datetime(0) NULL DEFAULT NULL,
  `MAKECOM` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `WRITECORP` char(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OPERATORCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OPERATORNAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VALIDFLAG` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FLAG` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MAKECOME` char(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `RISKCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `COMCODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `HANDLERCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATETIME` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATETIME` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`POLICYNO`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prplwftaskin
-- ----------------------------
DROP TABLE IF EXISTS `prplwftaskin`;
CREATE TABLE `prplwftaskin`  (
  `FLOWID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TASKID` decimal(16, 0) NOT NULL COMMENT '任务ID',
  `TASKNAME` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务名称',
  `UPPERTASKID` decimal(16, 0) NOT NULL COMMENT '上级任务ID',
  `NODECODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '节点编号',
  `SUBNODECODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '子节点',
  `YWTASKTYPE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '业务任务类型',
  `TASKINNODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '上一节点',
  `TASKOUTNODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '下一节点',
  `ITEMNAME` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标的名称',
  `REGISTNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `COMCODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RISKCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `WORKSTATUS` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务活动状态 0处理中，1被挂起',
  `TASKINTIME` datetime(0) NULL DEFAULT NULL COMMENT '流入时间',
  `TASKINUSER` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TASKINKEY` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '流入的业务号码',
  `ASSIGNCOM` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '任务指定处理机构',
  `ASSIGNUSER` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '任务指定处理人',
  `ACCEPTOFFTIME` datetime(0) NULL DEFAULT NULL COMMENT '任务接收截止时间',
  `ACCEPTTIME` datetime(0) NULL DEFAULT NULL COMMENT '任务接收时间',
  `HANDLERIDKEY` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '处理任务时的关键号，用于查看任务',
  `HANDLERUSER` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '任务实际处理人（即接收人）',
  `HANDLERCOM` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '处理人岗位机构（来自岗位表）',
  `HANDLERTIME` datetime(0) NULL DEFAULT NULL COMMENT '任务接收开始处理时间',
  `OUTOFFTIME` datetime(0) NULL DEFAULT NULL COMMENT '完成处理截止时间',
  `HANDLERMINUTES` decimal(8, 0) NULL DEFAULT NULL COMMENT '任务处理时长(分钟)',
  `BUSSTAG` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '业务标记',
  `SHOWINFOXML` varchar(3000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '显示信息扩展XML',
  `REMARK` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注说明',
  `ASSIGNGROUP` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '指定接收组',
  `TASKPAKAGEID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '任务包id',
  `HEARTFLAG` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关注标识',
  `CANCELFLAG` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '1' COMMENT '注销标志',
  `MAKECOM` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `HANDLERSTATUS` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '任务处理状态',
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '系统插入时间',
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL COMMENT '系统更新时间',
  PRIMARY KEY (`TASKID`) USING BTREE,
  INDEX `IDX_PRPLWFTASKIN_REGISTNO`(`REGISTNO`) USING BTREE,
  INDEX `IDX_PRPLWFTASKIN_TASKINTIME`(`TASKINTIME`) USING BTREE,
  INDEX `IDX_PRPLWFTASKIN_TASKPAKAGEID`(`TASKPAKAGEID`) USING BTREE,
  INDEX `IDX_PRPLWFTASKIN_UPPERTASKID`(`UPPERTASKID`) USING BTREE,
  INDEX `IDX_TASK_HWRC`(`HANDLERUSER`, `WORKSTATUS`, `RISKCODE`, `CANCELFLAG`) USING BTREE,
  INDEX `IDX_TASK_OPERATETIME`(`OPERATETIMEFORHIS`) USING BTREE,
  INDEX `IDX_TASK_SWH`(`SUBNODECODE`, `WORKSTATUS`, `HEARTFLAG`) USING BTREE,
  INDEX `IDX_TASK_TRS`(`TASKINTIME`, `RISKCODE`, `SUBNODECODE`) USING BTREE,
  INDEX `IDX_TASK_WHCT`(`WORKSTATUS`, `HANDLERUSER`, `CANCELFLAG`, `TASKINTIME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '工作流任务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prpmaxno
-- ----------------------------
DROP TABLE IF EXISTS `prpmaxno`;
CREATE TABLE `prpmaxno`  (
  `GROUPNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `MAXNO` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TABLENAME` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `COMCODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`GROUPNO`, `TABLENAME`, `MAXNO`) USING BTREE,
  INDEX `IDX_PRPMAXNO_GROUPNO`(`GROUPNO`) USING BTREE,
  INDEX `IDX_PRPMAXNO_MAXNO`(`MAXNO`) USING BTREE,
  INDEX `IDX_PRPMAXNO_TABLENAME`(`TABLENAME`) USING BTREE,
  INDEX `INDEX_MAXNO`(`GROUPNO`, `TABLENAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prpmaxuse
-- ----------------------------
DROP TABLE IF EXISTS `prpmaxuse`;
CREATE TABLE `prpmaxuse`  (
  `GROUPNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TABLENAME` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `MAXNO` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TTYCODE` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FLAG` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`GROUPNO`, `TABLENAME`, `MAXNO`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prputikey
-- ----------------------------
DROP TABLE IF EXISTS `prputikey`;
CREATE TABLE `prputikey`  (
  `TABLENAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `FIELDNAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FIELDMEANING` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `COLLENGTH` decimal(8, 0) NULL DEFAULT NULL,
  `HEADID` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FLAG` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`TABLENAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for saafactor
-- ----------------------------
DROP TABLE IF EXISTS `saafactor`;
CREATE TABLE `saafactor`  (
  `FACTORCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `FACTORNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `DATATYPE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `SYSTEM` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CREATECODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CREATETIME` datetime(0) NOT NULL,
  `VALIDFLAG` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `REMARK` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FLAG` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SYNFLAG` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`FACTORCODE`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for saafactorfield
-- ----------------------------
DROP TABLE IF EXISTS `saafactorfield`;
CREATE TABLE `saafactorfield`  (
  `ID` decimal(13, 0) NOT NULL,
  `SYSTEMCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `FACTORCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ENTITYCODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `FIELDCODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CREATECODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CREATETIME` datetime(0) NOT NULL,
  `VALIDFLAG` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `REMARK` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FLAG` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SYNFLAG` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for saagrade
-- ----------------------------
DROP TABLE IF EXISTS `saagrade`;
CREATE TABLE `saagrade`  (
  `ID` decimal(13, 0) NOT NULL,
  `GRADECLASS` decimal(13, 0) NOT NULL,
  `GRADECODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `GRADECNAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `GRADEENAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `GRADETYPE` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `LEVELGRADE` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MAXLEVEL` decimal(5, 0) NULL DEFAULT NULL,
  `COMCODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATECODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CREATETIME` datetime(0) NOT NULL,
  `UPDATECODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UPDATETIME` datetime(0) NULL DEFAULT NULL,
  `VALIDFLAG` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `REMARK` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FLAG` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SYNFLAG` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for saagradetask
-- ----------------------------
DROP TABLE IF EXISTS `saagradetask`;
CREATE TABLE `saagradetask`  (
  `ID` decimal(13, 0) NOT NULL,
  `GRADEID` decimal(13, 0) NOT NULL,
  `TASKID` decimal(13, 0) NOT NULL,
  `FLAG` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SYNFLAG` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for saapermissiongroup
-- ----------------------------
DROP TABLE IF EXISTS `saapermissiongroup`;
CREATE TABLE `saapermissiongroup`  (
  `ID` decimal(16, 0) NOT NULL,
  `USERCODE` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `USERNAME` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `GROUPCOMCODE` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `GROUPCOMNAME` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VALIDSTATUS` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1',
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `IDX_SAAPERMISSIONGROUP_USERCODE`(`USERCODE`) USING BTREE,
  INDEX `IDX_SAAPERMISSIONGROUP_GROUPCODE`(`GROUPCOMCODE`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for saatask
-- ----------------------------
DROP TABLE IF EXISTS `saatask`;
CREATE TABLE `saatask`  (
  `ID` decimal(13, 0) NOT NULL,
  `TASKCODE` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `PARENTCODE` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TASKCNAME` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TASKENAME` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `URL` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SYSTEM` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATECODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CREATETIME` datetime(0) NOT NULL,
  `VALIDFLAG` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `REMARK` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FLAG` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SYNFLAG` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for saauserexceptdata
-- ----------------------------
DROP TABLE IF EXISTS `saauserexceptdata`;
CREATE TABLE `saauserexceptdata`  (
  `ID` decimal(13, 0) NOT NULL,
  `USERCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `COMCODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `USERGRADEID` decimal(13, 0) NULL DEFAULT NULL,
  `FACTORCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `DATAOPER` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `DATAVALUE1` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `DATAVALUE2` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATECODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CREATETIME` datetime(0) NOT NULL,
  `UPDATECODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UPDATETIME` datetime(0) NULL DEFAULT NULL,
  `VALIDFLAG` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `REMARK` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FLAG` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SYNFLAG` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for saausergrade
-- ----------------------------
DROP TABLE IF EXISTS `saausergrade`;
CREATE TABLE `saausergrade`  (
  `ID` decimal(13, 0) NOT NULL,
  `USERCODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `GRADEID` decimal(13, 0) NOT NULL,
  `GRADECODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `GRADELEVEL` decimal(5, 0) NULL DEFAULT NULL,
  `VALIDDATE` datetime(0) NULL DEFAULT NULL,
  `INVALIDDATE` datetime(0) NULL DEFAULT NULL,
  `GRANTWAY` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `COMCODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATECODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CREATETIME` datetime(0) NOT NULL,
  `UPDATECODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UPDATETIME` datetime(0) NULL DEFAULT NULL,
  `VALIDFLAG` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `REMARK` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FLAG` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SYNFLAG` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `IDX_SAAUSERGRADE_USERCODE`(`USERCODE`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for saauserpermitdata
-- ----------------------------
DROP TABLE IF EXISTS `saauserpermitdata`;
CREATE TABLE `saauserpermitdata`  (
  `ID` decimal(13, 0) NOT NULL,
  `SYSTEMCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `USERCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `COMCODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `USERGRADEID` decimal(13, 0) NULL DEFAULT NULL,
  `FACTORGROUP` decimal(5, 0) NULL DEFAULT NULL,
  `FACTORCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DATAOPER` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `DATAVALUE1` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `DATAVALUE2` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATECODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CREATETIME` datetime(0) NOT NULL,
  `UPDATECODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UPDATETIME` datetime(0) NULL DEFAULT NULL,
  `VALIDFLAG` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `REMARK` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FLAG` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SYNFLAG` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sequence
-- ----------------------------
DROP TABLE IF EXISTS `sequence`;
CREATE TABLE `sequence`  (
  `seq_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '表名',
  `current_val` decimal(10, 0) NOT NULL DEFAULT 0,
  `increment_val` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`seq_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for usermessage
-- ----------------------------
DROP TABLE IF EXISTS `usermessage`;
CREATE TABLE `usermessage`  (
  `ID` decimal(16, 0) NOT NULL,
  `TITLE` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CONTENT` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `USERCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATEDATE` datetime(0) NULL DEFAULT NULL,
  `COMCODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FLAG` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PRIORITY` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BUSINESSID` varchar(22) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `IDX_USERMESSAGE_COMCODE`(`COMCODE`) USING BTREE,
  INDEX `IDX_USERMESSAGE_USERCODE`(`USERCODE`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for usermessagestatus
-- ----------------------------
DROP TABLE IF EXISTS `usermessagestatus`;
CREATE TABLE `usermessagestatus`  (
  `USERCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `LOOKMESSAGELIST` varchar(3000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`USERCODE`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for userremind
-- ----------------------------
DROP TABLE IF EXISTS `userremind`;
CREATE TABLE `userremind`  (
  `ID` decimal(16, 0) NOT NULL,
  `BUSINESSID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TITLE` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CONTENT` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `USERCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `COMCODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PRIORITY` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FLAG` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ISSHOW` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OPERATORCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MAKECOME` char(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CREATETIME` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATETIME` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `REMINDTYPE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ISSHOWFLOATBOX` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `NODE` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REMINDTIME` datetime(0) NULL DEFAULT NULL,
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for usershortcut
-- ----------------------------
DROP TABLE IF EXISTS `usershortcut`;
CREATE TABLE `usershortcut`  (
  `USERCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TASKLIST` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSERTTIMEFORHIS` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATETIMEFORHIS` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`USERCODE`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for utisequence
-- ----------------------------
DROP TABLE IF EXISTS `utisequence`;
CREATE TABLE `utisequence`  (
  `GENNAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `GENVALUE` decimal(20, 0) NULL DEFAULT NULL,
  PRIMARY KEY (`GENNAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Function structure for currval
-- ----------------------------
DROP FUNCTION IF EXISTS `currval`;
delimiter ;;
CREATE FUNCTION `currval`(`v_seq_name` varchar(50))
 RETURNS decimal(10,0)
BEGIN
	declare re_val NUMERIC(10,0);
	set re_val = NULL;
	select current_val into re_val  
  from sequence
  where seq_name = v_seq_name; 
	RETURN re_val;
END
;;
delimiter ;

-- ----------------------------
-- Function structure for getChildLst
-- ----------------------------
DROP FUNCTION IF EXISTS `getChildLst`;
delimiter ;;
CREATE FUNCTION `getChildLst`(rootId varchar(100))
 RETURNS varchar(5000) CHARSET utf8
BEGIN
       DECLARE sTemp VARCHAR(5000);
       DECLARE sTempChd VARCHAR(5000); 
       DECLARE count Int; 
       SET count =1;
       SET sTemp = rootId;
       SET sTempChd =cast(rootId as CHAR); 
       WHILE sTempChd is not null and count<8  DO
         SET sTemp = concat(sTemp,',',sTempChd);
         SELECT group_concat(comcode) INTO sTempChd FROM prpdcompany where FIND_IN_SET(uppercomcode,sTempChd)>0;
       END WHILE;
       RETURN sTemp;
     END
;;
delimiter ;

-- ----------------------------
-- Function structure for getParentLst
-- ----------------------------
DROP FUNCTION IF EXISTS `getParentLst`;
delimiter ;;
CREATE FUNCTION `getParentLst`(rootId varchar(100))
 RETURNS varchar(1000) CHARSET utf8
BEGIN
       DECLARE sTemp VARCHAR(1000);
       DECLARE sTempChd VARCHAR(1000); 
       DECLARE sTempParent VARCHAR(1000); 
       DECLARE sTempCurr VARCHAR(1000); 
       DECLARE count Int; 
       SET count =1;
       SET sTemp = '$';
       SET sTempParent ='';
       SET sTempChd = cast(rootId as CHAR); 
       SET sTempCurr = sTempChd;
       WHILE sTempChd != sTempParent  and count<8  DO
         SET sTemp = concat(sTemp,',',sTempParent);
         SELECT group_concat(uppercomcode) INTO sTempCurr FROM prpdcompany where FIND_IN_SET(comcode,sTempCurr)>0;
         SET sTempChd = sTempParent;
         SET sTempParent = sTempCurr; 
       END WHILE;
       RETURN sTemp;
     END
;;
delimiter ;

-- ----------------------------
-- Function structure for getWFChildLst
-- ----------------------------
DROP FUNCTION IF EXISTS `getWFChildLst`;
delimiter ;;
CREATE FUNCTION `getWFChildLst`(rootId VARCHAR(100))
 RETURNS varchar(5000) CHARSET utf8
BEGIN
    DECLARE sTemp VARCHAR(5000);
    DECLARE sTempChd VARCHAR(5000);
    SET sTemp = rootId;
    SET sTempChd = cast(rootId AS CHAR);
    WHILE sTempChd IS NOT NULL DO
      SET sTemp = concat(sTemp, ',', sTempChd);
      SELECT group_concat(taskId)
      INTO sTempChd
      FROM prplwftaskin
      WHERE FIND_IN_SET(upperTaskId, sTempChd) > 0;
    END WHILE;
    SELECT SUBSTRING(sTemp, LOCATE(',', sTemp) + 1)
    INTO sTemp;
    RETURN sTemp;
  END
;;
delimiter ;

-- ----------------------------
-- Function structure for nextval
-- ----------------------------
DROP FUNCTION IF EXISTS `nextval`;
delimiter ;;
CREATE FUNCTION `nextval`(`v_seq_name` VARCHAR(50))
 RETURNS decimal(10,0)
BEGIN
	declare tem_val NUMERIC(10,0);
	set tem_val = null;
  select current_val into tem_val  from sequence where seq_name = v_seq_name;
	IF ISNULL(tem_val) THEN
		INSERT INTO sequence VALUES(v_seq_name,1,1);
	ELSE
		update sequence set current_val = current_val + increment_val  where seq_name = v_seq_name;
	END IF;
	RETURN currval(v_seq_name);
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
