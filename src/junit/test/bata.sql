/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50616
Source Host           : localhost:3306
Source Database       : lanyuan_ace

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2016-05-05 17:38:57
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for ly_res_role
-- ----------------------------
DROP TABLE IF EXISTS `ly_res_role`;
CREATE TABLE `ly_res_role` (
`resId`  int(11) NOT NULL ,
`roleId`  int(11) NOT NULL ,
PRIMARY KEY (`roleId`, `resId`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Records of ly_res_role
-- ----------------------------
BEGIN;
INSERT INTO `ly_res_role` VALUES ('1', '2'), ('2', '2'), ('3', '2'), ('4', '2'), ('5', '2'), ('6', '2'), ('7', '2'), ('8', '2'), ('9', '2'), ('10', '2'), ('11', '2'), ('25', '2'), ('26', '2'), ('27', '2'), ('28', '2'), ('29', '2'), ('30', '2'), ('31', '2'), ('32', '2'), ('33', '2'), ('35', '2'), ('36', '2'), ('37', '2'), ('38', '2'), ('39', '2'), ('40', '2'), ('41', '2'), ('44', '2'), ('45', '2'), ('46', '2'), ('47', '2'), ('48', '2'), ('49', '2'), ('50', '2'), ('51', '2'), ('52', '2');
COMMIT;

-- ----------------------------
-- Table structure for ly_resources
-- ----------------------------
DROP TABLE IF EXISTS `ly_resources`;
CREATE TABLE `ly_resources` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`parentId`  int(11) NULL DEFAULT NULL ,
`resKey`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`type`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`resUrl`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`level`  int(4) NULL DEFAULT NULL ,
`icon`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`btn`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`ishide`  int(3) NULL DEFAULT 0 ,
`description`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=69

;

-- ----------------------------
-- Records of ly_resources
-- ----------------------------
BEGIN;
INSERT INTO `ly_resources` VALUES ('1', '系统基础管理', '0', 'system', '0', 'system', '6', 'fa-desktop', null, '0', '系统基础管理'), ('2', '用户管理', '1', 'account', '1', '/system/user/list.shtml', '7', null, null, '0', '用户管理'), ('3', '角色管理', '1', 'role', '1', '/system/role/list.shtml', '11', 'fa-list', null, '0', '角色管理'), ('4', '菜单管理', '1', 'ly_resources', '1', '/system/resources/list.shtml', '16', 'fa-list-alt', null, '0', '菜单管理'), ('5', '新增用户', '2', 'account_add', '2', '/system/user/add.shtml', '8', null, 'addAccount,addAccount,btn btn-primary marR10,新增', '0', ''), ('6', '修改用户', '2', 'account_edit', '2', '/system/user/edit.shtml', '9', null, 'editAccount,editAccount,btn btn-info marR10,编辑', '0', ''), ('7', '删除用户', '2', 'account_delete', '2', '/system/user/deleteByIds.shtml', '10', null, 'delAccount,delAccount,btn btn-danger marR10,删除', '0', ''), ('8', '新增角色', '3', 'role_add', '2', '/system/role/add.shtml', '12', null, 'addrole,addrole,btn btn-primary marR10,新增', '0', ''), ('9', '修改角色', '3', 'role_edit', '2', '/system/role/edit.shtml', '13', null, 'editrole,editrole,btn btn-info marR10,编辑', '0', ''), ('10', '删除角色', '3', 'role_delete', '2', '/system/role/deleteByIds.shtml', '14', null, 'delrole,delrole,btn btn-danger marR10,删除', '0', ''), ('11', '角色受权', '3', 'role_perss', '2', '/resources/permissions.shtml', '15', '无', 'permissions,permissions,btn btn-grey marR10,分配权限', '0', ''), ('25', '登陆信息管理', '0', 'ly_login', '0', 'ly_login', '22', 'fa-calendar', null, '0', '登陆信息管理'), ('26', '用户登录记录', '25', 'ly_log_list', '1', '/list.shtml?page_path=/system/userlogin/list', '23', null, null, '0', null), ('27', '操作日志管理', '0', 'ly_log', '0', 'ly_log', '24', 'fa-picture-o', null, '1', '操作日志管理'), ('28', '日志查询', '27', 'ly_log', '1', '/list.shtml?page_path=/system/log/list', '25', null, null, '0', null), ('29', '新增菜单资源', '4', 'ly_resources_add', '2', '/system/resources/add.shtml', '17', null, 'addFun,addFun,btn btn-primary marR10,新增', '0', ''), ('30', '修改菜单资源', '4', 'ly_resources_edit', '2', '/system/resources/edit.shtml', '18', null, 'editFun,editFun,btn btn-info marR10,编辑', '0', ''), ('31', '删除菜单资源', '4', 'ly_resources_delete', '2', '/system/resources/deleteByIds.shtml', '19', null, 'delFun,delFun,btn btn-danger marR10,删除', '0', ''), ('32', '系统监控管理', '0', 'monitor', '0', 'monitor', '26', 'fa-tag', null, '0', '系统监控管理'), ('33', '实时监控', '32', 'sysmonitor', '1', '/system/monitor/monitor.shtml', '27', null, null, '0', '监控管理'), ('35', '数据字典管理', '0', 'dictionary', '0', 'dictionary', '30', 'fa-building', null, '0', '数据字典管理'), ('36', '新增字典', '39', 'dic_add', '2', '/system/dictionary/add.shtml', '32', null, 'addDictionary,addDictionary,btn btn-primary marR10,新增', '0', '新增字典'), ('37', '修改字典', '39', 'dic_edit', '2', '/system/dictionary/edit.shtml', '33', null, 'editDictionary,editDictionary,btn btn-info marR10,编辑', '0', ''), ('38', '删除字典', '39', 'dic_delete', '2', '/system/dictionary/deleteByIds.shtml', '34', null, 'delDictionary,delDictionary,btn btn-danger marR10,删除', '0', ''), ('39', '字典列表', '35', 'dic_list', '0', '/system/dictionary/list.shtml', '31', null, null, '0', '字典列表'), ('40', '告警列表', '32', 'monitor_warn', '1', '/system/monitor/list.shtml', '28', null, null, '0', '告警列表'), ('41', '性能监控', '32', 'sql_mon', '1', '/druid/index.html', '29', null, null, '0', '性能监控'), ('44', '上移', '4', 'sortUpdate', '2', '/system/resources/sortUpdate.shtml', '20', null, 'lyGridUp,lyGridUp,btn btn-success marR10,上移', '0', '上移'), ('45', '下移', '4', 'lyGridDown', '2', '/system/resources/sortUpdate.shtml', '21', null, 'lyGridDown,lyGridDown,btn btn-grey marR10,下移', '0', '下移'), ('46', '测试功能', '0', 'test', '0', 'test', '1', 'fa-behance', null, '0', '测试功能'), ('47', '新增', '50', 'Test_add', '2', '/add.shtml', '3', null, 'addTest,addTest,btn btn-primary marR10,新增', '0', ''), ('48', '修改', '50', 'Test_edit', '2', '/edit.shtml', '4', null, 'editTest,editTest,btn btn-info marR10,编辑', '0', ''), ('49', '删除', '50', 'Test_delete', '2', '/deleteByIds.shtml', '5', null, 'delTest,delTest,btn btn-danger marR10,删除', '0', ''), ('50', 'test表', '46', 'ly_test', '1', '/list.shtml?page_path=/system/test/list', '2', null, null, '0', null), ('51', '配置管理', '0', 'config_manage', '0', 'config_manage', '35', 'fa-cog', null, '0', '配置管理'), ('52', '配置界面', '51', 'config_view', '1', '/system/config/list.shtml', '36', null, null, '0', '配置界面'), ('61', '测试配置界面', '51', 'ckey_cecode', '1', '/system/config/cecode/public.shtml?resKey=ckey_cecode', '37', null, null, '0', null), ('62', '新增', '61', 'ckey_cecode_addFun', '2', '/system/config/cecode/public.shtml', '37', null, 'addFun,addFun,btn btn-primary marR10,新增', '0', null), ('63', '编辑', '61', 'ckey_cecode_editFun', '2', '/system/config/cecode/edit.shtml', '38', null, 'editFun,editFun,btn btn-info marR10,编辑', '0', null), ('64', '删除', '61', 'ckey_cecode_delFun', '2', '/system/config/cecode/delete.shtml', '39', null, 'delFun,delFun,btn btn-danger marR10,删除', '0', null), ('65', 'demo界面', '51', 'ckey_demo', '1', '/system/config/demo/public.shtml?resKey=ckey_demo', '41', null, null, '0', null), ('66', '新增', '65', 'ckey_demo_addFun', '2', '/system/config/demo/add.shtml', '41', null, 'addFun,addFun,btn btn-primary marR10,新增', '0', null), ('67', '编辑', '65', 'ckey_demo_editFun', '2', '/system/config/demo/edit.shtml', '42', null, 'editFun,editFun,btn btn-info marR10,编辑', '0', null), ('68', '删除', '65', 'ckey_demo_delFun', '2', '/system/config/demo/delete.shtml', '43', null, 'delFun,delFun,btn btn-danger marR10,删除', '0', null);
COMMIT;

-- ----------------------------
-- Table structure for ly_role
-- ----------------------------
DROP TABLE IF EXISTS `ly_role`;
CREATE TABLE `ly_role` (
`id`  int(10) NOT NULL AUTO_INCREMENT ,
`state`  varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`roleKey`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`description`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=22

;

-- ----------------------------
-- Records of ly_role
-- ----------------------------
BEGIN;
INSERT INTO `ly_role` VALUES ('2', '1', '管理员', 'admin', '管理系统权限'), ('3', '1', '普通角色', 'simple', '普通角色'), ('4', '1', '根账号', 'root', '拥有所有权限1'), ('14', '1', '444', '444', '44'), ('21', '1', '6666', '666', '00');
COMMIT;

-- ----------------------------
-- Table structure for ly_user
-- ----------------------------
DROP TABLE IF EXISTS `ly_user`;
CREATE TABLE `ly_user` (
`id`  int(10) NOT NULL AUTO_INCREMENT ,
`name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`accountName`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`password`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`credentialsSalt`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`description`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`locked`  varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' ,
`createTime`  timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
`deletestatus`  int(1) NULL DEFAULT 0 COMMENT '逻辑删除状态0:存在1:删除' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=19

;

-- ----------------------------
-- Records of ly_user
-- ----------------------------
BEGIN;
INSERT INTO `ly_user` VALUES ('1', 'admin', 'admin', '78e21a6eb88529eab722793a448ed394', '4157c3feef4a6ed91b2c28cf4392f2d1', '3434', '1', '2016-03-16 10:36:53', '0'), ('2', 'simple', 'simple', '78e21a6eb88529eab722793a448ed394', '4157c3feef4a6ed91b2c28cf4392f2d1', '0', '1', '2015-12-18 20:15:43', '0');
COMMIT;

-- ----------------------------
-- Table structure for ly_user_role
-- ----------------------------
DROP TABLE IF EXISTS `ly_user_role`;
CREATE TABLE `ly_user_role` (
`userId`  int(11) NOT NULL ,
`roleId`  int(11) NOT NULL ,
PRIMARY KEY (`userId`, `roleId`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Records of ly_user_role
-- ----------------------------
BEGIN;
INSERT INTO `ly_user_role` VALUES ('1', '2');
COMMIT;

-- ----------------------------
-- Auto increment value for ly_resources
-- ----------------------------
ALTER TABLE `ly_resources` AUTO_INCREMENT=69;

-- ----------------------------
-- Auto increment value for ly_role
-- ----------------------------
ALTER TABLE `ly_role` AUTO_INCREMENT=22;

-- ----------------------------
-- Auto increment value for ly_user
-- ----------------------------
ALTER TABLE `ly_user` AUTO_INCREMENT=19;
