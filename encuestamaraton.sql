-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-12-2017 a las 15:25:29
-- Versión del servidor: 10.1.25-MariaDB
-- Versión de PHP: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

DROP DATABASE IF EXISTS ENCUESTAMARATON;
CREATE DATABASE ENCUESTAMARATON;
USE ENCUESTAMARATON;


--
-- Base de datos: `encuestamaraton`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `maratones`
--

CREATE TABLE IF NOT EXISTS `maratones` (
  `id_maraton` int(4) NOT NULL,
  `maraton` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `maratones`
--

INSERT INTO `maratones` (`id_maraton`, `maraton`) VALUES
(1, 'Boston'),
(2, 'Sevilla'),
(3, 'New York'),
(4, 'Pekin'),
(5, 'Londres'),
(6, 'Paris');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `maratonespersonas`
--

CREATE TABLE IF NOT EXISTS `maratonespersonas` (
  `id_Persona` int(4) NOT NULL,
  `idMaraton` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `maratonespersonas`
--

INSERT INTO `maratonespersonas` (`id_Persona`, `idMaraton`) VALUES
(1, 1),
(1, 3),
(1, 6),
(2, 2),
(2, 4),
(3, 2),
(3, 5),
(4, 3),
(4, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marca`
--

CREATE TABLE IF NOT EXISTS `marca` (
  `id_marca` int(4) NOT NULL,
  `marca` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `marca`
--

INSERT INTO `marca` (`id_marca`, `marca`) VALUES
(1, 'Puma'),
(2, 'Addidas'),
(3, 'NewBalance'),
(4, 'Saucony');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marcapersonas`
--

CREATE TABLE IF NOT EXISTS `marcapersonas` (
  `id_Persona` int(4) NOT NULL,
  `idMarca` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `marcapersonas`
--

INSERT INTO `marcapersonas` (`id_Persona`, `idMarca`) VALUES
(1, 1),
(1, 3),
(2, 2),
(2, 4),
(3, 2),
(3, 3),
(4, 3),
(4, 4),
(4, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nacionalidad`
--

CREATE TABLE IF NOT EXISTS `nacionalidad` (
  `id_nac` int(4) NOT NULL,
  `nacionalidad` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `nacionalidad`
--

INSERT INTO `nacionalidad` (`id_nac`, `nacionalidad`) VALUES
(1, 'España'),
(2, 'Portugal'),
(3, 'Kenia'),
(4, 'Etiopia'),
(5, 'Alemania'),
(6, 'Francia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personas`
--

CREATE TABLE IF NOT EXISTS `personas` (
  `id` int(4) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellidos` varchar(30) NOT NULL,
  `dni` varchar(30) NOT NULL,
  `sexo` varchar(1) NOT NULL,
  `nacionalidad` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `personas`
--

INSERT INTO `personas` (`id`, `nombre`, `apellidos`, `dni`, `sexo`, `nacionalidad`) VALUES
(1, 'Adrián', 'Domínguez González', '31912291F', 'H', 1),
(2, 'Manuel', 'Rivero Domínguez', '81656291T', 'H', 1),
(3, 'Laura', 'Garcias', '6542581F', 'M', 6),
(4, 'Eriel', 'Hidalgo', '1525612F', 'M', 4);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `maratones`
--
ALTER TABLE `maratones`
  ADD PRIMARY KEY (`id_maraton`);

--
-- Indices de la tabla `maratonespersonas`
--
ALTER TABLE `maratonespersonas`
  ADD PRIMARY KEY (`id_Persona`,`idMaraton`),
  ADD KEY `idMaraton` (`idMaraton`);

--
-- Indices de la tabla `marca`
--
ALTER TABLE `marca`
  ADD PRIMARY KEY (`id_marca`);

--
-- Indices de la tabla `marcapersonas`
--
ALTER TABLE `marcapersonas`
  ADD PRIMARY KEY (`id_Persona`,`idMarca`),
  ADD KEY `MarcaPer_ibfk_2` (`idMarca`);

--
-- Indices de la tabla `nacionalidad`
--
ALTER TABLE `nacionalidad`
  ADD PRIMARY KEY (`id_nac`);

--
-- Indices de la tabla `personas`
--
ALTER TABLE `personas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nacPer_ibfk_1` (`nacionalidad`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `maratones`
--
ALTER TABLE `maratones`
  MODIFY `id_maraton` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `marca`
--
ALTER TABLE `marca`
  MODIFY `id_marca` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `nacionalidad`
--
ALTER TABLE `nacionalidad`
  MODIFY `id_nac` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `personas`
--
ALTER TABLE `personas`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `maratonespersonas`
--
ALTER TABLE `maratonespersonas`
  ADD CONSTRAINT `maratonespersonas_ibfk_1` FOREIGN KEY (`id_Persona`) REFERENCES `personas` (`id`),
  ADD CONSTRAINT `maratonespersonas_ibfk_2` FOREIGN KEY (`idMaraton`) REFERENCES `maratones` (`id_maraton`);

--
-- Filtros para la tabla `marcapersonas`
--
ALTER TABLE `marcapersonas`
  ADD CONSTRAINT `MarcaPer_ibfk_1` FOREIGN KEY (`id_Persona`) REFERENCES `personas` (`id`),
  ADD CONSTRAINT `MarcaPer_ibfk_2` FOREIGN KEY (`idMarca`) REFERENCES `marca` (`id_marca`);

--
-- Filtros para la tabla `personas`
--
ALTER TABLE `personas`
  ADD CONSTRAINT `nacPer_ibfk_1` FOREIGN KEY (`nacionalidad`) REFERENCES `nacionalidad` (`id_nac`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
