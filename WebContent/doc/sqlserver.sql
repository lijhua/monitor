/*
Navicat SQL Server Data Transfer

Source Server         : 192.168.11.102-sqlserver
Source Server Version : 105000
Source Host           : 192.168.11.102:1433
Source Database       : testamp
Source Schema         : dbo

Target Server Type    : SQL Server
Target Server Version : 105000
File Encoding         : 65001

Date: 2016-09-17 23:36:23
*/


-- ----------------------------
-- Table structure for ly_config
-- ----------------------------
DROP TABLE [dbo].[ly_config]
GO
CREATE TABLE [dbo].[ly_config] (
[id] int NOT NULL IDENTITY(1,1) ,
[code] varchar(100) NULL DEFAULT NULL ,
[name] varchar(50) NULL DEFAULT NULL ,
[url] varchar(200) NULL DEFAULT NULL ,
[table_colum] varchar(5000) NULL DEFAULT NULL ,
[table_param] varchar(5000) NULL DEFAULT NULL ,
[query_param] varchar(1000) NULL DEFAULT NULL ,
[query_sql] varchar(5000) NULL DEFAULT NULL ,
[last_time] datetime NULL DEFAULT (getdate()) 
)


GO
DBCC CHECKIDENT(N'[dbo].[ly_config]', RESEED, 3)
GO

-- ----------------------------
-- Records of ly_config
-- ----------------------------
SET IDENTITY_INSERT [dbo].[ly_config] ON
GO
SET IDENTITY_INSERT [dbo].[ly_config] OFF
GO

-- ----------------------------
-- Table structure for ly_dictionary
-- ----------------------------
DROP TABLE [dbo].[ly_dictionary]
GO
CREATE TABLE [dbo].[ly_dictionary] (
[id] int NOT NULL IDENTITY(1,1) ,
[code] varchar(20) NOT NULL ,
[value] varchar(50) NOT NULL ,
[parent_code] varchar(50) NOT NULL DEFAULT ('1000') ,
[createTime] datetime NULL ,
[description] varchar(100) NULL DEFAULT NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[ly_dictionary]', RESEED, 3)
GO

-- ----------------------------
-- Records of ly_dictionary
-- ----------------------------
SET IDENTITY_INSERT [dbo].[ly_dictionary] ON
GO
INSERT INTO [dbo].[ly_dictionary] ([id], [code], [value], [parent_code], [createTime], [description]) VALUES (N'1', N'11', N'11', N'1000', null, N'11')
GO
GO
INSERT INTO [dbo].[ly_dictionary] ([id], [code], [value], [parent_code], [createTime], [description]) VALUES (N'2', N'ee', N'ee', N'11', null, null)
GO
GO
INSERT INTO [dbo].[ly_dictionary] ([id], [code], [value], [parent_code], [createTime], [description]) VALUES (N'3', N'rr', N'rr', N'11', null, null)
GO
GO
SET IDENTITY_INSERT [dbo].[ly_dictionary] OFF
GO

-- ----------------------------
-- Table structure for ly_log
-- ----------------------------
DROP TABLE [dbo].[ly_log]
GO
CREATE TABLE [dbo].[ly_log] (
[id] int NOT NULL IDENTITY(1,1) ,
[accountName] varchar(30) NULL ,
[module] varchar(30) NULL ,
[methods] varchar(200) NULL ,
[actionTime] varchar(10) NULL ,
[userIP] varchar(30) NULL ,
[operTime] datetime NULL ,
[description] text NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[ly_log]', RESEED, 10)
GO

-- ----------------------------
-- Records of ly_log
-- ----------------------------
SET IDENTITY_INSERT [dbo].[ly_log] ON
GO
INSERT INTO [dbo].[ly_log] ([id], [accountName], [module], [methods], [actionTime], [userIP], [operTime], [description]) VALUES (N'1', N'0', N'0', N'0', N'10 14 2015', N'0', N'2015-10-11 18:22:03.000', N'0')
GO
GO
INSERT INTO [dbo].[ly_log] ([id], [accountName], [module], [methods], [actionTime], [userIP], [operTime], [description]) VALUES (N'3', N'admin', N'系统管理', N'组管理-新增组', N'4', N'127.0.0.1', null, N'执行成功!')
GO
GO
INSERT INTO [dbo].[ly_log] ([id], [accountName], [module], [methods], [actionTime], [userIP], [operTime], [description]) VALUES (N'4', N'admin', N'系统管理', N'用户管理-新增用户', N'31', N'127.0.0.1', null, N'执行成功!')
GO
GO
INSERT INTO [dbo].[ly_log] ([id], [accountName], [module], [methods], [actionTime], [userIP], [operTime], [description]) VALUES (N'5', N'admin', N'系统管理', N'用户管理-修改用户', N'52', N'127.0.0.1', null, N'执行成功!')
GO
GO
INSERT INTO [dbo].[ly_log] ([id], [accountName], [module], [methods], [actionTime], [userIP], [operTime], [description]) VALUES (N'6', N'admin', N'系统管理', N'用户管理-删除用户', N'36', N'127.0.0.1', null, N'执行成功!')
GO
GO
INSERT INTO [dbo].[ly_log] ([id], [accountName], [module], [methods], [actionTime], [userIP], [operTime], [description]) VALUES (N'7', N'admin', N'系统管理', N'用户管理/组管理-修改权限', N'32', N'127.0.0.1', null, N'执行成功!')
GO
GO
INSERT INTO [dbo].[ly_log] ([id], [accountName], [module], [methods], [actionTime], [userIP], [operTime], [description]) VALUES (N'8', N'admin', N'系统管理', N'用户管理/组管理-修改权限', N'23', N'127.0.0.1', null, N'执行成功!')
GO
GO
INSERT INTO [dbo].[ly_log] ([id], [accountName], [module], [methods], [actionTime], [userIP], [operTime], [description]) VALUES (N'9', N'admin', N'系统管理', N'用户管理-修改用户', N'42', N'127.0.0.1', null, N'执行成功!')
GO
GO
INSERT INTO [dbo].[ly_log] ([id], [accountName], [module], [methods], [actionTime], [userIP], [operTime], [description]) VALUES (N'10', N'admin', N'系统管理', N'用户管理/组管理-修改权限', N'11', N'127.0.0.1', null, N'执行成功!')
GO
GO
SET IDENTITY_INSERT [dbo].[ly_log] OFF
GO

-- ----------------------------
-- Table structure for ly_res_user
-- ----------------------------
DROP TABLE [dbo].[ly_res_user]
GO
CREATE TABLE [dbo].[ly_res_user] (
[resId] int NULL ,
[userId] int NULL 
)


GO

-- ----------------------------
-- Records of ly_res_user
-- ----------------------------
INSERT INTO [dbo].[ly_res_user] ([resId], [userId]) VALUES (N'1', N'4')
GO
GO
INSERT INTO [dbo].[ly_res_user] ([resId], [userId]) VALUES (N'2', N'4')
GO
GO
INSERT INTO [dbo].[ly_res_user] ([resId], [userId]) VALUES (N'5', N'4')
GO
GO
INSERT INTO [dbo].[ly_res_user] ([resId], [userId]) VALUES (N'6', N'4')
GO
GO
INSERT INTO [dbo].[ly_res_user] ([resId], [userId]) VALUES (N'7', N'4')
GO
GO
INSERT INTO [dbo].[ly_res_user] ([resId], [userId]) VALUES (N'21', N'4')
GO
GO
INSERT INTO [dbo].[ly_res_user] ([resId], [userId]) VALUES (N'3', N'4')
GO
GO
INSERT INTO [dbo].[ly_res_user] ([resId], [userId]) VALUES (N'8', N'4')
GO
GO
INSERT INTO [dbo].[ly_res_user] ([resId], [userId]) VALUES (N'9', N'4')
GO
GO
INSERT INTO [dbo].[ly_res_user] ([resId], [userId]) VALUES (N'10', N'4')
GO
GO
INSERT INTO [dbo].[ly_res_user] ([resId], [userId]) VALUES (N'11', N'4')
GO
GO
INSERT INTO [dbo].[ly_res_user] ([resId], [userId]) VALUES (N'4', N'4')
GO
GO
INSERT INTO [dbo].[ly_res_user] ([resId], [userId]) VALUES (N'16', N'4')
GO
GO
INSERT INTO [dbo].[ly_res_user] ([resId], [userId]) VALUES (N'17', N'4')
GO
GO
INSERT INTO [dbo].[ly_res_user] ([resId], [userId]) VALUES (N'18', N'4')
GO
GO
INSERT INTO [dbo].[ly_res_user] ([resId], [userId]) VALUES (N'23', N'4')
GO
GO
INSERT INTO [dbo].[ly_res_user] ([resId], [userId]) VALUES (N'24', N'4')
GO
GO
INSERT INTO [dbo].[ly_res_user] ([resId], [userId]) VALUES (N'12', N'4')
GO
GO
INSERT INTO [dbo].[ly_res_user] ([resId], [userId]) VALUES (N'13', N'4')
GO
GO
INSERT INTO [dbo].[ly_res_user] ([resId], [userId]) VALUES (N'14', N'4')
GO
GO
INSERT INTO [dbo].[ly_res_user] ([resId], [userId]) VALUES (N'15', N'4')
GO
GO
INSERT INTO [dbo].[ly_res_user] ([resId], [userId]) VALUES (N'19', N'4')
GO
GO
INSERT INTO [dbo].[ly_res_user] ([resId], [userId]) VALUES (N'20', N'4')
GO
GO
INSERT INTO [dbo].[ly_res_user] ([resId], [userId]) VALUES (N'22', N'4')
GO
GO
INSERT INTO [dbo].[ly_res_user] ([resId], [userId]) VALUES (N'1', N'2')
GO
GO
INSERT INTO [dbo].[ly_res_user] ([resId], [userId]) VALUES (N'2', N'2')
GO
GO
INSERT INTO [dbo].[ly_res_user] ([resId], [userId]) VALUES (N'5', N'2')
GO
GO
INSERT INTO [dbo].[ly_res_user] ([resId], [userId]) VALUES (N'6', N'2')
GO
GO
INSERT INTO [dbo].[ly_res_user] ([resId], [userId]) VALUES (N'7', N'2')
GO
GO
INSERT INTO [dbo].[ly_res_user] ([resId], [userId]) VALUES (N'21', N'2')
GO
GO

-- ----------------------------
-- Table structure for ly_resources
-- ----------------------------
DROP TABLE [dbo].[ly_resources]
GO
CREATE TABLE [dbo].[ly_resources] (
[id] int NOT NULL IDENTITY(1,1) ,
[name] varchar(50) NULL ,
[parentId] int NULL ,
[resKey] varchar(50) NULL ,
[type] varchar(30) NULL ,
[resUrl] varchar(200) NULL ,
[level] int NULL ,
[icon] varchar(100) NULL ,
[ishide] int NULL ,
[description] varchar(200) NULL ,
[btn] varchar(200) NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[ly_resources]', RESEED, 69)
GO

-- ----------------------------
-- Records of ly_resources
-- ----------------------------
SET IDENTITY_INSERT [dbo].[ly_resources] ON
GO
INSERT INTO [dbo].[ly_resources] ([id], [name], [parentId], [resKey], [type], [resUrl], [level], [icon], [ishide], [description], [btn]) VALUES (N'25', N'系统基础管理', N'0', N'system', N'0', N'system', N'6', N'fa-desktop', N'0', N'系统基础管理', null)
GO
GO
INSERT INTO [dbo].[ly_resources] ([id], [name], [parentId], [resKey], [type], [resUrl], [level], [icon], [ishide], [description], [btn]) VALUES (N'26', N'用户管理', N'25', N'account', N'1', N'/system/user/list.shtml', N'7', null, N'0', N'用户管理', null)
GO
GO
INSERT INTO [dbo].[ly_resources] ([id], [name], [parentId], [resKey], [type], [resUrl], [level], [icon], [ishide], [description], [btn]) VALUES (N'27', N'角色管理', N'25', N'role', N'1', N'/system/role/list.shtml', N'11', N'fa-list', N'0', N'角色管理', null)
GO
GO
INSERT INTO [dbo].[ly_resources] ([id], [name], [parentId], [resKey], [type], [resUrl], [level], [icon], [ishide], [description], [btn]) VALUES (N'28', N'菜单管理', N'25', N'ly_resources', N'1', N'/system/resources/list.shtml', N'16', N'fa-list-alt', N'0', N'菜单管理', null)
GO
GO
INSERT INTO [dbo].[ly_resources] ([id], [name], [parentId], [resKey], [type], [resUrl], [level], [icon], [ishide], [description], [btn]) VALUES (N'29', N'新增用户', N'26', N'account_add', N'2', N'/system/user/add.shtml', N'8', null, N'0', N'', N'addAccount,addAccount,btn btn-primary marR10,新增')
GO
GO
INSERT INTO [dbo].[ly_resources] ([id], [name], [parentId], [resKey], [type], [resUrl], [level], [icon], [ishide], [description], [btn]) VALUES (N'30', N'修改用户', N'26', N'account_edit', N'2', N'/system/user/edit.shtml', N'9', null, N'0', N'', N'editAccount,editAccount,btn btn-info marR10,编辑')
GO
GO
INSERT INTO [dbo].[ly_resources] ([id], [name], [parentId], [resKey], [type], [resUrl], [level], [icon], [ishide], [description], [btn]) VALUES (N'31', N'删除用户', N'26', N'account_delete', N'2', N'/system/user/deleteByIds.shtml', N'10', null, N'0', N'', N'delAccount,delAccount,btn btn-danger marR10,删除')
GO
GO
INSERT INTO [dbo].[ly_resources] ([id], [name], [parentId], [resKey], [type], [resUrl], [level], [icon], [ishide], [description], [btn]) VALUES (N'32', N'新增角色', N'27', N'role_add', N'2', N'/system/role/add.shtml', N'12', null, N'0', N'', N'addrole,addrole,btn btn-primary marR10,新增')
GO
GO
INSERT INTO [dbo].[ly_resources] ([id], [name], [parentId], [resKey], [type], [resUrl], [level], [icon], [ishide], [description], [btn]) VALUES (N'33', N'修改角色', N'27', N'role_edit', N'2', N'/system/role/edit.shtml', N'13', null, N'0', N'', N'editrole,editrole,btn btn-info marR10,编辑')
GO
GO
INSERT INTO [dbo].[ly_resources] ([id], [name], [parentId], [resKey], [type], [resUrl], [level], [icon], [ishide], [description], [btn]) VALUES (N'34', N'删除角色', N'27', N'role_delete', N'2', N'/system/role/deleteByIds.shtml', N'14', null, N'0', N'', N'delrole,delrole,btn btn-danger marR10,删除')
GO
GO
INSERT INTO [dbo].[ly_resources] ([id], [name], [parentId], [resKey], [type], [resUrl], [level], [icon], [ishide], [description], [btn]) VALUES (N'35', N'角色受权', N'27', N'role_perss', N'2', N'/resources/permissions.shtml', N'15', N'无', N'0', N'', N'permissions,permissions,btn btn-grey marR10,分配权限')
GO
GO
INSERT INTO [dbo].[ly_resources] ([id], [name], [parentId], [resKey], [type], [resUrl], [level], [icon], [ishide], [description], [btn]) VALUES (N'36', N'登陆信息管理', N'0', N'ly_login', N'0', N'ly_login', N'22', N'fa-calendar', N'0', N'登陆信息管理', null)
GO
GO
INSERT INTO [dbo].[ly_resources] ([id], [name], [parentId], [resKey], [type], [resUrl], [level], [icon], [ishide], [description], [btn]) VALUES (N'37', N'用户登录记录', N'36', N'ly_log_list', N'1', N'/list.shtml?page_path=/system/userlogin/list', N'23', null, N'0', null, null)
GO
GO
INSERT INTO [dbo].[ly_resources] ([id], [name], [parentId], [resKey], [type], [resUrl], [level], [icon], [ishide], [description], [btn]) VALUES (N'38', N'操作日志管理', N'0', N'ly_log', N'0', N'ly_log', N'24', N'fa-picture-o', N'1', N'操作日志管理', null)
GO
GO
INSERT INTO [dbo].[ly_resources] ([id], [name], [parentId], [resKey], [type], [resUrl], [level], [icon], [ishide], [description], [btn]) VALUES (N'39', N'日志查询', N'38', N'ly_log', N'1', N'/list.shtml?page_path=/system/log/list', N'25', null, N'0', null, null)
GO
GO
INSERT INTO [dbo].[ly_resources] ([id], [name], [parentId], [resKey], [type], [resUrl], [level], [icon], [ishide], [description], [btn]) VALUES (N'40', N'新增菜单资源', N'28', N'ly_resources_add', N'2', N'/system/resources/add.shtml', N'17', null, N'0', N'', N'addFun,addFun,btn btn-primary marR10,新增')
GO
GO
INSERT INTO [dbo].[ly_resources] ([id], [name], [parentId], [resKey], [type], [resUrl], [level], [icon], [ishide], [description], [btn]) VALUES (N'41', N'修改菜单资源', N'28', N'ly_resources_edit', N'2', N'/system/resources/edit.shtml', N'18', null, N'0', N'', N'editFun,editFun,btn btn-info marR10,编辑')
GO
GO
INSERT INTO [dbo].[ly_resources] ([id], [name], [parentId], [resKey], [type], [resUrl], [level], [icon], [ishide], [description], [btn]) VALUES (N'42', N'删除菜单资源', N'28', N'ly_resources_delete', N'2', N'/system/resources/deleteByIds.shtml', N'19', null, N'0', N'', N'delFun,delFun,btn btn-danger marR10,删除')
GO
GO
INSERT INTO [dbo].[ly_resources] ([id], [name], [parentId], [resKey], [type], [resUrl], [level], [icon], [ishide], [description], [btn]) VALUES (N'43', N'系统监控管理', N'0', N'monitor', N'0', N'monitor', N'26', N'fa-tag', N'0', N'系统监控管理', null)
GO
GO
INSERT INTO [dbo].[ly_resources] ([id], [name], [parentId], [resKey], [type], [resUrl], [level], [icon], [ishide], [description], [btn]) VALUES (N'44', N'实时监控', N'43', N'sysmonitor', N'1', N'/system/monitor/monitor.shtml', N'27', null, N'0', N'监控管理', null)
GO
GO
INSERT INTO [dbo].[ly_resources] ([id], [name], [parentId], [resKey], [type], [resUrl], [level], [icon], [ishide], [description], [btn]) VALUES (N'45', N'数据字典管理', N'0', N'dictionary', N'0', N'dictionary', N'30', N'fa-building', N'0', N'数据字典管理', null)
GO
GO
INSERT INTO [dbo].[ly_resources] ([id], [name], [parentId], [resKey], [type], [resUrl], [level], [icon], [ishide], [description], [btn]) VALUES (N'46', N'新增字典', N'49', N'dic_add', N'2', N'/system/dictionary/add.shtml', N'32', null, N'0', N'新增字典', N'addDictionary,addDictionary,btn btn-primary marR10,新增')
GO
GO
INSERT INTO [dbo].[ly_resources] ([id], [name], [parentId], [resKey], [type], [resUrl], [level], [icon], [ishide], [description], [btn]) VALUES (N'47', N'修改字典', N'49', N'dic_edit', N'2', N'/system/dictionary/edit.shtml', N'33', null, N'0', N'', N'editDictionary,editDictionary,btn btn-info marR10,编辑')
GO
GO
INSERT INTO [dbo].[ly_resources] ([id], [name], [parentId], [resKey], [type], [resUrl], [level], [icon], [ishide], [description], [btn]) VALUES (N'48', N'删除字典', N'49', N'dic_delete', N'2', N'/system/dictionary/deleteByIds.shtml', N'34', null, N'0', N'', N'delDictionary,delDictionary,btn btn-danger marR10,删除')
GO
GO
INSERT INTO [dbo].[ly_resources] ([id], [name], [parentId], [resKey], [type], [resUrl], [level], [icon], [ishide], [description], [btn]) VALUES (N'49', N'字典列表', N'45', N'dic_list', N'0', N'/system/dictionary/list.shtml', N'31', null, N'0', N'字典列表', null)
GO
GO
INSERT INTO [dbo].[ly_resources] ([id], [name], [parentId], [resKey], [type], [resUrl], [level], [icon], [ishide], [description], [btn]) VALUES (N'50', N'告警列表', N'43', N'monitor_warn', N'1', N'/system/monitor/list.shtml', N'28', null, N'0', N'告警列表', null)
GO
GO
INSERT INTO [dbo].[ly_resources] ([id], [name], [parentId], [resKey], [type], [resUrl], [level], [icon], [ishide], [description], [btn]) VALUES (N'51', N'性能监控', N'43', N'sql_mon', N'1', N'/druid/index.html', N'29', null, N'0', N'性能监控', null)
GO
GO
INSERT INTO [dbo].[ly_resources] ([id], [name], [parentId], [resKey], [type], [resUrl], [level], [icon], [ishide], [description], [btn]) VALUES (N'52', N'上移', N'28', N'sortUpdate', N'2', N'/system/resources/sortUpdate.shtml', N'20', null, N'0', N'上移', N'lyGridUp,lyGridUp,btn btn-success marR10,上移')
GO
GO
INSERT INTO [dbo].[ly_resources] ([id], [name], [parentId], [resKey], [type], [resUrl], [level], [icon], [ishide], [description], [btn]) VALUES (N'53', N'下移', N'28', N'lyGridDown', N'2', N'/system/resources/sortUpdate.shtml', N'21', null, N'0', N'下移', N'lyGridDown,lyGridDown,btn btn-grey marR10,下移')
GO
GO
INSERT INTO [dbo].[ly_resources] ([id], [name], [parentId], [resKey], [type], [resUrl], [level], [icon], [ishide], [description], [btn]) VALUES (N'54', N'测试功能', N'0', N'test', N'0', N'test', N'1', N'fa-behance', N'0', N'测试功能', null)
GO
GO
INSERT INTO [dbo].[ly_resources] ([id], [name], [parentId], [resKey], [type], [resUrl], [level], [icon], [ishide], [description], [btn]) VALUES (N'55', N'新增', N'58', N'Test_add', N'2', N'/add.shtml', N'3', null, N'0', N'', N'addTest,addTest,btn btn-primary marR10,新增')
GO
GO
INSERT INTO [dbo].[ly_resources] ([id], [name], [parentId], [resKey], [type], [resUrl], [level], [icon], [ishide], [description], [btn]) VALUES (N'56', N'修改', N'58', N'Test_edit', N'2', N'/edit.shtml', N'4', null, N'0', N'', N'editTest,editTest,btn btn-info marR10,编辑')
GO
GO
INSERT INTO [dbo].[ly_resources] ([id], [name], [parentId], [resKey], [type], [resUrl], [level], [icon], [ishide], [description], [btn]) VALUES (N'57', N'删除', N'58', N'Test_delete', N'2', N'/deleteByIds.shtml', N'5', null, N'0', N'', N'delTest,delTest,btn btn-danger marR10,删除')
GO
GO
INSERT INTO [dbo].[ly_resources] ([id], [name], [parentId], [resKey], [type], [resUrl], [level], [icon], [ishide], [description], [btn]) VALUES (N'58', N'test表', N'54', N'ly_test', N'1', N'/list.shtml?page_path=/system/test/list', N'2', null, N'0', null, null)
GO
GO
INSERT INTO [dbo].[ly_resources] ([id], [name], [parentId], [resKey], [type], [resUrl], [level], [icon], [ishide], [description], [btn]) VALUES (N'59', N'配置管理', N'0', N'config_manage', N'0', N'config_manage', N'35', N'fa-cog', N'1', N'配置管理', null)
GO
GO
INSERT INTO [dbo].[ly_resources] ([id], [name], [parentId], [resKey], [type], [resUrl], [level], [icon], [ishide], [description], [btn]) VALUES (N'60', N'配置界面', N'59', N'config_view', N'1', N'/system/config/list.shtml', N'36', null, N'0', N'配置界面', null)
GO
GO
INSERT INTO [dbo].[ly_resources] ([id], [name], [parentId], [resKey], [type], [resUrl], [level], [icon], [ishide], [description], [btn]) VALUES (N'62', N'新增', N'60', N'ckey_cecode_addFun', N'2', N'/system/config/cecode/public.shtml', N'37', null, N'0', null, N'addFun,addFun,btn btn-primary marR10,新增')
GO
GO
INSERT INTO [dbo].[ly_resources] ([id], [name], [parentId], [resKey], [type], [resUrl], [level], [icon], [ishide], [description], [btn]) VALUES (N'63', N'编辑', N'60', N'ckey_cecode_editFun', N'2', N'/system/config/cecode/edit.shtml', N'38', null, N'0', null, N'editFun,editFun,btn btn-info marR10,编辑')
GO
GO
INSERT INTO [dbo].[ly_resources] ([id], [name], [parentId], [resKey], [type], [resUrl], [level], [icon], [ishide], [description], [btn]) VALUES (N'64', N'删除', N'60', N'ckey_cecode_delFun', N'2', N'/system/config/cecode/delete.shtml', N'39', null, N'0', null, N'delFun,delFun,btn btn-danger marR10,删除')
GO
GO
SET IDENTITY_INSERT [dbo].[ly_resources] OFF
GO

-- ----------------------------
-- Table structure for ly_role
-- ----------------------------
DROP TABLE [dbo].[ly_role]
GO
CREATE TABLE [dbo].[ly_role] (
[id] int NOT NULL IDENTITY(1,1) ,
[state] varchar(3) NULL ,
[name] varchar(50) NULL ,
[roleKey] varchar(50) NULL ,
[description] varchar(50) NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[ly_role]', RESEED, 2)
GO

-- ----------------------------
-- Records of ly_role
-- ----------------------------
SET IDENTITY_INSERT [dbo].[ly_role] ON
GO
INSERT INTO [dbo].[ly_role] ([id], [state], [name], [roleKey], [description]) VALUES (N'2', N'0', N'aaa', N'aa', N'aa')
GO
GO
SET IDENTITY_INSERT [dbo].[ly_role] OFF
GO

-- ----------------------------
-- Table structure for ly_server_info
-- ----------------------------
DROP TABLE [dbo].[ly_server_info]
GO
CREATE TABLE [dbo].[ly_server_info] (
[id] int NOT NULL IDENTITY(1,1) ,
[cpuUsage] varchar(100) NULL ,
[setCpuUsage] varchar(100) NULL ,
[jvmUsage] varchar(100) NULL ,
[setJvmUsage] varchar(100) NULL ,
[ramUsage] varchar(100) NULL ,
[setRamUsage] varchar(100) NULL ,
[email] varchar(30) NULL ,
[operTime] datetime NULL ,
[mark] varchar(300) NULL 
)


GO

-- ----------------------------
-- Records of ly_server_info
-- ----------------------------
SET IDENTITY_INSERT [dbo].[ly_server_info] ON
GO
SET IDENTITY_INSERT [dbo].[ly_server_info] OFF
GO

-- ----------------------------
-- Table structure for ly_user
-- ----------------------------
DROP TABLE [dbo].[ly_user]
GO
CREATE TABLE [dbo].[ly_user] (
[id] int NOT NULL IDENTITY(1,1) ,
[userName] varchar(30) NULL ,
[accountName] varchar(30) NULL ,
[password] varchar(50) NULL ,
[credentialsSalt] varchar(100) NULL ,
[description] varchar(100) NULL ,
[locked] varchar(3) NULL ,
[createTime] datetime NULL ,
[deletestatus] varchar(1) NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[ly_user]', RESEED, 5)
GO

-- ----------------------------
-- Records of ly_user
-- ----------------------------
SET IDENTITY_INSERT [dbo].[ly_user] ON
GO
INSERT INTO [dbo].[ly_user] ([id], [userName], [accountName], [password], [credentialsSalt], [description], [locked], [createTime], [deletestatus]) VALUES (N'2', N'蓝缘', N'simple', N'78e21a6eb88529eab722793a448ed394', N'4157c3feef4a6ed91b2c28cf4392f2d1', N'0', N'1', N'2015-05-17 22:23:15.000', N'0')
GO
GO
INSERT INTO [dbo].[ly_user] ([id], [userName], [accountName], [password], [credentialsSalt], [description], [locked], [createTime], [deletestatus]) VALUES (N'3', N'超级管理员', N'ROOT', N'78e21a6eb88529eab722793a448ed394', N'4157c3feef4a6ed91b2c28cf4392f2d1', N'0000', N'1', N'2015-05-23 17:39:37.000', N'0')
GO
GO
INSERT INTO [dbo].[ly_user] ([id], [userName], [accountName], [password], [credentialsSalt], [description], [locked], [createTime], [deletestatus]) VALUES (N'4', N'管理员', N'admin', N'78e21a6eb88529eab722793a448ed394', N'4157c3feef4a6ed91b2c28cf4392f2d1', N'3434', N'1', N'2015-05-23 17:39:39.000', N'0')
GO
GO
SET IDENTITY_INSERT [dbo].[ly_user] OFF
GO

-- ----------------------------
-- Table structure for ly_user_role
-- ----------------------------
DROP TABLE [dbo].[ly_user_role]
GO
CREATE TABLE [dbo].[ly_user_role] (
[userId] int NULL ,
[roleId] int NULL 
)


GO

-- ----------------------------
-- Records of ly_user_role
-- ----------------------------
INSERT INTO [dbo].[ly_user_role] ([userId], [roleId]) VALUES (N'2', N'2')
GO
GO

-- ----------------------------
-- Table structure for ly_userlogin
-- ----------------------------
DROP TABLE [dbo].[ly_userlogin]
GO
CREATE TABLE [dbo].[ly_userlogin] (
[id] int NOT NULL IDENTITY(1,1) ,
[userId] int NULL ,
[accountName] varchar(30) NULL ,
[loginTime] datetime NULL ,
[loginIP] varchar(30) NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[ly_userlogin]', RESEED, 23)
GO

-- ----------------------------
-- Records of ly_userlogin
-- ----------------------------
SET IDENTITY_INSERT [dbo].[ly_userlogin] ON
GO
INSERT INTO [dbo].[ly_userlogin] ([id], [userId], [accountName], [loginTime], [loginIP]) VALUES (N'1', N'4', N'admin', null, N'127.0.0.1')
GO
GO
INSERT INTO [dbo].[ly_userlogin] ([id], [userId], [accountName], [loginTime], [loginIP]) VALUES (N'2', N'4', N'admin', null, N'127.0.0.1')
GO
GO
INSERT INTO [dbo].[ly_userlogin] ([id], [userId], [accountName], [loginTime], [loginIP]) VALUES (N'3', N'4', N'admin', null, N'127.0.0.1')
GO
GO
INSERT INTO [dbo].[ly_userlogin] ([id], [userId], [accountName], [loginTime], [loginIP]) VALUES (N'4', N'4', N'admin', null, N'127.0.0.1')
GO
GO
INSERT INTO [dbo].[ly_userlogin] ([id], [userId], [accountName], [loginTime], [loginIP]) VALUES (N'5', N'4', N'admin', null, N'127.0.0.1')
GO
GO
INSERT INTO [dbo].[ly_userlogin] ([id], [userId], [accountName], [loginTime], [loginIP]) VALUES (N'6', N'4', N'admin', null, N'127.0.0.1')
GO
GO
INSERT INTO [dbo].[ly_userlogin] ([id], [userId], [accountName], [loginTime], [loginIP]) VALUES (N'7', N'4', N'admin', null, N'127.0.0.1')
GO
GO
INSERT INTO [dbo].[ly_userlogin] ([id], [userId], [accountName], [loginTime], [loginIP]) VALUES (N'8', N'4', N'admin', null, N'127.0.0.1')
GO
GO
INSERT INTO [dbo].[ly_userlogin] ([id], [userId], [accountName], [loginTime], [loginIP]) VALUES (N'9', N'4', N'admin', null, N'127.0.0.1')
GO
GO
INSERT INTO [dbo].[ly_userlogin] ([id], [userId], [accountName], [loginTime], [loginIP]) VALUES (N'10', N'4', N'admin', null, N'127.0.0.1')
GO
GO
INSERT INTO [dbo].[ly_userlogin] ([id], [userId], [accountName], [loginTime], [loginIP]) VALUES (N'11', N'4', N'admin', null, N'127.0.0.1')
GO
GO
INSERT INTO [dbo].[ly_userlogin] ([id], [userId], [accountName], [loginTime], [loginIP]) VALUES (N'12', N'4', N'admin', null, N'127.0.0.1')
GO
GO
INSERT INTO [dbo].[ly_userlogin] ([id], [userId], [accountName], [loginTime], [loginIP]) VALUES (N'13', N'4', N'admin', null, N'127.0.0.1')
GO
GO
INSERT INTO [dbo].[ly_userlogin] ([id], [userId], [accountName], [loginTime], [loginIP]) VALUES (N'14', N'4', N'admin', null, N'127.0.0.1')
GO
GO
INSERT INTO [dbo].[ly_userlogin] ([id], [userId], [accountName], [loginTime], [loginIP]) VALUES (N'15', N'4', N'admin', null, N'127.0.0.1')
GO
GO
INSERT INTO [dbo].[ly_userlogin] ([id], [userId], [accountName], [loginTime], [loginIP]) VALUES (N'16', N'4', N'admin', null, N'127.0.0.1')
GO
GO
INSERT INTO [dbo].[ly_userlogin] ([id], [userId], [accountName], [loginTime], [loginIP]) VALUES (N'17', N'4', N'admin', null, N'127.0.0.1')
GO
GO
INSERT INTO [dbo].[ly_userlogin] ([id], [userId], [accountName], [loginTime], [loginIP]) VALUES (N'18', N'4', N'admin', null, N'127.0.0.1')
GO
GO
INSERT INTO [dbo].[ly_userlogin] ([id], [userId], [accountName], [loginTime], [loginIP]) VALUES (N'19', N'4', N'admin', null, N'127.0.0.1')
GO
GO
INSERT INTO [dbo].[ly_userlogin] ([id], [userId], [accountName], [loginTime], [loginIP]) VALUES (N'20', N'4', N'admin', null, N'127.0.0.1')
GO
GO
INSERT INTO [dbo].[ly_userlogin] ([id], [userId], [accountName], [loginTime], [loginIP]) VALUES (N'21', N'4', N'admin', null, N'127.0.0.1')
GO
GO
INSERT INTO [dbo].[ly_userlogin] ([id], [userId], [accountName], [loginTime], [loginIP]) VALUES (N'22', N'4', N'admin', null, N'127.0.0.1')
GO
GO
INSERT INTO [dbo].[ly_userlogin] ([id], [userId], [accountName], [loginTime], [loginIP]) VALUES (N'23', N'4', N'admin', null, N'127.0.0.1')
GO
GO
SET IDENTITY_INSERT [dbo].[ly_userlogin] OFF
GO

-- ----------------------------
-- Table structure for test
-- ----------------------------
DROP TABLE [dbo].[test]
GO
CREATE TABLE [dbo].[test] (
[test_id] int NOT NULL IDENTITY(1,1) ,
[name] varchar(255) NULL DEFAULT NULL ,
[age] varchar(255) NULL DEFAULT NULL ,
[des] varchar(255) NULL DEFAULT NULL ,
[createTime] datetime NULL 
)


GO

-- ----------------------------
-- Records of test
-- ----------------------------
SET IDENTITY_INSERT [dbo].[test] ON
GO
INSERT INTO [dbo].[test] ([test_id], [name], [age], [des], [createTime]) VALUES (N'1', N'0000', N'00', N'00', null)
GO
GO
SET IDENTITY_INSERT [dbo].[test] OFF
GO

-- ----------------------------
-- Indexes structure for table ly_config
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table ly_config
-- ----------------------------
ALTER TABLE [dbo].[ly_config] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table ly_dictionary
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table ly_dictionary
-- ----------------------------
ALTER TABLE [dbo].[ly_dictionary] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table ly_log
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table ly_log
-- ----------------------------
ALTER TABLE [dbo].[ly_log] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table ly_resources
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table ly_resources
-- ----------------------------
ALTER TABLE [dbo].[ly_resources] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table ly_role
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table ly_role
-- ----------------------------
ALTER TABLE [dbo].[ly_role] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table ly_server_info
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table ly_server_info
-- ----------------------------
ALTER TABLE [dbo].[ly_server_info] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table ly_user
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table ly_user
-- ----------------------------
ALTER TABLE [dbo].[ly_user] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table ly_userlogin
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table ly_userlogin
-- ----------------------------
ALTER TABLE [dbo].[ly_userlogin] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table test
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table test
-- ----------------------------
ALTER TABLE [dbo].[test] ADD PRIMARY KEY ([test_id])
GO
