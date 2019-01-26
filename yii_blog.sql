-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Янв 26 2019 г., 17:30
-- Версия сервера: 5.7.23-log
-- Версия PHP: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `yii_blog`
--

-- --------------------------------------------------------

--
-- Структура таблицы `articles`
--

CREATE TABLE `articles` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text,
  `text` text,
  `date` datetime DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `articles`
--

INSERT INTO `articles` (`id`, `title`, `description`, `text`, `date`, `image`, `user_id`) VALUES
(13, 'Marvel Comics', 'Marvel Comics (от англ. marvel «чудо») — американская компания, издающая комиксы, подразделение корпорации «Marvel Entertainment». ', 'С приходом нового тысячелетия «Marvel Comics» избежала банкротства и начала пытаться разнообразить свои предложения. В 2001 году «Marvel» отказалась от «Comics Code Authority» и основала свою собственную систему рейтингов «Marvel Rating System» для комиксов. Первый комикс этого тысячелетия, который не был отмечен Code, был «X-Force» #119 (октябрь 2001).\r\n\r\n«Marvel» также запустила новые импринты: «MAX» (линия комиксов, предназначенная для более взрослых читателей) и «Marvel Age» (наоборот, предназначенная для более юных читателей). Также компания создала отдельную серию для альтернативной вселенной, «Ultimate Marvel», позволившую компании перезапустить истории основных персонажей, чтобы улучшить и адаптировать персоналии для представления новому поколению. К 2010 году, в то время как «Marvel» оставалась основным издателем комиксов, несмотря на значительный спад в индустрии комиксов в сравнении с предыдущими десятилетиями, некоторые персонажи были изменены, чтобы стать франшизой, самые кассовые из которых: серия фильмов Люди Икс, стартовавшая в 2000 году, и трилогия Человек-Паук, стартовавшая в 2002 году.\r\n\r\nВ 2006 году, 1-го ноября, вышел эпизод мыльной оперы «Направляющий свет», носящий название «Она Чудо» (англ. She\'s a Marvel), описывающий персонажа Харли Дэвидсон Купер (которую играла Бет Элерс) как супергероиню Направляющий Свет. История персонажа продолжилась в восьмистраничном продолжении, «Новый Свет» (англ. A New Light), а затем появлялся ещё в нескольких комиксах «Marvel», вышедших с 1-го ноября по 8. Также в том году «Marvel» создала вики на своём сайте.\r\n\r\nВ конце 2007 года компания начала инициативу в сети, анонсировав «Marvel Digital Comics Unlimited», цифровой архив, насчитывающий более 2 500 комиксов, доступных для просмотра, для ежемесячной или ежегодной подписки.\r\n\r\nВ 2009 году «Marvel Comics» закрыла Политику Открытого Представления, в контексте которой принимала от художников образчики комиксов, которые не были заказаны, аргументируя это тем, что большой объём рассмотрения этих образцов мешает профессиональной деятельности. В том же году компания отметила 70-летие, празднуя своё начало как «Timely Comics», в честь чего был выпущен одно-серийный комикс «Marvel Mystery Comics» «70th Anniversary Special» #1 и другие вариации специальных выпусков.\r\n\r\n31 августа 2009 года, после десятилетия переговоров между компаниями, «The Walt Disney Company» заключила сделку о приобретении «Marvel Entertainment» за 4 миллиарда долларов. При этом акционеры «Marvel» получили 30 долларов и 0,745 акции «Disney» за каждую акцию «Marvel», что они имели. Сделка была выгодна обеим компаниям: «Disney» с годами становится всё труднее создавать и продвигать новых персонажей, а «Marvel» не хватало инвестиций для продвижения существующих.', '2019-01-25 15:43:14', 'uploads/1920px-MarvelLogo.svg.png', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `migration`
--

CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1548359841),
('m190124_195359_create_articles_table', 1548359843),
('m190126_131259_create_user_table', 1548508409);

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `articles`
--
ALTER TABLE `articles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
