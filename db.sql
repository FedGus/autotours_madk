-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Май 31 2020 г., 14:37
-- Версия сервера: 10.3.13-MariaDB
-- Версия PHP: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `autotours`
--

-- --------------------------------------------------------

--
-- Структура таблицы `cars`
--

CREATE TABLE `cars` (
  `id_car` int(11) NOT NULL,
  `id_performer` int(11) NOT NULL,
  `number` int(11) NOT NULL,
  `mark` varchar(45) NOT NULL,
  `model` varchar(45) NOT NULL,
  `type` varchar(45) NOT NULL,
  `volume` int(11) NOT NULL,
  `power` int(11) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `cars`
--

INSERT INTO `cars` (`id_car`, `id_performer`, `number`, `mark`, `model`, `type`, `volume`, `power`, `image`) VALUES
(1, 1, 114777, 'Audi', 'Q7', 'SVU', 3, 330, 'img/a-1.jpg'),
(2, 1, 234777, 'Volkswagen', 'Tiguan', 'SVU', 2, 280, 'img/a-2.jpg'),
(3, 2, 789777, 'Volvo', 'S60', 'SVU', 3, 240, 'img/a-3.jpg'),
(4, 2, 919777, 'Volvo', 'S90', 'SVU', 2, 195, 'img/a-4.jpg');

-- --------------------------------------------------------

--
-- Структура таблицы `country`
--

CREATE TABLE `country` (
  `id_country` int(11) NOT NULL,
  `name_country` varchar(200) NOT NULL,
  `id_direction` int(11) NOT NULL,
  `flag` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `direction`
--

CREATE TABLE `direction` (
  `id_direction` int(11) NOT NULL,
  `name_direction` varchar(100) NOT NULL,
  `direction` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `direction`
--

INSERT INTO `direction` (`id_direction`, `name_direction`, `direction`) VALUES
(1, 'Россия', ''),
(2, 'Прибалтика', ''),
(3, 'Центральная Европа', ''),
(4, 'Скандинавия', '');

-- --------------------------------------------------------

--
-- Структура таблицы `favorites`
--

CREATE TABLE `favorites` (
  `id_favorite` int(11) NOT NULL,
  `id_tour` int(11) NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `favorites`
--

INSERT INTO `favorites` (`id_favorite`, `id_tour`, `id_user`) VALUES
(2, 4, 3),
(3, 2, 2),
(10, 3, 2),
(11, 9, 2),
(12, 4, 6),
(13, 4, 5);

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
  `id_order` int(11) NOT NULL,
  `id_tour` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `departure` date NOT NULL,
  `arrival` date NOT NULL,
  `status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `orders`
--

INSERT INTO `orders` (`id_order`, `id_tour`, `id_user`, `departure`, `arrival`, `status`) VALUES
(1, 5, 2, '2020-05-01', '2020-05-05', 2),
(2, 3, 2, '2020-05-08', '2020-05-09', 1),
(3, 8, 2, '2020-05-10', '2020-05-12', 3),
(4, 6, 5, '2020-05-17', '2020-05-19', 2),
(5, 1, 6, '2020-05-20', '2020-05-23', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `performers`
--

CREATE TABLE `performers` (
  `id_performer` int(11) NOT NULL,
  `name_performer` varchar(200) NOT NULL,
  `INN` int(14) NOT NULL,
  `address` varchar(200) NOT NULL,
  `phone` varchar(14) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `performers`
--

INSERT INTO `performers` (`id_performer`, `name_performer`, `INN`, `address`, `phone`, `email`) VALUES
(1, 'ИП Малухин А.В.', 123456789, 'Москва, ул. Красных Зорь, д. 12', '+79126541234', 'maluh@ya.ru'),
(2, 'ООО \"Туравто\"', 34512312, 'Москва, ул. Комсомольская. д. 12, офис 53', '+74996136544', 'info@turavto.ru');

-- --------------------------------------------------------

--
-- Структура таблицы `requests`
--

CREATE TABLE `requests` (
  `id_request` int(11) NOT NULL,
  `FIO` varchar(200) NOT NULL,
  `phone` varchar(14) NOT NULL,
  `status` varchar(20) NOT NULL,
  `purpose` varchar(200) NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `requests`
--

INSERT INTO `requests` (`id_request`, `FIO`, `phone`, `status`, `purpose`, `id_user`) VALUES
(1, 'Ольга', '+791634256123', '2', 'Консультация по направлению \"Прибалтика\"', 4),
(2, 'Илья Сергеевич', '+791032634172', '3', 'Немой звонок', 4),
(4, 'Aндрей Николаевич', '+79267192344', '1', '', 4);

-- --------------------------------------------------------

--
-- Структура таблицы `tours`
--

CREATE TABLE `tours` (
  `id_tour` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `length` int(11) NOT NULL,
  `duration` int(11) NOT NULL,
  `image` varchar(200) NOT NULL,
  `popular` tinyint(1) NOT NULL,
  `id_direction` int(11) NOT NULL,
  `id_performer` int(11) NOT NULL,
  `cities` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `tours`
--

INSERT INTO `tours` (`id_tour`, `title`, `description`, `length`, `duration`, `image`, `popular`, `id_direction`, `id_performer`, `cities`) VALUES
(1, 'Трехдневная поездка к рижскому взморью', 'Прекрасные пейзажи, интересные города, знаменитые на весь мир курорты и уникальные достопримечательности – все это вы увидите в ходе увлекательного тура по великолепной Латвии! Путешествие предусматривает посещение легендарного Рижского взморья – модной Юрмалы, знакомство с достопримечательностями столицы страны – пленительной Риги и поездку в живописную «латвийскую Швейцарию» – на курорт Сигулда, который ведет свою историю с эпохи Средневековья.', 560, 3, 'img/10.jpg', 1, 2, 1, '\'Москва\', \'Рига\''),
(2, 'Средневековая Литва', 'Литву называют «тайным сокровищем Европы». Достопримечательности этой страны напоминают об истории Великого княжества Литовского, о крестовых походах и власти Польши, о наполеоновских войнах и временах Российской империи. Современная Литва бережно сохраняет национальные традиции.\r\n\r\nОсобую красоту этой стране придают ее сказочные города, каждый из которых достоин долгого рассказа. Желающих в короткий срок увидеть все многообразие Литвы мы приглашаем в путешествие. Во время нашего экскурсионного тура в Литву мы посетим Тракай с его легендарным замком, великолепный своей архитектурой Вильнюс, холмы на месте древней столицы Кернаве, уютный Каунас с прекрасными музеями и Шауляй, где находится загадочная Гора Крестов.', 270, 2, 'img/11.jpg', 0, 2, 2, '\'Москва\', \'Вильнюс\', \'Каунас\', \'Паланга\''),
(3, 'В Вильнюс на один день', 'Столица Литвы - один из красивейших европейских городов. Здесь узкие улочки исторического центра соседствуют с небоскребами на другой стороне реки, а весь город утопает в зелени парков и скверов.\r\n\r\n \r\nВильнюс был основан в XIII веке. После объединения Великого княжества Литовского с Польским королевством стал одним из крупнейших городов нового государства - Речи Посполитой. Долгое время входил в состав Российской империи под названием Вильна.\r\n\r\n \r\nСегодня столица Литвы – самый крупный город страны. В нем проживает более 500 тыс. человек, работают десятки предприятий, банков, торговых центров.', 280, 1, 'img/12.jpg', 0, 2, 1, '\'Москва\', \'Вильнюс\''),
(4, 'Поездка по Лапландии', 'Лапландия – это не просто красивая заснеженная территория с белыми ночами летом. Здесь есть множество рек и озер, гор и природных парков, которые непременно стоит посетить.\r\n\r\nЕсли говорить о регионе Лапландия, то он поделен между 4-мя странами (одной из которых, кстати, является и Российская Федерация) и никогда не был самостоятельной государственной единицей. Но есть то, что объединяет все 4 части Лапландии – народ. Саамы – самобытные люди, с высоким уровнем национального самосознания.', 320, 2, 'img/21.jpg', 0, 4, 1, '\'Москва\', \'Хельсинки\', \'Рованиеми\''),
(5, 'Нетронутая старина европейских городов', 'Европа на протяжении многих лет неизменно привлекает туристов со всех уголков планеты. Очарование и притягательность ей придает яркое сочетание культур, ценностей и традиций разных стран, известные на весь мир памятники архитектуры и искусства, знаменитые горнолыжные и пляжные курорты, восхитительные пейзажи и роскошные королевские дворцы. Здесь соседствуют как жаркие, хаотичные и радушные Италия, Испания, Греция, так и спокойные Франция, Германия, Голландия. \r\n', 460, 3, 'img/20.jpg', 0, 3, 1, '\'Москва\', \'Варшава\', \'Прага\', \'Берлин\', \'Копенгаген\''),
(6, 'Золотое кольцо России', 'Проехать по Золотому кольцу стоит, чтобы воочию увидеть свидетелей русской истории — храмы и монастыри, построенные ...', 620, 5, 'img/18.jpg', 1, 1, 2, '\'Москва\', \'Ростов\', \'Ярославль\', \'Кострома\', \'Суздаль\', \'Владимир\', \'Москва\''),
(7, 'К норвежским фьордам', 'Неповторимая красота норвежской природы привлекает туристов в Норвегию. Туры по норвежским фьордам считаются одними из самых впечатлительных, а сами фьорды одними из красивейших мест на планете. Море длинными языками врезается в прибрежную твердь, а над водой на сотни метров возвышаются горы. Сочетание гор, моря и фьордов создает атмосферу удивительной гармонии.\r\n\r\nШироко разветвленная сеть железных дорог соединяет Норвегию с другими скандинавскими и европейскими странами.', 420, 3, 'img/19.jpg', 1, 4, 2, '\'Москва\', \'Хельсинки\', \'Стокгольм\', \'Осло\''),
(8, 'Поездка в северную столицу', 'Не зря ведь говорят, что у России есть две столицы — официальная и культурная. Санкт-Петербург — невероятно красивый город, которым страна может по праву гордиться!\r\n\r\n​​​​​​​Чем может удивить город? Достаточно трудно найти другое место, где будет сосредоточено столько же театров и музеев, а архитектура так же богата и разнообразна. Экскурсионные туры лучше планировать на лето. В это время можно совершить незабываемую прогулку по Неве, насладиться красотой мостов, которые разводят строго по графику, прогуляться в белые ночи по набережной.', 620, 3, 'img/22.jpg', 0, 1, 1, '\'Москва\', \'Санкт-Петербург\''),
(9, 'Поездка в Карелию', 'Карелия — это край, созданный для туризма. Почти миллион гектаров земли составляют национальные парки, заповедники, заказники и памятники природы. Валуны, скалы, сосны, вырастающие прямо на камнях, голубая гладь озер... Только представьте себе: на каждую карельскую семью приходится как минимум одно озеро! Крупнее, чем Ладожское и Онежское, в Европе озер нет. Многие приобретают туры в Карелию просто для того, чтобы порыбачить или отдохнуть на природе, полюбоваться местными красотами. ', 250, 2, 'img/image-31.png', 1, 1, 2, '\'Москва\', \'Петрозаводск\'');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `FIO` varchar(100) NOT NULL,
  `login` varchar(100) NOT NULL,
  `pass` varchar(100) NOT NULL,
  `role` varchar(1) NOT NULL,
  `phone` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id_user`, `FIO`, `login`, `pass`, `role`, `phone`) VALUES
(1, 'Администратор', 'admin', '81dc9bdb52d04dc20036dbd8313ed055', 'A', ''),
(2, 'Иван Иванов', 'example@mail.ru', '$2y$10$tAi48YJ.JVlzMMmrFhDICuHHnmBjXT9UqfNQv3YPM187fQ3sB3ktm', 'P', '79162341562'),
(3, 'Евлампий Щекочихин-Крестовоздвиженский', 'eshk@ya.ru', '$2y$10$Nb2hYG90kCy3JLcIaQC75OXLx9fHt27uXBITNTwwYC0.xzywFjC4C', 'P', '79102641623'),
(4, 'Менеджер Анна', 'anna@bk.ru', '81dc9bdb52d04dc20036dbd8313ed055', 'M', ''),
(5, 'Андрей Снегирев', 'sneg@mail.ru', '1', 'P', '79175921341'),
(6, 'Яковлев Михаил', 'yak@gmail.com', '123', 'P', '79150821624');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`id_car`),
  ADD KEY `id_per` (`id_performer`);

--
-- Индексы таблицы `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`id_country`),
  ADD KEY `id_d` (`id_direction`);

--
-- Индексы таблицы `direction`
--
ALTER TABLE `direction`
  ADD PRIMARY KEY (`id_direction`);

--
-- Индексы таблицы `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`id_favorite`),
  ADD KEY `id_to` (`id_tour`),
  ADD KEY `id_us` (`id_user`);

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id_order`),
  ADD KEY `idu` (`id_user`),
  ADD KEY `idt` (`id_tour`);

--
-- Индексы таблицы `performers`
--
ALTER TABLE `performers`
  ADD PRIMARY KEY (`id_performer`);

--
-- Индексы таблицы `requests`
--
ALTER TABLE `requests`
  ADD PRIMARY KEY (`id_request`),
  ADD KEY `id_u` (`id_user`);

--
-- Индексы таблицы `tours`
--
ALTER TABLE `tours`
  ADD PRIMARY KEY (`id_tour`),
  ADD KEY `idd` (`id_direction`),
  ADD KEY `idp` (`id_performer`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `cars`
--
ALTER TABLE `cars`
  MODIFY `id_car` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `country`
--
ALTER TABLE `country`
  MODIFY `id_country` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `direction`
--
ALTER TABLE `direction`
  MODIFY `id_direction` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `favorites`
--
ALTER TABLE `favorites`
  MODIFY `id_favorite` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `id_order` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `performers`
--
ALTER TABLE `performers`
  MODIFY `id_performer` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `requests`
--
ALTER TABLE `requests`
  MODIFY `id_request` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `tours`
--
ALTER TABLE `tours`
  MODIFY `id_tour` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `cars`
--
ALTER TABLE `cars`
  ADD CONSTRAINT `id_per` FOREIGN KEY (`id_performer`) REFERENCES `performers` (`id_performer`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `country`
--
ALTER TABLE `country`
  ADD CONSTRAINT `id_d` FOREIGN KEY (`id_direction`) REFERENCES `direction` (`id_direction`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `favorites`
--
ALTER TABLE `favorites`
  ADD CONSTRAINT `id_to` FOREIGN KEY (`id_tour`) REFERENCES `tours` (`id_tour`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `id_us` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `idt` FOREIGN KEY (`id_tour`) REFERENCES `tours` (`id_tour`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `idu` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `requests`
--
ALTER TABLE `requests`
  ADD CONSTRAINT `id_u` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `tours`
--
ALTER TABLE `tours`
  ADD CONSTRAINT `idd` FOREIGN KEY (`id_direction`) REFERENCES `direction` (`id_direction`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `idp` FOREIGN KEY (`id_performer`) REFERENCES `performers` (`id_performer`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
