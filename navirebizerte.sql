-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 28, 2021 at 05:41 AM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `navirebizerte`
--

-- --------------------------------------------------------

--
-- Table structure for table `agentconsignataire`
--

CREATE TABLE `agentconsignataire` (
  `reference` int(10) UNSIGNED NOT NULL,
  `nom` varchar(20) NOT NULL,
  `prenom` varchar(20) NOT NULL,
  `adresse` varchar(20) NOT NULL,
  `numeroTel` int(11) NOT NULL,
  `numeroFax` int(11) DEFAULT NULL,
  `email` varchar(45) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `agentconsignataire`
--

INSERT INTO `agentconsignataire` (`reference`, `nom`, `prenom`, `adresse`, `numeroTel`, `numeroFax`, `email`) VALUES
(1, 'belhaaj', 'ahmed', '4 rue Tunisie', 11111111, 73685953, 'ahmed@gmail.com'),
(5, 'dridi', 'slim', '7 rue Tunis', 22222222, 76549835, 'slim@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `armateur`
--

CREATE TABLE `armateur` (
  `id` int(10) UNSIGNED NOT NULL,
  `adresse` varchar(30) NOT NULL,
  `prenom` varchar(25) NOT NULL,
  `nom` varchar(20) NOT NULL,
  `numeroTel` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `armateur`
--

INSERT INTO `armateur` (`id`, `adresse`, `prenom`, `nom`, `numeroTel`) VALUES
(1, '4 rue Orange ', 'ahmedd', 'belhajj', 11111111),
(2, '7 rue Tunis', 'slimm', 'dridiii', 22222222);

-- --------------------------------------------------------

--
-- Table structure for table `demandeescale`
--

CREATE TABLE `demandeescale` (
  `id` int(10) UNSIGNED NOT NULL,
  `heureArrivee` datetime NOT NULL,
  `heureSortie` datetime NOT NULL,
  `navireId` int(10) UNSIGNED DEFAULT NULL,
  `agentResponsableId` int(10) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `demandeescale`
--

INSERT INTO `demandeescale` (`id`, `heureArrivee`, `heureSortie`, `navireId`, `agentResponsableId`) VALUES
(1, '2021-05-26 23:43:51', '2021-05-26 23:43:51', 1, 5),
(2, '2021-05-26 23:43:51', '2021-05-26 23:43:51', 2, 2),
(3, '2021-05-26 23:43:51', '2021-05-26 23:43:51', 3, 3),
(7, '2021-05-26 23:43:51', '2021-05-26 23:43:51', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `docker`
--

CREATE TABLE `docker` (
  `id` int(10) UNSIGNED NOT NULL,
  `codeId` int(10) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `employe`
--

CREATE TABLE `employe` (
  `codeId` int(10) UNSIGNED NOT NULL,
  `nom` varchar(20) NOT NULL,
  `prenom` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employe`
--

INSERT INTO `employe` (`codeId`, `nom`, `prenom`) VALUES
(0, 'belhaj', 'ahmed'),
(1, 'belhaj', 'ahmed'),
(2, 'dridi', 'slim');

-- --------------------------------------------------------

--
-- Table structure for table `ficheescale`
--

CREATE TABLE `ficheescale` (
  `numero` int(10) UNSIGNED NOT NULL,
  `piloteArr` int(10) UNSIGNED NOT NULL,
  `piloteSortie` int(10) UNSIGNED DEFAULT NULL,
  `idProposition` int(10) UNSIGNED NOT NULL,
  `prochaineDestination` varchar(25) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ficheescale`
--

INSERT INTO `ficheescale` (`numero`, `piloteArr`, `piloteSortie`, `idProposition`, `prochaineDestination`) VALUES
(2, 2, 1, 2, 'Tunisie'),
(3, 1, 1, 1, 'Italie'),
(5, 2, 1, 1, 'Paris');

-- --------------------------------------------------------

--
-- Table structure for table `lloydregister`
--

CREATE TABLE `lloydregister` (
  `numeroLloyd` int(10) UNSIGNED NOT NULL,
  `nom` varchar(25) NOT NULL,
  `largeur` decimal(5,2) NOT NULL,
  `longueur` decimal(5,2) NOT NULL,
  `capacite` int(11) NOT NULL,
  `tirantEauMax` decimal(5,2) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lloydregister`
--

INSERT INTO `lloydregister` (`numeroLloyd`, `nom`, `largeur`, `longueur`, `capacite`, `tirantEauMax`) VALUES
(1, 'f', '16.00', '16.00', 3203, '15.00'),
(2, 'ff', '16.00', '17.00', 260, '200.00');

-- --------------------------------------------------------

--
-- Table structure for table `marchandise`
--

CREATE TABLE `marchandise` (
  `id` int(10) UNSIGNED NOT NULL,
  `typeMarchandise` varchar(25) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `navire`
--

CREATE TABLE `navire` (
  `id` int(10) UNSIGNED NOT NULL,
  `idArmateur` int(10) UNSIGNED DEFAULT NULL,
  `typeNavire` varchar(25) NOT NULL,
  `numeroLloyd` int(10) UNSIGNED DEFAULT NULL,
  `interdiction` varchar(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `navire`
--

INSERT INTO `navire` (`id`, `idArmateur`, `typeNavire`, `numeroLloyd`, `interdiction`) VALUES
(1, 1, 'm', 1, 'provisoir'),
(2, 2, 'mm', 2, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `naviremarchandise`
--

CREATE TABLE `naviremarchandise` (
  `typeNavire` varchar(25) NOT NULL,
  `marchandise` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pilote`
--

CREATE TABLE `pilote` (
  `id` int(10) UNSIGNED NOT NULL,
  `codeId` int(10) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pilote`
--

INSERT INTO `pilote` (`id`, `codeId`) VALUES
(1, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `posteaccostage`
--

CREATE TABLE `posteaccostage` (
  `numero` int(10) UNSIGNED NOT NULL,
  `referenceQuai` int(10) UNSIGNED DEFAULT NULL,
  `longueur` decimal(5,2) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posteaccostage`
--

INSERT INTO `posteaccostage` (`numero`, `referenceQuai`, `longueur`) VALUES
(1, 0, '16.00'),
(2, 1, '17.00');

-- --------------------------------------------------------

--
-- Table structure for table `propositionescale`
--

CREATE TABLE `propositionescale` (
  `id` int(10) UNSIGNED NOT NULL,
  `numeroPoste` int(10) UNSIGNED NOT NULL,
  `dureeEscale` time NOT NULL,
  `coutEscale` decimal(10,3) NOT NULL,
  `demandeId` int(10) UNSIGNED NOT NULL,
  `avis` tinyint(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `propositionescale`
--

INSERT INTO `propositionescale` (`id`, `numeroPoste`, `dureeEscale`, `coutEscale`, `demandeId`, `avis`) VALUES
(1, 1, '23:44:38', '200.000', 1, 1),
(3, 1, '23:44:38', '200.000', 7, 0);

-- --------------------------------------------------------

--
-- Table structure for table `quai`
--

CREATE TABLE `quai` (
  `referenceQuai` int(10) UNSIGNED NOT NULL,
  `nom` varchar(25) NOT NULL,
  `tirantEauMax` decimal(5,2) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `quai`
--

INSERT INTO `quai` (`referenceQuai`, `nom`, `tirantEauMax`) VALUES
(0, 'r1', '60.00'),
(1, 'rrr', '60.00'),
(2, 'rrrr', '100.00');

-- --------------------------------------------------------

--
-- Table structure for table `quaimarchandise`
--

CREATE TABLE `quaimarchandise` (
  `quai` int(10) UNSIGNED NOT NULL,
  `marchandise` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

CREATE TABLE `test` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(25) NOT NULL,
  `age` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agentconsignataire`
--
ALTER TABLE `agentconsignataire`
  ADD PRIMARY KEY (`reference`),
  ADD UNIQUE KEY `numeroTel` (`numeroTel`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `armateur`
--
ALTER TABLE `armateur`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `numeroTel` (`numeroTel`);

--
-- Indexes for table `demandeescale`
--
ALTER TABLE `demandeescale`
  ADD PRIMARY KEY (`id`),
  ADD KEY `agentResponsableId` (`agentResponsableId`),
  ADD KEY `navireId` (`navireId`);

--
-- Indexes for table `docker`
--
ALTER TABLE `docker`
  ADD PRIMARY KEY (`id`),
  ADD KEY `codeId` (`codeId`);

--
-- Indexes for table `employe`
--
ALTER TABLE `employe`
  ADD PRIMARY KEY (`codeId`);

--
-- Indexes for table `ficheescale`
--
ALTER TABLE `ficheescale`
  ADD PRIMARY KEY (`numero`),
  ADD KEY `piloteArr` (`piloteArr`),
  ADD KEY `piloteSortie` (`piloteSortie`),
  ADD KEY `idProposition` (`idProposition`);

--
-- Indexes for table `lloydregister`
--
ALTER TABLE `lloydregister`
  ADD PRIMARY KEY (`numeroLloyd`);

--
-- Indexes for table `marchandise`
--
ALTER TABLE `marchandise`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `typeMarchandise` (`typeMarchandise`);

--
-- Indexes for table `navire`
--
ALTER TABLE `navire`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idArmateur` (`idArmateur`),
  ADD KEY `numeroLloyd` (`numeroLloyd`);

--
-- Indexes for table `naviremarchandise`
--
ALTER TABLE `naviremarchandise`
  ADD PRIMARY KEY (`typeNavire`,`marchandise`),
  ADD KEY `marchandise` (`marchandise`);

--
-- Indexes for table `pilote`
--
ALTER TABLE `pilote`
  ADD PRIMARY KEY (`id`),
  ADD KEY `codeId` (`codeId`);

--
-- Indexes for table `posteaccostage`
--
ALTER TABLE `posteaccostage`
  ADD PRIMARY KEY (`numero`),
  ADD KEY `referenceQuai` (`referenceQuai`);

--
-- Indexes for table `propositionescale`
--
ALTER TABLE `propositionescale`
  ADD PRIMARY KEY (`id`),
  ADD KEY `demandeId` (`demandeId`),
  ADD KEY `numeroPoste` (`numeroPoste`);

--
-- Indexes for table `quai`
--
ALTER TABLE `quai`
  ADD PRIMARY KEY (`referenceQuai`),
  ADD UNIQUE KEY `nom` (`nom`);

--
-- Indexes for table `quaimarchandise`
--
ALTER TABLE `quaimarchandise`
  ADD PRIMARY KEY (`quai`,`marchandise`),
  ADD KEY `marchandise` (`marchandise`);

--
-- Indexes for table `test`
--
ALTER TABLE `test`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `agentconsignataire`
--
ALTER TABLE `agentconsignataire`
  MODIFY `reference` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `armateur`
--
ALTER TABLE `armateur`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `demandeescale`
--
ALTER TABLE `demandeescale`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `docker`
--
ALTER TABLE `docker`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ficheescale`
--
ALTER TABLE `ficheescale`
  MODIFY `numero` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `lloydregister`
--
ALTER TABLE `lloydregister`
  MODIFY `numeroLloyd` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `marchandise`
--
ALTER TABLE `marchandise`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `navire`
--
ALTER TABLE `navire`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pilote`
--
ALTER TABLE `pilote`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `posteaccostage`
--
ALTER TABLE `posteaccostage`
  MODIFY `numero` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `propositionescale`
--
ALTER TABLE `propositionescale`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `test`
--
ALTER TABLE `test`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
