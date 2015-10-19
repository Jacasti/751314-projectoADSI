-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 18-10-2015 a las 02:39:55
-- Versión del servidor: 5.5.16
-- Versión de PHP: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `proyecto_uno`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dependencias`
--

CREATE TABLE IF NOT EXISTS `dependencias` (
  `pk_dep_codigo` int(10) NOT NULL,
  `dep_nombre` varchar(20) DEFAULT NULL,
  `dep_telefono` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`pk_dep_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_servicios`
--

CREATE TABLE IF NOT EXISTS `detalle_servicios` (
  `pk_des_codigo` int(10) NOT NULL,
  `des_descripcion` varchar(30) DEFAULT NULL,
  `des_fecha` date DEFAULT NULL,
  `des_hora` datetime DEFAULT NULL,
  PRIMARY KEY (`pk_des_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipo`
--

CREATE TABLE IF NOT EXISTS `equipo` (
  `pk_equ_codigo` int(10) NOT NULL,
  `equ_nombre` varchar(15) DEFAULT NULL,
  `equ_tipoEquipo` varchar(20) DEFAULT NULL,
  `equ_precio` varchar(15) DEFAULT NULL,
  `fk_dep_codigo` int(10) DEFAULT NULL,
  `fk_tie_codigo` int(10) DEFAULT NULL,
  PRIMARY KEY (`pk_equ_codigo`),
  KEY `rel_equ_dep` (`fk_dep_codigo`),
  KEY `rel_equ_tie` (`fk_tie_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipo_licencias`
--

CREATE TABLE IF NOT EXISTS `equipo_licencias` (
  `pk_eql_codigo` int(10) NOT NULL,
  `fk_equ_codigo` int(10) DEFAULT NULL,
  `fk_lic_codigo` int(10) DEFAULT NULL,
  PRIMARY KEY (`pk_eql_codigo`),
  KEY `rel_eql_equ` (`fk_equ_codigo`),
  KEY `rel_eql_lic` (`fk_lic_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipo_proveedores`
--

CREATE TABLE IF NOT EXISTS `equipo_proveedores` (
  `pk_epro_codigo` int(10) NOT NULL,
  `fk_equ_codigo` int(10) DEFAULT NULL,
  `fk_pro_codigo` int(10) DEFAULT NULL,
  PRIMARY KEY (`pk_epro_codigo`),
  KEY `rel_epro_pro` (`fk_pro_codigo`),
  KEY `rel_epro_equ` (`fk_equ_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fichatecnica`
--

CREATE TABLE IF NOT EXISTS `fichatecnica` (
  `pk_fit_codigo` int(10) NOT NULL,
  `fit_marca` varchar(15) DEFAULT NULL,
  `fit_serial` varchar(15) DEFAULT NULL,
  `fit_modelo` varchar(15) DEFAULT NULL,
  `fit_memoria_ram` varchar(15) DEFAULT NULL,
  `fit_discoDuro` varchar(15) DEFAULT NULL,
  `fit_procesador` varchar(15) DEFAULT NULL,
  `fit_tarjetaSonido` varchar(15) DEFAULT NULL,
  `fit_board` varchar(15) DEFAULT NULL,
  `fit_tarjetaVideo` varchar(15) DEFAULT NULL,
  `fit_UnidadesOpticas` varchar(15) DEFAULT NULL,
  `fit_monitor` varchar(15) DEFAULT NULL,
  `fit_teclado` varchar(15) DEFAULT NULL,
  `fit_mouse` varchar(15) DEFAULT NULL,
  `fit_tarjeta_red` varchar(20) DEFAULT NULL,
  `fit_antivirus` varchar(15) DEFAULT NULL,
  `fit_bateria` varchar(10) DEFAULT NULL,
  `fit_cargador` varchar(15) DEFAULT NULL,
  `fit_lector_tarjeta` varchar(20) DEFAULT NULL,
  `fit_paquete_Ofimatico` varchar(20) DEFAULT NULL,
  `fit_numeroPuertosUSB` varchar(15) DEFAULT NULL,
  `fit_parlantes` varchar(20) DEFAULT NULL,
  `fit_microfono` varchar(15) DEFAULT NULL,
  `fit_tecnologiaImpresion` varchar(30) DEFAULT NULL,
  `fit_memoriaBoofer` varchar(30) DEFAULT NULL,
  `fit_manejoPapel` varchar(15) DEFAULT NULL,
  `fit_conectores` varchar(20) DEFAULT NULL,
  `fit_Sistema_Operativo` varchar(20) DEFAULT NULL,
  `fit_compresor` varchar(20) DEFAULT NULL,
  `fit_numeros_puertos_Red` varchar(15) DEFAULT NULL,
  `fit_potencia_salida` varchar(20) DEFAULT NULL,
  `fk_equ_codigo` int(10) DEFAULT NULL,
  PRIMARY KEY (`pk_fit_codigo`),
  KEY `rel_fit_equ` (`fk_equ_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `garantias`
--

CREATE TABLE IF NOT EXISTS `garantias` (
  `pk_gar_codigo` int(10) NOT NULL,
  `gar_fecha_Inicio` varchar(10) DEFAULT NULL,
  `gar_fecha_Vencimiento` varchar(10) DEFAULT NULL,
  `gar_descripcion` varchar(30) DEFAULT NULL,
  `fk_equ_codigo` int(10) DEFAULT NULL,
  `fk_tig_codigo` int(10) DEFAULT NULL,
  PRIMARY KEY (`pk_gar_codigo`),
  KEY `rel_gar_equ` (`fk_equ_codigo`),
  KEY `rel_gar_tig` (`fk_tig_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_cambios`
--

CREATE TABLE IF NOT EXISTS `historial_cambios` (
  `pk_hic_codigo` int(10) NOT NULL,
  `hic_fecha` varchar(15) DEFAULT NULL,
  `hic_hora` varchar(10) DEFAULT NULL,
  `hic_descripcion` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`pk_hic_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `licencias`
--

CREATE TABLE IF NOT EXISTS `licencias` (
  `pk_lic_codigo` int(10) NOT NULL,
  `lic_nombre` varchar(20) DEFAULT NULL,
  `lic_FechaInicio` varchar(15) DEFAULT NULL,
  `lic_FechaVencimiento` varchar(15) DEFAULT NULL,
  `lic_FechaComprar` varchar(15) DEFAULT NULL,
  `lic_precio` varchar(15) DEFAULT NULL,
  `lic_cobertura` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`pk_lic_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `partes`
--

CREATE TABLE IF NOT EXISTS `partes` (
  `pk_par_codigo` int(10) NOT NULL,
  `par_serie` varchar(15) DEFAULT NULL,
  `par_marca` varchar(20) DEFAULT NULL,
  `par_descripcion` varchar(30) DEFAULT NULL,
  `par_estado` varchar(20) DEFAULT NULL,
  `fk_equ_codigo` int(10) DEFAULT NULL,
  `fk_hic_codigo` int(10) DEFAULT NULL,
  PRIMARY KEY (`pk_par_codigo`),
  KEY `rel_par_equ` (`fk_equ_codigo`),
  KEY `rel_par_hic` (`fk_hic_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `partes_proveedores`
--

CREATE TABLE IF NOT EXISTS `partes_proveedores` (
  `pk_pap_codigo` int(10) NOT NULL,
  `fk_par_codigo` int(10) DEFAULT NULL,
  `fk_pro_codigo` int(10) DEFAULT NULL,
  PRIMARY KEY (`pk_pap_codigo`),
  KEY `rel_pap_pro` (`fk_pro_codigo`),
  KEY `rel_pap_par` (`fk_par_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

CREATE TABLE IF NOT EXISTS `permisos` (
  `pk_per_codigo` int(10) NOT NULL,
  `per_descripcion` varchar(30) DEFAULT NULL,
  `per_tipo` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`pk_per_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `politicas`
--

CREATE TABLE IF NOT EXISTS `politicas` (
  `pk_pol_codigo` int(10) NOT NULL,
  `pol_descripcion` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`pk_pol_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE IF NOT EXISTS `proveedores` (
  `pk_pro_codigo` int(10) NOT NULL,
  `pro_nombre` varchar(20) DEFAULT NULL,
  `pro_telefono` int(15) DEFAULT NULL,
  `pro_direccion` varchar(30) DEFAULT NULL,
  `pro_correo` varchar(30) DEFAULT NULL,
  `pro_pagina_Web` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`pk_pro_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `pk_rol_codigo` int(10) NOT NULL,
  `rol_nombre` varchar(20) DEFAULT NULL,
  `fk_per_codigo` int(10) DEFAULT NULL,
  PRIMARY KEY (`pk_rol_codigo`),
  KEY `rel_rol_per` (`fk_per_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

CREATE TABLE IF NOT EXISTS `servicios` (
  `pk_ser_ticket` int(10) NOT NULL,
  `ser_fecha` varchar(15) DEFAULT NULL,
  `ser_hora` varchar(10) DEFAULT NULL,
  `ser_descripcion` varchar(30) DEFAULT NULL,
  `fk_usu_codigo` int(10) DEFAULT NULL,
  `fk_equ_codigo` int(10) DEFAULT NULL,
  PRIMARY KEY (`pk_ser_ticket`),
  KEY `rel_ser_usu` (`fk_usu_codigo`),
  KEY `rel_ser_equ` (`fk_equ_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios_atendidos`
--

CREATE TABLE IF NOT EXISTS `servicios_atendidos` (
  `fk_ser_ticket` int(10) DEFAULT NULL,
  `fk_des_codigo` int(10) DEFAULT NULL,
  `fk_tec_id` int(10) DEFAULT NULL,
  KEY `rel_servicios_atendidos_ser` (`fk_ser_ticket`),
  KEY `rel_servicios_atendidos_des` (`fk_des_codigo`),
  KEY `rel_servicios_atendidos_tec` (`fk_tec_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tecnico`
--

CREATE TABLE IF NOT EXISTS `tecnico` (
  `pk_tec_id` int(10) NOT NULL,
  `tec_nombre` varchar(20) NOT NULL,
  `tec_apellidos` varchar(30) DEFAULT NULL,
  `tec_telefono` varchar(15) DEFAULT NULL,
  `tec_correo` varchar(15) DEFAULT NULL,
  `tec_especialidad` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`pk_tec_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_equipo`
--

CREATE TABLE IF NOT EXISTS `tipo_equipo` (
  `pk_tie_codigo` int(10) NOT NULL,
  `tie_nombre` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`pk_tie_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_garantia`
--

CREATE TABLE IF NOT EXISTS `tipo_garantia` (
  `pk_tig_codigo` int(10) NOT NULL,
  `tig_nombre` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`pk_tig_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
  `pk_usu_codigo` int(10) NOT NULL,
  `usu_nombre` varchar(20) NOT NULL,
  `usu_apellidos` varchar(30) DEFAULT NULL,
  `usu_extension` varchar(20) DEFAULT NULL,
  `usu_correo` varchar(25) DEFAULT NULL,
  `usu_cargo` varchar(15) DEFAULT NULL,
  `usu_username` varchar(20) DEFAULT NULL,
  `usu_password` varchar(20) DEFAULT NULL,
  `usu_fecha_creacion` varchar(30) DEFAULT NULL,
  `usu_fecha_modificacion` varchar(30) DEFAULT NULL,
  `fk_rol_codigo` int(10) DEFAULT NULL,
  PRIMARY KEY (`pk_usu_codigo`),
  KEY `rel_usu_rol` (`fk_rol_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `equipo`
--
ALTER TABLE `equipo`
  ADD CONSTRAINT `rel_equ_tie` FOREIGN KEY (`fk_tie_codigo`) REFERENCES `tipo_equipo` (`pk_tie_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rel_equ_dep` FOREIGN KEY (`fk_dep_codigo`) REFERENCES `dependencias` (`pk_dep_codigo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `equipo_licencias`
--
ALTER TABLE `equipo_licencias`
  ADD CONSTRAINT `rel_eql_lic` FOREIGN KEY (`fk_lic_codigo`) REFERENCES `licencias` (`pk_lic_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rel_eql_equ` FOREIGN KEY (`fk_equ_codigo`) REFERENCES `equipo` (`pk_equ_codigo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `equipo_proveedores`
--
ALTER TABLE `equipo_proveedores`
  ADD CONSTRAINT `rel_epro_equ` FOREIGN KEY (`fk_equ_codigo`) REFERENCES `equipo` (`pk_equ_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rel_epro_pro` FOREIGN KEY (`fk_pro_codigo`) REFERENCES `proveedores` (`pk_pro_codigo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `fichatecnica`
--
ALTER TABLE `fichatecnica`
  ADD CONSTRAINT `rel_fit_equ` FOREIGN KEY (`fk_equ_codigo`) REFERENCES `equipo` (`pk_equ_codigo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `garantias`
--
ALTER TABLE `garantias`
  ADD CONSTRAINT `rel_gar_tig` FOREIGN KEY (`fk_tig_codigo`) REFERENCES `tipo_garantia` (`pk_tig_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rel_gar_equ` FOREIGN KEY (`fk_equ_codigo`) REFERENCES `equipo` (`pk_equ_codigo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `partes`
--
ALTER TABLE `partes`
  ADD CONSTRAINT `rel_par_hic` FOREIGN KEY (`fk_hic_codigo`) REFERENCES `historial_cambios` (`pk_hic_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rel_par_equ` FOREIGN KEY (`fk_equ_codigo`) REFERENCES `equipo` (`pk_equ_codigo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `partes_proveedores`
--
ALTER TABLE `partes_proveedores`
  ADD CONSTRAINT `rel_pap_par` FOREIGN KEY (`fk_par_codigo`) REFERENCES `partes` (`pk_par_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rel_pap_pro` FOREIGN KEY (`fk_pro_codigo`) REFERENCES `proveedores` (`pk_pro_codigo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `roles`
--
ALTER TABLE `roles`
  ADD CONSTRAINT `rel_rol_per` FOREIGN KEY (`fk_per_codigo`) REFERENCES `permisos` (`pk_per_codigo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD CONSTRAINT `rel_ser_equ` FOREIGN KEY (`fk_equ_codigo`) REFERENCES `equipo` (`pk_equ_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rel_ser_usu` FOREIGN KEY (`fk_usu_codigo`) REFERENCES `usuarios` (`pk_usu_codigo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `servicios_atendidos`
--
ALTER TABLE `servicios_atendidos`
  ADD CONSTRAINT `rel_servicios_atendidos_tec` FOREIGN KEY (`fk_tec_id`) REFERENCES `tecnico` (`pk_tec_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rel_servicios_atendidos_des` FOREIGN KEY (`fk_des_codigo`) REFERENCES `detalle_servicios` (`pk_des_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rel_servicios_atendidos_ser` FOREIGN KEY (`fk_ser_ticket`) REFERENCES `servicios` (`pk_ser_ticket`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `rel_usu_rol` FOREIGN KEY (`fk_rol_codigo`) REFERENCES `roles` (`pk_rol_codigo`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
