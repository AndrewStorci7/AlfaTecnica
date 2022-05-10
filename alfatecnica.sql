-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Mag 10, 2022 alle 16:21
-- Versione del server: 10.4.22-MariaDB
-- Versione PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `alfatecnica`
--
CREATE DATABASE IF NOT EXISTS `alfatecnica` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `alfatecnica`;

-- --------------------------------------------------------

--
-- Struttura della tabella `anagrafica`
--

CREATE TABLE `anagrafica` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `sede` varchar(100) NOT NULL,
  `path_logo` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `anagrafica`
--

INSERT INTO `anagrafica` (`id`, `nome`, `sede`, `path_logo`) VALUES
(1, 'Dallara', 'Varano de Melegari', 'img/loghi/azienda1.png'),
(2, 'Bercella', 'Varano de Melegari', 'img/loghi/azienda2.png'),
(3, 'NonSoloTabacchi', 'Ozzano Taro', 'img/loghi/azienda3.png');

-- --------------------------------------------------------

--
-- Struttura della tabella `app`
--

CREATE TABLE `app` (
  `idAnagrafica` int(11) NOT NULL,
  `idPlanimetria` int(11) NOT NULL,
  `idProdotto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `campi`
--

CREATE TABLE `campi` (
  `id` int(11) NOT NULL,
  `stato` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `cliente`
--

CREATE TABLE `cliente` (
  `idUtente` int(11) NOT NULL,
  `idAnagrafica` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `c_p`
--

CREATE TABLE `c_p` (
  `idCampo` int(11) NOT NULL,
  `idProdotto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `domande`
--

CREATE TABLE `domande` (
  `id` int(11) NOT NULL,
  `testo` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `d_q`
--

CREATE TABLE `d_q` (
  `idQuestionario` int(11) NOT NULL,
  `idDomanda` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `planimetrie`
--

CREATE TABLE `planimetrie` (
  `id` int(11) NOT NULL,
  `path_img` tinytext NOT NULL,
  `idAnagrafica` int(11) NOT NULL,
  `nome_azienda` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `planimetrie`
--

INSERT INTO `planimetrie` (`id`, `path_img`, `idAnagrafica`, `nome_azienda`) VALUES
(1, 'img/planimetrie/download.png', 1, 'Dallara'),
(2, 'img/planimetrie/checojon-scaled.png', 2, 'Bercella'),
(3, 'img/planimetrie/download.png', 3, 'NonSoloTabacchi');

-- --------------------------------------------------------

--
-- Struttura della tabella `prodotti`
--

CREATE TABLE `prodotti` (
  `id` int(11) NOT NULL,
  `pos_x` float NOT NULL,
  `pos_y` float NOT NULL,
  `id_prodotto` int(11) NOT NULL,
  `id_planimetria` int(11) NOT NULL COMMENT 'Campo nullo, è solo una prova'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `prodotti`
--

INSERT INTO `prodotti` (`id`, `pos_x`, `pos_y`, `id_prodotto`, `id_planimetria`) VALUES
(1, 223, 502, 1, 1),
(2, 300, 560, 1, 1),
(3, 697, 428, 2, 1),
(4, 299, 576, 1, 1),
(5, 727, 224, 1, 1),
(6, 578, 246, 2, 1),
(7, 609, 560, 2, 1),
(8, 255, 176, 1, 2),
(9, 145, 234, 1, 2),
(10, 100, 100, 2, 2),
(11, 187, 190, 3, 3),
(12, 289, 598, 2, 3);

-- --------------------------------------------------------

--
-- Struttura della tabella `prodotti_img`
--

CREATE TABLE `prodotti_img` (
  `id` int(11) NOT NULL,
  `path_img` tinytext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `prodotti_img`
--

INSERT INTO `prodotti_img` (`id`, `path_img`) VALUES
(1, 'img/prodotti/estintore.png'),
(2, 'img/prodotti/sedia.png'),
(3, 'img/prodotti/tavolo.png');

-- --------------------------------------------------------

--
-- Struttura della tabella `p_d`
--

CREATE TABLE `p_d` (
  `idProdotto` int(11) NOT NULL,
  `idDomanda` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `p_q`
--

CREATE TABLE `p_q` (
  `idProdotto` int(11) NOT NULL,
  `idQuestionario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `questionario`
--

CREATE TABLE `questionario` (
  `id` int(11) NOT NULL,
  `testo` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `revisioni`
--

CREATE TABLE `revisioni` (
  `id` int(11) NOT NULL,
  `idProdotto` int(11) NOT NULL,
  `data` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `ris_rev`
--

CREATE TABLE `ris_rev` (
  `idRevisione` int(11) NOT NULL,
  `idcampo` int(11) NOT NULL,
  `valore` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `utente`
--

CREATE TABLE `utente` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `cognome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `anagrafica`
--
ALTER TABLE `anagrafica`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `app`
--
ALTER TABLE `app`
  ADD PRIMARY KEY (`idAnagrafica`,`idPlanimetria`,`idProdotto`),
  ADD KEY `idAnagrafica` (`idAnagrafica`),
  ADD KEY `idPlanimetria` (`idPlanimetria`),
  ADD KEY `idProdotto` (`idProdotto`);

--
-- Indici per le tabelle `campi`
--
ALTER TABLE `campi`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idUtente`,`idAnagrafica`),
  ADD KEY `idUtente` (`idUtente`),
  ADD KEY `idAnagrafica` (`idAnagrafica`);

--
-- Indici per le tabelle `c_p`
--
ALTER TABLE `c_p`
  ADD PRIMARY KEY (`idCampo`,`idProdotto`),
  ADD KEY `idCampo` (`idCampo`),
  ADD KEY `idProdotto` (`idProdotto`);

--
-- Indici per le tabelle `domande`
--
ALTER TABLE `domande`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `d_q`
--
ALTER TABLE `d_q`
  ADD PRIMARY KEY (`idQuestionario`,`idDomanda`),
  ADD KEY `idQuestionario` (`idQuestionario`),
  ADD KEY `idDomanda` (`idDomanda`);

--
-- Indici per le tabelle `planimetrie`
--
ALTER TABLE `planimetrie`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idAnagrafica` (`idAnagrafica`);

--
-- Indici per le tabelle `prodotti`
--
ALTER TABLE `prodotti`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_prodotto` (`id_prodotto`),
  ADD KEY `id_planimetria` (`id_planimetria`);

--
-- Indici per le tabelle `prodotti_img`
--
ALTER TABLE `prodotti_img`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `p_d`
--
ALTER TABLE `p_d`
  ADD PRIMARY KEY (`idProdotto`,`idDomanda`),
  ADD KEY `idProdotto` (`idProdotto`),
  ADD KEY `idDomanda` (`idDomanda`);

--
-- Indici per le tabelle `p_q`
--
ALTER TABLE `p_q`
  ADD PRIMARY KEY (`idProdotto`,`idQuestionario`),
  ADD KEY `idQuestionario` (`idQuestionario`),
  ADD KEY `idProdotto` (`idProdotto`);

--
-- Indici per le tabelle `questionario`
--
ALTER TABLE `questionario`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `revisioni`
--
ALTER TABLE `revisioni`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idProdotto` (`idProdotto`);

--
-- Indici per le tabelle `ris_rev`
--
ALTER TABLE `ris_rev`
  ADD PRIMARY KEY (`idRevisione`,`idcampo`),
  ADD KEY `idRevisione` (`idRevisione`),
  ADD KEY `idRevisione_2` (`idRevisione`),
  ADD KEY `idcampo` (`idcampo`);

--
-- Indici per le tabelle `utente`
--
ALTER TABLE `utente`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `anagrafica`
--
ALTER TABLE `anagrafica`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT per la tabella `campi`
--
ALTER TABLE `campi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `domande`
--
ALTER TABLE `domande`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `planimetrie`
--
ALTER TABLE `planimetrie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT per la tabella `prodotti`
--
ALTER TABLE `prodotti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT per la tabella `prodotti_img`
--
ALTER TABLE `prodotti_img`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT per la tabella `questionario`
--
ALTER TABLE `questionario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `revisioni`
--
ALTER TABLE `revisioni`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `utente`
--
ALTER TABLE `utente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `app`
--
ALTER TABLE `app`
  ADD CONSTRAINT `app_ibfk_1` FOREIGN KEY (`idAnagrafica`) REFERENCES `anagrafica` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `app_ibfk_2` FOREIGN KEY (`idPlanimetria`) REFERENCES `planimetrie` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `app_ibfk_3` FOREIGN KEY (`idProdotto`) REFERENCES `prodotti` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`idUtente`) REFERENCES `utente` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cliente_ibfk_2` FOREIGN KEY (`idAnagrafica`) REFERENCES `anagrafica` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `c_p`
--
ALTER TABLE `c_p`
  ADD CONSTRAINT `c_p_ibfk_1` FOREIGN KEY (`idCampo`) REFERENCES `campi` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `c_p_ibfk_2` FOREIGN KEY (`idProdotto`) REFERENCES `prodotti` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `d_q`
--
ALTER TABLE `d_q`
  ADD CONSTRAINT `d_q_ibfk_1` FOREIGN KEY (`idQuestionario`) REFERENCES `questionario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `d_q_ibfk_2` FOREIGN KEY (`idDomanda`) REFERENCES `domande` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `planimetrie`
--
ALTER TABLE `planimetrie`
  ADD CONSTRAINT `planimetrie_ibfk_1` FOREIGN KEY (`idAnagrafica`) REFERENCES `anagrafica` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `prodotti`
--
ALTER TABLE `prodotti`
  ADD CONSTRAINT `prodotti_ibfk_1` FOREIGN KEY (`id_prodotto`) REFERENCES `prodotti_img` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `prodotti_ibfk_2` FOREIGN KEY (`id_planimetria`) REFERENCES `planimetrie` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `p_d`
--
ALTER TABLE `p_d`
  ADD CONSTRAINT `p_d_ibfk_1` FOREIGN KEY (`idDomanda`) REFERENCES `domande` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `p_d_ibfk_2` FOREIGN KEY (`idProdotto`) REFERENCES `prodotti` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
