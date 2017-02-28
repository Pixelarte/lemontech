-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.1.9-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win32
-- HeidiSQL Versión:             9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Volcando estructura de base de datos para colegio
CREATE DATABASE IF NOT EXISTS `colegio` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `colegio`;


-- Volcando estructura para tabla colegio.alumnos
CREATE TABLE IF NOT EXISTS `alumnos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT '0',
  `fecha` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla colegio.alumnos: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `alumnos` DISABLE KEYS */;
INSERT INTO `alumnos` (`id`, `nombre`, `fecha`) VALUES
	(1, 'Alex Cornejo', '2017-02-27 14:33:02'),
	(2, 'Lucas Hurtado', '2017-02-27 14:33:02'),
	(3, 'Silvana Torti', '2017-02-27 14:33:02');
/*!40000 ALTER TABLE `alumnos` ENABLE KEYS */;


-- Volcando estructura para tabla colegio.asignacion_cursos_alumnos
CREATE TABLE IF NOT EXISTS `asignacion_cursos_alumnos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idAlumno` int(11) DEFAULT '0',
  `idCurso` int(11) DEFAULT '0',
  `fecha` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla colegio.asignacion_cursos_alumnos: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `asignacion_cursos_alumnos` DISABLE KEYS */;
INSERT INTO `asignacion_cursos_alumnos` (`id`, `idAlumno`, `idCurso`, `fecha`) VALUES
	(1, 1, 1, '2017-02-27 14:32:48'),
	(2, 1, 2, '2017-02-27 14:32:48'),
	(3, 3, 1, '2017-02-27 14:32:48'),
	(4, 2, 1, '2017-02-27 14:32:48'),
	(5, 2, 2, '2017-02-27 14:32:48'),
	(6, 3, 2, '2017-02-27 14:32:48'),
	(7, 1, 3, '2017-02-27 14:32:48');
/*!40000 ALTER TABLE `asignacion_cursos_alumnos` ENABLE KEYS */;


-- Volcando estructura para tabla colegio.asignacion_cursos_profesores
CREATE TABLE IF NOT EXISTS `asignacion_cursos_profesores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idProfesor` int(11) DEFAULT '0',
  `idCurso` int(11) DEFAULT '0',
  `fecha` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla colegio.asignacion_cursos_profesores: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `asignacion_cursos_profesores` DISABLE KEYS */;
INSERT INTO `asignacion_cursos_profesores` (`id`, `idProfesor`, `idCurso`, `fecha`) VALUES
	(1, 1, 1, '2017-02-27 14:32:35'),
	(2, 2, 2, '2017-02-27 14:32:35'),
	(3, 1, 3, '2017-02-27 14:32:35');
/*!40000 ALTER TABLE `asignacion_cursos_profesores` ENABLE KEYS */;


-- Volcando estructura para tabla colegio.cursos
CREATE TABLE IF NOT EXISTS `cursos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT '0',
  `fecha` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla colegio.cursos: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `cursos` DISABLE KEYS */;
INSERT INTO `cursos` (`id`, `nombre`, `fecha`) VALUES
	(1, 'programacion', '2017-02-27 14:32:13'),
	(2, 'ingles', '2017-02-27 14:32:13'),
	(3, 'matematicas', '2017-02-27 14:32:13');
/*!40000 ALTER TABLE `cursos` ENABLE KEYS */;


-- Volcando estructura para tabla colegio.notas
CREATE TABLE IF NOT EXISTS `notas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nota` int(11) NOT NULL DEFAULT '0',
  `idAlumno` int(11) NOT NULL DEFAULT '0',
  `idPrueba` int(11) NOT NULL DEFAULT '0',
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla colegio.notas: ~9 rows (aproximadamente)
/*!40000 ALTER TABLE `notas` DISABLE KEYS */;
INSERT INTO `notas` (`id`, `nota`, `idAlumno`, `idPrueba`, `fecha`) VALUES
	(1, 3, 1, 1, '2017-02-27 14:30:27'),
	(2, 5, 1, 2, '2017-02-27 14:30:27'),
	(3, 7, 3, 1, '2017-02-27 14:30:27'),
	(4, 1, 3, 2, '2017-02-27 14:30:27'),
	(5, 6, 2, 1, '2017-02-27 14:30:27'),
	(6, 7, 2, 2, '2017-02-27 14:30:27'),
	(7, 1, 1, 3, '2017-02-27 14:30:27'),
	(8, 2, 1, 4, '2017-02-27 15:00:51'),
	(9, 7, 1, 5, '2017-02-27 15:02:23');
/*!40000 ALTER TABLE `notas` ENABLE KEYS */;


-- Volcando estructura para tabla colegio.profesores
CREATE TABLE IF NOT EXISTS `profesores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT '0',
  `fecha` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla colegio.profesores: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `profesores` DISABLE KEYS */;
INSERT INTO `profesores` (`id`, `nombre`, `fecha`) VALUES
	(1, 'Fernando Escaffi', '2017-02-27 14:29:41'),
	(2, 'Paula Muñoz', '2017-02-27 14:29:41');
/*!40000 ALTER TABLE `profesores` ENABLE KEYS */;


-- Volcando estructura para tabla colegio.pruebas
CREATE TABLE IF NOT EXISTS `pruebas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL DEFAULT '0',
  `idCurso` int(11) NOT NULL DEFAULT '0',
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla colegio.pruebas: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `pruebas` DISABLE KEYS */;
INSERT INTO `pruebas` (`id`, `nombre`, `idCurso`, `fecha`) VALUES
	(1, 'Prueba programacion', 1, '2017-02-27 14:29:07'),
	(2, 'Verbos', 2, '2017-02-27 14:29:07'),
	(3, 'Matematica aplicada', 3, '2017-02-27 14:33:45'),
	(4, 'Fisica', 1, '2017-02-27 15:00:02'),
	(5, 'Morfologia', 1, '2017-02-27 15:00:33');
/*!40000 ALTER TABLE `pruebas` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
