-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-04-2026 a las 05:50:17
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `empresa-m`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamentos`
--

CREATE TABLE `departamentos` (
  `id_are` int(11) NOT NULL,
  `Nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `departamentos`
--

INSERT INTO `departamentos` (`id_are`, `Nombre`) VALUES
(1, 'Recursos humanos'),
(2, 'Sistemas'),
(3, 'Administracion'),
(4, 'Contabilidad'),
(5, 'Cafeteria'),
(6, 'Parqueaderos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `id` int(11) NOT NULL,
  `DocumentoEmple` varchar(50) NOT NULL,
  `NombreEmple` varchar(50) NOT NULL,
  `ApellidoEmple` varchar(50) NOT NULL,
  `Cargo` varchar(50) NOT NULL,
  `SalarioB` decimal(10,2) NOT NULL,
  `HoraExtra` int(11) DEFAULT NULL,
  `Bonificacion` decimal(10,2) DEFAULT NULL,
  `Salud` decimal(10,2) DEFAULT NULL,
  `Pension` decimal(10,2) DEFAULT NULL,
  `SalarioNeto` decimal(10,2) DEFAULT NULL,
  `idDep` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`id`, `DocumentoEmple`, `NombreEmple`, `ApellidoEmple`, `Cargo`, `SalarioB`, `HoraExtra`, `Bonificacion`, `Salud`, `Pension`, `SalarioNeto`, `idDep`) VALUES
(2, '222222', 'Alejandro', 'Giraldo', 'gerente', 5130000.00, 10, 100000.00, 205200.00, 205200.00, 4719600.00, 0),
(3, '654321', 'Daniel', 'Escobar', 'gerente', 5245000.00, 15, 200000.00, 209800.00, 209800.00, 4825400.00, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `rol` varchar(20) NOT NULL,
  `docuemple` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `usuario`, `password`, `rol`, `docuemple`) VALUES
(2, 'Mono', '123456', 'administrador', NULL),
(3, 'Daniel', '111111', 'empleado', '654321');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
