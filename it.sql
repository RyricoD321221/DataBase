-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Дек 24 2023 г., 15:27
-- Версия сервера: 10.7.5-MariaDB
-- Версия PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `it`
--

-- --------------------------------------------------------

--
-- Структура таблицы `Format`
--

CREATE TABLE `Format` (
  `id` int(11) NOT NULL,
  `Forma` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `Groups`
--

CREATE TABLE `Groups` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_Way` int(11) NOT NULL,
  `id_Teacher` int(11) NOT NULL,
  `id_Format` int(11) NOT NULL,
  `id_Student` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `Students`
--

CREATE TABLE `Students` (
  `id` int(11) NOT NULL,
  `FIO` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_Group` int(11) NOT NULL,
  `Sex` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `Teacher`
--

CREATE TABLE `Teacher` (
  `id` int(11) NOT NULL,
  `FIO` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `Torg`
--

CREATE TABLE `Torg` (
  `id` int(11) NOT NULL,
  `FIO` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_Groups` int(11) NOT NULL,
  `id_Way` int(100) NOT NULL,
  `id_Tray` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `Tray`
--

CREATE TABLE `Tray` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `Way`
--

CREATE TABLE `Way` (
  `id` int(11) NOT NULL,
  `Languages` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `Format`
--
ALTER TABLE `Format`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `Groups`
--
ALTER TABLE `Groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Groups_fk0` (`id_Way`),
  ADD KEY `Groups_fk1` (`id_Teacher`),
  ADD KEY `Groups_fk2` (`id_Format`),
  ADD KEY `Groups_fk3` (`id_Student`);

--
-- Индексы таблицы `Students`
--
ALTER TABLE `Students`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Students_fk0` (`id_Group`);

--
-- Индексы таблицы `Teacher`
--
ALTER TABLE `Teacher`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `Torg`
--
ALTER TABLE `Torg`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Torg_fk0` (`id_Groups`),
  ADD KEY `Torg_fk1` (`id_Way`),
  ADD KEY `Torg_fk2` (`id_Tray`);

--
-- Индексы таблицы `Tray`
--
ALTER TABLE `Tray`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `Way`
--
ALTER TABLE `Way`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `Format`
--
ALTER TABLE `Format`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `Groups`
--
ALTER TABLE `Groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `Students`
--
ALTER TABLE `Students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `Teacher`
--
ALTER TABLE `Teacher`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `Torg`
--
ALTER TABLE `Torg`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `Tray`
--
ALTER TABLE `Tray`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `Way`
--
ALTER TABLE `Way`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `Groups`
--
ALTER TABLE `Groups`
  ADD CONSTRAINT `Groups_fk0` FOREIGN KEY (`id_Way`) REFERENCES `Way` (`id`),
  ADD CONSTRAINT `Groups_fk1` FOREIGN KEY (`id_Teacher`) REFERENCES `Teacher` (`id`),
  ADD CONSTRAINT `Groups_fk2` FOREIGN KEY (`id_Format`) REFERENCES `Format` (`id`),
  ADD CONSTRAINT `Groups_fk3` FOREIGN KEY (`id_Student`) REFERENCES `Students` (`id`);

--
-- Ограничения внешнего ключа таблицы `Students`
--
ALTER TABLE `Students`
  ADD CONSTRAINT `Students_fk0` FOREIGN KEY (`id_Group`) REFERENCES `Groups` (`id`);

--
-- Ограничения внешнего ключа таблицы `Torg`
--
ALTER TABLE `Torg`
  ADD CONSTRAINT `Torg_fk0` FOREIGN KEY (`id_Groups`) REFERENCES `Groups` (`id`),
  ADD CONSTRAINT `Torg_fk1` FOREIGN KEY (`id_Way`) REFERENCES `Way` (`id`),
  ADD CONSTRAINT `Torg_fk2` FOREIGN KEY (`id_Tray`) REFERENCES `Tray` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
