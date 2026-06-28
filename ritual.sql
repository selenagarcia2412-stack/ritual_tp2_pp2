-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-06-2026 a las 20:06:19
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
-- Base de datos: `ritual`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id_categoria` int(20) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `Nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id_categoria`, `descripcion`, `Nombre`) VALUES
(1, 'MakeUp', ''),
(2, 'Corporal', ''),
(3, 'Capilar', ''),
(4, 'Skincare', ''),
(5, 'set ritual', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_pedido`
--

CREATE TABLE `detalle_pedido` (
  `id_detalle` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `id_pedido` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_unitario` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalle_pedido`
--

INSERT INTO `detalle_pedido` (`id_detalle`, `id_producto`, `id_pedido`, `cantidad`, `precio_unitario`) VALUES
(1, 3, 1, 3, 1500.00),
(2, 5, 2, 2, 1500.00),
(3, 2, 3, 1, 1500.00),
(4, 4, 4, 2, 1500.00),
(5, 1, 5, 3, 1500.00),
(6, 10, 6, 1, 19800.00),
(7, 2, 7, 1, 22500.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `envios`
--

CREATE TABLE `envios` (
  `id_envio` int(11) NOT NULL,
  `id_pedido` int(11) NOT NULL,
  `id_estado_envio` int(11) NOT NULL,
  `direccion_entrega` varchar(150) NOT NULL,
  `costo_envio` decimal(10,2) NOT NULL,
  `fecha_envio` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `envios`
--

INSERT INTO `envios` (`id_envio`, `id_pedido`, `id_estado_envio`, `direccion_entrega`, `costo_envio`, `fecha_envio`) VALUES
(1, 1, 1, 'Av. Santa Fe 1234', 1500.00, '2026-04-30'),
(2, 2, 2, 'Av.Corrientes 2500', 1800.00, '2026-04-30'),
(3, 3, 3, 'Av. Rivadavia 900', 2000.00, '2026-05-01'),
(4, 4, 4, 'Av. Cabildo 1432', 1600.00, '2026-05-01'),
(5, 5, 5, 'Lavalle 1220', 1700.00, '2026-04-30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_envio`
--

CREATE TABLE `estado_envio` (
  `id_estado_envio` int(11) NOT NULL,
  `descripcion` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estado_envio`
--

INSERT INTO `estado_envio` (`id_estado_envio`, `descripcion`) VALUES
(1, 'Preparando'),
(2, 'Despachado'),
(3, 'En Camino'),
(4, 'En Distribu'),
(5, 'Entregado'),
(6, 'No Entregad');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos`
--

CREATE TABLE `pagos` (
  `id_pago` int(11) NOT NULL,
  `id_pedido` int(11) NOT NULL,
  `metodo` varchar(50) NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `estado_pago` int(50) NOT NULL,
  `fecha_pago` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pagos`
--

INSERT INTO `pagos` (`id_pago`, `id_pedido`, `metodo`, `monto`, `estado_pago`, `fecha_pago`) VALUES
(1, 1, 'Tarjeta de credito', 18500.00, 0, NULL),
(2, 2, 'Mercado Pago', 22500.00, 0, '2026-04-11'),
(3, 3, 'Tarjeta de debito', 27000.00, 0, '2026-04-12'),
(4, 4, 'Transferencia', 12000.00, 0, '2026-04-13'),
(5, 5, 'Mercado Pago', 19500.00, 0, '2026-04-14');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id_pedido` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `estado` int(20) NOT NULL,
  `total` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`id_pedido`, `id_usuario`, `fecha`, `estado`, `total`) VALUES
(1, 1, '2026-04-10', 0, 18500.00),
(2, 2, '2026-04-11', 0, 22500.00),
(3, 5, '2026-04-12', 0, 27000.00),
(4, 1, '2026-04-13', 0, 12000.00),
(5, 2, '2026-04-14', 0, 19500.00),
(6, 1, '2026-06-28', 0, 19800.00),
(7, 1, '2026-06-28', 0, 22500.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id_producto` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(512) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `marca` varchar(80) NOT NULL,
  `foto` varchar(128) NOT NULL,
  `fecha_vencimiento` date DEFAULT NULL,
  `id_categoria` int(11) NOT NULL,
  `id_vendedor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id_producto`, `nombre`, `descripcion`, `precio`, `stock`, `marca`, `foto`, `fecha_vencimiento`, `id_categoria`, `id_vendedor`) VALUES
(1, 'Serum Hidratante', 'Sérum con ácido hialurónico y extractos de uva. Hidrata en profundidad y devuelve la luminosidad natural.', 18500.00, 20, 'Caudalie', 'images/serum.jpg', '2027-12-01', 4, 3),
(2, 'Crema Nutritiva', 'Crema facial de textura sedosa que nutre, reconforta y deja la piel suave durante todo el día.', 22500.00, 15, 'Lancôme', 'images/crema.jpg', '2027-08-30', 4, 3),
(3, 'Aceite Corporal', 'Aceite corporal con notas florales y vitamina E. Absorción rápida, acabado luminoso.', 27000.00, 10, 'Aveda', 'images/aceite.jpg', '2027-08-03', 2, 4),
(4, 'Mascarilla Hidratante', 'Mascarilla capilar con tecnología patentada para reparar, fortalecer y devolver el brillo.', 17500.00, 12, 'Olaplex', 'images/mascarilla.jpg', '2027-08-30', 3, 4),
(5, 'Cherry Gloss', 'Brillo labial con un toque cherry. Hidrata, suaviza y aporta un acabado vidriado irresistible.', 15600.00, 5, 'Fenty Beauty', 'images/gloss.jpg', '0000-00-00', 1, 3),
(10, 'Shampoo Reparador', 'Shampoo reparador con keratina y aceite de argán. Restaura la fibra capilar dañada.', 19800.00, 15, 'Kérastase', 'images/shampoo.jpg', '2027-12-31', 3, 4),
(11, 'Crema Hidratante Dramatically Different', 'Hidratante clásica con fórmula renovada. Equilibra y fortalece la barrera natural de la piel.', 32500.00, 12, 'Clinique', 'images/clinique.jpg', '2027-12-31', 4, 3),
(12, 'Niacinamide 10%', 'Sérum con niacinamida y zinc. Reduce la apariencia de poros e imperfecciones.', 8900.00, 25, 'The Ordinary', 'images/ordinary.jpg', '2027-12-31', 4, 4),
(13, 'Labial Rouge Allure Velvet', 'Labial mate de larga duración con acabado aterciopelado. Color intenso, textura sedosa.', 58000.00, 8, 'Chanel', 'images/chanel.jpg', '2027-12-31', 1, 3),
(14, 'Paleta de Sombras Naked Heat', 'Paleta de 12 sombras en tonos cálidos. Pigmentación intensa y blending suave.', 45000.00, 10, 'Urban Decay', 'images/urbandecay.jpg', '2027-12-31', 1, 4),
(15, 'Base Double Wear', 'Base de maquillaje de larga duración. Acabado natural, cobertura buildable.', 52000.00, 14, 'Estée Lauder', 'images/esteelauder.jpg', '2027-12-31', 1, 3),
(16, 'Body Scrub Cherry Smoothie', 'Exfoliante corporal con notas de cereza y vainilla. Renueva la piel y la deja suavísima.', 22000.00, 20, 'Sol de Janeiro', 'images/soldejaneiro.jpg', '2027-12-31', 2, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id_rol` int(11) NOT NULL,
  `descripcion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id_rol`, `descripcion`) VALUES
(1, 'Cliente'),
(2, 'Vendedor'),
(3, 'Administrador'),
(4, 'Soporte'),
(5, 'Cliente Premium');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `id_rol` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `contrasenia` varchar(100) NOT NULL,
  `telefono` varchar(50) DEFAULT NULL,
  `direccion` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `id_rol`, `nombre`, `apellido`, `email`, `contrasenia`, `telefono`, `direccion`) VALUES
(1, 1, 'Camila', 'Lopez', 'camila.lopez@mail.com', '1234', '1122334455', 'Av. Santa Fe 1234'),
(2, 1, 'Martina', 'Garcia', 'martina.garcia@mail.com', '1234', '1133445566', 'Av. Corrientes 2500'),
(3, 2, 'Sofia', 'Perez', 'sofia.perez@mail.com', '1234', '1144556677', 'Cabildo 800'),
(4, 2, 'Valentina', 'Ruiz', 'valentina.ruiz@mail.com', '1234', '1155667788', 'Belgrano 450'),
(5, 1, 'Lucia', 'Fernandez', 'lucia.fernandez@mail.com', '1234', '1166778899', 'Rivadavia 900'),
(6, 2, 'Selena', 'Garcia', 'selenillamoon@gmail.com', 'selenagarcia', '01123928873', 'Colón 3812'),
(7, 1, 'Margarita', 'Klost', 'selenillamoon@gmail.com', 'gbghfh', '1188496854', 'Calle Falsa 1232');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  ADD PRIMARY KEY (`id_detalle`),
  ADD KEY `id_producto` (`id_producto`),
  ADD KEY `id_pedido` (`id_pedido`);

--
-- Indices de la tabla `envios`
--
ALTER TABLE `envios`
  ADD PRIMARY KEY (`id_envio`),
  ADD KEY `id_pedido` (`id_pedido`),
  ADD KEY `id_estado_envio` (`id_estado_envio`);

--
-- Indices de la tabla `estado_envio`
--
ALTER TABLE `estado_envio`
  ADD PRIMARY KEY (`id_estado_envio`);

--
-- Indices de la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD PRIMARY KEY (`id_pago`),
  ADD KEY `id_pedido` (`id_pedido`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id_pedido`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `id_categoria_2` (`id_categoria`),
  ADD KEY `id_vendedor` (`id_vendedor`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id_rol`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `id_rol` (`id_rol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  MODIFY `id_detalle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `envios`
--
ALTER TABLE `envios`
  MODIFY `id_envio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `estado_envio`
--
ALTER TABLE `estado_envio`
  MODIFY `id_estado_envio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `pagos`
--
ALTER TABLE `pagos`
  MODIFY `id_pago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id_pedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id_rol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  ADD CONSTRAINT `detalle_pedido_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id_pedido`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detalle_pedido_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `envios`
--
ALTER TABLE `envios`
  ADD CONSTRAINT `envios_ibfk_1` FOREIGN KEY (`id_estado_envio`) REFERENCES `estado_envio` (`id_estado_envio`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `envios_ibfk_2` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id_pedido`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD CONSTRAINT `pagos_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id_pedido`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_2` FOREIGN KEY (`id_vendedor`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id_rol`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
