-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: MySQL-8.2
-- Время создания: Ноя 20 2024 г., 22:10
-- Версия сервера: 8.2.0
-- Версия PHP: 8.1.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `lab9`
--

-- --------------------------------------------------------

--
-- Структура таблицы `files`
--

CREATE TABLE `files` (
  `file_id` int NOT NULL,
  `project_id` int NOT NULL,
  `task_id` int NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `uploaded_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `projects`
--

CREATE TABLE `projects` (
  `project_id` int NOT NULL,
  `name` varchar(150) NOT NULL,
  `description` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `project_users`
--

CREATE TABLE `project_users` (
  `project_id` int NOT NULL,
  `user_id` int NOT NULL,
  `role` enum('author','executor') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `tasks`
--

CREATE TABLE `tasks` (
  `task_id` int NOT NULL,
  `project_id` int NOT NULL,
  `author_id` int NOT NULL,
  `name` varchar(150) NOT NULL,
  `description` text NOT NULL,
  `due_date` date NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `task_users`
--

CREATE TABLE `task_users` (
  `task_id` int NOT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `user_id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`file_id`),
  ADD KEY `project_id` (`project_id`),
  ADD KEY `task_id` (`task_id`);

--
-- Индексы таблицы `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`project_id`);

--
-- Индексы таблицы `project_users`
--
ALTER TABLE `project_users`
  ADD KEY `project_id` (`project_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Индексы таблицы `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`task_id`),
  ADD KEY `project_id` (`project_id`),
  ADD KEY `author_id` (`author_id`);

--
-- Индексы таблицы `task_users`
--
ALTER TABLE `task_users`
  ADD KEY `task_id` (`task_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `files`
--
ALTER TABLE `files`
  MODIFY `file_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `projects`
--
ALTER TABLE `projects`
  MODIFY `project_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `tasks`
--
ALTER TABLE `tasks`
  MODIFY `task_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int NOT NULL AUTO_INCREMENT;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `files`
--
ALTER TABLE `files`
  ADD CONSTRAINT `files_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`project_id`),
  ADD CONSTRAINT `files_ibfk_2` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`task_id`);

--
-- Ограничения внешнего ключа таблицы `project_users`
--
ALTER TABLE `project_users`
  ADD CONSTRAINT `project_users_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`project_id`),
  ADD CONSTRAINT `project_users_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Ограничения внешнего ключа таблицы `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `tasks_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`project_id`),
  ADD CONSTRAINT `tasks_ibfk_2` FOREIGN KEY (`author_id`) REFERENCES `users` (`user_id`);

--
-- Ограничения внешнего ключа таблицы `task_users`
--
ALTER TABLE `task_users`
  ADD CONSTRAINT `task_users_ibfk_1` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`task_id`),
  ADD CONSTRAINT `task_users_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
