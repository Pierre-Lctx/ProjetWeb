-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : lun. 28 mars 2022 à 07:46
-- Version du serveur :  5.7.31
-- Version de PHP : 7.3.21

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
  KEY `FK_APPLY_AT2` (`ID_OFFER`)
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
  PRIMARY KEY (`ID_USER`,`ID_ROLE`)
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
  PRIMARY KEY (`ID_SKILL`,`ID_OFFER`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `center`
--

DROP TABLE IF EXISTS `center`;
CREATE TABLE IF NOT EXISTS `center` (
  `ID_CENTER` int(11) NOT NULL,
  `ID_TOWN` int(11) NOT NULL,
  PRIMARY KEY (`ID_CENTER`)
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
  PRIMARY KEY (`ID_COMPANY`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `company`
--

INSERT INTO `company` (`ID_COMPANY`, `COMPANY_NAME`, `ACTIVITY_SECTOR`, `NUMBER_OF_STUDENTS`) VALUES
(1, 'ISII-TECH', 'Infomatique Industrielle', 0),
(2, 'Potion', 'WEB', 2),
(3, 'Renault', 'Automobile', 1),
(4, 'CESI', 'Recherche', 0);

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
  PRIMARY KEY (`ID_ESTABLISHMENT`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `evaluate`
--

DROP TABLE IF EXISTS `evaluate`;
CREATE TABLE IF NOT EXISTS `evaluate` (
  `ID_USER` int(11) NOT NULL,
  `ID_OFFER` int(11) NOT NULL,
  `EVALUATION` int(11) NOT NULL,
  PRIMARY KEY (`ID_USER`,`ID_OFFER`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `follow`
--

DROP TABLE IF EXISTS `follow`;
CREATE TABLE IF NOT EXISTS `follow` (
  `ID_USER` int(11) NOT NULL,
  `ID_COMPANY` int(11) NOT NULL,
  PRIMARY KEY (`ID_USER`,`ID_COMPANY`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `link`
--

DROP TABLE IF EXISTS `link`;
CREATE TABLE IF NOT EXISTS `link` (
  `ID_SKILL` int(11) NOT NULL,
  `ID_USER` int(11) NOT NULL,
  PRIMARY KEY (`ID_SKILL`,`ID_USER`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `locate`
--

DROP TABLE IF EXISTS `locate`;
CREATE TABLE IF NOT EXISTS `locate` (
  `ID_ADDRESS` int(11) NOT NULL,
  `ID_COMPANY` int(11) NOT NULL,
  PRIMARY KEY (`ID_ADDRESS`,`ID_COMPANY`)
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
  PRIMARY KEY (`ID_LOG`)
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
  PRIMARY KEY (`ID_OFFER`)
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
  `ID_CENTER` int(11) NOT NULL,
  `ROLE_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`ID_ROLE`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `role`
--

INSERT INTO `role` (`ID_ROLE`, `ID_CENTER`, `ROLE_NAME`) VALUES
(1, 1, 'Administrateur'),
(2, 1, 'Pilote'),
(3, 1, 'Délégué'),
(4, 1, 'Etudiant');

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
  `ID_PROMOTION` int(11) NOT NULL,
  `ID_ADDRESS` int(11) NOT NULL,
  `LAST_NAME` varchar(40) NOT NULL,
  `FIRST_NAME` varchar(40) NOT NULL,
  `EMAIL` varchar(120) NOT NULL,
  `BIRTHDAY` date NOT NULL,
  `PASSWORD` varchar(40) NOT NULL,
  `CV` longblob,
  `MOTIVATION_LETTER` longblob,
  `DRIVER_LICENSE` tinyint(1) NOT NULL,
  PRIMARY KEY (`ID_USER`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`ID_USER`, `ID_PROMOTION`, `ID_ADDRESS`, `LAST_NAME`, `FIRST_NAME`, `EMAIL`, `BIRTHDAY`, `PASSWORD`, `CV`, `MOTIVATION_LETTER`, `DRIVER_LICENSE`) VALUES
(1, 2, 1, 'Lechatreux', 'Pierre', 'pierre.lechatreux@viacesi.fr', '2001-07-13', 'Admin', '', '', 1),
(2, 2, 2, 'Le Rate', 'Baptiste', 'baptiste.lerate@viacesi.fr', '2002-09-13', 'Admin', '', '', 1),
(3, 2, 3, 'Malondo', 'Emmanuel', 'emmanuel.malondo@viacesi.fr', '2002-11-16', 'Admin', '', '', 0),
(4, 2, 4, 'Kurrimboccus', 'Anya', 'anya.kurriboccus@viacesi.fr', '2002-04-11', 'Admin', '', '', 1),
(5, 2, 5, 'Koroglu', 'Ilhan', 'ilhan.koroglu@viacesi.fr', '2002-08-09', 'Admin', '', '', 1),
(6, 2, 6, 'Martin', 'Aurélien', 'amartin@cesi.fr', '1982-09-13', 'A.Martin', '', '', 1),
(7, 2, 7, 'Savalle', 'Florian', 'florian.savalle@viacesi.fr', '2002-08-15', 'Deleg', '', '', 1);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
