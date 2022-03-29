/*==============================================================*/
/* Nom de SGBD :  MySQL 5.0                                     */
/* Date de cr�ation :  29/03/2022 09:47:01                      */
/*==============================================================*/


drop table if exists ADDRESS;

drop table if exists APPLY_AT;

drop table if exists ASSOCIATE_ROLE;

drop table if exists BIND;

drop table if exists CENTER;

drop table if exists COMPANY;

drop table if exists ESTABLISHMENT;

drop table if exists EVALUATE;

drop table if exists FOLLOW;

drop table if exists LINK;

drop table if exists LOCATE;

drop table if exists LOG;

drop table if exists OFFER;

drop table if exists OFFER_STEP;

drop table if exists PROMOTION;

drop table if exists ROLE;

drop table if exists SKILL;

drop table if exists TOWN;

drop table if exists USER;

drop table if exists WHISHLIST;

DELIMITER $$
--
-- Procédures
--
DROP PROCEDURE IF EXISTS `final_offer_view`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `final_offer_view` ()  BEGIN
SELECT offer.ID_OFFER, company.COMPANY_NAME, offer.OFFER_NAME, offer.MISSION, offer.SALARY, offer.MIN_DURATION, offer.MAX_DURATION, offer.TRUST, evaluate.EVALUATION, offer.NUMBER_OF_PLACES from offer inner join company on company.ID_COMPANY = offer.ID_COMPANY inner join evaluate on evaluate.ID_OFFER = offer.ID_OFFER;
END$$

DROP PROCEDURE IF EXISTS `profile`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `profile` (IN `id` INT)  BEGIN
SELECT CONCAT(user.FIRST_NAME, " ", user.LAST_NAME) AS Name, user.EMAIL, user.PHONE_NUMBER, concat(address.NUMBER, " ", address.STREET, " ", address.COMPLEMENT, " ", town.TOWN_NAME, " ", address.POSTAL_CODE) AS ADDRESS FROM `user` inner join address on address.ID_ADDRESS = user.ID_ADDRESS inner join town on town.ID_TOWN = address.ID_TOWN WHERE user.ID_USER = id;
END$$

DROP PROCEDURE IF EXISTS `role_management`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `role_management` ()  BEGIN
SELECT CONCAT(user.LAST_NAME, user.FIRST_NAME) AS Name, promotion.PROMOTION_NAME, role.ROLE_NAME FROM `role` inner join associate_role on associate_role.ID_ROLE = role.ID_ROLE inner join user on associate_role.ID_USER = user.ID_USER inner join promotion on promotion.ID_PROMOTION = user.ID_PROMOTION;
END$$

DROP PROCEDURE IF EXISTS `searchIntership`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `searchIntership` (IN `offerName` VARCHAR(255), IN `companyName` VARCHAR(255), IN `skillName` VARCHAR(255), IN `townName` VARCHAR(255), IN `activitySector` VARCHAR(255), IN `intershipLength` INT)  BEGIN
select final_offer.ID_OFFER, final_offer.ID_COMPANY, final_offer.COMPANY_NAME, final_offer.OFFER_NAME, final_offer.MISSION, final_offer.SALARY, final_offer.MIN_DURATION, final_offer.MAX_DURATION, final_offer.OFFER_DATE, final_offer.TRUST, final_offer.NUMBER_OF_PLACES, final_bind.SKILL_NAME from final_offer 
inner join final_bind on final_bind.ID_OFFER = final_offer.ID_OFFER
inner join locate on locate.ID_COMPANY = final_offer.ID_COMPANY
inner join address on locate.ID_ADDRESS = address.ID_ADDRESS
inner join town on town.ID_TOWN = address.ID_TOWN
inner join final_establishment on final_establishment.ID_COMPANY = final_offer.ID_COMPANY


where (final_offer.OFFER_NAME like concat("%",offerName,"%")
or final_offer.COMPANY_NAME like concat("%",companyName,"%")
or final_bind.SKILL_NAME like concat("%",skillName,"%") 
or town.TOWN_NAME like concat("%",townName,"%"))
and final_establishment.ACTIVITY_SECTOR like concat("%",activitySector,"%") and DATEDIFF(final_offer.MAX_DURATION, final_offer.MIN_DURATION) >= intershipLength

ORDER BY final_offer.ID_OFFER;
END$$

DELIMITER ;

/*==============================================================*/
/* Table : ADDRESS                                              */
/*==============================================================*/
create table ADDRESS
(
   ID_ADDRESS           int not null AUTO_INCREMENT,
   ID_TOWN              int not null,
   STREET               varchar(255) not null,
   NUMBER               varchar(5) not null,
   POSTAL_CODE          varchar(5) not null,
   COMPLEMENT           varchar(255) not null,
   primary key (ID_ADDRESS)
);

INSERT INTO `address` (`ID_ADDRESS`, `ID_TOWN`, `STREET`, `NUMBER`, `POSTAL_CODE`, `COMPLEMENT`) VALUES
(1, 1, 'rue du docteur gallouen', '770', '76520', ''),
(2, 2, 'rue des briques', '15', '76000', ''),
(3, 2, 'rue des grands hommes', '156', '76000', ''),
(4, 2, 'rue des biomes', '2', '76000', ''),
(5, 3, 'rue des carnes', '6', '76920', ''),
(6, 4, 'rue des papillotes', '4', '27000', ''),
(7, 5, 'rue des délégués', '8', '76520', ''),
(8, 6, 'Avenue Edmund Allay', '150', '76100', ''),
(9, 2, 'Avenue de potion', '12', '76000', ''),
(10, 7, 'Avenue des voitures', '11', '76980', ''),
(11, 6, 'Avenue Edmund Allay', '152', '76100', '');

/*==============================================================*/
/* Table : APPLY_AT                                             */
/*==============================================================*/
create table APPLY_AT
(
   ID_USER              int not null,
   ID_OFFER             int not null,
   primary key (ID_USER, ID_OFFER)
);

INSERT INTO `apply_at` (`ID_USER`, `ID_OFFER`) VALUES
(1, 1),
(1, 3),
(2, 1),
(2, 2),
(2, 3),
(3, 1),
(3, 2),
(4, 2),
(5, 1),
(5, 2),
(5, 3);

/*==============================================================*/
/* Table : ASSOCIATE_ROLE                                       */
/*==============================================================*/
create table ASSOCIATE_ROLE
(
   ID_USER              int not null,
   ID_ROLE              int not null,
   primary key (ID_USER, ID_ROLE)
);

INSERT INTO `associate_role` (`ID_USER`, `ID_ROLE`) VALUES
(1, 1),
(2, 1),
(3, 4),
(4, 4),
(5, 4),
(6, 2),
(7, 3);

/*==============================================================*/
/* Table : BIND                                                 */
/*==============================================================*/
create table BIND
(
   ID_SKILL             int not null,
   ID_OFFER             int not null,
   primary key (ID_SKILL, ID_OFFER)
);

INSERT INTO `bind` (`ID_SKILL`, `ID_OFFER`) VALUES
(3, 3),
(4, 1),
(5, 2),
(6, 2),
(7, 2),
(9, 2),
(10, 1),
(11, 2),
(12, 3),
(14, 1),
(14, 3),
(15, 1),
(15, 3),
(16, 2),
(17, 1),
(18, 2),
(19, 2),
(20, 1);

/*==============================================================*/
/* Table : CENTER                                               */
/*==============================================================*/
create table CENTER
(
   ID_CENTER            int not null AUTO_INCREMENT,
   ID_TOWN              int not null,
   primary key (ID_CENTER)
);

INSERT INTO `center` (`ID_CENTER`, `ID_TOWN`) VALUES
(1, 2);

/*==============================================================*/
/* Table : COMPANY                                              */
/*==============================================================*/
create table COMPANY
(
   ID_COMPANY           int not null AUTO_INCREMENT,
   COMPANY_NAME         varchar(40) not null,
   ACTIVITY_SECTOR      varchar(40) not null,
   NUMBER_OF_STUDENTS   int not null,
   LOGO                 longblob,
   primary key (ID_COMPANY)
);

INSERT INTO `company` (`ID_COMPANY`, `COMPANY_NAME`, `ACTIVITY_SECTOR`, `NUMBER_OF_STUDENTS`) VALUES
(1, 'ISII-TECH', 'Infomatique Industrielle', 0),
(2, 'Potion', 'WEB', 2),
(3, 'Renault', 'Automobile', 1),
(4, 'CESI', 'Recherche', 0);

/*==============================================================*/
/* Table : ESTABLISHMENT                                        */
/*==============================================================*/
create table ESTABLISHMENT
(
   ID_ESTABLISHMENT     int not null AUTO_INCREMENT,
   ID_COMPANY           int not null,
   NUM_SIRET            varchar(255) not null,
   NUM_SIREN            varchar(255) not null,
   primary key (ID_ESTABLISHMENT)
);

INSERT INTO `establishment` (`ID_ESTABLISHMENT`, `ID_COMPANY`, `NUM_SIRET`, `NUM_SIREN`) VALUES
(1, 2, '82293430300014', '822934303'),
(2, 1, '507808236', '50780823600032'),
(3, 3, '780129987', '78012998703591');

/*==============================================================*/
/* Table : EVALUATE                                             */
/*==============================================================*/
create table EVALUATE
(
   ID_USER              int not null,
   ID_OFFER             int not null,
   EVALUATION           int not null,
   primary key (ID_USER, ID_OFFER)
);

INSERT INTO `evaluate` (`ID_USER`, `ID_OFFER`, `EVALUATION`) VALUES
(1, 1, 5),
(2, 2, 2),
(2, 3, 3),
(3, 1, 2),
(4, 2, 2),
(5, 1, 5),
(6, 3, 4),
(6, 2, 2),
(6, 4, 4),
(7, 3, 1);

/*==============================================================*/
/* Table : FOLLOW                                               */
/*==============================================================*/
create table FOLLOW
(
   ID_USER              int not null,
   ID_COMPANY           int not null,
   primary key (ID_USER, ID_COMPANY)
);

/*==============================================================*/
/* Table : LINK                                                 */
/*==============================================================*/
create table LINK
(
   ID_SKILL             int not null,
   ID_USER              int not null,
   primary key (ID_SKILL, ID_USER)
);

INSERT INTO `link` (`ID_SKILL`, `ID_USER`) VALUES
(1, 1),
(1, 2),
(2, 1),
(2, 2),
(2, 3),
(2, 4),
(2, 7),
(3, 1),
(3, 2),
(3, 4),
(3, 7),
(4, 1),
(4, 2),
(5, 1),
(5, 2),
(5, 3),
(5, 4),
(5, 5),
(5, 7),
(6, 1),
(6, 2),
(6, 3),
(6, 4),
(6, 5),
(6, 7),
(7, 1),
(7, 2),
(7, 3),
(7, 4),
(7, 5),
(7, 7),
(9, 1),
(9, 2),
(9, 3),
(9, 4),
(9, 5),
(9, 7),
(10, 1),
(10, 2),
(10, 3),
(10, 4),
(10, 5),
(10, 7),
(11, 1),
(11, 2),
(11, 3),
(11, 4),
(11, 5),
(11, 7),
(12, 1),
(12, 2),
(12, 3),
(12, 4),
(12, 5),
(12, 7),
(14, 1),
(14, 2),
(14, 3),
(14, 4),
(14, 5),
(14, 7),
(15, 1),
(15, 2),
(15, 3),
(15, 4),
(15, 5),
(15, 7),
(17, 1),
(17, 2),
(18, 1),
(18, 3),
(18, 4),
(18, 5),
(18, 7),
(20, 4),
(20, 5),
(20, 7);


/*==============================================================*/
/* Table : LOCATE                                               */
/*==============================================================*/
create table LOCATE
(
   ID_ADDRESS           int not null,
   ID_COMPANY           int not null,
   primary key (ID_ADDRESS, ID_COMPANY)
);

INSERT INTO `locate` (`ID_ADDRESS`, `ID_COMPANY`) VALUES
(8, 1),
(9, 2),
(10, 3),
(11, 4);

/*==============================================================*/
/* Table : LOG                                                  */
/*==============================================================*/
create table LOG
(
   ID_LOG               int not null AUTO_INCREMENT,
   ID_USER              int not null,
   ACTION               varchar(255) not null,
   LOG_DATE             date not null,
   primary key (ID_LOG)
);

/*==============================================================*/
/* Table : OFFER                                                */
/*==============================================================*/
create table OFFER
(
   ID_OFFER             int not null AUTO_INCREMENT,
   ID_COMPANY           int not null,
   OFFER_NAME           varchar(40) not null,
   MISSION              text not null,
   SALARY               float(8,2) not null,
   MIN_DURATION         date not null,
   MAX_DURATION         date not null,
   OFFER_DATE           date,
   TRUST                varchar(40),
   NUMBER_OF_PLACES     int,
   primary key (ID_OFFER)
);

INSERT INTO `offer` (`ID_OFFER`, `ID_COMPANY`, `OFFER_NAME`, `MISSION`, `SALARY`, `MIN_DURATION`, `MAX_DURATION`, `OFFER_DATE`, `TRUST`, `NUMBER_OF_PLACES`) VALUES
(1, 1, 'Development internship', 'The student will design a database of raw materials.', 591.60, '2022-04-04', '2022-07-29', '2022-03-24', 'Good', 2),
(2, 2, 'WEB internship', 'The student will have to set up a website for a client.', 620.00, '2022-04-04', '2022-07-29', '2022-03-22', 'Unknow', 1),
(3, 3, 'Development Internship', 'The student will have to set up a management application for a production line.', 720.00, '2022-04-04', '2022-07-29', '2022-03-16', 'Good', 3);

/*==============================================================*/
/* Table : OFFER_STEP                                           */
/*==============================================================*/
create table OFFER_STEP
(
   ID_USER              int not null,
   ID_OFFER             int not null,
   OFFER_STEP           int,
   primary key (ID_USER, ID_OFFER)
);

/*==============================================================*/
/* Table : PROMOTION                                            */
/*==============================================================*/
create table PROMOTION
(
   ID_PROMOTION         int not null AUTO_INCREMENT,
   PROMOTION_NAME       varchar(40) not null,
   primary key (ID_PROMOTION)
);

INSERT INTO `promotion` (`ID_PROMOTION`, `PROMOTION_NAME`) VALUES
(1, 'CPI-A1'),
(2, 'CPI-A2 Info'),
(3, 'A3 Info'),
(4, 'A4 Info'),
(5, 'A5 Info'),
(6, 'A3 Info Alternant'),
(7, 'A4 Info Alternant'),
(8, 'A5 Info Alternant');

/*==============================================================*/
/* Table : ROLE                                                 */
/*==============================================================*/
create table ROLE
(
   ID_ROLE              int not null AUTO_INCREMENT,
   ID_CENTER            int not null,
   ROLE_NAME            varchar(40) not null,
   primary key (ID_ROLE)
);

INSERT INTO `role` (`ID_ROLE`, `ID_CENTER`, `ROLE_NAME`) VALUES
(1, 1, 'Administrateur'),
(2, 1, 'Pilote'),
(3, 1, 'Délégué'),
(4, 1, 'Etudiant');


/*==============================================================*/
/* Table : SKILL                                                */
/*==============================================================*/
create table SKILL
(
   ID_SKILL             int not null AUTO_INCREMENT,
   SKILL_NAME           longtext not null,
   primary key (ID_SKILL)
);

INSERT INTO `skill` (`ID_SKILL`, `SKILL_NAME`) VALUES
(1, 'C'),
(2, 'C++'),
(3, 'C#'),
(4, 'Python'),
(5, 'HTML'),
(6, 'CSS'),
(7, 'PHP'),
(8, 'JAVA'),
(9, 'JavaScript'),
(10, 'PowerShell'),
(11, 'WEB'),
(12, 'POO'),
(13, 'Network'),
(14, 'Autonomous'),
(15, 'Serious'),
(16, 'Disciplined'),
(17, 'Curious'),
(18, 'Punctual'),
(19, 'Rigorous'),
(20, 'Social');

/*==============================================================*/
/* Table : TOWN                                                 */
/*==============================================================*/
create table TOWN
(
   ID_TOWN              int not null AUTO_INCREMENT,
   TOWN_NAME            varchar(120) not null,
   primary key (ID_TOWN)
);

INSERT INTO `town` (`ID_TOWN`, `TOWN_NAME`) VALUES
(1, 'Les Authieux sur le port saint ouen'),
(2, 'Rouen'),
(3, 'Amfreville-la-mivoie'),
(4, 'Evreux'),
(5, 'Boos'),
(6, 'Saint-Etienne du Rouvray'),
(7, 'Cléon');

/*==============================================================*/
/* Table : USER                                                 */
/*==============================================================*/
create table USER
(
   ID_USER              int not null AUTO_INCREMENT,
   ID_ADDRESS           int not null,
   ID_PROMOTION         int not null,
   LAST_NAME            varchar(40) not null,
   FIRST_NAME           varchar(40) not null,
   EMAIL                varchar(120) not null,
   PHONE_NUMBER         varchar(40),
   BIRTHDAY             date not null,
   PASSWORD             varchar(40) not null,
   CV                   longblob,
   MOTIVATION_LETTER    longblob,
   DRIVER_LICENSE       blob not null,
   primary key (ID_USER)
);

INSERT INTO `user` (`ID_USER`, `ID_PROMOTION`, `ID_ADDRESS`, `LAST_NAME`, `FIRST_NAME`, `EMAIL`, `PHONE_NUMBER`, `BIRTHDAY`, `PASSWORD`, `CV`, `MOTIVATION_LETTER`, `DRIVER_LICENSE`) VALUES
(1, 2, 1, 'Lechatreux', 'Pierre', 'pierre.lechatreux@viacesi.fr', '', '2001-07-13', 'Admin', '', '', 1),
(2, 2, 2, 'Le Rate', 'Baptiste', 'baptiste.lerate@viacesi.fr', '', '2002-09-13', 'Admin', '', '', 1),
(3, 2, 3, 'Malondo', 'Emmanuel', 'emmanuel.malondo@viacesi.fr', '', '2002-11-16', 'Admin', '', '', 0),
(4, 2, 4, 'Kurrimboccus', 'Anya', 'anya.kurriboccus@viacesi.fr', '', '2002-04-11', 'Admin', '', '', 1),
(5, 2, 5, 'Koroglu', 'Ilhan', 'ilhan.koroglu@viacesi.fr', '', '2002-08-09', 'Admin', '', '', 1),
(6, 2, 6, 'Martin', 'Aurélien', 'amartin@cesi.fr', '', '1982-09-13', 'A.Martin', '', '', 1),
(7, 2, 7, 'Savalle', 'Florian', 'florian.savalle@viacesi.fr', '', '2002-08-15', 'Deleg', '', '', 1);

/*==============================================================*/
/* Table : WHISHLIST                                            */
/*==============================================================*/
create table WHISHLIST
(
   ID_USER              int not null,
   ID_OFFER             int not null,
   primary key (ID_USER, ID_OFFER)
);

alter table ADDRESS add constraint FK_CORRESPONDENCE foreign key (ID_TOWN)
      references TOWN (ID_TOWN) on delete cascade on update restrict;

alter table APPLY_AT add constraint FK_APPLY_AT foreign key (ID_OFFER)
      references OFFER (ID_OFFER) on delete CASCADE on update restrict;

alter table APPLY_AT add constraint FK_APPLY_AT2 foreign key (ID_USER)
      references USER (ID_USER) on delete CASCADE on update restrict;

alter table ASSOCIATE_ROLE add constraint FK_ASSOCIATE_ROLE foreign key (ID_ROLE)
      references ROLE (ID_ROLE) on delete CASCADE on update restrict;

alter table ASSOCIATE_ROLE add constraint FK_ASSOCIATE_ROLE2 foreign key (ID_USER)
      references USER (ID_USER) on delete CASCADE on update restrict;

alter table BIND add constraint FK_BIND foreign key (ID_OFFER)
      references OFFER (ID_OFFER) on delete CASCADE on update restrict;

alter table BIND add constraint FK_BIND2 foreign key (ID_SKILL)
      references SKILL (ID_SKILL) on delete CASCADE on update restrict;

alter table CENTER add constraint FK_LOCATE_IN foreign key (ID_TOWN)
      references TOWN (ID_TOWN) on delete CASCADE on update restrict;

alter table ESTABLISHMENT add constraint FK_CORRESPONDS_TO foreign key (ID_COMPANY)
      references COMPANY (ID_COMPANY) on delete CASCADE on update restrict;

alter table EVALUATE add constraint FK_EVALUATE foreign key (ID_OFFER)
      references OFFER (ID_OFFER) on delete CASCADE on update restrict;

alter table EVALUATE add constraint FK_EVALUATE2 foreign key (ID_USER)
      references USER (ID_USER) on delete CASCADE on update restrict;

alter table FOLLOW add constraint FK_FOLLOW foreign key (ID_COMPANY)
      references COMPANY (ID_COMPANY) on delete CASCADE on update restrict;

alter table FOLLOW add constraint FK_FOLLOW2 foreign key (ID_USER)
      references USER (ID_USER) on delete CASCADE on update restrict;

alter table LINK add constraint FK_LINK foreign key (ID_USER)
      references USER (ID_USER) on delete CASCADE on update restrict;

alter table LINK add constraint FK_LINK2 foreign key (ID_SKILL)
      references SKILL (ID_SKILL) on delete CASCADE on update restrict;

alter table LOCATE add constraint FK_LOCATE foreign key (ID_COMPANY)
      references COMPANY (ID_COMPANY) on delete CASCADE on update restrict;

alter table LOCATE add constraint FK_LOCATE2 foreign key (ID_ADDRESS)
      references ADDRESS (ID_ADDRESS) on delete CASCADE on update restrict;

alter table LOG add constraint FK_LINK_LOG foreign key (ID_USER)
      references USER (ID_USER) on delete CASCADE on update restrict;

alter table OFFER add constraint FK_BE_PART_OF foreign key (ID_COMPANY)
      references COMPANY (ID_COMPANY) on delete CASCADE on update restrict;

alter table OFFER_STEP add constraint FK_OFFER_STEP foreign key (ID_OFFER)
      references OFFER (ID_OFFER) on delete CASCADE on update restrict;

alter table OFFER_STEP add constraint FK_OFFER_STEP2 foreign key (ID_USER)
      references USER (ID_USER) on delete CASCADE on update restrict;

alter table ROLE add constraint FK_LINK_TO foreign key (ID_CENTER)
      references CENTER (ID_CENTER) on delete CASCADE on update restrict;

alter table USER add constraint FK_ASSOCIATE_PROMOTION foreign key (ID_PROMOTION)
      references PROMOTION (ID_PROMOTION) on delete CASCADE on update restrict;

alter table USER add constraint FK_LIVE foreign key (ID_ADDRESS)
      references ADDRESS (ID_ADDRESS) on delete CASCADE on update restrict;

alter table WHISHLIST add constraint FK_WHISHLIST foreign key (ID_OFFER)
      references OFFER (ID_OFFER) on delete CASCADE on update restrict;

alter table WHISHLIST add constraint FK_WHISHLIST2 foreign key (ID_USER)
      references USER (ID_USER) on delete CASCADE on update restrict;


--
-- Structure de la vue `final_apply_at`
--
DROP TABLE IF EXISTS `final_apply_at`;

DROP VIEW IF EXISTS `final_apply_at`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `final_apply_at`  AS  select `apply_at`.`ID_USER` AS `ID_USER`,`apply_at`.`ID_OFFER` AS `ID_OFFER`,`user`.`ID_PROMOTION` AS `ID_PROMOTION`,`user`.`ID_ADDRESS` AS `ID_ADDRESS`,`user`.`LAST_NAME` AS `LAST_NAME`,`user`.`FIRST_NAME` AS `FIRST_NAME`,`user`.`EMAIL` AS `EMAIL`,`user`.`PHONE_NUMBER` AS `PHONE_NUMBER`,`user`.`BIRTHDAY` AS `BIRTHDAY`,`user`.`PASSWORD` AS `PASSWORD`,`user`.`CV` AS `CV`,`user`.`MOTIVATION_LETTER` AS `MOTIVATION_LETTER`,`user`.`DRIVER_LICENSE` AS `DRIVER_LICENSE`,`offer`.`ID_COMPANY` AS `ID_COMPANY`,`offer`.`OFFER_NAME` AS `OFFER_NAME`,`offer`.`MISSION` AS `MISSION`,`offer`.`SALARY` AS `SALARY`,`offer`.`MIN_DURATION` AS `MIN_DURATION`,`offer`.`MAX_DURATION` AS `MAX_DURATION`,`offer`.`OFFER_DATE` AS `OFFER_DATE`,`offer`.`TRUST` AS `TRUST`,`offer`.`NUMBER_OF_PLACES` AS `NUMBER_OF_PLACES` from ((`apply_at` join `user` on((`user`.`ID_USER` = `apply_at`.`ID_USER`))) join `offer` on((`offer`.`ID_OFFER` = `apply_at`.`ID_OFFER`))) ;

-- --------------------------------------------------------

--
-- Structure de la vue `final_associate_role`
--
DROP TABLE IF EXISTS `final_associate_role`;

DROP VIEW IF EXISTS `final_associate_role`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `final_associate_role`  AS  select `associate_role`.`ID_USER` AS `ID_USER`,`associate_role`.`ID_ROLE` AS `ID_ROLE`,`user`.`ID_PROMOTION` AS `ID_PROMOTION`,`user`.`ID_ADDRESS` AS `ID_ADDRESS`,`user`.`LAST_NAME` AS `LAST_NAME`,`user`.`FIRST_NAME` AS `FIRST_NAME`,`user`.`EMAIL` AS `EMAIL`,`user`.`PHONE_NUMBER` AS `PHONE_NUMBER`,`user`.`BIRTHDAY` AS `BIRTHDAY`,`user`.`PASSWORD` AS `PASSWORD`,`user`.`CV` AS `CV`,`user`.`MOTIVATION_LETTER` AS `MOTIVATION_LETTER`,`user`.`DRIVER_LICENSE` AS `DRIVER_LICENSE`,`offer`.`ID_COMPANY` AS `ID_COMPANY`,`offer`.`OFFER_NAME` AS `OFFER_NAME`,`offer`.`MISSION` AS `MISSION`,`offer`.`SALARY` AS `SALARY`,`offer`.`MIN_DURATION` AS `MIN_DURATION`,`offer`.`MAX_DURATION` AS `MAX_DURATION`,`offer`.`OFFER_DATE` AS `OFFER_DATE`,`offer`.`TRUST` AS `TRUST`,`offer`.`NUMBER_OF_PLACES` AS `NUMBER_OF_PLACES` from ((`associate_role` join `user` on((`user`.`ID_USER` = `associate_role`.`ID_USER`))) join `offer` on((`offer`.`ID_OFFER` = `associate_role`.`ID_ROLE`))) ;

-- --------------------------------------------------------

--
-- Structure de la vue `final_bind`
--
DROP TABLE IF EXISTS `final_bind`;

DROP VIEW IF EXISTS `final_bind`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `final_bind`  AS  select `bind`.`ID_SKILL` AS `ID_SKILL`,`bind`.`ID_OFFER` AS `ID_OFFER`,`skill`.`SKILL_NAME` AS `SKILL_NAME`,`offer`.`ID_COMPANY` AS `ID_COMPANY`,`offer`.`OFFER_NAME` AS `OFFER_NAME`,`offer`.`MISSION` AS `MISSION`,`offer`.`SALARY` AS `SALARY`,`offer`.`MIN_DURATION` AS `MIN_DURATION`,`offer`.`MAX_DURATION` AS `MAX_DURATION`,`offer`.`OFFER_DATE` AS `OFFER_DATE`,`offer`.`TRUST` AS `TRUST`,`offer`.`NUMBER_OF_PLACES` AS `NUMBER_OF_PLACES` from ((`bind` join `skill` on((`skill`.`ID_SKILL` = `bind`.`ID_SKILL`))) join `offer` on((`offer`.`ID_OFFER` = `bind`.`ID_OFFER`))) ;

-- --------------------------------------------------------

--
-- Structure de la vue `final_center`
--
DROP TABLE IF EXISTS `final_center`;

DROP VIEW IF EXISTS `final_center`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `final_center`  AS  select `center`.`ID_CENTER` AS `ID_CENTER`,`center`.`ID_TOWN` AS `ID_TOWN`,`town`.`TOWN_NAME` AS `TOWN_NAME` from (`center` join `town` on((`town`.`ID_TOWN` = `center`.`ID_TOWN`))) ;

-- --------------------------------------------------------

--
-- Structure de la vue `final_establishment`
--
DROP TABLE IF EXISTS `final_establishment`;

DROP VIEW IF EXISTS `final_establishment`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `final_establishment`  AS  select `establishment`.`ID_ESTABLISHMENT` AS `ID_ESTABLISHMENT`,`establishment`.`ID_COMPANY` AS `ID_COMPANY`,`establishment`.`NUM_SIRET` AS `NUM_SIRET`,`establishment`.`NUM_SIREN` AS `NUM_SIREN`,`company`.`COMPANY_NAME` AS `COMPANY_NAME`,`company`.`ACTIVITY_SECTOR` AS `ACTIVITY_SECTOR`,`company`.`NUMBER_OF_STUDENTS` AS `NUMBER_OF_STUDENTS`,`company`.`LOGO` AS `LOGO` from (`establishment` join `company` on((`company`.`ID_COMPANY` = `establishment`.`ID_COMPANY`))) ;

-- --------------------------------------------------------

--
-- Structure de la vue `final_evaluate`
--
DROP TABLE IF EXISTS `final_evaluate`;

DROP VIEW IF EXISTS `final_evaluate`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `final_evaluate`  AS  select `evaluate`.`ID_USER` AS `ID_USER`,`evaluate`.`ID_OFFER` AS `ID_OFFER`,`evaluate`.`EVALUATION` AS `EVALUATION`,`user`.`ID_PROMOTION` AS `ID_PROMOTION`,`user`.`ID_ADDRESS` AS `ID_ADDRESS`,`user`.`LAST_NAME` AS `LAST_NAME`,`user`.`FIRST_NAME` AS `FIRST_NAME`,`user`.`EMAIL` AS `EMAIL`,`user`.`PHONE_NUMBER` AS `PHONE_NUMBER`,`user`.`BIRTHDAY` AS `BIRTHDAY`,`user`.`PASSWORD` AS `PASSWORD`,`user`.`CV` AS `CV`,`user`.`MOTIVATION_LETTER` AS `MOTIVATION_LETTER`,`user`.`DRIVER_LICENSE` AS `DRIVER_LICENSE` from ((`evaluate` join `user` on((`user`.`ID_USER` = `evaluate`.`ID_USER`))) join `offer` on((`offer`.`ID_OFFER` = `evaluate`.`ID_OFFER`))) ;

-- --------------------------------------------------------

--
-- Structure de la vue `final_link`
--
DROP TABLE IF EXISTS `final_link`;

DROP VIEW IF EXISTS `final_link`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `final_link`  AS  select `link`.`ID_SKILL` AS `ID_SKILL`,`link`.`ID_USER` AS `ID_USER`,`skill`.`SKILL_NAME` AS `SKILL_NAME`,`user`.`ID_PROMOTION` AS `ID_PROMOTION`,`user`.`ID_ADDRESS` AS `ID_ADDRESS`,`user`.`LAST_NAME` AS `LAST_NAME`,`user`.`FIRST_NAME` AS `FIRST_NAME`,`user`.`EMAIL` AS `EMAIL`,`user`.`PHONE_NUMBER` AS `PHONE_NUMBER`,`user`.`BIRTHDAY` AS `BIRTHDAY`,`user`.`PASSWORD` AS `PASSWORD`,`user`.`CV` AS `CV`,`user`.`MOTIVATION_LETTER` AS `MOTIVATION_LETTER`,`user`.`DRIVER_LICENSE` AS `DRIVER_LICENSE` from ((`link` join `skill` on((`skill`.`ID_SKILL` = `link`.`ID_SKILL`))) join `user` on((`user`.`ID_USER` = `link`.`ID_USER`))) ;

-- --------------------------------------------------------

--
-- Structure de la vue `final_offer`
--
DROP TABLE IF EXISTS `final_offer`;

DROP VIEW IF EXISTS `final_offer`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `final_offer`  AS  select `offer`.`ID_OFFER` AS `ID_OFFER`,`offer`.`ID_COMPANY` AS `ID_COMPANY`,`offer`.`OFFER_NAME` AS `OFFER_NAME`,`offer`.`MISSION` AS `MISSION`,`offer`.`SALARY` AS `SALARY`,`offer`.`MIN_DURATION` AS `MIN_DURATION`,`offer`.`MAX_DURATION` AS `MAX_DURATION`,`offer`.`OFFER_DATE` AS `OFFER_DATE`,`offer`.`TRUST` AS `TRUST`,`offer`.`NUMBER_OF_PLACES` AS `NUMBER_OF_PLACES`,`company`.`COMPANY_NAME` AS `COMPANY_NAME`,`company`.`ACTIVITY_SECTOR` AS `ACTIVITY_SECTOR`,`company`.`NUMBER_OF_STUDENTS` AS `NUMBER_OF_STUDENTS` from (`offer` join `company` on((`company`.`ID_COMPANY` = `offer`.`ID_COMPANY`))) ;

-- --------------------------------------------------------

--
-- Structure de la vue `final_user`
--
DROP TABLE IF EXISTS `final_user`;

DROP VIEW IF EXISTS `final_user`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `final_user`  AS  select `user`.`ID_USER` AS `ID_USER`,`user`.`ID_PROMOTION` AS `ID_PROMOTION`,`user`.`ID_ADDRESS` AS `ID_ADDRESS`,`user`.`LAST_NAME` AS `LAST_NAME`,`user`.`FIRST_NAME` AS `FIRST_NAME`,`user`.`EMAIL` AS `EMAIL`,`user`.`PHONE_NUMBER` AS `PHONE_NUMBER`,`user`.`BIRTHDAY` AS `BIRTHDAY`,`user`.`PASSWORD` AS `PASSWORD`,`user`.`CV` AS `CV`,`user`.`MOTIVATION_LETTER` AS `MOTIVATION_LETTER`,`user`.`DRIVER_LICENSE` AS `DRIVER_LICENSE`,`promotion`.`PROMOTION_NAME` AS `PROMOTION_NAME`,`address`.`ID_TOWN` AS `ID_TOWN`,`address`.`STREET` AS `STREET`,`address`.`NUMBER` AS `NUMBER`,`address`.`POSTAL_CODE` AS `POSTAL_CODE`,`address`.`COMPLEMENT` AS `COMPLEMENT` from ((`user` join `promotion` on((`promotion`.`ID_PROMOTION` = `user`.`ID_PROMOTION`))) join `address` on((`address`.`ID_ADDRESS` = `user`.`ID_ADDRESS`))) ;
COMMIT;



