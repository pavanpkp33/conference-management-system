-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 06, 2018 at 01:06 PM
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
  `valid` varchar(1) NOT NULL DEFAULT 'Y'
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
  `valid` varchar(1) NOT NULL DEFAULT 'Y',
  `contact` varchar(100) DEFAULT NULL,
  `about` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `conference`
--

INSERT INTO `conference` (`cid`, `cname`, `caccronym`, `cyear`, `chair_uid`, `start_date`, `end_date`, `web_link`, `valid`, `contact`, `about`) VALUES
('SDSU-CMS', 'SDSU-CMS', 'SDSU-CMS', '2018-01-01', 'SDSU-CMS-1', '2018-04-01', '2018-04-02', '', 'Y', NULL, NULL);

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
  `valid` varchar(1) NOT NULL DEFAULT 'Y',
  `role` varchar(36) NOT NULL
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
  `valid` varchar(1) NOT NULL DEFAULT 'Y'
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
  `notification_id` char(36) NOT NULL,
  `title` text NOT NULL,
  `body` text NOT NULL,
  `valid` varchar(1) NOT NULL DEFAULT 'Y',
  `sent_on` datetime NOT NULL,
  `sender_uid` varchar(36) NOT NULL,
  `receiver_email` varchar(100) NOT NULL,
  `is_broadcast` varchar(1) NOT NULL DEFAULT 'N',
  `cid` varchar(36) NOT NULL,
  `priority` varchar(20) NOT NULL,
  `has_seen` varchar(1) NOT NULL DEFAULT 'N',
  `notification_type` varchar(20) NOT NULL,
  `sender_name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`notification_id`, `title`, `body`, `valid`, `sent_on`, `sender_uid`, `receiver_email`, `is_broadcast`, `cid`, `priority`, `has_seen`, `notification_type`, `sender_name`) VALUES
('1f7f9c11-85ae-4148-8eb7-29fdaa0da849', 'Test for notification service', 'hello, this is a test email', 'Y', '2017-04-04 13:29:22', 'SDSU-CMS-1', 'BROADCAST', 'Y', 'SDSU-CMS', 'ANNOUNCEMENT', 'N', 'email', 'ADMIN'),
('3b5290c3-c79b-4f7f-ad12-d00fc794e940', 'User action required - Activate account', '<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Strict//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd\">\n<html xmlns=\"http://www.w3.org/1999/xhtml\">\n<head>\n    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge,chrome=1\">\n    <meta name=\"format-detection\" content=\"telephone=no\" /> <!-- disable auto telephone linking in iOS -->\n    <title>ECOS 2017</title>\n    <style type=\"text/css\">\n        /* RESET STYLES */\n        html { background-color:#E1E1E1; margin:0; padding:0; }\n        body, #bodyTable, #bodyCell, #bodyCell{height:100% !important; margin:0; padding:0; width:100% !important;font-family:Helvetica, Arial, \"Lucida Grande\", sans-serif;}\n        table{border-collapse:collapse;}\n        table[id=bodyTable] {width:100%!important;margin:auto;max-width:500px!important;color:#7A7A7A;font-weight:normal;}\n        img, a img{border:0; outline:none; text-decoration:none;height:auto; line-height:100%;}\n        a {text-decoration:none !important;border-bottom: 1px solid;}\n        h1, h2, h3, h4, h5, h6{color:#5F5F5F; font-weight:normal; font-family:Helvetica; font-size:20px; line-height:125%; text-align:Left; letter-spacing:normal;margin-top:0;margin-right:0;margin-bottom:10px;margin-left:0;padding-top:0;padding-bottom:0;padding-left:0;padding-right:0;}\n        /* CLIENT-SPECIFIC STYLES */\n        .ReadMsgBody{width:100%;} .ExternalClass{width:100%;} /* Force Hotmail/Outlook.com to display emails at full width. */\n        .ExternalClass, .ExternalClass p, .ExternalClass span, .ExternalClass font, .ExternalClass td, .ExternalClass div{line-height:100%;} /* Force Hotmail/Outlook.com to display line heights normally. */\n        table, td{mso-table-lspace:0pt; mso-table-rspace:0pt;} /* Remove spacing between tables in Outlook 2007 and up. */\n        #outlook a{padding:0;} /* Force Outlook 2007 and up to provide a \"view in browser\" message. */\n        img{-ms-interpolation-mode: bicubic;display:block;outline:none; text-decoration:none;} /* Force IE to smoothly render resized images. */\n        body, table, td, p, a, li, blockquote{-ms-text-size-adjust:100%; -webkit-text-size-adjust:100%; font-weight:normal!important;} /* Prevent Windows- and Webkit-based mobile platforms from changing declared text sizes. */\n        .ExternalClass td[class=\"ecxflexibleContainerBox\"] h3 {padding-top: 10px !important;} /* Force hotmail to push 2-grid sub headers down */\n        /* /\\/\\/\\/\\/\\/\\/\\/\\/ TEMPLATE STYLES /\\/\\/\\/\\/\\/\\/\\/\\/ */\n        /* ========== Page Styles ========== */\n        h1{display:block;font-size:26px;font-style:normal;font-weight:normal;line-height:100%;}\n        h2{display:block;font-size:20px;font-style:normal;font-weight:normal;line-height:120%;}\n        h3{display:block;font-size:17px;font-style:normal;font-weight:normal;line-height:110%;}\n        h4{display:block;font-size:18px;font-style:italic;font-weight:normal;line-height:100%;}\n        .flexibleImage{height:auto;}\n        .linkRemoveBorder{border-bottom:0 !important;}\n        table[class=flexibleContainerCellDivider] {padding-bottom:0 !important;padding-top:0 !important;}\n        body, #bodyTable{background-color:#E1E1E1;}\n        #emailHeader{background-color:#E1E1E1;}\n        #emailBody{background-color:#FFFFFF;}\n        #emailFooter{background-color:#E1E1E1;}\n        .nestedContainer{background-color:#F8F8F8; border:1px solid #CCCCCC;}\n        .emailButton{background-color:#cc0033; border-collapse:separate;}\n        .buttonContent{color:#FFFFFF; font-family:Helvetica; font-size:18px; font-weight:bold; line-height:100%; padding:15px; text-align:center;}\n        .buttonContent a{color:#FFFFFF; display:block; text-decoration:none!important; border:0!important;}\n        .emailCalendar{background-color:#FFFFFF; border:1px solid #CCCCCC;}\n        .emailCalendarMonth{background-color:#cc0033; color:#FFFFFF; font-family:Helvetica, Arial, sans-serif; font-size:16px; font-weight:bold; padding-top:10px; padding-bottom:10px; text-align:center;}\n        .emailCalendarDay{color:#cc0033; font-family:Helvetica, Arial, sans-serif; font-size:60px; font-weight:bold; line-height:100%; padding-top:20px; padding-bottom:20px; text-align:center;}\n        .imageContentText {margin-top: 10px;line-height:0;}\n        .imageContentText a {line-height:0;}\n        #invisibleIntroduction {display:none !important;} /* Removing the introduction text from the view */\n        /*FRAMEWORK HACKS & OVERRIDES */\n        span[class=ios-color-hack] a {color:#275100!important;text-decoration:none!important;} /* Remove all link colors in IOS (below are duplicates based on the color preference) */\n        span[class=ios-color-hack2] a {color:#cc0033!important;text-decoration:none!important;}\n        span[class=ios-color-hack3] a {color:#8B8B8B!important;text-decoration:none!important;}\n        /* A nice and clean way to target phone numbers you want clickable and avoid a mobile phone from linking other numbers that look like, but are not phone numbers.  Use these two blocks of code to \"unstyle\" any numbers that may be linked.  The second block gives you a class to apply with a span tag to the numbers you would like linked and styled.\n        Inspired by Campaign Monitors article on using phone numbers in email: http://www.campaignmonitor.com/blog/post/3571/using-phone-numbers-in-html-email/.\n        */\n        .a[href^=\"tel\"], a[href^=\"sms\"] {text-decoration:none!important;color:#606060!important;pointer-events:none!important;cursor:default!important;}\n        .mobile_link a[href^=\"tel\"], .mobile_link a[href^=\"sms\"] {text-decoration:none!important;color:#606060!important;pointer-events:auto!important;cursor:default!important;}\n        /* MOBILE STYLES */\n        @media only screen and (max-width: 480px){\n            /*////// CLIENT-SPECIFIC STYLES //////*/\n            body{width:100% !important; min-width:100% !important;} /* Force iOS Mail to render the email at full width. */\n            /* FRAMEWORK STYLES */\n            /*\n            CSS selectors are written in attribute\n            selector format to prevent Yahoo Mail\n            from rendering media query styles on\n            desktop.\n            */\n            /*td[class=\"textContent\"], td[class=\"flexibleContainerCell\"] { width: 100%; padding-left: 10px !important; padding-right: 10px !important; }*/\n            table[id=\"emailHeader\"],\n            table[id=\"emailBody\"],\n            table[id=\"emailFooter\"],\n            table[class=\"flexibleContainer\"],\n            td[class=\"flexibleContainerCell\"] {width:100% !important;}\n            td[class=\"flexibleContainerBox\"], td[class=\"flexibleContainerBox\"] table {display: block;width: 100%;text-align: left;}\n            /*\n            The following style rule makes any\n            image classed with flexibleImage\n            fluid when the query activates.\n            Make sure you add an inline max-width\n            to those images to prevent them\n            from blowing out.\n            */\n            td[class=\"imageContent\"] img {height:auto !important; width:100% !important; max-width:100% !important; }\n            img[class=\"flexibleImage\"]{height:auto !important; width:100% !important;max-width:100% !important;}\n            img[class=\"flexibleImageSmall\"]{height:auto !important; width:auto !important;}\n            /*\n            Create top space for every second element in a block\n            */\n            table[class=\"flexibleContainerBoxNext\"]{padding-top: 10px !important;}\n            /*\n            Make buttons in the email span the\n            full width of their container, allowing\n            for left- or right-handed ease of use.\n            */\n            table[class=\"emailButton\"]{width:100% !important;}\n            td[class=\"buttonContent\"]{padding:0 !important;}\n            td[class=\"buttonContent\"] a{padding:15px !important;}\n        }\n        /*  CONDITIONS FOR ANDROID DEVICES ONLY\n        *   http://developer.android.com/guide/webapps/targeting.html\n        *   http://pugetworks.com/2011/04/css-media-queries-for-targeting-different-mobile-devices/ ;\n        =====================================================*/\n        @media only screen and (-webkit-device-pixel-ratio:.75){\n            /* Put CSS for low density (ldpi) Android layouts in here */\n        }\n        @media only screen and (-webkit-device-pixel-ratio:1){\n            /* Put CSS for medium density (mdpi) Android layouts in here */\n        }\n        @media only screen and (-webkit-device-pixel-ratio:1.5){\n            /* Put CSS for high density (hdpi) Android layouts in here */\n        }\n        /* end Android targeting */\n        /* CONDITIONS FOR IOS DEVICES ONLY\n        =====================================================*/\n        @media only screen and (min-device-width : 320px) and (max-device-width:568px) {\n        }\n        /* end IOS targeting */\n    </style>\n\n    <!--[if mso 12]>\n    <style type=\"text/css\">\n        .flexibleContainer{display:block !important; width:100% !important;}\n    </style>\n    <![endif]-->\n    <!--[if mso 14]>\n    <style type=\"text/css\">\n        .flexibleContainer{display:block !important; width:100% !important;}\n    </style>\n    <![endif]-->\n</head>\n<body bgcolor=\"#E1E1E1\" leftmargin=\"0\" marginwidth=\"0\" topmargin=\"0\" marginheight=\"0\" offset=\"0\">\n\n<center style=\"background-color:#E1E1E1;\">\n    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" height=\"100%\" width=\"100%\" id=\"bodyTable\" style=\"table-layout: fixed;max-width:100% !important;width: 100% !important;min-width: 100% !important;\">\n        <tr>\n            <td align=\"center\" valign=\"top\" id=\"bodyCell\">\n\n\n                <table bgcolor=\"#E1E1E1\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"500\" id=\"emailHeader\">\n\n                    <!-- HEADER ROW // -->\n                    <tr>\n                        <td align=\"center\" valign=\"top\">\n                            <!-- CENTERING TABLE // -->\n                            <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n                                <tr>\n                                    <td align=\"center\" valign=\"top\">\n                                        <!-- FLEXIBLE CONTAINER // -->\n                                        <table border=\"0\" cellpadding=\"10\" cellspacing=\"0\" width=\"500\" class=\"flexibleContainer\">\n                                            <tr>\n                                                <td valign=\"top\" width=\"500\" class=\"flexibleContainerCell\">\n\n                                                    <!-- CONTENT TABLE // -->\n                                                    <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n                                                        <tr>\n\n                                                            <td align=\"left\" valign=\"middle\" id=\"invisibleIntroduction\" class=\"flexibleContainerBox\" style=\"display:none !important; mso-hide:all;\">\n                                                                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"max-width:100%;\">\n                                                                    <tr>\n                                                                        <td align=\"left\" class=\"textContent\">\n                                                                            <div style=\"font-family:Helvetica,Arial,sans-serif;font-size:13px;color:#828282;text-align:center;line-height:120%;\">\n                                                                                Welcome to SDSU Conference Management portal. Your account details are here.\n                                                                            </div>\n                                                                        </td>\n                                                                    </tr>\n                                                                </table>\n                                                            </td>\n                                                            <td align=\"right\" valign=\"middle\" class=\"flexibleContainerBox\">\n                                                                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"max-width:100%;\">\n                                                                    <tr>\n                                                                        <td align=\"left\" class=\"textContent\">\n                                                                            <!-- CONTENT // -->\n                                                                            <div style=\"font-family:Helvetica,Arial,sans-serif;font-size:13px;color:#828282;text-align:center;line-height:120%;\">\n                                                                                                                                                            </div>\n                                                                        </td>\n                                                                    </tr>\n                                                                </table>\n                                                            </td>\n                                                        </tr>\n                                                    </table>\n                                                </td>\n                                            </tr>\n                                        </table>\n                                        <!-- // FLEXIBLE CONTAINER -->\n                                    </td>\n                                </tr>\n                            </table>\n                            <!-- // CENTERING TABLE -->\n                        </td>\n                    </tr>\n                    <!-- // END -->\n\n                </table>\n\n                <table bgcolor=\"#FFFFFF\"  border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"500\" id=\"emailBody\">\n\n\n                    <tr>\n                        <td align=\"center\" valign=\"top\">\n                            <!-- CENTERING TABLE // -->\n\n                            <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"color:#FFFFFF;\" bgcolor=\"#cc0033\">\n                                <tr>\n                                    <td align=\"center\" valign=\"top\">\n\n                                        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"500\" class=\"flexibleContainer\">\n                                            <tr>\n                                                <td align=\"center\" valign=\"top\" width=\"500\" class=\"flexibleContainerCell\">\n\n                                                    <table border=\"0\" cellpadding=\"30\" cellspacing=\"0\" width=\"100%\">\n                                                        <tr>\n                                                            <td align=\"center\" valign=\"top\" class=\"textContent\">\n                                                                <h1 style=\"color:#FFFFFF;line-height:100%;font-family:Helvetica,Arial,sans-serif;font-size:35px;font-weight:normal;margin-bottom:5px;text-align:center;\">Activation required!</h1>\n                                                                <h2 style=\"text-align:center;font-weight:normal;font-family:Helvetica,Arial,sans-serif;font-size:23px;margin-bottom:10px;color:#fff;line-height:135%;\">Welcome to the Conference Management Portal, Pavan.</h2>\n                                                                <div style=\"text-align:center;font-family:Helvetica,Arial,sans-serif;font-size:15px;margin-bottom:0;color:#FFFFFF;line-height:135%;\">Thank you for registering. You can now submit your papers, update account information, check status of your submission, and pay the conference fee using this account.<br>Click on the button below to activate your account first.</div>\n                                                            </td>\n                                                        </tr>\n                                                    </table>\n                                                    <!-- // CONTENT TABLE -->\n\n                                                </td>\n                                            </tr>\n                                        </table>\n                                        <!-- // FLEXIBLE CONTAINER -->\n                                    </td>\n                                </tr>\n                            </table>\n                            <!-- // CENTERING TABLE -->\n                        </td>\n                    </tr>\n\n                    <tr mc:hideable>\n                        <td align=\"center\" valign=\"top\">\n                            <!-- CENTERING TABLE // -->\n                            <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n                                <tr>\n                                    <td align=\"center\" valign=\"top\">\n                                        <!-- FLEXIBLE CONTAINER // -->\n                                        <table border=\"0\" cellpadding=\"30\" cellspacing=\"0\" width=\"500\" class=\"flexibleContainer\">\n                                            <tr>\n                                                <td valign=\"top\" width=\"500\" class=\"flexibleContainerCell\">\n\n                                                    <!-- CONTENT TABLE // -->\n                                                    <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n                                                        <tr>\n                                                            <td align=\"left\" valign=\"top\" class=\"flexibleContainerBox\">\n\n                                                            </td>\n                                                            <td align=\"right\" valign=\"middle\" class=\"flexibleContainerBox\">\n\n                                                            </td>\n                                                        </tr>\n                                                    </table>\n                                                    <!-- // CONTENT TABLE -->\n\n                                                </td>\n                                            </tr>\n                                        </table>\n                                        <!-- // FLEXIBLE CONTAINER -->\n                                    </td>\n                                </tr>\n                            </table>\n                            <!-- // CENTERING TABLE -->\n                        </td>\n                    </tr>\n                    <!-- // MODULE ROW -->\n\n\n                    <!-- MODULE ROW // -->\n                    <tr>\n                        <td align=\"center\" valign=\"top\">\n                            <!-- CENTERING TABLE // -->\n                            <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n                                <tr style=\"padding-top:0;\">\n                                    <td align=\"center\" valign=\"top\">\n                                        <!-- FLEXIBLE CONTAINER // -->\n                                        <table border=\"0\" cellpadding=\"30\" cellspacing=\"0\" width=\"500\" class=\"flexibleContainer\">\n                                            <tr>\n                                                <td style=\"padding-top:0;\" align=\"center\" valign=\"top\" width=\"500\" class=\"flexibleContainerCell\">\n\n                                                    <!-- CONTENT TABLE // -->\n                                                    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"50%\" class=\"emailButton\" style=\"background-color: #cc0033;\">\n                                                        <tr>\n                                                            <td align=\"center\" valign=\"middle\" class=\"buttonContent\" style=\"padding-top:15px;padding-bottom:15px;padding-right:15px;padding-left:15px;\">\n                                                                <a style=\"color:#FFFFFF;text-decoration:none;font-family:Helvetica,Arial,sans-serif;font-size:20px;line-height:135%;\" href=\"http://localhost:4200/account/activate/73ea1e3a-4939-4406-bdca-0b39de674484/token/OWY0MDg3YTktOTdlOS00YjQ1LWJlNDgtYWI4YTYwYmVmNjQ0fjczZWExZTNhLTQ5MzktNDQwNi1iZGNhLTBiMzlkZTY3NDQ4NA==\" target=\"_blank\">VISIT SITE</a>\n                                                            </td>\n                                                        </tr>\n                                                    </table>\n                                                    <!-- // CONTENT TABLE -->\n\n                                                </td>\n                                            </tr>\n                                        </table>\n                                        <!-- // FLEXIBLE CONTAINER -->\n                                    </td>\n                                </tr>\n                            </table>\n                            <!-- // CENTERING TABLE -->\n                        </td>\n                    </tr>\n                    \n                    <tr>\n                        <td align=\"center\" valign=\"top\">\n                            <!-- CENTERING TABLE // -->\n                            <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"color:#FFFFFF;\" bgcolor=\"#cc0033\">\n                                <tr>\n                                    <td align=\"center\" valign=\"top\">\n                                        <!-- FLEXIBLE CONTAINER // -->\n                                        <table border=\"0\" cellpadding=\"30\" cellspacing=\"0\" width=\"500\" class=\"flexibleContainer\">\n                                            <tr>\n                                                <td valign=\"top\" width=\"500\" class=\"flexibleContainerCell\">\n\n                                                    <!-- CONTENT TABLE // -->\n                                                    <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n                                                        <tr>\n                                                            <td align=\"left\" valign=\"top\" class=\"flexibleContainerBox\">\n                                                                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"270\" style=\"max-width: 100%;\">\n                                                                    <tr>\n                                                                        <td align=\"left\" class=\"textContent\">\n                                                                            <h3 style=\"color:#FFFFFF;line-height:125%;font-family:Helvetica,Arial,sans-serif;font-size:16px;font-weight:normal;margin-top:0;margin-bottom:3px;text-align:left;\">San Diego State University</h3>\n                                                                            <div style=\"text-align:left;font-family:Helvetica,Arial,sans-serif;font-size:12px;margin-bottom:0;color:#FFFFFF;line-height:135%;\">Department of Mechanical Engineering <br>5500 Campanile Drive <br> San Diego<br> CA 92182</div>\n                                                                        </td>\n                                                                    </tr>\n                                                                </table>\n                                                            </td>\n                                                            <td align=\"right\" valign=\"middle\" class=\"flexibleContainerBox\">\n                                                                <table class=\"flexibleContainerBoxNext\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"210\" style=\"max-width: 100%;\">\n                                                                    <tr>\n                                                                        <td align=\"left\" class=\"textContent\">\n                                                                            <h3 style=\"color:#FFFFFF;line-height:125%;font-family:Helvetica,Arial,sans-serif;font-size:14px;font-weight:normal;margin-top:0;margin-bottom:3px;text-align:left;\">Contact</h3>\n                                                                            <div style=\"text-align:left;font-family:Helvetica,Arial,sans-serif;font-size:12px;margin-bottom:0;color:#FFFFFF;line-height:135%;\">E-mail : contact@ecosconference.org</div>\n                                                                        </td>\n                                                                    </tr>\n                                                                </table>\n                                                            </td>\n                                                        </tr>\n                                                    </table>\n                                                    <!-- // CONTENT TABLE -->\n\n                                                </td>\n                                            </tr>\n                                        </table>\n                                        <!-- // FLEXIBLE CONTAINER -->\n                                    </td>\n                                </tr>\n                            </table>\n                            <!-- // CENTERING TABLE -->\n                        </td>\n                    </tr>\n                    <!-- // MODULE ROW -->\n\n\n\n\n\n                    <!-- MODULE DIVIDER // -->\n                    <tr>\n                        <td align=\"center\" valign=\"top\">\n                            <!-- CENTERING TABLE // -->\n                            <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n                                <tr>\n                                    <td align=\"center\" valign=\"top\">\n                                        <!-- FLEXIBLE CONTAINER // -->\n                                        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"500\" class=\"flexibleContainer\">\n                                            <tr>\n                                                <td align=\"center\" valign=\"top\" width=\"500\" class=\"flexibleContainerCell\">\n                                                    <table class=\"flexibleContainerCellDivider\" border=\"0\" cellpadding=\"30\" cellspacing=\"0\" width=\"100%\">\n                                                        <tr>\n                                                            <td align=\"center\" valign=\"top\" style=\"padding-top:0px;padding-bottom:0px;\">\n\n                                                                <!-- CONTENT TABLE // -->\n                                                                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n                                                                    <tr>\n                                                                        <td align=\"center\" valign=\"top\" style=\"border-top:1px solid #C8C8C8;\"></td>\n                                                                    </tr>\n                                                                </table>\n                                                                <!-- // CONTENT TABLE -->\n\n                                                            </td>\n                                                        </tr>\n                                                    </table>\n                                                </td>\n                                            </tr>\n                                        </table>\n                                        <!-- // FLEXIBLE CONTAINER -->\n                                    </td>\n                                </tr>\n                            </table>\n                            <!-- // CENTERING TABLE -->\n                        </td>\n                    </tr>\n                    <!-- // END -->\n\n\n\n\n\n                </table>\n               \n                <table bgcolor=\"#E1E1E1\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"500\" id=\"emailFooter\">\n\n\n                    <tr>\n                        <td align=\"center\" valign=\"top\">\n                            <!-- CENTERING TABLE // -->\n                            <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n                                <tr>\n                                    <td align=\"center\" valign=\"top\">\n                                        <!-- FLEXIBLE CONTAINER // -->\n                                        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"500\" class=\"flexibleContainer\">\n                                            <tr>\n                                                <td align=\"center\" valign=\"top\" width=\"500\" class=\"flexibleContainerCell\">\n                                                    <table border=\"0\" cellpadding=\"30\" cellspacing=\"0\" width=\"100%\">\n                                                        <tr>\n                                                            <td valign=\"top\" bgcolor=\"#E1E1E1\">\n\n                                                                <div style=\"font-family:Helvetica,Arial,sans-serif;font-size:13px;color:#828282;text-align:center;line-height:120%;\">\n                                                                    <div>Copyright &#169; 2016 - 2017 <a href=\"www.sdsu.edu\" target=\"_blank\" style=\"text-decoration:none;color:#828282;\"><span style=\"color:#828282;\">San Diego State University</span></a>. All&nbsp;rights&nbsp;reserved.</div>\n\n                                                                </div>\n\n                                                            </td>\n                                                        </tr>\n                                                    </table>\n                                                </td>\n                                            </tr>\n                                        </table>\n                                        <!-- // FLEXIBLE CONTAINER -->\n                                    </td>\n                                </tr>\n                            </table>\n                            <!-- // CENTERING TABLE -->\n                        </td>\n                    </tr>\n\n                </table>\n                <!-- // END -->\n\n            </td>\n        </tr>\n    </table>\n</center>\n</body>\n</html>', 'Y', '2018-04-06 05:41:24', 'SDSU-CMS-1', 'SDSU-CMS', 'N', 'SDSU-CMS', 'MESSAGE', 'N', 'email', 'SDSU-CMS ADMIN'),
('8319293e-b6d9-4446-92f8-32533bb3ffa5', 'Test for notification service', 'hello, this is a test email', 'Y', '2017-04-04 13:29:22', 'SDSU-CMS-1', 'BROADCAST', '0', 'SDSU-CMS', 'ANNOUNCEMENT', 'N', 'email', 'ADMIN'),
('b02201d8-ebfc-4f36-8484-357e69f2bee2', 'Test for notification service', 'hello, this is a test email', 'Y', '2017-04-04 13:29:22', 'SDSU-CMS-1', 'SDSU-CMS', 'N', 'SDSU-CMS', 'MESSAGE', 'N', 'email', 'ADMIN');
INSERT INTO `notifications` (`notification_id`, `title`, `body`, `valid`, `sent_on`, `sender_uid`, `receiver_email`, `is_broadcast`, `cid`, `priority`, `has_seen`, `notification_type`, `sender_name`) VALUES
('c5bb3e12-00fa-42b8-bd20-76402692dadc', 'User action required - Activate account', '<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Strict//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd\">\n<html xmlns=\"http://www.w3.org/1999/xhtml\">\n<head>\n    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge,chrome=1\">\n    <meta name=\"format-detection\" content=\"telephone=no\" /> <!-- disable auto telephone linking in iOS -->\n    <title>ECOS 2017</title>\n    <style type=\"text/css\">\n        /* RESET STYLES */\n        html { background-color:#E1E1E1; margin:0; padding:0; }\n        body, #bodyTable, #bodyCell, #bodyCell{height:100% !important; margin:0; padding:0; width:100% !important;font-family:Helvetica, Arial, \"Lucida Grande\", sans-serif;}\n        table{border-collapse:collapse;}\n        table[id=bodyTable] {width:100%!important;margin:auto;max-width:500px!important;color:#7A7A7A;font-weight:normal;}\n        img, a img{border:0; outline:none; text-decoration:none;height:auto; line-height:100%;}\n        a {text-decoration:none !important;border-bottom: 1px solid;}\n        h1, h2, h3, h4, h5, h6{color:#5F5F5F; font-weight:normal; font-family:Helvetica; font-size:20px; line-height:125%; text-align:Left; letter-spacing:normal;margin-top:0;margin-right:0;margin-bottom:10px;margin-left:0;padding-top:0;padding-bottom:0;padding-left:0;padding-right:0;}\n        /* CLIENT-SPECIFIC STYLES */\n        .ReadMsgBody{width:100%;} .ExternalClass{width:100%;} /* Force Hotmail/Outlook.com to display emails at full width. */\n        .ExternalClass, .ExternalClass p, .ExternalClass span, .ExternalClass font, .ExternalClass td, .ExternalClass div{line-height:100%;} /* Force Hotmail/Outlook.com to display line heights normally. */\n        table, td{mso-table-lspace:0pt; mso-table-rspace:0pt;} /* Remove spacing between tables in Outlook 2007 and up. */\n        #outlook a{padding:0;} /* Force Outlook 2007 and up to provide a \"view in browser\" message. */\n        img{-ms-interpolation-mode: bicubic;display:block;outline:none; text-decoration:none;} /* Force IE to smoothly render resized images. */\n        body, table, td, p, a, li, blockquote{-ms-text-size-adjust:100%; -webkit-text-size-adjust:100%; font-weight:normal!important;} /* Prevent Windows- and Webkit-based mobile platforms from changing declared text sizes. */\n        .ExternalClass td[class=\"ecxflexibleContainerBox\"] h3 {padding-top: 10px !important;} /* Force hotmail to push 2-grid sub headers down */\n        /* /\\/\\/\\/\\/\\/\\/\\/\\/ TEMPLATE STYLES /\\/\\/\\/\\/\\/\\/\\/\\/ */\n        /* ========== Page Styles ========== */\n        h1{display:block;font-size:26px;font-style:normal;font-weight:normal;line-height:100%;}\n        h2{display:block;font-size:20px;font-style:normal;font-weight:normal;line-height:120%;}\n        h3{display:block;font-size:17px;font-style:normal;font-weight:normal;line-height:110%;}\n        h4{display:block;font-size:18px;font-style:italic;font-weight:normal;line-height:100%;}\n        .flexibleImage{height:auto;}\n        .linkRemoveBorder{border-bottom:0 !important;}\n        table[class=flexibleContainerCellDivider] {padding-bottom:0 !important;padding-top:0 !important;}\n        body, #bodyTable{background-color:#E1E1E1;}\n        #emailHeader{background-color:#E1E1E1;}\n        #emailBody{background-color:#FFFFFF;}\n        #emailFooter{background-color:#E1E1E1;}\n        .nestedContainer{background-color:#F8F8F8; border:1px solid #CCCCCC;}\n        .emailButton{background-color:#cc0033; border-collapse:separate;}\n        .buttonContent{color:#FFFFFF; font-family:Helvetica; font-size:18px; font-weight:bold; line-height:100%; padding:15px; text-align:center;}\n        .buttonContent a{color:#FFFFFF; display:block; text-decoration:none!important; border:0!important;}\n        .emailCalendar{background-color:#FFFFFF; border:1px solid #CCCCCC;}\n        .emailCalendarMonth{background-color:#cc0033; color:#FFFFFF; font-family:Helvetica, Arial, sans-serif; font-size:16px; font-weight:bold; padding-top:10px; padding-bottom:10px; text-align:center;}\n        .emailCalendarDay{color:#cc0033; font-family:Helvetica, Arial, sans-serif; font-size:60px; font-weight:bold; line-height:100%; padding-top:20px; padding-bottom:20px; text-align:center;}\n        .imageContentText {margin-top: 10px;line-height:0;}\n        .imageContentText a {line-height:0;}\n        #invisibleIntroduction {display:none !important;} /* Removing the introduction text from the view */\n        /*FRAMEWORK HACKS & OVERRIDES */\n        span[class=ios-color-hack] a {color:#275100!important;text-decoration:none!important;} /* Remove all link colors in IOS (below are duplicates based on the color preference) */\n        span[class=ios-color-hack2] a {color:#cc0033!important;text-decoration:none!important;}\n        span[class=ios-color-hack3] a {color:#8B8B8B!important;text-decoration:none!important;}\n        /* A nice and clean way to target phone numbers you want clickable and avoid a mobile phone from linking other numbers that look like, but are not phone numbers.  Use these two blocks of code to \"unstyle\" any numbers that may be linked.  The second block gives you a class to apply with a span tag to the numbers you would like linked and styled.\n        Inspired by Campaign Monitors article on using phone numbers in email: http://www.campaignmonitor.com/blog/post/3571/using-phone-numbers-in-html-email/.\n        */\n        .a[href^=\"tel\"], a[href^=\"sms\"] {text-decoration:none!important;color:#606060!important;pointer-events:none!important;cursor:default!important;}\n        .mobile_link a[href^=\"tel\"], .mobile_link a[href^=\"sms\"] {text-decoration:none!important;color:#606060!important;pointer-events:auto!important;cursor:default!important;}\n        /* MOBILE STYLES */\n        @media only screen and (max-width: 480px){\n            /*////// CLIENT-SPECIFIC STYLES //////*/\n            body{width:100% !important; min-width:100% !important;} /* Force iOS Mail to render the email at full width. */\n            /* FRAMEWORK STYLES */\n            /*\n            CSS selectors are written in attribute\n            selector format to prevent Yahoo Mail\n            from rendering media query styles on\n            desktop.\n            */\n            /*td[class=\"textContent\"], td[class=\"flexibleContainerCell\"] { width: 100%; padding-left: 10px !important; padding-right: 10px !important; }*/\n            table[id=\"emailHeader\"],\n            table[id=\"emailBody\"],\n            table[id=\"emailFooter\"],\n            table[class=\"flexibleContainer\"],\n            td[class=\"flexibleContainerCell\"] {width:100% !important;}\n            td[class=\"flexibleContainerBox\"], td[class=\"flexibleContainerBox\"] table {display: block;width: 100%;text-align: left;}\n            /*\n            The following style rule makes any\n            image classed with flexibleImage\n            fluid when the query activates.\n            Make sure you add an inline max-width\n            to those images to prevent them\n            from blowing out.\n            */\n            td[class=\"imageContent\"] img {height:auto !important; width:100% !important; max-width:100% !important; }\n            img[class=\"flexibleImage\"]{height:auto !important; width:100% !important;max-width:100% !important;}\n            img[class=\"flexibleImageSmall\"]{height:auto !important; width:auto !important;}\n            /*\n            Create top space for every second element in a block\n            */\n            table[class=\"flexibleContainerBoxNext\"]{padding-top: 10px !important;}\n            /*\n            Make buttons in the email span the\n            full width of their container, allowing\n            for left- or right-handed ease of use.\n            */\n            table[class=\"emailButton\"]{width:100% !important;}\n            td[class=\"buttonContent\"]{padding:0 !important;}\n            td[class=\"buttonContent\"] a{padding:15px !important;}\n        }\n        /*  CONDITIONS FOR ANDROID DEVICES ONLY\n        *   http://developer.android.com/guide/webapps/targeting.html\n        *   http://pugetworks.com/2011/04/css-media-queries-for-targeting-different-mobile-devices/ ;\n        =====================================================*/\n        @media only screen and (-webkit-device-pixel-ratio:.75){\n            /* Put CSS for low density (ldpi) Android layouts in here */\n        }\n        @media only screen and (-webkit-device-pixel-ratio:1){\n            /* Put CSS for medium density (mdpi) Android layouts in here */\n        }\n        @media only screen and (-webkit-device-pixel-ratio:1.5){\n            /* Put CSS for high density (hdpi) Android layouts in here */\n        }\n        /* end Android targeting */\n        /* CONDITIONS FOR IOS DEVICES ONLY\n        =====================================================*/\n        @media only screen and (min-device-width : 320px) and (max-device-width:568px) {\n        }\n        /* end IOS targeting */\n    </style>\n\n    <!--[if mso 12]>\n    <style type=\"text/css\">\n        .flexibleContainer{display:block !important; width:100% !important;}\n    </style>\n    <![endif]-->\n    <!--[if mso 14]>\n    <style type=\"text/css\">\n        .flexibleContainer{display:block !important; width:100% !important;}\n    </style>\n    <![endif]-->\n</head>\n<body bgcolor=\"#E1E1E1\" leftmargin=\"0\" marginwidth=\"0\" topmargin=\"0\" marginheight=\"0\" offset=\"0\">\n\n<center style=\"background-color:#E1E1E1;\">\n    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" height=\"100%\" width=\"100%\" id=\"bodyTable\" style=\"table-layout: fixed;max-width:100% !important;width: 100% !important;min-width: 100% !important;\">\n        <tr>\n            <td align=\"center\" valign=\"top\" id=\"bodyCell\">\n\n\n                <table bgcolor=\"#E1E1E1\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"500\" id=\"emailHeader\">\n\n                    <!-- HEADER ROW // -->\n                    <tr>\n                        <td align=\"center\" valign=\"top\">\n                            <!-- CENTERING TABLE // -->\n                            <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n                                <tr>\n                                    <td align=\"center\" valign=\"top\">\n                                        <!-- FLEXIBLE CONTAINER // -->\n                                        <table border=\"0\" cellpadding=\"10\" cellspacing=\"0\" width=\"500\" class=\"flexibleContainer\">\n                                            <tr>\n                                                <td valign=\"top\" width=\"500\" class=\"flexibleContainerCell\">\n\n                                                    <!-- CONTENT TABLE // -->\n                                                    <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n                                                        <tr>\n\n                                                            <td align=\"left\" valign=\"middle\" id=\"invisibleIntroduction\" class=\"flexibleContainerBox\" style=\"display:none !important; mso-hide:all;\">\n                                                                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"max-width:100%;\">\n                                                                    <tr>\n                                                                        <td align=\"left\" class=\"textContent\">\n                                                                            <div style=\"font-family:Helvetica,Arial,sans-serif;font-size:13px;color:#828282;text-align:center;line-height:120%;\">\n                                                                                Welcome to SDSU Conference Management portal. Your account details are here.\n                                                                            </div>\n                                                                        </td>\n                                                                    </tr>\n                                                                </table>\n                                                            </td>\n                                                            <td align=\"right\" valign=\"middle\" class=\"flexibleContainerBox\">\n                                                                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"max-width:100%;\">\n                                                                    <tr>\n                                                                        <td align=\"left\" class=\"textContent\">\n                                                                            <!-- CONTENT // -->\n                                                                            <div style=\"font-family:Helvetica,Arial,sans-serif;font-size:13px;color:#828282;text-align:center;line-height:120%;\">\n                                                                                                                                                            </div>\n                                                                        </td>\n                                                                    </tr>\n                                                                </table>\n                                                            </td>\n                                                        </tr>\n                                                    </table>\n                                                </td>\n                                            </tr>\n                                        </table>\n                                        <!-- // FLEXIBLE CONTAINER -->\n                                    </td>\n                                </tr>\n                            </table>\n                            <!-- // CENTERING TABLE -->\n                        </td>\n                    </tr>\n                    <!-- // END -->\n\n                </table>\n\n                <table bgcolor=\"#FFFFFF\"  border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"500\" id=\"emailBody\">\n\n\n                    <tr>\n                        <td align=\"center\" valign=\"top\">\n                            <!-- CENTERING TABLE // -->\n\n                            <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"color:#FFFFFF;\" bgcolor=\"#cc0033\">\n                                <tr>\n                                    <td align=\"center\" valign=\"top\">\n\n                                        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"500\" class=\"flexibleContainer\">\n                                            <tr>\n                                                <td align=\"center\" valign=\"top\" width=\"500\" class=\"flexibleContainerCell\">\n\n                                                    <table border=\"0\" cellpadding=\"30\" cellspacing=\"0\" width=\"100%\">\n                                                        <tr>\n                                                            <td align=\"center\" valign=\"top\" class=\"textContent\">\n                                                                <h1 style=\"color:#FFFFFF;line-height:100%;font-family:Helvetica,Arial,sans-serif;font-size:35px;font-weight:normal;margin-bottom:5px;text-align:center;\">Activation required!</h1>\n                                                                <h2 style=\"text-align:center;font-weight:normal;font-family:Helvetica,Arial,sans-serif;font-size:23px;margin-bottom:10px;color:#fff;line-height:135%;\">Welcome to the Conference Management Portal, Venkat.</h2>\n                                                                <div style=\"text-align:center;font-family:Helvetica,Arial,sans-serif;font-size:15px;margin-bottom:0;color:#FFFFFF;line-height:135%;\">Thank you for registering. You can now submit your papers, update account information, check status of your submission, and pay the conference fee using this account.<br><span style=\"color:white;\">Click on the button below to activate your account first.</span></div>\n                                                            </td>\n                                                        </tr>\n                                                    </table>\n                                                    <!-- // CONTENT TABLE -->\n\n                                                </td>\n                                            </tr>\n                                        </table>\n                                        <!-- // FLEXIBLE CONTAINER -->\n                                    </td>\n                                </tr>\n                            </table>\n                            <!-- // CENTERING TABLE -->\n                        </td>\n                    </tr>\n\n                    <tr mc:hideable>\n                        <td align=\"center\" valign=\"top\">\n                            <!-- CENTERING TABLE // -->\n                            <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n                                <tr>\n                                    <td align=\"center\" valign=\"top\">\n                                        <!-- FLEXIBLE CONTAINER // -->\n                                        <table border=\"0\" cellpadding=\"30\" cellspacing=\"0\" width=\"500\" class=\"flexibleContainer\">\n                                            <tr>\n                                                <td valign=\"top\" width=\"500\" class=\"flexibleContainerCell\">\n\n                                                    <!-- CONTENT TABLE // -->\n                                                    <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n                                                        <tr>\n                                                            <td align=\"left\" valign=\"top\" class=\"flexibleContainerBox\">\n\n                                                            </td>\n                                                            <td align=\"right\" valign=\"middle\" class=\"flexibleContainerBox\">\n\n                                                            </td>\n                                                        </tr>\n                                                    </table>\n                                                    <!-- // CONTENT TABLE -->\n\n                                                </td>\n                                            </tr>\n                                        </table>\n                                        <!-- // FLEXIBLE CONTAINER -->\n                                    </td>\n                                </tr>\n                            </table>\n                            <!-- // CENTERING TABLE -->\n                        </td>\n                    </tr>\n                    <!-- // MODULE ROW -->\n\n\n                    <!-- MODULE ROW // -->\n                    <tr>\n                        <td align=\"center\" valign=\"top\">\n                            <!-- CENTERING TABLE // -->\n                            <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n                                <tr style=\"padding-top:0;\">\n                                    <td align=\"center\" valign=\"top\">\n                                        <!-- FLEXIBLE CONTAINER // -->\n                                        <table border=\"0\" cellpadding=\"30\" cellspacing=\"0\" width=\"500\" class=\"flexibleContainer\">\n                                            <tr>\n                                                <td style=\"padding-top:0;\" align=\"center\" valign=\"top\" width=\"500\" class=\"flexibleContainerCell\">\n\n                                                    <!-- CONTENT TABLE // -->\n                                                    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"50%\" class=\"emailButton\" style=\"background-color: #cc0033;\">\n                                                        <tr>\n                                                            <td align=\"center\" valign=\"middle\" class=\"buttonContent\" style=\"padding-top:15px;padding-bottom:15px;padding-right:15px;padding-left:15px;\">\n                                                                <a style=\"color:#FFFFFF;text-decoration:none;font-family:Helvetica,Arial,sans-serif;font-size:20px;line-height:135%;\" href=\"http://localhost:4200/account/activate/3d5baca6-845c-4d90-9501-49745b50909f/token/ODg5OGNhOWEtNDM5Yy00YmIwLTlhMDYtODM4MGNiM2Y4ZTg5fjNkNWJhY2E2LTg0NWMtNGQ5MC05NTAxLTQ5NzQ1YjUwOTA5Zg==\" target=\"_blank\">Activate Account</a>\n                                                            </td>\n                                                        </tr>\n                                                    </table>\n                                                    <!-- // CONTENT TABLE -->\n\n                                                </td>\n                                            </tr>\n                                        </table>\n                                        <!-- // FLEXIBLE CONTAINER -->\n                                    </td>\n                                </tr>\n                            </table>\n                            <!-- // CENTERING TABLE -->\n                        </td>\n                    </tr>\n                    \n                    <tr>\n                        <td align=\"center\" valign=\"top\">\n                            <!-- CENTERING TABLE // -->\n                            <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"color:#FFFFFF;\" bgcolor=\"#cc0033\">\n                                <tr>\n                                    <td align=\"center\" valign=\"top\">\n                                        <!-- FLEXIBLE CONTAINER // -->\n                                        <table border=\"0\" cellpadding=\"30\" cellspacing=\"0\" width=\"500\" class=\"flexibleContainer\">\n                                            <tr>\n                                                <td valign=\"top\" width=\"500\" class=\"flexibleContainerCell\">\n\n                                                    <!-- CONTENT TABLE // -->\n                                                    <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n                                                        <tr>\n                                                            <td align=\"left\" valign=\"top\" class=\"flexibleContainerBox\">\n                                                                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"270\" style=\"max-width: 100%;\">\n                                                                    <tr>\n                                                                        <td align=\"left\" class=\"textContent\">\n                                                                            <h3 style=\"color:#FFFFFF;line-height:125%;font-family:Helvetica,Arial,sans-serif;font-size:16px;font-weight:normal;margin-top:0;margin-bottom:3px;text-align:left;\">San Diego State University</h3>\n                                                                            <div style=\"text-align:left;font-family:Helvetica,Arial,sans-serif;font-size:12px;margin-bottom:0;color:#FFFFFF;line-height:135%;\">Department of Mechanical Engineering <br>5500 Campanile Drive <br> San Diego<br> CA 92182</div>\n                                                                        </td>\n                                                                    </tr>\n                                                                </table>\n                                                            </td>\n                                                            <td align=\"right\" valign=\"middle\" class=\"flexibleContainerBox\">\n                                                                <table class=\"flexibleContainerBoxNext\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"210\" style=\"max-width: 100%;\">\n                                                                    <tr>\n                                                                        <td align=\"left\" class=\"textContent\">\n                                                                            <h3 style=\"color:#FFFFFF;line-height:125%;font-family:Helvetica,Arial,sans-serif;font-size:14px;font-weight:normal;margin-top:0;margin-bottom:3px;text-align:left;\">Contact</h3>\n                                                                            <div style=\"text-align:left;font-family:Helvetica,Arial,sans-serif;font-size:12px;margin-bottom:0;color:#FFFFFF;line-height:135%;\">E-mail : contact@ecosconference.org</div>\n                                                                        </td>\n                                                                    </tr>\n                                                                </table>\n                                                            </td>\n                                                        </tr>\n                                                    </table>\n                                                    <!-- // CONTENT TABLE -->\n\n                                                </td>\n                                            </tr>\n                                        </table>\n                                        <!-- // FLEXIBLE CONTAINER -->\n                                    </td>\n                                </tr>\n                            </table>\n                            <!-- // CENTERING TABLE -->\n                        </td>\n                    </tr>\n                    <!-- // MODULE ROW -->\n\n\n\n\n\n                    <!-- MODULE DIVIDER // -->\n                    <tr>\n                        <td align=\"center\" valign=\"top\">\n                            <!-- CENTERING TABLE // -->\n                            <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n                                <tr>\n                                    <td align=\"center\" valign=\"top\">\n                                        <!-- FLEXIBLE CONTAINER // -->\n                                        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"500\" class=\"flexibleContainer\">\n                                            <tr>\n                                                <td align=\"center\" valign=\"top\" width=\"500\" class=\"flexibleContainerCell\">\n                                                    <table class=\"flexibleContainerCellDivider\" border=\"0\" cellpadding=\"30\" cellspacing=\"0\" width=\"100%\">\n                                                        <tr>\n                                                            <td align=\"center\" valign=\"top\" style=\"padding-top:0px;padding-bottom:0px;\">\n\n                                                                <!-- CONTENT TABLE // -->\n                                                                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n                                                                    <tr>\n                                                                        <td align=\"center\" valign=\"top\" style=\"border-top:1px solid #C8C8C8;\"></td>\n                                                                    </tr>\n                                                                </table>\n                                                                <!-- // CONTENT TABLE -->\n\n                                                            </td>\n                                                        </tr>\n                                                    </table>\n                                                </td>\n                                            </tr>\n                                        </table>\n                                        <!-- // FLEXIBLE CONTAINER -->\n                                    </td>\n                                </tr>\n                            </table>\n                            <!-- // CENTERING TABLE -->\n                        </td>\n                    </tr>\n                    <!-- // END -->\n\n\n\n\n\n                </table>\n               \n                <table bgcolor=\"#E1E1E1\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"500\" id=\"emailFooter\">\n\n\n                    <tr>\n                        <td align=\"center\" valign=\"top\">\n                            <!-- CENTERING TABLE // -->\n                            <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n                                <tr>\n                                    <td align=\"center\" valign=\"top\">\n                                        <!-- FLEXIBLE CONTAINER // -->\n                                        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"500\" class=\"flexibleContainer\">\n                                            <tr>\n                                                <td align=\"center\" valign=\"top\" width=\"500\" class=\"flexibleContainerCell\">\n                                                    <table border=\"0\" cellpadding=\"30\" cellspacing=\"0\" width=\"100%\">\n                                                        <tr>\n                                                            <td valign=\"top\" bgcolor=\"#E1E1E1\">\n\n                                                                <div style=\"font-family:Helvetica,Arial,sans-serif;font-size:13px;color:#828282;text-align:center;line-height:120%;\">\n                                                                    <div>Copyright &#169; 2016 - 2017 <a href=\"www.sdsu.edu\" target=\"_blank\" style=\"text-decoration:none;color:#828282;\"><span style=\"color:#828282;\">San Diego State University</span></a>. All&nbsp;rights&nbsp;reserved.</div>\n\n                                                                </div>\n\n                                                            </td>\n                                                        </tr>\n                                                    </table>\n                                                </td>\n                                            </tr>\n                                        </table>\n                                        <!-- // FLEXIBLE CONTAINER -->\n                                    </td>\n                                </tr>\n                            </table>\n                            <!-- // CENTERING TABLE -->\n                        </td>\n                    </tr>\n\n                </table>\n                <!-- // END -->\n\n            </td>\n        </tr>\n    </table>\n</center>\n</body>\n</html>', 'Y', '2018-04-06 05:49:56', 'SDSU-CMS-1', 'SDSU-CMS', 'N', 'SDSU-CMS', 'MESSAGE', 'N', 'email', 'SDSU-CMS ADMIN');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `rid` varchar(36) NOT NULL,
  `sid` varchar(36) NOT NULL,
  `uid` varchar(36) NOT NULL,
  `review` longtext NOT NULL,
  `score` int(10) NOT NULL,
  `message_to_chair` longtext NOT NULL,
  `confidence_score` int(10) NOT NULL,
  `last_updated` datetime NOT NULL,
  `edit_reason` text NOT NULL,
  `is_edited` varchar(1) NOT NULL DEFAULT 'N',
  `valid` varchar(1) NOT NULL DEFAULT 'Y'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `role_id` varchar(36) NOT NULL,
  `role_name` varchar(100) NOT NULL,
  `valid` varchar(1) NOT NULL DEFAULT 'Y'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`role_id`, `role_name`, `valid`) VALUES
('ROLE_ADMIN', 'Portal Administrator', 'Y'),
('ROLE_AUTHOR', 'Author', 'Y'),
('ROLE_CHAIR', 'Conference Chair', 'Y'),
('ROLE_REVIEWER', 'Reviewer', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `submissions`
--

CREATE TABLE `submissions` (
  `sid` varchar(36) NOT NULL,
  `title` varchar(500) NOT NULL,
  `submission_date` datetime NOT NULL,
  `corresponding_author_id` varchar(36) NOT NULL,
  `track_id` bigint(20) NOT NULL,
  `abstract` text NOT NULL,
  `last_updated` datetime NOT NULL,
  `decision_status` int(10) NOT NULL,
  `is_paid` varchar(1) NOT NULL,
  `valid` varchar(1) NOT NULL DEFAULT 'Y'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tracks`
--

CREATE TABLE `tracks` (
  `tid` bigint(20) NOT NULL,
  `tname` text NOT NULL,
  `cid` varchar(36) NOT NULL,
  `valid` varchar(1) NOT NULL DEFAULT 'Y'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` varchar(36) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `middle_name` varchar(100) DEFAULT NULL,
  `title` varchar(20) NOT NULL,
  `email` varchar(80) NOT NULL,
  `password` varchar(68) NOT NULL,
  `address1` varchar(100) NOT NULL,
  `address2` varchar(100) DEFAULT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `country` varchar(50) NOT NULL,
  `zipcode` int(10) NOT NULL,
  `affiliation` varchar(100) NOT NULL,
  `department` varchar(100) NOT NULL,
  `dob` date NOT NULL,
  `is_participating` varchar(1) NOT NULL,
  `valid` varchar(1) NOT NULL DEFAULT 'Y',
  `is_active` varchar(1) NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `middle_name`, `title`, `email`, `password`, `address1`, `address2`, `city`, `state`, `country`, `zipcode`, `affiliation`, `department`, `dob`, `is_participating`, `valid`, `is_active`) VALUES
('3d5baca6-845c-4d90-9501-49745b50909f', 'Venkat', 'Vyshak', 'BR', 'Mr', 'venkatvyshakbr@gmail.com', '$2a$10$vOXpDpoWuQXBYNCWarawWe3.HbvTNNosDwrbAG2WCAinDnSxWxmlS', '5485 55th St', '15B', 'San Diego', 'CA', 'US', 92115, 'SDSU', 'CS', '1992-04-27', 'N', 'Y', 'N'),
('73ea1e3a-4939-4406-bdca-0b39de674484', 'Pavan', 'Pasala', 'Kumar', 'Mr', 'pavanpkp33@gmail.com', '$2a$10$BTmOjmSHkJFfDA/bo4SfwunF5UEDn.uC.3lb8nnJF1V7HzBoq9DpG', '5485 55th St', '15B', 'San Diego', 'CA', 'US', 92115, 'SDSU', 'CS', '1992-04-27', 'N', 'Y', 'N'),
('SDSU-CMS-1', 'SDSU-CMS ADMIN', 'SDSU-CMS ADMIN', 'SDSU-CMS ADMIN', 'Mr', 'noreply.sdsucms@gmail.com', '$2a$10$CvAT1AWZ7F2mxOLl6a0IaOrRajLOTUQlrNPlxzIXYyME5DE.ciAFm', 'SDSU', 'SDSU', 'San Diego', 'CA', 'US', 92115, 'SDSU', 'CS', '1992-04-27', 'N', 'Y', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `user_activation`
--

CREATE TABLE `user_activation` (
  `id` varchar(36) NOT NULL,
  `user_id` varchar(36) NOT NULL,
  `token` varchar(500) NOT NULL,
  `valid` varchar(1) NOT NULL DEFAULT 'Y'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_activation`
--

INSERT INTO `user_activation` (`id`, `user_id`, `token`, `valid`) VALUES
('02d45721-4eac-4967-bb13-60edcaf2c143', '560dcbf6-08b0-467a-bf9d-e8b90ff33f4a', 'MDJkNDU3MjEtNGVhYy00OTY3LWJiMTMtNjBlZGNhZjJjMTQzfjU2MGRjYmY2LTA4YjAtNDY3YS1iZjlkLWU4YjkwZmYzM2Y0YQ==', 'Y'),
('229243d6-de11-451a-985e-2e6c94660567', '98ac5272-8130-4c7f-8472-2ca2ae711f3c', 'MjI5MjQzZDYtZGUxMS00NTFhLTk4NWUtMmU2Yzk0NjYwNTY3fjk4YWM1MjcyLTgxMzAtNGM3Zi04NDcyLTJjYTJhZTcxMWYzYw==', 'Y'),
('3f9d797d-d56b-45c1-b98e-24acc4d6ad20', '0ef89c08-d869-4aae-9d49-1750edc94e33', 'M2Y5ZDc5N2QtZDU2Yi00NWMxLWI5OGUtMjRhY2M0ZDZhZDIwfjBlZjg5YzA4LWQ4NjktNGFhZS05ZDQ5LTE3NTBlZGM5NGUzMw==', 'Y'),
('4bb06fb7-0333-4afe-b199-cc960a2ccf87', '6875ccb5-d971-4be4-b65a-82d5108484c1', 'NGJiMDZmYjctMDMzMy00YWZlLWIxOTktY2M5NjBhMmNjZjg3fjY4NzVjY2I1LWQ5NzEtNGJlNC1iNjVhLTgyZDUxMDg0ODRjMQ==', 'Y'),
('52cd7ea9-b71b-4d5f-9b30-d13def8b8e98', '48869e32-e0ab-4394-a42c-b455adbb5a20', 'NTJjZDdlYTktYjcxYi00ZDVmLTliMzAtZDEzZGVmOGI4ZTk4fjQ4ODY5ZTMyLWUwYWItNDM5NC1hNDJjLWI0NTVhZGJiNWEyMA==', 'Y'),
('8029ac72-ae4b-4982-be0f-1dad7d51d236', '479940a7-cbe2-4778-a487-2aa4cee3d953', 'ODAyOWFjNzItYWU0Yi00OTgyLWJlMGYtMWRhZDdkNTFkMjM2fjQ3OTk0MGE3LWNiZTItNDc3OC1hNDg3LTJhYTRjZWUzZDk1Mw==', 'Y'),
('8898ca9a-439c-4bb0-9a06-8380cb3f8e89', '3d5baca6-845c-4d90-9501-49745b50909f', 'ODg5OGNhOWEtNDM5Yy00YmIwLTlhMDYtODM4MGNiM2Y4ZTg5fjNkNWJhY2E2LTg0NWMtNGQ5MC05NTAxLTQ5NzQ1YjUwOTA5Zg==', 'Y'),
('8f5ef7c9-f4f8-41b8-bcae-6b6ef0868534', '413d7995-6663-43d5-9fa4-97d677b8ea36', 'OGY1ZWY3YzktZjRmOC00MWI4LWJjYWUtNmI2ZWYwODY4NTM0fjQxM2Q3OTk1LTY2NjMtNDNkNS05ZmE0LTk3ZDY3N2I4ZWEzNg==', 'Y'),
('9f4087a9-97e9-4b45-be48-ab8a60bef644', '73ea1e3a-4939-4406-bdca-0b39de674484', 'OWY0MDg3YTktOTdlOS00YjQ1LWJlNDgtYWI4YTYwYmVmNjQ0fjczZWExZTNhLTQ5MzktNDQwNi1iZGNhLTBiMzlkZTY3NDQ4NA==', 'Y'),
('c8349ce3-6a3c-409a-8e2b-c07792b3496f', 'a560de67-d51c-4b5e-8dcd-91fc51ec98e8', 'YzgzNDljZTMtNmEzYy00MDlhLThlMmItYzA3NzkyYjM0OTZmfmE1NjBkZTY3LWQ1MWMtNGI1ZS04ZGNkLTkxZmM1MWVjOThlOA==', 'Y'),
('d09685e9-af11-4af0-a6da-7be77451fa7f', 'f864298f-dfa2-4d28-a7be-b1a84302de08', 'ZDA5Njg1ZTktYWYxMS00YWYwLWE2ZGEtN2JlNzc0NTFmYTdmfmY4NjQyOThmLWRmYTItNGQyOC1hN2JlLWIxYTg0MzAyZGUwOA==', 'Y'),
('ffbbe5d4-be25-4992-aa1e-1c5d2e599e15', '329e6b7b-7b2c-4f92-8f6b-7dd0298f1703', 'ZmZiYmU1ZDQtYmUyNS00OTkyLWFhMWUtMWM1ZDJlNTk5ZTE1fjMyOWU2YjdiLTdiMmMtNGY5Mi04ZjZiLTdkZDAyOThmMTcwMw==', 'Y');

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
  ADD KEY `cid` (`cid`,`sid`,`uid`),
  ADD KEY `fk_conf_sub_users_sid` (`sid`),
  ADD KEY `fk_conf_sub_users_uid` (`uid`);

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
  ADD PRIMARY KEY (`req_id`),
  ADD KEY `fk_fpwd_uid` (`uid`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`notification_id`),
  ADD KEY `fk_noti_sender_uid` (`sender_uid`),
  ADD KEY `fk_noti_cid` (`cid`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`rid`),
  ADD KEY `fk_reviews_sid` (`sid`),
  ADD KEY `fk_reviews_uid` (`uid`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`role_id`);

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
-- Indexes for table `user_activation`
--
ALTER TABLE `user_activation`
  ADD PRIMARY KEY (`id`);

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
-- Constraints for table `conf_sub_users`
--
ALTER TABLE `conf_sub_users`
  ADD CONSTRAINT `fk_conf_sub_users_cid` FOREIGN KEY (`cid`) REFERENCES `conference` (`cid`),
  ADD CONSTRAINT `fk_conf_sub_users_sid` FOREIGN KEY (`sid`) REFERENCES `submissions` (`sid`),
  ADD CONSTRAINT `fk_conf_sub_users_uid` FOREIGN KEY (`uid`) REFERENCES `users` (`id`);

--
-- Constraints for table `files`
--
ALTER TABLE `files`
  ADD CONSTRAINT `FK_files` FOREIGN KEY (`uploaded_by_user`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `FK_filetype` FOREIGN KEY (`type_id`) REFERENCES `file_type` (`type_id`);

--
-- Constraints for table `forgot_password`
--
ALTER TABLE `forgot_password`
  ADD CONSTRAINT `fk_fpwd_uid` FOREIGN KEY (`uid`) REFERENCES `users` (`id`);

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `fk_noti_cid` FOREIGN KEY (`cid`) REFERENCES `conference` (`cid`),
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
