-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 29-Nov-2023 às 19:44
-- Versão do servidor: 10.1.28-MariaDB
-- PHP Version: 7.1.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `minhaagenda`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `pessoas`
--

CREATE TABLE `pessoas` (
  `id` int(11) NOT NULL,
  `avatar` varchar(128) NOT NULL DEFAULT 'avatar.jpg',
  `nome` varchar(50) NOT NULL,
  `fone` varchar(20) NOT NULL,
  `email` varchar(80) NOT NULL,
  `data_criado` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `data_editado` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `pessoas`
--

INSERT INTO `pessoas` (`id`, `avatar`, `nome`, `fone`, `email`, `data_criado`, `data_editado`) VALUES
(5, 'c7dc0a55c8e69f34c0e6c3a16028ca81.png', 'Madalena Santos', '(51) 32556-987', 'santosm@gmail.com', '2023-11-20 18:05:14', '2023-11-27 17:31:30'),
(7, '8aace8049ce377e4d0e60604af833520.png', 'Terezinha de Jesus', '(31) 98265465464', 'terezinha@bol.com.br', '2023-11-20 19:07:30', '2023-11-27 17:45:27'),
(9, 'bc6756732750735400bceb4c7db8802e.jpg', 'Joana D\'arc', '(31) 94074070', 'joana@gmail.com', '2023-11-22 17:25:22', '2023-11-27 17:49:46'),
(11, '88b5659dbe9f3fb22e8fc05850dbe754.PNG', 'Fernando Diniz', '(21) 658785-5577', 'diniz@morreu.com', '2023-11-22 18:03:13', '2023-11-27 18:02:30'),
(13, 'cbc47c55d442e5095a681e3684e041b5.png', 'Pedro Pedreira', '(31) 94074070', 'pedro.pedreira@gmail.com', '2023-11-22 18:21:53', '2023-11-27 17:47:46'),
(14, '01b084c7019f8921b1bc878bda75376d.jpg', 'Elias da Bahia', '(51) 94074079', 'elias_ramos@alcidesmaya.com.br', '2023-11-27 17:33:51', '2023-11-27 17:34:10'),
(15, '535977b19ec37ffbc31e6341275fccad.jpg', 'Edson Arantes do Nascimento', '(11) 658785-5577', 'pele@cbf.com.br', '2023-11-27 18:03:04', '2023-11-27 18:03:16');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `usuario` varchar(20) NOT NULL,
  `senha` varchar(128) NOT NULL,
  `email` varchar(80) NOT NULL,
  `data_criado` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `data_editado` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `usuario`, `senha`, `email`, `data_criado`, `data_editado`) VALUES
(1, 'admin', '78c6df882e64b087697b87cd4749ddc05ce9b27ee7630096b79a07ac5b5bfe42', 'admin@root.com', '2023-11-27 19:00:19', '2023-11-29 18:31:01');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pessoas`
--
ALTER TABLE `pessoas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pessoas`
--
ALTER TABLE `pessoas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
