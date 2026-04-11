-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-04-2026 a las 20:15:53
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
(2, '123455', 'Alejandro', 'Escobar', 'gerente', 5545000.00, 15, 250000.00, 221800.00, 221800.00, 5101400.00, 2),
(3, '654321', 'Daniel', 'Escobar', 'Gerente', 5245000.00, 15, 200000.00, 209800.00, 209800.00, 4825400.00, 1),
(4, '666111', 'Samuel', 'Avendaño', 'administrador', 3760000.00, 20, 200000.00, 150400.00, 150400.00, 3459200.00, 3),
(5, '789987', 'Jose', 'Villa', 'administrador', 3160000.00, 10, 50000.00, 126400.00, 126400.00, 2907200.00, 4),
(6, '852369', 'Sebastian', 'Gomez', 'gerente', 5000000.00, 0, 0.00, 200000.00, 200000.00, 4600000.00, 5),
(0, '2020', 'Miguel', 'Sanchez', 'conductor', 1920000.00, 10, 90000.00, 76800.00, 76800.00, 1766400.00, 2);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
