-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 04, 2025 at 12:10 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `email_quiz`
--

-- --------------------------------------------------------

--
-- Table structure for table `quiz_questions`
--

CREATE TABLE `quiz_questions` (
  `id` int(11) NOT NULL,
  `question` text NOT NULL,
  `option_a` varchar(255) DEFAULT NULL,
  `option_b` varchar(255) DEFAULT NULL,
  `option_c` varchar(255) DEFAULT NULL,
  `option_d` varchar(255) DEFAULT NULL,
  `correct_option` char(1) DEFAULT NULL,
  `optionA` varchar(255) DEFAULT NULL,
  `optionB` varchar(255) DEFAULT NULL,
  `optionC` varchar(255) DEFAULT NULL,
  `optionD` varchar(255) DEFAULT NULL,
  `Quiz` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `quiz_questions`
--

INSERT INTO `quiz_questions` (`id`, `question`, `option_a`, `option_b`, `option_c`, `option_d`, `correct_option`, `optionA`, `optionB`, `optionC`, `optionD`, `Quiz`) VALUES
(1, 'What is the capital of France?', 'Paris', 'London', 'Berlin', 'Madrid', 'A', NULL, NULL, NULL, NULL, NULL),
(2, 'Which planet is known as the Red Planet?', 'Earth', 'Mars', 'Jupiter', 'Saturn', 'B', NULL, NULL, NULL, NULL, NULL),
(3, 'Who wrote \"Romeo and Juliet\"?', 'Mark Twain', 'William Shakespeare', 'Charles Dickens', 'Leo Tolstoy', 'B', NULL, NULL, NULL, NULL, NULL),
(4, 'What is the largest mammal in the world?', 'African Elephant', 'Blue Whale', 'Giraffe', 'Polar Bear', 'B', NULL, NULL, NULL, NULL, NULL),
(5, 'Which element has the chemical symbol O?', 'Oxygen', 'Gold', 'Osmium', 'Hydrogen', 'A', NULL, NULL, NULL, NULL, NULL),
(6, 'What is the square root of 64?', '6', '7', '8', '9', 'C', NULL, NULL, NULL, NULL, NULL),
(7, 'In which year did India gain independence?', '1945', '1946', '1947', '1948', 'C', NULL, NULL, NULL, NULL, NULL),
(8, 'What is H2O commonly known as?', 'Oxygen', 'Hydrogen', 'Salt', 'Water', 'D', NULL, NULL, NULL, NULL, NULL),
(9, 'Which continent is the Sahara Desert located in?', 'Asia', 'Africa', 'Australia', 'Europe', 'B', NULL, NULL, NULL, NULL, NULL),
(10, 'Who painted the Mona Lisa?', 'Pablo Picasso', 'Vincent van Gogh', 'Leonardo da Vinci', 'Michelangelo', 'C', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `student_detail`
--

CREATE TABLE `student_detail` (
  `id` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users_ans`
--

CREATE TABLE `users_ans` (
  `question` varchar(255) NOT NULL,
  `selected_ans` varchar(255) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `quiz_questions`
--
ALTER TABLE `quiz_questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_detail`
--
ALTER TABLE `student_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users_ans`
--
ALTER TABLE `users_ans`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `quiz_questions`
--
ALTER TABLE `quiz_questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `student_detail`
--
ALTER TABLE `student_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users_ans`
--
ALTER TABLE `users_ans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
