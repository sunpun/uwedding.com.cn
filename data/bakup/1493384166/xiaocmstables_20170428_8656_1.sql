# xiaocms bakfile
# version:xiaocms x1 
# time:2017-04-28 20:56:08
# http://www.xiaocms.com
# ----------------------------------------


DROP TABLE IF EXISTS `hy_admin`;
CREATE TABLE `hy_admin` (
  `userid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `roleid` smallint(5) DEFAULT '0',
  `realname` varchar(50) NOT NULL DEFAULT '',
  `auth` text NOT NULL,
  `list_size` smallint(5) NOT NULL,
  `left_width` smallint(5) NOT NULL DEFAULT '150',
  PRIMARY KEY (`userid`),
  KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `hy_admin` VALUES('1','admin','c3284d0f94606de1fd2af172aba15bf3','1','超级管理员','','10','150');

DROP TABLE IF EXISTS `hy_block`;
CREATE TABLE `hy_block` (
  `id` smallint(8) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) NOT NULL,
  `name` varchar(50) NOT NULL,
  `content` mediumtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO `hy_block` VALUES('1','2','幻灯图片1','http://demo.xiaocms.com/template/default/images/1.png');
INSERT INTO `hy_block` VALUES('2','2','幻灯图片2','http://demo.xiaocms.com/template/default/images/2.png');
INSERT INTO `hy_block` VALUES('3','2','幻灯图片3','http://demo.xiaocms.com/template/default/images/3.png');

DROP TABLE IF EXISTS `hy_category`;
CREATE TABLE `hy_category` (
  `catid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `typeid` tinyint(1) NOT NULL,
  `modelid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `parentid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `child` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `childids` varchar(255) NOT NULL,
  `catname` varchar(30) NOT NULL,
  `image` varchar(100) NOT NULL,
  `content` mediumtext NOT NULL,
  `seo_title` varchar(255) NOT NULL,
  `seo_keywords` varchar(255) NOT NULL,
  `seo_description` varchar(255) NOT NULL,
  `catdir` varchar(30) NOT NULL,
  `http` varchar(255) NOT NULL,
  `items` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ismenu` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `ispost` smallint(2) NOT NULL,
  `verify` smallint(2) NOT NULL DEFAULT '0',
  `islook` smallint(2) NOT NULL,
  `listtpl` varchar(50) NOT NULL,
  `showtpl` varchar(50) NOT NULL,
  `pagetpl` varchar(50) NOT NULL,
  `pagesize` smallint(5) NOT NULL,
  PRIMARY KEY (`catid`),
  KEY `listorder` (`listorder`,`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `hy_content`;
CREATE TABLE `hy_content` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `modelid` smallint(5) NOT NULL,
  `title` varchar(80) NOT NULL DEFAULT '',
  `thumb` varchar(255) NOT NULL DEFAULT '',
  `keywords` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL,
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `hits` smallint(5) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `catid` (`catid`,`listorder`,`time`),
  KEY `time` (`catid`,`time`),
  KEY `status` (`catid`,`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `hy_content_news`;
CREATE TABLE `hy_content_news` (
  `id` mediumint(8) NOT NULL,
  `catid` smallint(5) NOT NULL,
  `content` mediumtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `hy_content_product`;
CREATE TABLE `hy_content_product` (
  `id` mediumint(8) NOT NULL,
  `catid` smallint(5) NOT NULL,
  `content` mediumtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `hy_form_order`;
CREATE TABLE `hy_form_order` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `cid` mediumint(8) NOT NULL,
  `userid` mediumint(8) NOT NULL,
  `username` char(20) NOT NULL,
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `time` int(10) unsigned NOT NULL DEFAULT '0',
  `ip` char(20) DEFAULT NULL,
  `uname` varchar(255) NOT NULL,
  `lianxidianhua` varchar(255) NOT NULL,
  `vtime` varchar(255) NOT NULL,
  `addtime` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `time` (`time`),
  KEY `userid` (`userid`),
  KEY `cid` (`cid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `hy_keylink`;
CREATE TABLE `hy_keylink` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `link` varchar(100) NOT NULL,
  `weight` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `hy_member`;
CREATE TABLE `hy_member` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `username` char(20) NOT NULL DEFAULT '',
  `password` char(32) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL,
  `avatar` varchar(100) NOT NULL DEFAULT '',
  `modelid` smallint(5) NOT NULL,
  `regdate` int(10) unsigned NOT NULL DEFAULT '0',
  `regip` varchar(50) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `hy_member_connect`;
CREATE TABLE `hy_member_connect` (
  `uid` mediumint(9) NOT NULL,
  `openid` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `hy_member_geren`;
CREATE TABLE `hy_member_geren` (
  `id` mediumint(8) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `hy_model`;
CREATE TABLE `hy_model` (
  `modelid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `typeid` tinyint(3) NOT NULL,
  `modelname` char(30) NOT NULL,
  `tablename` char(20) NOT NULL,
  `listtpl` varchar(30) NOT NULL,
  `showtpl` varchar(30) NOT NULL,
  `joinid` smallint(5) DEFAULT NULL,
  `setting` text,
  PRIMARY KEY (`modelid`),
  KEY `typeid` (`typeid`),
  KEY `joinid` (`joinid`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

INSERT INTO `hy_model` VALUES('1','1','文章模型','content_news','list_news.html','show_news.html','0','a:1:{s:7:\"default\";a:6:{s:5:\"title\";a:2:{s:4:\"name\";s:6:\"标题\";s:4:\"show\";s:1:\"1\";}s:8:\"keywords\";a:2:{s:4:\"name\";s:9:\"关键字\";s:4:\"show\";s:1:\"1\";}s:5:\"thumb\";a:2:{s:4:\"name\";s:9:\"缩略图\";s:4:\"show\";s:1:\"1\";}s:11:\"description\";a:2:{s:4:\"name\";s:6:\"描述\";s:4:\"show\";s:1:\"1\";}s:4:\"time\";a:2:{s:4:\"name\";s:12:\"发布时间\";s:4:\"show\";s:1:\"1\";}s:4:\"hits\";a:2:{s:4:\"name\";s:9:\"阅读数\";s:4:\"show\";s:1:\"1\";}}}');
INSERT INTO `hy_model` VALUES('2','1','产品模型','content_product','list_product.html','show_product.html','','a:1:{s:7:\"default\";a:6:{s:5:\"title\";a:2:{s:4:\"name\";s:6:\"标题\";s:4:\"show\";s:1:\"1\";}s:8:\"keywords\";a:2:{s:4:\"name\";s:9:\"关键字\";s:4:\"show\";s:1:\"1\";}s:5:\"thumb\";a:2:{s:4:\"name\";s:9:\"缩略图\";s:4:\"show\";s:1:\"1\";}s:11:\"description\";a:2:{s:4:\"name\";s:6:\"描述\";s:4:\"show\";s:1:\"1\";}s:4:\"time\";a:2:{s:4:\"name\";s:12:\"发布时间\";s:4:\"show\";s:1:\"1\";}s:4:\"hits\";a:2:{s:4:\"name\";s:9:\"阅读数\";s:4:\"show\";s:1:\"1\";}}}');
INSERT INTO `hy_model` VALUES('5','2','个人','member_geren','list_geren.html','show_geren.html','','');
INSERT INTO `hy_model` VALUES('7','3','预约参观','form_order','list_order.html','form.html','','a:1:{s:4:\"form\";a:9:{s:4:\"post\";s:1:\"0\";s:3:\"num\";s:1:\"0\";s:4:\"time\";s:0:\"\";s:5:\"check\";s:1:\"0\";s:4:\"code\";s:1:\"0\";s:6:\"member\";s:1:\"0\";s:5:\"email\";s:1:\"0\";s:11:\"smtpemailto\";s:0:\"\";s:11:\"mailsubject\";s:0:\"\";}}');

DROP TABLE IF EXISTS `hy_model_field`;
CREATE TABLE `hy_model_field` (
  `fieldid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `modelid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `field` varchar(20) NOT NULL,
  `name` varchar(30) NOT NULL,
  `isshow` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `tips` text NOT NULL,
  `pattern` varchar(255) NOT NULL,
  `errortips` varchar(255) NOT NULL,
  `formtype` varchar(20) NOT NULL,
  `setting` mediumtext NOT NULL,
  `listorder` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`fieldid`),
  KEY `modelid` (`modelid`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

INSERT INTO `hy_model_field` VALUES('1','1','content','内容','1','','','','editor','a:4:{s:7:\"toolbar\";s:1:\"1\";s:5:\"width\";s:3:\"700\";s:6:\"height\";s:3:\"450\";s:12:\"defaultvalue\";s:0:\"\";}','0','0');
INSERT INTO `hy_model_field` VALUES('2','2','content','内容','1','','','','editor','a:5:{s:7:\"toolbar\";s:1:\"2\";s:5:\"items\";s:256:\"\'source\',\'|\',\'forecolor\',\'bold\',\'italic\',\'underline\',\'lineheight\',\'|\',\'fontname\',\'fontsize\',\'code\',\'plainpaste\',\'wordpaste\',\'|\',\'image\',\'multiimage\',\'flash\',\'media\',\'insertfile\',\'link\',\'unlink\',\'|\',\'justifyleft\',\'justifycenter\',\'justifyright\',\'justifyfull\'\";s:5:\"width\";s:3:\"700\";s:6:\"height\";s:3:\"450\";s:12:\"defaultvalue\";s:190:\"编辑器支持自定义啦，赶快去内容模型》产品模型》字段管理》编辑器里面看看吧&lt;br&gt;如需更多字段，请大家自己在字段管理处自行添加吧。\";}','0','0');
INSERT INTO `hy_model_field` VALUES('13','7','vtime','参观日期','1','','1','','input','','0','0');
INSERT INTO `hy_model_field` VALUES('14','7','addtime','提交时间','1','','1','','date','a:1:{s:4:\"type\";s:16:\"yyyy-MM-dd HH:mm\";}','1','0');
INSERT INTO `hy_model_field` VALUES('11','7','uname','姓名','1','','1','','input','','3','0');
INSERT INTO `hy_model_field` VALUES('12','7','lianxidianhua','联系电话','1','','/^(1)[0-9]{10}$/','','input','a:2:{s:4:\"size\";s:3:\"180\";s:12:\"defaultvalue\";s:0:\"\";}','2','0');

