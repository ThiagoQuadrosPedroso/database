-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 23/10/2024 às 02:32
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `db_kyubu_store`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `fk_mov_produto`
--

CREATE TABLE `fk_mov_produto` (
  `quantidade` int(11) NOT NULL,
  `id_produto` int(11) NOT NULL,
  `id_movimentacao` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_fabricante`
--

CREATE TABLE `tb_fabricante` (
  `id_fabricante` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_movimentacao`
--

CREATE TABLE `tb_movimentacao` (
  `id_movimentacao` int(11) NOT NULL,
  `dt_movimentacao` datetime NOT NULL,
  `id_tipo` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_produto`
--

CREATE TABLE `tb_produto` (
  `id_produto` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `valor` decimal(11,2) NOT NULL,
  `garantia` varchar(45) NOT NULL,
  `descricao` varchar(45) NOT NULL,
  `id_fabricante` int(11) NOT NULL,
  `id_tipo` int(11) NOT NULL,
  `link` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_tipo`
--

CREATE TABLE `tb_tipo` (
  `id_tipo` int(11) NOT NULL,
  `descricao` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `tb_tipo`
--

INSERT INTO `tb_tipo` (`id_tipo`, `descricao`) VALUES
(1, 'usuarionormal'),
(2, 'usuarioadministrador');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_usuario`
--

CREATE TABLE `tb_usuario` (
  `id_usuario` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `sobrenome` varchar(45) NOT NULL,
  `login` varchar(45) NOT NULL,
  `senha` varchar(100) NOT NULL,
  `email` varchar(45) NOT NULL,
  `dt_criacao` date NOT NULL,
  `telefone` varchar(45) NOT NULL,
  `dt_nascimento` date NOT NULL,
  `ativo` varchar(45) DEFAULT NULL,
  `id_tipo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `tb_usuario`
--

INSERT INTO `tb_usuario` (`id_usuario`, `nome`, `sobrenome`, `login`, `senha`, `email`, `dt_criacao`, `telefone`, `dt_nascimento`, `ativo`, `id_tipo`) VALUES
(1, 'Orbalt', 'West', 'Orbalt West', '879001af31a4302986982d308cfc3e5af870d858', 'orbalthefour@caosmail.com.br', '2024-09-03', '39212530', '1945-03-05', NULL, 1),
(2, 'Autil', 'South', 'Autil South', '4535', 'Autilsou@csmail.com.br', '2024-09-03', '68592530', '1975-01-20', NULL, 2),
(3, 'gsdfgsdfgsd', 'sfgdgfsgsdfg', 'sgdgsgsd', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'fdhdfggfdtrgr', '0000-00-00', '45345345453', '2024-10-08', NULL, 1);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `fk_mov_produto`
--
ALTER TABLE `fk_mov_produto`
  ADD KEY `fk_fk_mov_produto_tb_produto1_idx` (`id_produto`),
  ADD KEY `fk_fk_mov_produto_tb_movimentacao1_idx` (`id_movimentacao`);

--
-- Índices de tabela `tb_fabricante`
--
ALTER TABLE `tb_fabricante`
  ADD PRIMARY KEY (`id_fabricante`);

--
-- Índices de tabela `tb_movimentacao`
--
ALTER TABLE `tb_movimentacao`
  ADD PRIMARY KEY (`id_movimentacao`),
  ADD KEY `fk_tb_movimentacao_tb_tipo1_idx` (`id_tipo`),
  ADD KEY `fk_tb_movimentacao_tb_usuario1_idx` (`id_usuario`);

--
-- Índices de tabela `tb_produto`
--
ALTER TABLE `tb_produto`
  ADD PRIMARY KEY (`id_produto`),
  ADD KEY `fk_tb_produto_tb_fabricante1_idx` (`id_fabricante`),
  ADD KEY `fk_tb_produto_tb_tipo1_idx` (`id_tipo`);

--
-- Índices de tabela `tb_tipo`
--
ALTER TABLE `tb_tipo`
  ADD PRIMARY KEY (`id_tipo`);

--
-- Índices de tabela `tb_usuario`
--
ALTER TABLE `tb_usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `fk_tb_usuario_tb_tipo2_idx` (`id_tipo`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `tb_fabricante`
--
ALTER TABLE `tb_fabricante`
  MODIFY `id_fabricante` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_movimentacao`
--
ALTER TABLE `tb_movimentacao`
  MODIFY `id_movimentacao` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_produto`
--
ALTER TABLE `tb_produto`
  MODIFY `id_produto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_tipo`
--
ALTER TABLE `tb_tipo`
  MODIFY `id_tipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `tb_usuario`
--
ALTER TABLE `tb_usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `fk_mov_produto`
--
ALTER TABLE `fk_mov_produto`
  ADD CONSTRAINT `fk_fk_mov_produto_tb_movimentacao1` FOREIGN KEY (`id_movimentacao`) REFERENCES `tb_movimentacao` (`id_movimentacao`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_fk_mov_produto_tb_produto1` FOREIGN KEY (`id_produto`) REFERENCES `tb_produto` (`id_produto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `tb_movimentacao`
--
ALTER TABLE `tb_movimentacao`
  ADD CONSTRAINT `fk_tb_movimentacao_tb_tipo1` FOREIGN KEY (`id_tipo`) REFERENCES `tb_tipo` (`id_tipo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tb_movimentacao_tb_usuario1` FOREIGN KEY (`id_usuario`) REFERENCES `tb_usuario` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `tb_produto`
--
ALTER TABLE `tb_produto`
  ADD CONSTRAINT `fk_tb_produto_tb_fabricante1` FOREIGN KEY (`id_fabricante`) REFERENCES `tb_fabricante` (`id_fabricante`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tb_produto_tb_tipo1` FOREIGN KEY (`id_tipo`) REFERENCES `tb_tipo` (`id_tipo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `tb_usuario`
--
ALTER TABLE `tb_usuario`
  ADD CONSTRAINT `fk_tb_usuario_tb_tipo2` FOREIGN KEY (`id_tipo`) REFERENCES `tb_tipo` (`id_tipo`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
