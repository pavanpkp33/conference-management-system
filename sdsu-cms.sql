-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 21, 2018 at 02:11 AM
-- Server version: 5.7.21
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sdsu-cms`
--

-- --------------------------------------------------------

--
-- Table structure for table `assignment`
--

CREATE TABLE `assignment` (
  `assignment_id` int(11) NOT NULL,
  `reviewer_id` varchar(36) NOT NULL,
  `sid` varchar(36) NOT NULL,
  `cid` char(36) NOT NULL,
  `assigned` varchar(1) NOT NULL,
  `valid` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `conference`
--

CREATE TABLE `conference` (
  `cid` varchar(36) NOT NULL,
  `cname` varchar(200) NOT NULL,
  `caccronym` varchar(50) NOT NULL,
  `cyear` date NOT NULL,
  `chair_uid` varchar(36) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `web_link` varchar(100) NOT NULL,
  `valid` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `conf_sub_users`
--

CREATE TABLE `conf_sub_users` (
  `cid` varchar(36) NOT NULL,
  `sid` varchar(36) NOT NULL,
  `uid` varchar(36) NOT NULL,
  `is_corresponding_user` varchar(1) NOT NULL,
  `last_updated` datetime NOT NULL,
  `valid` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

CREATE TABLE `files` (
  `file_id` varchar(36) NOT NULL,
  `type_id` int(11) NOT NULL,
  `file_url` varchar(50) NOT NULL,
  `uploaded_time` datetime NOT NULL,
  `uploaded_by_user` varchar(36) NOT NULL,
  `valid` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `file_type`
--

CREATE TABLE `file_type` (
  `type_id` int(11) NOT NULL,
  `type_name` varchar(100) NOT NULL,
  `valid` varchar(1) NOT NULL DEFAULT 'Y'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `file_type`
--

INSERT INTO `file_type` (`type_id`, `type_name`, `valid`) VALUES
(1, 'Draft', 'Y'),
(2, 'Final Draft', 'Y'),
(3, 'Camera Ready', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `forgot_password`
--

CREATE TABLE `forgot_password` (
  `req_id` char(36) NOT NULL,
  `uid` char(36) NOT NULL,
  `token` varchar(255) NOT NULL,
  `expires` datetime NOT NULL,
  `valid` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `keywords`
--

CREATE TABLE `keywords` (
  `sid` varchar(36) NOT NULL,
  `keyword` varchar(50) NOT NULL,
  `valid` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `keywords`
--

INSERT INTO `keywords` (`sid`, `keyword`, `valid`) VALUES
('1', '123', 'Y'),
('1', 'dfgdf', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `nid` char(36) NOT NULL,
  `title` text NOT NULL,
  `body` text NOT NULL,
  `valid` varchar(1) NOT NULL,
  `sent_on` datetime NOT NULL,
  `sender_uid` varchar(36) NOT NULL,
  `receiver_uid` varchar(36) NOT NULL,
  `is_broadcast` varchar(1) NOT NULL DEFAULT 'N',
  `cid` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `rid` varchar(36) NOT NULL,
  `sid` varchar(36) NOT NULL,
  `uid` varchar(36) NOT NULL,
  `review` varchar(1000) NOT NULL,
  `score` int(10) NOT NULL,
  `message_to_chair` varchar(1000) NOT NULL,
  `confidence_score` int(10) NOT NULL,
  `last_updated` datetime NOT NULL,
  `edit_reason` varchar(200) NOT NULL,
  `is_edited` varchar(1) NOT NULL,
  `valid` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `submissions`
--

CREATE TABLE `submissions` (
  `sid` varchar(36) NOT NULL,
  `title` varchar(100) NOT NULL,
  `submission_date` datetime NOT NULL,
  `corresponding_author_id` varchar(36) NOT NULL,
  `track_id` bigint(20) NOT NULL,
  `abstract` varchar(350) NOT NULL,
  `last_updated` datetime NOT NULL,
  `decision_status` int(10) NOT NULL,
  `is_paid` varchar(1) NOT NULL,
  `valid` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tracks`
--

CREATE TABLE `tracks` (
  `tid` bigint(20) NOT NULL,
  `tname` varchar(100) NOT NULL,
  `cid` varchar(36) NOT NULL,
  `valid` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` varchar(36) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `middle_name` varchar(100) NOT NULL,
  `title` varchar(20) NOT NULL,
  `email` varchar(80) NOT NULL,
  `password` varchar(68) NOT NULL,
  `address1` varchar(100) NOT NULL,
  `address2` varchar(100) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `country` varchar(50) NOT NULL,
  `zipcode` int(10) NOT NULL,
  `affiliation` varchar(100) NOT NULL,
  `department` varchar(100) NOT NULL,
  `dob` date NOT NULL,
  `is_participating` varchar(1) NOT NULL,
  `valid` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assignment`
--
ALTER TABLE `assignment`
  ADD PRIMARY KEY (`assignment_id`),
  ADD KEY `fk_reviewerid` (`reviewer_id`),
  ADD KEY `fk_assign_sid` (`sid`),
  ADD KEY `fk_assign_cid` (`cid`);

--
-- Indexes for table `conference`
--
ALTER TABLE `conference`
  ADD PRIMARY KEY (`cid`),
  ADD KEY `FK_UID` (`chair_uid`);

--
-- Indexes for table `conf_sub_users`
--
ALTER TABLE `conf_sub_users`
  ADD KEY `cid` (`cid`,`sid`,`uid`);

--
-- Indexes for table `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`file_id`),
  ADD KEY `FK_files` (`uploaded_by_user`),
  ADD KEY `FK_filetype` (`type_id`);

--
-- Indexes for table `file_type`
--
ALTER TABLE `file_type`
  ADD PRIMARY KEY (`type_id`);

--
-- Indexes for table `forgot_password`
--
ALTER TABLE `forgot_password`
  ADD PRIMARY KEY (`req_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`nid`),
  ADD KEY `fk_noti_sender_uid` (`sender_uid`),
  ADD KEY `fk_noti_receiver_uid` (`receiver_uid`),
  ADD KEY `fk_noti_cid` (`cid`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`rid`),
  ADD KEY `fk_reviews_sid` (`sid`),
  ADD KEY `fk_reviews_uid` (`uid`);

--
-- Indexes for table `submissions`
--
ALTER TABLE `submissions`
  ADD PRIMARY KEY (`sid`),
  ADD KEY `corresponding_author_id` (`corresponding_author_id`),
  ADD KEY `track_id` (`track_id`);

--
-- Indexes for table `tracks`
--
ALTER TABLE `tracks`
  ADD PRIMARY KEY (`tid`),
  ADD KEY `FK_Conf_id` (`cid`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assignment`
--
ALTER TABLE `assignment`
  MODIFY `assignment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `file_type`
--
ALTER TABLE `file_type`
  MODIFY `type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tracks`
--
ALTER TABLE `tracks`
  MODIFY `tid` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `assignment`
--
ALTER TABLE `assignment`
  ADD CONSTRAINT `fk_assign_cid` FOREIGN KEY (`cid`) REFERENCES `conference` (`cid`),
  ADD CONSTRAINT `fk_assign_sid` FOREIGN KEY (`sid`) REFERENCES `submissions` (`sid`),
  ADD CONSTRAINT `fk_reviewerid` FOREIGN KEY (`reviewer_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `conference`
--
ALTER TABLE `conference`
  ADD CONSTRAINT `FK_UID` FOREIGN KEY (`chair_uid`) REFERENCES `users` (`id`);

--
-- Constraints for table `files`
--
ALTER TABLE `files`
  ADD CONSTRAINT `FK_files` FOREIGN KEY (`uploaded_by_user`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `FK_filetype` FOREIGN KEY (`type_id`) REFERENCES `file_type` (`type_id`);

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `fk_noti_cid` FOREIGN KEY (`cid`) REFERENCES `conference` (`cid`),
  ADD CONSTRAINT `fk_noti_receiver_uid` FOREIGN KEY (`receiver_uid`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `fk_noti_sender_uid` FOREIGN KEY (`sender_uid`) REFERENCES `users` (`id`);

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `fk_reviews_sid` FOREIGN KEY (`sid`) REFERENCES `submissions` (`sid`),
  ADD CONSTRAINT `fk_reviews_uid` FOREIGN KEY (`uid`) REFERENCES `users` (`id`);

--
-- Constraints for table `submissions`
--
ALTER TABLE `submissions`
  ADD CONSTRAINT `submissions_ibfk_1` FOREIGN KEY (`corresponding_author_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `submissions_ibfk_2` FOREIGN KEY (`track_id`) REFERENCES `tracks` (`tid`);

--
-- Constraints for table `tracks`
--
ALTER TABLE `tracks`
  ADD CONSTRAINT `FK_Conf_id` FOREIGN KEY (`cid`) REFERENCES `conference` (`cid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
