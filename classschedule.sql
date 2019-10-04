-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Окт 04 2019 г., 18:45
-- Версия сервера: 10.1.32-MariaDB
-- Версия PHP: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `classschedule`
--

-- --------------------------------------------------------

--
-- Структура таблицы `audience`
--

CREATE TABLE `audience` (
  `idAudience` int(10) NOT NULL,
  `numberAudience` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

--
-- Дамп данных таблицы `audience`
--

INSERT INTO `audience` (`idAudience`, `numberAudience`) VALUES
(1, '221'),
(2, '103');

-- --------------------------------------------------------

--
-- Структура таблицы `groups`
--

CREATE TABLE `groups` (
  `id` int(11) NOT NULL,
  `nameGroup` varchar(15) NOT NULL,
  `countGroup` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

--
-- Дамп данных таблицы `groups`
--

INSERT INTO `groups` (`id`, `nameGroup`, `countGroup`) VALUES
(1, 'ПИ-1-16', 18),
(2, 'ИС-1-15', 24);

-- --------------------------------------------------------

--
-- Структура таблицы `pair`
--

CREATE TABLE `pair` (
  `idPair` int(11) NOT NULL,
  `idSubject` int(5) NOT NULL,
  `idTeacher` int(5) NOT NULL,
  `countPair` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

--
-- Дамп данных таблицы `pair`
--

INSERT INTO `pair` (`idPair`, `idSubject`, `idTeacher`, `countPair`) VALUES
(1, 1, 1, 2),
(2, 2, 2, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `schedule`
--

CREATE TABLE `schedule` (
  `idSchedule` int(11) NOT NULL,
  `idWeekday` int(11) NOT NULL,
  `idGroup` int(11) NOT NULL,
  `idSubject` int(11) NOT NULL,
  `idTeacher` int(11) NOT NULL,
  `idAudience` int(11) NOT NULL,
  `idTimePair` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

--
-- Дамп данных таблицы `schedule`
--

INSERT INTO `schedule` (`idSchedule`, `idWeekday`, `idGroup`, `idSubject`, `idTeacher`, `idAudience`, `idTimePair`) VALUES
(1, 2, 1, 2, 2, 2, 4),
(2, 4, 2, 1, 1, 2, 2),
(3, 2, 2, 1, 1, 2, 2),
(4, 2, 2, 2, 2, 2, 3),
(5, 3, 1, 2, 2, 1, 4);

-- --------------------------------------------------------

--
-- Структура таблицы `subject`
--

CREATE TABLE `subject` (
  `idSubject` int(11) NOT NULL,
  `nameSubject` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

--
-- Дамп данных таблицы `subject`
--

INSERT INTO `subject` (`idSubject`, `nameSubject`) VALUES
(1, 'Математика'),
(2, 'Русский язык');

-- --------------------------------------------------------

--
-- Структура таблицы `teacher`
--

CREATE TABLE `teacher` (
  `id` int(11) NOT NULL,
  `fioTeacher` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

--
-- Дамп данных таблицы `teacher`
--

INSERT INTO `teacher` (`id`, `fioTeacher`) VALUES
(1, 'Иванов Иван Иванович'),
(2, 'Сидоров Петр Сергеевич');

-- --------------------------------------------------------

--
-- Структура таблицы `timepair`
--

CREATE TABLE `timepair` (
  `id` int(11) NOT NULL,
  `beginPair` varchar(15) NOT NULL,
  `endPair` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

--
-- Дамп данных таблицы `timepair`
--

INSERT INTO `timepair` (`id`, `beginPair`, `endPair`) VALUES
(1, '8:30', '10:00'),
(2, '10:10', '11:40'),
(3, '12:10', '13:40'),
(4, '13:50', '15:20');

-- --------------------------------------------------------

--
-- Структура таблицы `weekday`
--

CREATE TABLE `weekday` (
  `idWeekday` int(11) NOT NULL,
  `nameWeekday` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

--
-- Дамп данных таблицы `weekday`
--

INSERT INTO `weekday` (`idWeekday`, `nameWeekday`) VALUES
(1, 'Понедельник'),
(2, 'Вторник'),
(3, 'Среда'),
(4, 'Четверг'),
(5, 'Пятница'),
(6, 'Суббота');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `audience`
--
ALTER TABLE `audience`
  ADD PRIMARY KEY (`idAudience`);

--
-- Индексы таблицы `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `pair`
--
ALTER TABLE `pair`
  ADD PRIMARY KEY (`idPair`),
  ADD KEY `idSubject` (`idSubject`),
  ADD KEY `idTeacher` (`idTeacher`);

--
-- Индексы таблицы `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`idSchedule`),
  ADD KEY `idWeekday` (`idWeekday`),
  ADD KEY `idTeacher` (`idTeacher`),
  ADD KEY `idSubject` (`idSubject`),
  ADD KEY `idGroup` (`idGroup`),
  ADD KEY `idAudience` (`idAudience`),
  ADD KEY `idTimePair` (`idTimePair`);

--
-- Индексы таблицы `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`idSubject`);

--
-- Индексы таблицы `teacher`
--
ALTER TABLE `teacher`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `timepair`
--
ALTER TABLE `timepair`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `weekday`
--
ALTER TABLE `weekday`
  ADD PRIMARY KEY (`idWeekday`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `audience`
--
ALTER TABLE `audience`
  MODIFY `idAudience` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `groups`
--
ALTER TABLE `groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `pair`
--
ALTER TABLE `pair`
  MODIFY `idPair` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `schedule`
--
ALTER TABLE `schedule`
  MODIFY `idSchedule` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `subject`
--
ALTER TABLE `subject`
  MODIFY `idSubject` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `teacher`
--
ALTER TABLE `teacher`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `timepair`
--
ALTER TABLE `timepair`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `weekday`
--
ALTER TABLE `weekday`
  MODIFY `idWeekday` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `pair`
--
ALTER TABLE `pair`
  ADD CONSTRAINT `pair_ibfk_1` FOREIGN KEY (`idSubject`) REFERENCES `subject` (`idSubject`),
  ADD CONSTRAINT `pair_ibfk_2` FOREIGN KEY (`idTeacher`) REFERENCES `teacher` (`id`);

--
-- Ограничения внешнего ключа таблицы `schedule`
--
ALTER TABLE `schedule`
  ADD CONSTRAINT `schedule_ibfk_1` FOREIGN KEY (`idWeekday`) REFERENCES `weekday` (`idWeekday`),
  ADD CONSTRAINT `schedule_ibfk_2` FOREIGN KEY (`idTeacher`) REFERENCES `teacher` (`id`),
  ADD CONSTRAINT `schedule_ibfk_3` FOREIGN KEY (`idSubject`) REFERENCES `subject` (`idSubject`),
  ADD CONSTRAINT `schedule_ibfk_4` FOREIGN KEY (`idGroup`) REFERENCES `groups` (`id`),
  ADD CONSTRAINT `schedule_ibfk_5` FOREIGN KEY (`idAudience`) REFERENCES `audience` (`idAudience`),
  ADD CONSTRAINT `schedule_ibfk_6` FOREIGN KEY (`idTimePair`) REFERENCES `timepair` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
