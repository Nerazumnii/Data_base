-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Окт 15 2024 г., 07:36
-- Версия сервера: 10.4.32-MariaDB
-- Версия PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `car_wash_db`
--

-- --------------------------------------------------------

--
-- Структура таблицы `carwashes`
--

CREATE TABLE `carwashes` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city_id` int(11) DEFAULT NULL,
  `latitude` decimal(10,8) NOT NULL,
  `longitude` decimal(11,8) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `working_hours` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `rating` decimal(3,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `carwashes`
--

INSERT INTO `carwashes` (`id`, `name`, `address`, `city_id`, `latitude`, `longitude`, `phone`, `working_hours`, `description`, `rating`) VALUES
(1, 'Чистый Авто', 'ул. Ленина, 15', 4, 56.83890000, 60.60570000, '+7 (987) 654-32-10', '09:00-21:00', 'Отличная мойка по доступной цене', 4.60),
(2, 'Мойка для Вас', 'ул. Мира, 18', 5, 55.04150000, 82.93460000, '+7 (912) 345-67-89', '07:00-19:00', 'Мойка с использованием экологически чистых средств', 4.80),
(3, 'Быстрая Мойка', 'пр. Гагарина, 25', 3, 54.98250000, 73.36860000, '+7 (999) 123-45-67', '10:00-22:00', 'Быстрая и недорогая мойка', 4.20),
(4, 'АвтоЧист', 'ул. Лермонтова, 5', 2, 59.93430000, 30.33510000, '+7 (988) 456-78-90', '08:00-20:00', 'Мойка премиум-класса', 4.70),
(5, 'Супер Чистота', 'ул. Толстого, 3', 1, 44.61660000, 33.52540000, '+7 (913) 111-22-33', '08:00-18:00', 'Мойка с использованием нано-технологий', 4.90);

-- --------------------------------------------------------

--
-- Структура таблицы `carwash_services`
--

CREATE TABLE `carwash_services` (
  `id` int(11) NOT NULL,
  `carwash_id` int(11) DEFAULT NULL,
  `service_id` int(11) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `carwash_services`
--

INSERT INTO `carwash_services` (`id`, `carwash_id`, `service_id`, `price`) VALUES
(1, 1, 4, 800.00),
(2, 1, 5, 2500.00),
(3, 2, 2, 1800.00),
(4, 4, 2, 1900.00),
(5, 3, 1, 1100.00),
(6, 2, 5, 2500.00);

-- --------------------------------------------------------

--
-- Структура таблицы `cities`
--

CREATE TABLE `cities` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `region` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `cities`
--

INSERT INTO `cities` (`id`, `name`, `region`) VALUES
(1, 'Москва', 'Центральный'),
(2, 'Краснодар', 'Южный'),
(3, 'Владивосток', 'Дальневосточный'),
(4, 'Нижний Новгород', 'Приволжский'),
(5, 'Самара', 'Приволжский');

-- --------------------------------------------------------

--
-- Структура таблицы `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL,
  `carwash_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `review_text` text DEFAULT NULL,
  `rating` int(11) DEFAULT NULL CHECK (`rating` between 1 and 5),
  `date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `reviews`
--

INSERT INTO `reviews` (`id`, `carwash_id`, `user_id`, `review_text`, `rating`, `date`) VALUES
(1, 3, 7, 'Очень удобно, рядом с домом и быстро работают.', 4, '2024-10-14 21:51:37'),
(2, 4, 8, 'К сожалению, пришлось ждать дольше обещанного времени.', 3, '2024-10-14 21:51:37'),
(3, 1, 9, 'Приятные сотрудники, хороший подход к клиентам.', 5, '2024-10-14 21:51:37'),
(4, 2, 10, 'Мойка на уровне, но можно было бы сделать скидки постоянным клиентам.', 4, '2024-10-14 21:51:37'),
(5, 3, 11, 'Качественный сервис, но не всегда удобное время работы.', 3, '2024-10-14 21:51:37');

-- --------------------------------------------------------

--
-- Структура таблицы `services`
--

CREATE TABLE `services` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `services`
--

INSERT INTO `services` (`id`, `name`, `description`) VALUES
(1, 'Чистка двигателя', 'Мойка двигателя с использованием специального чистящего средства'),
(2, 'Восстановление фар', 'Полировка фар для восстановления прозрачности и яркости'),
(3, 'Химчистка салона', 'Глубокая чистка салона с использованием профессиональной химии'),
(4, 'Антидождь', 'Нанесение водоотталкивающего покрытия на стекла автомобиля'),
(5, 'Быстрая мойка', 'Экспресс-мойка кузова за 15 минут');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `carwashes`
--
ALTER TABLE `carwashes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `city_id` (`city_id`);

--
-- Индексы таблицы `carwash_services`
--
ALTER TABLE `carwash_services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carwash_id` (`carwash_id`),
  ADD KEY `service_id` (`service_id`);

--
-- Индексы таблицы `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carwash_id` (`carwash_id`);

--
-- Индексы таблицы `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `carwashes`
--
ALTER TABLE `carwashes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `carwash_services`
--
ALTER TABLE `carwash_services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `cities`
--
ALTER TABLE `cities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `carwashes`
--
ALTER TABLE `carwashes`
  ADD CONSTRAINT `carwashes_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`);

--
-- Ограничения внешнего ключа таблицы `carwash_services`
--
ALTER TABLE `carwash_services`
  ADD CONSTRAINT `carwash_services_ibfk_1` FOREIGN KEY (`carwash_id`) REFERENCES `carwashes` (`id`),
  ADD CONSTRAINT `carwash_services_ibfk_2` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`);

--
-- Ограничения внешнего ключа таблицы `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`carwash_id`) REFERENCES `carwashes` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
