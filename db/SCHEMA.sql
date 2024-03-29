# Dump of table instructions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `instructions`;

CREATE TABLE `instructions` (
  `id` int(11) NOT NULL,
  `instructions` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `instructions` WRITE;
/*!40000 ALTER TABLE `instructions` DISABLE KEYS */;

INSERT INTO `instructions` (`id`, `instructions`)
VALUES
	(1,'You can write instructions under admin menu!');

/*!40000 ALTER TABLE `instructions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ipaddresses
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ipaddresses`;

CREATE TABLE `ipaddresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subnetId` text NOT NULL,
  `ip_addr` varchar(100) NOT NULL,
  `description` varchar(64) DEFAULT NULL,
  `dns_name` varchar(64) NOT NULL,
  `mac` varchar(20) DEFAULT NULL,
  `owner` varchar(32) DEFAULT NULL,
  `state` varchar(1) DEFAULT '1',
  `switch` varchar(32) DEFAULT NULL,
  `port` varchar(32) DEFAULT NULL,
  `note` text,
  `lastSeen` DATETIME  NULL  DEFAULT '0000-00-00 00:00:00',
  `excludePing` BINARY  NULL  DEFAULT '0',
  `editDate` TIMESTAMP  NULL  ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `ipaddresses` WRITE;
/*!40000 ALTER TABLE `ipaddresses` DISABLE KEYS */;

INSERT INTO `ipaddresses` (`id`, `subnetId`, `ip_addr`, `description`, `dns_name`, `mac`, `owner`, `state`, `switch`, `port`, `note`)
VALUES
	(1,'3','168427779','Server1','server1.cust1.local','','','1','','',''),
	(2,'3','168427780','Server2','server2.cust1.local','','','1','','',''),
	(3,'3','168427781','Server3','server3.cust1.local','','','2','','',''),
	(4,'3','168427782','Server4','server4.cust1.local','','','2','','',''),
	(5,'3','168428021','Gateway','','','','1','','',''),
	(6,'4','168428286','Gateway','','','','1','','',''),
	(7,'4','168428042','Server1','ser1.client2.local','','','1','','',''),
	(8,'6','1507077123','webserver','89-212-44-3.dynamic.t-2.net','','','1','','',''),
	(9,'6','1507077124','webserver','89-212-44-4.dynamic.t-2.net','','','1','','',''),
	(10,'6','1507077125','webserver','89-212-44-5.dynamic.t-2.net','','','1','','',''),
	(11,'6','1507077126','webserver','89-212-44-6.dynamic.t-2.net','','','1','','',''),
	(12, '10', '172037636', 'DHCP range', '', '', '', '3', '', '', ''),
	(13, '10', '172037637', 'DHCP range', '', '', '', '3', '', '', ''),
	(14, '10', '172037638', 'DHCP range', '', '', '', '3', '', '', '');

/*!40000 ALTER TABLE `ipaddresses` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table logs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `logs`;

CREATE TABLE `logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `severity` int(11) DEFAULT NULL,
  `date` varchar(32) DEFAULT NULL,
  `username` varchar(32) DEFAULT NULL,
  `ipaddr` varchar(64) DEFAULT NULL,
  `command` varchar(128) DEFAULT '0',
  `details` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table requests
# ------------------------------------------------------------

DROP TABLE IF EXISTS `requests`;

CREATE TABLE `requests` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `subnetId` varchar(11) DEFAULT NULL,
  `ip_addr` varchar(100) DEFAULT NULL,
  `description` varchar(32) DEFAULT NULL,
  `dns_name` varchar(32) DEFAULT NULL,
  `owner` varchar(32) DEFAULT NULL,
  `requester` varchar(32) DEFAULT NULL,
  `comment` text,
  `processed` binary(1) DEFAULT NULL,
  `accepted` binary(1) DEFAULT NULL,
  `adminComment` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sections
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sections`;

CREATE TABLE `sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL DEFAULT '',
  `description` text,
  `masterSection` INT(11)  NULL  DEFAULT '0',
  `permissions` varchar(1024) DEFAULT NULL,
  `strictMode` INT(1)  NOT NULL  DEFAULT '1',
  `subnetOrdering` VARCHAR(16)  NULL  DEFAULT NULL,
  `order` INT(3)  NULL  DEFAULT NULL,
  `editDate` TIMESTAMP  NULL  ON UPDATE CURRENT_TIMESTAMP,
  `showVLAN` BOOL  NOT NULL  DEFAULT '0',
  `showVRF` BOOL  NOT NULL  DEFAULT '0',
  PRIMARY KEY (`name`),
  UNIQUE KEY `id_2` (`id`),
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;

INSERT INTO `sections` (`id`, `name`, `description`, `permissions`)
VALUES
	(1,'Customers','Section for customers','{\"3\":\"1\",\"2\":\"2\"}'),
	(2,'Servers','Section for servers','{\"3\":\"1\",\"2\":\"2\"}'),
	(3,'IPv6','Section for IPv6 addresses','{\"3\":\"1\",\"2\":\"2\"}');

/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table settings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `settings`;

CREATE TABLE `settings` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `siteTitle` varchar(64) DEFAULT NULL,
  `siteAdminName` varchar(64) DEFAULT NULL,
  `siteAdminMail` varchar(64) DEFAULT NULL,
  `siteDomain` varchar(32) DEFAULT NULL,
  `siteURL` varchar(64) DEFAULT NULL,
  `domainAuth` tinyint(1) DEFAULT NULL,
  `showTooltips` tinyint(1) DEFAULT NULL,
  `enableIPrequests` tinyint(1) DEFAULT NULL,
  `enableVRF` tinyint(1) DEFAULT '1',
  `enableDNSresolving` tinyint(1) DEFAULT NULL,
  `version` varchar(5) DEFAULT NULL,
  `donate` tinyint(1) DEFAULT '0',
  `IPfilter` varchar(128) DEFAULT NULL,
  `printLimit` int(4) unsigned DEFAULT '25',
  `vlanDuplicate` int(1) DEFAULT '0',
  `subnetOrdering` varchar(16) DEFAULT 'subnet,asc',
  `visualLimit` int(2) NOT NULL DEFAULT '0',
  `htmlMail` binary(1) NOT NULL DEFAULT '1',
  `pingStatus` VARCHAR(12)  NOT NULL  DEFAULT '1800;3600',
  `defaultLang` INT(3)  NULL  DEFAULT NULL,
  `editDate` TIMESTAMP  NULL  ON UPDATE CURRENT_TIMESTAMP,
  `dhcpCompress` BOOL  NOT NULL  DEFAULT '0',
  `api` BINARY  NOT NULL  DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;

INSERT INTO `settings` (`id`, `siteTitle`, `siteAdminName`, `siteAdminMail`, `siteDomain`, `siteURL`, `domainAuth`, `showTooltips`, `enableIPrequests`, `enableVRF`, `enableDNSresolving`, `version`, `donate`, `IPfilter`, `printLimit`, `vlanDuplicate`, `subnetOrdering`, `visualLimit`, `htmlMail`)
VALUES
	(1, 'phpipam IP address management', 'Sysadmin', 'admin@domain.local', 'domain.local', 'http://yourpublicurl.com', 0, 1, 1, 1, 0, '0.9', 0, 'mac;owner;state;switch;note', 50, 1, 'subnet,asc', 24, X'31');
	
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table settingsDomain
# ------------------------------------------------------------

DROP TABLE IF EXISTS `settingsDomain`;

CREATE TABLE `settingsDomain` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `account_suffix` varchar(256) DEFAULT '@domain.local',
  `base_dn` varchar(256) DEFAULT 'CN=Users,CN=Company,DC=domain,DC=local',
  `domain_controllers` varchar(256) DEFAULT 'dc1.domain.local;dc2.domain.local',
  `use_ssl` tinyint(1) DEFAULT '0',
  `use_tls` tinyint(1) DEFAULT '0',
  `ad_port` int(5) DEFAULT '389',
  `adminUsername` VARCHAR(64)  NULL  DEFAULT NULL ,
  `adminPassword` VARCHAR(64)  NULL  DEFAULT NULL ,
  `editDate` TIMESTAMP  NULL  ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `settingsDomain` WRITE;
/*!40000 ALTER TABLE `settingsDomain` DISABLE KEYS */;

INSERT INTO `settingsDomain` (`id`, `account_suffix`, `base_dn`, `domain_controllers`, `use_ssl`, `use_tls`, `ad_port`)
VALUES
	(1,'@domain.local','CN=Users,CN=Company,DC=domain,DC=local','dc1.domain.local;dc2.domain.local',0,0,389);

/*!40000 ALTER TABLE `settingsDomain` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table subnets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `subnets`;

CREATE TABLE `subnets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subnet` varchar(255) NOT NULL,
  `mask` varchar(255) NOT NULL,
  `sectionId` int(12) DEFAULT NULL,
  `description` text NOT NULL,
  `vrfId` int(3) DEFAULT NULL,
  `masterSubnetId` int(12) DEFAULT 0,
  `allowRequests` tinyint(1) DEFAULT '0',
  `vlanId` int(11) DEFAULT NULL,
  `showName` tinyint(1) DEFAULT '0',
  `permissions` varchar(1024) DEFAULT NULL,
  `pingSubnet` BOOL  NOT NULL  DEFAULT '0',
  `isFolder` INT  NOT NULL  DEFAULT '0',
  `editDate` TIMESTAMP  NULL  ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `subnets` WRITE;
/*!40000 ALTER TABLE `subnets` DISABLE KEYS */;

INSERT INTO `subnets` (`id`, `subnet`, `mask`, `sectionId`, `description`, `vrfId`, `masterSubnetId`, `allowRequests`, `vlanId`, `showName`, `permissions`, `isFolder`)
VALUES
	(1,'336395549904799703390415618052362076160','64','3','Private subnet 1',0,'0',1,1,1,'{\"3\":\"1\",\"2\":\"2\"}',0),
	(2,'168427520','16','1','Business customers',0,'0',1,0,1,'{\"3\":\"1\",\"2\":\"2\"}',0),
	(3,'168427776','24','1','Customer 1',0,'2',1,0,1,'{\"3\":\"1\",\"2\":\"2\"}',0),
	(4,'168428032','24','1','Customer 2',0,'2',1,0,1,'{\"3\":\"1\",\"2\":\"2\"}',0),
	(5,'168460288','17','2','DMZ zone',0,'0',1,0,1,'{\"3\":\"1\",\"2\":\"2\"}',0),
	(6,'1507077120','24','2','Public translations for DMZ',0,'0',1,0,1,'{\"3\":\"1\",\"2\":\"2\"}',0),
	(7,'168460288','23','2','DMZ production',0,'5',1,0,1,'{\"3\":\"1\",\"2\":\"2\"}',0),
	(8,'168460800','23','2','DMZ testing',0,'5',1,0,1,'{\"3\":\"1\",\"2\":\"2\"}',0),
	(9, '0', '', 1, 'My folder', 0, 0, 0, 0, 0, '{\"3\":\"1\",\"2\":\"2\"}', 1),
	(10, '172037632', '24', 1, 'DHCP range', 0, 9, 0, 0, 1, '{\"3\":\"1\",\"2\":\"2\"}', 0);

/*!40000 ALTER TABLE `subnets` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table switches
# ------------------------------------------------------------

DROP TABLE IF EXISTS `switches`;

CREATE TABLE `switches` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `hostname` varchar(32) DEFAULT NULL,
  `ip_addr` varchar(100) DEFAULT NULL,
  `type` int(2) DEFAULT '0',
  `vendor` varchar(156) DEFAULT NULL,
  `model` varchar(124) DEFAULT NULL,
  `version` varchar(128) DEFAULT NULL,
  `description` varchar(256) DEFAULT NULL,
  `sections` varchar(128) DEFAULT NULL,
  `editDate` TIMESTAMP  NULL  ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `hostname` (`hostname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `switches` WRITE;
/*!40000 ALTER TABLE `switches` DISABLE KEYS */;

INSERT INTO `switches` (`id`, `hostname`, `ip_addr`, `type`, `vendor`, `model`, `version`, `description`, `sections`)
VALUES
	(1,'CoreSwitch','10.10.10.254',0,'Cisco','c6500','','','1;2;3'),
	(2,'Wifi-1','10.10.20.245',4,'Cisco','','','','1');

/*!40000 ALTER TABLE `switches` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table userGroups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `userGroups`;

CREATE TABLE `userGroups` (
  `g_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `g_name` varchar(32) DEFAULT NULL,
  `g_desc` varchar(1024) DEFAULT NULL,
  `editDate` TIMESTAMP  NULL  ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`g_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `userGroups` WRITE;
/*!40000 ALTER TABLE `userGroups` DISABLE KEYS */;

INSERT INTO `userGroups` (`g_id`, `g_name`, `g_desc`)
VALUES
	(2,'Operators','default Operator group'),
	(3,'Guests','default Guest group (viewers)');

/*!40000 ALTER TABLE `userGroups` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `password` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `groups` varchar(1024) COLLATE utf8_bin DEFAULT NULL,
  `role` text CHARACTER SET utf8,
  `real_name` varchar(128) CHARACTER SET utf8 DEFAULT NULL,
  `email` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `domainUser` binary(1) DEFAULT '0',
  `widgets` VARCHAR(1024)  NULL  DEFAULT 'statistics;top10_hosts_v4;top10_hosts_v6;top10_percentage',
  `lang` INT(2)  NULL  DEFAULT '1',
  `editDate` TIMESTAMP  NULL  ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`username`),
  UNIQUE KEY `id_2` (`id`),
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `username`, `password`, `groups`, `role`, `real_name`, `email`, `domainUser`,`widgets`)
VALUES
	(1,'Admin',X'6431306262383036653937643335333866623133623535383164623131653965',X'','Administrator','phpIPAM Admin','admin@domain.local',X'30','statistics;top10_hosts_v4;top10_hosts_v6;top10_percentage;access_logs;error_logs;');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table lang
# ------------------------------------------------------------

DROP TABLE IF EXISTS `lang`;

/**
 * Languages
 */
CREATE TABLE `lang` (
  `l_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `l_code` varchar(12) NOT NULL DEFAULT '',
  `l_name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`l_id`)
) DEFAULT CHARSET=utf8;

/* insert default languages */
INSERT INTO `lang` (`l_id`, `l_code`, `l_name`)
VALUES
	(1, 'en', 'English'),
	(2, 'sl_SI', 'Slovenščina'),
	(3, 'fr_FR', 'Français'),
	(4, 'nl_NL','Nederlands'),
	(5, 'de_DE','Deutsch');



# Dump of table vlans
# ------------------------------------------------------------

DROP TABLE IF EXISTS `vlans`;

CREATE TABLE `vlans` (
  `vlanId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `number` int(4) DEFAULT NULL,
  `description` text,
  `editDate` TIMESTAMP  NULL  ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`vlanId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `vlans` WRITE;
/*!40000 ALTER TABLE `vlans` DISABLE KEYS */;

INSERT INTO `vlans` (`vlanId`, `name`, `number`, `description`)
VALUES
	(1,'IPv6 private 1',6001,'IPv6 private 1 subnets'),
	(2,'Servers DMZ',6101,'DMZ public');

/*!40000 ALTER TABLE `vlans` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table vrf
# ------------------------------------------------------------

DROP TABLE IF EXISTS `vrf`;

CREATE TABLE `vrf` (
  `vrfId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '',
  `rd` varchar(32) DEFAULT NULL,
  `description` varchar(256) DEFAULT NULL,
  `editDate` TIMESTAMP  NULL  ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`vrfId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


# Dump of table api
# ------------------------------------------------------------

DROP TABLE IF EXISTS `api`;

CREATE TABLE `api` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `app_id` varchar(32) NOT NULL DEFAULT '',
  `app_code` varchar(32) NOT NULL DEFAULT '',
  `app_permissions` int(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_id` (`app_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;


# update version
# ------------------------------------------------------------
UPDATE `settings` set `version` = '0.9';