-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-11-2022 a las 17:40:35
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tpespecial`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `brands`
--

CREATE TABLE `brands` (
  `brand_ID` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `country` varchar(45) NOT NULL,
  `foundation` int(11) NOT NULL,
  `website` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `brands`
--

INSERT INTO `brands` (`brand_ID`, `name`, `country`, `foundation`, `website`) VALUES
(2, 'Bagovit', 'Argentina', 1934, 'bagovit.com.ar'),
(8, 'Garnier', 'France', 1904, 'garnier.com.ar'),
(12, 'Neutrogena', 'USA', 1930, 'neutrogena.com.ar'),
(13, 'Nivea', 'Germany', 1911, 'nivea.com.ar');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comments`
--

CREATE TABLE `comments` (
  `comment_ID` int(11) NOT NULL,
  `comment` varchar(200) NOT NULL,
  `product_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `comments`
--

INSERT INTO `comments` (`comment_ID`, `comment`, `product_ID`) VALUES
(6, 'Lo uso hace 3 meses, es muy bueno el kit. Resultados increíbles.', 3),
(9, 'actualiceeeex2', 7),
(10, 'Es lo más! Lo uso hace años', 91),
(11, 'Muy hermoso excelente para piel grasa ! Pero por favor con ese precio hagan 100 gramos para que nos dure un poquito más, con todo el dolor del mundo tuve que cambiar por una más económica.', 92),
(12, 'Es lo mejor, se la recomiendo a todas mis amigas siempre. No es grasosa y tiene ese brillito que es lo más', 13),
(13, 'Es una genialidad, cero oleosidad aunque transpires, cuando te la estás aplicando tiene la textura de un bloqueador solar liviano, pero pasa 1 minuto y parece que no te hubieras puesto nada de lo livi', 5),
(14, 'Son las únicas cremas que uso por mi problema de piel recomendada por mi dermatologo', 7),
(15, 'Me la compré hoy! Veremos cómo me funciona ...tengo piel de normal a grasa y necesito hidratación... espero que funcione porque las crema gel no me funcionó ..', 13),
(16, 'La adoro me deja la piel hermosa', 13),
(17, 'Por favor traigan el gel de limpieza bright boost. La crema es lo más la amo ', 7),
(18, 'Buen día quisiera saber precio y como obtenerla. Gracias.', 92),
(19, 'La uso y me encanta. Tengo dermatitis atópica y me va muy bien con ella. Además saca el maquillaje a prueba de agua. Tengo también la loción... . Fan de nivea. A ver si mandan esas cajas promocionales', 92),
(20, 'La compré en mayo, y les aseguro que cumple con lo que especifica el producto. Muy buena!!', 5),
(21, 'Hola! el otro día compré está crema en la farmacia, y me encantó el resultado de esta nueva línea, desde chiquita mi mamá me incentivó a usar la crema Nivea y hasta el día de hoy la sigo y seguiré usa', 5),
(22, ' Y no solo saca las manchas ,también la re hidrata a mi piel, fans nro 1', 3),
(23, 'Es buenísima! Pero me cuesta conseguirla en mi ciudad.', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `product_ID` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `milliliters` int(11) NOT NULL,
  `price` double NOT NULL,
  `brand_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`product_ID`, `name`, `milliliters`, `price`, `brand_ID`) VALUES
(3, 'Serum hidratante', 1120, 12000, 13),
(5, 'Gel facial exfoliante', 30, 1540, 13),
(7, 'Agua micelar bifasica', 200, 2670, 12),
(13, 'Crema Antiage Hidratante', 55, 2878, 2),
(32, 'Serum antimanchas', 30, 2735, 13),
(91, 'Contorno de Ojos', 100, 1200, 2),
(92, 'Protector Solar', 50, 3000, 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(300) NOT NULL,
  `name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `name`) VALUES
(1, 'flor.prat.4@gmail.com', '$2a$12$oTLMADqRRSkDvYq1pu4X2.kaahsyrbCvuj4Hb5U766FgweS9gZEkK', 'Florencia Prat');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`brand_ID`),
  ADD KEY `company_ID` (`brand_ID`);

--
-- Indices de la tabla `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment_ID`),
  ADD KEY `comment_ID` (`comment_ID`),
  ADD KEY `product_ID` (`product_ID`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_ID`),
  ADD KEY `company_ID` (`brand_ID`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `brands`
--
ALTER TABLE `brands`
  MODIFY `brand_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT de la tabla `comments`
--
ALTER TABLE `comments`
  MODIFY `comment_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `product_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`product_ID`) REFERENCES `products` (`product_ID`);

--
-- Filtros para la tabla `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`brand_ID`) REFERENCES `brands` (`brand_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
