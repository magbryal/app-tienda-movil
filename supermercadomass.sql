-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-07-2025 a las 23:07:10
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
-- Base de datos: `supermercadomass`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `branches`
--

CREATE TABLE `branches` (
  `branch_id` int(11) NOT NULL COMMENT 'Campo donde se almacena el identificador único de cada sucursal',
  `name` varchar(100) NOT NULL COMMENT 'Campo donde se almacena el nombre de la sucursal',
  `address` text NOT NULL COMMENT 'Campo donde se almacena la dirección física',
  `phone` varchar(20) DEFAULT NULL COMMENT 'Campo donde se almacena el número de contacto',
  `email` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `schedule` text DEFAULT NULL COMMENT 'Campo donde se almacena el horario de atención',
  `opening_hours` varchar(255) DEFAULT NULL,
  `manager_id` bigint(20) UNSIGNED DEFAULT NULL,
  `capacity` int(11) DEFAULT NULL,
  `has_parking` tinyint(1) NOT NULL DEFAULT 0,
  `has_wifi` tinyint(1) NOT NULL DEFAULT 0,
  `has_accessibility` tinyint(1) NOT NULL DEFAULT 0,
  `is_24_hours` tinyint(1) NOT NULL DEFAULT 0,
  `has_drive_through` tinyint(1) NOT NULL DEFAULT 0,
  `rating` decimal(3,2) DEFAULT NULL,
  `latitude` decimal(10,8) DEFAULT NULL COMMENT 'Campo donde se almacena la coordenada de latitud',
  `longitude` decimal(11,8) DEFAULT NULL COMMENT 'Campo donde se almacena la coordenada de longitud',
  `is_active` tinyint(1) DEFAULT 1 COMMENT 'Campo donde se almacena si la sucursal está operativa',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `branches`
--

INSERT INTO `branches` (`branch_id`, `name`, `address`, `phone`, `email`, `description`, `schedule`, `opening_hours`, `manager_id`, `capacity`, `has_parking`, `has_wifi`, `has_accessibility`, `is_24_hours`, `has_drive_through`, `rating`, `latitude`, `longitude`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Sucursal Central', 'Av. Principal 123, Lima', '014567890', NULL, NULL, 'Lunes a Viernes: 9:00 - 19:00, Sábados: 9:00 - 14:00', NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, -12.04637300, -77.04275400, 1, NULL, NULL),
(2, 'Sucursal Norte', 'Av. Los Olivos 456, Lima', '014567891', NULL, NULL, 'Lunes a Domingo: 8:00 - 20:00', NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, -11.98765400, -77.07891000, 1, NULL, NULL),
(3, 'Sucursal Sur', 'Av. Javier Prado 789, Lima', '014567892', NULL, NULL, 'Lunes a Sábado: 8:30 - 18:30', NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, -12.09876500, -77.01234500, 1, NULL, NULL),
(4, 'Sucursal Este', 'Av. Arequipa 1011, Lima', '014567893', NULL, NULL, 'Lunes a Viernes: 10:00 - 20:00', NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, -12.05432100, -77.03456700, 1, NULL, NULL),
(5, 'Sucursal Oeste', 'Av. Brasil 1213, Lima', '014567894', NULL, NULL, 'Lunes a Domingo: 7:00 - 22:00', NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, -12.06789000, -77.05678900, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL COMMENT 'Campo donde se almacena el identificador único de cada categoría',
  `name` varchar(100) NOT NULL COMMENT 'Campo donde se almacena el nombre de la categoría',
  `description` text DEFAULT NULL COMMENT 'Campo donde se almacena la descripción detallada',
  `image` varchar(255) DEFAULT NULL COMMENT 'Campo donde se almacena la ruta de la imagen representativa',
  `product_count` int(11) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) DEFAULT 1 COMMENT 'Campo donde se almacena si la categoría está activa'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categories`
--

INSERT INTO `categories` (`category_id`, `name`, `description`, `image`, `product_count`, `is_active`) VALUES
(1, 'Electrónicos', 'Productos electrónicos y dispositivos tecnológicos', 'electronics.jpg', 2, 1),
(2, 'Hogar', 'Artículos para el hogar y decoración', 'home.jpg', 3, 1),
(3, 'Ropa', 'Prendas de vestir para hombres, mujeres y niños', 'clothing.jpg', 2, 1),
(4, 'Alimentos', 'Productos alimenticios y comestibles', 'food.jpg', 2, 1),
(5, 'Deportes', 'Artículos deportivos y equipamiento', 'sports.jpg', 2, 1),
(6, 'Electrónicos Actualizado', 'Descripción actualizada', 'nueva-imagen.jpg', 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventory`
--

CREATE TABLE `inventory` (
  `inventory_id` int(11) NOT NULL COMMENT 'Campo donde se almacena el identificador único de cada registro',
  `product_id` int(11) NOT NULL COMMENT 'Campo donde se almacena la referencia al producto',
  `branch_id` int(11) NOT NULL COMMENT 'Campo donde se almacena la referencia a la sucursal',
  `stock` int(11) DEFAULT 0 COMMENT 'Campo donde se almacena la cantidad disponible',
  `minimum_stock` int(11) DEFAULT 5 COMMENT 'Campo donde se almacena el nivel mínimo de stock',
  `location` varchar(50) DEFAULT NULL COMMENT 'Campo donde se almacena la ubicación física en la sucursal'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `inventory`
--

INSERT INTO `inventory` (`inventory_id`, `product_id`, `branch_id`, `stock`, `minimum_stock`, `location`) VALUES
(1, 1, 1, 15, 5, 'Estante A1'),
(2, 1, 2, 10, 5, 'Estante B2'),
(3, 2, 1, 5, 2, 'Sección Muebles'),
(4, 3, 3, 40, 10, 'Ropero 3'),
(5, 4, 4, 50, 20, 'Almacén Alimentos'),
(6, 5, 2, 25, 5, 'Sección Deportes'),
(7, 6, 1, 8, 3, 'Estante Tech A'),
(8, 7, 3, 30, 10, 'Sección Hogar'),
(9, 8, 2, 20, 5, 'Calzado Deportivo'),
(10, 9, 4, 40, 15, 'Pasillo Alimentos'),
(11, 10, 5, 10, 2, 'Deportes Especiales'),
(14, 9, 1, 45, 15, 'Pasillo 4, Estante Prueba');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000001_create_cache_table', 1),
(2, '0001_01_01_000002_create_jobs_table', 1),
(3, '2025_05_27_033706_create_personal_access_tokens_table', 1),
(4, '2025_05_27_144011_create_sessions_table', 2),
(5, '2025_07_03_084805_add_new_fields_to_branches_table', 3),
(6, '2025_07_03_214510_add_product_count_to_categories_table', 3),
(7, '2025_07_04_002425_add_payment_proof_url_to_orders_table', 3),
(8, '2025_07_04_003459_modify_payment_method_column_in_orders_table', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL COMMENT 'Campo donde se almacena el identificador único de cada pedido',
  `user_id` int(11) NOT NULL COMMENT 'Campo donde se almacena la referencia al cliente',
  `order_date` datetime DEFAULT current_timestamp() COMMENT 'Campo donde se almacena la fecha y hora del pedido',
  `total_amount` decimal(10,2) NOT NULL COMMENT 'Campo donde se almacena el monto total',
  `status` enum('pending','processing','shipped','delivered','cancelled') DEFAULT 'pending' COMMENT 'Campo donde se almacena el estado actual',
  `payment_method` varchar(50) NOT NULL,
  `payment_proof_url` text DEFAULT NULL,
  `shipping_address` text DEFAULT NULL COMMENT 'Campo donde se almacena la dirección de entrega',
  `branch_id` int(11) DEFAULT NULL COMMENT 'Campo donde se almacena la sucursal para recojo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `order_date`, `total_amount`, `status`, `payment_method`, `payment_proof_url`, `shipping_address`, `branch_id`) VALUES
(1, 1, '2023-05-10 14:30:00', 999.99, 'delivered', 'card', NULL, 'Av. Las Flores 123, Lima', NULL),
(2, 1, '2023-05-12 10:15:00', 3199.00, 'shipped', 'transfer', NULL, 'Calle Los Pinos 456, Lima', NULL),
(3, 1, '2023-05-15 16:45:00', 149.90, 'processing', 'cash', NULL, NULL, 1),
(4, 1, '2023-05-18 11:20:00', 799.00, 'pending', 'card', NULL, 'Jr. Los Olivos 789, Lima', NULL),
(5, 1, '2023-05-20 09:30:00', 279.90, 'delivered', 'card', NULL, 'Av. Primavera 1011, Lima', NULL),
(6, 3, '2023-05-15 14:30:00', 135.99, 'shipped', 'transfer', NULL, 'Calle Principal 123, Ciudad', 1),
(7, 1, '2025-07-04 20:49:19', 42.02, 'processing', 'yape', 'https://i.ibb.co/gbktjnF3/payment-proof-1751662158212.jpg', 'AV.JAVIER PRADO 145', 1),
(8, 1, '2025-07-04 20:49:19', 42.02, 'processing', 'yape', 'https://i.ibb.co/gbktjnF3/payment-proof-1751662158212.jpg', 'AV.JAVIER PRADO 145', 1),
(9, 1, '2025-07-04 20:52:12', 42.02, 'processing', 'credit_card', NULL, 'AV LA CALERA 456', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `order_items`
--

CREATE TABLE `order_items` (
  `order_item_id` int(11) NOT NULL COMMENT 'Campo donde se almacena el identificador único de cada ítem',
  `order_id` int(11) NOT NULL COMMENT 'Campo donde se almacena la referencia al pedido',
  `product_id` int(11) NOT NULL COMMENT 'Campo donde se almacena la referencia al producto',
  `quantity` int(11) NOT NULL COMMENT 'Campo donde se almacena la cantidad solicitada',
  `unit_price` decimal(10,2) NOT NULL COMMENT 'Campo donde se almacena el precio unitario',
  `subtotal` decimal(10,2) NOT NULL COMMENT 'Campo donde se almacena el subtotal (cantidad × precio)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `order_items`
--

INSERT INTO `order_items` (`order_item_id`, `order_id`, `product_id`, `quantity`, `unit_price`, `subtotal`) VALUES
(1, 1, 1, 1, 999.99, 999.99),
(2, 2, 6, 1, 3199.00, 3199.00),
(3, 3, 7, 1, 149.90, 149.90),
(4, 4, 10, 1, 799.00, 799.00),
(5, 5, 8, 1, 279.90, 279.90),
(6, 2, 2, 3, 19.99, 59.97),
(7, 7, 4, 1, 22.90, 22.90),
(8, 8, 4, 1, 22.90, 22.90),
(9, 9, 4, 1, 22.90, 22.90);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\Users', 1, 'Supermercado', 'cbbc80b37dcf5b91cd0011337f3514f1b2ca4d910839c1f74a67ae0267bd0623', '[\"*\"]', NULL, '2025-05-28 19:53:16', '2025-05-27 19:53:17', '2025-05-27 19:53:17'),
(2, 'App\\Models\\Users', 1, 'Supermercado', '8e388a46e448106871252f39cfbe53502a159fca0f0e2b2a9fab832d25cb79f7', '[\"*\"]', NULL, '2025-05-28 19:53:29', '2025-05-27 19:53:29', '2025-05-27 19:53:29'),
(3, 'App\\Models\\Users', 1, 'Supermercado', '8719d9e7639fda4cdea0c5a244e5d573e5d302daa7879e88d52f802fbd5d2465', '[\"*\"]', NULL, '2025-05-28 19:58:33', '2025-05-27 19:58:33', '2025-05-27 19:58:33'),
(4, 'App\\Models\\Users', 3, 'Supermercado', '7a39ffdb9625792e3cce357fce3866ef3507f39be095c5ad812695452d6232e6', '[\"*\"]', NULL, '2025-05-30 05:01:25', '2025-05-29 05:01:25', '2025-05-29 05:01:25'),
(5, 'App\\Models\\Users', 3, 'Supermercado', '5b5cdae25f4705650a3d47d478a02d4fd7d9cffe78ea0527866b42862abb933b', '[\"*\"]', NULL, '2025-05-30 05:30:49', '2025-05-29 05:30:49', '2025-05-29 05:30:49'),
(6, 'App\\Models\\Users', 3, 'Supermercado', '651a87378b9e55d882ff4ea60b497feb05c0425947206d20cc0f7d447c6010fc', '[\"*\"]', NULL, '2025-05-30 05:41:47', '2025-05-29 05:41:47', '2025-05-29 05:41:47'),
(7, 'App\\Models\\Users', 3, 'Supermercado', 'c625c7fa597b4c3caa2c92b9802a91c3a4b6b55b52f1e60ff1252a74b6dfba6b', '[\"*\"]', NULL, '2025-05-30 05:42:56', '2025-05-29 05:42:56', '2025-05-29 05:42:56'),
(8, 'App\\Models\\Users', 3, 'Supermercado', '5668a4312e63546aa996d191441822139080ab49150adfad52b925416f661d4e', '[\"*\"]', NULL, '2025-05-30 06:01:34', '2025-05-29 06:01:34', '2025-05-29 06:01:34'),
(9, 'App\\Models\\Users', 3, 'Supermercado', '87b8c30afbf5e497d846b2ef43ba567aef6c625148b1e621dfdde7e9f30ef697', '[\"*\"]', NULL, '2025-05-30 06:03:26', '2025-05-29 06:03:26', '2025-05-29 06:03:26'),
(10, 'App\\Models\\Users', 3, 'Supermercado', '242076ad78d7ee97eda6de7983ba47c4c91cff2fb7f4d46004f7a4e9b68ce143', '[\"*\"]', NULL, '2025-05-30 06:17:05', '2025-05-29 06:17:05', '2025-05-29 06:17:05'),
(11, 'App\\Models\\Users', 3, 'Supermercado', '77f2addf718038c21bbba54d840772f55692e0859b3c8039902b68263128f9f5', '[\"*\"]', NULL, '2025-05-30 06:29:44', '2025-05-29 06:29:44', '2025-05-29 06:29:44'),
(12, 'App\\Models\\Users', 3, 'Supermercado', 'de6af4664c9240716fa9ae98a7d78b3ab97fdbaea6da79347dee04b7ed9989bf', '[\"*\"]', NULL, '2025-05-30 06:30:28', '2025-05-29 06:30:28', '2025-05-29 06:30:28'),
(13, 'App\\Models\\Users', 3, 'Supermercado', '51fc2163f29d9206b270a0e9e1c7b72d38424f9def35dabddc1fc496fdef213c', '[\"*\"]', NULL, '2025-05-30 06:50:28', '2025-05-29 06:50:29', '2025-05-29 06:50:29'),
(14, 'App\\Models\\Users', 3, 'Supermercado', '6a679ee7f669184962a26ac58bff9525f019a819da7d54ddc045f5123b5fce89', '[\"*\"]', NULL, '2025-05-30 07:04:49', '2025-05-29 07:04:49', '2025-05-29 07:04:49'),
(15, 'App\\Models\\Users', 3, 'Supermercado', 'a97b810d230fa4e24b32da652e7c84ae7721a1d368c78d6778e905d6bc8bc7af', '[\"*\"]', NULL, '2025-05-30 07:22:14', '2025-05-29 07:22:14', '2025-05-29 07:22:14'),
(16, 'App\\Models\\Users', 3, 'Supermercado', '0c44098aeb34e9d8080c35584cf9d0d1d82dec8037d7717bf09e95dd422322ca', '[\"*\"]', NULL, '2025-05-30 07:24:11', '2025-05-29 07:24:11', '2025-05-29 07:24:11'),
(17, 'App\\Models\\Users', 4, 'Supermercado', 'a38e576c2a32af20088e1cdc5637c0e81ceb2ff319feb1f9ec9e939b040022c2', '[\"*\"]', NULL, '2025-06-01 01:49:10', '2025-05-31 01:49:10', '2025-05-31 01:49:10'),
(18, 'App\\Models\\Users', 6, 'Supermercado', 'baaaa1079be3a8a4ecd5cb8b11e56f4920c321ccb3ff9d50bf2ca7834c6a324c', '[\"*\"]', NULL, '2025-06-01 01:50:47', '2025-05-31 01:50:47', '2025-05-31 01:50:47'),
(19, 'App\\Models\\Users', 7, 'Supermercado', '06f2cf22ede4bfc97dc595c55d4eabbe286a11a6c870bd4c37ee611cdc301a5d', '[\"*\"]', NULL, '2025-06-01 03:40:51', '2025-05-31 03:40:51', '2025-05-31 03:40:51'),
(20, 'App\\Models\\Users', 8, 'Supermercado', 'b4715d30cc53ca81e6daeb2eef166ebef3c9db2c6c2d38fd4341c70711d24a0e', '[\"*\"]', NULL, '2025-07-06 01:25:52', '2025-07-05 01:25:52', '2025-07-05 01:25:52'),
(21, 'App\\Models\\Users', 13, 'Supermercado', '291d8e53619ffb9c9fec451f0a373d6c7ac1cb6ccf78424e513f2d32941c8acf', '[\"*\"]', NULL, '2025-07-06 01:31:42', '2025-07-05 01:31:42', '2025-07-05 01:31:42'),
(22, 'App\\Models\\Users', 15, 'Supermercado', 'f828791a6be66ca969c52daa28f72e7b13242eb661a047e594aaccff3d61f5e6', '[\"*\"]', NULL, '2025-07-06 01:32:47', '2025-07-05 01:32:47', '2025-07-05 01:32:47');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL COMMENT 'Campo donde se almacena el identificador único de cada producto',
  `name` varchar(100) NOT NULL COMMENT 'Campo donde se almacena el nombre del producto',
  `description` text DEFAULT NULL COMMENT 'Campo donde se almacena la descripción detallada',
  `category_id` int(11) NOT NULL COMMENT 'Campo donde se almacena la referencia a la categoría',
  `price` decimal(10,2) NOT NULL COMMENT 'Campo donde se almacena el precio regular',
  `sale_price` decimal(10,2) DEFAULT NULL COMMENT 'Campo donde se almacena el precio en oferta',
  `barcode` varchar(50) DEFAULT NULL COMMENT 'Campo donde se almacena el código único de barras',
  `brand` varchar(100) DEFAULT NULL COMMENT 'Campo donde se almacena la marca del producto',
  `stock` int(11) DEFAULT 0 COMMENT 'Campo donde se almacena la cantidad disponible',
  `main_image` varchar(255) DEFAULT NULL COMMENT 'Campo donde se almacena la ruta de la imagen principal',
  `created_at` datetime DEFAULT current_timestamp() COMMENT 'Campo donde se almacena la fecha de registro',
  `is_active` tinyint(1) DEFAULT 1 COMMENT 'Campo donde se almacena si el producto está activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`product_id`, `name`, `description`, `category_id`, `price`, `sale_price`, `barcode`, `brand`, `stock`, `main_image`, `created_at`, `is_active`) VALUES
(1, 'Smartphone X1', 'Teléfono inteligente con pantalla AMOLED de 6.5\"', 1, 1200.00, 999.99, '7891234567890', 'TechBrand', 50, 'https://tse4.mm.bing.net/th/id/OIP.JYriuVLeEpcTNpGjWFTFBwHaHa?pid=Api&P=0&h=180', '2023-01-15 10:00:00', 1),
(2, 'Sofá de Cuero', 'Sofá de cuero genuino 3 plazas color negro', 2, 2500.00, NULL, '7891234567891', 'HomeComfort', 15, 'https://www.cic.cl/on/demandware.static/-/Sites-masterCatalog_CIC/es_CL/dwee55c90b/original/images/products/sofa-3-cuerpo-cuero-chesterfield-siena-01.jpg', '2023-02-10 11:30:00', 1),
(3, 'Camisa Casual', 'Camisa de algodón para hombre talla M', 3, 89.90, 69.90, '7891234567892', 'FashionWear', 120, 'https://tse1.mm.bing.net/th/id/OIP.9PHVytGk75MVXDhYMmLFwAHaJ3?pid=Api&P=0&h=180', '2023-03-05 09:15:00', 1),
(4, 'Arroz Premium', 'Arroz extra de grano largo 5kg', 4, 25.50, 22.90, '7891234567893', 'FoodMaster', 200, 'https://metroio.vtexassets.com/arquivos/ids/478252/11386-01-78254.jpg?v=638319516105900000', '2023-01-20 14:00:00', 1),
(5, 'Balón de Fútbol', 'Balón oficial tamaño 5 para competencia', 5, 150.00, 129.90, '7891234567894', 'SportPro', 75, 'https://tse4.mm.bing.net/th/id/OIP.M_VKSVVXmT_JdFjzAlnV_wHaHa?pid=Api&P=0&h=180', '2023-04-01 16:45:00', 1),
(6, 'Laptop Ultra', 'Laptop ultradelgada con procesador i7', 1, 3500.00, 3199.00, '7891234567895', 'TechBrand', 30, 'https://tse2.mm.bing.net/th/id/OIP.DuayFsGkzhFFc1pM_b2WowHaFu?pid=Api&P=0&h=180', '2023-02-28 10:20:00', 1),
(7, 'Juego de Sábanas', 'Juego de sábanas de algodón 300 hilos', 2, 180.00, 149.90, '7891234567896', 'SoftHome', 90, 'https://tse3.mm.bing.net/th/id/OIP.REz1Pbdb0v5JaADAqH5xOwHaHa?pid=Api&P=0&h=180', '2023-03-15 13:10:00', 1),
(8, 'Zapatos Deportivos', 'Zapatos para running con amortiguación', 3, 320.00, 279.90, '7891234567897', 'RunFast', 60, 'https://www.dexter.com.ar/on/demandware.static/-/Sites-365-dabra-catalog/default/dwe5454620/products/ADHQ1345/ADHQ1345-6.JPG', '2023-04-10 11:00:00', 1),
(9, 'Aceite de Oliva', 'Aceite de oliva extra virgen 1L', 4, 45.90, 39.90, '7891234567898', 'OliveGold', 150, 'https://i5.walmartimages.com.mx/mg/gm/3pp/asr/2f3efcad-6fc4-453e-aa08-c972de1b750f.411d0fc5188b353d467a86d7f80b6395.jpeg?odnHeight=2000&odnWidth=2000&odnBg=ffffff', '2023-01-25 15:30:00', 1),
(10, 'Raqueta de Tenis', 'Raqueta profesional carbono 300g', 5, 890.00, 799.00, '7891234567899', 'TennisPro', 25, 'https://tse2.mm.bing.net/th/id/OIP.tGUcMFPRkwNkA7nYmAm4jAHaE7?pid=Api&P=0&h=180', '2023-05-01 09:00:00', 1),
(11, 'Camiseta deportiva actualizada', 'Nueva descripción', 2, 34.99, 29.99, '987654321098', 'Adidas', 150, 'https://tse2.mm.bing.net/th/id/OIP.MwMeh1wPfRzXFkXnURrxvwHaHa?pid=Api&P=0&h=180', '2025-05-28 21:05:55', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `promotions`
--

CREATE TABLE `promotions` (
  `promotion_id` int(11) NOT NULL COMMENT 'Campo donde se almacena el identificador único de cada promoción',
  `name` varchar(100) NOT NULL COMMENT 'Campo donde se almacena el nombre descriptivo',
  `description` text DEFAULT NULL COMMENT 'Campo donde se almacenan los detalles',
  `discount` decimal(5,2) NOT NULL COMMENT 'Campo donde se almacena el porcentaje de descuento',
  `start_date` datetime NOT NULL COMMENT 'Campo donde se almacena la fecha de inicio',
  `end_date` datetime NOT NULL COMMENT 'Campo donde se almacena la fecha de finalización',
  `product_id` int(11) DEFAULT NULL COMMENT 'Campo donde se almacena la referencia al producto',
  `category_id` int(11) DEFAULT NULL COMMENT 'Campo donde se almacena la referencia a la categoría',
  `promotion_type` enum('product','category','general') DEFAULT NULL COMMENT 'Campo donde se almacena el alcance',
  `image` varchar(255) DEFAULT NULL COMMENT 'Campo donde se almacena la ruta de la imagen',
  `is_active` tinyint(1) DEFAULT 1 COMMENT 'Campo donde se almacena si está activa'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `promotions`
--

INSERT INTO `promotions` (`promotion_id`, `name`, `description`, `discount`, `start_date`, `end_date`, `product_id`, `category_id`, `promotion_type`, `image`, `is_active`) VALUES
(1, 'Oferta Smartphone', 'Gran descuento en el Smartphone X1', 15.00, '2023-06-01 00:00:00', '2023-06-30 23:59:59', 1, NULL, 'product', 'oferta_phone.jpg', 1),
(2, 'Día del Padre', 'Descuento especial en productos para papá', 20.00, '2023-06-15 00:00:00', '2023-06-18 23:59:59', NULL, 3, 'category', 'dia_padre.jpg', 1),
(3, 'Verano Tech', 'Descuentos en toda la categoría electrónicos', 10.00, '2023-07-01 00:00:00', '2023-07-31 23:59:59', NULL, 1, 'category', 'verano_tech.jpg', 1),
(4, 'Black Friday', 'Oferta especial en Laptop Ultra', 25.00, '2023-11-24 00:00:00', '2023-11-27 23:59:59', 6, NULL, 'product', 'black_friday.jpg', 1),
(5, 'Aniversario Tienda', '15% de descuento en toda la tienda', 15.00, '2023-08-15 00:00:00', '2023-08-20 23:59:59', NULL, NULL, 'general', 'aniversario.jpg', 1),
(6, 'Oferta de verano actualizada', 'Nuevos descuentos en productos de verano', 20.00, '2023-06-15 00:00:00', '2023-09-15 23:59:59', 1, 1, 'category', 'summer_sale_updated.jpg', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('HwBfVbk51WcfpIpHsJbYsPp2krepf5wZy7aK2igS', NULL, '192.168.1.41', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNmFWZG9tUVAyTFdJbk00ZDlJd0RDSVpXZ1JpYVFBV3R4cUxWVk84aSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjQ6Imh0dHA6Ly8xOTIuMTY4LjEuNDE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1751659729),
('nCyIw604iGmAgRr69xttZuU7T2IUiYFeTouADHOQ', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMU1UZlVXNlBlUHdYaXJhQzZDU0pvazhuMmxlNHdlUzVkVE94SEJleiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1751655263),
('Y0Y71LVLpub464CzTSx46TFk46FZKjTJELIN50PR', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibmppejhIM25IUWkwT0swakpnaFcxTjVSZTVaTTVydVhicDROV0paNiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1748635138);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL COMMENT 'Campo donde se almacena el identificador único de cada usuario',
  `first_name` varchar(100) NOT NULL COMMENT 'Campo donde se almacena el primer nombre del usuario',
  `last_name` varchar(100) NOT NULL COMMENT 'Campo donde se almacena el apellido del usuario',
  `email` varchar(100) NOT NULL COMMENT 'Campo donde se almacena el email único de cada usuario',
  `password` varchar(255) NOT NULL COMMENT 'Campo donde se almacena la contraseña encriptada del usuario',
  `phone` varchar(20) DEFAULT NULL COMMENT 'Campo donde se almacena el número de contacto del usuario',
  `address` text DEFAULT NULL COMMENT 'Campo donde se almacena la dirección completa del usuario',
  `user_type` enum('customer','employee','admin') DEFAULT 'customer' COMMENT 'Campo donde se almacena el rol del usuario',
  `registration_date` datetime DEFAULT current_timestamp() COMMENT 'Campo donde se almacena la fecha y hora de registro',
  `is_active` tinyint(1) DEFAULT 1 COMMENT 'Campo donde se almacena si el usuario está activo (1) o inactivo (0)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`user_id`, `first_name`, `last_name`, `email`, `password`, `phone`, `address`, `user_type`, `registration_date`, `is_active`) VALUES
(1, 'RODRIGO', 'SANTOS', 'gerardo24@gmail.com', '$2y$12$uVkcvc08mK..UGuENe4Iiu9lWZrw1KuKg/aopNpZ172p/mS1D.91q', '122122112', 'av garcia', 'customer', '2025-05-27 09:36:51', 1),
(2, 'Juan', 'PEPITO', 'juan@example.com', '$2y$12$xglujj1nO/oainxnR8KSAuyUqSDAtu0z8IGH3MC7TmaLCyQof4EeG', '+1234567890', 'Calle 123', 'customer', '2025-05-28 23:56:35', 1),
(3, 'Diego', 'Armando', 'diego.ase2811@gmail.com', '$2y$12$kdh9aFHChTwjGT2ZxNgdgeLeEehf5E4LwsAw.cXKzxkcYsx3WKNZy', '+1234567890', 'Calle 123', 'customer', '2025-05-29 00:01:15', 1),
(4, 'Diego armando', 'doca elme', 'ichigogamerg@gmail.com', '$2y$12$8wNQ3jjaTCfl/9IGZuPSU.2qda4V8UBtiZDKdE2YJj7U7u2hc87y6', '948932766', 'Jr Issac albeniz 149', 'customer', '2025-05-30 20:49:09', 1),
(6, 'Luis espinoza', 'garcia', 'jrchambaga@hotmail.com', '$2y$12$4z12mbIHpjTgP8F1jxoXzO1Q5r9hAZWSXyYlUvQShOnN0I.xsUzM.', '123456789', 'Jr Issac albeniz 149', 'customer', '2025-05-30 20:50:46', 1),
(7, 'rey park', 'petterson', 'socc@hotmail.com', '$2y$12$VoOERXCLIbdEIeP9MuqhkeBwMwjbscwZPlpNlJCOsLJzAfiV2sTAe', '948932766', 'jr couzco', 'customer', '2025-05-30 22:40:50', 1),
(8, 'admin', 'admin', 'admin@gmail.com', '$2y$12$Mwaz1zj8.YLp5i8cf9W.B.D0jcN.rIlP5IzlSMv3/IfZ/m6PDKQ9u', '987654321', 'jr. admin', 'customer', '2025-07-04 20:25:51', 1),
(15, 'david', 'santos', 'david@gmail.com', '$2y$12$EFMMyJ0s9BogIGfywRkFFeGG4kCU7EJZMQ9NYuxWmKrU4CaKutrHm', '987654321', 'jr. david', 'customer', '2025-07-04 20:32:46', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`branch_id`),
  ADD KEY `branches_is_active_index` (`is_active`),
  ADD KEY `branches_latitude_longitude_index` (`latitude`,`longitude`),
  ADD KEY `branches_manager_id_index` (`manager_id`);

--
-- Indices de la tabla `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indices de la tabla `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indices de la tabla `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`inventory_id`),
  ADD UNIQUE KEY `product_id` (`product_id`,`branch_id`),
  ADD KEY `branch_id` (`branch_id`);

--
-- Indices de la tabla `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indices de la tabla `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `branch_id` (`branch_id`);

--
-- Indices de la tabla `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`order_item_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD UNIQUE KEY `barcode` (`barcode`),
  ADD KEY `category_id` (`category_id`);

--
-- Indices de la tabla `promotions`
--
ALTER TABLE `promotions`
  ADD PRIMARY KEY (`promotion_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indices de la tabla `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `branches`
--
ALTER TABLE `branches`
  MODIFY `branch_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Campo donde se almacena el identificador único de cada sucursal', AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Campo donde se almacena el identificador único de cada categoría', AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `inventory`
--
ALTER TABLE `inventory`
  MODIFY `inventory_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Campo donde se almacena el identificador único de cada registro', AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Campo donde se almacena el identificador único de cada pedido', AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `order_items`
--
ALTER TABLE `order_items`
  MODIFY `order_item_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Campo donde se almacena el identificador único de cada ítem', AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Campo donde se almacena el identificador único de cada producto', AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `promotions`
--
ALTER TABLE `promotions`
  MODIFY `promotion_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Campo donde se almacena el identificador único de cada promoción', AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Campo donde se almacena el identificador único de cada usuario', AUTO_INCREMENT=16;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `inventory`
--
ALTER TABLE `inventory`
  ADD CONSTRAINT `inventory_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  ADD CONSTRAINT `inventory_ibfk_2` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`branch_id`);

--
-- Filtros para la tabla `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`branch_id`);

--
-- Filtros para la tabla `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Filtros para la tabla `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`);

--
-- Filtros para la tabla `promotions`
--
ALTER TABLE `promotions`
  ADD CONSTRAINT `promotions_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  ADD CONSTRAINT `promotions_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
