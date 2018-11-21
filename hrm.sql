/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50719
 Source Host           : localhost:3306
 Source Schema         : hrm

 Target Server Type    : MySQL
 Target Server Version : 50719
 File Encoding         : 65001

 Date: 21/11/2018 22:38:25
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for party_type
-- ----------------------------
DROP TABLE IF EXISTS `party_type`;
CREATE TABLE `party_type`  (
  `id` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '团体类型',
  `parent_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上级类型ID',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_at` datetime(0) NOT NULL,
  `updated_at` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of party_type
-- ----------------------------
INSERT INTO `party_type` VALUES ('AUTOMATED_AGENT', NULL, '自动化代理', '2018-05-31 07:14:32', '2018-05-31 07:14:32');
INSERT INTO `party_type` VALUES ('CORPORATION', 'LEGAL_ORGANIZATION', '集团', '2018-05-31 07:14:32', '2018-05-31 07:14:32');
INSERT INTO `party_type` VALUES ('FAMILY', 'INFORMAL_GROUP', '家庭', '2018-05-31 07:14:32', '2018-05-31 07:14:32');
INSERT INTO `party_type` VALUES ('GOVERNMENT_AGENCY', 'LEGAL_ORGANIZATION', '政府机构', '2018-05-31 07:14:32', '2018-05-31 07:14:32');
INSERT INTO `party_type` VALUES ('INFORMAL_GROUP', 'PARTY_GROUP', '非正式组', '2018-05-31 07:14:32', '2018-05-31 07:14:32');
INSERT INTO `party_type` VALUES ('LEGAL_ORGANIZATION', 'PARTY_GROUP', '法务部门', '2018-05-31 07:14:32', '2018-05-31 07:14:32');
INSERT INTO `party_type` VALUES ('PARTY_GROUP', NULL, '会员组', '2018-05-31 07:14:32', '2018-05-31 07:14:32');
INSERT INTO `party_type` VALUES ('PERSON', NULL, '个人', '2018-05-31 07:14:32', '2018-05-31 07:14:32');
INSERT INTO `party_type` VALUES ('TEAM', 'INFORMAL_GROUP', '团队', '2018-05-31 07:14:32', '2018-05-31 07:14:32');

-- ----------------------------
-- Table structure for party_type_attr
-- ----------------------------
DROP TABLE IF EXISTS `party_type_attr`;
CREATE TABLE `party_type_attr`  (
  `PARTY_TYPE_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ATTR_NAME` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_at` datetime(3) NULL DEFAULT NULL,
  `updated_at` datetime(3) NULL DEFAULT NULL,
  PRIMARY KEY (`PARTY_TYPE_ID`, `ATTR_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for security_group
-- ----------------------------
DROP TABLE IF EXISTS `security_group`;
CREATE TABLE `security_group`  (
  `id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_at` datetime(3) NULL DEFAULT NULL,
  `updated_at` datetime(3) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of security_group
-- ----------------------------
INSERT INTO `security_group` VALUES ('ACCTG_FUNCTNL_ADMIN', 'Accounting permission for all accounting functions.', '2018-11-16 12:13:22.000', '2018-11-16 12:13:22.000');
INSERT INTO `security_group` VALUES ('ASSETMAINTADMIN', ' 资产维护管理组，具有全部维护权限。 ', '2018-11-16 12:13:23.000', '2018-11-16 12:13:23.000');
INSERT INTO `security_group` VALUES ('ASSETMAINTTECH', ' 资产维护技术人员组，具有浏览和更新权限。 ', '2018-11-16 12:13:23.000', '2018-11-16 12:13:23.000');
INSERT INTO `security_group` VALUES ('BIZADMIN', ' 全部商业应用程序权限组，具有全部商业应用程序管理权限，不是技术人员权限。 ', '2018-11-16 12:13:23.000', '2018-11-16 12:13:23.000');
INSERT INTO `security_group` VALUES ('CATALOGADMIN', ' 全部商业应用程序权限组，具有全部商业应用程序管理权限，不是技术人员权限。 ', '2018-11-16 12:13:23.000', '2018-11-16 12:13:23.000');
INSERT INTO `security_group` VALUES ('CATALOGADMIN_LTD', ' 有限的目录管理组，具有有限的目录权限。 ', '2018-11-16 12:13:23.000', '2018-11-16 12:13:23.000');
INSERT INTO `security_group` VALUES ('COMPDOCADMIN', 'CompDoc admin group, all permissions.', '2018-11-16 12:13:23.000', '2018-11-16 12:13:23.000');
INSERT INTO `security_group` VALUES ('CONTENT_USER', ' 内容用户组；全部有限的内容权限。 ', '2018-11-16 12:13:23.000', '2018-11-16 12:13:23.000');
INSERT INTO `security_group` VALUES ('ECOMMERCE_CUSTOMER', 'Customer user of ECOMMERCE Limited access to own account', '2018-11-16 12:13:23.000', '2018-11-16 12:13:23.000');
INSERT INTO `security_group` VALUES ('FLEXADMIN', ' 缓存管理组，具有全部颗粒的权限.', '2018-11-16 12:13:23.000', '2018-11-16 12:13:23.000');
INSERT INTO `security_group` VALUES ('FULLADMIN', ' 完全管理组，具有全部通用权限。 ', '2018-11-16 12:13:23.000', '2018-11-16 12:13:23.000');
INSERT INTO `security_group` VALUES ('HUMANRES_ADMIN', 'This security group is for those who have full access to the human resource component.', '2018-11-16 12:13:24.000', '2018-11-16 12:13:24.000');
INSERT INTO `security_group` VALUES ('HUMANRES_APPROVER', 'This security group is for those who will approve the internal job posting application.', '2018-11-16 12:13:24.000', '2018-11-16 12:13:24.000');
INSERT INTO `security_group` VALUES ('HUMANRES_EMPLOYEE', 'This security group is for all the employees who want to apply for internal Job Posting.', '2018-11-16 12:13:24.000', '2018-11-16 12:13:24.000');
INSERT INTO `security_group` VALUES ('IMAGEADMIN', 'Image Management Admin.', '2018-11-16 12:13:24.000', '2018-11-16 12:13:24.000');
INSERT INTO `security_group` VALUES ('IMAGEAPPROVE', 'Image Management Approve', '2018-11-16 12:13:24.000', '2018-11-16 12:13:24.000');
INSERT INTO `security_group` VALUES ('IMAGEUPLOAD', 'Image Management Upload.', '2018-11-16 12:13:24.000', '2018-11-16 12:13:24.000');
INSERT INTO `security_group` VALUES ('MYPORTAL_CUSTOMER', ' 我的门户客户用户，受限访问自己的客户请求，以及项目 ', '2018-11-16 12:13:24.000', '2018-11-16 12:13:24.000');
INSERT INTO `security_group` VALUES ('MYPORTAL_EMPL-NOEML', ' 我的门户雇员用户，受限访问项目管理以及沟通、客户请求，不包括电子邮件 ', '2018-11-16 12:13:24.000', '2018-11-16 12:13:24.000');
INSERT INTO `security_group` VALUES ('MYPORTAL_EMPLOYEE', ' 我的门户雇员用户，受限访问项目管理、沟通、客户请求 ', '2018-11-16 12:13:24.000', '2018-11-16 12:13:24.000');
INSERT INTO `security_group` VALUES ('ORDERADMIN', ' 订单管理组，具有全部订单权限。 ', '2018-11-16 12:13:24.000', '2018-11-16 12:13:24.000');
INSERT INTO `security_group` VALUES ('ORDERADMIN_LTD', ' 受限的订单管理组，具有全部受限的订单权限。 ', '2018-11-16 12:13:24.000', '2018-11-16 12:13:24.000');
INSERT INTO `security_group` VALUES ('ORDERENTRY', ' 订单记录管理组；创建订单权限。 ', '2018-11-16 12:13:24.000', '2018-11-16 12:13:24.000');
INSERT INTO `security_group` VALUES ('ORDERENTRY_ALL', ' 全部店铺的订单记录管理组。不需要特别的角色。 ', '2018-11-16 12:13:24.000', '2018-11-16 12:13:24.000');
INSERT INTO `security_group` VALUES ('ORDERPROC', ' 管理组用于受限制的订单流程。 ', '2018-11-16 12:13:25.000', '2018-11-16 12:13:25.000');
INSERT INTO `security_group` VALUES ('ORDERPURCH', ' 具有采购权限的订单记录。 ', '2018-11-16 12:13:25.000', '2018-11-16 12:13:25.000');
INSERT INTO `security_group` VALUES ('ORDERSUPPLIER_LTD', ' 有限的订单管理组用于供货商。 ', '2018-11-16 12:13:25.000', '2018-11-16 12:13:25.000');
INSERT INTO `security_group` VALUES ('PARTYADMIN', ' 会员管理组，具有全部会员权限。 ', '2018-11-16 12:13:25.000', '2018-11-16 12:13:25.000');
INSERT INTO `security_group` VALUES ('POSCLERK', 'POS Clerk', '2018-11-16 12:13:25.000', '2018-11-16 12:13:25.000');
INSERT INTO `security_group` VALUES ('PROJECTADMIN', ' 会员管理组，具有全部会员权限。 ', '2018-11-16 12:13:25.000', '2018-11-16 12:13:25.000');
INSERT INTO `security_group` VALUES ('PROJECTUSER', ' 项目用户组，具有对自己项目的读、任务创建/指派以及工单创建/更新权限。 ', '2018-11-16 12:13:25.000', '2018-11-16 12:13:25.000');
INSERT INTO `security_group` VALUES ('SCRUM_ADMIN', 'Scrum Administrator group, has all scrum permissions.', '2018-11-16 12:13:25.000', '2018-11-16 12:13:25.000');
INSERT INTO `security_group` VALUES ('SCRUM_BILLING', 'Scrumbilling', '2018-11-16 12:13:25.000', '2018-11-16 12:13:25.000');
INSERT INTO `security_group` VALUES ('SCRUM_MASTER', 'Scrum Master', '2018-11-16 12:13:25.000', '2018-11-16 12:13:25.000');
INSERT INTO `security_group` VALUES ('SCRUM_PRODUCT_OWNER', 'Product Owner', '2018-11-16 12:13:25.000', '2018-11-16 12:13:25.000');
INSERT INTO `security_group` VALUES ('SCRUM_STAKEHOLDER', 'Stakeholder', '2018-11-16 12:13:25.000', '2018-11-16 12:13:25.000');
INSERT INTO `security_group` VALUES ('SCRUM_TEAM', 'Scrum Team', '2018-11-16 12:13:25.000', '2018-11-16 12:13:25.000');
INSERT INTO `security_group` VALUES ('SCRUM_TEST_ADMIN', 'Scrum Test Administrator', '2018-11-16 12:13:25.000', '2018-11-16 12:13:25.000');
INSERT INTO `security_group` VALUES ('SECURITYADMIN', ' 安全管理组，具有在会员管理中修改安全设置的全部权限 ', '2018-11-16 12:13:25.000', '2018-11-16 12:13:25.000');
INSERT INTO `security_group` VALUES ('SUPER', 'Super admin group, has all *_ADMIN permission loaded as seed data', '2018-11-16 12:13:26.000', '2018-11-16 12:13:26.000');
INSERT INTO `security_group` VALUES ('VIEWADMIN', ' 演示管理组，具有全部浏览权限。 ', '2018-11-16 12:13:26.000', '2018-11-16 12:13:26.000');
INSERT INTO `security_group` VALUES ('WORKEFFORTADMIN', 'WorkEffort Admin group, has all workeffort permissions.', '2018-11-16 12:13:26.000', '2018-11-16 12:13:26.000');
INSERT INTO `security_group` VALUES ('WORKEFFORT_USER', ' 人工服务用户组；全部受限的人工服务权限。 ', '2018-11-16 12:13:26.000', '2018-11-16 12:13:26.000');

-- ----------------------------
-- Table structure for security_group_permission
-- ----------------------------
DROP TABLE IF EXISTS `security_group_permission`;
CREATE TABLE `security_group_permission`  (
  `security_group_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `security_permission_id` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_at` datetime(3) NULL DEFAULT NULL,
  `updated_at` datetime(3) NULL DEFAULT NULL,
  PRIMARY KEY (`security_group_id`, `security_permission_id`) USING BTREE,
  INDEX `SEC_GRP_PERM_GRP`(`security_group_id`) USING BTREE,
  INDEX `SCT_GRP_PRMN_TXSTP`(`updated_at`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of security_group_permission
-- ----------------------------
INSERT INTO `security_group_permission` VALUES ('BIZADMIN', 'FACILITY_ADMIN', '2018-11-14 08:06:58.326', '2018-11-14 08:06:58.318');
INSERT INTO `security_group_permission` VALUES ('BIZADMIN', 'MANUFACTURING_ADMIN', '2018-11-14 08:06:58.345', '2018-11-14 08:06:58.337');
INSERT INTO `security_group_permission` VALUES ('BIZADMIN', 'MARKETING_ADMIN', '2018-11-14 08:06:58.992', '2018-11-14 08:06:58.969');
INSERT INTO `security_group_permission` VALUES ('BIZADMIN', 'PERIOD_MAINT', '2018-11-14 08:06:58.159', '2018-11-14 08:06:58.134');
INSERT INTO `security_group_permission` VALUES ('BIZADMIN', 'SFA_ADMIN', '2018-11-14 08:06:58.999', '2018-11-14 08:06:58.969');
INSERT INTO `security_group_permission` VALUES ('FLEXADMIN', 'ARTIFACT_INFO_VIEW', '2018-11-14 08:06:58.146', '2018-11-14 08:06:58.134');
INSERT INTO `security_group_permission` VALUES ('FLEXADMIN', 'COMMON_CREATE', '2018-11-14 08:06:58.039', '2018-11-14 08:06:58.034');
INSERT INTO `security_group_permission` VALUES ('FLEXADMIN', 'COMMON_DELETE', '2018-11-14 08:06:58.040', '2018-11-14 08:06:58.034');
INSERT INTO `security_group_permission` VALUES ('FLEXADMIN', 'COMMON_UPDATE', '2018-11-14 08:06:58.041', '2018-11-14 08:06:58.034');
INSERT INTO `security_group_permission` VALUES ('FLEXADMIN', 'COMMON_VIEW', '2018-11-14 08:06:58.042', '2018-11-14 08:06:58.034');
INSERT INTO `security_group_permission` VALUES ('FLEXADMIN', 'DATAFILE_MAINT', '2018-11-14 08:06:58.152', '2018-11-14 08:06:58.134');
INSERT INTO `security_group_permission` VALUES ('FLEXADMIN', 'ENTITY_DATA_CREATE', '2018-11-14 08:06:58.165', '2018-11-14 08:06:58.134');
INSERT INTO `security_group_permission` VALUES ('FLEXADMIN', 'ENTITY_DATA_DELETE', '2018-11-14 08:06:58.166', '2018-11-14 08:06:58.134');
INSERT INTO `security_group_permission` VALUES ('FLEXADMIN', 'ENTITY_DATA_UPDATE', '2018-11-14 08:06:58.167', '2018-11-14 08:06:58.134');
INSERT INTO `security_group_permission` VALUES ('FLEXADMIN', 'ENTITY_DATA_VIEW', '2018-11-14 08:06:58.168', '2018-11-14 08:06:58.134');
INSERT INTO `security_group_permission` VALUES ('FLEXADMIN', 'ENTITY_MAINT', '2018-11-14 08:06:58.164', '2018-11-14 08:06:58.134');
INSERT INTO `security_group_permission` VALUES ('FLEXADMIN', 'ENTITY_SYNC_ADMIN', '2018-11-14 08:06:58.128', '2018-11-14 08:06:58.125');
INSERT INTO `security_group_permission` VALUES ('FLEXADMIN', 'ENUM_STATUS_MAINT', '2018-11-14 08:06:58.161', '2018-11-14 08:06:58.134');
INSERT INTO `security_group_permission` VALUES ('FLEXADMIN', 'FACILITY_CREATE', '2018-11-14 08:06:58.321', '2018-11-14 08:06:58.318');
INSERT INTO `security_group_permission` VALUES ('FLEXADMIN', 'FACILITY_DELETE', '2018-11-14 08:06:58.322', '2018-11-14 08:06:58.318');
INSERT INTO `security_group_permission` VALUES ('FLEXADMIN', 'FACILITY_UPDATE', '2018-11-14 08:06:58.323', '2018-11-14 08:06:58.318');
INSERT INTO `security_group_permission` VALUES ('FLEXADMIN', 'FACILITY_VIEW', '2018-11-14 08:06:58.324', '2018-11-14 08:06:58.318');
INSERT INTO `security_group_permission` VALUES ('FLEXADMIN', 'LABEL_MANAGER_VIEW', '2018-11-14 08:06:58.149', '2018-11-14 08:06:58.134');
INSERT INTO `security_group_permission` VALUES ('FLEXADMIN', 'MANUFACTURING_CREATE', '2018-11-14 08:06:58.340', '2018-11-14 08:06:58.337');
INSERT INTO `security_group_permission` VALUES ('FLEXADMIN', 'MANUFACTURING_DELETE', '2018-11-14 08:06:58.341', '2018-11-14 08:06:58.337');
INSERT INTO `security_group_permission` VALUES ('FLEXADMIN', 'MANUFACTURING_UPDATE', '2018-11-14 08:06:58.342', '2018-11-14 08:06:58.337');
INSERT INTO `security_group_permission` VALUES ('FLEXADMIN', 'MANUFACTURING_VIEW', '2018-11-14 08:06:58.343', '2018-11-14 08:06:58.337');
INSERT INTO `security_group_permission` VALUES ('FLEXADMIN', 'MARKETING_CREATE', '2018-11-14 08:06:58.974', '2018-11-14 08:06:58.969');
INSERT INTO `security_group_permission` VALUES ('FLEXADMIN', 'MARKETING_DELETE', '2018-11-14 08:06:58.975', '2018-11-14 08:06:58.969');
INSERT INTO `security_group_permission` VALUES ('FLEXADMIN', 'MARKETING_UPDATE', '2018-11-14 08:06:58.976', '2018-11-14 08:06:58.969');
INSERT INTO `security_group_permission` VALUES ('FLEXADMIN', 'MARKETING_VIEW', '2018-11-14 08:06:58.977', '2018-11-14 08:06:58.969');
INSERT INTO `security_group_permission` VALUES ('FLEXADMIN', 'PERIOD_MAINT', '2018-11-14 08:06:58.158', '2018-11-14 08:06:58.134');
INSERT INTO `security_group_permission` VALUES ('FLEXADMIN', 'PORTALPAGE_ADMIN', '2018-11-14 08:06:58.046', '2018-11-14 08:06:58.034');
INSERT INTO `security_group_permission` VALUES ('FLEXADMIN', 'SERVER_STATS_VIEW', '2018-11-14 08:06:58.143', '2018-11-14 08:06:58.134');
INSERT INTO `security_group_permission` VALUES ('FLEXADMIN', 'SERVICE_INVOKE_ANY', '2018-11-14 08:06:58.058', '2018-11-14 08:06:58.055');
INSERT INTO `security_group_permission` VALUES ('FLEXADMIN', 'SERVICE_JM_LOCK', '2018-11-14 08:06:58.156', '2018-11-14 08:06:58.134');
INSERT INTO `security_group_permission` VALUES ('FLEXADMIN', 'SERVICE_MAINT', '2018-11-14 08:06:58.155', '2018-11-14 08:06:58.134');
INSERT INTO `security_group_permission` VALUES ('FLEXADMIN', 'SFA_CREATE', '2018-11-14 08:06:58.994', '2018-11-14 08:06:58.969');
INSERT INTO `security_group_permission` VALUES ('FLEXADMIN', 'SFA_DELETE', '2018-11-14 08:06:58.995', '2018-11-14 08:06:58.969');
INSERT INTO `security_group_permission` VALUES ('FLEXADMIN', 'SFA_UPDATE', '2018-11-14 08:06:58.996', '2018-11-14 08:06:58.969');
INSERT INTO `security_group_permission` VALUES ('FLEXADMIN', 'SFA_VIEW', '2018-11-14 08:06:58.997', '2018-11-14 08:06:58.969');
INSERT INTO `security_group_permission` VALUES ('FLEXADMIN', 'UTIL_CACHE_EDIT', '2018-11-14 08:06:58.174', '2018-11-14 08:06:58.134');
INSERT INTO `security_group_permission` VALUES ('FLEXADMIN', 'UTIL_CACHE_VIEW', '2018-11-14 08:06:58.175', '2018-11-14 08:06:58.134');
INSERT INTO `security_group_permission` VALUES ('FLEXADMIN', 'UTIL_DEBUG_EDIT', '2018-11-14 08:06:58.176', '2018-11-14 08:06:58.134');
INSERT INTO `security_group_permission` VALUES ('FLEXADMIN', 'UTIL_DEBUG_VIEW', '2018-11-14 08:06:58.177', '2018-11-14 08:06:58.134');
INSERT INTO `security_group_permission` VALUES ('FLEXADMIN', 'VISUALTHEME_CREATE', '2018-11-14 08:06:58.043', '2018-11-14 08:06:58.034');
INSERT INTO `security_group_permission` VALUES ('FLEXADMIN', 'VISUALTHEME_DELETE', '2018-11-14 08:06:58.045', '2018-11-14 08:06:58.034');
INSERT INTO `security_group_permission` VALUES ('FLEXADMIN', 'VISUALTHEME_UPDATE', '2018-11-14 08:06:58.044', '2018-11-14 08:06:58.034');
INSERT INTO `security_group_permission` VALUES ('FLEXADMIN', 'WEBTOOLS_VIEW', '2018-11-14 08:06:58.140', '2018-11-14 08:06:58.134');
INSERT INTO `security_group_permission` VALUES ('FULLADMIN', 'ARTIFACT_INFO_VIEW', '2018-11-14 08:06:58.145', '2018-11-14 08:06:58.134');
INSERT INTO `security_group_permission` VALUES ('FULLADMIN', 'COMMONEXT_PUBLMSG', '2018-11-14 08:06:59.019', '2018-11-14 08:06:59.017');
INSERT INTO `security_group_permission` VALUES ('FULLADMIN', 'COMMON_ADMIN', '2018-11-14 08:06:58.048', '2018-11-14 08:06:58.034');
INSERT INTO `security_group_permission` VALUES ('FULLADMIN', 'DATAFILE_MAINT', '2018-11-14 08:06:58.151', '2018-11-14 08:06:58.134');
INSERT INTO `security_group_permission` VALUES ('FULLADMIN', 'ENTITY_DATA_ADMIN', '2018-11-14 08:06:58.163', '2018-11-14 08:06:58.134');
INSERT INTO `security_group_permission` VALUES ('FULLADMIN', 'ENTITY_MAINT', '2018-11-14 08:06:58.162', '2018-11-14 08:06:58.134');
INSERT INTO `security_group_permission` VALUES ('FULLADMIN', 'ENTITY_SYNC_ADMIN', '2018-11-14 08:06:58.127', '2018-11-14 08:06:58.125');
INSERT INTO `security_group_permission` VALUES ('FULLADMIN', 'ENUM_STATUS_MAINT', '2018-11-14 08:06:58.160', '2018-11-14 08:06:58.134');
INSERT INTO `security_group_permission` VALUES ('FULLADMIN', 'FACILITY_ADMIN', '2018-11-14 08:06:58.320', '2018-11-14 08:06:58.318');
INSERT INTO `security_group_permission` VALUES ('FULLADMIN', 'LABEL_MANAGER_VIEW', '2018-11-14 08:06:58.148', '2018-11-14 08:06:58.134');
INSERT INTO `security_group_permission` VALUES ('FULLADMIN', 'MANUFACTURING_ADMIN', '2018-11-14 08:06:58.339', '2018-11-14 08:06:58.337');
INSERT INTO `security_group_permission` VALUES ('FULLADMIN', 'MARKETING_ADMIN', '2018-11-14 08:06:58.972', '2018-11-14 08:06:58.969');
INSERT INTO `security_group_permission` VALUES ('FULLADMIN', 'PERIOD_MAINT', '2018-11-14 08:06:58.157', '2018-11-14 08:06:58.134');
INSERT INTO `security_group_permission` VALUES ('FULLADMIN', 'PORTALPAGE_ADMIN', '2018-11-14 08:06:58.049', '2018-11-14 08:06:58.034');
INSERT INTO `security_group_permission` VALUES ('FULLADMIN', 'SERVER_STATS_VIEW', '2018-11-14 08:06:58.142', '2018-11-14 08:06:58.134');
INSERT INTO `security_group_permission` VALUES ('FULLADMIN', 'SERVICE_INVOKE_ANY', '2018-11-14 08:06:58.057', '2018-11-14 08:06:58.055');
INSERT INTO `security_group_permission` VALUES ('FULLADMIN', 'SERVICE_JM_LOCK', '2018-11-14 08:06:58.154', '2018-11-14 08:06:58.134');
INSERT INTO `security_group_permission` VALUES ('FULLADMIN', 'SERVICE_MAINT', '2018-11-14 08:06:58.153', '2018-11-14 08:06:58.134');
INSERT INTO `security_group_permission` VALUES ('FULLADMIN', 'SETUP_ADMIN', '2018-11-14 08:06:59.024', '2018-11-14 08:06:59.023');
INSERT INTO `security_group_permission` VALUES ('FULLADMIN', 'SFA_ADMIN', '2018-11-14 08:06:58.993', '2018-11-14 08:06:58.969');
INSERT INTO `security_group_permission` VALUES ('FULLADMIN', 'TEMPEXPR_ADMIN', '2018-11-14 08:06:58.052', '2018-11-14 08:06:58.034');
INSERT INTO `security_group_permission` VALUES ('FULLADMIN', 'USERPREF_ADMIN', '2018-11-14 08:06:58.051', '2018-11-14 08:06:58.034');
INSERT INTO `security_group_permission` VALUES ('FULLADMIN', 'UTIL_CACHE_EDIT', '2018-11-14 08:06:58.170', '2018-11-14 08:06:58.134');
INSERT INTO `security_group_permission` VALUES ('FULLADMIN', 'UTIL_CACHE_VIEW', '2018-11-14 08:06:58.171', '2018-11-14 08:06:58.134');
INSERT INTO `security_group_permission` VALUES ('FULLADMIN', 'UTIL_DEBUG_EDIT', '2018-11-14 08:06:58.172', '2018-11-14 08:06:58.134');
INSERT INTO `security_group_permission` VALUES ('FULLADMIN', 'UTIL_DEBUG_VIEW', '2018-11-14 08:06:58.173', '2018-11-14 08:06:58.134');
INSERT INTO `security_group_permission` VALUES ('FULLADMIN', 'VISUALTHEME_ADMIN', '2018-11-14 08:06:58.047', '2018-11-14 08:06:58.034');
INSERT INTO `security_group_permission` VALUES ('FULLADMIN', 'WEBTOOLS_VIEW', '2018-11-14 08:06:58.138', '2018-11-14 08:06:58.134');
INSERT INTO `security_group_permission` VALUES ('VIEWADMIN', 'ARTIFACT_INFO_VIEW', '2018-11-14 08:06:58.147', '2018-11-14 08:06:58.134');
INSERT INTO `security_group_permission` VALUES ('VIEWADMIN', 'COMMON_VIEW', '2018-11-14 08:06:58.050', '2018-11-14 08:06:58.034');
INSERT INTO `security_group_permission` VALUES ('VIEWADMIN', 'ENTITY_DATA_VIEW', '2018-11-14 08:06:58.169', '2018-11-14 08:06:58.134');
INSERT INTO `security_group_permission` VALUES ('VIEWADMIN', 'FACILITY_VIEW', '2018-11-14 08:06:58.325', '2018-11-14 08:06:58.318');
INSERT INTO `security_group_permission` VALUES ('VIEWADMIN', 'LABEL_MANAGER_VIEW', '2018-11-14 08:06:58.150', '2018-11-14 08:06:58.134');
INSERT INTO `security_group_permission` VALUES ('VIEWADMIN', 'MANUFACTURING_VIEW', '2018-11-14 08:06:58.344', '2018-11-14 08:06:58.337');
INSERT INTO `security_group_permission` VALUES ('VIEWADMIN', 'MARKETING_VIEW', '2018-11-14 08:06:58.989', '2018-11-14 08:06:58.969');
INSERT INTO `security_group_permission` VALUES ('VIEWADMIN', 'SERVER_STATS_VIEW', '2018-11-14 08:06:58.144', '2018-11-14 08:06:58.134');
INSERT INTO `security_group_permission` VALUES ('VIEWADMIN', 'SFA_VIEW', '2018-11-14 08:06:58.998', '2018-11-14 08:06:58.969');
INSERT INTO `security_group_permission` VALUES ('VIEWADMIN', 'UTIL_CACHE_VIEW', '2018-11-14 08:06:58.178', '2018-11-14 08:06:58.134');
INSERT INTO `security_group_permission` VALUES ('VIEWADMIN', 'UTIL_DEBUG_VIEW', '2018-11-14 08:06:58.179', '2018-11-14 08:06:58.134');
INSERT INTO `security_group_permission` VALUES ('VIEWADMIN', 'WEBTOOLS_VIEW', '2018-11-14 08:06:58.141', '2018-11-14 08:06:58.134');

-- ----------------------------
-- Table structure for security_permission
-- ----------------------------
DROP TABLE IF EXISTS `security_permission`;
CREATE TABLE `security_permission`  (
  `id` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_at` datetime(3) NULL DEFAULT NULL,
  `updated_at` datetime(3) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of security_permission
-- ----------------------------
INSERT INTO `security_permission` VALUES ('access', 'Base ACCESS permission', '2018-11-14 09:16:53.810', '2018-11-14 09:16:53.177');
INSERT INTO `security_permission` VALUES ('ACCOUNTING_ADMIN', 'ALL operations in the Accounting Manager.', '2018-11-14 09:18:44.328', '2018-11-14 09:18:44.098');
INSERT INTO `security_permission` VALUES ('ACCOUNTING_COMM_VIEW', 'View commission rates', '2018-11-14 09:18:44.332', '2018-11-14 09:18:44.098');
INSERT INTO `security_permission` VALUES ('ACCOUNTING_CREATE', 'Create operations in the Accounting Manager.', '2018-11-14 09:18:44.192', '2018-11-14 09:18:44.098');
INSERT INTO `security_permission` VALUES ('ACCOUNTING_DELETE', 'Delete operations in the Accounting Manager.', '2018-11-14 09:18:44.327', '2018-11-14 09:18:44.098');
INSERT INTO `security_permission` VALUES ('ACCOUNTING_PRINT_CHECKS', 'Print checks.', '2018-11-14 09:18:44.335', '2018-11-14 09:18:44.098');
INSERT INTO `security_permission` VALUES ('ACCOUNTING_UPDATE', 'Update operations in the Accounting Manager.', '2018-11-14 09:18:44.195', '2018-11-14 09:18:44.098');
INSERT INTO `security_permission` VALUES ('ACCOUNTING_VIEW', 'View operations in the Accounting Manager.', '2018-11-14 09:18:44.191', '2018-11-14 09:18:44.098');
INSERT INTO `security_permission` VALUES ('ACCTG_ATX_ADMIN', 'ALL operations involving general ledger accounting transactions and entries.', '2018-11-14 09:18:44.345', '2018-11-14 09:18:44.098');
INSERT INTO `security_permission` VALUES ('ACCTG_ATX_CREATE', 'Create general ledger accounting transaction and entries.', '2018-11-14 09:18:44.346', '2018-11-14 09:18:44.098');
INSERT INTO `security_permission` VALUES ('ACCTG_ATX_DELETE', 'Delete general ledger accounting transaction and entries.', '2018-11-14 09:18:44.450', '2018-11-14 09:18:44.098');
INSERT INTO `security_permission` VALUES ('ACCTG_ATX_UPDATE', 'Update general ledger accounting transaction and entries.', '2018-11-14 09:18:44.449', '2018-11-14 09:18:44.098');
INSERT INTO `security_permission` VALUES ('ACCTG_ATX_VIEW', 'View general ledger accounting transaction and entries.', '2018-11-14 09:18:44.451', '2018-11-14 09:18:44.098');
INSERT INTO `security_permission` VALUES ('ACCTG_FX_UPDATE', 'Set foreign exchange rates', '2018-11-14 09:18:44.344', '2018-11-14 09:18:44.098');
INSERT INTO `security_permission` VALUES ('ACCTG_PREF_ADMIN', 'ALL organization accounting preferences operations', '2018-11-14 09:18:44.343', '2018-11-14 09:18:44.098');
INSERT INTO `security_permission` VALUES ('ACCTG_PREF_CREATE', 'Set organization accounting preferences', '2018-11-14 09:18:44.338', '2018-11-14 09:18:44.098');
INSERT INTO `security_permission` VALUES ('ACCTG_PREF_DELETE', 'Delete organization accounting preferences', '2018-11-14 09:18:44.340', '2018-11-14 09:18:44.098');
INSERT INTO `security_permission` VALUES ('ACCTG_PREF_UPDATE', 'Update organization accounting preferences', '2018-11-14 09:18:44.339', '2018-11-14 09:18:44.098');
INSERT INTO `security_permission` VALUES ('ACCTG_PREF_VIEW', 'View organization accounting preferences', '2018-11-14 09:18:44.336', '2018-11-14 09:18:44.098');
INSERT INTO `security_permission` VALUES ('ARTIFACT_INFO_VIEW', 'View the Artifact Info pages.', '2018-11-14 09:17:37.228', '2018-11-14 09:17:37.150');
INSERT INTO `security_permission` VALUES ('ASSETMAINT_ADMIN', 'ALL Asset Maintenance operations.', '2018-11-14 09:19:05.824', '2018-11-14 09:19:05.783');
INSERT INTO `security_permission` VALUES ('ASSETMAINT_CREATE', 'Asset Maintenance Create operations.', '2018-11-14 09:19:05.826', '2018-11-14 09:19:05.783');
INSERT INTO `security_permission` VALUES ('ASSETMAINT_DELETE', 'Asset Maintenance Delete operations.', '2018-11-14 09:19:05.828', '2018-11-14 09:19:05.783');
INSERT INTO `security_permission` VALUES ('ASSETMAINT_UPDATE', 'Asset Maintenance Update operations.', '2018-11-14 09:19:05.827', '2018-11-14 09:19:05.783');
INSERT INTO `security_permission` VALUES ('ASSETMAINT_VIEW', 'Asset Maintenance View permission.', '2018-11-14 09:19:05.825', '2018-11-14 09:19:05.783');
INSERT INTO `security_permission` VALUES ('BI_ADMIN', 'ALL Business Intelligence operations.', '2018-11-14 09:19:43.192', '2018-11-14 09:19:43.012');
INSERT INTO `security_permission` VALUES ('BI_VIEW', 'Business Intelligence View permission.', '2018-11-14 09:19:43.193', '2018-11-14 09:19:43.012');
INSERT INTO `security_permission` VALUES ('CATALOG_ADMIN', 'ALL operations in the Catalog Manager.', '2018-11-14 09:18:22.148', '2018-11-14 09:18:22.082');
INSERT INTO `security_permission` VALUES ('CATALOG_CREATE', 'Create operations in the Catalog Manager.', '2018-11-14 09:18:22.144', '2018-11-14 09:18:22.082');
INSERT INTO `security_permission` VALUES ('CATALOG_DELETE', 'Delete operations in the Catalog Manager.', '2018-11-14 09:18:22.147', '2018-11-14 09:18:22.082');
INSERT INTO `security_permission` VALUES ('CATALOG_PRICE_MAINT', 'To be able to maintain product prices, promotions, and price rules.', '2018-11-14 09:18:22.152', '2018-11-14 09:18:22.082');
INSERT INTO `security_permission` VALUES ('CATALOG_PURCHASE_ALLOW', 'Allow create/update of \'Purchase Allow\' in the Catalog Manager.', '2018-11-14 09:18:22.157', '2018-11-14 09:18:22.082');
INSERT INTO `security_permission` VALUES ('CATALOG_ROLE_CREATE', 'Limited Create operations in the Catalog Manager.', '2018-11-14 09:18:22.149', '2018-11-14 09:18:22.082');
INSERT INTO `security_permission` VALUES ('CATALOG_ROLE_DELETE', 'Limited Delete operations in the Catalog Manager.', '2018-11-14 09:18:22.151', '2018-11-14 09:18:22.082');
INSERT INTO `security_permission` VALUES ('CATALOG_ROLE_UPDATE', 'Limited Update operations in the Catalog Manager.', '2018-11-14 09:18:22.150', '2018-11-14 09:18:22.082');
INSERT INTO `security_permission` VALUES ('CATALOG_UPDATE', 'Update operations in the Catalog Manager.', '2018-11-14 09:18:22.146', '2018-11-14 09:18:22.082');
INSERT INTO `security_permission` VALUES ('CATALOG_VIEW', 'View operations in the Catalog Manager.', '2018-11-14 09:18:22.143', '2018-11-14 09:18:22.082');
INSERT INTO `security_permission` VALUES ('CATALOG_VIEW_ALLOW', 'Allow create/update of \'View Allow\' in the Catalog Manager.', '2018-11-14 09:18:22.153', '2018-11-14 09:18:22.082');
INSERT INTO `security_permission` VALUES ('COMMONEXT_PUBLMSG', 'Create public system information messages.', '2018-11-14 09:19:02.423', '2018-11-14 09:19:02.342');
INSERT INTO `security_permission` VALUES ('COMMON_ADMIN', 'Admin operations in the Common Component.', '2018-11-14 09:16:55.517', '2018-11-14 09:16:55.475');
INSERT INTO `security_permission` VALUES ('COMMON_CREATE', 'Create operations in the Common Component.', '2018-11-14 09:16:55.519', '2018-11-14 09:16:55.475');
INSERT INTO `security_permission` VALUES ('COMMON_DELETE', 'Delete operations in the Common Component.', '2018-11-14 09:16:55.523', '2018-11-14 09:16:55.475');
INSERT INTO `security_permission` VALUES ('COMMON_UPDATE', 'Update operations in the Common Component.', '2018-11-14 09:16:55.520', '2018-11-14 09:16:55.475');
INSERT INTO `security_permission` VALUES ('COMMON_VIEW', 'View operations in the Common Component.', '2018-11-14 09:16:55.513', '2018-11-14 09:16:55.475');
INSERT INTO `security_permission` VALUES ('CONTENTMGR_ADMIN', 'ALL operations in the Content Manager.', '2018-11-14 09:18:09.738', '2018-11-14 09:18:09.548');
INSERT INTO `security_permission` VALUES ('CONTENTMGR_CREATE', 'Create operations in the Content Manager.', '2018-11-14 09:18:09.735', '2018-11-14 09:18:09.548');
INSERT INTO `security_permission` VALUES ('CONTENTMGR_DELETE', 'Delete operations in the Content Manager.', '2018-11-14 09:18:09.737', '2018-11-14 09:18:09.548');
INSERT INTO `security_permission` VALUES ('CONTENTMGR_ROLE_CREATE', 'Limited Create operations in the Content Manager.', '2018-11-14 09:18:09.740', '2018-11-14 09:18:09.548');
INSERT INTO `security_permission` VALUES ('CONTENTMGR_ROLE_DELETE', 'Limited Delete operations in the Content Manager.', '2018-11-14 09:18:09.742', '2018-11-14 09:18:09.548');
INSERT INTO `security_permission` VALUES ('CONTENTMGR_ROLE_UPDATE', 'Limited Update operations in the Content Manager.', '2018-11-14 09:18:09.741', '2018-11-14 09:18:09.548');
INSERT INTO `security_permission` VALUES ('CONTENTMGR_ROLE_VIEW', 'Limited View operations in the Content Manager.', '2018-11-14 09:18:09.739', '2018-11-14 09:18:09.548');
INSERT INTO `security_permission` VALUES ('CONTENTMGR_UPDATE', 'Update operations in the Content Manager.', '2018-11-14 09:18:09.736', '2018-11-14 09:18:09.548');
INSERT INTO `security_permission` VALUES ('CONTENTMGR_VIEW', 'View operations in the Content Manager.', '2018-11-14 09:18:09.734', '2018-11-14 09:18:09.548');
INSERT INTO `security_permission` VALUES ('create', 'Base CREATE permission', '2018-11-14 09:16:53.813', '2018-11-14 09:16:53.177');
INSERT INTO `security_permission` VALUES ('DATAFILE_MAINT', 'Use the Data File Maintenance pages.', '2018-11-14 09:17:37.230', '2018-11-14 09:17:37.150');
INSERT INTO `security_permission` VALUES ('delete', 'Base DELETE permission', '2018-11-14 09:16:53.817', '2018-11-14 09:16:53.177');
INSERT INTO `security_permission` VALUES ('EBAY_ADMIN', 'All operations in the eBay application.', '2018-11-14 09:19:23.321', '2018-11-14 09:19:23.190');
INSERT INTO `security_permission` VALUES ('EBAY_VIEW', 'View operations in the eBay application.', '2018-11-14 09:19:23.322', '2018-11-14 09:19:23.190');
INSERT INTO `security_permission` VALUES ('EMPLOYEE_VIEW', 'Employee can check the status of his requests and trainings assigned to him with this permission.', '2018-11-14 09:21:24.771', '2018-11-14 09:21:23.379');
INSERT INTO `security_permission` VALUES ('ENTITY_DATA_ADMIN', 'ALL with the Entity Data Maintenance pages.', '2018-11-14 09:17:37.240', '2018-11-14 09:17:37.150');
INSERT INTO `security_permission` VALUES ('ENTITY_DATA_CREATE', 'Create with the Entity Data Maintenance pages.', '2018-11-14 09:17:37.237', '2018-11-14 09:17:37.150');
INSERT INTO `security_permission` VALUES ('ENTITY_DATA_DELETE', 'Delete with the Entity Data Maintenance pages.', '2018-11-14 09:17:37.239', '2018-11-14 09:17:37.150');
INSERT INTO `security_permission` VALUES ('ENTITY_DATA_UPDATE', 'Update with the Entity Data Maintenance pages.', '2018-11-14 09:17:37.238', '2018-11-14 09:17:37.150');
INSERT INTO `security_permission` VALUES ('ENTITY_DATA_VIEW', 'View with the Entity Data Maintenance pages.', '2018-11-14 09:17:37.236', '2018-11-14 09:17:37.150');
INSERT INTO `security_permission` VALUES ('ENTITY_MAINT', 'Use the Entity Maintenance pages.', '2018-11-14 09:17:37.235', '2018-11-14 09:17:37.150');
INSERT INTO `security_permission` VALUES ('ENTITY_SYNC_ADMIN', 'Use the Entity Sync Admin pages.', '2018-11-14 09:17:36.945', '2018-11-14 09:17:36.943');
INSERT INTO `security_permission` VALUES ('ENUM_STATUS_MAINT', 'Use the Enum and Status Maintenance pages.', '2018-11-14 09:17:37.234', '2018-11-14 09:17:37.150');
INSERT INTO `security_permission` VALUES ('EXAMPLE_ADMIN', 'ALL operations in the Example Management Screens.', '2018-11-14 09:19:44.791', '2018-11-14 09:19:44.603');
INSERT INTO `security_permission` VALUES ('EXAMPLE_CREATE', 'Create operations in the Example Management Screens.', '2018-11-14 09:19:44.788', '2018-11-14 09:19:44.603');
INSERT INTO `security_permission` VALUES ('EXAMPLE_DELETE', 'Delete operations in the Example Management Screens.', '2018-11-14 09:19:44.790', '2018-11-14 09:19:44.603');
INSERT INTO `security_permission` VALUES ('EXAMPLE_UPDATE', 'Update operations in the Example Management Screens.', '2018-11-14 09:19:44.789', '2018-11-14 09:19:44.603');
INSERT INTO `security_permission` VALUES ('EXAMPLE_VIEW', 'View operations in the Example Management Screens.', '2018-11-14 09:19:44.787', '2018-11-14 09:19:44.603');
INSERT INTO `security_permission` VALUES ('FACILITY_ADMIN', 'ALL operations in the Facility Manager.', '2018-11-14 09:18:22.534', '2018-11-14 09:18:22.453');
INSERT INTO `security_permission` VALUES ('FACILITY_CREATE', 'Create operations in the Facility Manager.', '2018-11-14 09:18:22.531', '2018-11-14 09:18:22.453');
INSERT INTO `security_permission` VALUES ('FACILITY_DELETE', 'Delete operations in the Facility Manager.', '2018-11-14 09:18:22.533', '2018-11-14 09:18:22.453');
INSERT INTO `security_permission` VALUES ('FACILITY_ROLE_UPDATE', 'Limited update operations in the Facility Manager.', '2018-11-14 09:18:22.536', '2018-11-14 09:18:22.453');
INSERT INTO `security_permission` VALUES ('FACILITY_ROLE_VIEW', 'Limited view operations in the Facility Manager.', '2018-11-14 09:18:22.535', '2018-11-14 09:18:22.453');
INSERT INTO `security_permission` VALUES ('FACILITY_UPDATE', 'Update operations in the Facility Manager.', '2018-11-14 09:18:22.532', '2018-11-14 09:18:22.453');
INSERT INTO `security_permission` VALUES ('FACILITY_VIEW', 'View operations in the Facility Manager.', '2018-11-14 09:18:22.530', '2018-11-14 09:18:22.453');
INSERT INTO `security_permission` VALUES ('HHFACILITY_ADMIN', 'ALL hh facility operations.', '2018-11-14 09:19:05.532', '2018-11-14 09:19:05.434');
INSERT INTO `security_permission` VALUES ('HHFACILITY_VIEW', 'hh facility View permission.', '2018-11-14 09:19:05.533', '2018-11-14 09:19:05.434');
INSERT INTO `security_permission` VALUES ('HUMANRES_ADMIN', 'All operations in the HumanRes Manager.', '2018-11-14 09:18:49.418', '2018-11-14 09:18:49.341');
INSERT INTO `security_permission` VALUES ('HUMANRES_APPROVE', 'Approver can update the IJP approval status with this permission.', '2018-11-14 09:18:49.423', '2018-11-14 09:18:49.341');
INSERT INTO `security_permission` VALUES ('HUMANRES_CREATE', 'Create operations in the HumanRes Manager.', '2018-11-14 09:18:49.420', '2018-11-14 09:18:49.341');
INSERT INTO `security_permission` VALUES ('HUMANRES_DELETE', 'Delete operations in the HumanRes Manager.', '2018-11-14 09:18:49.422', '2018-11-14 09:18:49.341');
INSERT INTO `security_permission` VALUES ('HUMANRES_UPDATE', 'Update operations in the HumanRes Manager.', '2018-11-14 09:18:49.421', '2018-11-14 09:18:49.341');
INSERT INTO `security_permission` VALUES ('HUMANRES_VIEW', 'View operations in the HumanRes Manager.', '2018-11-14 09:18:49.419', '2018-11-14 09:18:49.341');
INSERT INTO `security_permission` VALUES ('IMAGE_MANAGEMENT_ADMIN', 'All operations in the Image Management.', '2018-11-14 09:18:22.161', '2018-11-14 09:18:22.082');
INSERT INTO `security_permission` VALUES ('IMAGE_MANAGEMENT_APPROVE', 'Approve photos in the Image Management.', '2018-11-14 09:18:22.162', '2018-11-14 09:18:22.082');
INSERT INTO `security_permission` VALUES ('IMAGE_MANAGEMENT_UPLOAD', 'Upload photos in the Image Management.', '2018-11-14 09:18:22.163', '2018-11-14 09:18:22.082');
INSERT INTO `security_permission` VALUES ('LABEL_MANAGER_VIEW', 'View the Labels Info pages.', '2018-11-14 09:17:37.229', '2018-11-14 09:17:37.150');
INSERT INTO `security_permission` VALUES ('MANUAL_PAYMENT', 'Manual Payment Transaction.', '2018-11-14 09:18:44.331', '2018-11-14 09:18:44.098');
INSERT INTO `security_permission` VALUES ('MANUFACTURING_ADMIN', 'ALL operations in the Manufacturing Manager.', '2018-11-14 09:18:24.978', '2018-11-14 09:18:24.877');
INSERT INTO `security_permission` VALUES ('MANUFACTURING_CREATE', 'Create operations in the Manufacturing Manager.', '2018-11-14 09:18:24.975', '2018-11-14 09:18:24.877');
INSERT INTO `security_permission` VALUES ('MANUFACTURING_DELETE', 'Delete operations in the Manufacturing Manager.', '2018-11-14 09:18:24.977', '2018-11-14 09:18:24.877');
INSERT INTO `security_permission` VALUES ('MANUFACTURING_UPDATE', 'Update operations in the Manufacturing Manager.', '2018-11-14 09:18:24.976', '2018-11-14 09:18:24.877');
INSERT INTO `security_permission` VALUES ('MANUFACTURING_VIEW', 'View operations in the Manufacturing Manager.', '2018-11-14 09:18:24.974', '2018-11-14 09:18:24.877');
INSERT INTO `security_permission` VALUES ('MARKETING_ADMIN', 'ALL operations in the Marketing Manager.', '2018-11-14 09:18:59.109', '2018-11-14 09:18:59.087');
INSERT INTO `security_permission` VALUES ('MARKETING_CREATE', 'Create operations in the Marketing Manager.', '2018-11-14 09:18:59.106', '2018-11-14 09:18:59.087');
INSERT INTO `security_permission` VALUES ('MARKETING_DELETE', 'Delete operations in the Marketing Manager.', '2018-11-14 09:18:59.108', '2018-11-14 09:18:59.087');
INSERT INTO `security_permission` VALUES ('MARKETING_ROLE_UPDATE', 'Limited update operations in the Marketing Manager.', '2018-11-14 09:18:59.111', '2018-11-14 09:18:59.087');
INSERT INTO `security_permission` VALUES ('MARKETING_ROLE_VIEW', 'Limited view operations in the Marketing Manager.', '2018-11-14 09:18:59.110', '2018-11-14 09:18:59.087');
INSERT INTO `security_permission` VALUES ('MARKETING_UPDATE', 'Update operations in the Marketing Manager.', '2018-11-14 09:18:59.107', '2018-11-14 09:18:59.087');
INSERT INTO `security_permission` VALUES ('MARKETING_VIEW', 'View operations in the Marketing Manager.', '2018-11-14 09:18:59.101', '2018-11-14 09:18:59.087');
INSERT INTO `security_permission` VALUES ('MYPORTALBASE_ADMIN', 'ALL MyPortal base operations', '2018-11-14 09:19:27.138', '2018-11-14 09:19:26.931');
INSERT INTO `security_permission` VALUES ('MYPORTALBASE_VIEW', 'MyPortal Base View permission.', '2018-11-14 09:19:27.139', '2018-11-14 09:19:26.931');
INSERT INTO `security_permission` VALUES ('MYPORTAL_CUSTOMER', 'Use the customer screens in MYPORTAL.', '2018-11-14 09:23:44.815', '2018-11-14 09:23:44.702');
INSERT INTO `security_permission` VALUES ('MYPORTAL_EMPL-NOEML', 'Usage of the employee screens in MYPORTAL: projectmanager and internal notes.', '2018-11-14 09:23:44.797', '2018-11-14 09:23:44.702');
INSERT INTO `security_permission` VALUES ('MYPORTAL_EMPLOYEE', 'Use the employee screens in myportal.', '2018-11-14 09:23:44.775', '2018-11-14 09:23:44.702');
INSERT INTO `security_permission` VALUES ('OFBTOOLS_VIEW', 'Permission to access the Stock OFBiz Manager Applications.', '2018-11-14 09:16:53.818', '2018-11-14 09:16:53.177');
INSERT INTO `security_permission` VALUES ('ORDERMGR_4C_CREATE', 'Create sales forecasts in the Order Manager.', '2018-11-14 09:18:57.764', '2018-11-14 09:18:57.680');
INSERT INTO `security_permission` VALUES ('ORDERMGR_4C_UPDATE', 'Update sales forecasts in the Order Manager.', '2018-11-14 09:18:57.765', '2018-11-14 09:18:57.680');
INSERT INTO `security_permission` VALUES ('ORDERMGR_ADMIN', 'ALL operations in the Order Manager.', '2018-11-14 09:18:57.747', '2018-11-14 09:18:57.680');
INSERT INTO `security_permission` VALUES ('ORDERMGR_CREATE', 'Create operations in the Order Manager.', '2018-11-14 09:18:57.744', '2018-11-14 09:18:57.680');
INSERT INTO `security_permission` VALUES ('ORDERMGR_CRQ_CREATE', 'Create Customer Requests in the Order Manager.', '2018-11-14 09:18:57.763', '2018-11-14 09:18:57.680');
INSERT INTO `security_permission` VALUES ('ORDERMGR_DELETE', 'Delete operations in the Order Manager.', '2018-11-14 09:18:57.746', '2018-11-14 09:18:57.680');
INSERT INTO `security_permission` VALUES ('ORDERMGR_NOTE', 'Create notes in the Order Manager.', '2018-11-14 09:18:57.752', '2018-11-14 09:18:57.680');
INSERT INTO `security_permission` VALUES ('ORDERMGR_PURCHASE_CREATE', 'Create purchase orders in the Order Manager.', '2018-11-14 09:18:57.758', '2018-11-14 09:18:57.680');
INSERT INTO `security_permission` VALUES ('ORDERMGR_PURCHASE_ENTRY', 'Purchase Order Entry in the Order Manager.', '2018-11-14 09:18:57.756', '2018-11-14 09:18:57.680');
INSERT INTO `security_permission` VALUES ('ORDERMGR_PURCHASE_VIEW', 'View purchase orders in the Order Manager.', '2018-11-14 09:18:57.757', '2018-11-14 09:18:57.680');
INSERT INTO `security_permission` VALUES ('ORDERMGR_QUOTE_PRICE', 'Quote price manager in the Order Manager.', '2018-11-14 09:18:57.762', '2018-11-14 09:18:57.680');
INSERT INTO `security_permission` VALUES ('ORDERMGR_RETURN', 'Process returns in the Order Manager.', '2018-11-14 09:18:57.753', '2018-11-14 09:18:57.680');
INSERT INTO `security_permission` VALUES ('ORDERMGR_ROLE_CREATE', 'Limited Create operations in the Order Manager.', '2018-11-14 09:18:57.749', '2018-11-14 09:18:57.680');
INSERT INTO `security_permission` VALUES ('ORDERMGR_ROLE_DELETE', 'Limited Delete operations in the Order Manager.', '2018-11-14 09:18:57.751', '2018-11-14 09:18:57.680');
INSERT INTO `security_permission` VALUES ('ORDERMGR_ROLE_UPDATE', 'Limited Update operations in the Order Manager.', '2018-11-14 09:18:57.750', '2018-11-14 09:18:57.680');
INSERT INTO `security_permission` VALUES ('ORDERMGR_ROLE_VIEW', 'Limited view operations in the Order Manager.', '2018-11-14 09:18:57.748', '2018-11-14 09:18:57.680');
INSERT INTO `security_permission` VALUES ('ORDERMGR_SALES_CREATE', 'Create sales orders for all stores in the Order Manager.', '2018-11-14 09:18:57.759', '2018-11-14 09:18:57.680');
INSERT INTO `security_permission` VALUES ('ORDERMGR_SALES_ENTRY', 'Sales Order Entry in the Order Manager.', '2018-11-14 09:18:57.754', '2018-11-14 09:18:57.680');
INSERT INTO `security_permission` VALUES ('ORDERMGR_SALES_PRICEMOD', 'Price change permission for sales orders.', '2018-11-14 09:18:57.755', '2018-11-14 09:18:57.680');
INSERT INTO `security_permission` VALUES ('ORDERMGR_SALES_UPDATE', 'Update sales orders for all stores in the Order Manager.', '2018-11-14 09:18:57.760', '2018-11-14 09:18:57.680');
INSERT INTO `security_permission` VALUES ('ORDERMGR_SEND_CONFIRMATION', 'Send order confirmation notification.', '2018-11-14 09:18:57.761', '2018-11-14 09:18:57.680');
INSERT INTO `security_permission` VALUES ('ORDERMGR_UPDATE', 'Update operations in the Order Manager.', '2018-11-14 09:18:57.745', '2018-11-14 09:18:57.680');
INSERT INTO `security_permission` VALUES ('ORDERMGR_VIEW', 'View operations in the Order Manager.', '2018-11-14 09:18:57.743', '2018-11-14 09:18:57.680');
INSERT INTO `security_permission` VALUES ('PARTYMGR_ADMIN', 'ALL operations in the Party Manager.', '2018-11-14 09:17:44.040', '2018-11-14 09:17:43.985');
INSERT INTO `security_permission` VALUES ('PARTYMGR_CME-EMAIL_CREATE', 'Can create Email communication events for logged-in user.', '2018-11-14 09:17:44.059', '2018-11-14 09:17:43.985');
INSERT INTO `security_permission` VALUES ('PARTYMGR_CME-EMAIL_DELETE', 'Can delete Email communication events for logged-in user.', '2018-11-14 09:17:44.061', '2018-11-14 09:17:43.985');
INSERT INTO `security_permission` VALUES ('PARTYMGR_CME-EMAIL_UPDATE', 'Can update Email communication events for logged-in user.', '2018-11-14 09:17:44.060', '2018-11-14 09:17:43.985');
INSERT INTO `security_permission` VALUES ('PARTYMGR_CME-NOTE_CREATE', 'Can create Internal note communication event for logged-in user.', '2018-11-14 09:17:44.062', '2018-11-14 09:17:43.985');
INSERT INTO `security_permission` VALUES ('PARTYMGR_CME_CREATE', 'Create communication event, any from/to party.', '2018-11-14 09:17:44.056', '2018-11-14 09:17:43.985');
INSERT INTO `security_permission` VALUES ('PARTYMGR_CME_DELETE', 'Delete communication event, any from/to party.', '2018-11-14 09:17:44.058', '2018-11-14 09:17:43.985');
INSERT INTO `security_permission` VALUES ('PARTYMGR_CME_UPDATE', 'Update communication event, any from/to party.', '2018-11-14 09:17:44.057', '2018-11-14 09:17:43.985');
INSERT INTO `security_permission` VALUES ('PARTYMGR_CREATE', 'Create operations in the Party Manager.', '2018-11-14 09:17:44.037', '2018-11-14 09:17:43.985');
INSERT INTO `security_permission` VALUES ('PARTYMGR_DELETE', 'Delete operations in the Party Manager.', '2018-11-14 09:17:44.039', '2018-11-14 09:17:43.985');
INSERT INTO `security_permission` VALUES ('PARTYMGR_GRP_UPDATE', 'Update PartyGroup or Person detail information.', '2018-11-14 09:17:44.043', '2018-11-14 09:17:43.985');
INSERT INTO `security_permission` VALUES ('PARTYMGR_NOTE', 'Create notes in the Party Manager.', '2018-11-14 09:17:44.041', '2018-11-14 09:17:43.985');
INSERT INTO `security_permission` VALUES ('PARTYMGR_PCM_CREATE', 'Create party contact mechs in the Party Manager.', '2018-11-14 09:17:44.049', '2018-11-14 09:17:43.985');
INSERT INTO `security_permission` VALUES ('PARTYMGR_PCM_DELETE', 'Delete party contact mechs in the Party Manager.', '2018-11-14 09:17:44.051', '2018-11-14 09:17:43.985');
INSERT INTO `security_permission` VALUES ('PARTYMGR_PCM_UPDATE', 'Update party contact mechs in the Party Manager.', '2018-11-14 09:17:44.050', '2018-11-14 09:17:43.985');
INSERT INTO `security_permission` VALUES ('PARTYMGR_QAL_CREATE', 'Create party quals in the Party Manager.', '2018-11-14 09:17:44.053', '2018-11-14 09:17:43.985');
INSERT INTO `security_permission` VALUES ('PARTYMGR_QAL_DELETE', 'Delete party quals in the Party Manager.', '2018-11-14 09:17:44.055', '2018-11-14 09:17:43.985');
INSERT INTO `security_permission` VALUES ('PARTYMGR_QAL_UPDATE', 'Update party quals in the Party Manager.', '2018-11-14 09:17:44.054', '2018-11-14 09:17:43.985');
INSERT INTO `security_permission` VALUES ('PARTYMGR_REL_CREATE', 'Create party relationships in the Party Manager.', '2018-11-14 09:17:44.044', '2018-11-14 09:17:43.985');
INSERT INTO `security_permission` VALUES ('PARTYMGR_REL_DELETE', 'Delete party relationships in the Party Manager.', '2018-11-14 09:17:44.046', '2018-11-14 09:17:43.985');
INSERT INTO `security_permission` VALUES ('PARTYMGR_REL_UPDATE', 'Update party relationships in the Party Manager.', '2018-11-14 09:17:44.045', '2018-11-14 09:17:43.985');
INSERT INTO `security_permission` VALUES ('PARTYMGR_ROLE_CREATE', 'Create party roles in the Party Manager.', '2018-11-14 09:17:44.047', '2018-11-14 09:17:43.985');
INSERT INTO `security_permission` VALUES ('PARTYMGR_ROLE_DELETE', 'Delete party roles in the Party Manager.', '2018-11-14 09:17:44.048', '2018-11-14 09:17:43.985');
INSERT INTO `security_permission` VALUES ('PARTYMGR_SRC_CREATE', 'Create party to data source relations.', '2018-11-14 09:17:44.052', '2018-11-14 09:17:43.985');
INSERT INTO `security_permission` VALUES ('PARTYMGR_STS_UPDATE', 'Update party status in the Party Manager.', '2018-11-14 09:17:44.042', '2018-11-14 09:17:43.985');
INSERT INTO `security_permission` VALUES ('PARTYMGR_UPDATE', 'Update operations in the Party Manager.', '2018-11-14 09:17:44.038', '2018-11-14 09:17:43.985');
INSERT INTO `security_permission` VALUES ('PARTYMGR_VIEW', 'View operations in the Party Manager.', '2018-11-14 09:17:44.036', '2018-11-14 09:17:43.985');
INSERT INTO `security_permission` VALUES ('PAYPROC_ADMIN', 'ALL operations in the Payment Processors Setup.', '2018-11-14 09:18:44.175', '2018-11-14 09:18:44.098');
INSERT INTO `security_permission` VALUES ('PAYPROC_CREATE', 'Create operations in the Payment Processors Setup.', '2018-11-14 09:18:44.172', '2018-11-14 09:18:44.098');
INSERT INTO `security_permission` VALUES ('PAYPROC_DELETE', 'Delete operations in the Payment Processors Setup.', '2018-11-14 09:18:44.173', '2018-11-14 09:18:44.098');
INSERT INTO `security_permission` VALUES ('PAYPROC_VIEW', 'View operations in the Payment Processors Setup.', '2018-11-14 09:18:44.171', '2018-11-14 09:18:44.098');
INSERT INTO `security_permission` VALUES ('PAY_INFO_ADMIN', 'ALL Payment Information Operations.', '2018-11-14 09:18:44.187', '2018-11-14 09:18:44.098');
INSERT INTO `security_permission` VALUES ('PAY_INFO_CREATE', 'Create Payment Information.', '2018-11-14 09:18:44.179', '2018-11-14 09:18:44.098');
INSERT INTO `security_permission` VALUES ('PAY_INFO_DELETE', 'Delete Payment Information.', '2018-11-14 09:18:44.184', '2018-11-14 09:18:44.098');
INSERT INTO `security_permission` VALUES ('PAY_INFO_UPDATE', 'Update Payment Information.', '2018-11-14 09:18:44.183', '2018-11-14 09:18:44.098');
INSERT INTO `security_permission` VALUES ('PAY_INFO_VIEW', 'View Payment Information.', '2018-11-14 09:18:44.176', '2018-11-14 09:18:44.098');
INSERT INTO `security_permission` VALUES ('PERIOD_MAINT', 'Use the Period Maintenance pages.', '2018-11-14 09:17:37.233', '2018-11-14 09:17:37.150');
INSERT INTO `security_permission` VALUES ('PORTALPAGE_ADMIN', 'Admin operations on Portal Pages.', '2018-11-14 09:16:55.537', '2018-11-14 09:16:55.475');
INSERT INTO `security_permission` VALUES ('PROJECTMGR_ADMIN', 'ALL operations in the Project Manager.', '2018-11-14 09:19:14.285', '2018-11-14 09:19:14.256');
INSERT INTO `security_permission` VALUES ('PROJECTMGR_ROLE_ADMIN', 'All admin operations in the Project Manager for a project/phase/task the user is member of.', '2018-11-14 09:19:14.287', '2018-11-14 09:19:14.256');
INSERT INTO `security_permission` VALUES ('PROJECTMGR_ROLE_TASK_CREATE', 'Be able to create a task (should be member of project)', '2018-11-14 09:19:14.290', '2018-11-14 09:19:14.256');
INSERT INTO `security_permission` VALUES ('PROJECTMGR_ROLE_TIMESHEET_CREATE', 'Be able to create a weekly timesheet for the loginid.', '2018-11-14 09:19:14.293', '2018-11-14 09:19:14.256');
INSERT INTO `security_permission` VALUES ('PROJECTMGR_ROLE_TIMESHEET_UPDATE', 'Be able to update(report) on an existing own timesheet', '2018-11-14 09:19:14.294', '2018-11-14 09:19:14.256');
INSERT INTO `security_permission` VALUES ('PROJECTMGR_ROLE_UPDATE', 'Update operations in the Project Manager for a project/phase/task the user is member of.', '2018-11-14 09:19:14.289', '2018-11-14 09:19:14.256');
INSERT INTO `security_permission` VALUES ('PROJECTMGR_ROLE_VIEW', 'All view operations in the Project Manager for a project/phase/task the user is member of.', '2018-11-14 09:19:14.288', '2018-11-14 09:19:14.256');
INSERT INTO `security_permission` VALUES ('PROJECTMGR_TIMESHEET_CREATE', 'Be able to create any weekly timesheet.', '2018-11-14 09:19:14.291', '2018-11-14 09:19:14.256');
INSERT INTO `security_permission` VALUES ('PROJECTMGR_TIMESHEET_UPDATE', 'Be able to update any weekly timesheet.', '2018-11-14 09:19:14.292', '2018-11-14 09:19:14.256');
INSERT INTO `security_permission` VALUES ('PROJECTMGR_VIEW', 'ALL View operations in the Project Manager(but can be limited by ROLE_VIEW)', '2018-11-14 09:19:14.286', '2018-11-14 09:19:14.256');
INSERT INTO `security_permission` VALUES ('read', 'Base READ permission', '2018-11-14 09:16:53.814', '2018-11-14 09:16:53.177');
INSERT INTO `security_permission` VALUES ('SCRUM_ADMIN', 'ALL operations in the SCRUM Component.', '2018-11-14 09:19:17.961', '2018-11-14 09:19:17.830');
INSERT INTO `security_permission` VALUES ('SCRUM_BILLING_ADMIN', 'Admin operations for Billing', '2018-11-14 09:19:18.005', '2018-11-14 09:19:17.830');
INSERT INTO `security_permission` VALUES ('SCRUM_BILLING_CREATE', 'Create operations for Billing', '2018-11-14 09:19:18.002', '2018-11-14 09:19:17.830');
INSERT INTO `security_permission` VALUES ('SCRUM_BILLING_DELETE', 'Delete operations for Billing', '2018-11-14 09:19:18.004', '2018-11-14 09:19:17.830');
INSERT INTO `security_permission` VALUES ('SCRUM_BILLING_UPDATE', 'Update operations for Billing', '2018-11-14 09:19:18.003', '2018-11-14 09:19:17.830');
INSERT INTO `security_permission` VALUES ('SCRUM_BILLING_VIEW', 'View operations for Billing', '2018-11-14 09:19:18.001', '2018-11-14 09:19:17.830');
INSERT INTO `security_permission` VALUES ('SCRUM_CREATE', 'Create operations in the SCRUM Component.', '2018-11-14 09:19:17.958', '2018-11-14 09:19:17.830');
INSERT INTO `security_permission` VALUES ('SCRUM_DAILY_CREATE', 'Create Daily Scrum Meeting Minute', '2018-11-14 09:19:17.993', '2018-11-14 09:19:17.830');
INSERT INTO `security_permission` VALUES ('SCRUM_DAILY_DELETE', 'Delete Daily Scrum Meeting Minute', '2018-11-14 09:19:17.995', '2018-11-14 09:19:17.830');
INSERT INTO `security_permission` VALUES ('SCRUM_DAILY_UPDATE', 'Update Daily Scrum Meeting Minute', '2018-11-14 09:19:17.994', '2018-11-14 09:19:17.830');
INSERT INTO `security_permission` VALUES ('SCRUM_DAILY_VIEW', 'View Daily Scrum Meeting Minute', '2018-11-14 09:19:17.992', '2018-11-14 09:19:17.830');
INSERT INTO `security_permission` VALUES ('SCRUM_DELETE', 'Delete operations in the SCRUM Component.', '2018-11-14 09:19:17.960', '2018-11-14 09:19:17.830');
INSERT INTO `security_permission` VALUES ('SCRUM_MEMBER_CREATE', 'Create member operations for Scrum', '2018-11-14 09:19:17.997', '2018-11-14 09:19:17.830');
INSERT INTO `security_permission` VALUES ('SCRUM_MEMBER_DELETE', 'Delete member operations for Scrum', '2018-11-14 09:19:17.999', '2018-11-14 09:19:17.830');
INSERT INTO `security_permission` VALUES ('SCRUM_MEMBER_ROLE_UPDATE', 'Update member operations for Scrum the user is member of.', '2018-11-14 09:19:18.000', '2018-11-14 09:19:17.830');
INSERT INTO `security_permission` VALUES ('SCRUM_MEMBER_UPDATE', 'Update member operations for Scrum', '2018-11-14 09:19:17.998', '2018-11-14 09:19:17.830');
INSERT INTO `security_permission` VALUES ('SCRUM_MEMBER_VIEW', 'View member operations for Scrum', '2018-11-14 09:19:17.996', '2018-11-14 09:19:17.830');
INSERT INTO `security_permission` VALUES ('SCRUM_PRODUCT_ADMIN', 'Admin operations for Product', '2018-11-14 09:19:17.972', '2018-11-14 09:19:17.830');
INSERT INTO `security_permission` VALUES ('SCRUM_PRODUCT_BACKLOG_ADMIN', 'Admin operations for Product Backlog', '2018-11-14 09:19:17.979', '2018-11-14 09:19:17.830');
INSERT INTO `security_permission` VALUES ('SCRUM_PRODUCT_BACKLOG_CREATE', 'Create operations for Product Backlog', '2018-11-14 09:19:17.976', '2018-11-14 09:19:17.830');
INSERT INTO `security_permission` VALUES ('SCRUM_PRODUCT_BACKLOG_DELETE', 'Delete operations for Product Backlog', '2018-11-14 09:19:17.978', '2018-11-14 09:19:17.830');
INSERT INTO `security_permission` VALUES ('SCRUM_PRODUCT_BACKLOG_UPDATE', 'Update operations for Product Backlog', '2018-11-14 09:19:17.977', '2018-11-14 09:19:17.830');
INSERT INTO `security_permission` VALUES ('SCRUM_PRODUCT_BACKLOG_VIEW', 'View operations for Product Backlog', '2018-11-14 09:19:17.975', '2018-11-14 09:19:17.830');
INSERT INTO `security_permission` VALUES ('SCRUM_PRODUCT_CREATE', 'Create operations for Product', '2018-11-14 09:19:17.969', '2018-11-14 09:19:17.830');
INSERT INTO `security_permission` VALUES ('SCRUM_PRODUCT_DELETE', 'Delete operations for Product', '2018-11-14 09:19:17.971', '2018-11-14 09:19:17.830');
INSERT INTO `security_permission` VALUES ('SCRUM_PRODUCT_ROLE_UPDATE', 'Limited update operations in the SCRUM Component.', '2018-11-14 09:19:17.974', '2018-11-14 09:19:17.830');
INSERT INTO `security_permission` VALUES ('SCRUM_PRODUCT_ROLE_VIEW', 'Limited view operations in the SCRUM Component.', '2018-11-14 09:19:17.973', '2018-11-14 09:19:17.830');
INSERT INTO `security_permission` VALUES ('SCRUM_PRODUCT_UPDATE', 'Update operations for Product', '2018-11-14 09:19:17.970', '2018-11-14 09:19:17.830');
INSERT INTO `security_permission` VALUES ('SCRUM_PRODUCT_VIEW', 'View operations for Product', '2018-11-14 09:19:17.968', '2018-11-14 09:19:17.830');
INSERT INTO `security_permission` VALUES ('SCRUM_PROJECT_CREATE', 'Create operations for Project', '2018-11-14 09:19:17.981', '2018-11-14 09:19:17.830');
INSERT INTO `security_permission` VALUES ('SCRUM_PROJECT_DELETE', 'Delete operations for Project', '2018-11-14 09:19:17.983', '2018-11-14 09:19:17.830');
INSERT INTO `security_permission` VALUES ('SCRUM_PROJECT_ROLE_ADMIN', 'All admin operations in the Scrum component for a project the user is member of.', '2018-11-14 09:19:17.965', '2018-11-14 09:19:17.830');
INSERT INTO `security_permission` VALUES ('SCRUM_PROJECT_ROLE_UPDATE', 'Update operations in the Scrum component for a project the user is member of.', '2018-11-14 09:19:17.967', '2018-11-14 09:19:17.830');
INSERT INTO `security_permission` VALUES ('SCRUM_PROJECT_ROLE_VIEW', 'All view operations in the Scrum component for a project the user is member of.', '2018-11-14 09:19:17.966', '2018-11-14 09:19:17.830');
INSERT INTO `security_permission` VALUES ('SCRUM_PROJECT_UPDATE', 'Update operations for Project', '2018-11-14 09:19:17.982', '2018-11-14 09:19:17.830');
INSERT INTO `security_permission` VALUES ('SCRUM_PROJECT_VIEW', 'View operations for Project', '2018-11-14 09:19:17.980', '2018-11-14 09:19:17.830');
INSERT INTO `security_permission` VALUES ('SCRUM_ROLE_ADMIN', 'All admin operations in the Scrum component for a project/sprint/task the user is member of.', '2018-11-14 09:19:17.962', '2018-11-14 09:19:17.830');
INSERT INTO `security_permission` VALUES ('SCRUM_ROLE_TIMESHEET_CREATE', 'Be able to create a weekly timesheet for the loginid.', '2018-11-14 09:19:18.354', '2018-11-14 09:19:17.830');
INSERT INTO `security_permission` VALUES ('SCRUM_ROLE_TIMESHEET_UPDATE', 'Be able to update(report) on an existing own timesheet', '2018-11-14 09:19:18.355', '2018-11-14 09:19:17.830');
INSERT INTO `security_permission` VALUES ('SCRUM_ROLE_UPDATE', 'Update operations in the Scrum component for a project/sprint/task the user is member of.', '2018-11-14 09:19:17.964', '2018-11-14 09:19:17.830');
INSERT INTO `security_permission` VALUES ('SCRUM_ROLE_VIEW', 'All view operations in the Scrum component for a project/sprint/task the user is member of.', '2018-11-14 09:19:17.963', '2018-11-14 09:19:17.830');
INSERT INTO `security_permission` VALUES ('SCRUM_SPRINT_CREATE', 'Create operations for Sprint', '2018-11-14 09:19:17.985', '2018-11-14 09:19:17.830');
INSERT INTO `security_permission` VALUES ('SCRUM_SPRINT_DELETE', 'Delete operations for Sprint', '2018-11-14 09:19:17.987', '2018-11-14 09:19:17.830');
INSERT INTO `security_permission` VALUES ('SCRUM_SPRINT_UPDATE', 'Update operations for Sprint', '2018-11-14 09:19:17.986', '2018-11-14 09:19:17.830');
INSERT INTO `security_permission` VALUES ('SCRUM_SPRINT_VIEW', 'View operations for Sprint', '2018-11-14 09:19:17.984', '2018-11-14 09:19:17.830');
INSERT INTO `security_permission` VALUES ('SCRUM_TASK_CREATE', 'Create operations for Task', '2018-11-14 09:19:17.989', '2018-11-14 09:19:17.830');
INSERT INTO `security_permission` VALUES ('SCRUM_TASK_DELETE', 'Delete operations for Task', '2018-11-14 09:19:17.991', '2018-11-14 09:19:17.830');
INSERT INTO `security_permission` VALUES ('SCRUM_TASK_UPDATE', 'Update operations for Task', '2018-11-14 09:19:17.990', '2018-11-14 09:19:17.830');
INSERT INTO `security_permission` VALUES ('SCRUM_TASK_VIEW', 'View operations for Task', '2018-11-14 09:19:17.988', '2018-11-14 09:19:17.830');
INSERT INTO `security_permission` VALUES ('SCRUM_TEST_ADMIN', 'All Admin Test operations for Scrum', '2018-11-14 09:19:18.006', '2018-11-14 09:19:17.830');
INSERT INTO `security_permission` VALUES ('SCRUM_TEST_CREATE', 'Create Test operations for Scrum', '2018-11-14 09:19:18.343', '2018-11-14 09:19:17.830');
INSERT INTO `security_permission` VALUES ('SCRUM_TEST_DELETE', 'Delete Test operations for Scrum', '2018-11-14 09:19:18.350', '2018-11-14 09:19:17.830');
INSERT INTO `security_permission` VALUES ('SCRUM_TEST_UPDATE', 'Update Test operations for Scrum', '2018-11-14 09:19:18.348', '2018-11-14 09:19:17.830');
INSERT INTO `security_permission` VALUES ('SCRUM_TEST_VIEW', 'View Test operations for Scrum', '2018-11-14 09:19:18.007', '2018-11-14 09:19:17.830');
INSERT INTO `security_permission` VALUES ('SCRUM_TIMESHEET_CREATE', 'Be able to create any weekly timesheet.', '2018-11-14 09:19:18.352', '2018-11-14 09:19:17.830');
INSERT INTO `security_permission` VALUES ('SCRUM_TIMESHEET_UPDATE', 'Be able to update any weekly timesheet.', '2018-11-14 09:19:18.353', '2018-11-14 09:19:17.830');
INSERT INTO `security_permission` VALUES ('SCRUM_UPDATE', 'Update operations in the SCRUM Component.', '2018-11-14 09:19:17.959', '2018-11-14 09:19:17.830');
INSERT INTO `security_permission` VALUES ('SCRUM_VIEW', 'View operations in the SCRUM Component.', '2018-11-14 09:19:17.957', '2018-11-14 09:19:17.830');
INSERT INTO `security_permission` VALUES ('SECURITY_ADMIN', 'ALL operations in the Security Management Screens.', '2018-11-14 09:17:44.067', '2018-11-14 09:17:43.985');
INSERT INTO `security_permission` VALUES ('SECURITY_CREATE', 'Create operations in the Security Management Screens.', '2018-11-14 09:17:44.064', '2018-11-14 09:17:43.985');
INSERT INTO `security_permission` VALUES ('SECURITY_DELETE', 'Delete operations in the Security Management Screens.', '2018-11-14 09:17:44.066', '2018-11-14 09:17:43.985');
INSERT INTO `security_permission` VALUES ('SECURITY_UPDATE', 'Update operations in the Security Management Screens.', '2018-11-14 09:17:44.065', '2018-11-14 09:17:43.985');
INSERT INTO `security_permission` VALUES ('SECURITY_VIEW', 'View operations in the Security Management Screens.', '2018-11-14 09:17:44.063', '2018-11-14 09:17:43.985');
INSERT INTO `security_permission` VALUES ('SEND_CONTROL_APPLET', 'Send to the Control Applet.', '2018-11-14 09:18:09.743', '2018-11-14 09:18:09.548');
INSERT INTO `security_permission` VALUES ('SERVER_STATS_VIEW', 'View the Server Statistics pages.', '2018-11-14 09:17:37.227', '2018-11-14 09:17:37.150');
INSERT INTO `security_permission` VALUES ('SERVICE_INVOKE_ANY', 'Permission to invoke any service remotely.', '2018-11-14 09:17:36.406', '2018-11-14 09:17:36.360');
INSERT INTO `security_permission` VALUES ('SERVICE_JM_LOCK', 'Edit the job manager lock on the Service Maintenance pages.', '2018-11-14 09:17:37.232', '2018-11-14 09:17:37.150');
INSERT INTO `security_permission` VALUES ('SERVICE_MAINT', 'Use the Service Maintenance pages.', '2018-11-14 09:17:37.231', '2018-11-14 09:17:37.150');
INSERT INTO `security_permission` VALUES ('SETUP_ADMIN', 'ALL OFBiz Setup operations.', '2018-11-14 09:19:04.774', '2018-11-14 09:19:04.653');
INSERT INTO `security_permission` VALUES ('SETUP_VIEW', 'OFBiz Setup View permission.', '2018-11-14 09:19:04.775', '2018-11-14 09:19:04.653');
INSERT INTO `security_permission` VALUES ('SFA_ADMIN', 'ALL operations in the SFA Manager.', '2018-11-14 09:18:59.116', '2018-11-14 09:18:59.087');
INSERT INTO `security_permission` VALUES ('SFA_CREATE', 'Create operations in the SFA Manager.', '2018-11-14 09:18:59.113', '2018-11-14 09:18:59.087');
INSERT INTO `security_permission` VALUES ('SFA_DELETE', 'Delete operations in the SFA Manager.', '2018-11-14 09:18:59.115', '2018-11-14 09:18:59.087');
INSERT INTO `security_permission` VALUES ('SFA_ROLE_UPDATE', 'Limited update operations in the SFA Manager.', '2018-11-14 09:18:59.118', '2018-11-14 09:18:59.087');
INSERT INTO `security_permission` VALUES ('SFA_ROLE_VIEW', 'Limited view operations in the SFA Manager.', '2018-11-14 09:18:59.117', '2018-11-14 09:18:59.087');
INSERT INTO `security_permission` VALUES ('SFA_UPDATE', 'Update operations in the SFA Manager.', '2018-11-14 09:18:59.114', '2018-11-14 09:18:59.087');
INSERT INTO `security_permission` VALUES ('SFA_VIEW', 'View operations in the SFA Manager.', '2018-11-14 09:18:59.112', '2018-11-14 09:18:59.087');
INSERT INTO `security_permission` VALUES ('TEMPEXPR_ADMIN', 'Temporal expression admin', '2018-11-14 09:16:55.540', '2018-11-14 09:16:55.475');
INSERT INTO `security_permission` VALUES ('update', 'Base UPDATE permission', '2018-11-14 09:16:53.815', '2018-11-14 09:16:53.177');
INSERT INTO `security_permission` VALUES ('USERPREF_ADMIN', 'User preferences admin', '2018-11-14 09:16:55.539', '2018-11-14 09:16:55.475');
INSERT INTO `security_permission` VALUES ('UTIL_CACHE_EDIT', 'Edit a UtilCache instance.', '2018-11-14 09:17:37.242', '2018-11-14 09:17:37.150');
INSERT INTO `security_permission` VALUES ('UTIL_CACHE_VIEW', 'View a UtilCache instance.', '2018-11-14 09:17:37.241', '2018-11-14 09:17:37.150');
INSERT INTO `security_permission` VALUES ('UTIL_DEBUG_EDIT', 'Edit a UtilDebug instance.', '2018-11-14 09:17:37.244', '2018-11-14 09:17:37.150');
INSERT INTO `security_permission` VALUES ('UTIL_DEBUG_VIEW', 'View a UtilDebug instance.', '2018-11-14 09:17:37.243', '2018-11-14 09:17:37.150');
INSERT INTO `security_permission` VALUES ('VISUALTHEME_ADMIN', 'ALL operations on Visual Themes and Visual Theme Resources.', '2018-11-14 09:16:55.530', '2018-11-14 09:16:55.475');
INSERT INTO `security_permission` VALUES ('VISUALTHEME_CREATE', 'Create Visual Themes and Visual Theme Resources.', '2018-11-14 09:16:55.524', '2018-11-14 09:16:55.475');
INSERT INTO `security_permission` VALUES ('VISUALTHEME_DELETE', 'Delete Visual Themes and Visual Theme Resources.', '2018-11-14 09:16:55.526', '2018-11-14 09:16:55.475');
INSERT INTO `security_permission` VALUES ('VISUALTHEME_UPDATE', 'Update Visual Themes and Visual Theme Resources.', '2018-11-14 09:16:55.525', '2018-11-14 09:16:55.475');
INSERT INTO `security_permission` VALUES ('WEBPOS_ADMIN', 'ALL Web POS operations.', '2018-11-14 09:19:28.006', '2018-11-14 09:19:27.988');
INSERT INTO `security_permission` VALUES ('WEBPOS_VIEW', 'Web POS View permission.', '2018-11-14 09:19:28.007', '2018-11-14 09:19:27.988');
INSERT INTO `security_permission` VALUES ('WEBTOOLS_VIEW', 'Permission to access the WebTools Menu.', '2018-11-14 09:17:37.226', '2018-11-14 09:17:37.150');
INSERT INTO `security_permission` VALUES ('WORKEFFORTMGR_ADMIN', 'ALL operations in the Work Effort Manager.', '2018-11-14 09:18:13.095', '2018-11-14 09:18:13.046');
INSERT INTO `security_permission` VALUES ('WORKEFFORTMGR_CREATE', 'Create operations in the Work Effort Manager.', '2018-11-14 09:18:13.088', '2018-11-14 09:18:13.046');
INSERT INTO `security_permission` VALUES ('WORKEFFORTMGR_DELETE', 'Delete operations in the Work Effort Manager.', '2018-11-14 09:18:13.090', '2018-11-14 09:18:13.046');
INSERT INTO `security_permission` VALUES ('WORKEFFORTMGR_ROLE_CREATE', 'Limited Create operations in the Work Effort Manager.', '2018-11-14 09:18:13.092', '2018-11-14 09:18:13.046');
INSERT INTO `security_permission` VALUES ('WORKEFFORTMGR_ROLE_DELETE', 'Limited Delete operations the Work Effort Manager.', '2018-11-14 09:18:13.094', '2018-11-14 09:18:13.046');
INSERT INTO `security_permission` VALUES ('WORKEFFORTMGR_ROLE_UPDATE', 'Limited Update operations in the Work Effort Manager.', '2018-11-14 09:18:13.093', '2018-11-14 09:18:13.046');
INSERT INTO `security_permission` VALUES ('WORKEFFORTMGR_ROLE_VIEW', 'Limited View operations in the Work Effort Manager.', '2018-11-14 09:18:13.091', '2018-11-14 09:18:13.046');
INSERT INTO `security_permission` VALUES ('WORKEFFORTMGR_UPDATE', 'Update operations in the Work Effort Manager.', '2018-11-14 09:18:13.089', '2018-11-14 09:18:13.046');
INSERT INTO `security_permission` VALUES ('WORKEFFORTMGR_VIEW', 'View operations in the Work Effort Manager.', '2018-11-14 09:18:13.085', '2018-11-14 09:18:13.046');

SET FOREIGN_KEY_CHECKS = 1;
