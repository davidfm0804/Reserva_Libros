-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-12-2024 a las 12:31:10
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `applibros`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignaturas`
--

CREATE TABLE `asignaturas` (
  `idAsignatura` tinyint(3) UNSIGNED NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `asignaturas`
--

INSERT INTO `asignaturas` (`idAsignatura`, `nombre`) VALUES
(1, 'Matemáticas'),
(2, 'Ciencias'),
(3, 'Lengua'),
(4, 'Historia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clases`
--

CREATE TABLE `clases` (
  `idCurso` char(6) NOT NULL,
  `letraClase` char(1) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clases`
--

INSERT INTO `clases` (`idCurso`, `letraClase`, `nombre`) VALUES
('1BCH', 'A', '1º Bachillerato - Clase A'),
('1BCH', 'B', '1º Bachillerato - Clase B'),
('2BCH', 'A', '2º Bachillerato - Clase A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clases_asignaturas`
--

CREATE TABLE `clases_asignaturas` (
  `idCurso` char(6) NOT NULL,
  `letraClase` char(1) NOT NULL,
  `idAsignatura` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cursos`
--

CREATE TABLE `cursos` (
  `idCurso` char(6) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cursos`
--

INSERT INTO `cursos` (`idCurso`, `nombre`) VALUES
('1BCH', '1º Bachillerato'),
('2BCH', '2º Bachillerato');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `editoriales`
--

CREATE TABLE `editoriales` (
  `idEditorial` smallint(5) UNSIGNED NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `telefono` char(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `editoriales`
--

INSERT INTO `editoriales` (`idEditorial`, `nombre`, `correo`, `telefono`) VALUES
(1, 'Editorial Uno', 'contacto@editorialuno.com', '912345678'),
(2, 'Editorial Dos', 'info@editorialdos.com', '923456789');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libros`
--

CREATE TABLE `libros` (
  `ISBN` char(13) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `idEditorial` smallint(5) UNSIGNED NOT NULL,
  `idAsignatura` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `libros`
--

INSERT INTO `libros` (`ISBN`, `nombre`, `precio`, `idEditorial`, `idAsignatura`) VALUES
('9780987654321', 'Ciencias 1', 30.00, 1, 2),
('9781122334455', 'Lengua 1', 20.75, 2, 3),
('9781234567890', 'Matemáticas 1', 25.50, 1, 1),
('9785544332211', 'Historia 1', 22.30, 2, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libros_cursos`
--

CREATE TABLE `libros_cursos` (
  `ISBN` char(13) NOT NULL,
  `idCurso` char(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `libros_cursos`
--

INSERT INTO `libros_cursos` (`ISBN`, `idCurso`) VALUES
('9780987654321', '1BCH'),
('9781122334455', '2BCH'),
('9781234567890', '1BCH'),
('9785544332211', '2BCH');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservas`
--

CREATE TABLE `reservas` (
  `idReserva` int(10) UNSIGNED NOT NULL,
  `dni` char(9) NOT NULL,
  `nombreTutor` varchar(100) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `nombreAlumno` varchar(100) NOT NULL,
  `documento` varchar(255) NOT NULL,
  `apta` tinyint(1) NOT NULL,
  `fecha_reserva` date NOT NULL,
  `coste_total` decimal(10,2) NOT NULL,
  `fecha_registro` date NOT NULL,
  `idCurso` char(6) NOT NULL,
  `letraClase` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `reservas`
--

INSERT INTO `reservas` (`idReserva`, `dni`, `nombreTutor`, `correo`, `nombreAlumno`, `documento`, `apta`, `fecha_reserva`, `coste_total`, `fecha_registro`, `idCurso`, `letraClase`) VALUES
(1, '12345678A', 'Juan Pérez', 'juan.perez@gmail.com', 'Pedro Pérez', 'documento_1.pdf', 0, '2024-11-15', 51.50, '2024-11-10', '1BCH', 'A'),
(2, '87654321B', 'Ana Gómez', 'ana.gomez@gmail.com', 'Lucía Gómez', 'documento_2.pdf', 0, '2024-11-16', 43.05, '2024-11-11', '2BCH', 'A'),
(3, '23456789C', 'María López', 'maria.lopez@gmail.com', 'Sofía López', 'documento_3.pdf', 0, '2024-11-17', 45.00, '2024-11-12', '1BCH', 'B');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservas_libros`
--

CREATE TABLE `reservas_libros` (
  `ISBN` char(13) NOT NULL,
  `idReserva` int(10) UNSIGNED NOT NULL,
  `entregado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `reservas_libros`
--

INSERT INTO `reservas_libros` (`ISBN`, `idReserva`, `entregado`) VALUES
('9780987654321', 1, 0),
('9781122334455', 2, 0),
('9781234567890', 1, 0),
('9781234567890', 3, 0),
('9785544332211', 2, 0),
('9785544332211', 3, 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asignaturas`
--
ALTER TABLE `asignaturas`
  ADD PRIMARY KEY (`idAsignatura`);

--
-- Indices de la tabla `clases`
--
ALTER TABLE `clases`
  ADD PRIMARY KEY (`idCurso`,`letraClase`);

--
-- Indices de la tabla `clases_asignaturas`
--
ALTER TABLE `clases_asignaturas`
  ADD PRIMARY KEY (`idCurso`,`letraClase`,`idAsignatura`),
  ADD KEY `fk_clases_asignaturas_asignaturas` (`idAsignatura`);

--
-- Indices de la tabla `cursos`
--
ALTER TABLE `cursos`
  ADD PRIMARY KEY (`idCurso`);

--
-- Indices de la tabla `editoriales`
--
ALTER TABLE `editoriales`
  ADD PRIMARY KEY (`idEditorial`);

--
-- Indices de la tabla `libros`
--
ALTER TABLE `libros`
  ADD PRIMARY KEY (`ISBN`),
  ADD KEY `fk_libros_editoriales` (`idEditorial`),
  ADD KEY `fk_libros_asignaturas` (`idAsignatura`);

--
-- Indices de la tabla `libros_cursos`
--
ALTER TABLE `libros_cursos`
  ADD PRIMARY KEY (`ISBN`,`idCurso`),
  ADD KEY `fk_libros_cursos_cursos` (`idCurso`);

--
-- Indices de la tabla `reservas`
--
ALTER TABLE `reservas`
  ADD PRIMARY KEY (`idReserva`),
  ADD KEY `fk_reservas_clases` (`idCurso`,`letraClase`);

--
-- Indices de la tabla `reservas_libros`
--
ALTER TABLE `reservas_libros`
  ADD PRIMARY KEY (`ISBN`,`idReserva`),
  ADD KEY `fk_reservas_libros_reservas` (`idReserva`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `asignaturas`
--
ALTER TABLE `asignaturas`
  MODIFY `idAsignatura` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `editoriales`
--
ALTER TABLE `editoriales`
  MODIFY `idEditorial` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `reservas`
--
ALTER TABLE `reservas`
  MODIFY `idReserva` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `clases`
--
ALTER TABLE `clases`
  ADD CONSTRAINT `fk_clases_cursos` FOREIGN KEY (`idCurso`) REFERENCES `cursos` (`idCurso`);

--
-- Filtros para la tabla `clases_asignaturas`
--
ALTER TABLE `clases_asignaturas`
  ADD CONSTRAINT `fk_clases_asignaturas_asignaturas` FOREIGN KEY (`idAsignatura`) REFERENCES `asignaturas` (`idAsignatura`),
  ADD CONSTRAINT `fk_clases_asignaturas_clases` FOREIGN KEY (`idCurso`,`letraClase`) REFERENCES `clases` (`idCurso`, `letraClase`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `libros`
--
ALTER TABLE `libros`
  ADD CONSTRAINT `fk_libros_asignaturas` FOREIGN KEY (`idAsignatura`) REFERENCES `asignaturas` (`idAsignatura`),
  ADD CONSTRAINT `fk_libros_editoriales` FOREIGN KEY (`idEditorial`) REFERENCES `editoriales` (`idEditorial`);

--
-- Filtros para la tabla `libros_cursos`
--
ALTER TABLE `libros_cursos`
  ADD CONSTRAINT `fk_libros_cursos_cursos` FOREIGN KEY (`idCurso`) REFERENCES `cursos` (`idCurso`),
  ADD CONSTRAINT `fk_libros_cursos_libros` FOREIGN KEY (`ISBN`) REFERENCES `libros` (`ISBN`);

--
-- Filtros para la tabla `reservas`
--
ALTER TABLE `reservas`
  ADD CONSTRAINT `fk_reservas_clases` FOREIGN KEY (`idCurso`,`letraClase`) REFERENCES `clases` (`idCurso`, `letraClase`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `reservas_libros`
--
ALTER TABLE `reservas_libros`
  ADD CONSTRAINT `fk_reservas_libros_libros` FOREIGN KEY (`ISBN`) REFERENCES `libros` (`ISBN`),
  ADD CONSTRAINT `fk_reservas_libros_reservas` FOREIGN KEY (`idReserva`) REFERENCES `reservas` (`idReserva`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
