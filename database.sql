-- phpMyAdmin SQL Dump
-- version 5.1.1-1.fc33
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 14-06-2023 a las 14:37:16
-- Versión del servidor: 10.4.20-MariaDB
-- Versión de PHP: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `arredondo_looktucuman`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `anuncios`
--

CREATE TABLE `anuncios` (
  `id` int(10) UNSIGNED NOT NULL,
  `imagen` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `limk` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `orden` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito`
--

CREATE TABLE `carrito` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(10) NOT NULL,
  `external_reference` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `notif` int(11) DEFAULT NULL,
  `trypayment` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito_detalle`
--

CREATE TABLE `carrito_detalle` (
  `id` int(11) UNSIGNED NOT NULL,
  `carrito_id` int(11) UNSIGNED NOT NULL,
  `post_id` int(11) UNSIGNED NOT NULL,
  `color_id` int(11) UNSIGNED DEFAULT NULL,
  `talle_id` int(11) UNSIGNED DEFAULT NULL,
  `cantidad` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `order` int(11) DEFAULT 1,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `imagen` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `posicion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Volcado de datos para la tabla `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `order`, `name`, `created_at`, `updated_at`, `imagen`, `posicion`) VALUES
(2, NULL, 1, 'demo 2', '2020-02-18 05:41:06', '2020-02-18 05:41:06', NULL, 0),
(6, NULL, 1, 'Manos', '2020-03-03 06:17:00', '2021-01-16 19:55:15', NULL, 0),
(7, NULL, 2, 'Herramientas', '2020-03-03 06:18:00', '2023-04-27 17:52:32', NULL, 1),
(8, NULL, 3, 'Construcción', '2020-03-03 06:19:00', '2023-04-27 18:00:04', NULL, 1),
(9, NULL, 3, 'Decoración', '2020-03-03 06:19:41', '2021-01-17 05:26:22', 'categories/June2020/Rg6s4hTFqICMCYAReCOM.webp', 1),
(10, NULL, 5, 'Aparatos', '2020-03-03 06:21:05', '2020-03-03 06:21:57', NULL, 0),
(11, NULL, 6, 'Pestañas', '2020-03-03 06:34:00', '2023-04-27 17:51:42', NULL, 1),
(12, NULL, 7, 'Maquillaje', '2020-03-03 06:42:39', '2020-03-03 06:45:53', NULL, 0),
(13, NULL, 1, 'PIES', '2020-03-03 07:06:18', '2020-03-03 07:06:18', NULL, 0),
(14, 6, 1, 'Manos - Preparación - Guantes', '2020-03-03 07:14:22', '2020-03-04 07:08:26', NULL, 0),
(15, 6, 1, 'Manos - Preparación - Limas', '2020-03-03 07:15:28', '2020-03-04 07:07:09', NULL, 0),
(16, 6, 1, 'Manos - Preparación - Sanitizante', '2020-03-03 07:15:56', '2020-03-04 07:06:32', NULL, 0),
(17, 6, 1, 'Manos - Preparación - Alcohol', '2020-03-03 07:16:25', '2020-03-04 07:05:40', NULL, 0),
(18, 6, 1, 'Manos - Preparación - Removedor de Cutículas', '2020-03-03 07:17:14', '2020-03-04 07:05:06', NULL, 0),
(19, 6, 1, 'Manos - Preparación - Muestrario', '2020-03-03 07:17:39', '2020-03-04 07:03:25', NULL, 0),
(20, 6, 1, 'Manos - Preparación - Cortacutículas', '2020-03-03 07:18:06', '2020-03-04 07:02:51', NULL, 0),
(21, 6, 1, 'Manos - Preparación - Toallas', '2020-03-03 07:18:30', '2020-03-04 07:02:19', NULL, 0),
(22, 6, 1, 'Manos - Preparación - Apoya Manos', '2020-03-03 07:19:13', '2020-03-04 07:01:40', NULL, 0),
(23, 6, 1, 'Manos - Preparación - Clarificador', '2020-03-03 07:19:47', '2020-03-04 07:00:54', NULL, 0),
(24, 6, 1, 'Manos - Preparación - Solucion dermohigienica', '2020-03-03 07:20:40', '2020-03-04 07:00:13', NULL, 0),
(25, 6, 1, 'Manos  - Tratamientos para uñas', '2020-03-03 07:22:57', '2020-04-25 23:48:16', NULL, 0),
(26, 6, 2, 'Esmaltes semipermanentes', '2020-03-03 07:23:54', '2021-01-17 05:26:22', 'categories/June2020/H1qgZCdAOm5RssANNfhB.jpg', 1),
(27, 6, 1, 'Manos - Esmaltados - Esmaltes tradicionales', '2020-03-03 07:24:59', '2020-06-26 00:57:44', 'categories/June2020/e6tNkDiXKGJkOB7NhuDT.jpg', 0),
(28, 6, 1, 'Manos - Remoción - Removedor', '2020-03-03 07:26:26', '2020-03-04 06:52:25', NULL, 0),
(29, 6, 1, 'Manos - Remoción - Quitaesmalte', '2020-03-03 07:27:10', '2020-03-04 06:51:46', NULL, 0),
(30, 6, 1, 'Manos  - Remoción -Capuchones', '2020-03-03 07:28:05', '2020-03-04 06:51:06', NULL, 0),
(31, 6, 1, 'Manos - Remoción - Papel de Aluminio', '2020-03-04 06:02:16', '2020-03-04 06:50:28', NULL, 0),
(32, 13, 1, 'Pies - Ablandador de durezas', '2020-03-04 06:08:40', '2020-03-04 06:49:55', NULL, 0),
(33, 13, 4, 'Pies - Bisturi', '2020-03-04 07:10:13', '2020-03-04 07:23:11', NULL, 0),
(34, 13, 4, 'Pies - Alcohol', '2020-03-04 07:13:09', '2020-03-04 07:22:44', NULL, 0),
(35, 13, 4, 'Pies - Escofina', '2020-03-04 07:13:44', '2020-03-04 07:22:22', NULL, 0),
(36, 13, 4, 'Pies - Garlopin', '2020-03-04 07:14:35', '2020-03-04 07:22:08', NULL, 0),
(37, 13, 2, 'Pies - Guantes', '2020-03-04 07:15:41', '2020-03-04 07:30:59', NULL, 0),
(38, 13, 4, 'Pies - Sanitizante', '2020-03-04 07:17:02', '2020-03-04 07:17:02', NULL, 0),
(39, 13, 4, 'Pies - Hidratantes', '2020-03-04 07:18:03', '2020-03-04 07:18:11', NULL, 0),
(40, 13, 4, 'Pies - Exfoliantes', '2020-03-04 07:18:41', '2020-03-04 07:18:41', NULL, 0),
(41, 13, 4, 'Pies - Restaurador pédico', '2020-03-04 07:19:59', '2020-03-04 07:21:49', NULL, 0),
(42, 13, 4, 'Pies - Relajante pédico', '2020-03-04 07:20:42', '2020-03-04 07:20:42', NULL, 0),
(43, 13, 4, 'Pies - Bombas de jabón', '2020-03-04 07:21:21', '2020-03-04 07:21:34', NULL, 0),
(44, 7, 5, 'Herramientas - Corta Cutículas', '2020-03-06 09:26:39', '2020-03-06 09:28:41', NULL, 0),
(45, 7, 5, 'Herramientas - Algodonera', '2020-03-06 09:29:27', '2020-03-06 09:29:27', NULL, 0),
(46, 7, 5, 'Herramientas - Repujador', '2020-03-06 09:30:01', '2020-03-06 09:30:01', NULL, 0),
(47, 7, 5, 'Herramientas - Corta uñas', '2020-03-06 09:30:56', '2020-03-06 09:30:56', NULL, 0),
(48, 7, 5, 'Herramientas - Cajas de Acero', '2020-03-06 09:31:33', '2020-03-06 09:31:33', NULL, 0),
(49, 7, 5, 'Herramientas - Corta tips', '2020-03-06 09:32:34', '2020-03-06 09:32:34', NULL, 0),
(50, 7, 5, 'Herramientas - Pinzas', '2020-03-06 09:33:39', '2020-03-06 09:33:39', NULL, 0),
(51, 7, 5, 'Herramientas - Esterilizador', '2020-03-06 09:34:23', '2020-03-06 09:34:23', NULL, 0),
(52, 7, 5, 'Herramientas - Fresas', '2020-03-06 09:35:08', '2020-03-06 09:35:08', NULL, 0),
(53, 7, 5, 'Herramientas - Focos', '2020-03-06 09:36:39', '2020-07-07 22:17:56', NULL, 0),
(54, 7, 5, 'Herramientas - Barbijos', '2020-03-06 09:37:23', '2020-03-06 09:37:23', NULL, 0),
(55, 7, 5, 'Herramientas - Guantes', '2020-03-06 09:38:11', '2020-03-06 09:38:11', NULL, 0),
(56, 8, 6, 'Construcción - Gel UV', '2020-03-06 09:49:17', '2020-03-06 09:49:17', NULL, 0),
(57, 8, 6, 'Construcción - Polygel', '2020-03-06 09:50:47', '2020-03-06 09:50:47', NULL, 0),
(58, 8, 6, 'Construcción - Solución para Polygel', '2020-03-06 09:52:30', '2020-03-06 09:52:45', NULL, 0),
(59, 8, 6, 'Construcción - Acrílicos - Monómero', '2020-03-06 09:54:03', '2020-06-22 21:53:36', NULL, 0),
(60, 8, 6, 'Construcción - Acrílicos - Polimeros', '2020-03-06 09:55:54', '2020-03-06 09:55:54', NULL, 0),
(61, 8, 6, 'Construcción - Acrílicos - Vaso Dappen', '2020-03-06 09:56:46', '2020-03-06 09:57:35', NULL, 0),
(62, 8, 6, 'Construcción - Moldes - Capsulas dual', '2020-03-06 09:58:22', '2020-03-06 09:58:22', NULL, 0),
(63, 8, 6, 'Construcción - Moldes - Tips', '2020-03-06 09:59:41', '2020-03-06 09:59:41', NULL, 0),
(64, 8, 6, 'Construcción - Moldes - Moldes de teflon', '2020-03-06 10:00:40', '2020-03-06 10:00:40', NULL, 0),
(66, 8, 6, 'Construcción - Moldes - Corta Tips', '2020-03-06 10:02:30', '2020-03-06 10:02:30', NULL, 0),
(67, 8, 6, 'Construcción - Moldes - Pegamento p/ tips', '2020-03-06 10:03:12', '2020-03-06 10:03:12', NULL, 0),
(68, 8, 6, 'Construcción - Pinceles - Pincel Chato', '2020-03-06 10:15:54', '2020-03-06 10:15:54', NULL, 0),
(69, 8, 6, 'Construcción - Pinceles - Pincel Acrílico', '2020-03-06 10:16:41', '2020-06-26 00:52:18', NULL, 0),
(70, 9, 7, 'Decoración - STAMPING', '2020-03-06 10:23:48', '2020-04-21 02:00:07', NULL, 0),
(71, 9, 7, 'Decoración - Sello', '2020-03-06 10:25:02', '2020-03-06 10:25:02', NULL, 0),
(72, 9, 7, 'Decoración - Placas', '2020-03-06 10:26:33', '2020-03-06 10:26:33', NULL, 0),
(73, 9, 7, 'Decoración - Esmaltes p/ stamping', '2020-03-06 10:27:08', '2020-03-06 10:27:08', NULL, 0),
(74, 9, 7, 'Decoración - STRASS', '2020-03-06 10:28:17', '2020-03-06 10:28:17', NULL, 0),
(75, 9, 7, 'Decoración - Strass Fluo', '2020-03-06 10:29:10', '2020-03-06 10:29:10', NULL, 0),
(76, 9, 7, 'Decoración - Strass varios', '2020-03-06 10:29:50', '2020-03-06 10:29:50', NULL, 0),
(77, 9, 7, 'Decoración - Pegamento p/ strass', '2020-03-06 10:30:57', '2020-03-06 10:30:57', NULL, 0),
(78, 9, 7, 'Decoración - FOIL', '2020-03-06 10:34:42', '2020-03-06 10:34:42', NULL, 0),
(79, 9, 7, 'Decoración - Pegamento p/ Foil', '2020-03-06 10:35:36', '2020-03-06 10:35:36', NULL, 0),
(80, 9, 7, 'Decoración - Pinceles Deco', '2020-03-06 10:36:35', '2020-03-06 10:36:35', NULL, 0),
(81, 9, 7, 'Decoración - Liner', '2020-03-06 10:37:15', '2020-03-06 10:37:15', NULL, 0),
(82, 9, 7, 'Decoración - Polvos', '2020-03-06 10:50:50', '2020-03-06 10:50:50', NULL, 0),
(83, 9, 7, 'Decoración - Polvos - Polvo Espejo', '2020-03-06 10:51:54', '2020-03-06 10:51:54', NULL, 0),
(84, 9, 7, 'Decoración - Polvos - Polvo holográfico', '2020-03-06 10:52:45', '2020-03-06 10:52:45', NULL, 0),
(85, 9, 7, 'Decoración - Polvos - Polvo Aurora', '2020-03-06 10:53:40', '2020-03-06 10:53:40', NULL, 0),
(86, 9, 7, 'Decoración - Varios', '2020-03-06 10:54:57', '2020-03-06 10:55:18', NULL, 0),
(87, 9, 7, 'Decoración - Varios - Cola de sirena', '2020-03-06 10:56:17', '2020-03-06 10:56:17', NULL, 0),
(88, 9, 7, 'Decoración - Varios - Glitter', '2020-03-06 10:57:37', '2020-03-06 10:57:37', NULL, 0),
(89, 9, 7, 'Decoración - Varios - Sticker al agua', '2020-03-06 10:58:19', '2020-03-06 10:58:19', NULL, 0),
(90, 9, 7, 'Decoración - Varios - Cintas', '2020-03-06 10:59:00', '2020-03-06 10:59:00', NULL, 0),
(91, 9, 7, 'Decoración - Varios - Stencil', '2020-03-06 11:01:09', '2020-03-06 11:01:09', NULL, 0),
(92, 9, 7, 'Decoración - Varios - Stickers 3d', '2020-03-06 11:01:54', '2020-03-06 11:01:54', NULL, 0),
(93, 9, 7, 'Decoración - Varios - Pinceles', '2020-03-06 11:04:07', '2020-03-06 11:04:07', NULL, 0),
(94, 9, 7, 'Decoración - Varios - Porta pinceles', '2020-03-06 11:05:02', '2020-03-06 11:05:02', NULL, 0),
(95, 9, 7, 'Decoración - Varios - Plato porta strass', '2020-03-06 11:06:51', '2020-03-06 11:06:51', NULL, 0),
(96, 9, 7, 'Decoración - Varios - Anillos', '2020-03-06 11:07:37', '2020-03-06 11:07:37', NULL, 0),
(97, 9, 7, 'Decoración - Varios - Lapiz de cera', '2020-03-06 11:08:26', '2020-03-06 11:08:26', NULL, 0),
(98, 9, 7, 'Decoración - Varios - Sticker medialuna', '2020-03-06 11:09:01', '2020-03-06 11:09:01', NULL, 0),
(99, 10, 8, 'Aparatos - Cabinas', '2020-03-06 11:28:06', '2020-03-06 11:28:06', NULL, 0),
(100, 10, 8, 'Aparatos -  Cabinas Removedoras', '2020-03-06 11:29:08', '2020-03-06 11:29:16', NULL, 0),
(101, 10, 8, 'Aparatos - Esterilizador', '2020-03-06 11:29:59', '2020-03-06 11:29:59', NULL, 0),
(102, 10, 8, 'Aparatos - Máquina Exf Facial', '2020-03-06 11:31:15', '2020-03-06 11:31:34', NULL, 0),
(103, 10, 8, 'Aparatos - Extractor de Polvo', '2020-03-06 11:32:08', '2020-03-06 11:32:08', NULL, 0),
(104, 10, 8, 'Aparatos - Torno', '2020-03-06 11:33:00', '2020-03-06 11:33:00', NULL, 0),
(105, 10, 8, 'Aparatos - Calentador de Toalla', '2020-03-06 11:33:43', '2020-03-06 11:33:57', NULL, 0),
(106, 10, 8, 'Aparatos - Vaporizador', '2020-03-06 11:34:32', '2020-03-06 11:34:32', NULL, 0),
(107, 10, 8, 'Aparatos - Calentador de cera', '2020-03-06 11:35:14', '2020-03-06 11:35:14', NULL, 0),
(108, 10, 8, 'Aparatos - Spa de Pies', '2020-03-06 11:35:47', '2020-03-06 11:35:47', NULL, 0),
(109, 10, 8, 'Aparatos - Aros de Luz', '2020-03-06 11:36:28', '2020-03-06 11:36:28', NULL, 0),
(110, 10, 8, 'Aparatos - Lámparas', '2020-03-06 11:37:25', '2020-03-06 11:37:25', NULL, 0),
(111, 11, 9, 'Pestañas - Extensión de pestañas', '2020-03-06 11:49:36', '2020-03-06 11:49:36', NULL, 0),
(112, 11, 9, 'Pestañas - PInzas', '2020-03-06 11:50:14', '2020-03-06 11:50:37', NULL, 0),
(114, 11, 9, 'Pestañas - Pads', '2020-03-06 11:52:20', '2020-03-06 11:52:20', NULL, 0),
(115, 11, 9, 'Pestañas - Pestañas', '2020-03-06 11:52:46', '2020-03-06 11:52:46', NULL, 0),
(116, 11, 9, 'Pestañas - Pegamento', '2020-03-06 11:53:29', '2020-03-06 11:53:29', NULL, 0),
(117, 11, 9, 'Pestañas - Portapegamento', '2020-03-06 11:54:00', '2020-03-06 11:54:00', NULL, 0),
(118, 11, 9, 'Pestañas - Aplicadores', '2020-03-06 11:54:47', '2020-03-06 11:54:47', NULL, 0),
(120, 11, 9, 'Pestañas - Permanente', '2020-03-06 11:57:23', '2020-03-06 11:57:23', NULL, 0),
(121, 11, 9, 'Pestañas - Lifting', '2020-03-06 11:58:02', '2020-07-03 21:50:13', NULL, 0),
(122, 11, 9, 'Pestañas - Tinte', '2020-03-06 11:58:47', '2020-03-06 11:58:47', NULL, 0),
(123, 11, 9, 'Pestañas - Accesorios', '2020-03-06 12:00:00', '2020-03-06 12:00:00', NULL, 0),
(124, 11, 9, 'Pestañas - Accesorios - Humidificadores', '2020-03-06 12:00:53', '2020-03-06 12:00:53', NULL, 0),
(125, 11, 9, 'Pestañas - Accesorios - Ventilador', '2020-03-06 12:01:27', '2020-03-06 12:01:27', NULL, 0),
(127, 11, 9, 'Pestañas - Accesorios - Antifaz', '2020-03-06 12:03:10', '2020-03-06 12:03:10', NULL, 0),
(128, 11, 9, 'Pestañas - Accesorios - Portapegamento', '2020-03-06 12:04:11', '2020-03-06 12:04:11', NULL, 0),
(129, 11, 9, 'Pestañas - Accesorios - Microhisopos', '2020-03-06 12:05:33', '2020-03-06 12:05:33', NULL, 0),
(130, 11, 9, 'Pestañas - Accesorios - Microcepillos', '2020-03-06 12:06:25', '2020-03-06 12:06:48', NULL, 0),
(131, 11, 9, 'Pestañas - Accesorios - Pinzas', '2020-03-06 12:07:22', '2020-03-06 12:07:22', NULL, 0),
(132, 11, 9, 'Pestañas - Accesorios - Pads', '2020-03-06 12:07:49', '2020-03-06 12:07:49', NULL, 0),
(133, 12, 10, 'Maquillaje - Brochas', '2020-03-06 12:22:58', '2020-03-06 12:22:58', NULL, 0),
(134, 12, 10, 'Maquillaje - Limpieza facial', '2020-03-06 12:24:23', '2020-03-06 12:24:23', NULL, 0),
(135, 12, 10, 'Maquillaje - Ojos', '2020-03-06 12:25:19', '2020-03-06 12:25:19', NULL, 0),
(136, 12, 10, 'Maquillaje - Labios', '2020-03-06 12:26:11', '2020-03-06 12:26:11', NULL, 0),
(137, 12, 10, 'Maquillaje - Rostro', '2020-03-06 12:26:44', '2020-06-18 20:18:50', 'categories/April2020/IKawQ3VYliEh2NfKa2aM.jpg', 0),
(138, NULL, 1, 'Remoción', '2020-03-15 03:21:10', '2020-03-15 03:21:10', NULL, 0),
(139, NULL, 1, 'Preparación', '2020-03-15 03:25:34', '2020-03-15 03:25:34', NULL, 0),
(140, NULL, 1, 'Estética y Spa', '2020-03-15 03:26:11', '2020-03-15 03:26:11', NULL, 0),
(141, NULL, 1, 'Accesorios', '2020-07-01 23:33:50', '2020-07-14 00:22:14', NULL, 0),
(142, NULL, 1, 'Corporal', '2020-07-04 20:27:00', '2021-08-14 07:09:28', NULL, 0),
(143, 6, 1, 'Corporal - Cremas', '2020-07-04 20:33:23', '2020-07-04 23:42:49', NULL, 0),
(144, 142, 1, 'Corporal - Masajes', '2020-07-04 20:35:00', '2020-07-04 23:43:08', NULL, 0),
(145, 142, 1, 'Corporal - Máscaras', '2020-07-04 20:37:28', '2020-07-04 23:43:24', NULL, 0),
(146, 142, 1, 'Corporal - Tratamiento', '2020-07-04 20:38:21', '2020-07-04 23:43:40', NULL, 0),
(147, 142, 1, 'Corporal - Exfoliación', '2020-07-04 20:39:28', '2020-07-04 23:44:03', NULL, 0),
(148, 6, 1, 'Manos - Cremas', '2020-07-07 20:42:40', '2020-07-07 20:42:40', NULL, 0),
(149, 8, 1, 'Construcción - Preparación de Uñas', '2020-07-07 21:12:05', '2020-07-07 21:19:22', NULL, 0),
(150, 9, 1, 'Decoración - Caviar', '2020-07-07 21:20:11', '2020-07-07 21:20:11', NULL, 0),
(151, NULL, 1, 'Gabinete', '2020-07-07 21:28:04', '2020-07-07 21:28:04', NULL, 0),
(152, 10, 1, 'Aparatos - Espejos', '2020-07-07 22:40:50', '2020-07-07 22:40:50', NULL, 0),
(153, 6, 1, 'Manos - Primer', '2020-07-08 21:55:36', '2020-07-08 22:05:25', NULL, 0),
(155, 151, 1, 'Gabinete - Depilación', '2020-07-14 23:18:22', '2020-07-14 23:19:51', NULL, 0),
(156, NULL, 1, 'OFERTAS', '2020-07-24 00:46:00', '2023-04-27 17:39:12', NULL, 0),
(157, NULL, 1, 'Talleres', '2021-09-04 16:52:11', '2021-09-04 16:52:11', NULL, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `colores`
--

CREATE TABLE `colores` (
  `id` int(11) UNSIGNED NOT NULL,
  `color` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `colores`
--

INSERT INTO `colores` (`id`, `color`, `created_at`, `updated_at`) VALUES
(1, '#000000', '2018-03-15 23:28:00', '2018-03-15 23:28:38'),
(2, '#ff0000', '2018-03-15 23:28:49', '2018-03-15 23:28:49'),
(3, '#0080ff', '2018-03-15 23:29:09', '2018-03-15 23:29:09'),
(4, '#ffffff', '2018-03-15 23:29:27', '2018-03-15 23:29:27'),
(5, '#ff00ff', '2018-03-15 23:37:38', '2018-03-15 23:37:38'),
(6, '#7dded2', '2020-10-20 23:12:06', '2020-10-20 23:12:06'),
(7, '#1026d1', '2020-10-20 23:13:25', '2020-10-20 23:13:25'),
(8, '#25a74c', '2020-10-20 23:15:14', '2020-10-20 23:15:14'),
(9, '#52585b', '2020-10-20 23:18:04', '2020-10-20 23:18:04'),
(10, '#305082', '2020-10-20 23:22:16', '2020-10-20 23:22:16'),
(11, '#676456', '2020-11-19 15:26:08', '2020-11-19 15:26:08'),
(12, '#30584f', '2020-11-19 16:11:25', '2020-11-19 16:11:25'),
(13, '#d05710', '2020-11-19 16:37:49', '2020-11-19 16:37:49'),
(15, '#cac1b8', '2020-11-30 05:06:07', '2020-11-30 05:06:07'),
(16, '#dd0433', '2020-12-02 20:58:18', '2020-12-02 20:58:18'),
(17, '#ebc948', '2020-12-04 02:07:34', '2020-12-04 02:07:34'),
(18, '#004a56', '2020-12-05 01:42:53', '2020-12-05 01:42:53'),
(19, '#1ca98b', '2020-12-05 01:46:43', '2020-12-05 01:46:43'),
(20, '#242440', '2020-12-05 01:49:05', '2020-12-05 01:49:05'),
(21, '#00a8e8', '2020-12-05 01:52:57', '2020-12-05 01:52:57'),
(25, '#f56999', '2020-12-05 02:10:29', '2020-12-05 02:10:29'),
(26, '#ff005a', '2020-12-05 02:11:06', '2020-12-05 02:11:06'),
(27, '#87cefa', '2020-12-05 02:20:31', '2020-12-05 02:20:31'),
(28, '#2b553f', '2020-12-05 02:52:53', '2020-12-05 02:52:53'),
(29, '#d0a488', '2020-12-12 02:01:42', '2020-12-12 02:01:42'),
(30, '#60161b', '2020-12-12 02:11:16', '2020-12-12 02:11:16'),
(31, '#2f4663', '2020-12-12 02:20:14', '2020-12-12 02:20:14'),
(32, '#97698c', '2020-12-12 02:38:20', '2020-12-12 02:38:20');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `data_rows`
--

CREATE TABLE `data_rows` (
  `id` int(10) UNSIGNED NOT NULL,
  `data_type_id` int(10) UNSIGNED NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `browse` tinyint(1) NOT NULL DEFAULT 1,
  `read` tinyint(1) NOT NULL DEFAULT 1,
  `edit` tinyint(1) NOT NULL DEFAULT 1,
  `add` tinyint(1) NOT NULL DEFAULT 1,
  `delete` tinyint(1) NOT NULL DEFAULT 1,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 1, 0, 0, 0, 0, '{}', 1),
(2, 1, 'name', 'text', 'Nombres', 0, 1, 1, 1, 1, 1, '{}', 2),
(3, 1, 'email', 'text', 'Email', 0, 1, 1, 1, 1, 1, '{}', 4),
(4, 1, 'password', 'password', 'Password', 0, 0, 0, 1, 1, 0, '{}', 11),
(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, '{}', 12),
(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, '{}', 13),
(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 14),
(8, 1, 'avatar', 'image', 'Avatar', 0, 0, 0, 0, 0, 0, '{}', 15),
(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":\"0\",\"taggable\":\"0\"}', 17),
(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'Roles', 0, 0, 0, 0, 0, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 18),
(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, '{}', 19),
(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(17, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(18, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(20, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, NULL, 5),
(21, 1, 'role_id', 'text', 'Role', 0, 0, 1, 1, 1, 1, '{}', 16),
(22, 4, 'id', 'text', 'Id', 1, 1, 0, 0, 0, 0, '{}', 1),
(23, 4, 'titulo', 'text', 'Titulo', 0, 1, 1, 1, 1, 1, '{}', 2),
(24, 4, 'texto', 'rich_text_box', 'Texto', 0, 0, 1, 1, 1, 1, '{}', 3),
(25, 4, 'imagen', 'image', 'Imagen', 0, 1, 1, 1, 1, 1, '{}', 4),
(26, 4, 'status', 'checkbox', 'Estado', 0, 1, 1, 1, 1, 1, '{}', 5),
(27, 4, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 6),
(28, 4, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7),
(29, 8, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(31, 8, 'category_id', 'text', 'Category Id', 0, 0, 0, 1, 1, 1, '{}', 3),
(32, 8, 'subcategoryId', 'text', 'Sub categoria', 0, 0, 0, 1, 1, 1, '{}', 4),
(37, 8, 'title', 'text', 'Titulo', 1, 1, 1, 1, 1, 1, '{}', 9),
(38, 8, 'body', 'text_area', 'Descripcion', 1, 0, 1, 1, 1, 1, '{}', 10),
(39, 8, 'precios', 'number', 'Precio', 0, 1, 1, 1, 1, 1, '{}', 11),
(40, 8, 'cantidad', 'number', 'Cantidad', 0, 0, 1, 1, 1, 1, '{}', 12),
(41, 8, 'status', 'select_dropdown', 'Estado', 0, 1, 1, 1, 1, 1, '{\"default\":\"DRAFT\",\"options\":{\"PUBLISHED\":\"published\",\"DRAFT\":\"draft\",\"PENDING\":\"pending\",\"CANCELLED\":\"cancelled\"}}', 13),
(44, 8, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 1, '{}', 16),
(45, 8, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 17),
(49, 1, 'apellido', 'text', 'Apellido', 0, 1, 1, 1, 1, 1, '{}', 3),
(52, 1, 'telefono', 'number', 'Telefono', 0, 0, 1, 1, 1, 1, '{}', 5),
(53, 1, 'provincia_id', 'select_dropdown', 'Provincia', 0, 0, 1, 1, 1, 1, '{}', 9),
(54, 1, 'localidad_id', 'select_dropdown', 'Localidad', 0, 0, 1, 1, 1, 1, '{}', 10),
(55, 1, 'direccion', 'text', 'Direccion', 0, 0, 1, 1, 1, 1, '{}', 6),
(57, 1, 'dateChangePassword', 'text', 'DateChangePassword', 0, 0, 0, 0, 0, 0, '{}', 22),
(58, 1, 'active', 'checkbox', 'Estado', 0, 1, 1, 1, 1, 1, '{}', 23),
(59, 1, 'cpa', 'number', 'Codigo postal', 0, 0, 1, 1, 1, 1, '{}', 8),
(60, 1, 'email_verified_at', 'timestamp', 'Email Verified At', 0, 0, 0, 0, 0, 0, '{}', 24),
(63, 9, 'id', 'text', 'Id', 1, 1, 0, 0, 0, 0, '{}', 1),
(64, 9, 'tittle', 'text', 'Titulo', 0, 1, 1, 1, 1, 1, '{}', 2),
(65, 9, 'image', 'image', 'Image', 0, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"cropped\",\"crop\":{\"width\":\"1920\",\"height\":\"500\"}}]}', 3),
(66, 9, 'active', 'select_dropdown', 'Estado', 0, 1, 1, 1, 1, 1, '{\"options\":{\"0\":\"DESASTIVADO\",\"1\":\"ACTIVO\"}}', 4),
(69, 9, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 1, 0, 1, '{}', 7),
(70, 9, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 8),
(71, 9, 'orden', 'number', 'Orden', 0, 1, 1, 1, 1, 1, '{}', 9),
(72, 10, 'id', 'text', 'Id', 1, 1, 0, 0, 0, 0, '{}', 1),
(73, 10, 'parent_id', 'text', 'Parent Id', 0, 0, 1, 1, 1, 1, '{}', 2),
(74, 10, 'order', 'text', 'Order', 0, 0, 1, 0, 0, 1, '{}', 3),
(75, 10, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 4),
(76, 10, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 1, 0, 1, '{}', 5),
(77, 10, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 6),
(82, 10, 'category_belongsto_category_relationship_1', 'relationship', 'Parent', 0, 1, 1, 1, 1, 1, '{\"model\":\"\\\\App\\\\Models\\\\Category\",\"table\":\"categories\",\"type\":\"belongsTo\",\"column\":\"parent_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 11),
(83, 11, 'id', 'text', 'Id', 1, 1, 0, 0, 0, 0, '{}', 1),
(84, 11, 'provincia', 'text', 'Provincia', 0, 1, 1, 1, 1, 1, '{}', 2),
(85, 11, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 3),
(86, 11, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 4),
(87, 11, 'sratus', 'checkbox', 'Sratus', 0, 1, 1, 1, 1, 1, '{}', 5),
(88, 12, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(89, 12, 'provincias_id', 'text', 'Provincia', 0, 0, 1, 1, 1, 1, '{}', 2),
(90, 12, 'localidad', 'text', 'Localidad', 0, 1, 1, 1, 1, 1, '{}', 3),
(91, 12, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 4),
(92, 12, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 5),
(93, 12, 'localidade_belongsto_provincia_relationship', 'relationship', 'provincia', 0, 1, 1, 1, 1, 1, '{\"model\":\"\\\\App\\\\Models\\\\provincias\",\"table\":\"provincias\",\"type\":\"belongsTo\",\"column\":\"provincias_id\",\"key\":\"id\",\"label\":\"provincia\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 6),
(135, 19, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(136, 19, 'posts_id', 'select_dropdown', 'Posts Id', 1, 0, 1, 1, 1, 1, '{}', 2),
(137, 19, 'cant_visita', 'number', 'Cant Visita', 1, 1, 1, 1, 1, 1, '{}', 3),
(138, 19, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 4),
(139, 19, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 5),
(140, 19, 'posts_visita_belongsto_post_relationship', 'relationship', 'posts', 0, 1, 1, 1, 1, 1, '{\"model\":\"\\\\App\\\\Models\\\\Post\",\"table\":\"posts\",\"type\":\"belongsTo\",\"column\":\"posts_id\",\"key\":\"id\",\"label\":\"title\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":null}', 6),
(145, 21, 'id', 'text', 'Id', 1, 1, 0, 0, 0, 0, '{}', 1),
(146, 21, 'color', 'color', 'Color', 0, 1, 1, 1, 1, 1, '{}', 2),
(147, 21, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 3),
(148, 21, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 4),
(149, 22, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(150, 22, 'talle', 'text', 'Talle', 0, 1, 1, 1, 1, 1, '{}', 2),
(151, 22, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 3),
(152, 22, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 4),
(172, 8, 'descuento', 'number', 'Descuento', 0, 0, 0, 0, 0, 0, '{}', 12),
(173, 8, 'resenia', 'text', 'Resenia', 0, 0, 0, 0, 0, 0, '{}', 13),
(174, 8, 'destacado', 'checkbox', 'Destacado', 0, 0, 0, 0, 0, 0, '{}', 13),
(175, 25, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(176, 25, 'imagen', 'image', 'Imagen', 0, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"cropped\",\"crop\":{\"width\":\"676\",\"height\":\"283\"}}]}', 2),
(177, 25, 'limk', 'text', 'Limk', 0, 1, 1, 1, 1, 1, '{}', 3),
(178, 25, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 4),
(179, 25, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 5),
(180, 25, 'orden', 'text', 'Orden', 0, 1, 1, 1, 1, 1, '{}', 6),
(182, 26, 'id', 'text', 'Id', 1, 1, 0, 0, 0, 0, '{}', 1),
(183, 26, 'user_id', 'select_dropdown', 'User Id', 1, 1, 1, 0, 0, 1, '{}', 2),
(184, 26, 'status', 'text', 'Status', 1, 1, 1, 0, 1, 1, '{}', 3),
(185, 26, 'external_reference', 'text', 'External Reference', 0, 1, 1, 0, 0, 1, '{}', 4),
(186, 26, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 1, '{}', 5),
(187, 26, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 6),
(188, 26, 'carrito_belongsto_user_relationship', 'relationship', 'Usuario', 0, 1, 1, 0, 0, 1, '{\"model\":\"\\\\App\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"user_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"anuncios\",\"pivot\":\"0\",\"taggable\":\"0\"}', 7),
(200, 9, 'link', 'text', 'Link', 0, 1, 1, 1, 1, 1, '{}', 8),
(201, 10, 'imagen', 'text', 'Imagen', 0, 1, 1, 1, 1, 1, '{}', 7),
(202, 10, 'posicion', 'checkbox', 'En pagina de inicio', 0, 1, 1, 1, 1, 1, '{}', 8),
(203, 28, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(204, 28, 'category_id', 'select_dropdown', 'Category Id', 0, 1, 1, 1, 1, 1, '{}', 2),
(205, 28, 'marca_id', 'select_dropdown', 'Marca Id', 0, 1, 1, 1, 1, 1, '{}', 3),
(206, 28, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 4),
(207, 28, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 5),
(208, 28, 'n_categorymarca_belongsto_marca_relationship', 'relationship', 'marcas', 0, 1, 1, 1, 1, 1, '{\"model\":\"\\\\App\\\\Models\\\\Marcas\",\"table\":\"marcas\",\"type\":\"belongsTo\",\"column\":\"marca_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"anuncios\",\"pivot\":\"0\",\"taggable\":null}', 6),
(209, 28, 'n_categorymarca_belongsto_category_relationship', 'relationship', 'categories', 0, 1, 1, 1, 1, 1, '{\"model\":\"\\\\App\\\\Models\\\\Category\",\"table\":\"categories\",\"type\":\"belongsTo\",\"column\":\"category_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"anuncios\",\"pivot\":\"0\",\"taggable\":null}', 7),
(210, 29, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(211, 29, 'marca_id', 'select_dropdown', 'Marca Id', 0, 1, 1, 1, 1, 1, '{}', 2),
(212, 29, 'modelo_id', 'select_dropdown', 'Modelo Id', 0, 1, 1, 1, 1, 1, '{}', 3),
(213, 29, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 4),
(214, 29, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 5),
(215, 29, 'n_modelomarca_belongsto_marca_relationship', 'relationship', 'marcas', 0, 1, 1, 1, 1, 1, '{\"model\":\"\\\\App\\\\Models\\\\Marcas\",\"table\":\"marcas\",\"type\":\"belongsTo\",\"column\":\"marca_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"anuncios\",\"pivot\":\"0\",\"taggable\":null}', 6),
(216, 29, 'n_modelomarca_belongsto_modelo_relationship', 'relationship', 'modelos', 0, 1, 1, 1, 1, 1, '{\"model\":\"\\\\App\\\\Models\\\\Modelos\",\"table\":\"modelos\",\"type\":\"belongsTo\",\"column\":\"modelo_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"anuncios\",\"pivot\":\"0\",\"taggable\":null}', 7),
(217, 30, 'id', 'text', 'Id', 1, 1, 0, 0, 0, 0, '{}', 1),
(218, 30, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, '{}', 2),
(219, 30, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 3),
(220, 30, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 4),
(221, 31, 'id', 'text', 'Id', 1, 1, 0, 0, 0, 0, '{}', 1),
(222, 31, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, '{}', 2),
(223, 31, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 3),
(224, 31, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 4),
(226, 9, 'img_responsive', 'image', 'Img Responsive', 0, 1, 1, 1, 1, 1, '{\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"cropped\",\"crop\":{\"width\":\"450\",\"height\":\"390\"}}]}', 9),
(227, 8, 'marca_id', 'select_dropdown', 'Marca Id', 0, 0, 0, 0, 0, 0, '{}', 13),
(228, 8, 'modelo_id', 'select_dropdown', 'Modelo Id', 0, 0, 0, 0, 0, 0, '{}', 14),
(229, 8, 'codigo', 'text', 'Codigo', 0, 0, 1, 1, 1, 1, '{}', 16),
(230, 8, 'obj_search', 'text', 'Obj Search', 0, 0, 1, 0, 0, 1, '{}', 17),
(231, 8, 'old_img', 'text', 'Old Img', 0, 0, 0, 0, 0, 0, '{}', 18),
(232, 8, 'cantidad_promocion', 'number', 'Cantidad Promocion', 0, 0, 0, 0, 0, 0, '{}', 19),
(233, 8, 'precio_promocion', 'number', 'Precio Promocion', 0, 0, 0, 0, 0, 0, '{}', 20),
(234, 32, 'id', 'text', 'Id', 1, 1, 0, 0, 0, 0, '{}', 1),
(235, 32, 'users_id', 'text', 'Users Id', 1, 0, 1, 1, 1, 1, '{}', 2),
(237, 32, 'status', 'text', 'Status', 1, 1, 1, 1, 1, 1, '{}', 4),
(243, 32, 'operationsnumber', 'text', 'Operationsnumber', 0, 1, 1, 1, 1, 1, '{}', 10),
(244, 32, 'fecha', 'text', 'Fecha', 0, 1, 1, 1, 1, 1, '{}', 11),
(245, 32, 'created_at', 'timestamp', 'Created At', 1, 0, 1, 1, 0, 1, '{}', 12),
(246, 32, 'updated_at', 'timestamp', 'Updated At', 1, 0, 0, 0, 0, 0, '{}', 13),
(249, 32, 'MP_external_reference', 'text', 'MP External Reference', 0, 0, 1, 1, 1, 1, '{}', 16),
(250, 32, 'monto', 'text', 'Monto', 1, 1, 1, 1, 1, 1, '{}', 17),
(251, 1, 'provider', 'text', 'Provider', 0, 0, 0, 0, 0, 0, '{}', 20),
(252, 1, 'provider_id', 'text', 'Provider Id', 0, 0, 0, 0, 0, 0, '{}', 21),
(254, 32, 'users_pago_belongsto_user_relationship', 'relationship', 'users', 0, 1, 1, 1, 1, 1, '{\"model\":\"\\\\App\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"users_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"anuncios\",\"pivot\":\"0\",\"taggable\":\"0\"}', 18),
(255, 1, 'ndomicilio', 'text', 'Numero de Domicilio', 0, 0, 1, 1, 1, 1, '{}', 7),
(257, 33, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(258, 33, 'post_id', 'select_dropdown', 'Publicacion', 1, 1, 1, 0, 0, 1, '{}', 2),
(259, 33, 'user_id', 'select_dropdown', 'Usuario', 1, 1, 1, 0, 0, 1, '{}', 3),
(260, 33, 'answered', 'text_area', 'Tu respuesta', 0, 1, 1, 1, 1, 1, '{}', 4),
(261, 33, 'mensaje', 'text_area', 'Consulta del usuario', 1, 1, 1, 0, 0, 1, '{}', 5),
(262, 33, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 6),
(263, 33, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7),
(264, 1, 'user_belongsto_provincia_relationship', 'relationship', 'Provincia', 1, 0, 1, 1, 1, 1, '{\"model\":\"\\\\App\\\\Models\\\\provincias\",\"table\":\"provincias\",\"type\":\"belongsTo\",\"column\":\"provincia_id\",\"key\":\"id\",\"label\":\"provincia\",\"pivot_table\":\"anuncios\",\"pivot\":\"0\",\"taggable\":\"0\"}', 25),
(265, 1, 'user_belongsto_localidade_relationship', 'relationship', 'Localidad', 1, 0, 1, 1, 1, 1, '{\"model\":\"\\\\App\\\\Models\\\\localidades\",\"table\":\"localidades\",\"type\":\"belongsTo\",\"column\":\"localidad_id\",\"key\":\"id\",\"label\":\"localidad\",\"pivot_table\":\"anuncios\",\"pivot\":\"0\",\"taggable\":\"0\"}', 26),
(266, 34, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(267, 34, 'user_id', 'text', 'Usuario', 1, 1, 1, 0, 0, 0, '{}', 2),
(268, 34, 'pasarela', 'text', 'Pasarela', 1, 1, 1, 0, 0, 0, '{}', 3),
(269, 34, 'monto', 'number', 'Monto', 1, 1, 1, 0, 0, 0, '{}', 4),
(270, 34, 'status', 'text', 'Estado', 1, 1, 1, 0, 0, 0, '{}', 5),
(271, 34, 'payment_method', 'text', 'Metodo', 0, 1, 1, 0, 0, 0, '{}', 6),
(272, 34, 'external_reference', 'text', 'External Reference', 1, 0, 1, 0, 0, 0, '{}', 7),
(273, 34, 'orden_id', 'number', 'Orden', 0, 0, 1, 0, 0, 0, '{}', 8),
(274, 34, 'created_at', 'timestamp', 'Fecha', 0, 1, 1, 0, 0, 0, '{}', 9),
(275, 34, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 10),
(276, 34, 'preference_id', 'text', 'Preferencia', 0, 1, 1, 0, 0, 0, '{}', 11),
(277, 34, 'metodo_entrega', 'text', 'Metodo Entrega', 0, 1, 1, 0, 0, 0, '{}', 12),
(278, 34, 'pago_belongsto_user_relationship', 'relationship', 'Usuario', 0, 1, 1, 0, 0, 0, '{\"model\":\"\\\\App\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"user_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"anuncios\",\"pivot\":\"0\",\"taggable\":\"0\"}', 13),
(279, 26, 'notif', 'number', 'Notificaciones', 0, 1, 1, 0, 0, 0, '{}', 7),
(280, 26, 'trypayment', 'number', 'Intentos', 0, 1, 1, 0, 0, 0, '{}', 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `data_types`
--

CREATE TABLE `data_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT 0,
  `server_side` tinyint(4) NOT NULL DEFAULT 0,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', NULL, 1, 1, '{\"order_column\":null,\"order_display_column\":\"created_at\",\"order_direction\":\"desc\",\"default_search_key\":\"name\",\"scope\":null}', '2020-05-09 23:41:06', '2023-04-27 03:37:13'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2020-05-09 23:41:06', '2020-05-09 23:41:06'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, 'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController', '', 1, 0, NULL, '2020-05-09 23:41:06', '2020-05-09 23:41:06'),
(4, 'notas', 'notas', 'Nota', 'Notas', NULL, 'App\\Models\\Notas', NULL, NULL, NULL, 0, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-05-18 21:17:26', '2020-05-18 21:25:42'),
(8, 'posts', 'posts', 'Publicacion', 'Publicaciones', NULL, 'App\\Models\\Post', NULL, '\\TCG\\Voyager\\Http\\Controllers\\VoyagerPostController', NULL, 1, 1, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":\"title\",\"scope\":null}', '2020-05-19 04:32:10', '2023-04-26 22:01:58'),
(9, 'sliders', 'sliders', 'Slider', 'Sliders', 'voyager-paint-bucket', 'App\\Models\\Slider', NULL, NULL, NULL, 1, 1, '{\"order_column\":\"orden\",\"order_display_column\":\"image\",\"order_direction\":\"asc\",\"default_search_key\":\"tittle\",\"scope\":null}', '2020-05-20 22:20:35', '2021-01-17 06:31:34'),
(10, 'categories', 'categories', 'Categoria', 'Categorias', 'voyager-pie-chart', 'App\\Models\\Category', NULL, NULL, NULL, 1, 1, '{\"order_column\":\"order\",\"order_display_column\":\"name\",\"order_direction\":\"asc\",\"default_search_key\":\"name\",\"scope\":null}', '2020-05-20 22:55:10', '2021-01-17 01:04:10'),
(11, 'provincias', 'provincias', 'Provincia', 'Provincias', NULL, 'App\\Models\\provincias', NULL, NULL, NULL, 1, 1, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":\"provincia\"}', '2020-05-20 23:08:05', '2020-05-20 23:08:05'),
(12, 'localidades', 'localidades', 'Localidade', 'Localidades', NULL, 'App\\Models\\localidades', NULL, NULL, NULL, 1, 1, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":\"localidad\",\"scope\":null}', '2020-05-20 23:09:32', '2020-05-20 23:10:33'),
(19, 'posts_visitas', 'posts-visitas', 'Posts Visita', 'Posts Visitas', NULL, 'App\\Models\\PostVisitas', NULL, NULL, NULL, 1, 1, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":\"posts_id\"}', '2020-05-20 23:42:04', '2020-05-20 23:42:04'),
(21, 'colores', 'colores', 'Colore', 'Colores', NULL, 'App\\Models\\Colores', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2020-05-20 23:49:24', '2020-05-20 23:49:24'),
(22, 'talles', 'talles', 'Talle', 'Talles', NULL, 'App\\Models\\Talles', NULL, NULL, NULL, 1, 1, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2020-05-20 23:51:51', '2020-05-20 23:51:51'),
(25, 'anuncios', 'anuncios', 'Anuncio', 'Anuncios', NULL, 'App\\Models\\Anuncios', NULL, NULL, NULL, 1, 0, '{\"order_column\":\"orden\",\"order_display_column\":\"imagen\",\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-09-02 02:30:17', '2021-01-17 10:04:59'),
(26, 'carrito', 'carrito', 'Carrito', 'Carritos', 'voyager-basket', 'App\\Models\\Carritos', NULL, 'TCG\\Voyager\\Http\\Controllers\\VoyagerCarritoController', NULL, 1, 1, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":\"status\",\"scope\":null}', '2020-09-19 03:31:55', '2023-04-28 20:16:58'),
(28, 'n_categorymarcas', 'n-categorymarcas', 'N Categorymarca', 'N Categorymarcas', NULL, 'App\\Models\\CategoryMarcas', NULL, NULL, NULL, 1, 1, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":\"category_id\"}', '2021-01-17 00:41:37', '2021-01-17 00:41:37'),
(29, 'n_modelomarcas', 'n-modelomarcas', 'N Modelomarca', 'N Modelomarcas', NULL, 'App\\Models\\MarcasModelos', NULL, NULL, NULL, 1, 1, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":\"marca_id\"}', '2021-01-17 00:46:30', '2021-01-17 00:46:30'),
(30, 'marcas', 'marcas', 'Marca', 'Marcas', NULL, 'App\\Models\\Marcas', NULL, NULL, NULL, 1, 1, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":\"name\"}', '2021-01-17 00:49:08', '2021-01-17 00:49:08'),
(31, 'modelos', 'modelos', 'Modelo', 'Modelos', NULL, 'App\\Models\\Modelos', NULL, NULL, NULL, 1, 1, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":\"name\"}', '2021-01-17 00:49:33', '2021-01-17 00:49:33'),
(32, 'users_pagos', 'users-pagos', 'Users Pago', 'Users Pagos', NULL, 'App\\Models\\UsersPagos', NULL, NULL, NULL, 1, 1, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":\"id\",\"scope\":null}', '2021-01-28 09:50:45', '2021-01-31 13:30:27'),
(33, 'interesados', 'interesados', 'Interesado', 'Interesados', NULL, 'App\\Models\\Interesados', NULL, NULL, NULL, 1, 1, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":\"mensaje\"}', '2023-03-15 02:25:34', '2023-03-15 02:25:34'),
(34, 'pagos', 'pagos', 'Pago', 'Pagos', 'voyager-paypal', 'App\\Models\\Payments', NULL, NULL, NULL, 1, 1, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":\"user_id\",\"scope\":null}', '2023-04-27 03:44:32', '2023-04-27 03:47:55');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `localidades`
--

CREATE TABLE `localidades` (
  `id` int(11) UNSIGNED NOT NULL,
  `provincias_id` int(10) UNSIGNED DEFAULT NULL,
  `localidad` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `localidades`
--

INSERT INTO `localidades` (`id`, `provincias_id`, `localidad`, `created_at`, `updated_at`) VALUES
(1, 1, '25 de Mayo', NULL, NULL),
(2, 1, '3 de febrero', NULL, NULL),
(4, 1, 'Adolfo Gonzáles Cháves', NULL, '2017-09-11 21:11:40'),
(5, 1, 'Aguas Verdes', NULL, NULL),
(6, 1, 'Alberti', NULL, NULL),
(7, 1, 'Arrecifes', NULL, NULL),
(8, 1, 'Ayacucho', NULL, NULL),
(9, 1, 'Azul', NULL, NULL),
(10, 1, 'Bahía Blanca', NULL, NULL),
(11, 1, 'Balcarce', NULL, NULL),
(12, 1, 'Baradero', NULL, NULL),
(13, 1, 'Benito Juárez', NULL, NULL),
(14, 1, 'Berisso', NULL, NULL),
(15, 1, 'Bolívar', NULL, NULL),
(16, 1, 'Bragado', NULL, NULL),
(17, 1, 'Brandsen', NULL, NULL),
(18, 1, 'Campana', NULL, NULL),
(19, 1, 'Cañuelas', NULL, NULL),
(20, 1, 'Capilla del Señor', NULL, NULL),
(21, 1, 'Capitán Sarmiento', NULL, NULL),
(22, 1, 'Carapachay', NULL, NULL),
(23, 1, 'Carhue', NULL, NULL),
(24, 1, 'Cariló', NULL, NULL),
(25, 1, 'Carlos Casares', NULL, NULL),
(26, 1, 'Carlos Tejedor', NULL, NULL),
(27, 1, 'Carmen de Areco', NULL, NULL),
(28, 1, 'Carmen de Patagones', NULL, NULL),
(29, 1, 'Castelli', NULL, NULL),
(30, 1, 'Chacabuco', NULL, NULL),
(31, 1, 'Chascomús', NULL, NULL),
(32, 1, 'Chivilcoy', NULL, NULL),
(33, 1, 'Colón', NULL, NULL),
(34, 1, 'Coronel Dorrego', NULL, NULL),
(35, 1, 'Coronel Pringles', NULL, NULL),
(36, 1, 'Coronel Rosales', NULL, NULL),
(37, 1, 'Coronel Suarez', NULL, NULL),
(38, 1, 'Costa Azul', NULL, NULL),
(39, 1, 'Costa Chica', NULL, NULL),
(40, 1, 'Costa del Este', NULL, NULL),
(41, 1, 'Costa Esmeralda', NULL, NULL),
(42, 1, 'Daireaux', NULL, NULL),
(43, 1, 'Darregueira', NULL, NULL),
(44, 1, 'Del Viso', NULL, NULL),
(45, 1, 'Dolores', NULL, NULL),
(46, 1, 'Don Torcuato', NULL, NULL),
(47, 1, 'Ensenada', NULL, NULL),
(48, 1, 'Escobar', NULL, NULL),
(49, 1, 'Exaltación de la Cruz', NULL, NULL),
(50, 1, 'Florentino Ameghino', NULL, NULL),
(51, 1, 'Garín', NULL, NULL),
(52, 1, 'Gral. Alvarado', NULL, NULL),
(53, 1, 'Gral. Alvear', NULL, NULL),
(54, 1, 'Gral. Arenales', NULL, NULL),
(55, 1, 'Gral. Belgrano', NULL, NULL),
(56, 1, 'Gral. Guido', NULL, NULL),
(57, 1, 'Gral. Lamadrid', NULL, NULL),
(58, 1, 'Gral. Las Heras', NULL, NULL),
(59, 1, 'Gral. Lavalle', NULL, NULL),
(60, 1, 'Gral. Madariaga', NULL, NULL),
(61, 1, 'Gral. Pacheco', NULL, NULL),
(62, 1, 'Gral. Paz', NULL, NULL),
(63, 1, 'Gral. Pinto', NULL, NULL),
(64, 1, 'Gral. Pueyrredón', NULL, NULL),
(65, 1, 'Gral. Rodríguez', NULL, NULL),
(66, 1, 'Gral. Viamonte', NULL, NULL),
(67, 1, 'Gral. Villegas', NULL, NULL),
(68, 1, 'Guaminí', NULL, NULL),
(69, 1, 'Guernica', NULL, NULL),
(70, 1, 'Hipólito Yrigoyen', NULL, NULL),
(71, 1, 'Ing. Maschwitz', NULL, NULL),
(72, 1, 'Junín', NULL, NULL),
(73, 1, 'La Plata', NULL, NULL),
(74, 1, 'Laprida', NULL, NULL),
(75, 1, 'Las Flores', NULL, NULL),
(76, 1, 'Las Toninas', NULL, NULL),
(77, 1, 'Leandro N. Alem', NULL, NULL),
(78, 1, 'Lincoln', NULL, NULL),
(79, 1, 'Loberia', NULL, NULL),
(80, 1, 'Lobos', NULL, NULL),
(81, 1, 'Los Cardales', NULL, NULL),
(82, 1, 'Los Toldos', NULL, NULL),
(83, 1, 'Lucila del Mar', NULL, NULL),
(84, 1, 'Luján', NULL, NULL),
(85, 1, 'Magdalena', NULL, NULL),
(86, 1, 'Maipú', NULL, NULL),
(87, 1, 'Mar Chiquita', NULL, NULL),
(88, 1, 'Mar de Ajó', NULL, NULL),
(89, 1, 'Mar de las Pampas', NULL, NULL),
(90, 1, 'Mar del Plata', NULL, NULL),
(91, 1, 'Mar del Tuyú', NULL, NULL),
(92, 1, 'Marcos Paz', NULL, NULL),
(93, 1, 'Mercedes', NULL, NULL),
(94, 1, 'Miramar', NULL, NULL),
(95, 1, 'Monte', NULL, NULL),
(96, 1, 'Monte Hermoso', NULL, NULL),
(97, 1, 'Munro', NULL, NULL),
(98, 1, 'Navarro', NULL, NULL),
(99, 1, 'Necochea', NULL, NULL),
(100, 1, 'Olavarría', NULL, NULL),
(101, 1, 'Partido de la Costa', NULL, NULL),
(102, 1, 'Pehuajó', NULL, NULL),
(103, 1, 'Pellegrini', NULL, NULL),
(104, 1, 'Pergamino', NULL, NULL),
(105, 1, 'Pigüé', NULL, NULL),
(106, 1, 'Pila', NULL, NULL),
(107, 1, 'Pilar', NULL, NULL),
(108, 1, 'Pinamar', NULL, NULL),
(109, 1, 'Pinar del Sol', NULL, NULL),
(110, 1, 'Polvorines', NULL, NULL),
(111, 1, 'Pte. Perón', NULL, NULL),
(112, 1, 'Puán', NULL, NULL),
(113, 1, 'Punta Indio', NULL, NULL),
(114, 1, 'Ramallo', NULL, NULL),
(115, 1, 'Rauch', NULL, NULL),
(116, 1, 'Rivadavia', NULL, NULL),
(117, 1, 'Rojas', NULL, NULL),
(118, 1, 'Roque Pérez', NULL, NULL),
(119, 1, 'Saavedra', NULL, NULL),
(120, 1, 'Saladillo', NULL, NULL),
(121, 1, 'Salliqueló', NULL, NULL),
(122, 1, 'Salto', NULL, NULL),
(123, 1, 'San Andrés de Giles', NULL, NULL),
(124, 1, 'San Antonio de Areco', NULL, NULL),
(125, 1, 'San Antonio de Padua', NULL, NULL),
(126, 1, 'San Bernardo', NULL, NULL),
(127, 1, 'San Cayetano', NULL, NULL),
(128, 1, 'San Clemente del Tuyú', NULL, NULL),
(129, 1, 'San Nicolás', NULL, NULL),
(130, 1, 'San Pedro', NULL, NULL),
(131, 1, 'San Vicente', NULL, NULL),
(132, 1, 'Santa Teresita', NULL, NULL),
(133, 1, 'Suipacha', NULL, NULL),
(134, 1, 'Tandil', NULL, NULL),
(135, 1, 'Tapalqué', NULL, NULL),
(136, 1, 'Tordillo', NULL, NULL),
(137, 1, 'Tornquist', NULL, NULL),
(138, 1, 'Trenque Lauquen', NULL, NULL),
(139, 1, 'Tres Lomas', NULL, NULL),
(140, 1, 'Villa Gesell', NULL, NULL),
(141, 1, 'Villarino', NULL, NULL),
(142, 1, 'Zárate', NULL, NULL),
(143, 2, '11 de Septiembre', NULL, NULL),
(144, 2, '20 de Junio', NULL, NULL),
(145, 2, '25 de Mayo', NULL, NULL),
(146, 2, 'Acassuso', NULL, NULL),
(147, 2, 'Adrogué', NULL, NULL),
(148, 2, 'Aldo Bonzi', NULL, NULL),
(149, 2, 'Área Reserva Cinturón Ecológico', NULL, NULL),
(150, 2, 'Avellaneda', NULL, NULL),
(151, 2, 'Banfield', NULL, NULL),
(152, 2, 'Barrio Parque', NULL, NULL),
(153, 2, 'Barrio Santa Teresita', NULL, NULL),
(154, 2, 'Beccar', NULL, NULL),
(155, 2, 'Bella Vista', NULL, NULL),
(156, 2, 'Berazategui', NULL, NULL),
(157, 2, 'Bernal Este', NULL, NULL),
(158, 2, 'Bernal Oeste', NULL, NULL),
(159, 2, 'Billinghurst', NULL, NULL),
(160, 2, 'Boulogne', NULL, NULL),
(161, 2, 'Burzaco', NULL, NULL),
(162, 2, 'Carapachay', NULL, NULL),
(163, 2, 'Caseros', NULL, NULL),
(164, 2, 'Castelar', NULL, NULL),
(165, 2, 'Churruca', NULL, NULL),
(166, 2, 'Ciudad Evita', NULL, NULL),
(167, 2, 'Ciudad Madero', NULL, NULL),
(168, 2, 'Ciudadela', NULL, NULL),
(169, 2, 'Claypole', NULL, NULL),
(170, 2, 'Crucecita', NULL, NULL),
(171, 2, 'Dock Sud', NULL, NULL),
(172, 2, 'Don Bosco', NULL, NULL),
(173, 2, 'Don Orione', NULL, NULL),
(174, 2, 'El Jagüel', NULL, NULL),
(175, 2, 'El Libertador', NULL, NULL),
(176, 2, 'El Palomar', NULL, NULL),
(177, 2, 'El Tala', NULL, NULL),
(178, 2, 'El Trébol', NULL, NULL),
(179, 2, 'Ezeiza', NULL, NULL),
(180, 2, 'Ezpeleta', NULL, NULL),
(181, 2, 'Florencio Varela', NULL, NULL),
(182, 2, 'Florida', NULL, NULL),
(183, 2, 'Francisco Álvarez', NULL, NULL),
(184, 2, 'Gerli', NULL, NULL),
(185, 2, 'Glew', NULL, NULL),
(186, 2, 'González Catán', NULL, NULL),
(187, 2, 'Gral. Lamadrid', NULL, NULL),
(188, 2, 'Grand Bourg', NULL, NULL),
(189, 2, 'Gregorio de Laferrere', NULL, NULL),
(190, 2, 'Guillermo Enrique Hudson', NULL, NULL),
(191, 2, 'Haedo', NULL, NULL),
(192, 2, 'Hurlingham', NULL, NULL),
(193, 2, 'Ing. Sourdeaux', NULL, NULL),
(194, 2, 'Isidro Casanova', NULL, NULL),
(195, 2, 'Ituzaingó', NULL, NULL),
(196, 2, 'José C. Paz', NULL, NULL),
(197, 2, 'José Ingenieros', NULL, NULL),
(198, 2, 'José Marmol', NULL, NULL),
(199, 2, 'La Lucila', NULL, NULL),
(200, 2, 'La Reja', NULL, NULL),
(201, 2, 'La Tablada', NULL, NULL),
(202, 2, 'Lanús', NULL, NULL),
(203, 2, 'Llavallol', NULL, NULL),
(204, 2, 'Loma Hermosa', NULL, NULL),
(205, 2, 'Lomas de Zamora', NULL, NULL),
(206, 2, 'Lomas del Millón', NULL, NULL),
(207, 2, 'Lomas del Mirador', NULL, NULL),
(208, 2, 'Longchamps', NULL, NULL),
(209, 2, 'Los Polvorines', NULL, NULL),
(210, 2, 'Luis Guillón', NULL, NULL),
(211, 2, 'Malvinas Argentinas', NULL, NULL),
(212, 2, 'Martín Coronado', NULL, NULL),
(213, 2, 'Martínez', NULL, NULL),
(214, 2, 'Merlo', NULL, NULL),
(215, 2, 'Ministro Rivadavia', NULL, NULL),
(216, 2, 'Monte Chingolo', NULL, NULL),
(217, 2, 'Monte Grande', NULL, NULL),
(218, 2, 'Moreno', NULL, NULL),
(219, 2, 'Morón', NULL, NULL),
(220, 2, 'Muñiz', NULL, NULL),
(221, 2, 'Olivos', NULL, NULL),
(222, 2, 'Pablo Nogués', NULL, NULL),
(223, 2, 'Pablo Podestá', NULL, NULL),
(224, 2, 'Paso del Rey', NULL, NULL),
(225, 2, 'Pereyra', NULL, NULL),
(226, 2, 'Piñeiro', NULL, NULL),
(227, 2, 'Plátanos', NULL, NULL),
(228, 2, 'Pontevedra', NULL, NULL),
(229, 2, 'Quilmes', NULL, NULL),
(230, 2, 'Rafael Calzada', NULL, NULL),
(231, 2, 'Rafael Castillo', NULL, NULL),
(232, 2, 'Ramos Mejía', NULL, NULL),
(233, 2, 'Ranelagh', NULL, NULL),
(234, 2, 'Remedios de Escalada', NULL, NULL),
(235, 2, 'Sáenz Peña', NULL, NULL),
(236, 2, 'San Antonio de Padua', NULL, NULL),
(237, 2, 'San Fernando', NULL, NULL),
(238, 2, 'San Francisco Solano', NULL, NULL),
(239, 2, 'San Isidro', NULL, NULL),
(240, 2, 'San José', NULL, NULL),
(241, 2, 'San Justo', NULL, NULL),
(242, 2, 'San Martín', NULL, NULL),
(243, 2, 'San Miguel', NULL, NULL),
(244, 2, 'Santos Lugares', NULL, NULL),
(245, 2, 'Sarandí', NULL, NULL),
(246, 2, 'Sourigues', NULL, NULL),
(247, 2, 'Tapiales', NULL, NULL),
(248, 2, 'Temperley', NULL, NULL),
(249, 2, 'Tigre', NULL, NULL),
(250, 2, 'Tortuguitas', NULL, NULL),
(251, 2, 'Tristán Suárez', NULL, NULL),
(252, 2, 'Trujui', NULL, NULL),
(253, 2, 'Turdera', NULL, NULL),
(254, 2, 'Valentín Alsina', NULL, NULL),
(255, 2, 'Vicente López', NULL, NULL),
(256, 2, 'Villa Adelina', NULL, NULL),
(257, 2, 'Villa Ballester', NULL, NULL),
(258, 2, 'Villa Bosch', NULL, NULL),
(259, 2, 'Villa Caraza', NULL, NULL),
(260, 2, 'Villa Celina', NULL, NULL),
(261, 2, 'Villa Centenario', NULL, NULL),
(262, 2, 'Villa de Mayo', NULL, NULL),
(263, 2, 'Villa Diamante', NULL, NULL),
(264, 2, 'Villa Domínico', NULL, NULL),
(265, 2, 'Villa España', NULL, NULL),
(266, 2, 'Villa Fiorito', NULL, NULL),
(267, 2, 'Villa Guillermina', NULL, NULL),
(268, 2, 'Villa Insuperable', NULL, NULL),
(269, 2, 'Villa José León Suárez', NULL, NULL),
(270, 2, 'Villa La Florida', NULL, NULL),
(271, 2, 'Villa Luzuriaga', NULL, NULL),
(272, 2, 'Villa Martelli', NULL, NULL),
(273, 2, 'Villa Obrera', NULL, NULL),
(274, 2, 'Villa Progreso', NULL, NULL),
(275, 2, 'Villa Raffo', NULL, NULL),
(276, 2, 'Villa Sarmiento', NULL, NULL),
(277, 2, 'Villa Tesei', NULL, NULL),
(278, 2, 'Villa Udaondo', NULL, NULL),
(279, 2, 'Virrey del Pino', NULL, NULL),
(280, 2, 'Wilde', NULL, NULL),
(281, 2, 'William Morris', NULL, NULL),
(282, 3, 'Agronomía', NULL, NULL),
(283, 3, 'Almagro', NULL, NULL),
(284, 3, 'Balvanera', NULL, NULL),
(285, 3, 'Barracas', NULL, NULL),
(286, 3, 'Belgrano', NULL, NULL),
(287, 3, 'Boca', NULL, NULL),
(288, 3, 'Boedo', NULL, NULL),
(289, 3, 'Caballito', NULL, NULL),
(290, 3, 'Chacarita', NULL, NULL),
(291, 3, 'Coghlan', NULL, NULL),
(292, 3, 'Colegiales', NULL, NULL),
(293, 3, 'Constitución', NULL, NULL),
(294, 3, 'Flores', NULL, NULL),
(295, 3, 'Floresta', NULL, NULL),
(296, 3, 'La Paternal', NULL, NULL),
(297, 3, 'Liniers', NULL, NULL),
(298, 3, 'Mataderos', NULL, NULL),
(299, 3, 'Monserrat', NULL, NULL),
(300, 3, 'Monte Castro', NULL, NULL),
(301, 3, 'Nueva Pompeya', NULL, NULL),
(302, 3, 'Núñez', NULL, NULL),
(303, 3, 'Palermo', NULL, NULL),
(304, 3, 'Parque Avellaneda', NULL, NULL),
(305, 3, 'Parque Chacabuco', NULL, NULL),
(306, 3, 'Parque Chas', NULL, NULL),
(307, 3, 'Parque Patricios', NULL, NULL),
(308, 3, 'Puerto Madero', NULL, NULL),
(309, 3, 'Recoleta', NULL, NULL),
(310, 3, 'Retiro', NULL, NULL),
(311, 3, 'Saavedra', NULL, NULL),
(312, 3, 'San Cristóbal', NULL, NULL),
(313, 3, 'San Nicolás', NULL, NULL),
(314, 3, 'San Telmo', NULL, NULL),
(315, 3, 'Vélez Sársfield', NULL, NULL),
(316, 3, 'Versalles', NULL, NULL),
(317, 3, 'Villa Crespo', NULL, NULL),
(318, 3, 'Villa del Parque', NULL, NULL),
(319, 3, 'Villa Devoto', NULL, NULL),
(320, 3, 'Villa Gral. Mitre', NULL, NULL),
(321, 3, 'Villa Lugano', NULL, NULL),
(322, 3, 'Villa Luro', NULL, NULL),
(323, 3, 'Villa Ortúzar', NULL, NULL),
(324, 3, 'Villa Pueyrredón', NULL, NULL),
(325, 3, 'Villa Real', NULL, NULL),
(326, 3, 'Villa Riachuelo', NULL, NULL),
(327, 3, 'Villa Santa Rita', NULL, NULL),
(328, 3, 'Villa Soldati', NULL, NULL),
(329, 3, 'Villa Urquiza', NULL, NULL),
(330, 4, 'Aconquija', NULL, NULL),
(331, 4, 'Ancasti', NULL, NULL),
(332, 4, 'Andalgalá', NULL, NULL),
(333, 4, 'Antofagasta', NULL, NULL),
(334, 4, 'Belén', NULL, NULL),
(335, 4, 'Capayán', NULL, NULL),
(336, 4, 'Capital', NULL, NULL),
(337, 4, '4', NULL, NULL),
(338, 4, 'Corral Quemado', NULL, NULL),
(339, 4, 'El Alto', NULL, NULL),
(340, 4, 'El Rodeo', NULL, NULL),
(341, 4, 'F.Mamerto Esquiú', NULL, NULL),
(342, 4, 'Fiambalá', NULL, NULL),
(343, 4, 'Hualfín', NULL, NULL),
(344, 4, 'Huillapima', NULL, NULL),
(345, 4, 'Icaño', NULL, NULL),
(346, 4, 'La Puerta', NULL, NULL),
(347, 4, 'Las Juntas', NULL, NULL),
(348, 4, 'Londres', NULL, NULL),
(349, 4, 'Los Altos', NULL, NULL),
(350, 4, 'Los Varela', NULL, NULL),
(351, 4, 'Mutquín', NULL, NULL),
(352, 4, 'Paclín', NULL, NULL),
(353, 4, 'Poman', NULL, NULL),
(354, 4, 'Pozo de La Piedra', NULL, NULL),
(355, 4, 'Puerta de Corral', NULL, NULL),
(356, 4, 'Puerta San José', NULL, NULL),
(357, 4, 'Recreo', NULL, NULL),
(358, 4, 'S.F.V de 4', NULL, NULL),
(359, 4, 'San Fernando', NULL, NULL),
(360, 4, 'San Fernando del Valle', NULL, NULL),
(361, 4, 'San José', NULL, NULL),
(362, 4, 'Santa María', NULL, NULL),
(363, 4, 'Santa Rosa', NULL, NULL),
(364, 4, 'Saujil', NULL, NULL),
(365, 4, 'Tapso', NULL, NULL),
(366, 4, 'Tinogasta', NULL, NULL),
(367, 4, 'Valle Viejo', NULL, NULL),
(368, 4, 'Villa Vil', NULL, NULL),
(369, 5, 'Aviá Teraí', NULL, NULL),
(370, 5, 'Barranqueras', NULL, NULL),
(371, 5, 'Basail', NULL, NULL),
(372, 5, 'Campo Largo', NULL, NULL),
(373, 5, 'Capital', NULL, NULL),
(374, 5, 'Capitán Solari', NULL, NULL),
(375, 5, 'Charadai', NULL, NULL),
(376, 5, 'Charata', NULL, NULL),
(377, 5, 'Chorotis', NULL, NULL),
(378, 5, 'Ciervo Petiso', NULL, NULL),
(379, 5, 'Cnel. Du Graty', NULL, NULL),
(380, 5, 'Col. Benítez', NULL, NULL),
(381, 5, 'Col. Elisa', NULL, NULL),
(382, 5, 'Col. Popular', NULL, NULL),
(383, 5, 'Colonias Unidas', NULL, NULL),
(384, 5, 'Concepción', NULL, NULL),
(385, 5, 'Corzuela', NULL, NULL),
(386, 5, 'Cote Lai', NULL, NULL),
(387, 5, 'El Sauzalito', NULL, NULL),
(388, 5, 'Enrique Urien', NULL, NULL),
(389, 5, 'Fontana', NULL, NULL),
(390, 5, 'Fte. Esperanza', NULL, NULL),
(391, 5, 'Gancedo', NULL, NULL),
(392, 5, 'Gral. Capdevila', NULL, NULL),
(393, 5, 'Gral. Pinero', NULL, NULL),
(394, 5, 'Gral. San Martín', NULL, NULL),
(395, 5, 'Gral. Vedia', NULL, NULL),
(396, 5, 'Hermoso Campo', NULL, NULL),
(397, 5, 'I. del Cerrito', NULL, NULL),
(398, 5, 'J.J. Castelli', NULL, NULL),
(399, 5, 'La Clotilde', NULL, NULL),
(400, 5, 'La Eduvigis', NULL, NULL),
(401, 5, 'La Escondida', NULL, NULL),
(402, 5, 'La Leonesa', NULL, NULL),
(403, 5, 'La Tigra', NULL, NULL),
(404, 5, 'La Verde', NULL, NULL),
(405, 5, 'Laguna Blanca', NULL, NULL),
(406, 5, 'Laguna Limpia', NULL, NULL),
(407, 5, 'Lapachito', NULL, NULL),
(408, 5, 'Las Breñas', NULL, NULL),
(409, 5, 'Las Garcitas', NULL, NULL),
(410, 5, 'Las Palmas', NULL, NULL),
(411, 5, 'Los Frentones', NULL, NULL),
(412, 5, 'Machagai', NULL, NULL),
(413, 5, 'Makallé', NULL, NULL),
(414, 5, 'Margarita Belén', NULL, NULL),
(415, 5, 'Miraflores', NULL, NULL),
(416, 5, 'Misión N. Pompeya', NULL, NULL),
(417, 5, 'Napenay', NULL, NULL),
(418, 5, 'Pampa Almirón', NULL, NULL),
(419, 5, 'Pampa del Indio', NULL, NULL),
(420, 5, 'Pampa del Infierno', NULL, NULL),
(421, 5, 'Pdcia. de La Plaza', NULL, NULL),
(422, 5, 'Pdcia. Roca', NULL, NULL),
(423, 5, 'Pdcia. Roque Sáenz Peña', NULL, NULL),
(424, 5, 'Pto. Bermejo', NULL, NULL),
(425, 5, 'Pto. Eva Perón', NULL, NULL),
(426, 5, 'Puero Tirol', NULL, NULL),
(427, 5, 'Puerto Vilelas', NULL, NULL),
(428, 5, 'Quitilipi', NULL, NULL),
(429, 5, 'Resistencia', NULL, NULL),
(430, 5, 'Sáenz Peña', NULL, NULL),
(431, 5, 'Samuhú', NULL, NULL),
(432, 5, 'San Bernardo', NULL, NULL),
(433, 5, 'Santa Sylvina', NULL, NULL),
(434, 5, 'Taco Pozo', NULL, NULL),
(435, 5, 'Tres Isletas', NULL, NULL),
(436, 5, 'Villa Ángela', NULL, NULL),
(437, 5, 'Villa Berthet', NULL, NULL),
(438, 5, 'Villa R. Bermejito', NULL, NULL),
(439, 6, 'Aldea Apeleg', NULL, NULL),
(440, 6, 'Aldea Beleiro', NULL, NULL),
(441, 6, 'Aldea Epulef', NULL, NULL),
(442, 6, 'Alto Río Sengerr', NULL, NULL),
(443, 6, 'Buen Pasto', NULL, NULL),
(444, 6, 'Camarones', NULL, NULL),
(445, 6, 'Carrenleufú', NULL, NULL),
(446, 6, 'Cholila', NULL, NULL),
(447, 6, 'Co. Centinela', NULL, NULL),
(448, 6, 'Colan Conhué', NULL, NULL),
(449, 6, 'Comodoro Rivadavia', NULL, NULL),
(450, 6, 'Corcovado', NULL, NULL),
(451, 6, 'Cushamen', NULL, NULL),
(452, 6, 'Dique F. Ameghino', NULL, NULL),
(453, 6, 'Dolavón', NULL, NULL),
(454, 6, 'Dr. R. Rojas', NULL, NULL),
(455, 6, 'El Hoyo', NULL, NULL),
(456, 6, 'El Maitén', NULL, NULL),
(457, 6, 'Epuyén', NULL, NULL),
(458, 6, 'Esquel', NULL, NULL),
(459, 6, 'Facundo', NULL, NULL),
(460, 6, 'Gaimán', NULL, NULL),
(461, 6, 'Gan Gan', NULL, NULL),
(462, 6, 'Gastre', NULL, NULL),
(463, 6, 'Gdor. Costa', NULL, NULL),
(464, 6, 'Gualjaina', NULL, NULL),
(465, 6, 'J. de San Martín', NULL, NULL),
(466, 6, 'Lago Blanco', NULL, NULL),
(467, 6, 'Lago Puelo', NULL, NULL),
(468, 6, 'Lagunita Salada', NULL, NULL),
(469, 6, 'Las Plumas', NULL, NULL),
(470, 6, 'Los Altares', NULL, NULL),
(471, 6, 'Paso de los Indios', NULL, NULL),
(472, 6, 'Paso del Sapo', NULL, NULL),
(473, 6, 'Pto. Madryn', NULL, NULL),
(474, 6, 'Pto. Pirámides', NULL, NULL),
(475, 6, 'Rada Tilly', NULL, NULL),
(476, 6, 'Rawson', NULL, NULL),
(477, 6, 'Río Mayo', NULL, NULL),
(478, 6, 'Río Pico', NULL, NULL),
(479, 6, 'Sarmiento', NULL, NULL),
(480, 6, 'Tecka', NULL, NULL),
(481, 6, 'Telsen', NULL, NULL),
(482, 6, 'Trelew', NULL, NULL),
(483, 6, 'Trevelin', NULL, NULL),
(484, 6, 'Veintiocho de Julio', NULL, NULL),
(485, 7, 'Achiras', NULL, NULL),
(486, 7, 'Adelia Maria', NULL, NULL),
(487, 7, 'Agua de Oro', NULL, NULL),
(488, 7, 'Alcira Gigena', NULL, NULL),
(489, 7, 'Aldea Santa Maria', NULL, NULL),
(490, 7, 'Alejandro Roca', NULL, NULL),
(491, 7, 'Alejo Ledesma', NULL, NULL),
(492, 7, 'Alicia', NULL, NULL),
(493, 7, 'Almafuerte', NULL, NULL),
(494, 7, 'Alpa Corral', NULL, NULL),
(495, 7, 'Alta Gracia', NULL, NULL),
(496, 7, 'Alto Alegre', NULL, NULL),
(497, 7, 'Alto de Los Quebrachos', NULL, NULL),
(498, 7, 'Altos de Chipion', NULL, NULL),
(499, 7, 'Amboy', NULL, NULL),
(500, 7, 'Ambul', NULL, NULL),
(501, 7, 'Ana Zumaran', NULL, NULL),
(502, 7, 'Anisacate', NULL, NULL),
(503, 7, 'Arguello', NULL, NULL),
(504, 7, 'Arias', NULL, NULL),
(505, 7, 'Arroyito', NULL, NULL),
(506, 7, 'Arroyo Algodon', NULL, NULL),
(507, 7, 'Arroyo Cabral', NULL, NULL),
(508, 7, 'Arroyo Los Patos', NULL, NULL),
(509, 7, 'Assunta', NULL, NULL),
(510, 7, 'Atahona', NULL, NULL),
(511, 7, 'Ausonia', NULL, NULL),
(512, 7, 'Avellaneda', NULL, NULL),
(513, 7, 'Ballesteros', NULL, NULL),
(514, 7, 'Ballesteros Sud', NULL, NULL),
(515, 7, 'Balnearia', NULL, NULL),
(516, 7, 'Bañado de Soto', NULL, NULL),
(517, 7, 'Bell Ville', NULL, NULL),
(518, 7, 'Bengolea', NULL, NULL),
(519, 7, 'Benjamin Gould', NULL, NULL),
(520, 7, 'Berrotaran', NULL, NULL),
(521, 7, 'Bialet Masse', NULL, NULL),
(522, 7, 'Bouwer', NULL, NULL),
(523, 7, 'Brinkmann', NULL, NULL),
(524, 7, 'Buchardo', NULL, NULL),
(525, 7, 'Bulnes', NULL, NULL),
(526, 7, 'Cabalango', NULL, NULL),
(527, 7, 'Calamuchita', NULL, NULL),
(528, 7, 'Calchin', NULL, NULL),
(529, 7, 'Calchin Oeste', NULL, NULL),
(530, 7, 'Calmayo', NULL, NULL),
(531, 7, 'Camilo Aldao', NULL, NULL),
(532, 7, 'Caminiaga', NULL, NULL),
(533, 7, 'Cañada de Luque', NULL, NULL),
(534, 7, 'Cañada de Machado', NULL, NULL),
(535, 7, 'Cañada de Rio Pinto', NULL, NULL),
(536, 7, 'Cañada del Sauce', NULL, NULL),
(537, 7, 'Canals', NULL, NULL),
(538, 7, 'Candelaria Sud', NULL, NULL),
(539, 7, 'Capilla de Remedios', NULL, NULL),
(540, 7, 'Capilla de Siton', NULL, NULL),
(541, 7, 'Capilla del Carmen', NULL, NULL),
(542, 7, 'Capilla del Monte', NULL, NULL),
(543, 7, 'Capital', NULL, NULL),
(544, 7, 'Capitan Gral B. O´Higgins', NULL, NULL),
(545, 7, 'Carnerillo', NULL, NULL),
(546, 7, 'Carrilobo', NULL, NULL),
(547, 7, 'Casa Grande', NULL, NULL),
(548, 7, 'Cavanagh', NULL, NULL),
(549, 7, 'Cerro Colorado', NULL, NULL),
(550, 7, 'Chaján', NULL, NULL),
(551, 7, 'Chalacea', NULL, NULL),
(552, 7, 'Chañar Viejo', NULL, NULL),
(553, 7, 'Chancaní', NULL, NULL),
(554, 7, 'Charbonier', NULL, NULL),
(555, 7, 'Charras', NULL, NULL),
(556, 7, 'Chazón', NULL, NULL),
(557, 7, 'Chilibroste', NULL, NULL),
(558, 7, 'Chucul', NULL, NULL),
(559, 7, 'Chuña', NULL, NULL),
(560, 7, 'Chuña Huasi', NULL, NULL),
(561, 7, 'Churqui Cañada', NULL, NULL),
(562, 7, 'Cienaga Del Coro', NULL, NULL),
(563, 7, 'Cintra', NULL, NULL),
(564, 7, 'Col. Almada', NULL, NULL),
(565, 7, 'Col. Anita', NULL, NULL),
(566, 7, 'Col. Barge', NULL, NULL),
(567, 7, 'Col. Bismark', NULL, NULL),
(568, 7, 'Col. Bremen', NULL, NULL),
(569, 7, 'Col. Caroya', NULL, NULL),
(570, 7, 'Col. Italiana', NULL, NULL),
(571, 7, 'Col. Iturraspe', NULL, NULL),
(572, 7, 'Col. Las Cuatro Esquinas', NULL, NULL),
(573, 7, 'Col. Las Pichanas', NULL, NULL),
(574, 7, 'Col. Marina', NULL, NULL),
(575, 7, 'Col. Prosperidad', NULL, NULL),
(576, 7, 'Col. San Bartolome', NULL, NULL),
(577, 7, 'Col. San Pedro', NULL, NULL),
(578, 7, 'Col. Tirolesa', NULL, NULL),
(579, 7, 'Col. Vicente Aguero', NULL, NULL),
(580, 7, 'Col. Videla', NULL, NULL),
(581, 7, 'Col. Vignaud', NULL, NULL),
(582, 7, 'Col. Waltelina', NULL, NULL),
(583, 7, 'Colazo', NULL, NULL),
(584, 7, 'Comechingones', NULL, NULL),
(585, 7, 'Conlara', NULL, NULL),
(586, 7, 'Copacabana', NULL, NULL),
(587, 7, '7', NULL, NULL),
(588, 7, 'Coronel Baigorria', NULL, NULL),
(589, 7, 'Coronel Moldes', NULL, NULL),
(590, 7, 'Corral de Bustos', NULL, NULL),
(591, 7, 'Corralito', NULL, NULL),
(592, 7, 'Cosquín', NULL, NULL),
(593, 7, 'Costa Sacate', NULL, NULL),
(594, 7, 'Cruz Alta', NULL, NULL),
(595, 7, 'Cruz de Caña', NULL, NULL),
(596, 7, 'Cruz del Eje', NULL, NULL),
(597, 7, 'Cuesta Blanca', NULL, NULL),
(598, 7, 'Dean Funes', NULL, NULL),
(599, 7, 'Del Campillo', NULL, NULL),
(600, 7, 'Despeñaderos', NULL, NULL),
(601, 7, 'Devoto', NULL, NULL),
(602, 7, 'Diego de Rojas', NULL, NULL),
(603, 7, 'Dique Chico', NULL, NULL),
(604, 7, 'El Arañado', NULL, NULL),
(605, 7, 'El Brete', NULL, NULL),
(606, 7, 'El Chacho', NULL, NULL),
(607, 7, 'El Crispín', NULL, NULL),
(608, 7, 'El Fortín', NULL, NULL),
(609, 7, 'El Manzano', NULL, NULL),
(610, 7, 'El Rastreador', NULL, NULL),
(611, 7, 'El Rodeo', NULL, NULL),
(612, 7, 'El Tío', NULL, NULL),
(613, 7, 'Elena', NULL, NULL),
(614, 7, 'Embalse', NULL, NULL),
(615, 7, 'Esquina', NULL, NULL),
(616, 7, 'Estación Gral. Paz', NULL, NULL),
(617, 7, 'Estación Juárez Celman', NULL, NULL),
(618, 7, 'Estancia de Guadalupe', NULL, NULL),
(619, 7, 'Estancia Vieja', NULL, NULL),
(620, 7, 'Etruria', NULL, NULL),
(621, 7, 'Eufrasio Loza', NULL, NULL),
(622, 7, 'Falda del Carmen', NULL, NULL),
(623, 7, 'Freyre', NULL, NULL),
(624, 7, 'Gral. Baldissera', NULL, NULL),
(625, 7, 'Gral. Cabrera', NULL, NULL),
(626, 7, 'Gral. Deheza', NULL, NULL),
(627, 7, 'Gral. Fotheringham', NULL, NULL),
(628, 7, 'Gral. Levalle', NULL, NULL),
(629, 7, 'Gral. Roca', NULL, NULL),
(630, 7, 'Guanaco Muerto', NULL, NULL),
(631, 7, 'Guasapampa', NULL, NULL),
(632, 7, 'Guatimozin', NULL, NULL),
(633, 7, 'Gutenberg', NULL, NULL),
(634, 7, 'Hernando', NULL, NULL),
(635, 7, 'Huanchillas', NULL, NULL),
(636, 7, 'Huerta Grande', NULL, NULL),
(637, 7, 'Huinca Renanco', NULL, NULL),
(638, 7, 'Idiazabal', NULL, NULL),
(639, 7, 'Impira', NULL, NULL),
(640, 7, 'Inriville', NULL, NULL),
(641, 7, 'Isla Verde', NULL, NULL),
(642, 7, 'Italó', NULL, NULL),
(643, 7, 'James Craik', NULL, NULL),
(644, 7, 'Jesús María', NULL, NULL),
(645, 7, 'Jovita', NULL, NULL),
(646, 7, 'Justiniano Posse', NULL, NULL),
(647, 7, 'Km 658', NULL, NULL),
(648, 7, 'L. V. Mansilla', NULL, NULL),
(649, 7, 'La Batea', NULL, NULL),
(650, 7, 'La Calera', NULL, NULL),
(651, 7, 'La Carlota', NULL, NULL),
(652, 7, 'La Carolina', NULL, NULL),
(653, 7, 'La Cautiva', NULL, NULL),
(654, 7, 'La Cesira', NULL, NULL),
(655, 7, 'La Cruz', NULL, NULL),
(656, 7, 'La Cumbre', NULL, NULL),
(657, 7, 'La Cumbrecita', NULL, NULL),
(658, 7, 'La Falda', NULL, NULL),
(659, 7, 'La Francia', NULL, NULL),
(660, 7, 'La Granja', NULL, NULL),
(661, 7, 'La Higuera', NULL, NULL),
(662, 7, 'La Laguna', NULL, NULL),
(663, 7, 'La Paisanita', NULL, NULL),
(664, 7, 'La Palestina', NULL, NULL),
(665, 7, '12', NULL, NULL),
(666, 7, 'La Paquita', NULL, NULL),
(667, 7, 'La Para', NULL, NULL),
(668, 7, 'La Paz', NULL, NULL),
(669, 7, 'La Playa', NULL, NULL),
(670, 7, 'La Playosa', NULL, NULL),
(671, 7, 'La Población', NULL, NULL),
(672, 7, 'La Posta', NULL, NULL),
(673, 7, 'La Puerta', NULL, NULL),
(674, 7, 'La Quinta', NULL, NULL),
(675, 7, 'La Rancherita', NULL, NULL),
(676, 7, 'La Rinconada', NULL, NULL),
(677, 7, 'La Serranita', NULL, NULL),
(678, 7, 'La Tordilla', NULL, NULL),
(679, 7, 'Laborde', NULL, NULL),
(680, 7, 'Laboulaye', NULL, NULL),
(681, 7, 'Laguna Larga', NULL, NULL),
(682, 7, 'Las Acequias', NULL, NULL),
(683, 7, 'Las Albahacas', NULL, NULL),
(684, 7, 'Las Arrias', NULL, NULL),
(685, 7, 'Las Bajadas', NULL, NULL),
(686, 7, 'Las Caleras', NULL, NULL),
(687, 7, 'Las Calles', NULL, NULL),
(688, 7, 'Las Cañadas', NULL, NULL),
(689, 7, 'Las Gramillas', NULL, NULL),
(690, 7, 'Las Higueras', NULL, NULL),
(691, 7, 'Las Isletillas', NULL, NULL),
(692, 7, 'Las Junturas', NULL, NULL),
(693, 7, 'Las Palmas', NULL, NULL),
(694, 7, 'Las Peñas', NULL, NULL),
(695, 7, 'Las Peñas Sud', NULL, NULL),
(696, 7, 'Las Perdices', NULL, NULL),
(697, 7, 'Las Playas', NULL, NULL),
(698, 7, 'Las Rabonas', NULL, NULL),
(699, 7, 'Las Saladas', NULL, NULL),
(700, 7, 'Las Tapias', NULL, NULL),
(701, 7, 'Las Varas', NULL, NULL),
(702, 7, 'Las Varillas', NULL, NULL),
(703, 7, 'Las Vertientes', NULL, NULL),
(704, 7, 'Leguizamón', NULL, NULL),
(705, 7, 'Leones', NULL, NULL),
(706, 7, 'Los Cedros', NULL, NULL),
(707, 7, 'Los Cerrillos', NULL, NULL),
(708, 7, 'Los Chañaritos (C.E)', NULL, NULL),
(709, 7, 'Los Chanaritos (R.S)', NULL, NULL),
(710, 7, 'Los Cisnes', NULL, NULL),
(711, 7, 'Los Cocos', NULL, NULL),
(712, 7, 'Los Cóndores', NULL, NULL),
(713, 7, 'Los Hornillos', NULL, NULL),
(714, 7, 'Los Hoyos', NULL, NULL),
(715, 7, 'Los Mistoles', NULL, NULL),
(716, 7, 'Los Molinos', NULL, NULL),
(717, 7, 'Los Pozos', NULL, NULL),
(718, 7, 'Los Reartes', NULL, NULL),
(719, 7, 'Los Surgentes', NULL, NULL),
(720, 7, 'Los Talares', NULL, NULL),
(721, 7, 'Los Zorros', NULL, NULL),
(722, 7, 'Lozada', NULL, NULL),
(723, 7, 'Luca', NULL, NULL),
(724, 7, 'Luque', NULL, NULL),
(725, 7, 'Luyaba', NULL, NULL),
(726, 7, 'Malagueño', NULL, NULL),
(727, 7, 'Malena', NULL, NULL),
(728, 7, 'Malvinas Argentinas', NULL, NULL),
(729, 7, 'Manfredi', NULL, NULL),
(730, 7, 'Maquinista Gallini', NULL, NULL),
(731, 7, 'Marcos Juárez', NULL, NULL),
(732, 7, 'Marull', NULL, NULL),
(733, 7, 'Matorrales', NULL, NULL),
(734, 7, 'Mattaldi', NULL, NULL),
(735, 7, 'Mayu Sumaj', NULL, NULL),
(736, 7, 'Media Naranja', NULL, NULL),
(737, 7, 'Melo', NULL, NULL),
(738, 7, 'Mendiolaza', NULL, NULL),
(739, 7, 'Mi Granja', NULL, NULL),
(740, 7, 'Mina Clavero', NULL, NULL),
(741, 7, 'Miramar', NULL, NULL),
(742, 7, 'Morrison', NULL, NULL),
(743, 7, 'Morteros', NULL, NULL),
(744, 7, 'Mte. Buey', NULL, NULL),
(745, 7, 'Mte. Cristo', NULL, NULL),
(746, 7, 'Mte. De Los Gauchos', NULL, NULL),
(747, 7, 'Mte. Leña', NULL, NULL),
(748, 7, 'Mte. Maíz', NULL, NULL),
(749, 7, 'Mte. Ralo', NULL, NULL),
(750, 7, 'Nicolás Bruzone', NULL, NULL),
(751, 7, 'Noetinger', NULL, NULL),
(752, 7, 'Nono', NULL, NULL),
(753, 7, 'Nueva 7', NULL, NULL),
(754, 7, 'Obispo Trejo', NULL, NULL),
(755, 7, 'Olaeta', NULL, NULL),
(756, 7, 'Oliva', NULL, NULL),
(757, 7, 'Olivares San Nicolás', NULL, NULL),
(758, 7, 'Onagolty', NULL, NULL),
(759, 7, 'Oncativo', NULL, NULL),
(760, 7, 'Ordoñez', NULL, NULL),
(761, 7, 'Pacheco De Melo', NULL, NULL),
(762, 7, 'Pampayasta N.', NULL, NULL),
(763, 7, 'Pampayasta S.', NULL, NULL),
(764, 7, 'Panaholma', NULL, NULL),
(765, 7, 'Pascanas', NULL, NULL),
(766, 7, 'Pasco', NULL, NULL),
(767, 7, 'Paso del Durazno', NULL, NULL),
(768, 7, 'Paso Viejo', NULL, NULL),
(769, 7, 'Pilar', NULL, NULL),
(770, 7, 'Pincén', NULL, NULL),
(771, 7, 'Piquillín', NULL, NULL),
(772, 7, 'Plaza de Mercedes', NULL, NULL),
(773, 7, 'Plaza Luxardo', NULL, NULL),
(774, 7, 'Porteña', NULL, NULL),
(775, 7, 'Potrero de Garay', NULL, NULL),
(776, 7, 'Pozo del Molle', NULL, NULL),
(777, 7, 'Pozo Nuevo', NULL, NULL),
(778, 7, 'Pueblo Italiano', NULL, NULL),
(779, 7, 'Puesto de Castro', NULL, NULL),
(780, 7, 'Punta del Agua', NULL, NULL),
(781, 7, 'Quebracho Herrado', NULL, NULL),
(782, 7, 'Quilino', NULL, NULL),
(783, 7, 'Rafael García', NULL, NULL),
(784, 7, 'Ranqueles', NULL, NULL),
(785, 7, 'Rayo Cortado', NULL, NULL),
(786, 7, 'Reducción', NULL, NULL),
(787, 7, 'Rincón', NULL, NULL),
(788, 7, 'Río Bamba', NULL, NULL),
(789, 7, 'Río Ceballos', NULL, NULL),
(790, 7, 'Río Cuarto', NULL, NULL),
(791, 7, 'Río de Los Sauces', NULL, NULL),
(792, 7, 'Río Primero', NULL, NULL),
(793, 7, 'Río Segundo', NULL, NULL),
(794, 7, 'Río Tercero', NULL, NULL),
(795, 7, 'Rosales', NULL, NULL),
(796, 7, 'Rosario del Saladillo', NULL, NULL),
(797, 7, 'Sacanta', NULL, NULL),
(798, 7, 'Sagrada Familia', NULL, NULL),
(799, 7, 'Saira', NULL, NULL),
(800, 7, 'Saladillo', NULL, NULL),
(801, 7, 'Saldán', NULL, NULL),
(802, 7, 'Salsacate', NULL, NULL),
(803, 7, 'Salsipuedes', NULL, NULL),
(804, 7, 'Sampacho', NULL, NULL),
(805, 7, 'San Agustín', NULL, NULL),
(806, 7, 'San Antonio de Arredondo', NULL, NULL),
(807, 7, 'San Antonio de Litín', NULL, NULL),
(808, 7, 'San Basilio', NULL, NULL),
(809, 7, 'San Carlos Minas', NULL, NULL),
(810, 7, 'San Clemente', NULL, NULL),
(811, 7, 'San Esteban', NULL, NULL),
(812, 7, 'San Francisco', NULL, NULL),
(813, 7, 'San Ignacio', NULL, NULL),
(814, 7, 'San Javier', NULL, NULL),
(815, 7, 'San Jerónimo', NULL, NULL),
(816, 7, 'San Joaquín', NULL, NULL),
(817, 7, 'San José de La Dormida', NULL, NULL),
(818, 7, 'San José de Las Salinas', NULL, NULL),
(819, 7, 'San Lorenzo', NULL, NULL),
(820, 7, 'San Marcos Sierras', NULL, NULL),
(821, 7, 'San Marcos Sud', NULL, NULL),
(822, 7, 'San Pedro', NULL, NULL),
(823, 7, 'San Pedro N.', NULL, NULL),
(824, 7, 'San Roque', NULL, NULL),
(825, 7, 'San Vicente', NULL, NULL),
(826, 7, 'Santa Catalina', NULL, NULL),
(827, 7, 'Santa Elena', NULL, NULL),
(828, 7, 'Santa Eufemia', NULL, NULL),
(829, 7, 'Santa Maria', NULL, NULL),
(830, 7, 'Sarmiento', NULL, NULL),
(831, 7, 'Saturnino M.Laspiur', NULL, NULL),
(832, 7, 'Sauce Arriba', NULL, NULL),
(833, 7, 'Sebastián Elcano', NULL, NULL),
(834, 7, 'Seeber', NULL, NULL),
(835, 7, 'Segunda Usina', NULL, NULL),
(836, 7, 'Serrano', NULL, NULL),
(837, 7, 'Serrezuela', NULL, NULL),
(838, 7, 'Sgo. Temple', NULL, NULL),
(839, 7, 'Silvio Pellico', NULL, NULL),
(840, 7, 'Simbolar', NULL, NULL),
(841, 7, 'Sinsacate', NULL, NULL),
(842, 7, 'Sta. Rosa de Calamuchita', NULL, NULL),
(843, 7, 'Sta. Rosa de Río Primero', NULL, NULL),
(844, 7, 'Suco', NULL, NULL),
(845, 7, 'Tala Cañada', NULL, NULL),
(846, 7, 'Tala Huasi', NULL, NULL),
(847, 7, 'Talaini', NULL, NULL),
(848, 7, 'Tancacha', NULL, NULL),
(849, 7, 'Tanti', NULL, NULL),
(850, 7, 'Ticino', NULL, NULL),
(851, 7, 'Tinoco', NULL, NULL),
(852, 7, 'Tío Pujio', NULL, NULL),
(853, 7, 'Toledo', NULL, NULL),
(854, 7, 'Toro Pujio', NULL, NULL),
(855, 7, 'Tosno', NULL, NULL),
(856, 7, 'Tosquita', NULL, NULL),
(857, 7, 'Tránsito', NULL, NULL),
(858, 7, 'Tuclame', NULL, NULL),
(859, 7, 'Tutti', NULL, NULL),
(860, 7, 'Ucacha', NULL, NULL),
(861, 7, 'Unquillo', NULL, NULL),
(862, 7, 'Valle de Anisacate', NULL, NULL),
(863, 7, 'Valle Hermoso', NULL, NULL),
(864, 7, 'Vélez Sarfield', NULL, NULL),
(865, 7, 'Viamonte', NULL, NULL),
(866, 7, 'Vicuña Mackenna', NULL, NULL),
(867, 7, 'Villa Allende', NULL, NULL),
(868, 7, 'Villa Amancay', NULL, NULL),
(869, 7, 'Villa Ascasubi', NULL, NULL),
(870, 7, 'Villa Candelaria N.', NULL, NULL),
(871, 7, 'Villa Carlos Paz', NULL, NULL),
(872, 7, 'Villa Cerro Azul', NULL, NULL),
(873, 7, 'Villa Ciudad de América', NULL, NULL),
(874, 7, 'Villa Ciudad Pque Los Reartes', NULL, NULL),
(875, 7, 'Villa Concepción del Tío', NULL, NULL),
(876, 7, 'Villa Cura Brochero', NULL, NULL),
(877, 7, 'Villa de Las Rosas', NULL, NULL),
(878, 7, 'Villa de María', NULL, NULL),
(879, 7, 'Villa de Pocho', NULL, NULL),
(880, 7, 'Villa de Soto', NULL, NULL),
(881, 7, 'Villa del Dique', NULL, NULL),
(882, 7, 'Villa del Prado', NULL, NULL),
(883, 7, 'Villa del Rosario', NULL, NULL),
(884, 7, 'Villa del Totoral', NULL, NULL),
(885, 7, 'Villa Dolores', NULL, NULL),
(886, 7, 'Villa El Chancay', NULL, NULL),
(887, 7, 'Villa Elisa', NULL, NULL),
(888, 7, 'Villa Flor Serrana', NULL, NULL),
(889, 7, 'Villa Fontana', NULL, NULL),
(890, 7, 'Villa Giardino', NULL, NULL),
(891, 7, 'Villa Gral. Belgrano', NULL, NULL),
(892, 7, 'Villa Gutierrez', NULL, NULL),
(893, 7, 'Villa Huidobro', NULL, NULL),
(894, 7, 'Villa La Bolsa', NULL, NULL),
(895, 7, 'Villa Los Aromos', NULL, NULL),
(896, 7, 'Villa Los Patos', NULL, NULL),
(897, 7, 'Villa María', NULL, NULL),
(898, 7, 'Villa Nueva', NULL, NULL),
(899, 7, 'Villa Pque. Santa Ana', NULL, NULL),
(900, 7, 'Villa Pque. Siquiman', NULL, NULL),
(901, 7, 'Villa Quillinzo', NULL, NULL),
(902, 7, 'Villa Rossi', NULL, NULL),
(903, 7, 'Villa Rumipal', NULL, NULL),
(904, 7, 'Villa San Esteban', NULL, NULL),
(905, 7, 'Villa San Isidro', NULL, NULL),
(906, 7, 'Villa 21', NULL, NULL),
(907, 7, 'Villa Sarmiento (G.R)', NULL, NULL),
(908, 7, 'Villa Sarmiento (S.A)', NULL, NULL),
(909, 7, 'Villa Tulumba', NULL, NULL),
(910, 7, 'Villa Valeria', NULL, NULL),
(911, 7, 'Villa Yacanto', NULL, NULL),
(912, 7, 'Washington', NULL, NULL),
(913, 7, 'Wenceslao Escalante', NULL, NULL),
(914, 7, 'Ycho Cruz Sierras', NULL, NULL),
(915, 8, 'Alvear', NULL, NULL),
(916, 8, 'Bella Vista', NULL, NULL),
(917, 8, 'Berón de Astrada', NULL, NULL),
(918, 8, 'Bonpland', NULL, NULL),
(919, 8, 'Caá Cati', NULL, NULL),
(920, 8, 'Capital', NULL, NULL),
(921, 8, 'Chavarría', NULL, NULL),
(922, 8, 'Col. C. Pellegrini', NULL, NULL),
(923, 8, 'Col. Libertad', NULL, NULL),
(924, 8, 'Col. Liebig', NULL, NULL),
(925, 8, 'Col. Sta Rosa', NULL, NULL),
(926, 8, 'Concepción', NULL, NULL),
(927, 8, 'Cruz de Los Milagros', NULL, NULL),
(928, 8, 'Curuzú-Cuatiá', NULL, NULL),
(929, 8, 'Empedrado', NULL, NULL),
(930, 8, 'Esquina', NULL, NULL),
(931, 8, 'Estación Torrent', NULL, NULL),
(932, 8, 'Felipe Yofré', NULL, NULL),
(933, 8, 'Garruchos', NULL, NULL),
(934, 8, 'Gdor. Agrónomo', NULL, NULL),
(935, 8, 'Gdor. Martínez', NULL, NULL),
(936, 8, 'Goya', NULL, NULL),
(937, 8, 'Guaviravi', NULL, NULL),
(938, 8, 'Herlitzka', NULL, NULL),
(939, 8, 'Ita-Ibate', NULL, NULL),
(940, 8, 'Itatí', NULL, NULL),
(941, 8, 'Ituzaingó', NULL, NULL),
(942, 8, 'José Rafael Gómez', NULL, NULL),
(943, 8, 'Juan Pujol', NULL, NULL),
(944, 8, 'La Cruz', NULL, NULL),
(945, 8, 'Lavalle', NULL, NULL),
(946, 8, 'Lomas de Vallejos', NULL, NULL),
(947, 8, 'Loreto', NULL, NULL),
(948, 8, 'Mariano I. Loza', NULL, NULL),
(949, 8, 'Mburucuyá', NULL, NULL),
(950, 8, 'Mercedes', NULL, NULL),
(951, 8, 'Mocoretá', NULL, NULL),
(952, 8, 'Mte. Caseros', NULL, NULL),
(953, 8, 'Nueve de Julio', NULL, NULL),
(954, 8, 'Palmar Grande', NULL, NULL),
(955, 8, 'Parada Pucheta', NULL, NULL),
(956, 8, 'Paso de La Patria', NULL, NULL),
(957, 8, 'Paso de Los Libres', NULL, NULL),
(958, 8, 'Pedro R. Fernandez', NULL, NULL),
(959, 8, 'Perugorría', NULL, NULL),
(960, 8, 'Pueblo Libertador', NULL, NULL),
(961, 8, 'Ramada Paso', NULL, NULL),
(962, 8, 'Riachuelo', NULL, NULL),
(963, 8, 'Saladas', NULL, NULL),
(964, 8, 'San Antonio', NULL, NULL),
(965, 8, 'San Carlos', NULL, NULL),
(966, 8, 'San Cosme', NULL, NULL),
(967, 8, 'San Lorenzo', NULL, NULL),
(968, 8, '20 del Palmar', NULL, NULL),
(969, 8, 'San Miguel', NULL, NULL),
(970, 8, 'San Roque', NULL, NULL),
(971, 8, 'Santa Ana', NULL, NULL),
(972, 8, 'Santa Lucía', NULL, NULL),
(973, 8, 'Santo Tomé', NULL, NULL),
(974, 8, 'Sauce', NULL, NULL),
(975, 8, 'Tabay', NULL, NULL),
(976, 8, 'Tapebicuá', NULL, NULL),
(977, 8, 'Tatacua', NULL, NULL),
(978, 8, 'Virasoro', NULL, NULL),
(979, 8, 'Yapeyú', NULL, NULL),
(980, 8, 'Yataití Calle', NULL, NULL),
(981, 9, 'Alarcón', NULL, NULL),
(982, 9, 'Alcaraz', NULL, NULL),
(983, 9, 'Alcaraz N.', NULL, NULL),
(984, 9, 'Alcaraz S.', NULL, NULL),
(985, 9, 'Aldea Asunción', NULL, NULL),
(986, 9, 'Aldea Brasilera', NULL, NULL),
(987, 9, 'Aldea Elgenfeld', NULL, NULL),
(988, 9, 'Aldea Grapschental', NULL, NULL),
(989, 9, 'Aldea Ma. Luisa', NULL, NULL),
(990, 9, 'Aldea Protestante', NULL, NULL),
(991, 9, 'Aldea Salto', NULL, NULL),
(992, 9, 'Aldea San Antonio (G)', NULL, NULL),
(993, 9, 'Aldea San Antonio (P)', NULL, NULL),
(994, 9, 'Aldea 19', NULL, NULL),
(995, 9, 'Aldea San Miguel', NULL, NULL),
(996, 9, 'Aldea San Rafael', NULL, NULL),
(997, 9, 'Aldea Spatzenkutter', NULL, NULL),
(998, 9, 'Aldea Sta. María', NULL, NULL),
(999, 9, 'Aldea Sta. Rosa', NULL, NULL),
(1000, 9, 'Aldea Valle María', NULL, NULL),
(1001, 9, 'Altamirano Sur', NULL, NULL),
(1002, 9, 'Antelo', NULL, NULL),
(1003, 9, 'Antonio Tomás', NULL, NULL),
(1004, 9, 'Aranguren', NULL, NULL),
(1005, 9, 'Arroyo Barú', NULL, NULL),
(1006, 9, 'Arroyo Burgos', NULL, NULL),
(1007, 9, 'Arroyo Clé', NULL, NULL),
(1008, 9, 'Arroyo Corralito', NULL, NULL),
(1009, 9, 'Arroyo del Medio', NULL, NULL),
(1010, 9, 'Arroyo Maturrango', NULL, NULL),
(1011, 9, 'Arroyo Palo Seco', NULL, NULL),
(1012, 9, 'Banderas', NULL, NULL),
(1013, 9, 'Basavilbaso', NULL, NULL),
(1014, 9, 'Betbeder', NULL, NULL),
(1015, 9, 'Bovril', NULL, NULL),
(1016, 9, 'Caseros', NULL, NULL),
(1017, 9, 'Ceibas', NULL, NULL),
(1018, 9, 'Cerrito', NULL, NULL),
(1019, 9, 'Chajarí', NULL, NULL),
(1020, 9, 'Chilcas', NULL, NULL),
(1021, 9, 'Clodomiro Ledesma', NULL, NULL),
(1022, 9, 'Col. Alemana', NULL, NULL),
(1023, 9, 'Col. Avellaneda', NULL, NULL),
(1024, 9, 'Col. Avigdor', NULL, NULL),
(1025, 9, 'Col. Ayuí', NULL, NULL),
(1026, 9, 'Col. Baylina', NULL, NULL),
(1027, 9, 'Col. Carrasco', NULL, NULL),
(1028, 9, 'Col. Celina', NULL, NULL),
(1029, 9, 'Col. Cerrito', NULL, NULL),
(1030, 9, 'Col. Crespo', NULL, NULL),
(1031, 9, 'Col. Elia', NULL, NULL),
(1032, 9, 'Col. Ensayo', NULL, NULL),
(1033, 9, 'Col. Gral. Roca', NULL, NULL),
(1034, 9, 'Col. La Argentina', NULL, NULL),
(1035, 9, 'Col. Merou', NULL, NULL),
(1036, 9, 'Col. Oficial Nª3', NULL, NULL),
(1037, 9, 'Col. Oficial Nº13', NULL, NULL),
(1038, 9, 'Col. Oficial Nº14', NULL, NULL),
(1039, 9, 'Col. Oficial Nº5', NULL, NULL),
(1040, 9, 'Col. Reffino', NULL, NULL),
(1041, 9, 'Col. Tunas', NULL, NULL),
(1042, 9, 'Col. Viraró', NULL, NULL),
(1043, 9, 'Colón', NULL, NULL),
(1044, 9, 'Concepción del Uruguay', NULL, NULL),
(1045, 9, 'Concordia', NULL, NULL),
(1046, 9, 'Conscripto Bernardi', NULL, NULL),
(1047, 9, 'Costa Grande', NULL, NULL),
(1048, 9, 'Costa San Antonio', NULL, NULL),
(1049, 9, 'Costa Uruguay N.', NULL, NULL),
(1050, 9, 'Costa Uruguay S.', NULL, NULL),
(1051, 9, 'Crespo', NULL, NULL),
(1052, 9, 'Crucecitas 3ª', NULL, NULL),
(1053, 9, 'Crucecitas 7ª', NULL, NULL),
(1054, 9, 'Crucecitas 8ª', NULL, NULL),
(1055, 9, 'Cuchilla Redonda', NULL, NULL),
(1056, 9, 'Curtiembre', NULL, NULL),
(1057, 9, 'Diamante', NULL, NULL),
(1058, 9, 'Distrito 6º', NULL, NULL),
(1059, 9, 'Distrito Chañar', NULL, NULL),
(1060, 9, 'Distrito Chiqueros', NULL, NULL),
(1061, 9, 'Distrito Cuarto', NULL, NULL),
(1062, 9, 'Distrito Diego López', NULL, NULL),
(1063, 9, 'Distrito Pajonal', NULL, NULL),
(1064, 9, 'Distrito Sauce', NULL, NULL),
(1065, 9, 'Distrito Tala', NULL, NULL),
(1066, 9, 'Distrito Talitas', NULL, NULL),
(1067, 9, 'Don Cristóbal 1ª Sección', NULL, NULL),
(1068, 9, 'Don Cristóbal 2ª Sección', NULL, NULL),
(1069, 9, 'Durazno', NULL, NULL),
(1070, 9, 'El Cimarrón', NULL, NULL),
(1071, 9, 'El Gramillal', NULL, NULL),
(1072, 9, 'El Palenque', NULL, NULL),
(1073, 9, 'El Pingo', NULL, NULL),
(1074, 9, 'El Quebracho', NULL, NULL),
(1075, 9, 'El Redomón', NULL, NULL),
(1076, 9, 'El Solar', NULL, NULL),
(1077, 9, 'Enrique Carbo', NULL, NULL),
(1078, 9, '9', NULL, NULL),
(1079, 9, 'Espinillo N.', NULL, NULL),
(1080, 9, 'Estación Campos', NULL, NULL),
(1081, 9, 'Estación Escriña', NULL, NULL),
(1082, 9, 'Estación Lazo', NULL, NULL),
(1083, 9, 'Estación Raíces', NULL, NULL),
(1084, 9, 'Estación Yerúa', NULL, NULL),
(1085, 9, 'Estancia Grande', NULL, NULL),
(1086, 9, 'Estancia Líbaros', NULL, NULL),
(1087, 9, 'Estancia Racedo', NULL, NULL),
(1088, 9, 'Estancia Solá', NULL, NULL),
(1089, 9, 'Estancia Yuquerí', NULL, NULL),
(1090, 9, 'Estaquitas', NULL, NULL),
(1091, 9, 'Faustino M. Parera', NULL, NULL),
(1092, 9, 'Febre', NULL, NULL),
(1093, 9, 'Federación', NULL, NULL),
(1094, 9, 'Federal', NULL, NULL),
(1095, 9, 'Gdor. Echagüe', NULL, NULL),
(1096, 9, 'Gdor. Mansilla', NULL, NULL),
(1097, 9, 'Gilbert', NULL, NULL),
(1098, 9, 'González Calderón', NULL, NULL),
(1099, 9, 'Gral. Almada', NULL, NULL),
(1100, 9, 'Gral. Alvear', NULL, NULL),
(1101, 9, 'Gral. Campos', NULL, NULL),
(1102, 9, 'Gral. Galarza', NULL, NULL),
(1103, 9, 'Gral. Ramírez', NULL, NULL),
(1104, 9, 'Gualeguay', NULL, NULL),
(1105, 9, 'Gualeguaychú', NULL, NULL),
(1106, 9, 'Gualeguaycito', NULL, NULL),
(1107, 9, 'Guardamonte', NULL, NULL),
(1108, 9, 'Hambis', NULL, NULL),
(1109, 9, 'Hasenkamp', NULL, NULL),
(1110, 9, 'Hernandarias', NULL, NULL),
(1111, 9, 'Hernández', NULL, NULL),
(1112, 9, 'Herrera', NULL, NULL),
(1113, 9, 'Hinojal', NULL, NULL),
(1114, 9, 'Hocker', NULL, NULL),
(1115, 9, 'Ing. Sajaroff', NULL, NULL),
(1116, 9, 'Irazusta', NULL, NULL),
(1117, 9, 'Isletas', NULL, NULL),
(1118, 9, 'J.J De Urquiza', NULL, NULL),
(1119, 9, 'Jubileo', NULL, NULL),
(1120, 9, 'La Clarita', NULL, NULL),
(1121, 9, 'La Criolla', NULL, NULL),
(1122, 9, 'La Esmeralda', NULL, NULL),
(1123, 9, 'La Florida', NULL, NULL),
(1124, 9, 'La Fraternidad', NULL, NULL),
(1125, 9, 'La Hierra', NULL, NULL),
(1126, 9, 'La Ollita', NULL, NULL),
(1127, 9, 'La Paz', NULL, NULL),
(1128, 9, 'La Picada', NULL, NULL),
(1129, 9, 'La Providencia', NULL, NULL),
(1130, 9, 'La Verbena', NULL, NULL),
(1131, 9, 'Laguna Benítez', NULL, NULL),
(1132, 9, 'Larroque', NULL, NULL),
(1133, 9, 'Las Cuevas', NULL, NULL),
(1134, 9, 'Las Garzas', NULL, NULL),
(1135, 9, 'Las Guachas', NULL, NULL),
(1136, 9, 'Las Mercedes', NULL, NULL),
(1137, 9, 'Las Moscas', NULL, NULL),
(1138, 9, 'Las Mulitas', NULL, NULL),
(1139, 9, 'Las Toscas', NULL, NULL),
(1140, 9, 'Laurencena', NULL, NULL),
(1141, 9, 'Libertador San Martín', NULL, NULL),
(1142, 9, 'Loma Limpia', NULL, NULL),
(1143, 9, 'Los Ceibos', NULL, NULL),
(1144, 9, 'Los Charruas', NULL, NULL),
(1145, 9, 'Los Conquistadores', NULL, NULL),
(1146, 9, 'Lucas González', NULL, NULL),
(1147, 9, 'Lucas N.', NULL, NULL),
(1148, 9, 'Lucas S. 1ª', NULL, NULL),
(1149, 9, 'Lucas S. 2ª', NULL, NULL),
(1150, 9, 'Maciá', NULL, NULL),
(1151, 9, 'María Grande', NULL, NULL),
(1152, 9, 'María Grande 2ª', NULL, NULL),
(1153, 9, 'Médanos', NULL, NULL),
(1154, 9, 'Mojones N.', NULL, NULL),
(1155, 9, 'Mojones S.', NULL, NULL),
(1156, 9, 'Molino Doll', NULL, NULL),
(1157, 9, 'Monte Redondo', NULL, NULL),
(1158, 9, 'Montoya', NULL, NULL),
(1159, 9, 'Mulas Grandes', NULL, NULL),
(1160, 9, 'Ñancay', NULL, NULL),
(1161, 9, 'Nogoyá', NULL, NULL),
(1162, 9, 'Nueva Escocia', NULL, NULL),
(1163, 9, 'Nueva Vizcaya', NULL, NULL),
(1164, 9, 'Ombú', NULL, NULL),
(1165, 9, 'Oro Verde', NULL, NULL),
(1166, 9, 'Paraná', NULL, NULL),
(1167, 9, 'Pasaje Guayaquil', NULL, NULL),
(1168, 9, 'Pasaje Las Tunas', NULL, NULL),
(1169, 9, 'Paso de La Arena', NULL, NULL),
(1170, 9, 'Paso de La Laguna', NULL, NULL),
(1171, 9, 'Paso de Las Piedras', NULL, NULL),
(1172, 9, 'Paso Duarte', NULL, NULL),
(1173, 9, 'Pastor Britos', NULL, NULL),
(1174, 9, 'Pedernal', NULL, NULL),
(1175, 9, 'Perdices', NULL, NULL),
(1176, 9, 'Picada Berón', NULL, NULL),
(1177, 9, 'Piedras Blancas', NULL, NULL),
(1178, 9, 'Primer Distrito Cuchilla', NULL, NULL),
(1179, 9, 'Primero de Mayo', NULL, NULL),
(1180, 9, 'Pronunciamiento', NULL, NULL),
(1181, 9, 'Pto. Algarrobo', NULL, NULL),
(1182, 9, 'Pto. Ibicuy', NULL, NULL),
(1183, 9, 'Pueblo Brugo', NULL, NULL),
(1184, 9, 'Pueblo Cazes', NULL, NULL),
(1185, 9, 'Pueblo Gral. Belgrano', NULL, NULL),
(1186, 9, 'Pueblo Liebig', NULL, NULL),
(1187, 9, 'Puerto Yeruá', NULL, NULL),
(1188, 9, 'Punta del Monte', NULL, NULL),
(1189, 9, 'Quebracho', NULL, NULL),
(1190, 9, 'Quinto Distrito', NULL, NULL),
(1191, 9, 'Raices Oeste', NULL, NULL),
(1192, 9, 'Rincón de Nogoyá', NULL, NULL),
(1193, 9, 'Rincón del Cinto', NULL, NULL),
(1194, 9, 'Rincón del Doll', NULL, NULL),
(1195, 9, 'Rincón del Gato', NULL, NULL),
(1196, 9, 'Rocamora', NULL, NULL),
(1197, 9, 'Rosario del Tala', NULL, NULL),
(1198, 9, 'San Benito', NULL, NULL),
(1199, 9, 'San Cipriano', NULL, NULL),
(1200, 9, 'San Ernesto', NULL, NULL),
(1201, 9, 'San Gustavo', NULL, NULL),
(1202, 9, 'San Jaime', NULL, NULL),
(1203, 9, 'San José', NULL, NULL),
(1204, 9, 'San José de Feliciano', NULL, NULL),
(1205, 9, 'San Justo', NULL, NULL),
(1206, 9, 'San Marcial', NULL, NULL),
(1207, 9, 'San Pedro', NULL, NULL),
(1208, 9, 'San Ramírez', NULL, NULL),
(1209, 9, 'San Ramón', NULL, NULL),
(1210, 9, 'San Roque', NULL, NULL),
(1211, 9, 'San Salvador', NULL, NULL),
(1212, 9, 'San Víctor', NULL, NULL),
(1213, 9, 'Santa Ana', NULL, NULL),
(1214, 9, 'Santa Anita', NULL, NULL),
(1215, 9, 'Santa Elena', NULL, NULL),
(1216, 9, 'Santa Lucía', NULL, NULL),
(1217, 9, 'Santa Luisa', NULL, NULL),
(1218, 9, 'Sauce de Luna', NULL, NULL),
(1219, 9, 'Sauce Montrull', NULL, NULL),
(1220, 9, 'Sauce Pinto', NULL, NULL),
(1221, 9, 'Sauce Sur', NULL, NULL),
(1222, 9, 'Seguí', NULL, NULL),
(1223, 9, 'Sir Leonard', NULL, NULL),
(1224, 9, 'Sosa', NULL, NULL),
(1225, 9, 'Tabossi', NULL, NULL),
(1226, 9, 'Tezanos Pinto', NULL, NULL),
(1227, 9, 'Ubajay', NULL, NULL),
(1228, 9, 'Urdinarrain', NULL, NULL),
(1229, 9, 'Veinte de Septiembre', NULL, NULL),
(1230, 9, 'Viale', NULL, NULL),
(1231, 9, 'Victoria', NULL, NULL),
(1232, 9, 'Villa Clara', NULL, NULL),
(1233, 9, 'Villa del Rosario', NULL, NULL),
(1234, 9, 'Villa Domínguez', NULL, NULL),
(1235, 9, 'Villa Elisa', NULL, NULL),
(1236, 9, 'Villa Fontana', NULL, NULL),
(1237, 9, 'Villa Gdor. Etchevehere', NULL, NULL),
(1238, 9, 'Villa Mantero', NULL, NULL),
(1239, 9, 'Villa Paranacito', NULL, NULL),
(1240, 9, 'Villa Urquiza', NULL, NULL),
(1241, 9, 'Villaguay', NULL, NULL),
(1242, 9, 'Walter Moss', NULL, NULL),
(1243, 9, 'Yacaré', NULL, NULL),
(1244, 9, 'Yeso Oeste', NULL, NULL),
(1245, 10, 'Buena Vista', NULL, NULL),
(1246, 10, 'Clorinda', NULL, NULL),
(1247, 10, 'Col. Pastoril', NULL, NULL),
(1248, 10, 'Cte. Fontana', NULL, NULL),
(1249, 10, 'El Colorado', NULL, NULL),
(1250, 10, 'El Espinillo', NULL, NULL),
(1251, 10, 'Estanislao Del Campo', NULL, NULL),
(1252, 10, '10', NULL, NULL),
(1253, 10, 'Fortín Lugones', NULL, NULL),
(1254, 10, 'Gral. Lucio V. Mansilla', NULL, NULL),
(1255, 10, 'Gral. Manuel Belgrano', NULL, NULL),
(1256, 10, 'Gral. Mosconi', NULL, NULL),
(1257, 10, 'Gran Guardia', NULL, NULL),
(1258, 10, 'Herradura', NULL, NULL),
(1259, 10, 'Ibarreta', NULL, NULL),
(1260, 10, 'Ing. Juárez', NULL, NULL),
(1261, 10, 'Laguna Blanca', NULL, NULL),
(1262, 10, 'Laguna Naick Neck', NULL, NULL),
(1263, 10, 'Laguna Yema', NULL, NULL),
(1264, 10, 'Las Lomitas', NULL, NULL),
(1265, 10, 'Los Chiriguanos', NULL, NULL),
(1266, 10, 'Mayor V. Villafañe', NULL, NULL),
(1267, 10, 'Misión San Fco.', NULL, NULL),
(1268, 10, 'Palo Santo', NULL, NULL),
(1269, 10, 'Pirané', NULL, NULL),
(1270, 10, 'Pozo del Maza', NULL, NULL),
(1271, 10, 'Riacho He-He', NULL, NULL),
(1272, 10, 'San Hilario', NULL, NULL),
(1273, 10, 'San Martín II', NULL, NULL),
(1274, 10, 'Siete Palmas', NULL, NULL),
(1275, 10, 'Subteniente Perín', NULL, NULL),
(1276, 10, 'Tres Lagunas', NULL, NULL),
(1277, 10, 'Villa Dos Trece', NULL, NULL),
(1278, 10, 'Villa Escolar', NULL, NULL),
(1279, 10, 'Villa Gral. Güemes', NULL, NULL),
(1280, 11, 'Abdon Castro Tolay', NULL, NULL),
(1281, 11, 'Abra Pampa', NULL, NULL),
(1282, 11, 'Abralaite', NULL, NULL),
(1283, 11, 'Aguas Calientes', NULL, NULL),
(1284, 11, 'Arrayanal', NULL, NULL),
(1285, 11, 'Barrios', NULL, NULL),
(1286, 11, 'Caimancito', NULL, NULL),
(1287, 11, 'Calilegua', NULL, NULL),
(1288, 11, 'Cangrejillos', NULL, NULL),
(1289, 11, 'Caspala', NULL, NULL),
(1290, 11, 'Catuá', NULL, NULL),
(1291, 11, 'Cieneguillas', NULL, NULL),
(1292, 11, 'Coranzulli', NULL, NULL),
(1293, 11, 'Cusi-Cusi', NULL, NULL),
(1294, 11, 'El Aguilar', NULL, NULL),
(1295, 11, 'El Carmen', NULL, NULL),
(1296, 11, 'El Cóndor', NULL, NULL),
(1297, 11, 'El Fuerte', NULL, NULL),
(1298, 11, 'El Piquete', NULL, NULL),
(1299, 11, 'El Talar', NULL, NULL),
(1300, 11, 'Fraile Pintado', NULL, NULL),
(1301, 11, 'Hipólito Yrigoyen', NULL, NULL),
(1302, 11, 'Huacalera', NULL, NULL),
(1303, 11, 'Humahuaca', NULL, NULL),
(1304, 11, 'La Esperanza', NULL, NULL),
(1305, 11, 'La Mendieta', NULL, NULL),
(1306, 11, 'La Quiaca', NULL, NULL),
(1307, 11, 'Ledesma', NULL, NULL),
(1308, 11, 'Libertador Gral. San Martin', NULL, NULL),
(1309, 11, 'Maimara', NULL, NULL),
(1310, 11, 'Mina Pirquitas', NULL, NULL),
(1311, 11, 'Monterrico', NULL, NULL),
(1312, 11, 'Palma Sola', NULL, NULL),
(1313, 11, 'Palpalá', NULL, NULL),
(1314, 11, 'Pampa Blanca', NULL, NULL),
(1315, 11, 'Pampichuela', NULL, NULL),
(1316, 11, 'Perico', NULL, NULL),
(1317, 11, 'Puesto del Marqués', NULL, NULL),
(1318, 11, 'Puesto Viejo', NULL, NULL),
(1319, 11, 'Pumahuasi', NULL, NULL),
(1320, 11, 'Purmamarca', NULL, NULL),
(1321, 11, 'Rinconada', NULL, NULL),
(1322, 11, 'Rodeitos', NULL, NULL),
(1323, 11, 'Rosario de Río Grande', NULL, NULL),
(1324, 11, 'San Antonio', NULL, NULL),
(1325, 11, 'San Francisco', NULL, NULL),
(1326, 11, 'San Pedro', NULL, NULL),
(1327, 11, 'San Rafael', NULL, NULL),
(1328, 11, 'San Salvador', NULL, NULL),
(1329, 11, 'Santa Ana', NULL, NULL),
(1330, 11, 'Santa Catalina', NULL, NULL),
(1331, 11, 'Santa Clara', NULL, NULL),
(1332, 11, 'Susques', NULL, NULL),
(1333, 11, 'Tilcara', NULL, NULL),
(1334, 11, 'Tres Cruces', NULL, NULL),
(1335, 11, 'Tumbaya', NULL, NULL),
(1336, 11, 'Valle Grande', NULL, NULL),
(1337, 11, 'Vinalito', NULL, NULL),
(1338, 11, 'Volcán', NULL, NULL),
(1339, 11, 'Yala', NULL, NULL),
(1340, 11, 'Yaví', NULL, NULL),
(1341, 11, 'Yuto', NULL, NULL),
(1342, 12, 'Abramo', NULL, NULL),
(1343, 12, 'Adolfo Van Praet', NULL, NULL),
(1344, 12, 'Agustoni', NULL, NULL),
(1345, 12, 'Algarrobo del Aguila', NULL, NULL),
(1346, 12, 'Alpachiri', NULL, NULL),
(1347, 12, 'Alta Italia', NULL, NULL),
(1348, 12, 'Anguil', NULL, NULL),
(1349, 12, 'Arata', NULL, NULL),
(1350, 12, 'Ataliva Roca', NULL, NULL),
(1351, 12, 'Bernardo Larroude', NULL, NULL),
(1352, 12, 'Bernasconi', NULL, NULL),
(1353, 12, 'Caleufú', NULL, NULL),
(1354, 12, 'Carro Quemado', NULL, NULL),
(1355, 12, 'Catriló', NULL, NULL),
(1356, 12, 'Ceballos', NULL, NULL),
(1357, 12, 'Chacharramendi', NULL, NULL),
(1358, 12, 'Col. Barón', NULL, NULL),
(1359, 12, 'Col. Santa María', NULL, NULL),
(1360, 12, 'Conhelo', NULL, NULL),
(1361, 12, 'Coronel Hilario Lagos', NULL, NULL),
(1362, 12, 'Cuchillo-Có', NULL, NULL),
(1363, 12, 'Doblas', NULL, NULL),
(1364, 12, 'Dorila', NULL, NULL),
(1365, 12, 'Eduardo Castex', NULL, NULL),
(1366, 12, 'Embajador Martini', NULL, NULL),
(1367, 12, 'Falucho', NULL, NULL),
(1368, 12, 'Gral. Acha', NULL, NULL),
(1369, 12, 'Gral. Manuel Campos', NULL, NULL),
(1370, 12, 'Gral. Pico', NULL, NULL),
(1371, 12, 'Guatraché', NULL, NULL),
(1372, 12, 'Ing. Luiggi', NULL, NULL),
(1373, 12, 'Intendente Alvear', NULL, NULL),
(1374, 12, 'Jacinto Arauz', NULL, NULL),
(1375, 12, 'La Adela', NULL, NULL),
(1376, 12, 'La Humada', NULL, NULL),
(1377, 12, 'La Maruja', NULL, NULL),
(1378, 12, '12', NULL, NULL),
(1379, 12, 'La Reforma', NULL, NULL),
(1380, 12, 'Limay Mahuida', NULL, NULL),
(1381, 12, 'Lonquimay', NULL, NULL),
(1382, 12, 'Loventuel', NULL, NULL),
(1383, 12, 'Luan Toro', NULL, NULL),
(1384, 12, 'Macachín', NULL, NULL),
(1385, 12, 'Maisonnave', NULL, NULL),
(1386, 12, 'Mauricio Mayer', NULL, NULL),
(1387, 12, 'Metileo', NULL, NULL),
(1388, 12, 'Miguel Cané', NULL, NULL),
(1389, 12, 'Miguel Riglos', NULL, NULL),
(1390, 12, 'Monte Nievas', NULL, NULL),
(1391, 12, 'Parera', NULL, NULL),
(1392, 12, 'Perú', NULL, NULL),
(1393, 12, 'Pichi-Huinca', NULL, NULL),
(1394, 12, 'Puelches', NULL, NULL),
(1395, 12, 'Puelén', NULL, NULL),
(1396, 12, 'Quehue', NULL, NULL),
(1397, 12, 'Quemú Quemú', NULL, NULL),
(1398, 12, 'Quetrequén', NULL, NULL),
(1399, 12, 'Rancul', NULL, NULL),
(1400, 12, 'Realicó', NULL, NULL),
(1401, 12, 'Relmo', NULL, NULL),
(1402, 12, 'Rolón', NULL, NULL),
(1403, 12, 'Rucanelo', NULL, NULL);
INSERT INTO `localidades` (`id`, `provincias_id`, `localidad`, `created_at`, `updated_at`) VALUES
(1404, 12, 'Sarah', NULL, NULL),
(1405, 12, 'Speluzzi', NULL, NULL),
(1406, 12, 'Sta. Isabel', NULL, NULL),
(1407, 12, 'Sta. Rosa', NULL, NULL),
(1408, 12, 'Sta. Teresa', NULL, NULL),
(1409, 12, 'Telén', NULL, NULL),
(1410, 12, 'Toay', NULL, NULL),
(1411, 12, 'Tomas M. de Anchorena', NULL, NULL),
(1412, 12, 'Trenel', NULL, NULL),
(1413, 12, 'Unanue', NULL, NULL),
(1414, 12, 'Uriburu', NULL, NULL),
(1415, 12, 'Veinticinco de Mayo', NULL, NULL),
(1416, 12, 'Vertiz', NULL, NULL),
(1417, 12, 'Victorica', NULL, NULL),
(1418, 12, 'Villa Mirasol', NULL, NULL),
(1419, 12, 'Winifreda', NULL, NULL),
(1420, 13, 'Arauco', NULL, NULL),
(1421, 13, 'Capital', NULL, NULL),
(1422, 13, 'Castro Barros', NULL, NULL),
(1423, 13, 'Chamical', NULL, NULL),
(1424, 13, 'Chilecito', NULL, NULL),
(1425, 13, 'Coronel F. Varela', NULL, NULL),
(1426, 13, 'Famatina', NULL, NULL),
(1427, 13, 'Gral. A.V.Peñaloza', NULL, NULL),
(1428, 13, 'Gral. Belgrano', NULL, NULL),
(1429, 13, 'Gral. J.F. Quiroga', NULL, NULL),
(1430, 13, 'Gral. Lamadrid', NULL, NULL),
(1431, 13, 'Gral. Ocampo', NULL, NULL),
(1432, 13, 'Gral. San Martín', NULL, NULL),
(1433, 13, 'Independencia', NULL, NULL),
(1434, 13, 'Rosario Penaloza', NULL, NULL),
(1435, 13, 'San Blas de Los Sauces', NULL, NULL),
(1436, 13, 'Sanagasta', NULL, NULL),
(1437, 13, 'Vinchina', NULL, NULL),
(1438, 14, 'Capital', NULL, NULL),
(1439, 14, 'Chacras de Coria', NULL, NULL),
(1440, 14, 'Dorrego', NULL, NULL),
(1441, 14, 'Gllen', NULL, NULL),
(1442, 14, 'Godoy Cruz', NULL, NULL),
(1443, 14, 'Gral. Alvear', NULL, NULL),
(1444, 14, 'Guaymallén', NULL, NULL),
(1445, 14, 'Junín', NULL, NULL),
(1446, 14, 'La Paz', NULL, NULL),
(1447, 14, 'Las Heras', NULL, NULL),
(1448, 14, 'Lavalle', NULL, NULL),
(1449, 14, 'Luján', NULL, NULL),
(1450, 14, 'Luján De Cuyo', NULL, NULL),
(1451, 14, 'Maipú', NULL, NULL),
(1452, 14, 'Malargüe', NULL, NULL),
(1453, 14, 'Rivadavia', NULL, NULL),
(1454, 14, 'San Carlos', NULL, NULL),
(1455, 14, 'San Martín', NULL, NULL),
(1456, 14, 'San Rafael', NULL, NULL),
(1457, 14, 'Sta. Rosa', NULL, NULL),
(1458, 14, 'Tunuyán', NULL, NULL),
(1459, 14, 'Tupungato', NULL, NULL),
(1460, 14, 'Villa Nueva', NULL, NULL),
(1461, 15, 'Alba Posse', NULL, NULL),
(1462, 15, 'Almafuerte', NULL, NULL),
(1463, 15, 'Apóstoles', NULL, NULL),
(1464, 15, 'Aristóbulo Del Valle', NULL, NULL),
(1465, 15, 'Arroyo Del Medio', NULL, NULL),
(1466, 15, 'Azara', NULL, NULL),
(1467, 15, 'Bdo. De Irigoyen', NULL, NULL),
(1468, 15, 'Bonpland', NULL, NULL),
(1469, 15, 'Caá Yari', NULL, NULL),
(1470, 15, 'Campo Grande', NULL, NULL),
(1471, 15, 'Campo Ramón', NULL, NULL),
(1472, 15, 'Campo Viera', NULL, NULL),
(1473, 15, 'Candelaria', NULL, NULL),
(1474, 15, 'Capioví', NULL, NULL),
(1475, 15, 'Caraguatay', NULL, NULL),
(1476, 15, 'Cdte. Guacurarí', NULL, NULL),
(1477, 15, 'Cerro Azul', NULL, NULL),
(1478, 15, 'Cerro Corá', NULL, NULL),
(1479, 15, 'Col. Alberdi', NULL, NULL),
(1480, 15, 'Col. Aurora', NULL, NULL),
(1481, 15, 'Col. Delicia', NULL, NULL),
(1482, 15, 'Col. Polana', NULL, NULL),
(1483, 15, 'Col. Victoria', NULL, NULL),
(1484, 15, 'Col. Wanda', NULL, NULL),
(1485, 15, 'Concepción De La Sierra', NULL, NULL),
(1486, 15, 'Corpus', NULL, NULL),
(1487, 15, 'Dos Arroyos', NULL, NULL),
(1488, 15, 'Dos de Mayo', NULL, NULL),
(1489, 15, 'El Alcázar', NULL, NULL),
(1490, 15, 'El Dorado', NULL, NULL),
(1491, 15, 'El Soberbio', NULL, NULL),
(1492, 15, 'Esperanza', NULL, NULL),
(1493, 15, 'F. Ameghino', NULL, NULL),
(1494, 15, 'Fachinal', NULL, NULL),
(1495, 15, 'Garuhapé', NULL, NULL),
(1496, 15, 'Garupá', NULL, NULL),
(1497, 15, 'Gdor. López', NULL, NULL),
(1498, 15, 'Gdor. Roca', NULL, NULL),
(1499, 15, 'Gral. Alvear', NULL, NULL),
(1500, 15, 'Gral. Urquiza', NULL, NULL),
(1501, 15, 'Guaraní', NULL, NULL),
(1502, 15, 'H. Yrigoyen', NULL, NULL),
(1503, 15, 'Iguazú', NULL, NULL),
(1504, 15, 'Itacaruaré', NULL, NULL),
(1505, 15, 'Jardín América', NULL, NULL),
(1506, 15, 'Leandro N. Alem', NULL, NULL),
(1507, 15, 'Libertad', NULL, NULL),
(1508, 15, 'Loreto', NULL, NULL),
(1509, 15, 'Los Helechos', NULL, NULL),
(1510, 15, 'Mártires', NULL, NULL),
(1511, 15, '15', NULL, NULL),
(1512, 15, 'Mojón Grande', NULL, NULL),
(1513, 15, 'Montecarlo', NULL, NULL),
(1514, 15, 'Nueve de Julio', NULL, NULL),
(1515, 15, 'Oberá', NULL, NULL),
(1516, 15, 'Olegario V. Andrade', NULL, NULL),
(1517, 15, 'Panambí', NULL, NULL),
(1518, 15, 'Posadas', NULL, NULL),
(1519, 15, 'Profundidad', NULL, NULL),
(1520, 15, 'Pto. Iguazú', NULL, NULL),
(1521, 15, 'Pto. Leoni', NULL, NULL),
(1522, 15, 'Pto. Piray', NULL, NULL),
(1523, 15, 'Pto. Rico', NULL, NULL),
(1524, 15, 'Ruiz de Montoya', NULL, NULL),
(1525, 15, 'San Antonio', NULL, NULL),
(1526, 15, 'San Ignacio', NULL, NULL),
(1527, 15, 'San Javier', NULL, NULL),
(1528, 15, 'San José', NULL, NULL),
(1529, 15, 'San Martín', NULL, NULL),
(1530, 15, 'San Pedro', NULL, NULL),
(1531, 15, 'San Vicente', NULL, NULL),
(1532, 15, 'Santiago De Liniers', NULL, NULL),
(1533, 15, 'Santo Pipo', NULL, NULL),
(1534, 15, 'Sta. Ana', NULL, NULL),
(1535, 15, 'Sta. María', NULL, NULL),
(1536, 15, 'Tres Capones', NULL, NULL),
(1537, 15, 'Veinticinco de Mayo', NULL, NULL),
(1538, 15, 'Wanda', NULL, NULL),
(1539, 16, 'Aguada San Roque', NULL, NULL),
(1540, 16, 'Aluminé', NULL, NULL),
(1541, 16, 'Andacollo', NULL, NULL),
(1542, 16, 'Añelo', NULL, NULL),
(1543, 16, 'Bajada del Agrio', NULL, NULL),
(1544, 16, 'Barrancas', NULL, NULL),
(1545, 16, 'Buta Ranquil', NULL, NULL),
(1546, 16, 'Capital', NULL, NULL),
(1547, 16, 'Caviahué', NULL, NULL),
(1548, 16, 'Centenario', NULL, NULL),
(1549, 16, 'Chorriaca', NULL, NULL),
(1550, 16, 'Chos Malal', NULL, NULL),
(1551, 16, 'Cipolletti', NULL, NULL),
(1552, 16, 'Covunco Abajo', NULL, NULL),
(1553, 16, 'Coyuco Cochico', NULL, NULL),
(1554, 16, 'Cutral Có', NULL, NULL),
(1555, 16, 'El Cholar', NULL, NULL),
(1556, 16, 'El Huecú', NULL, NULL),
(1557, 16, 'El Sauce', NULL, NULL),
(1558, 16, 'Guañacos', NULL, NULL),
(1559, 16, 'Huinganco', NULL, NULL),
(1560, 16, 'Las Coloradas', NULL, NULL),
(1561, 16, 'Las Lajas', NULL, NULL),
(1562, 16, 'Las Ovejas', NULL, NULL),
(1563, 16, 'Loncopué', NULL, NULL),
(1564, 16, 'Los Catutos', NULL, NULL),
(1565, 16, 'Los Chihuidos', NULL, NULL),
(1566, 16, 'Los Miches', NULL, NULL),
(1567, 16, 'Manzano Amargo', NULL, NULL),
(1568, 16, '16', NULL, NULL),
(1569, 16, 'Octavio Pico', NULL, NULL),
(1570, 16, 'Paso Aguerre', NULL, NULL),
(1571, 16, 'Picún Leufú', NULL, NULL),
(1572, 16, 'Piedra del Aguila', NULL, NULL),
(1573, 16, 'Pilo Lil', NULL, NULL),
(1574, 16, 'Plaza Huincul', NULL, NULL),
(1575, 16, 'Plottier', NULL, NULL),
(1576, 16, 'Quili Malal', NULL, NULL),
(1577, 16, 'Ramón Castro', NULL, NULL),
(1578, 16, 'Rincón de Los Sauces', NULL, NULL),
(1579, 16, 'San Martín de Los Andes', NULL, NULL),
(1580, 16, 'San Patricio del Chañar', NULL, NULL),
(1581, 16, 'Santo Tomás', NULL, NULL),
(1582, 16, 'Sauzal Bonito', NULL, NULL),
(1583, 16, 'Senillosa', NULL, NULL),
(1584, 16, 'Taquimilán', NULL, NULL),
(1585, 16, 'Tricao Malal', NULL, NULL),
(1586, 16, 'Varvarco', NULL, NULL),
(1587, 16, 'Villa Curí Leuvu', NULL, NULL),
(1588, 16, 'Villa del Nahueve', NULL, NULL),
(1589, 16, 'Villa del Puente Picún Leuvú', NULL, NULL),
(1590, 16, 'Villa El Chocón', NULL, NULL),
(1591, 16, 'Villa La Angostura', NULL, NULL),
(1592, 16, 'Villa Pehuenia', NULL, NULL),
(1593, 16, 'Villa Traful', NULL, NULL),
(1594, 16, 'Vista Alegre', NULL, NULL),
(1595, 16, 'Zapala', NULL, NULL),
(1596, 17, 'Aguada Cecilio', NULL, NULL),
(1597, 17, 'Aguada de Guerra', NULL, NULL),
(1598, 17, 'Allén', NULL, NULL),
(1599, 17, 'Arroyo de La Ventana', NULL, NULL),
(1600, 17, 'Arroyo Los Berros', NULL, NULL),
(1601, 17, 'Bariloche', NULL, NULL),
(1602, 17, 'Calte. Cordero', NULL, NULL),
(1603, 17, 'Campo Grande', NULL, NULL),
(1604, 17, 'Catriel', NULL, NULL),
(1605, 17, 'Cerro Policía', NULL, NULL),
(1606, 17, 'Cervantes', NULL, NULL),
(1607, 17, 'Chelforo', NULL, NULL),
(1608, 17, 'Chimpay', NULL, NULL),
(1609, 17, 'Chinchinales', NULL, NULL),
(1610, 17, 'Chipauquil', NULL, NULL),
(1611, 17, 'Choele Choel', NULL, NULL),
(1612, 17, 'Cinco Saltos', NULL, NULL),
(1613, 17, 'Cipolletti', NULL, NULL),
(1614, 17, 'Clemente Onelli', NULL, NULL),
(1615, 17, 'Colán Conhue', NULL, NULL),
(1616, 17, 'Comallo', NULL, NULL),
(1617, 17, 'Comicó', NULL, NULL),
(1618, 17, 'Cona Niyeu', NULL, NULL),
(1619, 17, 'Coronel Belisle', NULL, NULL),
(1620, 17, 'Cubanea', NULL, NULL),
(1621, 17, 'Darwin', NULL, NULL),
(1622, 17, 'Dina Huapi', NULL, NULL),
(1623, 17, 'El Bolsón', NULL, NULL),
(1624, 17, 'El Caín', NULL, NULL),
(1625, 17, 'El Manso', NULL, NULL),
(1626, 17, 'Gral. Conesa', NULL, NULL),
(1627, 17, 'Gral. Enrique Godoy', NULL, NULL),
(1628, 17, 'Gral. Fernandez Oro', NULL, NULL),
(1629, 17, 'Gral. Roca', NULL, NULL),
(1630, 17, 'Guardia Mitre', NULL, NULL),
(1631, 17, 'Ing. Huergo', NULL, NULL),
(1632, 17, 'Ing. Jacobacci', NULL, NULL),
(1633, 17, 'Laguna Blanca', NULL, NULL),
(1634, 17, 'Lamarque', NULL, NULL),
(1635, 17, 'Las Grutas', NULL, NULL),
(1636, 17, 'Los Menucos', NULL, NULL),
(1637, 17, 'Luis Beltrán', NULL, NULL),
(1638, 17, 'Mainqué', NULL, NULL),
(1639, 17, 'Mamuel Choique', NULL, NULL),
(1640, 17, 'Maquinchao', NULL, NULL),
(1641, 17, 'Mencué', NULL, NULL),
(1642, 17, 'Mtro. Ramos Mexia', NULL, NULL),
(1643, 17, 'Nahuel Niyeu', NULL, NULL),
(1644, 17, 'Naupa Huen', NULL, NULL),
(1645, 17, 'Ñorquinco', NULL, NULL),
(1646, 17, 'Ojos de Agua', NULL, NULL),
(1647, 17, 'Paso de Agua', NULL, NULL),
(1648, 17, 'Paso Flores', NULL, NULL),
(1649, 17, 'Peñas Blancas', NULL, NULL),
(1650, 17, 'Pichi Mahuida', NULL, NULL),
(1651, 17, 'Pilcaniyeu', NULL, NULL),
(1652, 17, 'Pomona', NULL, NULL),
(1653, 17, 'Prahuaniyeu', NULL, NULL),
(1654, 17, 'Rincón Treneta', NULL, NULL),
(1655, 17, 'Río Chico', NULL, NULL),
(1656, 17, 'Río Colorado', NULL, NULL),
(1657, 17, 'Roca', NULL, NULL),
(1658, 17, 'San Antonio Oeste', NULL, NULL),
(1659, 17, 'San Javier', NULL, NULL),
(1660, 17, 'Sierra Colorada', NULL, NULL),
(1661, 17, 'Sierra Grande', NULL, NULL),
(1662, 17, 'Sierra Pailemán', NULL, NULL),
(1663, 17, 'Valcheta', NULL, NULL),
(1664, 17, 'Valle Azul', NULL, NULL),
(1665, 17, 'Viedma', NULL, NULL),
(1666, 17, 'Villa Llanquín', NULL, NULL),
(1667, 17, 'Villa Mascardi', NULL, NULL),
(1668, 17, 'Villa Regina', NULL, NULL),
(1669, 17, 'Yaminué', NULL, NULL),
(1670, 18, 'A. Saravia', NULL, NULL),
(1671, 18, 'Aguaray', NULL, NULL),
(1672, 18, 'Angastaco', NULL, NULL),
(1673, 18, 'Animaná', NULL, NULL),
(1674, 18, 'Cachi', NULL, NULL),
(1675, 18, 'Cafayate', NULL, NULL),
(1676, 18, 'Campo Quijano', NULL, NULL),
(1677, 18, 'Campo Santo', NULL, NULL),
(1678, 18, 'Capital', NULL, NULL),
(1679, 18, 'Cerrillos', NULL, NULL),
(1680, 18, 'Chicoana', NULL, NULL),
(1681, 18, 'Col. Sta. Rosa', NULL, NULL),
(1682, 18, 'Coronel Moldes', NULL, NULL),
(1683, 18, 'El Bordo', NULL, NULL),
(1684, 18, 'El Carril', NULL, NULL),
(1685, 18, 'El Galpón', NULL, NULL),
(1686, 18, 'El Jardín', NULL, NULL),
(1687, 18, 'El Potrero', NULL, NULL),
(1688, 18, 'El Quebrachal', NULL, NULL),
(1689, 18, 'El Tala', NULL, NULL),
(1690, 18, 'Embarcación', NULL, NULL),
(1691, 18, 'Gral. Ballivian', NULL, NULL),
(1692, 18, 'Gral. Güemes', NULL, NULL),
(1693, 18, 'Gral. Mosconi', NULL, NULL),
(1694, 18, 'Gral. Pizarro', NULL, NULL),
(1695, 18, 'Guachipas', NULL, NULL),
(1696, 18, 'Hipólito Yrigoyen', NULL, NULL),
(1697, 18, 'Iruyá', NULL, NULL),
(1698, 18, 'Isla De Cañas', NULL, NULL),
(1699, 18, 'J. V. Gonzalez', NULL, NULL),
(1700, 18, 'La Caldera', NULL, NULL),
(1701, 18, 'La Candelaria', NULL, NULL),
(1702, 18, 'La Merced', NULL, NULL),
(1703, 18, 'La Poma', NULL, NULL),
(1704, 18, 'La Viña', NULL, NULL),
(1705, 18, 'Las Lajitas', NULL, NULL),
(1706, 18, 'Los Toldos', NULL, NULL),
(1707, 18, 'Metán', NULL, NULL),
(1708, 18, 'Molinos', NULL, NULL),
(1709, 18, 'Nazareno', NULL, NULL),
(1710, 18, 'Orán', NULL, NULL),
(1711, 18, 'Payogasta', NULL, NULL),
(1712, 18, 'Pichanal', NULL, NULL),
(1713, 18, 'Prof. S. Mazza', NULL, NULL),
(1714, 18, 'Río Piedras', NULL, NULL),
(1715, 18, 'Rivadavia Banda Norte', NULL, NULL),
(1716, 18, 'Rivadavia Banda Sur', NULL, NULL),
(1717, 18, 'Rosario de La Frontera', NULL, NULL),
(1718, 18, 'Rosario de Lerma', NULL, NULL),
(1719, 18, 'Saclantás', NULL, NULL),
(1720, 18, '18', NULL, NULL),
(1721, 18, 'San Antonio', NULL, NULL),
(1722, 18, 'San Carlos', NULL, NULL),
(1723, 18, 'San José De Metán', NULL, NULL),
(1724, 18, 'San Ramón', NULL, NULL),
(1725, 18, 'Santa Victoria E.', NULL, NULL),
(1726, 18, 'Santa Victoria O.', NULL, NULL),
(1727, 18, 'Tartagal', NULL, NULL),
(1728, 18, 'Tolar Grande', NULL, NULL),
(1729, 18, 'Urundel', NULL, NULL),
(1730, 18, 'Vaqueros', NULL, NULL),
(1731, 18, 'Villa San Lorenzo', NULL, NULL),
(1732, 19, 'Albardón', NULL, NULL),
(1733, 19, 'Angaco', NULL, NULL),
(1734, 19, 'Calingasta', NULL, NULL),
(1735, 19, 'Capital', NULL, NULL),
(1736, 19, 'Caucete', NULL, NULL),
(1737, 19, 'Chimbas', NULL, NULL),
(1738, 19, 'Iglesia', NULL, NULL),
(1739, 19, 'Jachal', NULL, NULL),
(1740, 19, 'Nueve de Julio', NULL, NULL),
(1741, 19, 'Pocito', NULL, NULL),
(1742, 19, 'Rawson', NULL, NULL),
(1743, 19, 'Rivadavia', NULL, NULL),
(1744, 19, '19', NULL, NULL),
(1745, 19, 'San Martín', NULL, NULL),
(1746, 19, 'Santa Lucía', NULL, NULL),
(1747, 19, 'Sarmiento', NULL, NULL),
(1748, 19, 'Ullum', NULL, NULL),
(1749, 19, 'Valle Fértil', NULL, NULL),
(1750, 19, 'Veinticinco de Mayo', NULL, NULL),
(1751, 19, 'Zonda', NULL, NULL),
(1752, 20, 'Alto Pelado', NULL, NULL),
(1753, 20, 'Alto Pencoso', NULL, NULL),
(1754, 20, 'Anchorena', NULL, NULL),
(1755, 20, 'Arizona', NULL, NULL),
(1756, 20, 'Bagual', NULL, NULL),
(1757, 20, 'Balde', NULL, NULL),
(1758, 20, 'Batavia', NULL, NULL),
(1759, 20, 'Beazley', NULL, NULL),
(1760, 20, 'Buena Esperanza', NULL, NULL),
(1761, 20, 'Candelaria', NULL, NULL),
(1762, 20, 'Capital', NULL, NULL),
(1763, 20, 'Carolina', NULL, NULL),
(1764, 20, 'Carpintería', NULL, NULL),
(1765, 20, 'Concarán', NULL, NULL),
(1766, 20, 'Cortaderas', NULL, NULL),
(1767, 20, 'El Morro', NULL, NULL),
(1768, 20, 'El Trapiche', NULL, NULL),
(1769, 20, 'El Volcán', NULL, NULL),
(1770, 20, 'Fortín El Patria', NULL, NULL),
(1771, 20, 'Fortuna', NULL, NULL),
(1772, 20, 'Fraga', NULL, NULL),
(1773, 20, 'Juan Jorba', NULL, NULL),
(1774, 20, 'Juan Llerena', NULL, NULL),
(1775, 20, 'Juana Koslay', NULL, NULL),
(1776, 20, 'Justo Daract', NULL, NULL),
(1777, 20, 'La Calera', NULL, NULL),
(1778, 20, 'La Florida', NULL, NULL),
(1779, 20, 'La Punilla', NULL, NULL),
(1780, 20, 'La Toma', NULL, NULL),
(1781, 20, 'Lafinur', NULL, NULL),
(1782, 20, 'Las Aguadas', NULL, NULL),
(1783, 20, 'Las Chacras', NULL, NULL),
(1784, 20, 'Las Lagunas', NULL, NULL),
(1785, 20, 'Las Vertientes', NULL, NULL),
(1786, 20, 'Lavaisse', NULL, NULL),
(1787, 20, 'Leandro N. Alem', NULL, NULL),
(1788, 20, 'Los Molles', NULL, NULL),
(1789, 20, 'Luján', NULL, NULL),
(1790, 20, 'Mercedes', NULL, NULL),
(1791, 20, 'Merlo', NULL, NULL),
(1792, 20, 'Naschel', NULL, NULL),
(1793, 20, 'Navia', NULL, NULL),
(1794, 20, 'Nogolí', NULL, NULL),
(1795, 20, 'Nueva Galia', NULL, NULL),
(1796, 20, 'Papagayos', NULL, NULL),
(1797, 20, 'Paso Grande', NULL, NULL),
(1798, 20, 'Potrero de Los Funes', NULL, NULL),
(1799, 20, 'Quines', NULL, NULL),
(1800, 20, 'Renca', NULL, NULL),
(1801, 20, 'Saladillo', NULL, NULL),
(1802, 20, 'San Francisco', NULL, NULL),
(1803, 20, 'San Gerónimo', NULL, NULL),
(1804, 20, 'San Martín', NULL, NULL),
(1805, 20, 'San Pablo', NULL, NULL),
(1806, 20, 'Santa Rosa de Conlara', NULL, NULL),
(1807, 20, 'Talita', NULL, NULL),
(1808, 20, 'Tilisarao', NULL, NULL),
(1809, 20, 'Unión', NULL, NULL),
(1810, 20, 'Villa de La Quebrada', NULL, NULL),
(1811, 20, 'Villa de Praga', NULL, NULL),
(1812, 20, 'Villa del Carmen', NULL, NULL),
(1813, 20, 'Villa Gral. Roca', NULL, NULL),
(1814, 20, 'Villa Larca', NULL, NULL),
(1815, 20, 'Villa Mercedes', NULL, NULL),
(1816, 20, 'Zanjitas', NULL, NULL),
(1817, 21, 'Calafate', NULL, NULL),
(1818, 21, 'Caleta Olivia', NULL, NULL),
(1819, 21, 'Cañadón Seco', NULL, NULL),
(1820, 21, 'Comandante Piedrabuena', NULL, NULL),
(1821, 21, 'El Calafate', NULL, NULL),
(1822, 21, 'El Chaltén', NULL, NULL),
(1823, 21, 'Gdor. Gregores', NULL, NULL),
(1824, 21, 'Hipólito Yrigoyen', NULL, NULL),
(1825, 21, 'Jaramillo', NULL, NULL),
(1826, 21, 'Koluel Kaike', NULL, NULL),
(1827, 21, 'Las Heras', NULL, NULL),
(1828, 21, 'Los Antiguos', NULL, NULL),
(1829, 21, 'Perito Moreno', NULL, NULL),
(1830, 21, 'Pico Truncado', NULL, NULL),
(1831, 21, 'Pto. Deseado', NULL, NULL),
(1832, 21, 'Pto. San Julián', NULL, NULL),
(1833, 21, 'Pto. 21', NULL, NULL),
(1834, 21, 'Río Cuarto', NULL, NULL),
(1835, 21, 'Río Gallegos', NULL, NULL),
(1836, 21, 'Río Turbio', NULL, NULL),
(1837, 21, 'Tres Lagos', NULL, NULL),
(1838, 21, 'Veintiocho De Noviembre', NULL, NULL),
(1839, 22, 'Aarón Castellanos', NULL, NULL),
(1840, 22, 'Acebal', NULL, NULL),
(1841, 22, 'Aguará Grande', NULL, NULL),
(1842, 22, 'Albarellos', NULL, NULL),
(1843, 22, 'Alcorta', NULL, NULL),
(1844, 22, 'Aldao', NULL, NULL),
(1845, 22, 'Alejandra', NULL, NULL),
(1846, 22, 'Álvarez', NULL, NULL),
(1847, 22, 'Ambrosetti', NULL, NULL),
(1848, 22, 'Amenábar', NULL, NULL),
(1849, 22, 'Angélica', NULL, NULL),
(1850, 22, 'Angeloni', NULL, NULL),
(1851, 22, 'Arequito', NULL, NULL),
(1852, 22, 'Arminda', NULL, NULL),
(1853, 22, 'Armstrong', NULL, NULL),
(1854, 22, 'Arocena', NULL, NULL),
(1855, 22, 'Arroyo Aguiar', NULL, NULL),
(1856, 22, 'Arroyo Ceibal', NULL, NULL),
(1857, 22, 'Arroyo Leyes', NULL, NULL),
(1858, 22, 'Arroyo Seco', NULL, NULL),
(1859, 22, 'Arrufó', NULL, NULL),
(1860, 22, 'Arteaga', NULL, NULL),
(1861, 22, 'Ataliva', NULL, NULL),
(1862, 22, 'Aurelia', NULL, NULL),
(1863, 22, 'Avellaneda', NULL, NULL),
(1864, 22, 'Barrancas', NULL, NULL),
(1865, 22, 'Bauer Y Sigel', NULL, NULL),
(1866, 22, 'Bella Italia', NULL, NULL),
(1867, 22, 'Berabevú', NULL, NULL),
(1868, 22, 'Berna', NULL, NULL),
(1869, 22, 'Bernardo de Irigoyen', NULL, NULL),
(1870, 22, 'Bigand', NULL, NULL),
(1871, 22, 'Bombal', NULL, NULL),
(1872, 22, 'Bouquet', NULL, NULL),
(1873, 22, 'Bustinza', NULL, NULL),
(1874, 22, 'Cabal', NULL, NULL),
(1875, 22, 'Cacique Ariacaiquin', NULL, NULL),
(1876, 22, 'Cafferata', NULL, NULL),
(1877, 22, 'Calchaquí', NULL, NULL),
(1878, 22, 'Campo Andino', NULL, NULL),
(1879, 22, 'Campo Piaggio', NULL, NULL),
(1880, 22, 'Cañada de Gómez', NULL, NULL),
(1881, 22, 'Cañada del Ucle', NULL, NULL),
(1882, 22, 'Cañada Rica', NULL, NULL),
(1883, 22, 'Cañada Rosquín', NULL, NULL),
(1884, 22, 'Candioti', NULL, NULL),
(1885, 22, 'Capital', NULL, NULL),
(1886, 22, 'Capitán Bermúdez', NULL, NULL),
(1887, 22, 'Capivara', NULL, NULL),
(1888, 22, 'Carcarañá', NULL, NULL),
(1889, 22, 'Carlos Pellegrini', NULL, NULL),
(1890, 22, 'Carmen', NULL, NULL),
(1891, 22, 'Carmen Del Sauce', NULL, NULL),
(1892, 22, 'Carreras', NULL, NULL),
(1893, 22, 'Carrizales', NULL, NULL),
(1894, 22, 'Casalegno', NULL, NULL),
(1895, 22, 'Casas', NULL, NULL),
(1896, 22, 'Casilda', NULL, NULL),
(1897, 22, 'Castelar', NULL, NULL),
(1898, 22, 'Castellanos', NULL, NULL),
(1899, 22, 'Cayastá', NULL, NULL),
(1900, 22, 'Cayastacito', NULL, NULL),
(1901, 22, 'Centeno', NULL, NULL),
(1902, 22, 'Cepeda', NULL, NULL),
(1903, 22, 'Ceres', NULL, NULL),
(1904, 22, 'Chabás', NULL, NULL),
(1905, 22, 'Chañar Ladeado', NULL, NULL),
(1906, 22, 'Chapuy', NULL, NULL),
(1907, 22, 'Chovet', NULL, NULL),
(1908, 22, 'Christophersen', NULL, NULL),
(1909, 22, 'Classon', NULL, NULL),
(1910, 22, 'Cnel. Arnold', NULL, NULL),
(1911, 22, 'Cnel. Bogado', NULL, NULL),
(1912, 22, 'Cnel. Dominguez', NULL, NULL),
(1913, 22, 'Cnel. Fraga', NULL, NULL),
(1914, 22, 'Col. Aldao', NULL, NULL),
(1915, 22, 'Col. Ana', NULL, NULL),
(1916, 22, 'Col. Belgrano', NULL, NULL),
(1917, 22, 'Col. Bicha', NULL, NULL),
(1918, 22, 'Col. Bigand', NULL, NULL),
(1919, 22, 'Col. Bossi', NULL, NULL),
(1920, 22, 'Col. Cavour', NULL, NULL),
(1921, 22, 'Col. Cello', NULL, NULL),
(1922, 22, 'Col. Dolores', NULL, NULL),
(1923, 22, 'Col. Dos Rosas', NULL, NULL),
(1924, 22, 'Col. Durán', NULL, NULL),
(1925, 22, 'Col. Iturraspe', NULL, NULL),
(1926, 22, 'Col. Margarita', NULL, NULL),
(1927, 22, 'Col. Mascias', NULL, NULL),
(1928, 22, 'Col. Raquel', NULL, NULL),
(1929, 22, 'Col. Rosa', NULL, NULL),
(1930, 22, 'Col. San José', NULL, NULL),
(1931, 22, 'Constanza', NULL, NULL),
(1932, 22, 'Coronda', NULL, NULL),
(1933, 22, 'Correa', NULL, NULL),
(1934, 22, 'Crispi', NULL, NULL),
(1935, 22, 'Cululú', NULL, NULL),
(1936, 22, 'Curupayti', NULL, NULL),
(1937, 22, 'Desvio Arijón', NULL, NULL),
(1938, 22, 'Diaz', NULL, NULL),
(1939, 22, 'Diego de Alvear', NULL, NULL),
(1940, 22, 'Egusquiza', NULL, NULL),
(1941, 22, 'El Arazá', NULL, NULL),
(1942, 22, 'El Rabón', NULL, NULL),
(1943, 22, 'El Sombrerito', NULL, NULL),
(1944, 22, 'El Trébol', NULL, NULL),
(1945, 22, 'Elisa', NULL, NULL),
(1946, 22, 'Elortondo', NULL, NULL),
(1947, 22, 'Emilia', NULL, NULL),
(1948, 22, 'Empalme San Carlos', NULL, NULL),
(1949, 22, 'Empalme Villa Constitucion', NULL, NULL),
(1950, 22, 'Esmeralda', NULL, NULL),
(1951, 22, 'Esperanza', NULL, NULL),
(1952, 22, 'Estación Alvear', NULL, NULL),
(1953, 22, 'Estacion Clucellas', NULL, NULL),
(1954, 22, 'Esteban Rams', NULL, NULL),
(1955, 22, 'Esther', NULL, NULL),
(1956, 22, 'Esustolia', NULL, NULL),
(1957, 22, 'Eusebia', NULL, NULL),
(1958, 22, 'Felicia', NULL, NULL),
(1959, 22, 'Fidela', NULL, NULL),
(1960, 22, 'Fighiera', NULL, NULL),
(1961, 22, 'Firmat', NULL, NULL),
(1962, 22, 'Florencia', NULL, NULL),
(1963, 22, 'Fortín Olmos', NULL, NULL),
(1964, 22, 'Franck', NULL, NULL),
(1965, 22, 'Fray Luis Beltrán', NULL, NULL),
(1966, 22, 'Frontera', NULL, NULL),
(1967, 22, 'Fuentes', NULL, NULL),
(1968, 22, 'Funes', NULL, NULL),
(1969, 22, 'Gaboto', NULL, NULL),
(1970, 22, 'Galisteo', NULL, NULL),
(1971, 22, 'Gálvez', NULL, NULL),
(1972, 22, 'Garabalto', NULL, NULL),
(1973, 22, 'Garibaldi', NULL, NULL),
(1974, 22, 'Gato Colorado', NULL, NULL),
(1975, 22, 'Gdor. Crespo', NULL, NULL),
(1976, 22, 'Gessler', NULL, NULL),
(1977, 22, 'Godoy', NULL, NULL),
(1978, 22, 'Golondrina', NULL, NULL),
(1979, 22, 'Gral. Gelly', NULL, NULL),
(1980, 22, 'Gral. Lagos', NULL, NULL),
(1981, 22, 'Granadero Baigorria', NULL, NULL),
(1982, 22, 'Gregoria Perez De Denis', NULL, NULL),
(1983, 22, 'Grutly', NULL, NULL),
(1984, 22, 'Guadalupe N.', NULL, NULL),
(1985, 22, 'Gödeken', NULL, NULL),
(1986, 22, 'Helvecia', NULL, NULL),
(1987, 22, 'Hersilia', NULL, NULL),
(1988, 22, 'Hipatía', NULL, NULL),
(1989, 22, 'Huanqueros', NULL, NULL),
(1990, 22, 'Hugentobler', NULL, NULL),
(1991, 22, 'Hughes', NULL, NULL),
(1992, 22, 'Humberto 1º', NULL, NULL),
(1993, 22, 'Humboldt', NULL, NULL),
(1994, 22, 'Ibarlucea', NULL, NULL),
(1995, 22, 'Ing. Chanourdie', NULL, NULL),
(1996, 22, 'Intiyaco', NULL, NULL),
(1997, 22, 'Ituzaingó', NULL, NULL),
(1998, 22, 'Jacinto L. Aráuz', NULL, NULL),
(1999, 22, 'Josefina', NULL, NULL),
(2000, 22, 'Juan B. Molina', NULL, NULL),
(2001, 22, 'Juan de Garay', NULL, NULL),
(2002, 22, 'Juncal', NULL, NULL),
(2003, 22, 'La Brava', NULL, NULL),
(2004, 22, 'La Cabral', NULL, NULL),
(2005, 22, 'La Camila', NULL, NULL),
(2006, 22, 'La Chispa', NULL, NULL),
(2007, 22, 'La Clara', NULL, NULL),
(2008, 22, 'La Criolla', NULL, NULL),
(2009, 22, 'La Gallareta', NULL, NULL),
(2010, 22, 'La Lucila', NULL, NULL),
(2011, 22, 'La Pelada', NULL, NULL),
(2012, 22, 'La Penca', NULL, NULL),
(2013, 22, 'La Rubia', NULL, NULL),
(2014, 22, 'La Sarita', NULL, NULL),
(2015, 22, 'La Vanguardia', NULL, NULL),
(2016, 22, 'Labordeboy', NULL, NULL),
(2017, 22, 'Laguna Paiva', NULL, NULL),
(2018, 22, 'Landeta', NULL, NULL),
(2019, 22, 'Lanteri', NULL, NULL),
(2020, 22, 'Larrechea', NULL, NULL),
(2021, 22, 'Las Avispas', NULL, NULL),
(2022, 22, 'Las Bandurrias', NULL, NULL),
(2023, 22, 'Las Garzas', NULL, NULL),
(2024, 22, 'Las Palmeras', NULL, NULL),
(2025, 22, 'Las Parejas', NULL, NULL),
(2026, 22, 'Las Petacas', NULL, NULL),
(2027, 22, 'Las Rosas', NULL, NULL),
(2028, 22, 'Las Toscas', NULL, NULL),
(2029, 22, 'Las Tunas', NULL, NULL),
(2030, 22, 'Lazzarino', NULL, NULL),
(2031, 22, 'Lehmann', NULL, NULL),
(2032, 22, 'Llambi Campbell', NULL, NULL),
(2033, 22, 'Logroño', NULL, NULL),
(2034, 22, 'Loma Alta', NULL, NULL),
(2035, 22, 'López', NULL, NULL),
(2036, 22, 'Los Amores', NULL, NULL),
(2037, 22, 'Los Cardos', NULL, NULL),
(2038, 22, 'Los Laureles', NULL, NULL),
(2039, 22, 'Los Molinos', NULL, NULL),
(2040, 22, 'Los Quirquinchos', NULL, NULL),
(2041, 22, 'Lucio V. Lopez', NULL, NULL),
(2042, 22, 'Luis Palacios', NULL, NULL),
(2043, 22, 'Ma. Juana', NULL, NULL),
(2044, 22, 'Ma. Luisa', NULL, NULL),
(2045, 22, 'Ma. Susana', NULL, NULL),
(2046, 22, 'Ma. Teresa', NULL, NULL),
(2047, 22, 'Maciel', NULL, NULL),
(2048, 22, 'Maggiolo', NULL, NULL),
(2049, 22, 'Malabrigo', NULL, NULL),
(2050, 22, 'Marcelino Escalada', NULL, NULL),
(2051, 22, 'Margarita', NULL, NULL),
(2052, 22, 'Matilde', NULL, NULL),
(2053, 22, 'Mauá', NULL, NULL),
(2054, 22, 'Máximo Paz', NULL, NULL),
(2055, 22, 'Melincué', NULL, NULL),
(2056, 22, 'Miguel Torres', NULL, NULL),
(2057, 22, 'Moisés Ville', NULL, NULL),
(2058, 22, 'Monigotes', NULL, NULL),
(2059, 22, 'Monje', NULL, NULL),
(2060, 22, 'Monte Obscuridad', NULL, NULL),
(2061, 22, 'Monte Vera', NULL, NULL),
(2062, 22, 'Montefiore', NULL, NULL),
(2063, 22, 'Montes de Oca', NULL, NULL),
(2064, 22, 'Murphy', NULL, NULL),
(2065, 22, 'Ñanducita', NULL, NULL),
(2066, 22, 'Naré', NULL, NULL),
(2067, 22, 'Nelson', NULL, NULL),
(2068, 22, 'Nicanor E. Molinas', NULL, NULL),
(2069, 22, 'Nuevo Torino', NULL, NULL),
(2070, 22, 'Oliveros', NULL, NULL),
(2071, 22, 'Palacios', NULL, NULL),
(2072, 22, 'Pavón', NULL, NULL),
(2073, 22, 'Pavón Arriba', NULL, NULL),
(2074, 22, 'Pedro Gómez Cello', NULL, NULL),
(2075, 22, 'Pérez', NULL, NULL),
(2076, 22, 'Peyrano', NULL, NULL),
(2077, 22, 'Piamonte', NULL, NULL),
(2078, 22, 'Pilar', NULL, NULL),
(2079, 22, 'Piñero', NULL, NULL),
(2080, 22, 'Plaza Clucellas', NULL, NULL),
(2081, 22, 'Portugalete', NULL, NULL),
(2082, 22, 'Pozo Borrado', NULL, NULL),
(2083, 22, 'Progreso', NULL, NULL),
(2084, 22, 'Providencia', NULL, NULL),
(2085, 22, 'Pte. Roca', NULL, NULL),
(2086, 22, 'Pueblo Andino', NULL, NULL),
(2087, 22, 'Pueblo Esther', NULL, NULL),
(2088, 22, 'Pueblo Gral. San Martín', NULL, NULL),
(2089, 22, 'Pueblo Irigoyen', NULL, NULL),
(2090, 22, 'Pueblo Marini', NULL, NULL),
(2091, 22, 'Pueblo Muñoz', NULL, NULL),
(2092, 22, 'Pueblo Uranga', NULL, NULL),
(2093, 22, 'Pujato', NULL, NULL),
(2094, 22, 'Pujato N.', NULL, NULL),
(2095, 22, 'Rafaela', NULL, NULL),
(2096, 22, 'Ramayón', NULL, NULL),
(2097, 22, 'Ramona', NULL, NULL),
(2098, 22, 'Reconquista', NULL, NULL),
(2099, 22, 'Recreo', NULL, NULL),
(2100, 22, 'Ricardone', NULL, NULL),
(2101, 22, 'Rivadavia', NULL, NULL),
(2102, 22, 'Roldán', NULL, NULL),
(2103, 22, 'Romang', NULL, NULL),
(2104, 22, 'Rosario', NULL, NULL),
(2105, 22, 'Rueda', NULL, NULL),
(2106, 22, 'Rufino', NULL, NULL),
(2107, 22, 'Sa Pereira', NULL, NULL),
(2108, 22, 'Saguier', NULL, NULL),
(2109, 22, 'Saladero M. Cabal', NULL, NULL),
(2110, 22, 'Salto Grande', NULL, NULL),
(2111, 22, 'San Agustín', NULL, NULL),
(2112, 22, 'San Antonio de Obligado', NULL, NULL),
(2113, 22, 'San Bernardo (N.J.)', NULL, NULL),
(2114, 22, 'San Bernardo (S.J.)', NULL, NULL),
(2115, 22, 'San Carlos Centro', NULL, NULL),
(2116, 22, 'San Carlos N.', NULL, NULL),
(2117, 22, 'San Carlos S.', NULL, NULL),
(2118, 22, 'San Cristóbal', NULL, NULL),
(2119, 22, 'San Eduardo', NULL, NULL),
(2120, 22, 'San Eugenio', NULL, NULL),
(2121, 22, 'San Fabián', NULL, NULL),
(2122, 22, 'San Fco. de Santa Fé', NULL, NULL),
(2123, 22, 'San Genaro', NULL, NULL),
(2124, 22, 'San Genaro N.', NULL, NULL),
(2125, 22, 'San Gregorio', NULL, NULL),
(2126, 22, 'San Guillermo', NULL, NULL),
(2127, 22, 'San Javier', NULL, NULL),
(2128, 22, 'San Jerónimo del Sauce', NULL, NULL),
(2129, 22, 'San Jerónimo N.', NULL, NULL),
(2130, 22, 'San Jerónimo S.', NULL, NULL),
(2131, 22, 'San Jorge', NULL, NULL),
(2132, 22, 'San José de La Esquina', NULL, NULL),
(2133, 22, 'San José del Rincón', NULL, NULL),
(2134, 22, 'San Justo', NULL, NULL),
(2135, 22, 'San Lorenzo', NULL, NULL),
(2136, 22, 'San Mariano', NULL, NULL),
(2137, 22, 'San Martín de Las Escobas', NULL, NULL),
(2138, 22, 'San Martín N.', NULL, NULL),
(2139, 22, 'San Vicente', NULL, NULL),
(2140, 22, 'Sancti Spititu', NULL, NULL),
(2141, 22, 'Sanford', NULL, NULL),
(2142, 22, 'Santo Domingo', NULL, NULL),
(2143, 22, 'Santo Tomé', NULL, NULL),
(2144, 22, 'Santurce', NULL, NULL),
(2145, 22, 'Sargento Cabral', NULL, NULL),
(2146, 22, 'Sarmiento', NULL, NULL),
(2147, 22, 'Sastre', NULL, NULL),
(2148, 22, 'Sauce Viejo', NULL, NULL),
(2149, 22, 'Serodino', NULL, NULL),
(2150, 22, 'Silva', NULL, NULL),
(2151, 22, 'Soldini', NULL, NULL),
(2152, 22, 'Soledad', NULL, NULL),
(2153, 22, 'Soutomayor', NULL, NULL),
(2154, 22, 'Sta. Clara de Buena Vista', NULL, NULL),
(2155, 22, 'Sta. Clara de Saguier', NULL, NULL),
(2156, 22, 'Sta. Isabel', NULL, NULL),
(2157, 22, 'Sta. Margarita', NULL, NULL),
(2158, 22, 'Sta. Maria Centro', NULL, NULL),
(2159, 22, 'Sta. María N.', NULL, NULL),
(2160, 22, 'Sta. Rosa', NULL, NULL),
(2161, 22, 'Sta. Teresa', NULL, NULL),
(2162, 22, 'Suardi', NULL, NULL),
(2163, 22, 'Sunchales', NULL, NULL),
(2164, 22, 'Susana', NULL, NULL),
(2165, 22, 'Tacuarendí', NULL, NULL),
(2166, 22, 'Tacural', NULL, NULL),
(2167, 22, 'Tartagal', NULL, NULL),
(2168, 22, 'Teodelina', NULL, NULL),
(2169, 22, 'Theobald', NULL, NULL),
(2170, 22, 'Timbúes', NULL, NULL),
(2171, 22, 'Toba', NULL, NULL),
(2172, 22, 'Tortugas', NULL, NULL),
(2173, 22, 'Tostado', NULL, NULL),
(2174, 22, 'Totoras', NULL, NULL),
(2175, 22, 'Traill', NULL, NULL),
(2176, 22, 'Venado Tuerto', NULL, NULL),
(2177, 22, 'Vera', NULL, NULL),
(2178, 22, 'Vera y Pintado', NULL, NULL),
(2179, 22, 'Videla', NULL, NULL),
(2180, 22, 'Vila', NULL, NULL),
(2181, 22, 'Villa Amelia', NULL, NULL),
(2182, 22, 'Villa Ana', NULL, NULL),
(2183, 22, 'Villa Cañas', NULL, NULL),
(2184, 22, 'Villa Constitución', NULL, NULL),
(2185, 22, 'Villa Eloísa', NULL, NULL),
(2186, 22, 'Villa Gdor. Gálvez', NULL, NULL),
(2187, 22, 'Villa Guillermina', NULL, NULL),
(2188, 22, 'Villa Minetti', NULL, NULL),
(2189, 22, 'Villa Mugueta', NULL, NULL),
(2190, 22, 'Villa Ocampo', NULL, NULL),
(2191, 22, 'Villa San José', NULL, NULL),
(2192, 22, 'Villa Saralegui', NULL, NULL),
(2193, 22, 'Villa Trinidad', NULL, NULL),
(2194, 22, 'Villada', NULL, NULL),
(2195, 22, 'Virginia', NULL, NULL),
(2196, 22, 'Wheelwright', NULL, NULL),
(2197, 22, 'Zavalla', NULL, NULL),
(2198, 22, 'Zenón Pereira', NULL, NULL),
(2199, 23, 'Añatuya', NULL, NULL),
(2200, 23, 'Árraga', NULL, NULL),
(2201, 23, 'Bandera', NULL, NULL),
(2202, 23, 'Bandera Bajada', NULL, NULL),
(2203, 23, 'Beltrán', NULL, NULL),
(2204, 23, 'Brea Pozo', NULL, NULL),
(2205, 23, 'Campo Gallo', NULL, NULL),
(2206, 23, 'Capital', NULL, NULL),
(2207, 23, 'Chilca Juliana', NULL, NULL),
(2208, 23, 'Choya', NULL, NULL),
(2209, 23, 'Clodomira', NULL, NULL),
(2210, 23, 'Col. Alpina', NULL, NULL),
(2211, 23, 'Col. Dora', NULL, NULL),
(2212, 23, 'Col. El Simbolar Robles', NULL, NULL),
(2213, 23, 'El Bobadal', NULL, NULL),
(2214, 23, 'El Charco', NULL, NULL),
(2215, 23, 'El Mojón', NULL, NULL),
(2216, 23, 'Estación Atamisqui', NULL, NULL),
(2217, 23, 'Estación Simbolar', NULL, NULL),
(2218, 23, 'Fernández', NULL, NULL),
(2219, 23, 'Fortín Inca', NULL, NULL),
(2220, 23, 'Frías', NULL, NULL),
(2221, 23, 'Garza', NULL, NULL),
(2222, 23, 'Gramilla', NULL, NULL),
(2223, 23, 'Guardia Escolta', NULL, NULL),
(2224, 23, 'Herrera', NULL, NULL),
(2225, 23, 'Icaño', NULL, NULL),
(2226, 23, 'Ing. Forres', NULL, NULL),
(2227, 23, 'La Banda', NULL, NULL),
(2228, 23, 'La Cañada', NULL, NULL),
(2229, 23, 'Laprida', NULL, NULL),
(2230, 23, 'Lavalle', NULL, NULL),
(2231, 23, 'Loreto', NULL, NULL),
(2232, 23, 'Los Juríes', NULL, NULL),
(2233, 23, 'Los Núñez', NULL, NULL),
(2234, 23, 'Los Pirpintos', NULL, NULL),
(2235, 23, 'Los Quiroga', NULL, NULL),
(2236, 23, 'Los Telares', NULL, NULL),
(2237, 23, 'Lugones', NULL, NULL),
(2238, 23, 'Malbrán', NULL, NULL),
(2239, 23, 'Matara', NULL, NULL),
(2240, 23, 'Medellín', NULL, NULL),
(2241, 23, 'Monte Quemado', NULL, NULL),
(2242, 23, 'Nueva Esperanza', NULL, NULL),
(2243, 23, 'Nueva Francia', NULL, NULL),
(2244, 23, 'Palo Negro', NULL, NULL),
(2245, 23, 'Pampa de Los Guanacos', NULL, NULL),
(2246, 23, 'Pinto', NULL, NULL),
(2247, 23, 'Pozo Hondo', NULL, NULL),
(2248, 23, 'Quimilí', NULL, NULL),
(2249, 23, 'Real Sayana', NULL, NULL),
(2250, 23, 'Sachayoj', NULL, NULL),
(2251, 23, 'San Pedro de Guasayán', NULL, NULL),
(2252, 23, 'Selva', NULL, NULL),
(2253, 23, 'Sol de Julio', NULL, NULL),
(2254, 23, 'Sumampa', NULL, NULL),
(2255, 23, 'Suncho Corral', NULL, NULL),
(2256, 23, 'Taboada', NULL, NULL),
(2257, 23, 'Tapso', NULL, NULL),
(2258, 23, 'Termas de Rio Hondo', NULL, NULL),
(2259, 23, 'Tintina', NULL, NULL),
(2260, 23, 'Tomas Young', NULL, NULL),
(2261, 23, 'Vilelas', NULL, NULL),
(2262, 23, 'Villa Atamisqui', NULL, NULL),
(2263, 23, 'Villa La Punta', NULL, NULL),
(2264, 23, 'Villa Ojo de Agua', NULL, NULL),
(2265, 23, 'Villa Río Hondo', NULL, NULL),
(2266, 23, 'Villa Salavina', NULL, NULL),
(2267, 23, 'Villa Unión', NULL, NULL),
(2268, 23, 'Vilmer', NULL, NULL),
(2269, 23, 'Weisburd', NULL, NULL),
(2270, 24, 'Río Grande', NULL, NULL),
(2271, 24, 'Tolhuin', NULL, NULL),
(2272, 24, 'Ushuaia', NULL, NULL),
(2273, 25, 'Acheral', NULL, NULL),
(2274, 25, 'Agua Dulce', NULL, NULL),
(2275, 25, 'Aguilares', NULL, NULL),
(2276, 25, 'Alderetes', NULL, NULL),
(2277, 25, 'Alpachiri', NULL, NULL),
(2278, 25, 'Alto Verde', NULL, NULL),
(2279, 25, 'Amaicha del Valle', NULL, NULL),
(2280, 25, 'Amberes', NULL, NULL),
(2281, 25, 'Ancajuli', NULL, NULL),
(2282, 25, 'Arcadia', NULL, NULL),
(2283, 25, 'Atahona', NULL, NULL),
(2284, 25, 'Banda del Río Sali', NULL, NULL),
(2285, 25, 'Bella Vista', NULL, NULL),
(2286, 25, 'Buena Vista', NULL, NULL),
(2287, 25, 'Burruyacú', NULL, NULL),
(2288, 25, 'Capitán Cáceres', NULL, NULL),
(2289, 25, 'Cevil Redondo', NULL, NULL),
(2290, 25, 'Choromoro', NULL, NULL),
(2291, 25, 'Ciudacita', NULL, NULL),
(2292, 25, 'Colalao del Valle', NULL, NULL),
(2293, 25, 'Colombres', NULL, NULL),
(2294, 25, 'Concepción', NULL, NULL),
(2295, 25, 'Delfín Gallo', NULL, NULL),
(2296, 25, 'El Bracho', NULL, NULL),
(2297, 25, 'El Cadillal', NULL, NULL),
(2298, 25, 'El Cercado', NULL, NULL),
(2299, 25, 'El Chañar', NULL, NULL),
(2300, 25, 'El Manantial', NULL, NULL),
(2301, 25, 'El Mojón', NULL, NULL),
(2302, 25, 'El Mollar', NULL, NULL),
(2303, 25, 'El Naranjito', NULL, NULL),
(2304, 25, 'El Naranjo', NULL, NULL),
(2305, 25, 'El Polear', NULL, NULL),
(2306, 25, 'El Puestito', NULL, NULL),
(2307, 25, 'El Sacrificio', NULL, NULL),
(2308, 25, 'El Timbó', NULL, NULL),
(2309, 25, 'Escaba', NULL, NULL),
(2310, 25, 'Esquina', NULL, NULL),
(2311, 25, 'Estación Aráoz', NULL, NULL),
(2312, 25, 'Famaillá', NULL, NULL),
(2313, 25, 'Gastone', NULL, NULL),
(2314, 25, 'Gdor. Garmendia', NULL, NULL),
(2315, 25, 'Gdor. Piedrabuena', NULL, NULL),
(2316, 25, 'Graneros', NULL, NULL),
(2317, 25, 'Huasa Pampa', NULL, NULL),
(2318, 25, 'J. B. Alberdi', NULL, NULL),
(2319, 25, 'La Cocha', NULL, NULL),
(2320, 25, 'La Esperanza', NULL, NULL),
(2321, 25, 'La Florida', NULL, NULL),
(2322, 25, 'La Ramada', NULL, NULL),
(2323, 25, 'La Trinidad', NULL, NULL),
(2324, 25, 'Lamadrid', NULL, NULL),
(2325, 25, 'Las Cejas', NULL, NULL),
(2326, 25, 'Las Talas', NULL, NULL),
(2327, 25, 'Las Talitas', NULL, NULL),
(2328, 25, 'Los Bulacio', NULL, NULL),
(2329, 25, 'Los Gómez', NULL, NULL),
(2330, 25, 'Los Nogales', NULL, NULL),
(2331, 25, 'Los Pereyra', NULL, NULL),
(2332, 25, 'Los Pérez', NULL, NULL),
(2333, 25, 'Los Puestos', NULL, NULL),
(2334, 25, 'Los Ralos', NULL, NULL),
(2335, 25, 'Los Sarmientos', NULL, NULL),
(2336, 25, 'Los Sosa', NULL, NULL),
(2337, 25, 'Lules', NULL, NULL),
(2338, 25, 'M. García Fernández', NULL, NULL),
(2339, 25, 'Manuela Pedraza', NULL, NULL),
(2340, 25, 'Medinas', NULL, NULL),
(2341, 25, 'Monte Bello', NULL, NULL),
(2342, 25, 'Monteagudo', NULL, NULL),
(2343, 25, 'Monteros', NULL, NULL),
(2344, 25, 'Padre Monti', NULL, NULL),
(2345, 25, 'Pampa Mayo', NULL, NULL),
(2346, 25, 'Quilmes', NULL, NULL),
(2347, 25, 'Raco', NULL, NULL),
(2348, 25, 'Ranchillos', NULL, NULL),
(2349, 25, 'Río Chico', NULL, NULL),
(2350, 25, 'Río Colorado', NULL, NULL),
(2351, 25, 'Río Seco', NULL, NULL),
(2352, 25, 'Rumi Punco', NULL, NULL),
(2353, 25, 'San Andrés', NULL, NULL),
(2354, 25, 'San Felipe', NULL, NULL),
(2355, 25, 'San Ignacio', NULL, NULL),
(2356, 25, 'San Javier', NULL, NULL),
(2357, 25, 'San José', NULL, NULL),
(2358, 25, 'San Miguel de Tucuman', NULL, NULL),
(2359, 25, 'San Pedro', NULL, NULL),
(2360, 25, 'San Pedro de Colalao', NULL, NULL),
(2361, 25, 'Santa Rosa de Leales', NULL, NULL),
(2362, 25, 'Sgto. Moya', NULL, NULL),
(2363, 25, 'Siete de Abril', NULL, NULL),
(2364, 25, 'Simoca', NULL, NULL),
(2365, 25, 'Soldado Maldonado', NULL, NULL),
(2366, 25, 'Sta. Ana', NULL, NULL),
(2367, 25, 'Sta. Cruz', NULL, NULL),
(2368, 25, 'Sta. Lucía', NULL, NULL),
(2369, 25, 'Taco Ralo', NULL, NULL),
(2370, 25, 'Tafí del Valle', NULL, NULL),
(2371, 25, 'Tafí Viejo', NULL, NULL),
(2372, 25, 'Tapia', NULL, NULL),
(2373, 25, 'Teniente Berdina', NULL, NULL),
(2374, 25, 'Trancas', NULL, NULL),
(2375, 25, 'Villa Belgrano', NULL, NULL),
(2376, 25, 'Villa Benjamín Araoz', NULL, NULL),
(2377, 25, 'Villa Chiligasta', NULL, NULL),
(2378, 25, 'Villa de Leales', NULL, NULL),
(2379, 25, 'Villa Quinteros', NULL, NULL),
(2380, 25, 'Yánima', NULL, NULL),
(2381, 25, 'Yerba Buena', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marcas`
--

CREATE TABLE `marcas` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `marcas`
--

INSERT INTO `marcas` (`id`, `name`, `created_at`, `updated_at`) VALUES
(2, 'MELINE', '2020-03-14 23:32:17', '2020-03-14 23:32:17'),
(3, 'CHERIMOYA', '2020-03-14 23:32:50', '2020-03-14 23:32:50'),
(4, 'CUVAGE', '2020-03-14 23:33:09', '2020-03-14 23:33:09'),
(5, 'HEBURN', '2020-03-14 23:33:24', '2020-03-14 23:33:24'),
(6, 'THUYA', '2020-03-14 23:33:39', '2020-03-14 23:33:39'),
(7, 'ANGELA BRESCIANO', '2020-03-14 23:34:00', '2020-03-14 23:34:00'),
(8, 'ORLY', '2020-03-14 23:34:18', '2020-03-14 23:34:18'),
(9, 'OPI', '2020-03-14 23:34:34', '2020-03-14 23:34:34'),
(10, 'SALLY HANSEN', '2020-03-14 23:34:50', '2020-03-14 23:34:50'),
(11, 'RISQUE', '2020-03-14 23:35:04', '2020-03-14 23:35:04'),
(18, 'ACRYFINE', '2020-03-14 23:46:59', '2020-03-14 23:46:59'),
(19, 'DELFINA SOL', '2020-03-14 23:47:19', '2020-03-14 23:47:19'),
(20, 'PINK MASK', '2020-03-14 23:47:34', '2020-03-14 23:47:34'),
(21, 'JESSAMY', '2020-03-14 23:47:48', '2020-03-14 23:47:48'),
(22, 'MUNDIAL', '2020-03-14 23:48:09', '2020-03-14 23:48:09'),
(23, 'NAVINA', '2020-03-14 23:48:25', '2020-03-14 23:48:25'),
(24, 'MEDIGLOVE', '2020-03-14 23:49:00', '2020-03-14 23:49:00'),
(25, 'TEKNIKPRO', '2020-03-14 23:49:15', '2020-03-14 23:49:15'),
(26, 'CERAMATIC', '2020-03-14 23:49:31', '2020-03-14 23:49:31'),
(27, 'ARCAMETAL', '2020-03-14 23:50:02', '2020-03-14 23:50:02'),
(28, 'DUGA', '2020-03-14 23:50:00', '2020-03-14 23:50:51'),
(29, 'EGEO', '2020-03-14 23:51:02', '2020-03-14 23:51:02'),
(30, 'VANTA', '2020-03-14 23:51:28', '2020-03-14 23:51:28'),
(31, 'SUN', '2020-03-14 23:51:46', '2020-03-14 23:51:46'),
(32, 'RIMMEL', '2020-03-14 23:52:04', '2020-03-14 23:52:04'),
(33, 'LASH', '2020-03-14 23:52:24', '2020-03-14 23:52:24'),
(34, 'NEICHA', '2020-03-14 23:52:44', '2020-03-14 23:52:44'),
(35, 'COLLAGE', '2020-03-14 23:52:58', '2020-03-14 23:52:58'),
(36, 'DEPIMIEL', '2020-03-14 23:53:15', '2020-03-14 23:53:15'),
(37, 'No disponible', '2020-03-15 02:39:27', '2020-03-15 02:39:27'),
(38, 'CHINA', '2020-03-15 03:02:17', '2020-03-15 03:02:17'),
(39, 'PUREDERM', '2020-03-15 03:02:43', '2020-03-15 03:02:43'),
(40, 'FASCINO', '2020-03-15 03:04:26', '2020-03-15 03:04:26'),
(41, 'DR DUVAL', '2020-03-15 03:15:54', '2020-03-15 03:15:54'),
(42, 'ESTRELLA', '2020-03-15 03:17:00', '2020-03-15 03:17:41'),
(43, 'IBD', '2020-03-15 03:18:20', '2020-03-15 03:18:20'),
(44, 'EXEL', '2020-03-15 03:19:26', '2020-03-15 03:19:26'),
(45, 'CELUGAMA', '2020-03-15 03:22:18', '2020-03-15 03:22:18'),
(46, 'Angela Bresciano', '2020-07-17 05:35:00', '2020-07-17 05:35:34');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2020-05-09 19:41:08', '2020-05-09 19:41:08'),
(2, 'menu', '2020-05-09 21:14:56', '2020-05-09 21:14:56'),
(3, 'footer1', '2020-09-02 20:04:21', '2021-01-17 03:58:37'),
(4, 'footer2', '2021-01-17 04:04:57', '2021-01-17 04:04:57');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Inicio', '/admin', '_self', 'voyager-boat', NULL, NULL, 1, '2020-05-09 23:41:08', '2020-09-19 03:27:10', NULL, ''),
(3, 1, 'Usuarios', '/admin/users', '_self', 'voyager-person', NULL, NULL, 2, '2020-05-09 23:41:08', '2020-09-22 00:58:08', NULL, ''),
(6, 1, 'Menu', '/admin/menus', '_self', NULL, NULL, 29, 1, '2020-05-09 23:41:08', '2021-01-17 08:57:54', NULL, ''),
(10, 1, 'Configuracion', '/admin/settings', '_self', 'voyager-settings', NULL, NULL, 5, '2020-05-09 23:41:09', '2023-04-27 19:07:44', NULL, ''),
(20, 1, 'Notas', '', '_self', NULL, NULL, 29, 3, '2020-05-18 21:17:27', '2023-04-27 03:39:24', 'voyager.notas.index', NULL),
(29, 1, 'Sitio web', '#', '_self', 'voyager-window-list', NULL, NULL, 3, '2020-05-19 04:26:34', '2020-09-22 00:57:37', NULL, ''),
(30, 1, 'Productos', '/admin/posts', '_self', NULL, NULL, 29, 2, '2020-05-19 04:32:11', '2023-04-27 03:39:24', NULL, ''),
(31, 1, 'Sliders', '/admin/sliders', '_self', NULL, NULL, 29, 4, '2020-05-20 22:20:36', '2023-04-27 03:39:24', NULL, ''),
(32, 1, 'Atributos', '#', '_self', 'voyager-data', NULL, NULL, 4, '2020-05-20 22:51:01', '2021-01-17 00:48:02', NULL, ''),
(33, 1, 'Categorías', '/admin/categories', '_self', NULL, NULL, 32, 1, '2020-05-20 22:55:11', '2021-01-17 00:48:06', NULL, ''),
(42, 1, 'Visitas a Publicaciones', '/admin/posts-visitas', '_self', 'voyager-params', NULL, NULL, 6, '2020-05-20 23:42:04', '2023-04-27 19:07:44', NULL, ''),
(44, 1, 'Colores', '', '_self', NULL, NULL, 32, 6, '2020-05-20 23:49:25', '2021-01-17 00:49:54', 'voyager.colores.index', NULL),
(45, 1, 'Talles', '', '_self', NULL, NULL, 32, 7, '2020-05-20 23:51:51', '2021-01-17 00:49:54', 'voyager.talles.index', NULL),
(57, 3, 'Quienes Somos', '/nota/quienes-somos/6', '_self', NULL, NULL, NULL, 20, '2020-09-03 00:05:07', '2021-01-17 09:03:11', NULL, ''),
(58, 3, 'Medios de Pago', '/nota/medios-de-pago/7', '_self', NULL, NULL, NULL, 21, '2020-09-03 00:05:15', '2021-01-17 09:03:37', NULL, ''),
(62, 1, 'Carritos', '/admin/carrito', '_self', 'voyager-basket', NULL, NULL, 8, '2020-09-19 03:31:55', '2023-04-27 19:07:47', NULL, ''),
(64, 3, 'Términos y Condiciones', '/nota/terminos-y-condiciones/8', '_blank', NULL, NULL, NULL, 22, '2020-12-16 02:52:06', '2021-01-17 09:03:47', NULL, ''),
(65, 3, 'Contacto', '/contacto', '_self', NULL, NULL, NULL, 23, '2020-12-16 07:07:59', '2021-01-17 09:04:02', NULL, ''),
(67, 1, 'N Categorymarcas', '', '_self', NULL, NULL, 32, 4, '2021-01-17 00:41:37', '2021-01-17 00:49:54', 'voyager.n-categorymarcas.index', NULL),
(68, 1, 'N Modelomarcas', '', '_self', NULL, NULL, 32, 5, '2021-01-17 00:46:30', '2021-01-17 00:49:54', 'voyager.n-modelomarcas.index', NULL),
(69, 1, 'Marcas', '', '_self', NULL, NULL, 32, 2, '2021-01-17 00:49:08', '2021-01-17 00:49:51', 'voyager.marcas.index', NULL),
(70, 1, 'Modelos', '', '_self', NULL, NULL, 32, 3, '2021-01-17 00:49:33', '2021-01-17 00:49:54', 'voyager.modelos.index', NULL),
(227, 2, 'Accesorios', '/categoria/unas/3', '_self', NULL, NULL, 224, 1, '2020-02-04 12:57:35', '2020-02-18 10:55:01', 'categoria/unas/3', ''),
(228, 2, 'Aparatos', '/categoria/unas/3', '_self', NULL, NULL, 224, 1, '2020-02-04 12:57:43', '2020-02-18 10:55:02', 'categoria/unas/3', ''),
(232, 2, 'Listado de noticias', '/listado-de-noticias', '_self', NULL, NULL, 231, 1, '2020-02-04 12:58:47', '2020-02-09 09:02:52', NULL, ''),
(233, 2, 'Nota', '/nota/14/quienes-somos', '_self', NULL, NULL, 231, 1, '2020-02-04 12:59:05', '2020-02-09 09:03:10', NULL, ''),
(241, 2, 'Listado de Galerias', '/listado-galerias', '_self', NULL, NULL, 229, 1, '2020-02-09 08:52:04', '2020-02-09 08:52:17', NULL, ''),
(242, 2, 'Galería', 'galeria/2/unas', '_self', NULL, NULL, 229, 1, '2020-02-09 08:55:56', '2020-02-13 05:52:49', NULL, ''),
(248, 2, 'MANOS', '/categoria/6/manos', '_self', NULL, NULL, NULL, 1, '2020-03-03 11:53:59', '2021-02-02 10:37:27', NULL, ''),
(249, 2, 'HERRAMIENTAS', '/categoria/7/herramientas', '_self', NULL, NULL, NULL, 2, '2020-03-03 11:54:20', '2021-02-02 10:37:43', NULL, ''),
(250, 2, 'CONSTRUCCION', '/categoria/8/construccion', '_self', NULL, NULL, NULL, 3, '2020-03-03 11:54:49', '2021-02-02 10:37:57', NULL, ''),
(251, 2, 'DECORACIÓN', '/categoria/9/decoracion', '_self', NULL, NULL, NULL, 4, '2020-03-03 11:55:13', '2021-02-02 10:38:11', NULL, ''),
(252, 2, 'APARATOS', '/categoria/10/aparatos', '_self', NULL, NULL, NULL, 5, '2020-03-03 11:55:32', '2021-02-02 10:38:24', NULL, ''),
(253, 2, 'PESTAÑAS', '/categoria/11/pestanas', '_self', NULL, NULL, NULL, 6, '2020-03-03 11:55:52', '2021-02-02 10:38:38', NULL, ''),
(255, 2, 'PIES', '/categoria/13/pies', '_self', NULL, NULL, NULL, 7, '2020-03-03 12:07:20', '2021-02-02 10:38:53', NULL, ''),
(256, 2, 'GUANTES', '/categoria/14/manos-preparacion-guantes', '_self', NULL, NULL, 248, 1, '2020-03-03 12:30:31', '2021-01-17 01:45:39', NULL, ''),
(257, 2, 'LIMAS', '/categoria/15/manos-preparacion-limas', '_self', NULL, NULL, 248, 2, '2020-03-03 12:31:09', '2021-01-28 10:12:25', NULL, ''),
(258, 2, 'SANITIZANTES', '/categoria/16/manos-preparacion-sanitizante', '_self', NULL, NULL, 248, 3, '2020-03-03 12:31:52', '2021-01-28 10:12:25', NULL, ''),
(260, 2, 'REMOVEDOR DE CUTÍCULAS', '/categoria/18/manos-preparacion-removedor-de-cuticulas', '_self', NULL, NULL, 248, 4, '2020-03-03 12:35:03', '2021-01-28 10:12:25', NULL, ''),
(263, 2, 'TOALLAS', '/categoria/21/manos-preparacion-toallas', '_self', NULL, NULL, 248, 5, '2020-03-03 12:36:35', '2021-01-28 10:12:25', NULL, ''),
(264, 2, 'APOYA MANOS', '/categoria/22/manos-preparacion-apoya-manos', '_self', NULL, NULL, 248, 6, '2020-03-03 12:37:00', '2021-01-28 10:12:25', NULL, ''),
(265, 2, 'CLARIFICADOR', '/categoria/23/manos-preparacion-clarificador', '_self', NULL, NULL, 248, 7, '2020-03-03 12:37:19', '2021-01-28 10:12:25', NULL, ''),
(266, 2, 'SOLUCIÓN DERMOHIGIÉNICA', '/categoria/24/manos-preparacion-solucion-dermohigienica', '_self', NULL, NULL, 248, 8, '2020-03-03 12:37:54', '2021-01-28 10:12:25', NULL, ''),
(268, 2, 'ESMALTADO', '#', '_self', NULL, NULL, NULL, 8, '2020-03-03 12:41:50', '2021-01-28 10:12:26', NULL, ''),
(269, 2, 'TRATAMIENTO PARA UÑAS', '/categoria/25/tratamientos-para-unas', '_self', NULL, NULL, 268, 1, '2020-03-03 12:42:55', '2021-01-28 10:16:28', NULL, ''),
(270, 2, 'ESMALTES SEMIPERMANENTES', '/categoria/26/esmaltes-semipermanentes', '_self', NULL, NULL, 268, 2, '2020-03-03 12:43:26', '2021-01-28 10:16:42', NULL, ''),
(271, 2, 'ESMALTES TRADICIONALES', '/categoria/27/esmaltes-tradicionales', '_self', NULL, NULL, 268, 3, '2020-03-03 12:44:05', '2021-01-28 10:16:55', NULL, ''),
(272, 2, 'REMOCIÓN', '/categoria/138/remocion', '_self', NULL, NULL, NULL, 9, '2020-03-03 12:46:51', '2021-02-02 10:40:11', NULL, ''),
(273, 2, 'REMOVEDORES', '/categoria/28/removedor', '_self', NULL, NULL, 272, 1, '2020-03-03 12:47:56', '2021-01-28 10:17:12', NULL, ''),
(274, 2, 'QUITAESMALTES', '/categoria/29/quitaesmalte', '_self', NULL, NULL, 272, 2, '2020-03-04 11:00:05', '2021-01-28 10:17:39', NULL, ''),
(275, 2, 'CAPUCHONES', '/categoria/30/capuchones', '_self', NULL, NULL, 272, 3, '2020-03-04 11:00:27', '2021-01-28 10:17:53', NULL, ''),
(276, 2, 'PAPEL DE ALUMINIO', '/categoria/31/papel-de-aluminio', '_self', NULL, NULL, 272, 4, '2020-03-04 11:05:15', '2021-01-28 10:19:19', NULL, ''),
(277, 2, 'ABLANDADOR DE DUREZAS', '/categoria/32/pies-ablandador-de-durezas', '_self', NULL, NULL, 255, 1, '2020-03-04 12:28:32', '2021-01-28 10:15:22', NULL, ''),
(280, 2, 'ESCOFINA', '/categoria/35/pies-escofina', '_self', NULL, NULL, 255, 2, '2020-03-04 12:29:51', '2021-01-28 10:15:45', NULL, ''),
(286, 2, 'RESTAURADOR PÉDICO', '/categoria/41/pies-restaurador-pedico', '_self', NULL, NULL, 255, 3, '2020-03-04 12:35:31', '2021-01-28 10:16:00', NULL, ''),
(287, 2, 'RELAJANTE PÉDICO', '/categoria/42/pies-relajante-pedico', '_self', NULL, NULL, 255, 4, '2020-03-04 12:36:13', '2021-01-28 10:16:15', NULL, ''),
(289, 2, 'CORTA CUTÍCULAS', '/categoria/44/herramientas-corta-cuticulas', '_self', NULL, NULL, 249, 1, '2020-03-06 14:40:14', '2021-01-23 21:59:39', NULL, ''),
(290, 2, 'ALGODONERA', '/categoria/45/herramientas-algodonera', '_self', NULL, NULL, 249, 2, '2020-03-06 14:40:48', '2021-01-28 10:12:25', NULL, ''),
(291, 2, 'REPUJADOR', '/categoria/46/herramientas-repujador', '_self', NULL, NULL, 249, 3, '2020-03-06 14:41:11', '2021-01-28 10:12:25', NULL, ''),
(292, 2, 'CORTA UÑAS', '/categoria/47/herramientas-corta-unas', '_self', NULL, NULL, 249, 4, '2020-03-06 14:41:40', '2021-01-28 10:12:25', NULL, ''),
(294, 2, 'CORTA TIPS', '/categoria/49/herramientas-corta-tips', '_self', NULL, NULL, 249, 5, '2020-03-06 14:42:23', '2021-01-28 10:12:25', NULL, ''),
(296, 2, 'ESTERILIZADOR', '/categoria/51/herramientas-esterilizador', '_self', NULL, NULL, 249, 6, '2020-03-06 14:43:08', '2021-01-28 10:12:25', NULL, ''),
(297, 2, 'FRESAS', '/categoria/52/herramientas-fresas', '_self', NULL, NULL, 249, 7, '2020-03-06 14:43:31', '2021-01-28 10:12:25', NULL, ''),
(298, 2, 'FOCOS', '/categoria/53/herramientas-focos', '_self', NULL, NULL, 249, 8, '2020-03-06 14:44:04', '2021-01-28 10:12:25', NULL, ''),
(299, 2, 'BARBIJOS', '/categoria/54/herramientas-barbijos', '_self', NULL, NULL, 249, 9, '2020-03-06 14:44:28', '2021-01-28 10:12:25', NULL, ''),
(301, 2, 'GEL UV', '/categoria/56/construccion-gel-uv', '_self', NULL, NULL, 250, 1, '2020-03-06 15:05:08', '2021-01-23 22:01:56', NULL, ''),
(302, 2, 'POLYGEL', '/categoria/57/construccion-polygel', '_self', NULL, NULL, 250, 2, '2020-03-06 15:06:15', '2021-01-28 10:12:25', NULL, ''),
(303, 2, 'SOLUCION PARA  POLYGEL', '/categoria/58/construccion-solucion-para-polygel', '_self', NULL, NULL, 250, 3, '2020-03-06 15:06:49', '2021-01-28 10:12:25', NULL, ''),
(304, 2, 'MONÓMERO (ACRÍLICO)', '/categoria/59/construccion-acrilicos-monomero', '_self', NULL, NULL, 250, 4, '2020-03-06 15:08:13', '2021-01-28 10:12:25', NULL, ''),
(305, 2, 'POLÍMERO (ACRÍLICO)', '/categoria/60/construccion-acrilicos-polimeros', '_self', NULL, NULL, 250, 5, '2020-03-06 15:08:52', '2021-01-28 10:12:25', NULL, ''),
(306, 2, 'VASO DAPPEN (ACRÍLICOS)', '/categoria/61/construccion-acrilicos-vaso-dappen', '_self', NULL, NULL, 250, 6, '2020-03-06 15:09:29', '2021-01-28 10:12:25', NULL, ''),
(307, 2, 'CÁPSULA DUAL (MOLDES)', '/categoria/62/construccion-moldes-capsulas-dual', '_self', NULL, NULL, 250, 7, '2020-03-06 15:10:57', '2021-01-28 10:12:25', NULL, ''),
(308, 2, 'MOLDES PARA UÑAS', '/categoria/64/construccion-moldes-moldes-de-teflon', '_self', NULL, NULL, 251, 1, '2020-03-06 15:11:34', '2021-01-23 22:05:38', NULL, ''),
(309, 2, 'TIPS (MOLDES)', '/categoria/63/construccion-moldes-tips', '_self', NULL, NULL, 250, 8, '2020-03-06 15:12:02', '2021-01-28 10:12:26', NULL, ''),
(311, 2, 'PEGAMENTO P/ TIPS', '/categoria/67/construccion-moldes-pegamento-p-tips', '_self', NULL, NULL, 250, 9, '2020-03-06 15:14:23', '2021-01-28 10:12:26', NULL, ''),
(314, 2, 'STAMPING', '/categoria/70/decoracion-stampng', '_self', NULL, NULL, 251, 2, '2020-03-06 15:38:36', '2021-01-28 10:12:26', NULL, ''),
(315, 2, 'SELLO', '/categoria/71/decoracion-sello', '_self', NULL, NULL, 251, 3, '2020-03-06 15:38:55', '2021-01-28 10:12:26', NULL, ''),
(316, 2, 'PLACAS', '/categoria/72/decoracion-placas', '_self', NULL, NULL, 251, 4, '2020-03-06 15:39:14', '2021-01-28 10:12:26', NULL, ''),
(317, 2, 'ESMALTES P/STAMPING', '/categoria/73/decoracion-esmaltes-p-stamping', '_self', NULL, NULL, 251, 5, '2020-03-06 15:40:02', '2021-01-28 10:12:26', NULL, ''),
(318, 2, 'STRASS', '/categoria/74/decoracion-strass', '_self', NULL, NULL, 251, 6, '2020-03-06 15:41:02', '2021-01-28 10:12:26', NULL, ''),
(319, 2, 'STRASS FLUO', '/categoria/75/decoracion-strass-fluo', '_self', NULL, NULL, 251, 7, '2020-03-06 15:41:36', '2021-01-28 10:12:26', NULL, ''),
(321, 2, 'FOIL', '/categoria/78/decoracion-foil', '_self', NULL, NULL, 251, 8, '2020-03-06 15:42:37', '2021-01-28 10:12:26', NULL, ''),
(323, 2, 'PINCELES DECO', '/categoria/80/decoracion-pinceles-deco', '_self', NULL, NULL, 251, 9, '2020-03-06 15:43:29', '2021-01-28 10:12:26', NULL, ''),
(325, 2, 'POLVO ESPEJO', '/categoria/83/decoracion-polvos-polvo-espejo', '_self', NULL, NULL, 251, 10, '2020-03-06 16:10:53', '2021-01-28 10:12:26', NULL, ''),
(326, 2, 'POLVO HOLOGRÁFICO', '/categoria/84/decoracion-polvos-polvo-holografico', '_self', NULL, NULL, 251, 11, '2020-03-06 16:11:18', '2021-01-28 10:12:26', NULL, ''),
(328, 2, 'COLA DE SIRENA', '/categoria/decoracion-varios-cola-de-sirena/87', '_self', NULL, NULL, 332, 1, '2020-03-06 16:12:01', '2020-03-06 16:47:10', 'categoria/decoracion-varios-cola-de-sirena/87', NULL),
(329, 2, 'GLITTER', '/categoria/88/decoracion-varios-glitter', '_self', NULL, NULL, 251, 12, '2020-03-06 16:12:20', '2021-01-28 10:12:26', NULL, ''),
(330, 2, 'STICKER AL AGUA', '/categoria/89/decoracion-varios-sticker-al-agua', '_self', NULL, NULL, 251, 13, '2020-03-06 16:12:40', '2021-01-28 10:12:26', NULL, ''),
(331, 2, 'CINTAS', '/categoria/decoracion-varios-cintas/90', '_self', NULL, NULL, 332, 1, '2020-03-06 16:13:06', '2020-06-23 00:32:42', 'categoria/decoracion-varios-cintas/90', NULL),
(334, 2, 'STICKER 3D', '/categoria/decoracion-varios-stickers-3d/92', '_self', NULL, NULL, 332, 1, '2020-03-06 16:22:57', '2020-06-23 00:38:42', 'categoria/decoracion-varios-stickers-3d/92', NULL),
(335, 2, 'PINCELES', '/categoria/decoracion-varios-pinceles/93', '_self', NULL, NULL, 332, 1, '2020-03-06 16:23:25', '2020-06-23 00:38:42', 'categoria/decoracion-varios-pinceles/93', NULL),
(336, 2, 'PORTA PINCELES', '/categoria/decoracion-varios-porta-pinceles/94', '_self', NULL, NULL, 332, 1, '2020-03-06 16:23:57', '2020-06-23 00:38:42', 'categoria/decoracion-varios-porta-pinceles/94', NULL),
(338, 2, 'ANILLOS', '/categoria/decoracion-varios-anillos/96', '_self', NULL, NULL, 332, 1, '2020-03-06 16:25:10', '2020-06-23 00:38:42', 'categoria/decoracion-varios-anillos/96', NULL),
(339, 2, 'LAPIZ DE CERA', '/categoria/decoracion-varios-lapiz-de-cera/97', '_self', NULL, NULL, 332, 1, '2020-03-06 16:25:35', '2020-06-23 00:38:42', 'categoria/decoracion-varios-lapiz-de-cera/97', NULL),
(340, 2, 'STICKER MEDIALUNA', '/categoria/98/decoracion-varios-sticker-medialuna', '_self', NULL, NULL, 251, 14, '2020-03-06 16:26:08', '2021-01-28 10:12:26', NULL, ''),
(341, 2, 'CABINAS', '/categoria/99/aparatos-cabinas', '_self', NULL, NULL, 252, 1, '2020-03-06 16:39:02', '2021-01-23 22:10:17', NULL, ''),
(343, 2, 'ESTERILIZADOR', '/categoria/101/aparatos-esterilizador', '_self', NULL, NULL, 252, 2, '2020-03-06 16:39:46', '2021-01-28 10:12:26', NULL, ''),
(346, 2, 'TORNO', '/categoria/104/aparatos-torno', '_self', NULL, NULL, 252, 3, '2020-03-06 16:41:06', '2021-02-03 20:42:28', NULL, ''),
(348, 2, 'VAPORIZADOR', '/categoria/106/aparatos-vaporizador', '_self', NULL, NULL, 252, 4, '2020-03-06 16:41:49', '2021-01-28 10:12:26', NULL, ''),
(349, 2, 'CALENTADOR DE CERA', '/categoria/107/aparatos-calentador-de-cera', '_self', NULL, NULL, 252, 5, '2020-03-06 16:42:13', '2021-01-28 10:12:26', NULL, ''),
(353, 2, 'EXTENSIÓN DE PESTAÑA', '/categoria/111/pestanas-extension-de-pestanas', '_self', NULL, NULL, 253, 1, '2020-03-06 17:09:00', '2021-01-28 10:09:28', NULL, ''),
(354, 2, 'PINZAS', '/categoria/112/pestanas-pinzas', '_self', NULL, NULL, 253, 2, '2020-03-06 17:09:29', '2021-01-28 10:12:26', NULL, ''),
(355, 2, 'PADS', '/categoria/114/pestanas-pads', '_self', NULL, NULL, 253, 3, '2020-03-06 17:09:50', '2021-01-28 10:12:38', NULL, ''),
(356, 2, 'PEGAMENTO', '/categoria/116/pestanas-pegamento', '_self', NULL, NULL, 253, 4, '2020-03-06 17:10:13', '2021-01-28 10:12:53', NULL, ''),
(360, 2, 'PERMANENTE', '/categoria/120/pestanas-permanente', '_self', NULL, NULL, 253, 5, '2020-03-06 17:12:37', '2021-01-28 10:13:13', NULL, ''),
(361, 2, 'LIFTING', '/categoria/121/pestanas-lifting', '_self', NULL, NULL, 253, 6, '2020-03-06 17:12:53', '2021-01-28 10:13:29', NULL, ''),
(362, 2, 'TINTE', '/categoria/122/pestanas-tinte', '_self', NULL, NULL, 253, 7, '2020-03-06 17:13:23', '2021-01-28 10:13:41', NULL, ''),
(364, 2, 'VENTILADOR', '/categoria/125/pestanas-accesorios-ventilador', '_self', NULL, NULL, 253, 8, '2020-03-06 17:14:25', '2021-01-28 10:13:53', NULL, ''),
(365, 2, 'ANTIFAZ', '/categoria/127/pestanas-accesorios-antifaz', '_self', NULL, NULL, 253, 9, '2020-03-06 17:16:01', '2021-01-28 10:14:09', NULL, ''),
(367, 2, 'MICROHISOPOS', '/categoria/129/pestanas-accesorios-microhisopos', '_self', NULL, NULL, 253, 10, '2020-03-06 17:17:11', '2021-01-28 10:14:22', NULL, ''),
(368, 2, 'MICROCEPILLOS', '/categoria/130/pestanas-accesorios-microcepillos', '_self', NULL, NULL, 253, 11, '2020-03-06 17:17:31', '2021-01-28 10:14:39', NULL, ''),
(371, 2, 'BROCHAS', '/categoria/maquillaje-brochas/133', '_self', NULL, NULL, 254, 1, '2020-03-06 17:28:03', '2020-03-06 17:29:50', 'categoria/maquillaje-brochas/133', NULL),
(372, 2, 'LIMPIEZA FACIAL', '/categoria/maquillaje-limpieza-facial/134', '_self', NULL, NULL, 254, 1, '2020-03-06 17:28:31', '2020-03-06 17:30:05', 'categoria/maquillaje-limpieza-facial/134', NULL),
(373, 2, 'OJOS', '/categoria/maquillaje-ojos/135', '_self', NULL, NULL, 254, 1, '2020-03-06 17:28:51', '2020-03-06 17:30:15', 'categoria/maquillaje-ojos/135', NULL),
(374, 2, 'LABIOS', '/categoria/maquillaje-labios/136', '_self', NULL, NULL, 254, 1, '2020-03-06 17:29:11', '2020-03-06 17:30:22', 'categoria/maquillaje-labios/136', NULL),
(375, 2, 'ROSTRO', '/categoria/maquillaje-rostro/137', '_self', NULL, NULL, 254, 1, '2020-03-06 17:29:28', '2020-03-06 17:30:29', 'categoria/maquillaje-rostro/137', NULL),
(379, 2, 'CREMAS', '', '_self', NULL, NULL, 378, 1, '2020-06-23 00:29:00', '2020-06-23 00:29:08', NULL, ''),
(382, 2, 'TALLERES', '/categoria/157/talleres', '_self', NULL, NULL, NULL, 10, '2020-07-05 03:42:20', '2021-09-04 21:01:38', NULL, ''),
(392, 2, 'PREPARACIÓN DE UÑAS', '/categoria/149/preparacion-de-unas', '_self', NULL, NULL, 250, 10, '2020-07-08 01:17:44', '2021-01-28 10:12:26', NULL, ''),
(393, 2, 'CAVIAR', '/categoria/150/decoracion-caviar', '_self', NULL, NULL, 251, 15, '2020-07-08 01:21:06', '2021-01-28 10:12:26', NULL, ''),
(394, 2, 'GABINETE', '/categoria/151/gabinete', '_self', NULL, NULL, NULL, 11, '2020-07-08 01:28:41', '2021-02-02 10:40:47', NULL, ''),
(395, 2, 'ESPEJOS', '/categoria/152/aparatos-espejos', '_self', NULL, NULL, 252, 6, '2020-07-08 02:41:46', '2021-01-28 10:12:26', NULL, ''),
(397, 2, 'ACCESORIOS', '/categoria/141/accesorios', '_self', NULL, NULL, NULL, 12, '2020-07-09 01:46:07', '2021-01-28 10:20:55', NULL, ''),
(399, 2, 'PRIMER', '/categoria/153/manos-primer', '_self', NULL, NULL, 248, 9, '2020-07-09 02:05:55', '2021-01-28 10:12:25', NULL, ''),
(400, 2, 'DEPILACIÓN', '/categoria/155/gabinete-depilacion', '_self', NULL, NULL, 394, 1, '2020-07-15 03:19:19', '2021-01-28 10:20:44', NULL, ''),
(401, 2, 'OFERTAS', '/categoria/156/ofertas', '_self', NULL, NULL, NULL, 13, '2020-07-24 08:56:41', '2021-01-28 10:21:07', NULL, ''),
(403, 4, 'Herramientas', '/categoria/7/herramientas', '_self', NULL, NULL, NULL, 24, '2021-01-17 09:05:31', '2021-01-17 09:05:31', NULL, ''),
(404, 4, 'Construcción', '/categoria/8/construccion', '_self', NULL, NULL, NULL, 25, '2021-01-17 09:05:47', '2021-01-17 09:05:47', NULL, ''),
(405, 4, 'Decoracion', '/categoria/9/decoracion', '_self', NULL, NULL, NULL, 26, '2021-01-17 09:06:00', '2021-01-17 09:06:00', NULL, ''),
(406, 4, 'Aparatos', '/categoria/10/aparatos', '_self', NULL, NULL, NULL, 27, '2021-01-17 09:06:31', '2021-01-17 09:06:31', NULL, ''),
(407, 4, 'Pestañas', '/categoria/11/pestanas', '_self', NULL, NULL, NULL, 28, '2021-01-17 09:06:43', '2021-01-17 09:06:43', NULL, ''),
(408, 4, 'Maquillaje', '/categoria/12/maquillaje', '_self', NULL, NULL, NULL, 29, '2021-01-17 09:06:56', '2021-01-17 09:06:56', NULL, ''),
(410, 1, 'Users Pagos', '', '_self', NULL, NULL, 409, 1, '2021-01-28 09:50:45', '2021-01-28 10:02:14', 'voyager.users-pagos.index', NULL),
(412, 1, 'Actualizacion Masiva', '/admin/price-update', '_self', 'voyager-campfire', '#000000', NULL, 7, '2023-04-25 22:38:12', '2023-04-27 19:08:40', NULL, ''),
(413, 1, 'Pagos', '', '_self', 'voyager-paypal', NULL, NULL, 9, '2023-04-27 03:44:32', '2023-04-27 19:07:47', 'voyager.pagos.index', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2016_01_01_000000_add_voyager_user_fields', 1),
(3, '2016_01_01_000000_create_data_types_table', 1),
(4, '2016_05_19_173453_create_menu_table', 1),
(5, '2016_10_21_190000_create_roles_table', 1),
(6, '2016_10_21_190000_create_settings_table', 1),
(7, '2016_11_30_135954_create_permission_table', 1),
(8, '2016_11_30_141208_create_permission_role_table', 1),
(9, '2016_12_26_201236_data_types__add__server_side', 1),
(10, '2017_01_13_000000_add_route_to_menu_items_table', 1),
(11, '2017_01_14_005015_create_translations_table', 1),
(12, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
(13, '2017_03_06_000000_add_controller_to_data_types_table', 1),
(14, '2017_04_21_000000_add_order_to_data_rows_table', 1),
(15, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
(16, '2017_08_05_000000_add_group_to_settings_table', 1),
(17, '2017_11_26_013050_add_user_role_relationship', 1),
(18, '2017_11_26_015000_create_user_roles_table', 1),
(19, '2018_03_11_000000_add_user_settings', 1),
(20, '2018_03_14_000000_add_details_to_data_types_table', 1),
(21, '2018_03_16_000000_make_settings_value_nullable', 1),
(22, '2019_08_19_000000_create_failed_jobs_table', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modelos`
--

CREATE TABLE `modelos` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notas`
--

CREATE TABLE `notas` (
  `id` int(10) UNSIGNED NOT NULL,
  `titulo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `texto` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `imagen` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `notas`
--

INSERT INTO `notas` (`id`, `titulo`, `texto`, `imagen`, `status`, `created_at`, `updated_at`) VALUES
(6, 'Quienes Somos', '<p style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding: 0px; color: #212529; font-family: GothamBook; font-size: 16px; letter-spacing: 1px;\">Somos una empresa Tucumana con proyecci&oacute;n nacional (con env&iacute;os diarios a todas las ciudades del pais) dedicada &iacute;ntegramente a la venta Mayorista de insumos de estetica.&nbsp;</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding: 0px; color: #212529; font-family: GothamBook; font-size: 16px; letter-spacing: 1px;\">Actualmente somos distribuidores oficiales de Coty Argentina para las Marcas OPI, Sally hansen, Rimmel y Risque. Tenemos la distribuci&oacute;n exclusiva mayorista para las Marcas Meline, Cherimoya, Pink Mask, &Aacute;ngela Bresciano, Thuya, Collage, Depimiel, Neicha, Delfina Sol, entre otras.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding: 0px; color: #212529; font-family: GothamBook; font-size: 16px; letter-spacing: 1px;\">Nuestra Meta es acercar lo mas novedoso al mejor precio del mercado. Nos distinguimos por estar a la vanguardia en insumos y productos.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding: 0px; color: #212529; font-family: GothamBook; font-size: 16px; letter-spacing: 1px;\">Nuestro compromiso es la mejora continua y la calida atenci&oacute;n.</p>', 'notas/January2021/IlZk4m3Qt2xb4kmTQOvf.jpg', '1', '2021-01-17 04:00:30', '2021-01-17 04:00:30'),
(7, 'Medios de Pago', '<p style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding: 0px; color: #212529; font-family: GothamBook; font-size: 16px; letter-spacing: 1px;\">🟣Transferencia bancaria&nbsp;</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding: 0px; color: #212529; font-family: GothamBook; font-size: 16px; letter-spacing: 1px;\">🟣Deposito en Banco Santander&nbsp;</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding: 0px; color: #212529; font-family: GothamBook; font-size: 16px; letter-spacing: 1px;\">*Mercado pago (envi&oacute; de dinero)</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding: 0px; color: #212529; font-family: GothamBook; font-size: 16px; letter-spacing: 1px;\">*Rapi Pago o Pago F&aacute;cil</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding: 0px; color: #212529; font-family: GothamBook; font-size: 16px; letter-spacing: 1px;\">*Tarjeta de debito 7% de recargo</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding: 0px; color: #212529; font-family: GothamBook; font-size: 16px; letter-spacing: 1px;\">*Tarjetas de cr&eacute;dito (Visa, MasterCard o American Express de Bancos)</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding: 0px; color: #212529; font-family: GothamBook; font-size: 16px; letter-spacing: 1px;\">* 1 cuota 8% de recargo</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding: 0px; color: #212529; font-family: GothamBook; font-size: 16px; letter-spacing: 1px;\">&bull;Ahora 3- 10% de recargo</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding: 0px; color: #212529; font-family: GothamBook; font-size: 16px; letter-spacing: 1px;\">&bull;Ahora 6- 20% de recargo</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding: 0px; color: #212529; font-family: GothamBook; font-size: 16px; letter-spacing: 1px;\">&bull;Ahora 12- 30% de recargo</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding: 0px; color: #212529; font-family: GothamBook; font-size: 16px; letter-spacing: 1px;\">🟣Tarjeta Naranja - 10% de recargo en 1 cuota (financiaci&oacute;n a cargo del cliente a trav&eacute;s de Mercado Pago)</p>\r\n<ul>\r\n<li style=\"box-sizing: border-box; color: #212529; font-family: GothamBook; font-size: 16px; letter-spacing: 1px;\">Tarjeta Visa - Mastercard no Bancarizadas 10% de recargo en 1 cuota - 20% de recargo en 3 cuotas</li>\r\n</ul>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding: 0px; color: #212529; font-family: GothamBook; font-size: 16px; letter-spacing: 1px;\">🟣Tarjeta de debito 7% de recargo a trav&eacute;s de Mercado pago</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding: 0px; color: #212529; font-family: GothamBook; font-size: 16px; letter-spacing: 1px;\"><img src=\"http://ecommerce.ddns.net/storage/notas/January2021/rPTEz1fgjdwtSWrBfeuh.jpg\" alt=\"\" /></p>', NULL, '1', '2021-01-17 04:01:00', '2022-12-28 00:42:46'),
(8, 'Términos y Condiciones', '<p style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding: 0px; color: #212529; font-family: GothamBook; font-size: 16px; letter-spacing: 1px;\">DISTRIBUIDORA LOOK TUCUMAN recomienda la lectura previa y detenida de las condiciones que aqu&iacute; se establecen para un correcto uso de los servicios y contenidos que brinda DISTLOOKTUCUMAN.COM.AR.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding: 0px; color: #212529; font-family: GothamBook; font-size: 16px; letter-spacing: 1px;\">El uso de estos servicios y contenidos implica la aceptaci&oacute;n de estos T&Eacute;RMINOS Y CONDICIONES y de las modificaciones que en el futuro se incorporen. En caso de no estar de acuerdo con las condiciones mencionados, se ruega no utilizar DISTLOOKTUCUMAN.COM.AR.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding: 0px; color: #212529; font-family: GothamBook; font-size: 16px; letter-spacing: 1px;\">Los T&Eacute;RMINOS Y CONDICIONES expuestos son efectivos y aplican para la utilizaci&oacute;n de los servicios y contenidos que se muestran en DISTLOOKTUCUMAN.COM.AR y permanecen accesibles al p&uacute;blico general mediante los enlaces dispuestos a tal efecto en este SITIO.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding: 0px; color: #212529; font-family: GothamBook; font-size: 16px; letter-spacing: 1px;\">El uso indebido de los servicios y contenidos que se muestra en DISTLOOKTUCUMAN.COM.AR, todo acto doloso o fraudulento provocado mediante el uso de esos servicios y contenidos, y/o el incumplimiento de los T&Eacute;RMINOS Y CONDICIONES supone la inmediata suspensi&oacute;n del USUARIO para el acceso al SITIO sin perjuicio de la interposici&oacute;n de las acciones que correspondan a efectos de reparar los da&ntilde;os ocasionados a DISTRIBUIDORA LOOK.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding: 0px; color: #212529; font-family: GothamBook; font-size: 16px; letter-spacing: 1px;\">T&eacute;rminos Definidos Los t&eacute;rminos que a continuaci&oacute;n se definen tienen los siguientes significados y alcances: DISTLOOKTUCUMAN.COM.AR: refiere a DISTRIBUIDORA LOOK DISTLOOKTUCUMAN.COM.AR / SITIO: refiere a http://www.distlooktucuman.com.ar/ T&Eacute;RMINOS Y CONDICIONES: refiere a estos T&eacute;rminos y Condiciones, Generales y Espec&iacute;ficos y las modificaciones que en el futuro se incorporen a exclusivo criterio de DISTRIBUIDORA LOOK. USUARIO: refiere a aquel que ha hecho uso del SITIO aceptando as&iacute; los T&Eacute;RMINOS Y CONDICIONES. PRODUCTO: refiere a cualquier producto y/o accesorio que se muestran en http://www.distlooktucuman.com.ar/ especialmente en cuanto a los modelos, colores y stock de los mismos. DISE&Ntilde;ADOR: refiere al propietario de los PRODUCTOS que se muestran en DISTLOOKTUCUMAN.COM.AR NOMBRE DE USUARIO: refiere al nombre de fantas&iacute;a elegido por el USUARIO y que le ser&aacute; solicitado cada vez que acceda a la Cuenta de Usuario. CONTRASE&Ntilde;A: refiere al c&oacute;digo de hasta [8] caracteres compuesto por, letras y n&uacute;meros, ingresado por el USUARIO, de su exclusivo conocimiento, y que le ser&aacute; requerido para acceder a la Cuenta de Usuario. PAQUETE: refiere al PRODUCTO adquirido por el USUARIO en poder de [la empresa de env&iacute;os]. DOMICILIO DE ENTREGA: refiere al domicilio que el USUARIO establece al momento de realizar la Compra para la Entrega del PAQUETE. RANGO HORARIO: refiere al per&iacute;odo de tiempo en el cual el USUARIO se compromete a estar disponible en el DOMICILIO DE ENTREGA para la recepci&oacute;n del PAQUETE. Contenido de DISTLOOKTUCUMAN.COM.AR DISTLOOKTUCUMAN.COM.AR consiste en un portal de internet que ofrece al USUARIO productos profesionales de est&eacute;tica a fin de adquirir sus productos. Identificaci&oacute;n del SITIO. Este SITIO se individualiza con el dominio http://www.distlooktucuman.com.ar/. El mismo se encuentra registrado y es propiedad de DISTRIBUIDORA LOOK TUCUMAN, inscripta al Registro de Sociedades Comerciales conforme los datos que siguen: Domicilio social: DEAN FUNES 63 &ndash; DUPLEX 4&nbsp; ALTURA MATE DE LUNA 4300 &ndash; SAN MIGUEL DE TUCUMAN CUIT: 30-71614755-6.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding: 0px; color: #212529; font-family: GothamBook; font-size: 16px; letter-spacing: 1px;\">Aceptaci&oacute;n de Los T&eacute;rminos y Condiciones</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding: 0px; color: #212529; font-family: GothamBook; font-size: 16px; letter-spacing: 1px;\">Para utilizar los servicios y contenidos que se muestran en DISTLOOKTUCUMAN.COM.AR los USUARIOS deben leer y aceptar las condiciones establecidas en los T&Eacute;RMINOS Y CONDICIONES. Se entiende que el USUARIO que haga uso de DISTLOOKTUCUMAN.COM.AR ha aceptado, previamente, las condiciones establecidas en los T&Eacute;RMINOS Y CONDICIONES quedando sujeto a ellas y a las modificaciones que en el futuro se incorporen.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding: 0px; color: #212529; font-family: GothamBook; font-size: 16px; letter-spacing: 1px;\">Responsabilidad</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding: 0px; color: #212529; font-family: GothamBook; font-size: 16px; letter-spacing: 1px;\">El uso de DISTLOOKTUCUMAN.COM.AR y los servicios y contenidos que muestra queda reservado exclusivamente para toda persona f&iacute;sica y/o jur&iacute;dica con capacidad legal para celebrar contratos o contratar a nombre de otro, comprar, o de cualquier otra forma obligar u obligarse conforme las leyes aplicables de la Rep&uacute;blica Argentina. Queda prohibido el uso de DISTLOOKTUCUMAN.COM.AR a toda persona que no posea la capacidad referida.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding: 0px; color: #212529; font-family: GothamBook; font-size: 16px; letter-spacing: 1px;\">DISTRIBUIDORA LOOK, sus directores, gerentes, agentes, representantes u otros vinculados, seg&uacute;n corresponda, no se responsabilizan por el mal uso del sitio.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding: 0px; color: #212529; font-family: GothamBook; font-size: 16px; letter-spacing: 1px;\">Ley Aplicable Los T&Eacute;RMINOS Y CONDICIONES en cuanto a su interpretaci&oacute;n, alcance, aplicaci&oacute;n y los efectos jur&iacute;dicos que produzcan se rigen por las leyes de la Rep&uacute;blica Argentina con exclusi&oacute;n de la normativa vigente en materia de conflicto de leyes. Jurisdicci&oacute;n Toda controversia derivada de los T&Eacute;RMINOS Y CONDICIONES, su existencia, validez, interpretaci&oacute;n, alcance, aplicaci&oacute;n y/o cumplimiento as&iacute; como tambi&eacute;n del uso de DISTLOOKTUCUMAN.COM.AR, los servicios y contenidos, queda sometida a los tribunales ordinarios de la Ciudad Aut&oacute;noma de Buenos Aires y los procedimientos se llevar&aacute;n a cabo conforme la normativa aplicable.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding: 0px; color: #212529; font-family: GothamBook; font-size: 16px; letter-spacing: 1px;\">T&eacute;rminos y condiciones espec&iacute;ficos</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding: 0px; color: #212529; font-family: GothamBook; font-size: 16px; letter-spacing: 1px;\">Cuentas de Usuario Para utilizar DISTLOOKTUCUMAN.COM.AR es necesario que el USUARIO se registre generando un NOMBRE DE USUARIO y una CONTRASE&Ntilde;A que le ser&aacute;n requeridos cada vez que utilice el SITIO.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding: 0px; color: #212529; font-family: GothamBook; font-size: 16px; letter-spacing: 1px;\">Para generar una Cuenta de Usuario, el USUARIO deber&aacute; proporcionar DATOS PERSONALES que incluyen pero no se limitan a nombre, apellido, g&eacute;nero, tel&eacute;fono, tel&eacute;fono celular, e-mail, domicilio, domicilio de entrega, c&oacute;digo postal, documento de identificaci&oacute;n personal. Los datos proporcionados por el USUARIO deben ser reales y actuales y el USUARIO se compromete a actualizar cualquier modificaci&oacute;n de los mismos a trav&eacute;s de la opci&oacute;n &ldquo;Modificar Datos&rdquo; en el SITIO.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding: 0px; color: #212529; font-family: GothamBook; font-size: 16px; letter-spacing: 1px;\">DISTLOOKTUCUMAN.COM.AR recomienda al USUARIO no divulgar el NOMBRE DE USUARIO, la CONTRASE&Ntilde;A y/o los DATOS PERSONALES a terceros. Los datos del USUARIO proporcionados a DISTLOOKTUCUMAN.COM.AR son para uso exclusivo de los servicios y contenidos que se muestran en el SITIO. DISTLOOKTUCUMAN.COM.AR se compromete a emplear los esfuerzos razonables para proteger y mantener la privacidad de los datos informados por el USUARIO.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding: 0px; color: #212529; font-family: GothamBook; font-size: 16px; letter-spacing: 1px;\">DISTRIBUIDORA LOOK no es responsable por el uso indebido de los datos del USUARIO por el USUARIO y/o por un tercero. En caso de que el USUARIO advierta el uso indebido de la Cuenta de Usuario o el robo de la CONTRASE&Ntilde;A, deber&aacute; informarlo a DISTLOOKTUCUMAN.COM.AR a trav&eacute;s del e-mail (consultas@distlooktucuman.com.ar) de contacto en el plazo de 5 (CINCO) d&iacute;as desde que se realiz&oacute; la operaci&oacute;n. Vencido el plazo sin que el USUARIO haya informado respecto del uso indebido y/o robo, las operaciones realizadas por medio de la Cuenta de Usuario en cuesti&oacute;n ser&aacute;n de exclusiva responsabilidad y a cargo del USUARIO.&nbsp;</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding: 0px; color: #212529; font-family: GothamBook; font-size: 16px; letter-spacing: 1px;\">Pedidos</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding: 0px; color: #212529; font-family: GothamBook; font-size: 16px; letter-spacing: 1px;\">Todos los Pedidos se realizan exclusivamente a trav&eacute;s de la PLANILLA DE PEDIDOS en DISTLOOKTUCUMAN.COM.AR.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding: 0px; color: #212529; font-family: GothamBook; font-size: 16px; letter-spacing: 1px;\">Los Pedidos efectuados est&aacute;n sujetos a la disponibilidad de PRODUCTO y a la APROBACI&Oacute;N por DISTRIBUIDORA LOOK, conforme el apartado &ldquo;Disponibilidad de Productos y Stock&rdquo;. Para realizar un Pedido, el USUARIO deber&aacute; seleccionar el PRODUCTO e ingresarlo al &ldquo;Carrito de compras&rdquo;. Una vez finalizada la selecci&oacute;n del PRODUCTO, el USUARIO deber&aacute; hacer click en &ldquo;Comprar&rdquo;. A partir de ese momento el USUARIO se compromete a la recepci&oacute;n y pago del PRODUCTO adquirido. Realizada la Compra DISTLOOKTUCUMAN.COM.AR enviar&aacute; un e-mail de APROBACI&Oacute;N confirmando: el PRODUCTO a entregar, el precio total de la Compra, el plazo de Entrega y el N&uacute;mero de Rastreo para el seguimiento del Env&iacute;o.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding: 0px; color: #212529; font-family: GothamBook; font-size: 16px; letter-spacing: 1px;\">Precios y Liquidaciones</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding: 0px; color: #212529; font-family: GothamBook; font-size: 16px; letter-spacing: 1px;\">Todos los Precios publicados en DISTLOOKTUCUMAN.COM.AR incluyen IVA y no incluyen gastos de env&iacute;o, cambios y/o devoluciones. Todos los Precios est&aacute;n expresados en moneda argentina. La modificaci&oacute;n y comparaci&oacute;n de los Precios y los descuentos aplicables sobre el PRODUCTO es establecido por el DISE&Ntilde;ADOR. DISTLOOKTUCUMAN.COM.AR modificar&aacute; los Precios publicados a solicitud del DISE&Ntilde;ADOR.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding: 0px; color: #212529; font-family: GothamBook; font-size: 16px; letter-spacing: 1px;\">DISTLOOKTUCUMAN.COM.AR se reserva el derecho de aplicar al Precio los impuestos y tributos que en el futuro se incorporen al R&eacute;gimen Tributario Argentino. El PRODUCTO permanece en propiedad del DISE&Ntilde;ADOR hasta el momento en &eacute;l se haya producido el pago total del Precio. El Precio facturado ser&aacute; el Precio del PRODUCTO al momento de realizar la Compra con excepci&oacute;n de lo dispuesto en el apartado de &ldquo;Devoluciones y Cambios&rdquo;. Disponibilidad de los Productos y Stock.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding: 0px; color: #212529; font-family: GothamBook; font-size: 16px; letter-spacing: 1px;\">El stock del PRODUCTO publicado en DISTLOOKTUCUMAN.COM.AR refiere a la cantidad de PRODUCTO existente en poder del DISE&Ntilde;ADOR. DISTLOOKTUCUMAN.COM.AR no se responsabiliza por la falta o indisponibilidad de Stock.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding: 0px; color: #212529; font-family: GothamBook; font-size: 16px; letter-spacing: 1px;\">&nbsp;</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding: 0px; color: #212529; font-family: GothamBook; font-size: 16px; letter-spacing: 1px;\">Pago</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding: 0px; color: #212529; font-family: GothamBook; font-size: 16px; letter-spacing: 1px;\">A efectos del pago, DISTLOOKTUCUMAN.COM.AR requiere informaci&oacute;n respecto de la manera de instrumentar el Pago del PRODUCTO que se adquiera la que incluye pero no se limita a n&uacute;mero de tarjeta de d&eacute;bito o cr&eacute;dito, nombre del titular, clave de seguridad, entidad bancaria emisora, fecha de vencimiento. Una vez que el USUARIO elige la opci&oacute;n COMPRAR se compromete al pago total de todo PRODUCTO que haya sido incluido en el Carrito de Compras. Los pagos se realizan a trav&eacute;s de MercadoPago, Transferencia Bancaria, Deposito en Banco, Rapi Pago o Pago F&aacute;cil, Tarjetas de Cr&eacute;dito con m&iacute;nimo inter&eacute;s.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding: 0px; color: #212529; font-family: GothamBook; font-size: 16px; letter-spacing: 1px;\">DISTRIBUIDORA LOOK y/o MERCADOPAGO se reservan el derecho de solicitar y/o verificar con el banco emisor la informaci&oacute;n, estado de deuda y cualquier otro dato relevante a fin de evitar posibles fraudes y abusos. Todas las tarjetas de cr&eacute;dito est&aacute;n sujetas a la aprobaci&oacute;n del banco emisor. En caso de que el medio de pago utilizado por el USUARIO sea denegado, DISTLOOKTUCUMAN.COM.AR cancelar&aacute; autom&aacute;ticamente el Pedido e informar&aacute; al USUARIO esta situaci&oacute;n. Los Pagos se realizan exclusivamente en moneda nacional de curso legal.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding: 0px; color: #212529; font-family: GothamBook; font-size: 16px; letter-spacing: 1px;\">Env&iacute;o</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding: 0px; color: #212529; font-family: GothamBook; font-size: 16px; letter-spacing: 1px;\">Las empresas responsables del Env&iacute;o y Entrega es BUS PACK, CORREO ARGENTINO, INTEGRAL PACK, VIA CARGO. DISTLOOKTUCUMAN.COM.AR no se responsabiliza por la p&eacute;rdida, robo, extrav&iacute;o y/o cualquier da&ntilde;o ocasionado sobre y/o por el PAQUETE para Env&iacute;o una vez que se encuentre en poder de [la empresa de transporte]. Todos los Env&iacute;os y Entregas se realizan exclusivamente dentro de la Rep&uacute;blica Argentina.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding: 0px; color: #212529; font-family: GothamBook; font-size: 16px; letter-spacing: 1px;\">Entrega</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding: 0px; color: #212529; font-family: GothamBook; font-size: 16px; letter-spacing: 1px;\">El USUARIO deber&aacute; especificar un DOMICILIO DE ENTREGA. El DOMICILIO DE ENTREGA podr&aacute; ser modificado por el USUARIO en cada operaci&oacute;n que realice. Se entiende que la Entrega del PAQUETE, los Cambios y los Gifts se realizar&aacute;n en el DOMICILIO DE ENTREGA y dentro del RANGO HORARIO establecidos por el USUARIO. LAS EMPRESAS DE ENVIO realizar&aacute;n hasta 2 (DOS) visitas en el DOMICILIO DE ENTREGA. En caso de no encontrar a nadie en la primera visita, dejar&aacute;n un Aviso de Visita especificando el d&iacute;a y horario en el que har&aacute; la pr&oacute;xima visita. En caso de que en esta segunda visita no logre entregar el PAQUETE, LAS EMPRESAS MENCIONADAS ANTERIORMENTE dejar&aacute;n un n&uacute;mero de contacto para que el USUARIO se comunique y coordine la nueva entrega.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding: 0px; color: #212529; font-family: GothamBook; font-size: 16px; letter-spacing: 1px;\">Los PAQUETES son entregados con el packaging elegido por el DISE&Ntilde;ADOR del PRODUCTO.&nbsp;</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding: 0px; color: #212529; font-family: GothamBook; font-size: 16px; letter-spacing: 1px;\">Al momento de la Entrega, el USUARIO deber&aacute; firmar el Acuse de Recibo. En caso de que los PRODUCTOS del PAQUETE se encuentren en mal estado o contengan fallas tales como, pero sin limitar a, roturas, alteraciones en el color, costura zafada, etc&eacute;tera, el USUARIO deber&aacute; informar de estas fallas a DISTLOOKTUCUMAN.COM.AR por el mail de contacto y en el plazo m&aacute;ximo de 48 horas desde la entrega. Los costos de env&iacute;o para la devoluci&oacute;n y reposici&oacute;n de los PRODUCTOS en mal estado o que contengan fallas corren por cuenta de DISTLOOKTUCUMAN.COM.AR.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding: 0px; color: #212529; font-family: GothamBook; font-size: 16px; letter-spacing: 1px;\">&nbsp;</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding: 0px; color: #212529; font-family: GothamBook; font-size: 16px; letter-spacing: 1px;\">Devoluciones y Cambios</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding: 0px; color: #212529; font-family: GothamBook; font-size: 16px; letter-spacing: 1px;\">S&oacute;lo se aceptar&aacute;n Devoluciones y Cambios del PRODUCTO cuando: 1) Tenga fallas o se encuentre en mal estado: refiere a los supuesto del apartado N&deg; [entrega] debiendo el USUARIO informar a DISTLOOKTUCUMAN.COM.AR en el t&eacute;rmino de hasta 48 horas contados desde la recepci&oacute;n del PAQUETE. 2) El Env&iacute;o no coincida con el Pedido: en este caso el USUARIO deber&aacute; solicitar el Cambio dentro de 10 (DIEZ) d&iacute;as desde la entrega. El PRODUCTO deber&aacute; ser devuelto, sin excepci&oacute;n, en perfecto estado, sin uso y con las etiquetas colocadas. Asimismo, deber&aacute; ser devuelto en su envoltorio original y dentro del packaging con el que fue entregado para asegurar su protecci&oacute;n durante el env&iacute;o. DISTLOOKTUCUMAN.COM.AR se reserva el derecho de no admitir Cambios cuando el PRODUCTO sea devuelto sin cumplir las condiciones anteriores.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding: 0px; color: #212529; font-family: GothamBook; font-size: 16px; letter-spacing: 1px;\">En el caso de que el comprador haya elegido la opci&oacute;n de retiro en sucursal, el cambio o devoluci&oacute;n se har&aacute; a trav&eacute;s de ese medio. El comprador se dirige a la sucursal luego de haber coordinado telef&oacute;nicamente el cambio o devoluci&oacute;n. En el caso de haber recibido el producto por transporte, se podr&aacute; hacer el cambio o devoluci&oacute;n por este medio. Dependiendo la causa del cambio o devoluci&oacute;n, el costo del env&iacute;o depender&aacute; del comprador o del vendedor.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding: 0px; color: #212529; font-family: GothamBook; font-size: 16px; letter-spacing: 1px;\">Reembolso: El reembolso de la compra se har&aacute; efectivo por el mismo medio que el comprador pag&oacute;.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding: 0px; color: #212529; font-family: GothamBook; font-size: 16px; letter-spacing: 1px;\">Tiempo de devoluci&oacute;n: El tiempo estimado de la devoluci&oacute;n depender&aacute; del medio por el cual se env&iacute;e el producto a devolver. Puede demorar de 3 a 10 d&iacute;as h&aacute;biles luego de haber coordinado telef&oacute;nicamente la solicitud de devoluci&oacute;n.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding: 0px; color: #212529; font-family: GothamBook; font-size: 16px; letter-spacing: 1px;\">&nbsp;Declaraciones y Garant&iacute;as</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding: 0px; color: #212529; font-family: GothamBook; font-size: 16px; letter-spacing: 1px;\">El USUARIO garantiza la veracidad de la informaci&oacute;n aportada al SITIO tanto los datos personales como as&iacute; tambi&eacute;n los datos requeridos para instrumentar el Pago y el Env&iacute;o y Entrega.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding: 0px; color: #212529; font-family: GothamBook; font-size: 16px; letter-spacing: 1px;\">DISTRIBUIDORA LOOK est&aacute; autorizado para proporcionar servicios de soporte relacionados con los contenidos que se publican en DISTLOOKTUCUMAN.COM.AR. DISTRIBUIDORA LOOK se reserva el derecho de modificar las condiciones generales y/o particulares de venta sin previo aviso, pudiendo cambiar, suprimir y/o a&ntilde;adir, en parte y/o partes, tanto contenidos y/o servicios que se presten a trav&eacute;s del SITIO como as&iacute; tambi&eacute;n la disposici&oacute;n de los mismo y/o la localizaci&oacute;n en sus servidores. El mismo derecho se reserva en caso de que se sancionen modificaciones legislativas que ordenen llevar adelante la incorporaci&oacute;n de cambios en relaci&oacute;n a las condiciones de venta. DISTRIBUIDORA LOOK no es responsable por los da&ntilde;os que se ocasionen por causas de fuerza mayor las que incluyen pero no se limitan a huelgas, problemas con el servidor.[&hellip;]</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding: 0px; color: #212529; font-family: GothamBook; font-size: 16px; letter-spacing: 1px;\">Propiedad Intelectual e Industrial</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding: 0px; color: #212529; font-family: GothamBook; font-size: 16px; letter-spacing: 1px;\">La informaci&oacute;n contenida en el SITIO, su dise&ntilde;o y el software utilizado son de exclusiva propiedad de DISTRIBUIDORA LOOK salvo la informaci&oacute;n y software que pertenece a un tercero.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding: 0px; color: #212529; font-family: GothamBook; font-size: 16px; letter-spacing: 1px;\">DISTLOOKTUCUMAN.COM.AR es para exclusivo uso personal, queda prohibido cualquier otro uso que incluye pero no se limita al uso comercial, modificar, copiar, distribuir, transmitir, reproducir, publicar y/o cualquier otra acci&oacute;n que signifique explotaci&oacute;n comercial por el USUARIO y/o un tercero.</p>', NULL, '1', '2021-01-17 04:02:36', '2021-01-17 04:02:36');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `n_categorymarcas`
--

CREATE TABLE `n_categorymarcas` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(11) UNSIGNED DEFAULT NULL,
  `marca_id` int(11) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `n_categorymarcas`
--

INSERT INTO `n_categorymarcas` (`id`, `category_id`, `marca_id`, `created_at`, `updated_at`) VALUES
(4, 26, 2, '2020-03-14 23:55:12', '2020-03-14 23:55:12'),
(5, 26, 3, '2020-03-14 23:56:01', '2020-03-14 23:56:01'),
(6, 26, 4, '2020-03-14 23:56:29', '2020-03-14 23:56:29'),
(7, 26, 5, '2020-03-14 23:56:50', '2020-03-14 23:56:50'),
(8, 26, 6, '2020-03-14 23:57:14', '2020-03-14 23:57:14'),
(9, 26, 7, '2020-03-14 23:57:40', '2020-03-14 23:57:40'),
(10, 26, 8, '2020-03-14 23:58:05', '2020-03-14 23:58:05'),
(11, 26, 9, '2020-03-14 23:58:44', '2020-03-14 23:58:44'),
(12, 27, 10, '2020-03-15 00:02:08', '2020-03-15 00:02:08'),
(13, 27, 11, '2020-03-15 00:02:40', '2020-03-15 00:02:40'),
(14, 27, 7, '2020-03-15 00:03:21', '2020-03-15 00:03:21'),
(15, 27, 9, '2020-03-15 00:03:48', '2020-03-15 00:03:48'),
(16, 27, 2, '2020-03-15 00:04:09', '2020-03-15 00:04:09'),
(17, 27, 8, '2020-03-15 00:04:31', '2020-03-15 00:04:31'),
(18, 8, 3, '2020-03-15 00:04:56', '2020-03-15 00:04:56'),
(19, 8, 18, '2020-03-15 00:06:13', '2020-03-15 00:06:13'),
(20, 8, 4, '2020-03-15 00:06:32', '2020-03-15 00:06:32'),
(21, 8, 6, '2020-03-15 00:07:03', '2020-03-15 00:07:03'),
(22, 8, 8, '2020-03-15 00:07:20', '2020-03-15 00:07:20'),
(23, 8, 7, '2020-03-15 00:07:43', '2020-03-15 00:07:43'),
(24, 70, 19, '2020-03-15 00:08:07', '2020-03-15 00:08:07'),
(25, 70, 20, '2020-03-15 00:08:00', '2020-03-15 00:08:53'),
(26, 70, 21, '2020-03-15 00:09:19', '2020-03-15 00:09:19'),
(27, 7, 22, '2020-03-15 00:09:53', '2020-03-15 00:09:53'),
(28, 7, 3, '2020-03-15 00:10:33', '2020-03-15 00:10:33'),
(29, 7, 23, '2020-03-15 00:10:51', '2020-03-15 00:10:51'),
(30, 7, 21, '2020-03-15 00:11:19', '2020-03-15 00:11:19'),
(31, 7, 24, '2020-03-15 00:11:47', '2020-03-15 00:11:47'),
(32, 10, 25, '2020-03-15 00:12:00', '2020-03-15 00:12:21'),
(33, 10, 26, '2020-03-15 00:12:59', '2020-03-15 00:12:59'),
(34, 10, 27, '2020-03-15 00:13:28', '2020-03-15 00:13:28'),
(35, 10, 28, '2020-03-15 00:14:07', '2020-03-15 00:14:07'),
(36, 10, 29, '2020-03-15 00:14:28', '2020-03-15 00:14:28'),
(37, 10, 30, '2020-03-15 00:14:53', '2020-03-15 00:14:53'),
(38, 10, 31, '2020-03-15 00:15:16', '2020-03-15 00:15:16'),
(39, 12, 32, '2020-03-15 00:15:44', '2020-03-15 00:15:44'),
(40, 12, 21, '2020-03-15 00:16:10', '2020-03-15 00:16:10'),
(41, 138, 19, '2020-03-15 00:22:43', '2020-03-15 00:22:43'),
(42, 138, 21, '2020-03-15 00:23:16', '2020-03-15 00:23:16'),
(43, 139, 21, '2020-03-15 00:27:37', '2020-03-15 00:27:37'),
(44, 11, 6, '2020-03-15 00:28:15', '2020-03-15 00:28:15'),
(45, 11, 4, '2020-03-15 00:29:14', '2020-03-15 00:29:14'),
(46, 11, 33, '2020-03-15 00:30:07', '2020-03-15 00:30:07'),
(47, 11, 34, '2020-03-15 00:30:38', '2020-03-15 00:30:38'),
(48, 11, 23, '2020-03-15 00:30:55', '2020-03-15 00:30:55'),
(49, 140, 35, '2020-03-15 00:31:22', '2020-03-15 00:31:22'),
(50, 140, 36, '2020-03-15 00:31:54', '2020-03-15 00:31:54'),
(51, 11, 32, '2020-03-27 03:05:05', '2020-03-27 03:05:05'),
(52, 6, 8, '2020-03-29 01:53:00', '2020-03-29 01:56:29'),
(53, 6, 20, '2020-03-29 02:32:48', '2020-03-29 02:32:48'),
(54, 106, 21, '2020-03-29 06:28:49', '2020-03-29 06:28:49'),
(55, 6, 3, '2020-03-30 07:09:24', '2020-03-30 07:09:24'),
(56, 6, 6, '2020-03-30 07:20:53', '2020-03-30 07:20:53'),
(57, 6, 9, '2020-03-30 22:41:03', '2020-03-30 22:41:03'),
(58, 6, 35, '2020-03-31 01:52:57', '2020-03-31 01:52:57'),
(59, 13, 39, '2020-03-31 03:17:00', '2020-03-31 03:18:16'),
(60, 6, 10, '2020-03-31 17:53:46', '2020-03-31 17:53:46'),
(61, 7, 10, '2020-03-31 18:02:06', '2020-03-31 18:02:06'),
(62, 26, 10, '2020-04-09 23:38:41', '2020-04-09 23:38:41'),
(63, 13, 10, '2020-04-10 22:07:52', '2020-04-10 22:07:52'),
(64, 27, 32, '2020-04-11 01:59:00', '2020-04-11 02:00:06'),
(65, 6, 32, '2020-04-11 02:04:11', '2020-04-11 02:04:11'),
(66, 139, 32, '2020-04-16 22:23:25', '2020-04-16 22:23:25'),
(67, 26, 11, '2020-04-17 19:20:00', '2020-04-17 19:20:49'),
(68, 6, 11, '2020-04-17 19:21:15', '2020-04-17 19:21:15'),
(69, 70, 20, '2020-04-20 23:01:00', '2020-04-20 23:01:38'),
(70, 9, 20, '2020-04-20 23:01:57', '2020-04-20 23:01:57'),
(71, 12, 39, '2020-04-21 19:00:55', '2020-04-21 19:00:55'),
(72, 134, 39, '2020-04-21 19:01:46', '2020-04-21 19:01:46'),
(73, 139, 39, '2020-04-28 21:39:00', '2020-04-28 21:40:24'),
(74, 112, 34, '2020-04-29 03:29:06', '2020-04-29 03:29:06'),
(75, 106, 34, '2020-04-29 21:42:39', '2020-04-29 21:42:39'),
(76, 10, 34, '2020-04-29 21:42:58', '2020-04-29 21:42:58'),
(77, 6, 39, '2020-05-01 03:46:49', '2020-05-01 03:46:49'),
(78, 26, 2, '2020-05-04 21:53:05', '2020-05-04 21:53:05'),
(79, 6, 2, '2020-05-04 21:53:26', '2020-05-04 21:53:26'),
(80, 14, 24, '2020-05-06 00:29:09', '2020-05-06 00:29:09'),
(81, 6, 24, '2020-05-06 00:29:56', '2020-05-06 00:29:56'),
(82, 12, 44, '2020-05-07 03:12:00', '2020-05-07 03:13:18'),
(83, 6, 21, '2020-05-08 01:12:51', '2020-05-08 01:12:51'),
(84, 11, 33, '2020-05-08 18:09:17', '2020-05-08 18:09:17'),
(85, 10, 21, '2020-05-19 00:12:52', '2020-05-19 00:12:52'),
(86, 6, 43, '2020-05-20 17:55:00', '2020-05-20 17:59:52'),
(87, 28, 8, '2020-05-21 02:50:21', '2020-05-21 02:50:21'),
(88, 6, 4, '2020-05-26 22:09:11', '2020-05-26 22:09:11'),
(89, 12, 35, '2020-05-28 05:44:33', '2020-05-28 05:44:33'),
(90, 139, 35, '2020-05-29 02:45:49', '2020-05-29 02:45:49'),
(91, 138, 35, '2020-06-01 03:27:09', '2020-06-01 03:27:09');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `n_modelomarcas`
--

CREATE TABLE `n_modelomarcas` (
  `id` int(10) UNSIGNED NOT NULL,
  `marca_id` int(10) UNSIGNED DEFAULT NULL,
  `modelo_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos`
--

CREATE TABLE `pagos` (
  `id` int(11) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `pasarela` varchar(50) NOT NULL,
  `monto` int(11) NOT NULL,
  `status` varchar(50) NOT NULL,
  `payment_method` varchar(50) DEFAULT NULL,
  `external_reference` varchar(50) NOT NULL,
  `orden_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `preference_id` varchar(255) DEFAULT NULL,
  `metodo_entrega` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos_compras`
--

CREATE TABLE `pagos_compras` (
  `id` int(11) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `pago_id` int(11) NOT NULL,
  `producto_name` varchar(255) NOT NULL,
  `images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` int(11) NOT NULL,
  `color_id` int(11) UNSIGNED DEFAULT NULL,
  `talle_id` int(11) UNSIGNED DEFAULT NULL,
  `descuento` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `body` text DEFAULT NULL,
  `marca_id` int(11) UNSIGNED DEFAULT NULL,
  `modelo_id` int(11) UNSIGNED DEFAULT NULL,
  `cantidad_promocion` int(11) DEFAULT NULL,
  `precio_promocion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos_detalle`
--

CREATE TABLE `pagos_detalle` (
  `id` int(11) NOT NULL,
  `pago_id` int(11) NOT NULL,
  `holder_name` varchar(50) NOT NULL,
  `payment_id` varchar(50) NOT NULL,
  `net_amount` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status_detail` varchar(50) DEFAULT NULL,
  `total_paid_amount` int(11) DEFAULT NULL,
  `payment_type_id` varchar(50) DEFAULT NULL,
  `installments` int(11) DEFAULT NULL,
  `mercadopago_fee` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos_facturacion`
--

CREATE TABLE `pagos_facturacion` (
  `id` int(10) UNSIGNED NOT NULL,
  `pago_id` int(10) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `empresa` varchar(50) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `domicilio` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `mensaje` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2020-05-09 19:41:09', '2020-05-09 19:41:09'),
(2, 'browse_bread', NULL, '2020-05-09 19:41:09', '2020-05-09 19:41:09'),
(3, 'browse_database', NULL, '2020-05-09 19:41:09', '2020-05-09 19:41:09'),
(4, 'browse_media', NULL, '2020-05-09 19:41:09', '2020-05-09 19:41:09'),
(5, 'browse_compass', NULL, '2020-05-09 19:41:10', '2020-05-09 19:41:10'),
(6, 'browse_menus', 'menus', '2020-05-09 19:41:10', '2020-05-09 19:41:10'),
(7, 'read_menus', 'menus', '2020-05-09 19:41:10', '2020-05-09 19:41:10'),
(8, 'edit_menus', 'menus', '2020-05-09 19:41:10', '2020-05-09 19:41:10'),
(9, 'add_menus', 'menus', '2020-05-09 19:41:10', '2020-05-09 19:41:10'),
(10, 'delete_menus', 'menus', '2020-05-09 19:41:10', '2020-05-09 19:41:10'),
(11, 'browse_roles', 'roles', '2020-05-09 19:41:10', '2020-05-09 19:41:10'),
(12, 'read_roles', 'roles', '2020-05-09 19:41:10', '2020-05-09 19:41:10'),
(13, 'edit_roles', 'roles', '2020-05-09 19:41:10', '2020-05-09 19:41:10'),
(14, 'add_roles', 'roles', '2020-05-09 19:41:10', '2020-05-09 19:41:10'),
(15, 'delete_roles', 'roles', '2020-05-09 19:41:10', '2020-05-09 19:41:10'),
(16, 'browse_users', 'users', '2020-05-09 19:41:10', '2020-05-09 19:41:10'),
(17, 'read_users', 'users', '2020-05-09 19:41:10', '2020-05-09 19:41:10'),
(18, 'edit_users', 'users', '2020-05-09 19:41:10', '2020-05-09 19:41:10'),
(19, 'add_users', 'users', '2020-05-09 19:41:10', '2020-05-09 19:41:10'),
(20, 'delete_users', 'users', '2020-05-09 19:41:10', '2020-05-09 19:41:10'),
(21, 'browse_settings', 'settings', '2020-05-09 19:41:10', '2020-05-09 19:41:10'),
(22, 'read_settings', 'settings', '2020-05-09 19:41:10', '2020-05-09 19:41:10'),
(23, 'edit_settings', 'settings', '2020-05-09 19:41:10', '2020-05-09 19:41:10'),
(24, 'add_settings', 'settings', '2020-05-09 19:41:10', '2020-05-09 19:41:10'),
(25, 'delete_settings', 'settings', '2020-05-09 19:41:10', '2020-05-09 19:41:10'),
(26, 'browse_hooks', NULL, '2020-05-09 19:41:12', '2020-05-09 19:41:12'),
(27, 'browse_notas', 'notas', '2020-05-18 17:17:26', '2020-05-18 17:17:26'),
(28, 'read_notas', 'notas', '2020-05-18 17:17:26', '2020-05-18 17:17:26'),
(29, 'edit_notas', 'notas', '2020-05-18 17:17:26', '2020-05-18 17:17:26'),
(30, 'add_notas', 'notas', '2020-05-18 17:17:26', '2020-05-18 17:17:26'),
(31, 'delete_notas', 'notas', '2020-05-18 17:17:26', '2020-05-18 17:17:26'),
(32, 'browse_posts', 'posts', '2020-05-19 00:32:11', '2020-05-19 00:32:11'),
(33, 'read_posts', 'posts', '2020-05-19 00:32:11', '2020-05-19 00:32:11'),
(34, 'edit_posts', 'posts', '2020-05-19 00:32:11', '2020-05-19 00:32:11'),
(35, 'add_posts', 'posts', '2020-05-19 00:32:11', '2020-05-19 00:32:11'),
(36, 'delete_posts', 'posts', '2020-05-19 00:32:11', '2020-05-19 00:32:11'),
(37, 'browse_sliders', 'sliders', '2020-05-20 18:20:36', '2020-05-20 18:20:36'),
(38, 'read_sliders', 'sliders', '2020-05-20 18:20:36', '2020-05-20 18:20:36'),
(39, 'edit_sliders', 'sliders', '2020-05-20 18:20:36', '2020-05-20 18:20:36'),
(40, 'add_sliders', 'sliders', '2020-05-20 18:20:36', '2020-05-20 18:20:36'),
(41, 'delete_sliders', 'sliders', '2020-05-20 18:20:36', '2020-05-20 18:20:36'),
(42, 'browse_categories', 'categories', '2020-05-20 18:55:11', '2020-05-20 18:55:11'),
(43, 'read_categories', 'categories', '2020-05-20 18:55:11', '2020-05-20 18:55:11'),
(44, 'edit_categories', 'categories', '2020-05-20 18:55:11', '2020-05-20 18:55:11'),
(45, 'add_categories', 'categories', '2020-05-20 18:55:11', '2020-05-20 18:55:11'),
(46, 'delete_categories', 'categories', '2020-05-20 18:55:11', '2020-05-20 18:55:11'),
(47, 'browse_provincias', 'provincias', '2020-05-20 19:08:05', '2020-05-20 19:08:05'),
(48, 'read_provincias', 'provincias', '2020-05-20 19:08:05', '2020-05-20 19:08:05'),
(49, 'edit_provincias', 'provincias', '2020-05-20 19:08:05', '2020-05-20 19:08:05'),
(50, 'add_provincias', 'provincias', '2020-05-20 19:08:05', '2020-05-20 19:08:05'),
(51, 'delete_provincias', 'provincias', '2020-05-20 19:08:05', '2020-05-20 19:08:05'),
(52, 'browse_localidades', 'localidades', '2020-05-20 19:09:32', '2020-05-20 19:09:32'),
(53, 'read_localidades', 'localidades', '2020-05-20 19:09:32', '2020-05-20 19:09:32'),
(54, 'edit_localidades', 'localidades', '2020-05-20 19:09:32', '2020-05-20 19:09:32'),
(55, 'add_localidades', 'localidades', '2020-05-20 19:09:32', '2020-05-20 19:09:32'),
(56, 'delete_localidades', 'localidades', '2020-05-20 19:09:32', '2020-05-20 19:09:32'),
(87, 'browse_posts_visitas', 'posts_visitas', '2020-05-20 19:42:04', '2020-05-20 19:42:04'),
(88, 'read_posts_visitas', 'posts_visitas', '2020-05-20 19:42:04', '2020-05-20 19:42:04'),
(89, 'edit_posts_visitas', 'posts_visitas', '2020-05-20 19:42:04', '2020-05-20 19:42:04'),
(90, 'add_posts_visitas', 'posts_visitas', '2020-05-20 19:42:04', '2020-05-20 19:42:04'),
(91, 'delete_posts_visitas', 'posts_visitas', '2020-05-20 19:42:04', '2020-05-20 19:42:04'),
(97, 'browse_colores', 'colores', '2020-05-20 19:49:25', '2020-05-20 19:49:25'),
(98, 'read_colores', 'colores', '2020-05-20 19:49:25', '2020-05-20 19:49:25'),
(99, 'edit_colores', 'colores', '2020-05-20 19:49:25', '2020-05-20 19:49:25'),
(100, 'add_colores', 'colores', '2020-05-20 19:49:25', '2020-05-20 19:49:25'),
(101, 'delete_colores', 'colores', '2020-05-20 19:49:25', '2020-05-20 19:49:25'),
(102, 'browse_talles', 'talles', '2020-05-20 19:51:51', '2020-05-20 19:51:51'),
(103, 'read_talles', 'talles', '2020-05-20 19:51:51', '2020-05-20 19:51:51'),
(104, 'edit_talles', 'talles', '2020-05-20 19:51:51', '2020-05-20 19:51:51'),
(105, 'add_talles', 'talles', '2020-05-20 19:51:51', '2020-05-20 19:51:51'),
(106, 'delete_talles', 'talles', '2020-05-20 19:51:51', '2020-05-20 19:51:51'),
(117, 'browse_anuncios', 'anuncios', '2020-09-01 22:30:17', '2020-09-01 22:30:17'),
(118, 'read_anuncios', 'anuncios', '2020-09-01 22:30:17', '2020-09-01 22:30:17'),
(119, 'edit_anuncios', 'anuncios', '2020-09-01 22:30:17', '2020-09-01 22:30:17'),
(120, 'add_anuncios', 'anuncios', '2020-09-01 22:30:17', '2020-09-01 22:30:17'),
(121, 'delete_anuncios', 'anuncios', '2020-09-01 22:30:17', '2020-09-01 22:30:17'),
(122, 'browse_carrito', 'carrito', '2020-09-18 23:31:55', '2020-09-18 23:31:55'),
(123, 'read_carrito', 'carrito', '2020-09-18 23:31:55', '2020-09-18 23:31:55'),
(124, 'edit_carrito', 'carrito', '2020-09-18 23:31:55', '2020-09-18 23:31:55'),
(125, 'add_carrito', 'carrito', '2020-09-18 23:31:55', '2020-09-18 23:31:55'),
(126, 'delete_carrito', 'carrito', '2020-09-18 23:31:55', '2020-09-18 23:31:55'),
(127, 'browse_pagos', 'pagos', '2020-09-21 16:43:02', '2020-09-21 16:43:02'),
(128, 'read_pagos', 'pagos', '2020-09-21 16:43:02', '2020-09-21 16:43:02'),
(129, 'edit_pagos', 'pagos', '2020-09-21 16:43:02', '2020-09-21 16:43:02'),
(130, 'add_pagos', 'pagos', '2020-09-21 16:43:02', '2020-09-21 16:43:02'),
(131, 'delete_pagos', 'pagos', '2020-09-21 16:43:02', '2020-09-21 16:43:02'),
(132, 'browse_n_categorymarcas', 'n_categorymarcas', '2021-01-16 19:41:37', '2021-01-16 19:41:37'),
(133, 'read_n_categorymarcas', 'n_categorymarcas', '2021-01-16 19:41:37', '2021-01-16 19:41:37'),
(134, 'edit_n_categorymarcas', 'n_categorymarcas', '2021-01-16 19:41:37', '2021-01-16 19:41:37'),
(135, 'add_n_categorymarcas', 'n_categorymarcas', '2021-01-16 19:41:37', '2021-01-16 19:41:37'),
(136, 'delete_n_categorymarcas', 'n_categorymarcas', '2021-01-16 19:41:37', '2021-01-16 19:41:37'),
(137, 'browse_n_modelomarcas', 'n_modelomarcas', '2021-01-16 19:46:30', '2021-01-16 19:46:30'),
(138, 'read_n_modelomarcas', 'n_modelomarcas', '2021-01-16 19:46:30', '2021-01-16 19:46:30'),
(139, 'edit_n_modelomarcas', 'n_modelomarcas', '2021-01-16 19:46:30', '2021-01-16 19:46:30'),
(140, 'add_n_modelomarcas', 'n_modelomarcas', '2021-01-16 19:46:30', '2021-01-16 19:46:30'),
(141, 'delete_n_modelomarcas', 'n_modelomarcas', '2021-01-16 19:46:30', '2021-01-16 19:46:30'),
(142, 'browse_marcas', 'marcas', '2021-01-16 19:49:08', '2021-01-16 19:49:08'),
(143, 'read_marcas', 'marcas', '2021-01-16 19:49:08', '2021-01-16 19:49:08'),
(144, 'edit_marcas', 'marcas', '2021-01-16 19:49:08', '2021-01-16 19:49:08'),
(145, 'add_marcas', 'marcas', '2021-01-16 19:49:08', '2021-01-16 19:49:08'),
(146, 'delete_marcas', 'marcas', '2021-01-16 19:49:08', '2021-01-16 19:49:08'),
(147, 'browse_modelos', 'modelos', '2021-01-16 19:49:33', '2021-01-16 19:49:33'),
(148, 'read_modelos', 'modelos', '2021-01-16 19:49:33', '2021-01-16 19:49:33'),
(149, 'edit_modelos', 'modelos', '2021-01-16 19:49:33', '2021-01-16 19:49:33'),
(150, 'add_modelos', 'modelos', '2021-01-16 19:49:33', '2021-01-16 19:49:33'),
(151, 'delete_modelos', 'modelos', '2021-01-16 19:49:33', '2021-01-16 19:49:33'),
(152, 'browse_users_pagos', 'users_pagos', '2021-01-28 04:50:45', '2021-01-28 04:50:45'),
(153, 'read_users_pagos', 'users_pagos', '2021-01-28 04:50:45', '2021-01-28 04:50:45'),
(154, 'edit_users_pagos', 'users_pagos', '2021-01-28 04:50:45', '2021-01-28 04:50:45'),
(155, 'add_users_pagos', 'users_pagos', '2021-01-28 04:50:45', '2021-01-28 04:50:45'),
(156, 'delete_users_pagos', 'users_pagos', '2021-01-28 04:50:45', '2021-01-28 04:50:45');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 7),
(2, 1),
(2, 7),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(6, 7),
(7, 1),
(7, 7),
(8, 1),
(8, 7),
(9, 1),
(9, 7),
(10, 1),
(10, 7),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 7),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(21, 7),
(22, 1),
(22, 7),
(23, 1),
(23, 7),
(24, 1),
(24, 7),
(25, 1),
(25, 7),
(26, 1),
(27, 1),
(27, 7),
(28, 1),
(28, 7),
(29, 1),
(29, 7),
(30, 1),
(30, 7),
(31, 1),
(31, 7),
(32, 1),
(32, 7),
(33, 1),
(33, 7),
(34, 1),
(34, 7),
(35, 1),
(35, 7),
(36, 1),
(36, 7),
(37, 1),
(37, 7),
(38, 1),
(38, 7),
(39, 1),
(39, 7),
(40, 1),
(40, 7),
(41, 1),
(41, 7),
(42, 1),
(42, 7),
(43, 1),
(43, 7),
(44, 1),
(44, 7),
(45, 1),
(45, 7),
(46, 7),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(87, 1),
(88, 1),
(89, 1),
(90, 1),
(97, 1),
(97, 7),
(98, 1),
(98, 7),
(99, 1),
(99, 7),
(100, 1),
(100, 7),
(101, 1),
(101, 7),
(102, 1),
(102, 7),
(103, 1),
(103, 7),
(104, 1),
(104, 7),
(105, 1),
(105, 7),
(106, 1),
(106, 7),
(117, 1),
(117, 7),
(118, 1),
(118, 7),
(119, 1),
(119, 7),
(120, 1),
(120, 7),
(121, 1),
(121, 7),
(122, 1),
(122, 7),
(123, 1),
(123, 7),
(126, 1),
(127, 1),
(127, 7),
(128, 1),
(128, 7),
(132, 1),
(133, 1),
(134, 1),
(135, 1),
(136, 1),
(137, 1),
(138, 1),
(139, 1),
(140, 1),
(141, 1),
(142, 1),
(143, 1),
(144, 1),
(145, 1),
(146, 1),
(147, 1),
(148, 1),
(149, 1),
(150, 1),
(151, 1),
(152, 1),
(153, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `subcategoryId` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `precios` int(11) DEFAULT NULL,
  `status` enum('REVISION','PUBLISHED','DRAFT','PENDING','CANCELLED') COLLATE utf8mb4_unicode_ci DEFAULT 'DRAFT',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `descuento` int(11) DEFAULT NULL,
  `resenia` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `destacado` int(11) DEFAULT NULL,
  `marca_id` int(10) UNSIGNED DEFAULT NULL,
  `modelo_id` int(10) UNSIGNED DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `codigo` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `obj_search` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `old_img` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cantidad_promocion` int(11) DEFAULT NULL,
  `precio_promocion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `posts_colores`
--

CREATE TABLE `posts_colores` (
  `id` int(11) NOT NULL,
  `posts_id` int(10) UNSIGNED NOT NULL,
  `color_id` int(30) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `posts_price_update`
--

CREATE TABLE `posts_price_update` (
  `id` int(10) UNSIGNED NOT NULL,
  `post_id` int(10) UNSIGNED NOT NULL,
  `old_price` int(11) NOT NULL,
  `new_price` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `valor_ingresado` int(11) NOT NULL,
  `aplicativo` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `posts_talles`
--

CREATE TABLE `posts_talles` (
  `id` int(11) NOT NULL,
  `posts_id` int(30) UNSIGNED DEFAULT NULL,
  `talle_id` int(30) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `posts_visitas`
--

CREATE TABLE `posts_visitas` (
  `id` int(10) UNSIGNED NOT NULL,
  `posts_id` int(10) UNSIGNED NOT NULL,
  `cant_visita` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `post_imagenes`
--

CREATE TABLE `post_imagenes` (
  `id` int(11) NOT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  `posts_id` int(10) UNSIGNED DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `orden` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `provincias`
--

CREATE TABLE `provincias` (
  `id` int(10) UNSIGNED NOT NULL,
  `provincia` varchar(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `sratus` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registros_compras`
--

CREATE TABLE `registros_compras` (
  `id` int(11) NOT NULL,
  `users_id` bigint(10) UNSIGNED NOT NULL,
  `producto_name` varchar(255) NOT NULL,
  `producto_image` varchar(255) DEFAULT NULL,
  `fecha` date NOT NULL,
  `cantidad` int(10) NOT NULL,
  `precio` int(10) NOT NULL,
  `status` varchar(30) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `Users_pagos_id` int(10) NOT NULL,
  `producto_codigo` varchar(255) DEFAULT NULL,
  `descuento` int(11) DEFAULT NULL,
  `color_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', '2020-05-09 19:41:09', '2020-05-09 19:41:09'),
(5, 'user', 'Normal User', '2020-05-09 19:41:09', '2020-05-09 19:41:09'),
(7, 'admincontenido', 'Administrador de Contenidos', '2020-10-08 18:57:15', '2020-10-08 18:57:15');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Title', 'Look Tucuman', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'Look Tucuman', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', 'settings/January2021/zK38UHRRd3KD30oe06vX.png', '', 'image', 3, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', '', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'Administrador Look Tucuman', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Bienvenidos al Administrador de Look Tucuman', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', '', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', '', '', 'image', 4, 'Admin'),
(10, 'site.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', 'G-65B4G87QRP', '', 'text', 1, 'Site'),
(12, 'site.lf', 'Logo del Footer', 'settings/January2021/1sxOydbna1dTbPP4Uww3.png', NULL, 'image', 7, 'Site'),
(14, 'site.ccg', 'Recaptcha - Clave del sitio', '6LdZzcYZAAAAAN7v_CJfIBGOSCsvXsoE2ZHS_PCB', NULL, 'text', 9, 'Site'),
(15, 'site.ccdg', 'Recaptcha - Clave secreta', '6LdZzcYZAAAAAKyUJRpFululCvBdJEDk5q7HwV9P', NULL, 'text', 10, 'Site'),
(16, 'site.from', 'Emal From', 'administracion@distlooktucuman.com.ar', NULL, 'text', 11, 'Site'),
(17, 'site.inf', 'Imgen no disponible', 'settings/May2020/WCDiftUsi2UgGZR4TfLu.png', NULL, 'image', 12, 'Site'),
(18, 'site.admin_icon_image', 'Favicon', 'settings/January2021/yJ5SqWP9WOX2lvy4oC9d.png', NULL, 'image', 13, 'Site'),
(19, 'site.direccion', 'Direccion', 'Av. Belgrano y Necochea (Arriba de Farmacia America) HORARIOS DE ATENCION: de lunes a vienes de 9 a 18hs.- sabados  de 9 a 14hs.', NULL, 'text', 14, 'Site'),
(20, 'site.erc', 'Email recibe contacto', 'consultas@distlooktucuman.com.ar', NULL, 'text', 15, 'Site'),
(21, 'site.telefono', 'Telefono', '+54 9 381-506-4935', NULL, 'text', 16, 'Site'),
(22, 'site.monto_minimo', 'Compra Minima', '2000', NULL, 'text', 17, 'Site'),
(23, 'site.de', 'Deshabilitar Ecommerce', '1', NULL, 'checkbox', 18, 'Site');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sliders`
--

CREATE TABLE `sliders` (
  `id` int(10) UNSIGNED NOT NULL,
  `tittle` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` int(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `orden` int(11) DEFAULT NULL,
  `link` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `img_responsive` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `talles`
--

CREATE TABLE `talles` (
  `id` int(11) UNSIGNED NOT NULL,
  `talle` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `translations`
--

CREATE TABLE `translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `apellido` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telefono` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provincia_id` int(11) DEFAULT NULL,
  `localidad_id` int(11) DEFAULT NULL,
  `direccion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `dateChangePassword` date DEFAULT NULL,
  `active` int(11) DEFAULT NULL,
  `cpa` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ndomicilio` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users_pagos`
--

CREATE TABLE `users_pagos` (
  `id` int(11) NOT NULL,
  `users_id` bigint(11) UNSIGNED NOT NULL,
  `status` varchar(10) NOT NULL,
  `operationsnumber` float DEFAULT NULL,
  `fecha` varchar(90) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `MP_external_reference` varchar(255) DEFAULT NULL,
  `monto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `anuncios`
--
ALTER TABLE `anuncios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carrito_index` (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indices de la tabla `carrito_detalle`
--
ALTER TABLE `carrito_detalle`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `color_id` (`color_id`),
  ADD KEY `talle_id` (`talle_id`),
  ADD KEY `dCarttio` (`carrito_id`);

--
-- Indices de la tabla `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`);

--
-- Indices de la tabla `colores`
--
ALTER TABLE `colores`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `data_rows`
--
ALTER TABLE `data_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_rows_data_type_id_foreign` (`data_type_id`);

--
-- Indices de la tabla `data_types`
--
ALTER TABLE `data_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `data_types_name_unique` (`name`),
  ADD UNIQUE KEY `data_types_slug_unique` (`slug`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `localidades`
--
ALTER TABLE `localidades`
  ADD PRIMARY KEY (`id`),
  ADD KEY `provincias_id` (`provincias_id`);

--
-- Indices de la tabla `marcas`
--
ALTER TABLE `marcas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- Indices de la tabla `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `modelos`
--
ALTER TABLE `modelos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `notas`
--
ALTER TABLE `notas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `n_categorymarcas`
--
ALTER TABLE `n_categorymarcas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `n_categorymarcas_category_id_index` (`category_id`),
  ADD KEY `n_categorymarcas_marca_id_index` (`marca_id`);

--
-- Indices de la tabla `n_modelomarcas`
--
ALTER TABLE `n_modelomarcas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `n_modelomarcas_marca_id_index` (`marca_id`),
  ADD KEY `n_modelomarcas_modelo_id_index` (`modelo_id`);

--
-- Indices de la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pagos_index` (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indices de la tabla `pagos_compras`
--
ALTER TABLE `pagos_compras`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pagos_compras_index` (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `color_id` (`color_id`),
  ADD KEY `talle_id` (`talle_id`),
  ADD KEY `pcPago` (`pago_id`),
  ADD KEY `marca_id` (`marca_id`),
  ADD KEY `modelo_id` (`modelo_id`);

--
-- Indices de la tabla `pagos_detalle`
--
ALTER TABLE `pagos_detalle`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pagos_detalle_index` (`id`),
  ADD KEY `pdPago` (`pago_id`);

--
-- Indices de la tabla `pagos_facturacion`
--
ALTER TABLE `pagos_facturacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payment_id` (`pago_id`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indices de la tabla `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_key_index` (`key`);

--
-- Indices de la tabla `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Indices de la tabla `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categoria` (`category_id`),
  ADD KEY `subcategoryId` (`subcategoryId`),
  ADD KEY `marca_id` (`marca_id`),
  ADD KEY `modelo_id` (`modelo_id`);
ALTER TABLE `posts` ADD FULLTEXT KEY `body` (`body`);
ALTER TABLE `posts` ADD FULLTEXT KEY `title` (`title`);

--
-- Indices de la tabla `posts_colores`
--
ALTER TABLE `posts_colores`
  ADD PRIMARY KEY (`id`),
  ADD KEY `productos_id` (`posts_id`),
  ADD KEY `pcoi` (`color_id`);

--
-- Indices de la tabla `posts_price_update`
--
ALTER TABLE `posts_price_update`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_id` (`post_id`);

--
-- Indices de la tabla `posts_talles`
--
ALTER TABLE `posts_talles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `talle` (`talle_id`),
  ADD KEY `productos_id` (`posts_id`);

--
-- Indices de la tabla `posts_visitas`
--
ALTER TABLE `posts_visitas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posts_id` (`posts_id`),
  ADD KEY `cant_visita` (`cant_visita`);

--
-- Indices de la tabla `post_imagenes`
--
ALTER TABLE `post_imagenes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posts_id` (`posts_id`);

--
-- Indices de la tabla `provincias`
--
ALTER TABLE `provincias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `registros_compras`
--
ALTER TABLE `registros_compras`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuarios-registros` (`users_id`),
  ADD KEY `Users_pagos_id` (`Users_pagos_id`),
  ADD KEY `color_id` (`color_id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indices de la tabla `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indices de la tabla `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `talles`
--
ALTER TABLE `talles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `provider_id` (`provider_id`),
  ADD UNIQUE KEY `telefono` (`telefono`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Indices de la tabla `users_pagos`
--
ALTER TABLE `users_pagos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_id` (`users_id`);

--
-- Indices de la tabla `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `user_roles_user_id_index` (`user_id`),
  ADD KEY `user_roles_role_id_index` (`role_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `anuncios`
--
ALTER TABLE `anuncios`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `carrito`
--
ALTER TABLE `carrito`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `carrito_detalle`
--
ALTER TABLE `carrito_detalle`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=158;

--
-- AUTO_INCREMENT de la tabla `colores`
--
ALTER TABLE `colores`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de la tabla `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=281;

--
-- AUTO_INCREMENT de la tabla `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `localidades`
--
ALTER TABLE `localidades`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2382;

--
-- AUTO_INCREMENT de la tabla `marcas`
--
ALTER TABLE `marcas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT de la tabla `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=414;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `modelos`
--
ALTER TABLE `modelos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `notas`
--
ALTER TABLE `notas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `n_categorymarcas`
--
ALTER TABLE `n_categorymarcas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT de la tabla `n_modelomarcas`
--
ALTER TABLE `n_modelomarcas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pagos`
--
ALTER TABLE `pagos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pagos_compras`
--
ALTER TABLE `pagos_compras`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pagos_detalle`
--
ALTER TABLE `pagos_detalle`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pagos_facturacion`
--
ALTER TABLE `pagos_facturacion`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=157;

--
-- AUTO_INCREMENT de la tabla `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `posts_colores`
--
ALTER TABLE `posts_colores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `posts_price_update`
--
ALTER TABLE `posts_price_update`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `posts_talles`
--
ALTER TABLE `posts_talles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `posts_visitas`
--
ALTER TABLE `posts_visitas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `post_imagenes`
--
ALTER TABLE `post_imagenes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `provincias`
--
ALTER TABLE `provincias`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `registros_compras`
--
ALTER TABLE `registros_compras`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `talles`
--
ALTER TABLE `talles`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `users_pagos`
--
ALTER TABLE `users_pagos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD CONSTRAINT `user_carrito` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `carrito_detalle`
--
ALTER TABLE `carrito_detalle`
  ADD CONSTRAINT `dCarttio` FOREIGN KEY (`carrito_id`) REFERENCES `carrito` (`id`),
  ADD CONSTRAINT `dColor` FOREIGN KEY (`color_id`) REFERENCES `colores` (`id`),
  ADD CONSTRAINT `dPost` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`),
  ADD CONSTRAINT `dTalle` FOREIGN KEY (`talle_id`) REFERENCES `talles` (`id`);

--
-- Filtros para la tabla `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `localidades`
--
ALTER TABLE `localidades`
  ADD CONSTRAINT `provincias` FOREIGN KEY (`provincias_id`) REFERENCES `provincias` (`id`);

--
-- Filtros para la tabla `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `n_categorymarcas`
--
ALTER TABLE `n_categorymarcas`
  ADD CONSTRAINT `nc` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `nm` FOREIGN KEY (`marca_id`) REFERENCES `marcas` (`id`);

--
-- Filtros para la tabla `n_modelomarcas`
--
ALTER TABLE `n_modelomarcas`
  ADD CONSTRAINT `nma` FOREIGN KEY (`marca_id`) REFERENCES `marcas` (`id`),
  ADD CONSTRAINT `nmmo` FOREIGN KEY (`modelo_id`) REFERENCES `modelos` (`id`);

--
-- Filtros para la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD CONSTRAINT `pUser` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `pagos_compras`
--
ALTER TABLE `pagos_compras`
  ADD CONSTRAINT `pagos_compras_ibfk_1` FOREIGN KEY (`marca_id`) REFERENCES `marcas` (`id`),
  ADD CONSTRAINT `pagos_compras_ibfk_2` FOREIGN KEY (`modelo_id`) REFERENCES `modelos` (`id`),
  ADD CONSTRAINT `pcColor` FOREIGN KEY (`color_id`) REFERENCES `colores` (`id`),
  ADD CONSTRAINT `pcPago` FOREIGN KEY (`pago_id`) REFERENCES `pagos` (`id`),
  ADD CONSTRAINT `pcTalle` FOREIGN KEY (`talle_id`) REFERENCES `talles` (`id`),
  ADD CONSTRAINT `pcUser` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `pagos_detalle`
--
ALTER TABLE `pagos_detalle`
  ADD CONSTRAINT `pdPago` FOREIGN KEY (`pago_id`) REFERENCES `pagos` (`id`);

--
-- Filtros para la tabla `pagos_facturacion`
--
ALTER TABLE `pagos_facturacion`
  ADD CONSTRAINT `payfacturacion` FOREIGN KEY (`pago_id`) REFERENCES `pagos` (`id`);

--
-- Filtros para la tabla `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `cat_related` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`marca_id`) REFERENCES `marcas` (`id`),
  ADD CONSTRAINT `posts_ibfk_2` FOREIGN KEY (`modelo_id`) REFERENCES `modelos` (`id`),
  ADD CONSTRAINT `subcat_related` FOREIGN KEY (`subcategoryId`) REFERENCES `categories` (`id`);

--
-- Filtros para la tabla `posts_colores`
--
ALTER TABLE `posts_colores`
  ADD CONSTRAINT `color_post` FOREIGN KEY (`posts_id`) REFERENCES `posts` (`id`),
  ADD CONSTRAINT `post_colorId` FOREIGN KEY (`color_id`) REFERENCES `colores` (`id`);

--
-- Filtros para la tabla `posts_price_update`
--
ALTER TABLE `posts_price_update`
  ADD CONSTRAINT `posts_price_update_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`);

--
-- Filtros para la tabla `posts_visitas`
--
ALTER TABLE `posts_visitas`
  ADD CONSTRAINT `posts_visitas_ibfk_1` FOREIGN KEY (`posts_id`) REFERENCES `posts` (`id`);

--
-- Filtros para la tabla `registros_compras`
--
ALTER TABLE `registros_compras`
  ADD CONSTRAINT `registros_compras_ibfk_1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `registros_compras_ibfk_2` FOREIGN KEY (`Users_pagos_id`) REFERENCES `users_pagos` (`id`);

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `roleId` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Filtros para la tabla `users_pagos`
--
ALTER TABLE `users_pagos`
  ADD CONSTRAINT `users_pagos_ibfk_1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
