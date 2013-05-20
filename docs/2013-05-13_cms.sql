-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le: Lun 13 Mai 2013 à 16:50
-- Version du serveur: 5.5.24-log
-- Version de PHP: 5.4.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `cms`
--

-- --------------------------------------------------------

--
-- Structure de la table `actualite`
--

CREATE TABLE IF NOT EXISTS `actualite` (
  `id_actualite` int(11) NOT NULL AUTO_INCREMENT,
  `date_actualite` datetime NOT NULL,
  PRIMARY KEY (`id_actualite`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `actulangue`
--

CREATE TABLE IF NOT EXISTS `actulangue` (
  `id_actualite` int(11) NOT NULL AUTO_INCREMENT,
  `iso_langue` varchar(5) NOT NULL,
  `titre_aclulangue` varchar(255) DEFAULT NULL,
  `text_actulangue` text,
  PRIMARY KEY (`id_actualite`,`iso_langue`),
  KEY `fk_actulangue2` (`iso_langue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `administrateur`
--

CREATE TABLE IF NOT EXISTS `administrateur` (
  `id_admin` int(11) NOT NULL AUTO_INCREMENT,
  `nom_admin` varchar(255) NOT NULL,
  `prenom_admin` varchar(255) NOT NULL,
  `tel_admin` int(11) DEFAULT NULL,
  `datenaissance_admin` date DEFAULT NULL,
  `email_admin` varchar(255) NOT NULL,
  `pass_admin` varchar(255) NOT NULL,
  `etat_admin` enum('actif_oui','actif_non') NOT NULL DEFAULT 'actif_oui',
  `type_admin` enum('Webmaster','Chef de projet','Developpeur','Designeur','Testeur') NOT NULL DEFAULT 'Developpeur',
  PRIMARY KEY (`id_admin`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Contenu de la table `administrateur`
--

INSERT INTO `administrateur` (`id_admin`, `nom_admin`, `prenom_admin`, `tel_admin`, `datenaissance_admin`, `email_admin`, `pass_admin`, `etat_admin`, `type_admin`) VALUES
(1, 'BAHRI', 'Yosri', 50822754, '1985-08-21', 'yosribahri@gmail.com', '0b423e3a9850d07ead461643c08cef7f', 'actif_oui', 'Webmaster'),
(2, 'DEV', 'Yosri', NULL, NULL, 'ybahri@quartierdete.fr', '0b423e3a9850d07ead461643c08cef7f', 'actif_oui', 'Chef de projet'),
(3, 'DEV', 'Yosri', NULL, NULL, 'contact@yosri-bahri.net', '0b423e3a9850d07ead461643c08cef7f', 'actif_oui', 'Developpeur'),
(4, 'BAHRI', 'Yosri', NULL, NULL, 'yosribahri@gmail.com', '0b423e3a9850d07ead461643c08cef7f', 'actif_oui', 'Designeur'),
(5, 'BAHRI', 'Yosri', NULL, NULL, 'contact@yosri-bahri.net', '0b423e3a9850d07ead461643c08cef7f', 'actif_oui', 'Testeur');

-- --------------------------------------------------------

--
-- Structure de la table `adminsite`
--

CREATE TABLE IF NOT EXISTS `adminsite` (
  `id_admin` int(11) NOT NULL,
  `id_site` int(11) NOT NULL,
  `debut_siteadmin` datetime NOT NULL,
  `fin_siteadmin` datetime NOT NULL,
  PRIMARY KEY (`id_admin`,`id_site`),
  KEY `fk_relation_18` (`id_site`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE IF NOT EXISTS `client` (
  `id_client` int(11) NOT NULL AUTO_INCREMENT,
  `nom_client` varchar(255) NOT NULL,
  `prenom_client` varchar(255) NOT NULL,
  `email_client` varchar(255) NOT NULL,
  `adresse_client` text,
  `pays_client` varchar(255) DEFAULT NULL,
  `ville_client` varchar(255) DEFAULT NULL,
  `codepostal_client` varchar(255) DEFAULT NULL,
  `logitude_client` int(11) DEFAULT NULL,
  `lattidude_client` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_client`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `client`
--

INSERT INTO `client` (`id_client`, `nom_client`, `prenom_client`, `email_client`, `adresse_client`, `pays_client`, `ville_client`, `codepostal_client`, `logitude_client`, `lattidude_client`) VALUES
(1, 'bahri', 'yosri', 'yosribahri@gmail.com', 'Ariana', 'Tunisie', NULL, '2080', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `clientnewsletter`
--

CREATE TABLE IF NOT EXISTS `clientnewsletter` (
  `id_clientnewsletter` int(11) NOT NULL AUTO_INCREMENT,
  `iso_langue` varchar(5) NOT NULL,
  `id_site` int(11) NOT NULL,
  `etat_client_newsletter` enum('0','1') NOT NULL,
  `email_clientnewsletter` varchar(255) NOT NULL,
  PRIMARY KEY (`id_clientnewsletter`),
  KEY `fk_relation_13` (`id_site`),
  KEY `fk_relation_14` (`iso_langue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `dialogue`
--

CREATE TABLE IF NOT EXISTS `dialogue` (
  `id_dialogue` int(11) NOT NULL AUTO_INCREMENT,
  `id_sujet` int(11) NOT NULL,
  `destinataire_dialogue` varchar(255) NOT NULL,
  `description_dialogue` text NOT NULL,
  `date_dialogue` datetime NOT NULL,
  PRIMARY KEY (`id_dialogue`),
  KEY `fk_relation_7` (`id_sujet`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `email`
--

CREATE TABLE IF NOT EXISTS `email` (
  `id_email` int(11) NOT NULL AUTO_INCREMENT,
  `id_site` int(11) NOT NULL,
  `adresse_email` varchar(255) NOT NULL,
  `default_email` enum('0','1') NOT NULL,
  PRIMARY KEY (`id_email`),
  KEY `fk_relation_10` (`id_site`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `gallerie`
--

CREATE TABLE IF NOT EXISTS `gallerie` (
  `id_gallerie` int(11) NOT NULL AUTO_INCREMENT,
  `id_site` int(11) NOT NULL,
  PRIMARY KEY (`id_gallerie`),
  KEY `fk_relation_2` (`id_site`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `gallerielangue`
--

CREATE TABLE IF NOT EXISTS `gallerielangue` (
  `id_gallerie` int(11) NOT NULL,
  `iso_langue` varchar(5) NOT NULL,
  `titre_gallerielangue` varchar(255) DEFAULT NULL,
  `description_gallerielangue` text,
  PRIMARY KEY (`id_gallerie`,`iso_langue`),
  KEY `fk_gallerielangue2` (`iso_langue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `galleriepage`
--

CREATE TABLE IF NOT EXISTS `galleriepage` (
  `id_gallerie` int(11) NOT NULL,
  `id_page` int(11) NOT NULL,
  `position_galleriepage` int(11) NOT NULL,
  PRIMARY KEY (`id_gallerie`,`id_page`),
  KEY `fk_galleriepage2` (`id_page`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `langue`
--

CREATE TABLE IF NOT EXISTS `langue` (
  `iso_langue` varchar(5) NOT NULL,
  PRIMARY KEY (`iso_langue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `languesite`
--

CREATE TABLE IF NOT EXISTS `languesite` (
  `id_site` int(11) NOT NULL,
  `iso_langue` varchar(5) NOT NULL,
  `default_languesite` enum('0','1') NOT NULL,
  `position_languesite` int(11) NOT NULL,
  `desctipion_languesite` text,
  `title_languesite` varchar(255) DEFAULT NULL,
  `pays_languesite` varchar(255) DEFAULT NULL,
  `etat_languesite` enum('0','1') NOT NULL,
  PRIMARY KEY (`id_site`,`iso_langue`),
  KEY `fk_languesite2` (`iso_langue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `newsletter`
--

CREATE TABLE IF NOT EXISTS `newsletter` (
  `id_newsletter` int(11) NOT NULL AUTO_INCREMENT,
  `id_site` int(11) NOT NULL,
  `sujet_newsletter` varchar(255) NOT NULL,
  `body_newsletter` text NOT NULL,
  `date_newsletter` datetime NOT NULL,
  PRIMARY KEY (`id_newsletter`),
  KEY `fk_relation_15` (`id_site`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `page`
--

CREATE TABLE IF NOT EXISTS `page` (
  `id_page` int(11) NOT NULL AUTO_INCREMENT,
  `id_site` int(11) NOT NULL,
  `id_typepage` int(11) NOT NULL,
  `menu_page` enum('0','1') NOT NULL,
  `parent_page` int(11) NOT NULL,
  `order_page` int(11) NOT NULL,
  PRIMARY KEY (`id_page`),
  KEY `fk_relation_6` (`id_site`),
  KEY `fk_relation_9` (`id_typepage`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `pagelangue`
--

CREATE TABLE IF NOT EXISTS `pagelangue` (
  `id_page` int(11) NOT NULL,
  `iso_langue` varchar(5) NOT NULL,
  `titre_pagelangue` varchar(255) DEFAULT NULL,
  `content_pagelangue` text,
  `title_pagelangue` varchar(255) DEFAULT NULL,
  `description_pagelangue` text,
  PRIMARY KEY (`id_page`,`iso_langue`),
  KEY `fk_pagelangue2` (`iso_langue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `photo`
--

CREATE TABLE IF NOT EXISTS `photo` (
  `id_photo` int(11) NOT NULL AUTO_INCREMENT,
  `id_gallerie` int(11) NOT NULL,
  `order_photo` int(11) NOT NULL,
  PRIMARY KEY (`id_photo`),
  KEY `fk_relation_3` (`id_gallerie`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `photolangue`
--

CREATE TABLE IF NOT EXISTS `photolangue` (
  `iso_langue` varchar(5) NOT NULL,
  `id_photo` int(11) NOT NULL,
  `titre_photolangue` varchar(255) DEFAULT NULL,
  `description_photolangue` text,
  PRIMARY KEY (`iso_langue`,`id_photo`),
  KEY `fk_photolangue2` (`id_photo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `reseausosial`
--

CREATE TABLE IF NOT EXISTS `reseausosial` (
  `id_resocial` int(11) NOT NULL AUTO_INCREMENT,
  `id_site` int(11) NOT NULL,
  `nom_resocial` varchar(255) NOT NULL,
  `url_resocial` varchar(255) NOT NULL,
  PRIMARY KEY (`id_resocial`),
  KEY `fk_relation_16` (`id_site`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `site`
--

CREATE TABLE IF NOT EXISTS `site` (
  `id_site` int(11) NOT NULL AUTO_INCREMENT,
  `id_actualite` int(11) DEFAULT NULL,
  `id_client` int(11) NOT NULL,
  `nom_site` varchar(255) NOT NULL,
  `user_site` varchar(255) NOT NULL,
  `pass_site` varchar(255) NOT NULL,
  `analytics_site` varchar(255) DEFAULT NULL,
  `maintenance_site` enum('0','1') NOT NULL,
  `dateproduction_site` datetime NOT NULL,
  `date_site` datetime NOT NULL,
  `lattitude_site` int(11) DEFAULT NULL,
  `longitude_site` int(11) DEFAULT NULL,
  `etat_site` enum('En attente','Design en cours','Design terminé','Développement en cours','Développement terminé','En test','En production') NOT NULL DEFAULT 'En attente',
  PRIMARY KEY (`id_site`),
  KEY `fk_relation_12` (`id_actualite`),
  KEY `fk_relation_5` (`id_client`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `sujet`
--

CREATE TABLE IF NOT EXISTS `sujet` (
  `id_sujet` int(11) NOT NULL AUTO_INCREMENT,
  `id_site` int(11) NOT NULL,
  `titre_sujet` varchar(255) NOT NULL,
  `date_sujet` datetime NOT NULL,
  PRIMARY KEY (`id_sujet`),
  KEY `fk_relation_8` (`id_site`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `tel`
--

CREATE TABLE IF NOT EXISTS `tel` (
  `id_tel` int(11) NOT NULL AUTO_INCREMENT,
  `id_client` int(11) NOT NULL,
  `num_tel` int(11) NOT NULL,
  `type_tel` varchar(255) DEFAULT NULL,
  `principale_tel` enum('0','1') NOT NULL,
  PRIMARY KEY (`id_tel`),
  KEY `fk_relation_11` (`id_client`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `typepage`
--

CREATE TABLE IF NOT EXISTS `typepage` (
  `id_typepage` int(11) NOT NULL AUTO_INCREMENT,
  `nom_typepage` varchar(255) NOT NULL,
  PRIMARY KEY (`id_typepage`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `actulangue`
--
ALTER TABLE `actulangue`
  ADD CONSTRAINT `fk_actulangue` FOREIGN KEY (`id_actualite`) REFERENCES `actualite` (`id_actualite`),
  ADD CONSTRAINT `fk_actulangue2` FOREIGN KEY (`iso_langue`) REFERENCES `langue` (`iso_langue`);

--
-- Contraintes pour la table `adminsite`
--
ALTER TABLE `adminsite`
  ADD CONSTRAINT `fk_relation_17` FOREIGN KEY (`id_admin`) REFERENCES `administrateur` (`id_admin`),
  ADD CONSTRAINT `fk_relation_18` FOREIGN KEY (`id_site`) REFERENCES `site` (`id_site`);

--
-- Contraintes pour la table `clientnewsletter`
--
ALTER TABLE `clientnewsletter`
  ADD CONSTRAINT `fk_relation_13` FOREIGN KEY (`id_site`) REFERENCES `site` (`id_site`),
  ADD CONSTRAINT `fk_relation_14` FOREIGN KEY (`iso_langue`) REFERENCES `langue` (`iso_langue`);

--
-- Contraintes pour la table `dialogue`
--
ALTER TABLE `dialogue`
  ADD CONSTRAINT `fk_relation_7` FOREIGN KEY (`id_sujet`) REFERENCES `sujet` (`id_sujet`);

--
-- Contraintes pour la table `email`
--
ALTER TABLE `email`
  ADD CONSTRAINT `fk_relation_10` FOREIGN KEY (`id_site`) REFERENCES `site` (`id_site`);

--
-- Contraintes pour la table `gallerie`
--
ALTER TABLE `gallerie`
  ADD CONSTRAINT `fk_relation_2` FOREIGN KEY (`id_site`) REFERENCES `site` (`id_site`);

--
-- Contraintes pour la table `gallerielangue`
--
ALTER TABLE `gallerielangue`
  ADD CONSTRAINT `fk_gallerielangue` FOREIGN KEY (`id_gallerie`) REFERENCES `gallerie` (`id_gallerie`),
  ADD CONSTRAINT `fk_gallerielangue2` FOREIGN KEY (`iso_langue`) REFERENCES `langue` (`iso_langue`);

--
-- Contraintes pour la table `galleriepage`
--
ALTER TABLE `galleriepage`
  ADD CONSTRAINT `fk_galleriepage` FOREIGN KEY (`id_gallerie`) REFERENCES `gallerie` (`id_gallerie`),
  ADD CONSTRAINT `fk_galleriepage2` FOREIGN KEY (`id_page`) REFERENCES `page` (`id_page`);

--
-- Contraintes pour la table `languesite`
--
ALTER TABLE `languesite`
  ADD CONSTRAINT `fk_languesite` FOREIGN KEY (`id_site`) REFERENCES `site` (`id_site`),
  ADD CONSTRAINT `fk_languesite2` FOREIGN KEY (`iso_langue`) REFERENCES `langue` (`iso_langue`);

--
-- Contraintes pour la table `newsletter`
--
ALTER TABLE `newsletter`
  ADD CONSTRAINT `fk_relation_15` FOREIGN KEY (`id_site`) REFERENCES `site` (`id_site`);

--
-- Contraintes pour la table `page`
--
ALTER TABLE `page`
  ADD CONSTRAINT `fk_relation_6` FOREIGN KEY (`id_site`) REFERENCES `site` (`id_site`),
  ADD CONSTRAINT `fk_relation_9` FOREIGN KEY (`id_typepage`) REFERENCES `typepage` (`id_typepage`);

--
-- Contraintes pour la table `pagelangue`
--
ALTER TABLE `pagelangue`
  ADD CONSTRAINT `fk_pagelangue` FOREIGN KEY (`id_page`) REFERENCES `page` (`id_page`),
  ADD CONSTRAINT `fk_pagelangue2` FOREIGN KEY (`iso_langue`) REFERENCES `langue` (`iso_langue`);

--
-- Contraintes pour la table `photo`
--
ALTER TABLE `photo`
  ADD CONSTRAINT `fk_relation_3` FOREIGN KEY (`id_gallerie`) REFERENCES `gallerie` (`id_gallerie`);

--
-- Contraintes pour la table `photolangue`
--
ALTER TABLE `photolangue`
  ADD CONSTRAINT `fk_photolangue` FOREIGN KEY (`iso_langue`) REFERENCES `langue` (`iso_langue`),
  ADD CONSTRAINT `fk_photolangue2` FOREIGN KEY (`id_photo`) REFERENCES `photo` (`id_photo`);

--
-- Contraintes pour la table `reseausosial`
--
ALTER TABLE `reseausosial`
  ADD CONSTRAINT `fk_relation_16` FOREIGN KEY (`id_site`) REFERENCES `site` (`id_site`);

--
-- Contraintes pour la table `site`
--
ALTER TABLE `site`
  ADD CONSTRAINT `fk_relation_12` FOREIGN KEY (`id_actualite`) REFERENCES `actualite` (`id_actualite`),
  ADD CONSTRAINT `fk_relation_5` FOREIGN KEY (`id_client`) REFERENCES `client` (`id_client`);

--
-- Contraintes pour la table `sujet`
--
ALTER TABLE `sujet`
  ADD CONSTRAINT `fk_relation_8` FOREIGN KEY (`id_site`) REFERENCES `site` (`id_site`);

--
-- Contraintes pour la table `tel`
--
ALTER TABLE `tel`
  ADD CONSTRAINT `fk_relation_11` FOREIGN KEY (`id_client`) REFERENCES `client` (`id_client`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
