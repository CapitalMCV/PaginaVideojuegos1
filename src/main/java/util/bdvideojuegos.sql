-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-06-2024 a las 00:57:42
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bdvideojuegos`
--

DROP DATABASE IF EXISTS bdvideojuegos;
CREATE DATABASE bdvideojuegos;
USE bdvideojuegos;

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `idCategoria` char(5) NOT NULL,
  `nombre_cat` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`idCategoria`, `nombre_cat`) VALUES
('CAT02', 'Consolas'),
('CAT01', 'Juguetes'),
('CAT03', 'Videojuegos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `faccab`
--

CREATE TABLE `faccab` (
  `NroFactura` char(8) NOT NULL,
  `IdCliente` char(6) NOT NULL,
  `FechaFactura` datetime NOT NULL,
  `monto_total` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `faccab`
--

INSERT INTO `faccab` (`NroFactura`, `IdCliente`, `FechaFactura`, `monto_total`) VALUES
('00000001', 'US0003', '2023-10-09 00:00:00', 90),
('00000002', 'US0004', '2024-03-10 00:00:00', 649);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facdet`
--

CREATE TABLE `facdet` (
  `NroFactura` char(8) NOT NULL,
  `idProducto` char(6) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `facdet`
--

INSERT INTO `facdet` (`NroFactura`, `idProducto`, `cantidad`, `subtotal`) VALUES
('00000001', 'PRO01', 2, 90.00),
('00000002', 'PRO05', 1, 499.00),
('00000002', 'PRO07', 1, 150.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos`
--

CREATE TABLE `pagos` (
  `idPago` char(8) NOT NULL,
  `NroFactura` char(8) NOT NULL,
  `metodoPago` varchar(100) NOT NULL,
  `numeroTarjeta` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pagos`
--

INSERT INTO `pagos` (`idPago`, `NroFactura`, `metodoPago`, `numeroTarjeta`) VALUES
('PAG00001', '00000001', 'Efectivo', NULL),
('PAG00002', '00000002', 'Tarjeta de debido', '4539 1707 5441 1840');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `idProducto` char(6) NOT NULL,
  `idCategoria` char(5) NOT NULL,
  `nombre_produc` varchar(255) NOT NULL,
  `stock` int(11) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `Imagen` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`idProducto`, `idCategoria`, `nombre_produc`, `stock`, `precio`, `Imagen`) VALUES
('PRO01', 'CAT01', 'Hot Wheels - Pista de Carreras Extrema', 24, 45.00, 'IMA001.jpg'),
('PRO02', 'CAT01', 'Nerf Elite - Blaster Disruptor', 24, 45.00, 'IMA002.jpg'),
('PRO04', 'CAT02', 'PlayStation 5', 30, 599.00, 'IMA003.jpg'),
('PRO05', 'CAT02', 'Xbox Series X', 8, 499.00, 'IMA004.jpg'),
('PRO06', 'CAT03', 'The Legend of Zelda: Breath of the Wild', 16, 199.00, 'IMA005.jpg'),
('PRO07', 'CAT03', 'FIFA 22', 20, 150.00, 'IMA006.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `idRol` char(3) NOT NULL,
  `nombre_rol` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`idRol`, `nombre_rol`) VALUES
('R01', 'Administrador'),
('R02', 'Cliente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `idCliente` char(6) NOT NULL,
  `idRol` char(3) NOT NULL,
  `username` varchar(50) NOT NULL,
  `nombres` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `dni` int(11) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`idCliente`, `idRol`, `username`, `nombres`, `apellidos`, `dni`, `password`) VALUES
('US0001', 'R01', 'Admin', 'Administrador', 'Admin', 76543211, 'admin1'),
('US0002', 'R02', 'glino', 'Gonzalo', 'Lino Kian', 76543211, '1234'),
('US0003', 'R02', 'mbuitron', 'Maria', 'Buitron Mendez', 76543211, '5678'),
('US0004', 'R02', 'lmunante', 'Luciana', 'Muñante Castro', 76543211, '8901');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`idCategoria`),
  ADD UNIQUE KEY `nombre_cat` (`nombre_cat`);

--
-- Indices de la tabla `faccab`
--
ALTER TABLE `faccab`
  ADD PRIMARY KEY (`NroFactura`),
  ADD KEY `IdCliente` (`IdCliente`);

--
-- Indices de la tabla `facdet`
--
ALTER TABLE `facdet`
  ADD PRIMARY KEY (`NroFactura`,`idProducto`),
  ADD KEY `idProducto` (`idProducto`);

--
-- Indices de la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD PRIMARY KEY (`idPago`),
  ADD KEY `NroFactura` (`NroFactura`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`idProducto`),
  ADD KEY `idCategoria` (`idCategoria`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`idRol`),
  ADD UNIQUE KEY `nombre_rol` (`nombre_rol`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idCliente`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `idRol` (`idRol`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `faccab`
--
ALTER TABLE `faccab`
  ADD CONSTRAINT `faccab_ibfk_1` FOREIGN KEY (`IdCliente`) REFERENCES `usuarios` (`idCliente`);

--
-- Filtros para la tabla `facdet`
--
ALTER TABLE `facdet`
  ADD CONSTRAINT `facdet_ibfk_1` FOREIGN KEY (`NroFactura`) REFERENCES `faccab` (`NroFactura`),
  ADD CONSTRAINT `facdet_ibfk_2` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`);

--
-- Filtros para la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD CONSTRAINT `pagos_ibfk_1` FOREIGN KEY (`NroFactura`) REFERENCES `faccab` (`NroFactura`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`idCategoria`) REFERENCES `categorias` (`idCategoria`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`idRol`) REFERENCES `roles` (`idRol`);
COMMIT;

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `spadiProd` (IN `idcat` CHAR(5), IN `prod` VARCHAR(255), IN `stoc` INT, IN `price` DECIMAL(10,2), IN `img` VARCHAR(30))   BEGIN
    DECLARE codu CHAR(6);
    DECLARE cuenta INT;
    SELECT RIGHT(MAX(idProducto), 3) + 1 INTO cuenta FROM productos;
    SET codu = CONCAT('PROD', LPAD(cuenta, 3, '0'));
    INSERT INTO productos VALUES(codu, idcat, prod, stoc, price, img);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spadiUsu` (`rol` CHAR(3), `user` VARCHAR(50), `ape` VARCHAR(100), `nom` VARCHAR(100), `dni` INT, `pass` VARCHAR(255))   BEGIN
    DECLARE codu CHAR(6);
    DECLARE cuenta INT;
    SELECT RIGHT(MAX(idCliente), 3) + 1 INTO cuenta FROM usuarios;
    SET codu = CONCAT('USU', LPAD(cuenta, 3, '0'));
    INSERT INTO usuarios VALUES(codu, rol, user, ape, nom, dni, pass);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spadiUsuCliente` (`rol` CHAR(3), `user` VARCHAR(50), `ape` VARCHAR(100), `nom` VARCHAR(100), `dni` INT, `pass` VARCHAR(255))   BEGIN
    DECLARE codu CHAR(6);
    DECLARE cuenta INT;
    SELECT RIGHT(MAX(idCliente), 3) + 1 INTO cuenta FROM usuarios;
    SET codu = CONCAT('USU', LPAD(cuenta, 3, '0'));
    INSERT INTO usuarios VALUES(codu, rol, user, ape, nom, dni, pass);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spDelProd` (`codu` CHAR(6))   BEGIN
    DELETE FROM productos WHERE idProducto = codu;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spDelUsu` (`codu` CHAR(6))   BEGIN
    DELETE FROM usuarios WHERE idCliente = codu;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spmes` (`an` INT)   BEGIN
    SELECT 
        MONTH(FechaFactura) AS mes, 
        SUM(precio * cantidad) AS total
    FROM 
        fac_cabe f 
    INNER JOIN 
        fac_deta d ON f.NroFactura = d.NroFactura
    INNER JOIN 
        articulos a ON a.idProducto = d.idProducto
    WHERE 
        YEAR(FechaFactura) = an
    GROUP BY 
        MONTH(FechaFactura);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spmesProd` (`an` INT)   BEGIN
    SELECT 
        MONTH(fc.FechaFactura) AS mes, 
        SUM(fd.subtotal) AS total
    FROM 
        faccab fc
    INNER JOIN 
        facdet fd ON fc.NroFactura = fd.NroFactura
    INNER JOIN 
        productos p ON fd.idProducto = p.idProducto
    WHERE 
        YEAR(fc.FechaFactura) = an
    GROUP BY 
        MONTH(fc.FechaFactura);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spModiProd` (`codu` CHAR(6), `idcat` CHAR(5), `prod` VARCHAR(255), `stoc` INT, `price` DECIMAL(10,2), `img` VARCHAR(30))   BEGIN
    UPDATE productos 
    SET idCategoria = idcat, nombre_produc = prod, stock = stoc, precio = price, Imagen = img
    WHERE idProducto = codu;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spModiUsu` (`codu` CHAR(6), `rol` CHAR(3), `user` VARCHAR(50), `ape` VARCHAR(100), `nom` VARCHAR(100), `dni` INT, `pass` VARCHAR(255))   BEGIN
    UPDATE usuarios 
    SET idRol = rol, apellidos = ape, nombres = nom, username = user, dni = dni, password = pass
    WHERE idCliente = codu;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spproductos` (`cat` CHAR(5))   BEGIN
    SELECT
        p.nombre_produc,
        p.idCategoria,
        p.idProducto,
        p.Imagen,
        c.nombre_cat,
        p.precio,
        p.stock
    FROM 
        Productos p
    INNER JOIN 
        Categorias c ON p.idCategoria = c.idCategoria 
    WHERE p.idCategoria = cat;
END$$

DELIMITER ;

-- --------------------------------------------------------


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
