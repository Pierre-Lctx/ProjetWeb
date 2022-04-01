-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : ven. 01 avr. 2022 à 12:57
-- Version du serveur :  5.7.31
-- Version de PHP : 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `projetweb`
--

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

-- --------------------------------------------------------

--
-- Structure de la table `address`
--

DROP TABLE IF EXISTS `address`;
CREATE TABLE IF NOT EXISTS `address` (
  `ID_ADDRESS` int(11) NOT NULL,
  `ID_TOWN` int(11) NOT NULL,
  `STREET` varchar(255) NOT NULL,
  `NUMBER` varchar(5) NOT NULL,
  `POSTAL_CODE` varchar(5) NOT NULL,
  `COMPLEMENT` varchar(255) NOT NULL,
  PRIMARY KEY (`ID_ADDRESS`),
  KEY `FK_CORRESPONDENCE` (`ID_TOWN`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `address`
--

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

-- --------------------------------------------------------

--
-- Structure de la table `apply_at`
--

DROP TABLE IF EXISTS `apply_at`;
CREATE TABLE IF NOT EXISTS `apply_at` (
  `ID_USER` int(11) NOT NULL,
  `ID_OFFER` int(11) NOT NULL,
  PRIMARY KEY (`ID_USER`,`ID_OFFER`),
  KEY `FK_APPLY_AT` (`ID_OFFER`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `apply_at`
--

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

-- --------------------------------------------------------

--
-- Structure de la table `associate_role`
--

DROP TABLE IF EXISTS `associate_role`;
CREATE TABLE IF NOT EXISTS `associate_role` (
  `ID_USER` int(11) NOT NULL,
  `ID_ROLE` int(11) NOT NULL,
  PRIMARY KEY (`ID_USER`,`ID_ROLE`),
  KEY `FK_ASSOCIATE_ROLE` (`ID_ROLE`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `associate_role`
--

INSERT INTO `associate_role` (`ID_USER`, `ID_ROLE`) VALUES
(1, 1),
(2, 1),
(3, 4),
(4, 4),
(5, 4),
(6, 2),
(7, 3);

-- --------------------------------------------------------

--
-- Structure de la table `bind`
--

DROP TABLE IF EXISTS `bind`;
CREATE TABLE IF NOT EXISTS `bind` (
  `ID_SKILL` int(11) NOT NULL,
  `ID_OFFER` int(11) NOT NULL,
  PRIMARY KEY (`ID_SKILL`,`ID_OFFER`),
  KEY `FK_BIND` (`ID_OFFER`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `bind`
--

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

-- --------------------------------------------------------

--
-- Structure de la table `center`
--

DROP TABLE IF EXISTS `center`;
CREATE TABLE IF NOT EXISTS `center` (
  `ID_CENTER` int(11) NOT NULL,
  `ID_TOWN` int(11) NOT NULL,
  PRIMARY KEY (`ID_CENTER`),
  KEY `FK_LOCATE_IN` (`ID_TOWN`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `center`
--

INSERT INTO `center` (`ID_CENTER`, `ID_TOWN`) VALUES
(1, 2);

-- --------------------------------------------------------

--
-- Structure de la table `company`
--

DROP TABLE IF EXISTS `company`;
CREATE TABLE IF NOT EXISTS `company` (
  `ID_COMPANY` int(11) NOT NULL,
  `COMPANY_NAME` varchar(40) NOT NULL,
  `ACTIVITY_SECTOR` varchar(40) NOT NULL,
  `NUMBER_OF_STUDENTS` int(11) NOT NULL,
  `LOGO` longblob,
  PRIMARY KEY (`ID_COMPANY`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `company`
--

INSERT INTO `company` (`ID_COMPANY`, `COMPANY_NAME`, `ACTIVITY_SECTOR`, `NUMBER_OF_STUDENTS`, `LOGO`) VALUES
(1, 'ISII-TECH', 'Infomatique Industrielle', 0, NULL),
(2, 'Potion', 'WEB', 2, NULL),
(3, 'Renault', 'Automobile', 1, NULL),
(4, 'CESI', 'Recherche', 0, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `establishment`
--

DROP TABLE IF EXISTS `establishment`;
CREATE TABLE IF NOT EXISTS `establishment` (
  `ID_ESTABLISHMENT` int(11) NOT NULL,
  `ID_COMPANY` int(11) NOT NULL,
  `NUM_SIRET` varchar(255) NOT NULL,
  `NUM_SIREN` varchar(255) NOT NULL,
  PRIMARY KEY (`ID_ESTABLISHMENT`),
  KEY `FK_CORRESPONDS_TO` (`ID_COMPANY`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `establishment`
--

INSERT INTO `establishment` (`ID_ESTABLISHMENT`, `ID_COMPANY`, `NUM_SIRET`, `NUM_SIREN`) VALUES
(1, 2, '82293430300014', '822934303'),
(2, 1, '507808236', '50780823600032'),
(3, 3, '780129987', '78012998703591');

-- --------------------------------------------------------

--
-- Structure de la table `evaluate`
--

DROP TABLE IF EXISTS `evaluate`;
CREATE TABLE IF NOT EXISTS `evaluate` (
  `ID_USER` int(11) NOT NULL,
  `ID_OFFER` int(11) NOT NULL,
  `EVALUATION` int(11) NOT NULL,
  PRIMARY KEY (`ID_USER`,`ID_OFFER`),
  KEY `FK_EVALUATE` (`ID_OFFER`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `evaluate`
--

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

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `final_bind`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `final_bind`;
CREATE TABLE IF NOT EXISTS `final_bind` (
`ID_SKILL` int(11)
,`ID_OFFER` int(11)
,`SKILL_NAME` longtext
,`ID_COMPANY` int(11)
,`OFFER_NAME` varchar(40)
,`MISSION` text
,`SALARY` float(8,2)
,`MIN_DURATION` date
,`MAX_DURATION` date
,`OFFER_DATE` date
,`TRUST` varchar(40)
,`NUMBER_OF_PLACES` int(11)
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `final_center`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `final_center`;
CREATE TABLE IF NOT EXISTS `final_center` (
`ID_CENTER` int(11)
,`ID_USER` int(11)
,`ID_TOWN` int(11)
,`TOWN_NAME` varchar(120)
,`ID_ADDRESS` int(11)
,`ID_PROMOTION` int(11)
,`LAST_NAME` varchar(40)
,`FIRST_NAME` varchar(40)
,`EMAIL` varchar(120)
,`PHONE_NUMBER` varchar(40)
,`BIRTHDAY` date
,`PASSWORD` varchar(40)
,`CV` longblob
,`MOTIVATION_LETTER` longblob
,`DRIVER_LICENSE` blob
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `final_establishment`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `final_establishment`;
CREATE TABLE IF NOT EXISTS `final_establishment` (
`ID_ESTABLISHMENT` int(11)
,`ID_COMPANY` int(11)
,`NUM_SIRET` varchar(255)
,`NUM_SIREN` varchar(255)
,`COMPANY_NAME` varchar(40)
,`ACTIVITY_SECTOR` varchar(40)
,`NUMBER_OF_STUDENTS` int(11)
,`LOGO` longblob
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `final_evaluate`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `final_evaluate`;
CREATE TABLE IF NOT EXISTS `final_evaluate` (
`ID_USER` int(11)
,`ID_OFFER` int(11)
,`EVALUATION` int(11)
,`ID_PROMOTION` int(11)
,`ID_ADDRESS` int(11)
,`LAST_NAME` varchar(40)
,`FIRST_NAME` varchar(40)
,`EMAIL` varchar(120)
,`PHONE_NUMBER` varchar(40)
,`BIRTHDAY` date
,`PASSWORD` varchar(40)
,`CV` longblob
,`MOTIVATION_LETTER` longblob
,`DRIVER_LICENSE` blob
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `final_link`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `final_link`;
CREATE TABLE IF NOT EXISTS `final_link` (
`ID_SKILL` int(11)
,`ID_USER` int(11)
,`SKILL_NAME` longtext
,`ID_PROMOTION` int(11)
,`ID_ADDRESS` int(11)
,`LAST_NAME` varchar(40)
,`FIRST_NAME` varchar(40)
,`EMAIL` varchar(120)
,`PHONE_NUMBER` varchar(40)
,`BIRTHDAY` date
,`PASSWORD` varchar(40)
,`CV` longblob
,`MOTIVATION_LETTER` longblob
,`DRIVER_LICENSE` blob
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `final_offer`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `final_offer`;
CREATE TABLE IF NOT EXISTS `final_offer` (
`ID_OFFER` int(11)
,`ID_COMPANY` int(11)
,`OFFER_NAME` varchar(40)
,`MISSION` text
,`SALARY` float(8,2)
,`MIN_DURATION` date
,`MAX_DURATION` date
,`OFFER_DATE` date
,`TRUST` varchar(40)
,`NUMBER_OF_PLACES` int(11)
,`COMPANY_NAME` varchar(40)
,`ACTIVITY_SECTOR` varchar(40)
,`NUMBER_OF_STUDENTS` int(11)
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `final_user`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `final_user`;
CREATE TABLE IF NOT EXISTS `final_user` (
`ID_USER` int(11)
,`ID_PROMOTION` int(11)
,`ID_ADDRESS` int(11)
,`LAST_NAME` varchar(40)
,`FIRST_NAME` varchar(40)
,`EMAIL` varchar(120)
,`PHONE_NUMBER` varchar(40)
,`BIRTHDAY` date
,`PASSWORD` varchar(40)
,`CV` longblob
,`MOTIVATION_LETTER` longblob
,`DRIVER_LICENSE` blob
,`PROMOTION_NAME` varchar(40)
,`ID_TOWN` int(11)
,`STREET` varchar(255)
,`NUMBER` varchar(5)
,`POSTAL_CODE` varchar(5)
,`COMPLEMENT` varchar(255)
);

-- --------------------------------------------------------

--
-- Structure de la table `follow`
--

DROP TABLE IF EXISTS `follow`;
CREATE TABLE IF NOT EXISTS `follow` (
  `ID_USER` int(11) NOT NULL,
  `ID_COMPANY` int(11) NOT NULL,
  PRIMARY KEY (`ID_USER`,`ID_COMPANY`),
  KEY `FK_FOLLOW` (`ID_COMPANY`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `link`
--

DROP TABLE IF EXISTS `link`;
CREATE TABLE IF NOT EXISTS `link` (
  `ID_SKILL` int(11) NOT NULL,
  `ID_USER` int(11) NOT NULL,
  PRIMARY KEY (`ID_SKILL`,`ID_USER`),
  KEY `FK_LINK` (`ID_USER`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `link`
--

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

-- --------------------------------------------------------

--
-- Structure de la table `link_to`
--

DROP TABLE IF EXISTS `link_to`;
CREATE TABLE IF NOT EXISTS `link_to` (
  `ID_CENTER` int(11) NOT NULL,
  `ID_USER` int(11) NOT NULL,
  PRIMARY KEY (`ID_CENTER`,`ID_USER`),
  KEY `FK_LINK_TO` (`ID_USER`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `link_to`
--

INSERT INTO `link_to` (`ID_CENTER`, `ID_USER`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7);

-- --------------------------------------------------------

--
-- Structure de la table `locate`
--

DROP TABLE IF EXISTS `locate`;
CREATE TABLE IF NOT EXISTS `locate` (
  `ID_ADDRESS` int(11) NOT NULL,
  `ID_COMPANY` int(11) NOT NULL,
  PRIMARY KEY (`ID_ADDRESS`,`ID_COMPANY`),
  KEY `FK_LOCATE` (`ID_COMPANY`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `locate`
--

INSERT INTO `locate` (`ID_ADDRESS`, `ID_COMPANY`) VALUES
(8, 1),
(9, 2),
(10, 3),
(11, 4);

-- --------------------------------------------------------

--
-- Structure de la table `log`
--

DROP TABLE IF EXISTS `log`;
CREATE TABLE IF NOT EXISTS `log` (
  `ID_LOG` int(11) NOT NULL,
  `ID_USER` int(11) NOT NULL,
  `ACTION` varchar(255) NOT NULL,
  `LOG_DATE` date NOT NULL,
  PRIMARY KEY (`ID_LOG`),
  KEY `FK_LINK_LOG` (`ID_USER`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `offer`
--

DROP TABLE IF EXISTS `offer`;
CREATE TABLE IF NOT EXISTS `offer` (
  `ID_OFFER` int(11) NOT NULL,
  `ID_COMPANY` int(11) NOT NULL,
  `OFFER_NAME` varchar(40) NOT NULL,
  `MISSION` text NOT NULL,
  `SALARY` float(8,2) NOT NULL,
  `MIN_DURATION` date NOT NULL,
  `MAX_DURATION` date NOT NULL,
  `OFFER_DATE` date DEFAULT NULL,
  `TRUST` varchar(40) DEFAULT NULL,
  `NUMBER_OF_PLACES` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_OFFER`),
  KEY `FK_BE_PART_OF` (`ID_COMPANY`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `offer`
--

INSERT INTO `offer` (`ID_OFFER`, `ID_COMPANY`, `OFFER_NAME`, `MISSION`, `SALARY`, `MIN_DURATION`, `MAX_DURATION`, `OFFER_DATE`, `TRUST`, `NUMBER_OF_PLACES`) VALUES
(1, 1, 'Development internship', 'The student will design a database of raw materials.', 591.60, '2022-04-04', '2022-07-29', '2022-03-24', 'Good', 2),
(2, 2, 'WEB internship', 'The student will have to set up a website for a client.', 620.00, '2022-04-04', '2022-07-29', '2022-03-22', 'Unknow', 1),
(3, 3, 'Development Internship', 'The student will have to set up a management application for a production line.', 720.00, '2022-04-04', '2022-07-29', '2022-03-16', 'Good', 3);

-- --------------------------------------------------------

--
-- Structure de la table `offer_step`
--

DROP TABLE IF EXISTS `offer_step`;
CREATE TABLE IF NOT EXISTS `offer_step` (
  `ID_USER` int(11) NOT NULL,
  `ID_OFFER` int(11) NOT NULL,
  `OFFER_STEP` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_USER`,`ID_OFFER`),
  KEY `FK_OFFER_STEP` (`ID_OFFER`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `promotion`
--

DROP TABLE IF EXISTS `promotion`;
CREATE TABLE IF NOT EXISTS `promotion` (
  `ID_PROMOTION` int(11) NOT NULL,
  `PROMOTION_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`ID_PROMOTION`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `promotion`
--

INSERT INTO `promotion` (`ID_PROMOTION`, `PROMOTION_NAME`) VALUES
(1, 'CPI-A1'),
(2, 'CPI-A2 Info'),
(3, 'A3 Info'),
(4, 'A4 Info'),
(5, 'A5 Info'),
(6, 'A3 Info Alternant'),
(7, 'A4 Info Alternant'),
(8, 'A5 Info Alternant');

-- --------------------------------------------------------

--
-- Structure de la table `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `ID_ROLE` int(11) NOT NULL,
  `ROLE_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`ID_ROLE`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `role`
--

INSERT INTO `role` (`ID_ROLE`, `ROLE_NAME`) VALUES
(1, 'Administrateur'),
(2, 'Pilote'),
(3, 'Délégué'),
(4, 'Etudiant');

-- --------------------------------------------------------

--
-- Structure de la table `skill`
--

DROP TABLE IF EXISTS `skill`;
CREATE TABLE IF NOT EXISTS `skill` (
  `ID_SKILL` int(11) NOT NULL,
  `SKILL_NAME` longtext NOT NULL,
  PRIMARY KEY (`ID_SKILL`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `skill`
--

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

-- --------------------------------------------------------

--
-- Structure de la table `town`
--

DROP TABLE IF EXISTS `town`;
CREATE TABLE IF NOT EXISTS `town` (
  `ID_TOWN` int(11) NOT NULL,
  `TOWN_NAME` varchar(120) NOT NULL,
  PRIMARY KEY (`ID_TOWN`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `town`
--

INSERT INTO `town` (`ID_TOWN`, `TOWN_NAME`) VALUES
(1, 'Les Authieux sur le port saint ouen'),
(2, 'Rouen'),
(3, 'Amfreville-la-mivoie'),
(4, 'Evreux'),
(5, 'Boos'),
(6, 'Saint-Etienne du Rouvray'),
(7, 'Cléon');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `ID_USER` int(11) NOT NULL,
  `ID_ADDRESS` int(11) NOT NULL,
  `ID_PROMOTION` int(11) NOT NULL,
  `LAST_NAME` varchar(40) NOT NULL,
  `FIRST_NAME` varchar(40) NOT NULL,
  `EMAIL` varchar(120) NOT NULL,
  `PHONE_NUMBER` varchar(40) DEFAULT NULL,
  `BIRTHDAY` date NOT NULL,
  `PASSWORD` varchar(40) NOT NULL,
  `CV` longblob,
  `MOTIVATION_LETTER` longblob,
  `DRIVER_LICENSE` blob NOT NULL,
  PRIMARY KEY (`ID_USER`),
  KEY `FK_ASSOCIATE_PROMOTION` (`ID_PROMOTION`),
  KEY `FK_LIVE` (`ID_ADDRESS`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`ID_USER`, `ID_ADDRESS`, `ID_PROMOTION`, `LAST_NAME`, `FIRST_NAME`, `EMAIL`, `PHONE_NUMBER`, `BIRTHDAY`, `PASSWORD`, `CV`, `MOTIVATION_LETTER`, `DRIVER_LICENSE`) VALUES
(1, 1, 2, 'Lechatreux', 'Pierre', 'pierre.lechatreux@viacesi.fr', '', '2001-07-13', 'Admin', '', '', 0x31),
(2, 2, 2, 'Le Rate', 'Baptiste', 'baptiste.lerate@viacesi.fr', '', '2002-09-13', 'Admin', '', '', 0x31),
(3, 3, 2, 'Malondo', 'Emmanuel', 'emmanuel.malondo@viacesi.fr', '', '2002-11-16', 'Admin', '', '', 0x30),
(4, 4, 2, 'Kurrimboccus', 'Anya', 'anya.kurriboccus@viacesi.fr', '', '2002-04-11', 'Admin', '', '', 0x31),
(5, 5, 2, 'Koroglu', 'Ilhan', 'ilhan.koroglu@viacesi.fr', '', '2002-08-09', 'Admin', '', '', 0x31),
(6, 6, 2, 'Martin', 'Aurélien', 'amartin@cesi.fr', '', '1982-09-13', 'A.Martin', '', '', 0x31),
(7, 7, 2, 'Savalle', 'Florian', 'florian.savalle@viacesi.fr', '', '2002-08-15', 'Deleg', '', '', 0x31);

-- --------------------------------------------------------

--
-- Structure de la table `whishlist`
--

DROP TABLE IF EXISTS `whishlist`;
CREATE TABLE IF NOT EXISTS `whishlist` (
  `ID_USER` int(11) NOT NULL,
  `ID_OFFER` int(11) NOT NULL,
  PRIMARY KEY (`ID_USER`,`ID_OFFER`),
  KEY `FK_WHISHLIST` (`ID_OFFER`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `whishlist`
--

INSERT INTO `whishlist` (`ID_USER`, `ID_OFFER`) VALUES
(1, 1),
(1, 2),
(2, 1),
(2, 2),
(3, 1),
(3, 2),
(3, 3),
(4, 2),
(5, 3);

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
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `final_center`  AS  select `link_to`.`ID_CENTER` AS `ID_CENTER`,`link_to`.`ID_USER` AS `ID_USER`,`center`.`ID_TOWN` AS `ID_TOWN`,`town`.`TOWN_NAME` AS `TOWN_NAME`,`user`.`ID_ADDRESS` AS `ID_ADDRESS`,`user`.`ID_PROMOTION` AS `ID_PROMOTION`,`user`.`LAST_NAME` AS `LAST_NAME`,`user`.`FIRST_NAME` AS `FIRST_NAME`,`user`.`EMAIL` AS `EMAIL`,`user`.`PHONE_NUMBER` AS `PHONE_NUMBER`,`user`.`BIRTHDAY` AS `BIRTHDAY`,`user`.`PASSWORD` AS `PASSWORD`,`user`.`CV` AS `CV`,`user`.`MOTIVATION_LETTER` AS `MOTIVATION_LETTER`,`user`.`DRIVER_LICENSE` AS `DRIVER_LICENSE` from (((`link_to` join `user` on((`user`.`ID_USER` = `link_to`.`ID_USER`))) join `center` on((`center`.`ID_CENTER` = `link_to`.`ID_CENTER`))) join `town` on((`town`.`ID_TOWN` = `center`.`ID_TOWN`))) ;

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

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
