-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Mag 09, 2022 alle 19:53
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
(1, 23.87, 56.65, 1, 172),
(2, 109.54, 453.55, 1, 16),
(3, 251.88, 176.12, 3, 74),
(10, 223, 502, 1, 1),
(11, 300, 560, 1, 1),
(12, 697, 428, 2, 1),
(13, 299, 576, 1, 1),
(14, 727, 224, 1, 1),
(15, 578, 246, 2, 1),
(16, 609, 560, 2, 1),
(17, 552, 389, 2, 46),
(18, 240, 570, 2, 95),
(19, 255, 176, 1, 2),
(20, 145, 234, 1, 2),
(21, 100, 100, 2, 2),
(22, 187, 190, 3, 3),
(23, 289, 598, 2, 3),
(24, 133, 409, 1, 44),
(25, 808, 394, 1, 11);

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `prodotti`
--
ALTER TABLE `prodotti`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_prodotto` (`id_prodotto`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `prodotti`
--
ALTER TABLE `prodotti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `prodotti`
--
ALTER TABLE `prodotti`
  ADD CONSTRAINT `prodotti_ibfk_1` FOREIGN KEY (`id_prodotto`) REFERENCES `prodotti_img` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
