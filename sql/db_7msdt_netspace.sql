CREATE TABLE `ms_archive` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
); 

CREATE TABLE `ms_archivedclasses` (
  `classId` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `archiveId` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
);

CREATE TABLE `ms_articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site` varchar(45) CHARACTER SET latin2 COLLATE latin2_czech_cs NOT NULL,
  `type` int(11) NOT NULL,
  `anchor` int(11) NOT NULL,
  `title` varchar(100) CHARACTER SET latin2 COLLATE latin2_czech_cs DEFAULT NULL,
  `title_image` varchar(200) CHARACTER SET latin2 COLLATE latin2_czech_cs DEFAULT NULL,
  `image` varchar(200) CHARACTER SET latin2 COLLATE latin2_czech_cs DEFAULT NULL,
  `content` longtext CHARACTER SET latin2 COLLATE latin2_czech_cs,
  `parent_article` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `date` datetime DEFAULT NULL,
  `edited_by` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `ms_classes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `empTitle` varchar(45) DEFAULT NULL,
  `name` varchar(45) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) 

CREATE TABLE `ms_contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adName` varchar(45) CHARACTER SET latin2 COLLATE latin2_czech_cs DEFAULT NULL,
  `street` varchar(45) CHARACTER SET latin2 COLLATE latin2_czech_cs DEFAULT NULL,
  `city` varchar(45) CHARACTER SET latin2 COLLATE latin2_czech_cs DEFAULT NULL,
  `content` text CHARACTER SET latin2 COLLATE latin2_czech_cs,
  PRIMARY KEY (`id`)
); 

CREATE TABLE `ms_documents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) COLLATE latin2_czech_cs NOT NULL,
  `file` varchar(100) COLLATE latin2_czech_cs NOT NULL,
  `user` varchar(45) COLLATE latin2_czech_cs DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `type` int(11) NOT NULL,
  `order` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
); 

CREATE TABLE `ms_elements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idArticle` int(11) DEFAULT NULL,
  `idNote` int(11) DEFAULT NULL,
  `idContact` int(11) DEFAULT NULL,
  `idEvent` int(11) DEFAULT NULL,
  `idClass` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
); 

CREATE TABLE `ms_employees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `idClass` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_idx` (`idClass`)
); 

CREATE TABLE `ms_events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) CHARACTER SET latin2 COLLATE latin2_czech_cs NOT NULL,
  `content` text CHARACTER SET latin2 COLLATE latin2_czech_cs NOT NULL,
  `date` datetime DEFAULT NULL,
  `user` varchar(45) DEFAULT NULL,
  `classId` int(11) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `archiveId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `ms_gallery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file` varchar(100) COLLATE latin2_czech_cs NOT NULL,
  `thumb` varchar(100) COLLATE latin2_czech_cs NOT NULL,
  `idEvent` int(11) NOT NULL,
  PRIMARY KEY (`id`)
); 

CREATE TABLE `ms_notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) CHARACTER SET latin2 COLLATE latin2_czech_cs NOT NULL,
  `content` text CHARACTER SET latin2 COLLATE latin2_czech_cs NOT NULL,
  `color` tinyint(4) NOT NULL,
  `order` int(11) NOT NULL,
  `date` datetime DEFAULT NULL,
  `user` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
); 

CREATE TABLE `ms_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET latin2 COLLATE latin2_czech_cs NOT NULL,
  `url_tag` varchar(45) NOT NULL,
  `order` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
); 

CREATE TABLE `ms_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(45) NOT NULL,
  `password` varchar(100) NOT NULL,
  `role` varchar(10) NOT NULL,
  `r_doc` tinyint(4) NOT NULL,
  `r_event` tinyint(4) NOT NULL,
  `r_info` tinyint(4) NOT NULL,
  `last_activity` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login_UNIQUE` (`login`)
); 

CREATE TABLE `ms_videogallery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `link` varchar(200) NOT NULL,
  `idEvent` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Id_UNIQUE` (`id`)
); 
