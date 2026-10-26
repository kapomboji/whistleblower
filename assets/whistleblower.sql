-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 23, 2026 at 07:06 AM
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
-- Database: `whistleblower`
--

-- --------------------------------------------------------

--
-- Table structure for table `archived_notifications`
--

CREATE TABLE `archived_notifications` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `notificationId` varchar(180) NOT NULL,
  `userId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `archivedAt` datetime NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `audit_logs`
--

CREATE TABLE `audit_logs` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `userId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `caseId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `action` varchar(100) NOT NULL,
  `entityType` varchar(80) NOT NULL,
  `entityId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`metadata`)),
  `ipAddress` varchar(45) DEFAULT NULL,
  `userAgent` varchar(512) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `audit_logs`
--

INSERT INTO `audit_logs` (`id`, `userId`, `caseId`, `action`, `entityType`, `entityId`, `metadata`, `ipAddress`, `userAgent`, `createdAt`, `updatedAt`) VALUES
('2e55d436-8977-434a-b328-7f808696bb8f', '302c5e50-9c9b-4b6b-90a8-92be0c448805', '5f4efb32-b49a-4b10-bd29-47f3498f70c3', 'case_viewed', 'case', '5f4efb32-b49a-4b10-bd29-47f3498f70c3', '{\"access\":\"detail\"}', NULL, NULL, '2026-10-23 00:54:08', '2026-10-23 00:54:08'),
('a38a923a-4f07-493c-9716-7b4424f43132', NULL, '5f4efb32-b49a-4b10-bd29-47f3498f70c3', 'report_submitted', 'case', '5f4efb32-b49a-4b10-bd29-47f3498f70c3', '{\"channel\":\"website\",\"attachmentCount\":4}', NULL, NULL, '2026-10-23 00:53:34', '2026-10-23 00:53:34'),
('dc472292-179a-42c2-bb0f-c22eb44d318a', '302c5e50-9c9b-4b6b-90a8-92be0c448805', '5f4efb32-b49a-4b10-bd29-47f3498f70c3', 'case_viewed', 'case', '5f4efb32-b49a-4b10-bd29-47f3498f70c3', '{\"access\":\"detail\"}', NULL, NULL, '2026-10-23 00:54:08', '2026-10-23 00:54:08');

-- --------------------------------------------------------

--
-- Table structure for table `call_recordings`
--

CREATE TABLE `call_recordings` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `callRecordId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `encryptedPath` text NOT NULL,
  `checksum` char(64) NOT NULL,
  `byteSize` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `call_records`
--

CREATE TABLE `call_records` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `caseId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `externalReference` varchar(120) DEFAULT NULL,
  `callerNumberHash` char(64) DEFAULT NULL,
  `startedAt` datetime NOT NULL,
  `endedAt` datetime DEFAULT NULL,
  `direction` enum('inbound','outbound') NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `call_transcriptions`
--

CREATE TABLE `call_transcriptions` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `callRecordId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `encryptedText` text NOT NULL,
  `language` varchar(20) DEFAULT NULL,
  `confidence` decimal(5,4) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cases`
--

CREATE TABLE `cases` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `caseNumber` varchar(64) NOT NULL,
  `statusId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `sourceId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `leadUserId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `priority` enum('low','normal','high','critical') NOT NULL DEFAULT 'normal',
  `openedAt` datetime NOT NULL,
  `closedAt` datetime DEFAULT NULL,
  `retentionUntil` datetime DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `organizationId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cases`
--

INSERT INTO `cases` (`id`, `caseNumber`, `statusId`, `sourceId`, `leadUserId`, `priority`, `openedAt`, `closedAt`, `retentionUntil`, `createdAt`, `updatedAt`, `organizationId`) VALUES
('5f4efb32-b49a-4b10-bd29-47f3498f70c3', 'WB/BC/20261023/ce901d11bcbd427f67bd6cdc508e7736', 'e30e2c8e-be91-4fef-b789-53be844f0bbe', '2017f25a-5238-46c4-96d7-86f02c71a58f', NULL, 'normal', '2026-10-23 00:53:34', NULL, NULL, '2026-10-23 00:53:34', '2026-10-23 00:53:34', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `case_assignments`
--

CREATE TABLE `case_assignments` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `caseId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `userId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `assignedByUserId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `assignmentType` enum('lead','owner','investigator','reviewer','observer') NOT NULL DEFAULT 'reviewer',
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `assignedAt` datetime NOT NULL,
  `unassignedAt` datetime DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `case_categories`
--

CREATE TABLE `case_categories` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `code` varchar(20) NOT NULL,
  `name` varchar(120) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `case_categories`
--

INSERT INTO `case_categories` (`id`, `code`, `name`, `description`, `active`, `createdAt`, `updatedAt`) VALUES
('31b64197-052c-4961-a0e1-b1759210b4dc', 'FT', 'Fraud / Theft', NULL, 1, '2026-09-21 11:38:35', '2026-09-21 11:38:35'),
('3277279b-f65e-44d1-bdf7-495e61c2591d', 'HSE', 'Health, Safety and Environmental Concerns', NULL, 1, '2026-09-21 11:38:35', '2026-09-21 11:38:35'),
('47ceb0bf-1e11-4159-ab86-649f933dc3a2', 'BC', 'Bribery / Corruption', NULL, 1, '2026-09-21 11:38:35', '2026-09-21 11:38:35'),
('4d98b118-1d93-4e8a-a5bf-05a25186f23e', 'PB', 'Policy Breaches', NULL, 1, '2026-09-21 11:38:35', '2026-09-21 11:38:35'),
('59808e2c-49cb-4cc4-ae2d-c49ad98b2af8', 'HD', 'Harassment / Discrimination', NULL, 1, '2026-09-21 11:38:35', '2026-09-21 11:38:35'),
('85e448db-9829-4f2f-95d3-ca0f26aab09c', 'AA', 'Abuse Of Authority', NULL, 1, '2026-09-21 11:38:35', '2026-09-21 11:38:35'),
('8aec0624-c766-4fcf-bbcb-fa27f3ac0fa8', 'FM', 'Financial Misreporting', NULL, 1, '2026-09-21 11:38:35', '2026-09-21 11:38:35'),
('9f0fb4ed-34c2-4ae0-8f61-428006fd193f', 'CI', 'Conflicts Of Interest', NULL, 1, '2026-09-21 11:38:35', '2026-09-21 11:38:35'),
('9fa30d56-f12e-4874-a206-d8b94e83305c', 'PI', 'Procurement Irregularities', NULL, 1, '2026-09-21 11:38:35', '2026-09-21 11:38:35');

-- --------------------------------------------------------

--
-- Table structure for table `case_category_map`
--

CREATE TABLE `case_category_map` (
  `caseId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `categoryId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `case_category_map`
--

INSERT INTO `case_category_map` (`caseId`, `categoryId`, `createdAt`, `updatedAt`) VALUES
('5f4efb32-b49a-4b10-bd29-47f3498f70c3', '47ceb0bf-1e11-4159-ab86-649f933dc3a2', '2026-10-23 00:53:34', '2026-10-23 00:53:34');

-- --------------------------------------------------------

--
-- Table structure for table `case_documents`
--

CREATE TABLE `case_documents` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `caseId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `uploadedByUserId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `title` varchar(180) NOT NULL,
  `encryptedPath` text NOT NULL,
  `checksum` char(64) NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `case_intakes`
--

CREATE TABLE `case_intakes` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `caseId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `encryptedPayload` text NOT NULL,
  `submittedAt` datetime NOT NULL,
  `channel` enum('website','telephone','email','manual','mobile') NOT NULL DEFAULT 'website',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `case_intakes`
--

INSERT INTO `case_intakes` (`id`, `caseId`, `encryptedPayload`, `submittedAt`, `channel`, `createdAt`, `updatedAt`) VALUES
('76fe1bfe-2b3b-4ddd-bc68-84576b0c8c82', '5f4efb32-b49a-4b10-bd29-47f3498f70c3', 'v1.AreX9HfJXLWqdh0K.BDoyRGDM1kVbWe5Pd_Vmmg.nClwk2TvGvbEDmnyJxH0o7pvOLGuyzNUUrh_WTz8fXQ0IgQBj04y54AUuEEzHnt5_2tL1YCrgpzibsvcOVJBlsApGHiC8Cs_NP9REmSmmAQm3KgWOtb1KUpGGHOE558hd2KtMuzhErUJlGFlixDEVTm_dhejLoEfzYt4oFMSHNCNdNqBQrirSV60bgzDC0P3ISVg6u-5OM0nfOUylHoFktPShRbdyxMly6Q6QaI04h7lrzkGyjxjw-3O4a336p0j7kLlieSUekoy7JhXPx9m_O2dm5FIcZZtQgz9r0fTTQtetscj5yi0KMN4DzS1osa1QATRSL3X7K6lypenVnRiP9LVyq5DB9XxT0BAxPL-aNrADA', '2026-10-23 00:53:34', 'website', '2026-10-23 00:53:34', '2026-10-23 00:53:34');

-- --------------------------------------------------------

--
-- Table structure for table `case_messages`
--

CREATE TABLE `case_messages` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `caseId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `senderUserId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `encryptedBody` text NOT NULL,
  `senderType` enum('reporter','staff','system') NOT NULL,
  `readAt` datetime DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `case_notes`
--

CREATE TABLE `case_notes` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `caseId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `authorUserId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `encryptedBody` text NOT NULL,
  `noteType` enum('investigation','review','decision','general') NOT NULL DEFAULT 'general',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `case_secondary_reviews`
--

CREATE TABLE `case_secondary_reviews` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `caseId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `reviewerUserId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `assignedByUserId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `status` enum('assigned','submitted','accepted','declined','follow_up_requested') NOT NULL DEFAULT 'assigned',
  `encryptedReason` longtext NOT NULL,
  `encryptedContext` longtext DEFAULT NULL,
  `encryptedAssessment` longtext DEFAULT NULL,
  `encryptedRecommendation` longtext DEFAULT NULL,
  `submittedAt` datetime DEFAULT NULL,
  `decidedByUserId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `encryptedDecisionNotes` longtext DEFAULT NULL,
  `decidedAt` datetime DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `case_sources`
--

CREATE TABLE `case_sources` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `code` varchar(30) NOT NULL,
  `name` varchar(100) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `case_sources`
--

INSERT INTO `case_sources` (`id`, `code`, `name`, `active`, `createdAt`, `updatedAt`) VALUES
('09322065-cd16-4740-b298-268b5e5726ed', 'EMAIL', 'Email', 1, '2026-09-21 11:38:35', '2026-09-21 11:38:35'),
('2017f25a-5238-46c4-96d7-86f02c71a58f', 'WEBSITE', 'Website', 1, '2026-09-21 11:38:35', '2026-09-21 11:38:35'),
('8c7c9f2b-c9e0-4a7b-9c6d-da45d8bb2334', 'TELEPHONE', 'Telephone', 1, '2026-09-21 11:38:35', '2026-09-21 11:38:35'),
('9352907f-6039-40e5-9019-d10e221b0630', 'MANUAL', 'Manual', 1, '2026-09-21 11:38:35', '2026-09-21 11:38:35'),
('fbb67335-f8ec-4d60-867b-305e855525a2', 'MOBILE', 'Mobile', 1, '2026-09-21 11:38:35', '2026-09-21 11:38:35');

-- --------------------------------------------------------

--
-- Table structure for table `case_statuses`
--

CREATE TABLE `case_statuses` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `code` varchar(40) NOT NULL,
  `name` varchar(100) NOT NULL,
  `sortOrder` int(11) NOT NULL,
  `isFinal` tinyint(1) NOT NULL DEFAULT 0,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `case_statuses`
--

INSERT INTO `case_statuses` (`id`, `code`, `name`, `sortOrder`, `isFinal`, `createdAt`, `updatedAt`) VALUES
('34b2c0cf-0b75-4e04-b5f0-327c48026dc9', 'CLOSED', 'Closed', 7, 1, '2026-09-21 11:38:35', '2026-10-22 10:06:35'),
('66e347b6-b5ab-408e-a88a-f8f40264186c', 'ACTION_REQUIRED', 'Action Required', 5, 0, '2026-09-21 11:38:35', '2026-10-22 10:06:35'),
('9429e6f4-6d3e-4296-be69-30526cbd1bf8', 'INVESTIGATING', 'Investigating', 4, 0, '2026-09-21 11:38:35', '2026-10-22 10:06:35'),
('b3181898-e893-4dd2-b9b4-c0422dfe9458', 'UNDER_REVIEW', 'Under Review', 3, 0, '2026-09-21 11:38:35', '2026-10-22 10:06:35'),
('c64e46df-cd13-46d7-b6b4-2ea8d1a73fce', 'RESOLVED', 'Resolved', 6, 1, '2026-09-21 11:38:35', '2026-10-22 10:06:35'),
('d2a13f8e-7e31-4894-b16e-d5160685b0e2', 'PENDING_REVIEW', 'Pending Review', 2, 0, '2026-10-13 11:09:52', '2026-10-22 10:06:35'),
('e30e2c8e-be91-4fef-b789-53be844f0bbe', 'NEW', 'New', 1, 0, '2026-09-21 11:38:35', '2026-10-22 10:06:35');

-- --------------------------------------------------------

--
-- Table structure for table `case_status_history`
--

CREATE TABLE `case_status_history` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `caseId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `changedByUserId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `fromStatusId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `toStatusId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `reason` text DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `encryptedReason` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `case_status_history`
--

INSERT INTO `case_status_history` (`id`, `caseId`, `changedByUserId`, `fromStatusId`, `toStatusId`, `reason`, `createdAt`, `updatedAt`, `encryptedReason`) VALUES
('d1f36aa7-7200-480c-b551-62773d7c4477', '5f4efb32-b49a-4b10-bd29-47f3498f70c3', NULL, NULL, 'e30e2c8e-be91-4fef-b789-53be844f0bbe', NULL, '2026-10-23 00:53:34', '2026-10-23 00:53:34', 'v1.vjoASsh6aMyfuZ7H.858uLzQz0weHsTDdJEMIrQ.8ry6slhTsY3HJ4UsXWVjMzabxZP1sG8nMOaQjXxolqoAgmcUFc6NBAqtcfu4zJ2eYBY');

-- --------------------------------------------------------

--
-- Table structure for table `evidence`
--

CREATE TABLE `evidence` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `caseId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `uploadedByUserId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `title` varchar(180) NOT NULL,
  `description` text DEFAULT NULL,
  `classification` enum('confidential','highly_confidential','restricted') NOT NULL DEFAULT 'confidential',
  `deletedAt` datetime DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `encryptedContent` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `evidence`
--

INSERT INTO `evidence` (`id`, `caseId`, `uploadedByUserId`, `title`, `description`, `classification`, `deletedAt`, `createdAt`, `updatedAt`, `encryptedContent`) VALUES
('4820a23f-1b6e-4411-bb54-8be9abc607a1', '5f4efb32-b49a-4b10-bd29-47f3498f70c3', NULL, 'Encrypted evidence', NULL, 'confidential', NULL, '2026-10-23 00:53:34', '2026-10-23 00:53:34', 'v1.9loql9HkwCd9yInM.GoKLselq0o-7HJ8Z-BGHiw.7BatJ1XftRFUGn6iIBrZBqNrB_e-hFvJoCfVB1q4cE5iO3DLK8NihiAN8W5yzD58sh3KljCRzfOAZKtpCsanRU2aKN4J9MsMhSfeNyruzuNBU1OuzCI'),
('a63414fb-9e8f-4141-8720-3413dc5924b7', '5f4efb32-b49a-4b10-bd29-47f3498f70c3', NULL, 'Encrypted evidence', NULL, 'confidential', NULL, '2026-10-23 00:53:34', '2026-10-23 00:53:34', 'v1.EiuxYhlpKbZ7HF0n.MGAvmB9ul19gk9wwo7Glhg.LBf9zvhW7yoIfqHmaMdiHsgvDLGV4ahzphiKu15ZxKETBAbkBPzeSOLZC29pDIuGOICdNGVcm8_c6gyPGJFzQB3MNp0M0xaxUY-Ex23eTzTgNuQHYbDa72WyYd8JnX4-wqYcMN0DHYjPQi2UzM9z'),
('bb878071-dee5-45fc-946a-c43fd95266a1', '5f4efb32-b49a-4b10-bd29-47f3498f70c3', NULL, 'Encrypted evidence', NULL, 'confidential', NULL, '2026-10-23 00:53:34', '2026-10-23 00:53:34', 'v1.QmaJJKaoa2oFmxNa.XLtirvnMeVKhCXeMEB3QeA.vxLpE14zy7U6lR9JfMpMVl7xNjdR_YqdFUNwemlfjf-AizF9RO6zBrQUsqDBf9KAMUO_7N9JinWHm_CZ-zBlgBaNm7PGsotZ98bAOHxddQwmFcrjKKRLpMjC4qJH3YRXYH9QqdeTuhUQAxY4H0gI'),
('eb8561ba-c695-4622-932c-7fb94c04a022', '5f4efb32-b49a-4b10-bd29-47f3498f70c3', NULL, 'Encrypted evidence', NULL, 'confidential', NULL, '2026-10-23 00:53:34', '2026-10-23 00:53:34', 'v1.JKLx95GCuwKjnQ7T.3jJ_WDl51gRmTSdsisXXWA.TI_nHPBOLcG7Sar1qWvsrDobgtoqm-OLzZ211c8Z748ahjMtAkS8FVTBgxWNzcLfIcLxb0w3tFT88fFCTpz5kIMmtoPL3BvW');

-- --------------------------------------------------------

--
-- Table structure for table `evidence_access_events`
--

CREATE TABLE `evidence_access_events` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `caseId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `caseNumber` varchar(64) DEFAULT NULL,
  `documentId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `documentName` varchar(255) NOT NULL,
  `documentType` enum('case_evidence','task_upload') NOT NULL,
  `taskId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `taskTitle` varchar(180) DEFAULT NULL,
  `actorUserId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `accessType` enum('view','download') NOT NULL,
  `ipAddress` varchar(45) DEFAULT NULL,
  `userAgent` varchar(512) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `evidence_chain_of_custody`
--

CREATE TABLE `evidence_chain_of_custody` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `evidenceFileId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `actorUserId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `action` enum('uploaded','viewed','downloaded','copied','modified','transferred','deleted') NOT NULL,
  `fromLocation` varchar(180) DEFAULT NULL,
  `toLocation` varchar(180) DEFAULT NULL,
  `checksum` char(64) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `encryptedDetails` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `evidence_chain_of_custody`
--

INSERT INTO `evidence_chain_of_custody` (`id`, `evidenceFileId`, `actorUserId`, `action`, `fromLocation`, `toLocation`, `checksum`, `notes`, `createdAt`, `updatedAt`, `encryptedDetails`) VALUES
('68a7b8a0-de03-43c4-b870-78d51fd0ea5d', '0e679617-8900-4612-af06-7298606280dd', NULL, 'uploaded', NULL, NULL, '338d909de65b4b0e320032ed4621a7e96209903a50b490a72f78ec9136fa718b', NULL, '2026-10-23 00:53:34', '2026-10-23 00:53:34', 'v1.suq1xeFN_XfULrwx.pgVo4UOJ8cWDwywmnqvT0w.A0v4lw88QyOU3HoYQx_S-NBxsAdH9L31WmFOJig8D6wV6JMxMngRaj0vlcL6NYJEyk65zrpH'),
('76397668-c471-46ed-912c-e4318a4d794c', 'a1311bea-5436-4aa0-981e-439565901c51', NULL, 'uploaded', NULL, NULL, 'c95df71b5d57ca26bf0d864372ed7ae4a9eaacbbddc32e5a574b3adc21169543', NULL, '2026-10-23 00:53:34', '2026-10-23 00:53:34', 'v1.-KMqY_4fcQnaJVUB.ZDI8ZhSi2Mo4rO29qkQT8w.uKkH-pn-wJR4pOnlPbAvPH9HXFxhVfyvnjnnDr1v2pdy3DdWBJvd1JsdOzaIKNIVbghSk3G2'),
('ab59966f-6e6b-4edc-aa6c-7b246ecd6e2e', '6b44777c-a2aa-4de1-af02-ec01b83c6ce4', NULL, 'uploaded', NULL, NULL, 'dbf9416d55c1a3cfb09f9e53b4781f8d680ef92c880ab36882c25700d8ab2312', NULL, '2026-10-23 00:53:34', '2026-10-23 00:53:34', 'v1.zEEbsb5pZDLtdW-p.jxsVjh0EOikzSGivl9kodw.7yW7bI5CpBIdxMOR1UvM81vXgL37u6Du12zwbC2YPMbJncZFPfBYYECHxJKRPrFHc6n9eCml'),
('cb4ce356-d98e-4c0e-9476-78fd07fb39a4', '3b3d3783-cbc7-41fc-9df4-2a049401dda8', NULL, 'uploaded', NULL, NULL, '03f23ab8ad65b747f3f9739eaf11ed5c9cf4772dd130d02796aea370d7666eba', NULL, '2026-10-23 00:53:34', '2026-10-23 00:53:34', 'v1.XEkXRuMgkNSTYIre.52-d2FyO5StcHSJOK2qr1g.dFE0XWiD2jEqkf2IKD2uJFAVw7VW4LnjVZx5Qv9sJ2wUpzdIxrKeMz_k1unz2kRZUI3vz5T_');

-- --------------------------------------------------------

--
-- Table structure for table `evidence_files`
--

CREATE TABLE `evidence_files` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `evidenceId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `originalName` varchar(255) NOT NULL,
  `mimeType` varchar(127) NOT NULL,
  `byteSize` int(11) NOT NULL,
  `checksum` char(64) NOT NULL,
  `encryptedPath` text NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `encryptedOriginalName` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `evidence_files`
--

INSERT INTO `evidence_files` (`id`, `evidenceId`, `originalName`, `mimeType`, `byteSize`, `checksum`, `encryptedPath`, `createdAt`, `updatedAt`, `encryptedOriginalName`) VALUES
('0e679617-8900-4612-af06-7298606280dd', '4820a23f-1b6e-4411-bb54-8be9abc607a1', 'encrypted-evidence', 'application/pdf', 1002, '338d909de65b4b0e320032ed4621a7e96209903a50b490a72f78ec9136fa718b', 'C:\\Users\\Thoko\\Desktop\\site_updated\\api\\data\\evidence\\e82904ef-6674-4ceb-80ba-60cce75bd3e6.bin', '2026-10-23 00:53:34', '2026-10-23 00:53:34', 'v1.Zfupx4dIjUSv-IZP.bXfPXvr0Ic9OZsySqy1dbA.4d7onFJS0EXPMT6dxSag_UFh1Dt_kKEv9NWrAQosuZGpInVBEAqLy8Oo3LWQdGJigIlJzGurM5XP'),
('3b3d3783-cbc7-41fc-9df4-2a049401dda8', 'eb8561ba-c695-4622-932c-7fb94c04a022', 'encrypted-evidence', 'application/pdf', 970, '03f23ab8ad65b747f3f9739eaf11ed5c9cf4772dd130d02796aea370d7666eba', 'C:\\Users\\Thoko\\Desktop\\site_updated\\api\\data\\evidence\\226cdbe1-b9f6-4e61-9eee-35d55b9b173a.bin', '2026-10-23 00:53:34', '2026-10-23 00:53:34', 'v1.oVPiVZfyZqPBNmAd.Lj6ly0KQhQQdLwJyPWjNoQ.rDPVqvVsg8g4afVWsOnq7g0wxOOQh-vO6LJO9eEdsa5TVdR8vaIMrspUtQ'),
('6b44777c-a2aa-4de1-af02-ec01b83c6ce4', 'bb878071-dee5-45fc-946a-c43fd95266a1', 'encrypted-evidence', 'application/pdf', 1501, 'dbf9416d55c1a3cfb09f9e53b4781f8d680ef92c880ab36882c25700d8ab2312', 'C:\\Users\\Thoko\\Desktop\\site_updated\\api\\data\\evidence\\b6187895-beca-4bdc-8477-1e53af6d9203.bin', '2026-10-23 00:53:34', '2026-10-23 00:53:34', 'v1.OzTSALwTSrHmfB5q.qsHsZWs9FUMefgYUCWlL0w.-WcoWXdSIwTYRyl5JDdu7DYpnTlbC51sOeC0036N31vDc_g7-v8s8dhztRP344NTXjjlHUAAInC4RiQ_MbS6it5PL4KHZSIQF2I8wmLRFNUxVA'),
('a1311bea-5436-4aa0-981e-439565901c51', 'a63414fb-9e8f-4141-8720-3413dc5924b7', 'encrypted-evidence', 'application/pdf', 1545, 'c95df71b5d57ca26bf0d864372ed7ae4a9eaacbbddc32e5a574b3adc21169543', 'C:\\Users\\Thoko\\Desktop\\site_updated\\api\\data\\evidence\\26b493cd-532a-4e67-b5f1-f87fd308abe6.bin', '2026-10-23 00:53:34', '2026-10-23 00:53:34', 'v1.ARMJdYWONVSFp0qJ.A8ZswS9e5cWyDWHqWyPBMw.Ay8UDphe2yhQI6Xeb2yp9dQHD-cq5JLzENizeFmXqc-ab_I656PLue4fsCcQ1ytst6ZXgvVheK3-pPv5KCcYgSg4dl5Icyz3feD0B4Ksw_paug');

-- --------------------------------------------------------

--
-- Table structure for table `follow_up_tokens`
--

CREATE TABLE `follow_up_tokens` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `caseId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `tokenHash` char(64) NOT NULL,
  `expiresAt` datetime DEFAULT NULL,
  `revokedAt` datetime DEFAULT NULL,
  `lastUsedAt` datetime DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `investigations`
--

CREATE TABLE `investigations` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `caseId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `leadUserId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `scope` text DEFAULT NULL,
  `methodology` text DEFAULT NULL,
  `startedAt` datetime DEFAULT NULL,
  `completedAt` datetime DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `reference` varchar(40) DEFAULT NULL,
  `status` enum('not_started','in_progress','on_hold','under_review','completed','cancelled') NOT NULL DEFAULT 'not_started',
  `reviewStatus` enum('not_submitted','pending','approved','changes_requested','rejected') NOT NULL DEFAULT 'not_submitted',
  `closureOutcome` enum('substantiated','unsubstantiated','partially_substantiated','inconclusive','no_finding','cancelled') DEFAULT NULL,
  `encryptedClosureReason` longtext DEFAULT NULL,
  `encryptedScope` longtext DEFAULT NULL,
  `encryptedMethodology` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `investigation_actions`
--

CREATE TABLE `investigation_actions` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `investigationId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `createdByUserId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `assignedToUserId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `accountableAssigneeUserId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `taskType` varchar(40) NOT NULL DEFAULT 'general',
  `requiresReview` tinyint(1) NOT NULL DEFAULT 0,
  `encryptedCompletionCriteria` longtext DEFAULT NULL,
  `encryptedSubmissionNote` longtext DEFAULT NULL,
  `title` varchar(180) NOT NULL,
  `encryptedDescription` text DEFAULT NULL,
  `status` enum('open','in_progress','submitted_for_review','completed','cancelled') NOT NULL DEFAULT 'open',
  `dueAt` datetime DEFAULT NULL,
  `submittedAt` datetime DEFAULT NULL,
  `completedAt` datetime DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `encryptedTitle` text DEFAULT NULL,
  `taskFindings` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `investigation_action_assignees`
--

CREATE TABLE `investigation_action_assignees` (
  `actionId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `userId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `assignedByUserId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `investigation_action_comments`
--

CREATE TABLE `investigation_action_comments` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `actionId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `authorUserId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `encryptedBody` longtext NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `investigation_action_dependencies`
--

CREATE TABLE `investigation_action_dependencies` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `actionId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `dependsOnActionId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `investigation_action_evidence_files`
--

CREATE TABLE `investigation_action_evidence_files` (
  `actionId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `evidenceFileId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `attachedByUserId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `investigation_action_files`
--

CREATE TABLE `investigation_action_files` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `actionId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `uploadedByUserId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `encryptedOriginalName` text NOT NULL,
  `mimeType` varchar(127) NOT NULL,
  `byteSize` int(11) NOT NULL,
  `checksum` char(64) NOT NULL,
  `encryptedPath` text NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `investigation_action_reviews`
--

CREATE TABLE `investigation_action_reviews` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `actionId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `reviewerUserId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `decision` enum('approved','returned') NOT NULL,
  `encryptedFeedback` longtext NOT NULL,
  `submittedAt` datetime NOT NULL,
  `decidedAt` datetime NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `investigation_events`
--

CREATE TABLE `investigation_events` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `investigationId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `actorUserId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `eventType` varchar(80) NOT NULL,
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`metadata`)),
  `encryptedDetails` longtext DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `investigation_findings`
--

CREATE TABLE `investigation_findings` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `investigationId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `authorUserId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `findingType` enum('substantiated','unsubstantiated','inconclusive','partially_substantiated') NOT NULL,
  `encryptedConclusion` text NOT NULL,
  `recommendation` text DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `reviewStatus` enum('not_submitted','pending','approved','changes_requested','rejected') NOT NULL DEFAULT 'not_submitted',
  `encryptedRecommendation` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `investigation_finding_evidence`
--

CREATE TABLE `investigation_finding_evidence` (
  `findingId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `evidenceId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `investigation_finding_reviews`
--

CREATE TABLE `investigation_finding_reviews` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `findingId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `reviewerUserId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `decision` enum('approved','changes_requested','rejected') DEFAULT NULL,
  `encryptedComments` longtext DEFAULT NULL,
  `submittedAt` datetime NOT NULL,
  `decidedAt` datetime DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `investigation_reviews`
--

CREATE TABLE `investigation_reviews` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `investigationId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `reviewerUserId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `decision` enum('approved','changes_requested','rejected') DEFAULT NULL,
  `encryptedComments` longtext DEFAULT NULL,
  `submittedAt` datetime NOT NULL,
  `decidedAt` datetime DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `login_attempts`
--

CREATE TABLE `login_attempts` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `email` varchar(254) NOT NULL,
  `successful` tinyint(1) NOT NULL,
  `ipAddress` varchar(45) DEFAULT NULL,
  `userAgent` varchar(512) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `login_attempts`
--

INSERT INTO `login_attempts` (`id`, `email`, `successful`, `ipAddress`, `userAgent`, `createdAt`, `updatedAt`) VALUES
('035f2cda-52cf-4af2-9771-c879e5e7bc47', 'admin@whistleblower.mw', 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36 Edg/155.0.0.0', '2026-10-23 00:38:43', '2026-10-23 00:38:43'),
('e010482c-d281-4d47-b1a2-ac640b9a3a3b', 'admin@whistleblower.mw', 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-23 00:43:23', '2026-10-23 00:43:23');

-- --------------------------------------------------------

--
-- Table structure for table `login_challenges`
--

CREATE TABLE `login_challenges` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `userId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `tokenHash` char(64) NOT NULL,
  `codeHash` varchar(255) NOT NULL,
  `expiresAt` datetime NOT NULL,
  `consumedAt` datetime DEFAULT NULL,
  `attempts` int(11) NOT NULL DEFAULT 0,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `message_attachments`
--

CREATE TABLE `message_attachments` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `messageId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `originalName` varchar(255) NOT NULL,
  `mimeType` varchar(127) NOT NULL,
  `byteSize` int(11) NOT NULL,
  `checksum` char(64) NOT NULL,
  `encryptedPath` text NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `caseId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `recipientUserId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `type` varchar(80) NOT NULL,
  `encryptedPayload` text DEFAULT NULL,
  `readAt` datetime DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `caseId`, `recipientUserId`, `type`, `encryptedPayload`, `readAt`, `createdAt`, `updatedAt`) VALUES
('693dda48-ffb3-40a1-9299-120270ead57e', '5f4efb32-b49a-4b10-bd29-47f3498f70c3', '302c5e50-9c9b-4b6b-90a8-92be0c448805', 'case', 'v1.tziWpgXpudMQzaqF.o1rWqUKrbeB3Io-Q8Q-2QA.n1XP8f7RU7c8GCf_3VoHyE3AJnOncTI3NpQoma-jm_JxQNHU8iunUcuL31_KGvrVnnTqZS5p8mTZCOmmQJY2T_elRuA01X4aYIvIu3lYPDjTlsXcgz4BeNOqXyce8CN-FnbwfUmgtphALwCFgqqnHyxKd9vdzpV9mwdl7QbQHLNUM_QeTDOEL1Wsf8M9AmujRbUKGA843xmIRo3D2IjrAqDI1jmY3g_x3yu1NR9t3LwyufwiOZSt8gg0jjNaEInF9i5HdcI_HZZYhOtCQIqPimnIjQ55dBtvGcsVtbyf-R1q3ALGTtO5TB-5', NULL, '2026-10-23 00:53:34', '2026-10-23 00:53:34');

-- --------------------------------------------------------

--
-- Table structure for table `notification_archives`
--

CREATE TABLE `notification_archives` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `notificationId` varchar(180) NOT NULL,
  `userId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notification_events`
--

CREATE TABLE `notification_events` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `notificationId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `channel` enum('email','sms','push','webhook') NOT NULL,
  `status` enum('queued','sent','failed') NOT NULL,
  `providerReference` varchar(180) DEFAULT NULL,
  `sentAt` datetime DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `organizations`
--

CREATE TABLE `organizations` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(180) NOT NULL,
  `contactName` varchar(120) DEFAULT NULL,
  `contactEmail` varchar(254) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`metadata`)),
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `organizations`
--

INSERT INTO `organizations` (`id`, `name`, `contactName`, `contactEmail`, `active`, `metadata`, `createdAt`, `updatedAt`) VALUES
('6672665b-269c-4db7-b5b7-c4ace655d80d', 'malawi revenue authority', 'wongani', 'wongani@gmail.com', 1, '{\"portalSlug\":\"\",\"industrySector\":\"\",\"retentionRule\":\"\"}', '2026-10-23 00:46:56', '2026-10-23 00:46:56');

-- --------------------------------------------------------

--
-- Table structure for table `organization_handlers`
--

CREATE TABLE `organization_handlers` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `organizationId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `userId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `handlerType` enum('primary','secondary') NOT NULL DEFAULT 'secondary',
  `canReceiveReports` tinyint(1) NOT NULL DEFAULT 1,
  `canReceiveAuditTrails` tinyint(1) NOT NULL DEFAULT 1,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `handlerName` varchar(120) DEFAULT NULL,
  `email` varchar(254) DEFAULT NULL,
  `pinHash` varchar(255) DEFAULT NULL,
  `pinSetAt` datetime DEFAULT NULL,
  `setupTokenHash` char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `setupExpiresAt` datetime DEFAULT NULL,
  `documentPasswordEncrypted` text DEFAULT NULL,
  `reportKeyEncrypted` text DEFAULT NULL,
  `reportPinKeyEnvelope` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `organization_handlers`
--

INSERT INTO `organization_handlers` (`id`, `organizationId`, `userId`, `handlerType`, `canReceiveReports`, `canReceiveAuditTrails`, `active`, `createdAt`, `updatedAt`, `handlerName`, `email`, `pinHash`, `pinSetAt`, `setupTokenHash`, `setupExpiresAt`, `documentPasswordEncrypted`, `reportKeyEncrypted`, `reportPinKeyEnvelope`) VALUES
('a19742f5-9347-4955-9c94-6bd080bd016b', '6672665b-269c-4db7-b5b7-c4ace655d80d', NULL, 'primary', 1, 1, 1, '2026-10-23 00:46:56', '2026-10-23 00:46:56', 'wongani', 'wongani@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(120) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `description`, `createdAt`, `updatedAt`) VALUES
('15d19ba4-b2cf-409e-b8c7-545dda7525ee', 'settings.manage', 'settings.manage', '2026-09-21 05:36:16', '2026-09-21 05:36:16'),
('1608e84b-bc9e-4429-95fc-737ea7aef967', 'security.manage', 'security.manage', '2026-09-21 05:36:16', '2026-09-21 05:36:16'),
('21185daa-99a2-43d6-8719-692bb0923d99', 'case.update', 'case.update', '2026-09-21 05:36:16', '2026-09-21 05:36:16'),
('359c6148-c9f5-42e1-934c-89d06d430c28', 'investigation.findings', 'investigation.findings', '2026-09-21 05:36:16', '2026-09-21 05:36:16'),
('38e23d7f-aa0a-4a9c-a23f-c0ce18bd989f', 'case.create', 'case.create', '2026-09-21 05:36:16', '2026-09-21 05:36:16'),
('3f85c9e8-13a2-462d-b9d4-0389d47bccf4', 'evidence.manage', 'evidence.manage', '2026-09-21 05:36:16', '2026-09-21 05:36:16'),
('4118c990-749b-4da4-8768-0dd04b7cf74b', 'communication.manage', 'communication.manage', '2026-09-21 05:36:16', '2026-09-21 05:36:16'),
('45988705-120d-4980-88d1-cc3389f82f42', 'privacy.manage', 'privacy.manage', '2026-09-21 05:36:16', '2026-09-21 05:36:16'),
('479fa466-5640-431b-be2f-6d22e8022b59', 'organization.manage', 'Create and update organizations and handler assignments', '2026-10-08 07:53:56', '2026-10-08 07:53:56'),
('6834d7e1-c407-45e4-b72b-be90915a448e', 'case.close', 'case.close', '2026-09-21 05:36:16', '2026-09-21 05:36:16'),
('7a763a6b-c278-464f-9553-f55854b74aaf', 'task.work', 'Work on assigned investigation tasks', '2026-10-14 07:20:05', '2026-10-14 07:20:05'),
('86455e0a-0bd8-4f59-9966-07e56ac8c5a3', 'investigation.manage', 'investigation.manage', '2026-09-21 05:36:16', '2026-09-21 05:36:16'),
('8733c667-f489-4fc4-b246-9357e94b0154', 'communication.notify', 'communication.notify', '2026-09-21 05:36:16', '2026-09-21 05:36:16'),
('947cc1b1-9705-4268-941d-bde266c3f3d8', 'role.manage', 'role.manage', '2026-09-21 05:36:16', '2026-09-21 05:36:16'),
('99e41976-a2e8-4170-8ac8-6b62224e39e7', 'legal.review', 'legal.review', '2026-09-21 05:36:16', '2026-09-21 05:36:16'),
('a3f3a11a-2286-46f5-818d-e9e7a499a47b', 'case.assign', 'case.assign', '2026-09-21 05:36:16', '2026-09-21 05:36:16'),
('a6f35da1-f445-4708-8d13-9b725a679fc0', 'user.manage', 'user.manage', '2026-09-21 05:36:16', '2026-09-21 05:36:16'),
('b52ee63b-31ba-486d-9068-3fe1ba080075', 'case.reopen', 'case.reopen', '2026-09-21 05:36:16', '2026-09-21 05:36:16'),
('e8b3e1da-9bc7-4186-b820-3b82d8ab00e2', 'case.read', 'case.read', '2026-09-21 05:36:16', '2026-09-21 05:36:16'),
('ec812df6-ea4b-4aa2-ad92-3328048cd56d', 'audit.read', 'audit.read', '2026-09-21 05:36:16', '2026-09-21 05:36:16'),
('f5f80de5-e628-4473-8f7d-738655263383', 'evidence.read', 'evidence.read', '2026-09-21 05:36:16', '2026-09-21 05:36:16'),
('f63a7abd-d73e-4525-97ad-45b9296cb466', 'case.export', 'case.export', '2026-09-21 05:36:16', '2026-09-21 05:36:16');

-- --------------------------------------------------------

--
-- Table structure for table `reporters`
--

CREATE TABLE `reporters` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `caseId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `encryptedIdentity` text DEFAULT NULL,
  `anonymous` tinyint(1) NOT NULL DEFAULT 1,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reporters`
--

INSERT INTO `reporters` (`id`, `caseId`, `encryptedIdentity`, `anonymous`, `createdAt`, `updatedAt`) VALUES
('9f82652e-451e-4de6-9463-fbc68df8ea4f', '5f4efb32-b49a-4b10-bd29-47f3498f70c3', 'v1.yT37fIq79p1wS4cg.MiOAYRjMTvK7gn1aCBt4sw.hTkJEKBNpXpxD3FM9h-OuTGMYX1bnQly-c-fA8EOxXwsgrdKP2ZC0gJQSQB2KcI1HHc', 1, '2026-10-23 00:53:34', '2026-10-23 00:53:34');

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `caseId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `templateId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `generatedByUserId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `title` varchar(180) NOT NULL,
  `status` varchar(30) NOT NULL DEFAULT 'completed',
  `summary` text DEFAULT NULL,
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`metadata`)),
  `generatedAt` datetime DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `encryptedTitle` text DEFAULT NULL,
  `encryptedSummary` text DEFAULT NULL,
  `encryptedMetadata` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `report_audit_events`
--

CREATE TABLE `report_audit_events` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `reportId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `actorUserId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `action` varchar(80) NOT NULL,
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`metadata`)),
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `report_files`
--

CREATE TABLE `report_files` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `reportId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `fileName` varchar(180) NOT NULL,
  `filePath` text NOT NULL,
  `mimeType` varchar(120) NOT NULL DEFAULT 'application/pdf',
  `checksum` char(64) DEFAULT NULL,
  `fileSizeBytes` int(11) NOT NULL DEFAULT 0,
  `downloadCount` int(11) NOT NULL DEFAULT 0,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `encryptedFileName` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `report_templates`
--

CREATE TABLE `report_templates` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `code` varchar(60) NOT NULL,
  `name` varchar(180) NOT NULL,
  `description` text DEFAULT NULL,
  `format` varchar(40) NOT NULL DEFAULT 'PDF',
  `version` varchar(30) NOT NULL DEFAULT '1.0',
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`metadata`)),
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reward_participations`
--

CREATE TABLE `reward_participations` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `caseId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `participates` tinyint(1) NOT NULL DEFAULT 0,
  `encryptedDetails` text DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reward_participations`
--

INSERT INTO `reward_participations` (`id`, `caseId`, `participates`, `encryptedDetails`, `createdAt`, `updatedAt`) VALUES
('174e6288-2290-412e-878b-ecc60d7307e1', '5f4efb32-b49a-4b10-bd29-47f3498f70c3', 0, NULL, '2026-10-23 00:53:34', '2026-10-23 00:53:34');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(80) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `description`, `createdAt`, `updatedAt`) VALUES
('09af445f-8645-43ce-95fb-e78e8335191e', 'reviewer', 'Independent case review and quality control', '2026-09-21 11:38:35', '2026-09-21 11:38:35'),
('0c1a481b-eb02-43e3-8a7c-72e383b2d00d', 'task_contributor', 'Complete assigned tasks without case or investigation access', '2026-10-14 07:20:06', '2026-10-14 07:20:06'),
('1ecb045d-1d74-40a5-b78b-238c4fb6e2d6', 'ethics_officer', 'Oversight of whistleblowing decisions and outcomes', '2026-09-21 11:38:35', '2026-09-21 11:38:35'),
('240148db-00f6-40a9-8dab-d21120c68705', 'intake_officer', 'Receive, validate, classify, and acknowledge new cases', '2026-09-21 11:38:34', '2026-09-21 11:38:34'),
('3037b809-8fe6-4fb3-a3fc-6f5b4a0120ef', 'system_administrator', 'Technical administration, users, roles, and settings', '2026-09-21 11:38:34', '2026-09-21 11:38:34'),
('41b3ec60-0f25-4254-ba26-91bc1b7db483', 'legal_advisor', 'Legal privilege, regulatory, and litigation review', '2026-09-21 11:38:35', '2026-09-21 11:38:35'),
('941e2fee-9dfd-4a90-852c-ed0046e6a553', 'investigator', 'Conduct investigations, manage evidence, and record actions', '2026-09-21 11:38:35', '2026-09-21 11:38:35'),
('a9a17f12-89c4-496e-b62d-f5fb9faebd62', 'compliance_officer', 'Compliance monitoring, reporting, and retention oversight', '2026-09-21 11:38:35', '2026-09-21 11:38:35'),
('b3bdc891-99ba-471c-a143-41d2ed1de082', 'auditor', 'Read-only audit and compliance access', '2026-09-21 11:38:35', '2026-09-21 11:38:35'),
('bba3f3f5-6482-4ce0-8cd7-32e49ea858fb', 'system_owner', 'Full platform ownership and emergency administration', '2026-09-21 05:27:08', '2026-09-21 05:27:08'),
('c6af015b-2e54-4f8d-898a-a41b3986ddf5', 'data_protection_officer', 'Protected identity, privacy, retention, and access oversight', '2026-09-21 11:38:35', '2026-09-21 11:38:35'),
('cbe4f906-78d0-47b2-a46a-6b03d0d8571f', 'case_manager', 'Manage case workflow, assignments, and communication', '2026-09-21 11:38:34', '2026-09-21 11:38:34'),
('eefb2408-974f-48d9-977d-bcb73dc14d32', 'senior_investigator', 'Lead complex investigations and approve findings', '2026-09-21 11:38:35', '2026-09-21 11:38:35');

-- --------------------------------------------------------

--
-- Table structure for table `role_permissions`
--

CREATE TABLE `role_permissions` (
  `roleId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `permissionId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `role_permissions`
--

INSERT INTO `role_permissions` (`roleId`, `permissionId`, `createdAt`, `updatedAt`) VALUES
('09af445f-8645-43ce-95fb-e78e8335191e', '21185daa-99a2-43d6-8719-692bb0923d99', '2026-09-21 11:38:35', '2026-09-21 11:38:35'),
('09af445f-8645-43ce-95fb-e78e8335191e', '359c6148-c9f5-42e1-934c-89d06d430c28', '2026-09-21 11:38:35', '2026-09-21 11:38:35'),
('09af445f-8645-43ce-95fb-e78e8335191e', '4118c990-749b-4da4-8768-0dd04b7cf74b', '2026-09-21 11:38:35', '2026-09-21 11:38:35'),
('09af445f-8645-43ce-95fb-e78e8335191e', 'e8b3e1da-9bc7-4186-b820-3b82d8ab00e2', '2026-09-21 11:38:35', '2026-09-21 11:38:35'),
('09af445f-8645-43ce-95fb-e78e8335191e', 'f5f80de5-e628-4473-8f7d-738655263383', '2026-09-21 11:38:35', '2026-09-21 11:38:35'),
('0c1a481b-eb02-43e3-8a7c-72e383b2d00d', '7a763a6b-c278-464f-9553-f55854b74aaf', '2026-10-14 07:20:06', '2026-10-14 07:20:06'),
('1ecb045d-1d74-40a5-b78b-238c4fb6e2d6', '21185daa-99a2-43d6-8719-692bb0923d99', '2026-09-21 11:38:35', '2026-09-21 11:38:35'),
('1ecb045d-1d74-40a5-b78b-238c4fb6e2d6', '359c6148-c9f5-42e1-934c-89d06d430c28', '2026-09-21 11:38:35', '2026-09-21 11:38:35'),
('1ecb045d-1d74-40a5-b78b-238c4fb6e2d6', '4118c990-749b-4da4-8768-0dd04b7cf74b', '2026-09-21 11:38:35', '2026-09-21 11:38:35'),
('1ecb045d-1d74-40a5-b78b-238c4fb6e2d6', 'a3f3a11a-2286-46f5-818d-e9e7a499a47b', '2026-09-21 11:38:35', '2026-09-21 11:38:35'),
('1ecb045d-1d74-40a5-b78b-238c4fb6e2d6', 'b52ee63b-31ba-486d-9068-3fe1ba080075', '2026-09-21 11:38:35', '2026-09-21 11:38:35'),
('1ecb045d-1d74-40a5-b78b-238c4fb6e2d6', 'e8b3e1da-9bc7-4186-b820-3b82d8ab00e2', '2026-09-21 11:38:35', '2026-09-21 11:38:35'),
('1ecb045d-1d74-40a5-b78b-238c4fb6e2d6', 'f5f80de5-e628-4473-8f7d-738655263383', '2026-09-21 11:38:35', '2026-09-21 11:38:35'),
('1ecb045d-1d74-40a5-b78b-238c4fb6e2d6', 'f63a7abd-d73e-4525-97ad-45b9296cb466', '2026-09-21 11:38:35', '2026-09-21 11:38:35'),
('240148db-00f6-40a9-8dab-d21120c68705', '21185daa-99a2-43d6-8719-692bb0923d99', '2026-09-21 11:38:34', '2026-09-21 11:38:34'),
('240148db-00f6-40a9-8dab-d21120c68705', '4118c990-749b-4da4-8768-0dd04b7cf74b', '2026-09-21 11:38:34', '2026-09-21 11:38:34'),
('240148db-00f6-40a9-8dab-d21120c68705', '8733c667-f489-4fc4-b246-9357e94b0154', '2026-09-21 11:38:34', '2026-09-21 11:38:34'),
('240148db-00f6-40a9-8dab-d21120c68705', 'e8b3e1da-9bc7-4186-b820-3b82d8ab00e2', '2026-09-21 11:38:34', '2026-09-21 11:38:34'),
('3037b809-8fe6-4fb3-a3fc-6f5b4a0120ef', '15d19ba4-b2cf-409e-b8c7-545dda7525ee', '2026-09-21 11:38:34', '2026-09-21 11:38:34'),
('3037b809-8fe6-4fb3-a3fc-6f5b4a0120ef', '1608e84b-bc9e-4429-95fc-737ea7aef967', '2026-09-21 11:38:34', '2026-09-21 11:38:34'),
('3037b809-8fe6-4fb3-a3fc-6f5b4a0120ef', '38e23d7f-aa0a-4a9c-a23f-c0ce18bd989f', '2026-10-14 07:20:05', '2026-10-14 07:20:05'),
('3037b809-8fe6-4fb3-a3fc-6f5b4a0120ef', '479fa466-5640-431b-be2f-6d22e8022b59', '2026-10-08 07:53:57', '2026-10-08 07:53:57'),
('3037b809-8fe6-4fb3-a3fc-6f5b4a0120ef', '6834d7e1-c407-45e4-b72b-be90915a448e', '2026-10-12 10:47:37', '2026-10-12 10:47:37'),
('3037b809-8fe6-4fb3-a3fc-6f5b4a0120ef', '947cc1b1-9705-4268-941d-bde266c3f3d8', '2026-09-21 11:38:34', '2026-09-21 11:38:34'),
('3037b809-8fe6-4fb3-a3fc-6f5b4a0120ef', 'a6f35da1-f445-4708-8d13-9b725a679fc0', '2026-09-21 11:38:34', '2026-09-21 11:38:34'),
('3037b809-8fe6-4fb3-a3fc-6f5b4a0120ef', 'e8b3e1da-9bc7-4186-b820-3b82d8ab00e2', '2026-09-21 11:38:34', '2026-09-21 11:38:34'),
('3037b809-8fe6-4fb3-a3fc-6f5b4a0120ef', 'ec812df6-ea4b-4aa2-ad92-3328048cd56d', '2026-09-21 11:38:34', '2026-09-21 11:38:34'),
('41b3ec60-0f25-4254-ba26-91bc1b7db483', '4118c990-749b-4da4-8768-0dd04b7cf74b', '2026-09-21 11:38:35', '2026-09-21 11:38:35'),
('41b3ec60-0f25-4254-ba26-91bc1b7db483', '99e41976-a2e8-4170-8ac8-6b62224e39e7', '2026-09-21 11:38:35', '2026-09-21 11:38:35'),
('41b3ec60-0f25-4254-ba26-91bc1b7db483', 'e8b3e1da-9bc7-4186-b820-3b82d8ab00e2', '2026-09-21 11:38:35', '2026-09-21 11:38:35'),
('41b3ec60-0f25-4254-ba26-91bc1b7db483', 'f5f80de5-e628-4473-8f7d-738655263383', '2026-09-21 11:38:35', '2026-09-21 11:38:35'),
('41b3ec60-0f25-4254-ba26-91bc1b7db483', 'f63a7abd-d73e-4525-97ad-45b9296cb466', '2026-09-21 11:38:35', '2026-09-21 11:38:35'),
('941e2fee-9dfd-4a90-852c-ed0046e6a553', '359c6148-c9f5-42e1-934c-89d06d430c28', '2026-09-21 11:38:35', '2026-09-21 11:38:35'),
('941e2fee-9dfd-4a90-852c-ed0046e6a553', '3f85c9e8-13a2-462d-b9d4-0389d47bccf4', '2026-09-21 11:38:35', '2026-09-21 11:38:35'),
('941e2fee-9dfd-4a90-852c-ed0046e6a553', '4118c990-749b-4da4-8768-0dd04b7cf74b', '2026-09-21 11:38:35', '2026-09-21 11:38:35'),
('941e2fee-9dfd-4a90-852c-ed0046e6a553', '86455e0a-0bd8-4f59-9966-07e56ac8c5a3', '2026-09-21 11:38:35', '2026-09-21 11:38:35'),
('941e2fee-9dfd-4a90-852c-ed0046e6a553', 'e8b3e1da-9bc7-4186-b820-3b82d8ab00e2', '2026-09-21 11:38:35', '2026-09-21 11:38:35'),
('941e2fee-9dfd-4a90-852c-ed0046e6a553', 'f5f80de5-e628-4473-8f7d-738655263383', '2026-09-21 11:38:35', '2026-09-21 11:38:35'),
('a9a17f12-89c4-496e-b62d-f5fb9faebd62', '45988705-120d-4980-88d1-cc3389f82f42', '2026-09-21 11:38:35', '2026-09-21 11:38:35'),
('a9a17f12-89c4-496e-b62d-f5fb9faebd62', '8733c667-f489-4fc4-b246-9357e94b0154', '2026-09-21 11:38:35', '2026-09-21 11:38:35'),
('a9a17f12-89c4-496e-b62d-f5fb9faebd62', 'e8b3e1da-9bc7-4186-b820-3b82d8ab00e2', '2026-09-21 11:38:35', '2026-09-21 11:38:35'),
('a9a17f12-89c4-496e-b62d-f5fb9faebd62', 'ec812df6-ea4b-4aa2-ad92-3328048cd56d', '2026-09-21 11:38:35', '2026-09-21 11:38:35'),
('a9a17f12-89c4-496e-b62d-f5fb9faebd62', 'f63a7abd-d73e-4525-97ad-45b9296cb466', '2026-09-21 11:38:35', '2026-09-21 11:38:35'),
('b3bdc891-99ba-471c-a143-41d2ed1de082', 'e8b3e1da-9bc7-4186-b820-3b82d8ab00e2', '2026-09-21 11:38:35', '2026-09-21 11:38:35'),
('b3bdc891-99ba-471c-a143-41d2ed1de082', 'ec812df6-ea4b-4aa2-ad92-3328048cd56d', '2026-09-21 11:38:35', '2026-09-21 11:38:35'),
('b3bdc891-99ba-471c-a143-41d2ed1de082', 'f5f80de5-e628-4473-8f7d-738655263383', '2026-09-21 11:38:35', '2026-09-21 11:38:35'),
('bba3f3f5-6482-4ce0-8cd7-32e49ea858fb', '15d19ba4-b2cf-409e-b8c7-545dda7525ee', '2026-09-21 05:36:16', '2026-09-21 05:36:16'),
('bba3f3f5-6482-4ce0-8cd7-32e49ea858fb', '1608e84b-bc9e-4429-95fc-737ea7aef967', '2026-09-21 05:36:16', '2026-09-21 05:36:16'),
('bba3f3f5-6482-4ce0-8cd7-32e49ea858fb', '21185daa-99a2-43d6-8719-692bb0923d99', '2026-09-21 05:36:16', '2026-09-21 05:36:16'),
('bba3f3f5-6482-4ce0-8cd7-32e49ea858fb', '359c6148-c9f5-42e1-934c-89d06d430c28', '2026-09-21 05:36:16', '2026-09-21 05:36:16'),
('bba3f3f5-6482-4ce0-8cd7-32e49ea858fb', '38e23d7f-aa0a-4a9c-a23f-c0ce18bd989f', '2026-09-21 05:36:16', '2026-09-21 05:36:16'),
('bba3f3f5-6482-4ce0-8cd7-32e49ea858fb', '3f85c9e8-13a2-462d-b9d4-0389d47bccf4', '2026-09-21 05:36:16', '2026-09-21 05:36:16'),
('bba3f3f5-6482-4ce0-8cd7-32e49ea858fb', '4118c990-749b-4da4-8768-0dd04b7cf74b', '2026-09-21 05:36:16', '2026-09-21 05:36:16'),
('bba3f3f5-6482-4ce0-8cd7-32e49ea858fb', '45988705-120d-4980-88d1-cc3389f82f42', '2026-09-21 05:36:16', '2026-09-21 05:36:16'),
('bba3f3f5-6482-4ce0-8cd7-32e49ea858fb', '479fa466-5640-431b-be2f-6d22e8022b59', '2026-10-08 07:53:56', '2026-10-08 07:53:56'),
('bba3f3f5-6482-4ce0-8cd7-32e49ea858fb', '6834d7e1-c407-45e4-b72b-be90915a448e', '2026-09-21 05:36:16', '2026-09-21 05:36:16'),
('bba3f3f5-6482-4ce0-8cd7-32e49ea858fb', '7a763a6b-c278-464f-9553-f55854b74aaf', '2026-10-14 07:20:05', '2026-10-14 07:20:05'),
('bba3f3f5-6482-4ce0-8cd7-32e49ea858fb', '86455e0a-0bd8-4f59-9966-07e56ac8c5a3', '2026-09-21 05:36:16', '2026-09-21 05:36:16'),
('bba3f3f5-6482-4ce0-8cd7-32e49ea858fb', '8733c667-f489-4fc4-b246-9357e94b0154', '2026-09-21 05:36:16', '2026-09-21 05:36:16'),
('bba3f3f5-6482-4ce0-8cd7-32e49ea858fb', '947cc1b1-9705-4268-941d-bde266c3f3d8', '2026-09-21 05:36:16', '2026-09-21 05:36:16'),
('bba3f3f5-6482-4ce0-8cd7-32e49ea858fb', '99e41976-a2e8-4170-8ac8-6b62224e39e7', '2026-09-21 05:36:16', '2026-09-21 05:36:16'),
('bba3f3f5-6482-4ce0-8cd7-32e49ea858fb', 'a3f3a11a-2286-46f5-818d-e9e7a499a47b', '2026-09-21 05:36:16', '2026-09-21 05:36:16'),
('bba3f3f5-6482-4ce0-8cd7-32e49ea858fb', 'a6f35da1-f445-4708-8d13-9b725a679fc0', '2026-09-21 05:36:16', '2026-09-21 05:36:16'),
('bba3f3f5-6482-4ce0-8cd7-32e49ea858fb', 'b52ee63b-31ba-486d-9068-3fe1ba080075', '2026-09-21 05:36:16', '2026-09-21 05:36:16'),
('bba3f3f5-6482-4ce0-8cd7-32e49ea858fb', 'e8b3e1da-9bc7-4186-b820-3b82d8ab00e2', '2026-09-21 05:36:16', '2026-09-21 05:36:16'),
('bba3f3f5-6482-4ce0-8cd7-32e49ea858fb', 'ec812df6-ea4b-4aa2-ad92-3328048cd56d', '2026-09-21 05:36:16', '2026-09-21 05:36:16'),
('bba3f3f5-6482-4ce0-8cd7-32e49ea858fb', 'f5f80de5-e628-4473-8f7d-738655263383', '2026-09-21 05:36:16', '2026-09-21 05:36:16'),
('bba3f3f5-6482-4ce0-8cd7-32e49ea858fb', 'f63a7abd-d73e-4525-97ad-45b9296cb466', '2026-09-21 05:36:16', '2026-09-21 05:36:16'),
('c6af015b-2e54-4f8d-898a-a41b3986ddf5', '1608e84b-bc9e-4429-95fc-737ea7aef967', '2026-09-21 11:38:35', '2026-09-21 11:38:35'),
('c6af015b-2e54-4f8d-898a-a41b3986ddf5', '45988705-120d-4980-88d1-cc3389f82f42', '2026-09-21 11:38:35', '2026-09-21 11:38:35'),
('c6af015b-2e54-4f8d-898a-a41b3986ddf5', 'e8b3e1da-9bc7-4186-b820-3b82d8ab00e2', '2026-09-21 11:38:35', '2026-09-21 11:38:35'),
('c6af015b-2e54-4f8d-898a-a41b3986ddf5', 'ec812df6-ea4b-4aa2-ad92-3328048cd56d', '2026-09-21 11:38:35', '2026-09-21 11:38:35'),
('c6af015b-2e54-4f8d-898a-a41b3986ddf5', 'f63a7abd-d73e-4525-97ad-45b9296cb466', '2026-09-21 11:38:35', '2026-09-21 11:38:35'),
('cbe4f906-78d0-47b2-a46a-6b03d0d8571f', '21185daa-99a2-43d6-8719-692bb0923d99', '2026-09-21 11:38:35', '2026-09-21 11:38:35'),
('cbe4f906-78d0-47b2-a46a-6b03d0d8571f', '4118c990-749b-4da4-8768-0dd04b7cf74b', '2026-09-21 11:38:35', '2026-09-21 11:38:35'),
('cbe4f906-78d0-47b2-a46a-6b03d0d8571f', '8733c667-f489-4fc4-b246-9357e94b0154', '2026-09-21 11:38:35', '2026-09-21 11:38:35'),
('cbe4f906-78d0-47b2-a46a-6b03d0d8571f', 'a3f3a11a-2286-46f5-818d-e9e7a499a47b', '2026-09-21 11:38:35', '2026-09-21 11:38:35'),
('cbe4f906-78d0-47b2-a46a-6b03d0d8571f', 'b52ee63b-31ba-486d-9068-3fe1ba080075', '2026-09-21 11:38:35', '2026-09-21 11:38:35'),
('cbe4f906-78d0-47b2-a46a-6b03d0d8571f', 'e8b3e1da-9bc7-4186-b820-3b82d8ab00e2', '2026-09-21 11:38:34', '2026-09-21 11:38:34'),
('cbe4f906-78d0-47b2-a46a-6b03d0d8571f', 'f5f80de5-e628-4473-8f7d-738655263383', '2026-09-21 11:38:35', '2026-09-21 11:38:35'),
('eefb2408-974f-48d9-977d-bcb73dc14d32', '21185daa-99a2-43d6-8719-692bb0923d99', '2026-09-21 11:38:35', '2026-09-21 11:38:35'),
('eefb2408-974f-48d9-977d-bcb73dc14d32', '359c6148-c9f5-42e1-934c-89d06d430c28', '2026-09-21 11:38:35', '2026-09-21 11:38:35'),
('eefb2408-974f-48d9-977d-bcb73dc14d32', '38e23d7f-aa0a-4a9c-a23f-c0ce18bd989f', '2026-10-14 07:20:05', '2026-10-14 07:20:05'),
('eefb2408-974f-48d9-977d-bcb73dc14d32', '3f85c9e8-13a2-462d-b9d4-0389d47bccf4', '2026-09-21 11:38:35', '2026-09-21 11:38:35'),
('eefb2408-974f-48d9-977d-bcb73dc14d32', '4118c990-749b-4da4-8768-0dd04b7cf74b', '2026-09-21 11:38:35', '2026-09-21 11:38:35'),
('eefb2408-974f-48d9-977d-bcb73dc14d32', '86455e0a-0bd8-4f59-9966-07e56ac8c5a3', '2026-09-21 11:38:35', '2026-09-21 11:38:35'),
('eefb2408-974f-48d9-977d-bcb73dc14d32', 'a3f3a11a-2286-46f5-818d-e9e7a499a47b', '2026-09-21 11:38:35', '2026-09-21 11:38:35'),
('eefb2408-974f-48d9-977d-bcb73dc14d32', 'e8b3e1da-9bc7-4186-b820-3b82d8ab00e2', '2026-09-21 11:38:35', '2026-09-21 11:38:35'),
('eefb2408-974f-48d9-977d-bcb73dc14d32', 'f5f80de5-e628-4473-8f7d-738655263383', '2026-09-21 11:38:35', '2026-09-21 11:38:35'),
('eefb2408-974f-48d9-977d-bcb73dc14d32', 'f63a7abd-d73e-4525-97ad-45b9296cb466', '2026-09-21 11:38:35', '2026-09-21 11:38:35');

-- --------------------------------------------------------

--
-- Table structure for table `security_events`
--

CREATE TABLE `security_events` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `userId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `eventType` varchar(100) NOT NULL,
  `severity` enum('info','warning','critical') NOT NULL,
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`metadata`)),
  `ipAddress` varchar(45) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `security_events`
--

INSERT INTO `security_events` (`id`, `userId`, `eventType`, `severity`, `metadata`, `ipAddress`, `createdAt`, `updatedAt`) VALUES
('a259a8cd-11cf-4c59-a6c0-d9c633e535e3', '302c5e50-9c9b-4b6b-90a8-92be0c448805', 'cms_login_succeeded', 'info', '{}', '::1', '2026-10-23 00:38:43', '2026-10-23 00:38:43'),
('e4a437cd-c838-4d9c-a28b-d97348d321a6', '302c5e50-9c9b-4b6b-90a8-92be0c448805', 'cms_login_succeeded', 'info', '{}', '::1', '2026-10-23 00:43:23', '2026-10-23 00:43:23');

-- --------------------------------------------------------

--
-- Table structure for table `system_settings`
--

CREATE TABLE `system_settings` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `key` varchar(120) NOT NULL,
  `encryptedValue` text NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `email` varchar(254) NOT NULL,
  `passwordHash` varchar(255) NOT NULL,
  `firstName` varchar(80) NOT NULL,
  `lastName` varchar(80) NOT NULL,
  `roleId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `status` enum('invited','active','disabled') NOT NULL DEFAULT 'invited',
  `twoFactorEnabled` tinyint(1) NOT NULL DEFAULT 0,
  `lastLoginAt` datetime DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `phoneNumber` varchar(40) DEFAULT NULL,
  `profilePhoto` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `passwordHash`, `firstName`, `lastName`, `roleId`, `status`, `twoFactorEnabled`, `lastLoginAt`, `createdAt`, `updatedAt`, `phoneNumber`, `profilePhoto`) VALUES
('302c5e50-9c9b-4b6b-90a8-92be0c448805', 'admin@whistleblower.mw', 'scrypt$65536$8$1$KpxECykFEFbPkEmHnrgY3w$sL3IajvH0pvhKfYvd63P5Ew3ngvQYSGaqTa8F6lkg2VKWx0FozC_rEc1fyo_Xb4Jlm2Tr9D8t1RWr4_co5NWFA', 'admin', 'admin', 'bba3f3f5-6482-4ce0-8cd7-32e49ea858fb', 'active', 0, '2026-10-23 00:43:23', '2026-09-21 05:27:12', '2026-10-23 00:43:23', '+26599955469', 'data:image/webp;base64,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');

-- --------------------------------------------------------

--
-- Table structure for table `user_invitations`
--

CREATE TABLE `user_invitations` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `userId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `invitedByUserId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `tokenHash` char(64) NOT NULL,
  `expiresAt` datetime NOT NULL,
  `acceptedAt` datetime DEFAULT NULL,
  `revokedAt` datetime DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_otps`
--

CREATE TABLE `user_otps` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `userId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `invitationId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `codeHash` char(64) NOT NULL,
  `expiresAt` datetime NOT NULL,
  `consumedAt` datetime DEFAULT NULL,
  `attempts` int(11) NOT NULL DEFAULT 0,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_password_resets`
--

CREATE TABLE `user_password_resets` (
  `id` char(36) NOT NULL,
  `userId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `tokenHash` char(64) NOT NULL,
  `expiresAt` datetime NOT NULL,
  `consumedAt` datetime DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_sessions`
--

CREATE TABLE `user_sessions` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `userId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `tokenHash` char(64) NOT NULL,
  `expiresAt` datetime NOT NULL,
  `revokedAt` datetime DEFAULT NULL,
  `ipAddress` varchar(45) DEFAULT NULL,
  `userAgent` varchar(512) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_sessions`
--

INSERT INTO `user_sessions` (`id`, `userId`, `tokenHash`, `expiresAt`, `revokedAt`, `ipAddress`, `userAgent`, `createdAt`, `updatedAt`) VALUES
('4b3dca0c-61ae-4d66-b5fa-4774dd4bea69', '302c5e50-9c9b-4b6b-90a8-92be0c448805', '1c6a6cdecffbbb1428d7efaa1ae5203a2bd4fbc547bcaa6e7edfae98d00439a7', '2026-10-23 08:43:23', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-23 00:43:23', '2026-10-23 00:43:23'),
('4f927648-1e0b-49eb-8019-e4b55706cdbb', '302c5e50-9c9b-4b6b-90a8-92be0c448805', 'a104c8fd2c5a256d78af3fa7bbf10819d82c3aecaee2930609654fdb51858316', '2026-10-23 08:38:43', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36 Edg/155.0.0.0', '2026-10-23 00:38:43', '2026-10-23 00:38:43');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `archived_notifications`
--
ALTER TABLE `archived_notifications`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `archived_notifications_notification_id_user_id` (`notificationId`,`userId`),
  ADD KEY `archived_notifications_user_id_archived_at` (`userId`,`archivedAt`);

--
-- Indexes for table `audit_logs`
--
ALTER TABLE `audit_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`),
  ADD KEY `audit_logs_case_id_created_at` (`caseId`,`createdAt`);

--
-- Indexes for table `call_recordings`
--
ALTER TABLE `call_recordings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `callRecordId` (`callRecordId`);

--
-- Indexes for table `call_records`
--
ALTER TABLE `call_records`
  ADD PRIMARY KEY (`id`),
  ADD KEY `caseId` (`caseId`);

--
-- Indexes for table `call_transcriptions`
--
ALTER TABLE `call_transcriptions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `callRecordId` (`callRecordId`);

--
-- Indexes for table `cases`
--
ALTER TABLE `cases`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `caseNumber` (`caseNumber`),
  ADD KEY `sourceId` (`sourceId`),
  ADD KEY `cases_status_id` (`statusId`),
  ADD KEY `cases_priority` (`priority`),
  ADD KEY `cases_opened_at` (`openedAt`),
  ADD KEY `cases_lead_user_id` (`leadUserId`),
  ADD KEY `cases_organization_id` (`organizationId`);

--
-- Indexes for table `case_assignments`
--
ALTER TABLE `case_assignments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `case_assignments_case_id_user_id_active` (`caseId`,`userId`,`active`),
  ADD KEY `case_assignments_case_id_active` (`caseId`,`active`),
  ADD KEY `case_assignments_user_id_active` (`userId`,`active`),
  ADD KEY `case_assignments_case_id_assignment_type_active` (`caseId`,`assignmentType`,`active`);

--
-- Indexes for table `case_categories`
--
ALTER TABLE `case_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `case_category_map`
--
ALTER TABLE `case_category_map`
  ADD PRIMARY KEY (`caseId`,`categoryId`),
  ADD KEY `categoryId` (`categoryId`);

--
-- Indexes for table `case_documents`
--
ALTER TABLE `case_documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `caseId` (`caseId`);

--
-- Indexes for table `case_intakes`
--
ALTER TABLE `case_intakes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `caseId` (`caseId`);

--
-- Indexes for table `case_messages`
--
ALTER TABLE `case_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `caseId` (`caseId`);

--
-- Indexes for table `case_notes`
--
ALTER TABLE `case_notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `caseId` (`caseId`);

--
-- Indexes for table `case_secondary_reviews`
--
ALTER TABLE `case_secondary_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `case_secondary_reviews_case_created` (`caseId`,`createdAt`),
  ADD KEY `case_secondary_reviews_reviewer_status` (`reviewerUserId`,`status`),
  ADD KEY `case_secondary_reviews_case_id_created_at` (`caseId`,`createdAt`),
  ADD KEY `case_secondary_reviews_reviewer_user_id_status` (`reviewerUserId`,`status`);

--
-- Indexes for table `case_sources`
--
ALTER TABLE `case_sources`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `case_statuses`
--
ALTER TABLE `case_statuses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `case_status_history`
--
ALTER TABLE `case_status_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `case_status_history_case_id_created_at` (`caseId`,`createdAt`);

--
-- Indexes for table `evidence`
--
ALTER TABLE `evidence`
  ADD PRIMARY KEY (`id`),
  ADD KEY `caseId` (`caseId`);

--
-- Indexes for table `evidence_access_events`
--
ALTER TABLE `evidence_access_events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `evidence_access_case_created` (`caseId`,`createdAt`),
  ADD KEY `evidence_access_document_created` (`documentId`,`createdAt`),
  ADD KEY `evidence_access_actor_created` (`actorUserId`,`createdAt`);

--
-- Indexes for table `evidence_chain_of_custody`
--
ALTER TABLE `evidence_chain_of_custody`
  ADD PRIMARY KEY (`id`),
  ADD KEY `evidenceFileId` (`evidenceFileId`);

--
-- Indexes for table `evidence_files`
--
ALTER TABLE `evidence_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `evidenceId` (`evidenceId`);

--
-- Indexes for table `follow_up_tokens`
--
ALTER TABLE `follow_up_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tokenHash` (`tokenHash`),
  ADD KEY `caseId` (`caseId`);

--
-- Indexes for table `investigations`
--
ALTER TABLE `investigations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `caseId` (`caseId`),
  ADD UNIQUE KEY `investigations_reference_unique` (`reference`);

--
-- Indexes for table `investigation_actions`
--
ALTER TABLE `investigation_actions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `investigationId` (`investigationId`),
  ADD KEY `investigation_actions_createdByUserId_status` (`createdByUserId`,`status`),
  ADD KEY `investigation_actions_assignedToUserId_status` (`assignedToUserId`,`status`),
  ADD KEY `investigation_actions_accountableAssignee_status` (`accountableAssigneeUserId`,`status`);

--
-- Indexes for table `investigation_action_assignees`
--
ALTER TABLE `investigation_action_assignees`
  ADD PRIMARY KEY (`actionId`,`userId`),
  ADD KEY `investigation_action_assignees_userId_actionId` (`userId`,`actionId`),
  ADD KEY `investigation_action_assignees_assignedByUser_fk` (`assignedByUserId`),
  ADD KEY `investigation_action_assignees_user_id_action_id` (`userId`,`actionId`);

--
-- Indexes for table `investigation_action_comments`
--
ALTER TABLE `investigation_action_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `investigation_action_comments_actionId_createdAt` (`actionId`,`createdAt`),
  ADD KEY `investigation_action_comments_author_fk` (`authorUserId`),
  ADD KEY `investigation_action_comments_action_id_created_at` (`actionId`,`createdAt`);

--
-- Indexes for table `investigation_action_dependencies`
--
ALTER TABLE `investigation_action_dependencies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `investigation_action_dependencies_unique` (`actionId`,`dependsOnActionId`),
  ADD KEY `investigation_action_dependencies_depends_on_action_id` (`dependsOnActionId`);

--
-- Indexes for table `investigation_action_evidence_files`
--
ALTER TABLE `investigation_action_evidence_files`
  ADD PRIMARY KEY (`actionId`,`evidenceFileId`),
  ADD KEY `investigation_action_evidence_files_evidenceFileId_actionId` (`evidenceFileId`,`actionId`),
  ADD KEY `investigation_action_evidence_files_attachedByUser_fk` (`attachedByUserId`),
  ADD KEY `investigation_action_evidence_files_evidence_file_id_action_id` (`evidenceFileId`,`actionId`);

--
-- Indexes for table `investigation_action_files`
--
ALTER TABLE `investigation_action_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `investigation_action_files_actionId_createdAt` (`actionId`,`createdAt`),
  ADD KEY `investigation_action_files_uploader_fk` (`uploadedByUserId`),
  ADD KEY `investigation_action_files_action_id_created_at` (`actionId`,`createdAt`);

--
-- Indexes for table `investigation_action_reviews`
--
ALTER TABLE `investigation_action_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `investigation_action_reviews_actionId_decidedAt` (`actionId`,`decidedAt`),
  ADD KEY `investigation_action_reviews_reviewer_fk` (`reviewerUserId`),
  ADD KEY `investigation_action_reviews_action_id_decided_at` (`actionId`,`decidedAt`);

--
-- Indexes for table `investigation_events`
--
ALTER TABLE `investigation_events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `investigation_events_investigation_id_created_at` (`investigationId`,`createdAt`),
  ADD KEY `investigation_events_actor_user_id_created_at` (`actorUserId`,`createdAt`);

--
-- Indexes for table `investigation_findings`
--
ALTER TABLE `investigation_findings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `investigationId` (`investigationId`);

--
-- Indexes for table `investigation_finding_evidence`
--
ALTER TABLE `investigation_finding_evidence`
  ADD PRIMARY KEY (`findingId`,`evidenceId`),
  ADD UNIQUE KEY `investigation_finding_evidence_evidenceId_findingId_unique` (`findingId`,`evidenceId`),
  ADD KEY `evidenceId` (`evidenceId`);

--
-- Indexes for table `investigation_finding_reviews`
--
ALTER TABLE `investigation_finding_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reviewerUserId` (`reviewerUserId`),
  ADD KEY `investigation_finding_reviews_finding_id_submitted_at` (`findingId`,`submittedAt`);

--
-- Indexes for table `investigation_reviews`
--
ALTER TABLE `investigation_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reviewerUserId` (`reviewerUserId`),
  ADD KEY `investigation_reviews_investigation_id_submitted_at` (`investigationId`,`submittedAt`);

--
-- Indexes for table `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login_challenges`
--
ALTER TABLE `login_challenges`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tokenHash` (`tokenHash`),
  ADD KEY `login_challenges_user_id_expires_at` (`userId`,`expiresAt`);

--
-- Indexes for table `message_attachments`
--
ALTER TABLE `message_attachments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `messageId` (`messageId`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `caseId` (`caseId`),
  ADD KEY `idx_notifications_recipient_created` (`recipientUserId`,`createdAt`);

--
-- Indexes for table `notification_archives`
--
ALTER TABLE `notification_archives`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `notification_archives_notification_id_user_id` (`notificationId`,`userId`);

--
-- Indexes for table `notification_events`
--
ALTER TABLE `notification_events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notificationId` (`notificationId`);

--
-- Indexes for table `organizations`
--
ALTER TABLE `organizations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `organizations_name` (`name`);

--
-- Indexes for table `organization_handlers`
--
ALTER TABLE `organization_handlers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_organization_handlers_setup_token` (`setupTokenHash`),
  ADD KEY `organization_handlers_organization_id_active` (`organizationId`,`active`),
  ADD KEY `organization_handlers_user_id_active` (`userId`,`active`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `reporters`
--
ALTER TABLE `reporters`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `caseId` (`caseId`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reports_case_id_generated_at` (`caseId`,`generatedAt`),
  ADD KEY `reports_template_id_generated_at` (`templateId`,`generatedAt`),
  ADD KEY `reports_generated_by_user_id_generated_at` (`generatedByUserId`,`generatedAt`),
  ADD KEY `reports_status` (`status`);

--
-- Indexes for table `report_audit_events`
--
ALTER TABLE `report_audit_events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `report_audit_events_report_id_created_at` (`reportId`,`createdAt`),
  ADD KEY `report_audit_events_actor_user_id_created_at` (`actorUserId`,`createdAt`);

--
-- Indexes for table `report_files`
--
ALTER TABLE `report_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `report_files_report_id_created_at` (`reportId`,`createdAt`);

--
-- Indexes for table `report_templates`
--
ALTER TABLE `report_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `report_templates_active_code` (`active`,`code`);

--
-- Indexes for table `reward_participations`
--
ALTER TABLE `reward_participations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `caseId` (`caseId`),
  ADD KEY `reward_participations_participates_created_at` (`participates`,`createdAt`),
  ADD KEY `reward_participations_opt_in_created` (`participates`,`createdAt`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `role_permissions`
--
ALTER TABLE `role_permissions`
  ADD PRIMARY KEY (`roleId`,`permissionId`),
  ADD UNIQUE KEY `role_permissions_permissionId_roleId_unique` (`roleId`,`permissionId`),
  ADD KEY `permissionId` (`permissionId`);

--
-- Indexes for table `security_events`
--
ALTER TABLE `security_events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_settings`
--
ALTER TABLE `system_settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `roleId` (`roleId`);

--
-- Indexes for table `user_invitations`
--
ALTER TABLE `user_invitations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tokenHash` (`tokenHash`),
  ADD KEY `user_invitations_user_id` (`userId`),
  ADD KEY `user_invitations_expires_at` (`expiresAt`);

--
-- Indexes for table `user_otps`
--
ALTER TABLE `user_otps`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invitationId` (`invitationId`),
  ADD KEY `user_otps_user_id_expires_at` (`userId`,`expiresAt`);

--
-- Indexes for table `user_password_resets`
--
ALTER TABLE `user_password_resets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_password_resets_tokenHash_unique` (`tokenHash`),
  ADD KEY `user_password_resets_userId_consumedAt` (`userId`,`consumedAt`),
  ADD KEY `user_password_resets_expiresAt` (`expiresAt`),
  ADD KEY `user_password_resets_user_id_consumed_at` (`userId`,`consumedAt`),
  ADD KEY `user_password_resets_expires_at` (`expiresAt`);

--
-- Indexes for table `user_sessions`
--
ALTER TABLE `user_sessions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tokenHash` (`tokenHash`),
  ADD KEY `userId` (`userId`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `audit_logs`
--
ALTER TABLE `audit_logs`
  ADD CONSTRAINT `audit_logs_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `audit_logs_ibfk_2` FOREIGN KEY (`caseId`) REFERENCES `cases` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `call_recordings`
--
ALTER TABLE `call_recordings`
  ADD CONSTRAINT `call_recordings_ibfk_1` FOREIGN KEY (`callRecordId`) REFERENCES `call_records` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `call_records`
--
ALTER TABLE `call_records`
  ADD CONSTRAINT `call_records_ibfk_1` FOREIGN KEY (`caseId`) REFERENCES `cases` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `call_transcriptions`
--
ALTER TABLE `call_transcriptions`
  ADD CONSTRAINT `call_transcriptions_ibfk_1` FOREIGN KEY (`callRecordId`) REFERENCES `call_records` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cases`
--
ALTER TABLE `cases`
  ADD CONSTRAINT `cases_ibfk_1` FOREIGN KEY (`statusId`) REFERENCES `case_statuses` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `cases_ibfk_2` FOREIGN KEY (`sourceId`) REFERENCES `case_sources` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `cases_ibfk_3` FOREIGN KEY (`leadUserId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `case_assignments`
--
ALTER TABLE `case_assignments`
  ADD CONSTRAINT `case_assignments_ibfk_1` FOREIGN KEY (`caseId`) REFERENCES `cases` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `case_assignments_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `case_category_map`
--
ALTER TABLE `case_category_map`
  ADD CONSTRAINT `case_category_map_ibfk_1` FOREIGN KEY (`categoryId`) REFERENCES `case_categories` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `case_documents`
--
ALTER TABLE `case_documents`
  ADD CONSTRAINT `case_documents_ibfk_1` FOREIGN KEY (`caseId`) REFERENCES `cases` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `case_intakes`
--
ALTER TABLE `case_intakes`
  ADD CONSTRAINT `case_intakes_ibfk_1` FOREIGN KEY (`caseId`) REFERENCES `cases` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `case_messages`
--
ALTER TABLE `case_messages`
  ADD CONSTRAINT `case_messages_ibfk_1` FOREIGN KEY (`caseId`) REFERENCES `cases` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `case_notes`
--
ALTER TABLE `case_notes`
  ADD CONSTRAINT `case_notes_ibfk_1` FOREIGN KEY (`caseId`) REFERENCES `cases` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `case_status_history`
--
ALTER TABLE `case_status_history`
  ADD CONSTRAINT `case_status_history_ibfk_1` FOREIGN KEY (`caseId`) REFERENCES `cases` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `evidence`
--
ALTER TABLE `evidence`
  ADD CONSTRAINT `evidence_ibfk_1` FOREIGN KEY (`caseId`) REFERENCES `cases` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `evidence_chain_of_custody`
--
ALTER TABLE `evidence_chain_of_custody`
  ADD CONSTRAINT `evidence_chain_of_custody_ibfk_1` FOREIGN KEY (`evidenceFileId`) REFERENCES `evidence_files` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `evidence_files`
--
ALTER TABLE `evidence_files`
  ADD CONSTRAINT `evidence_files_ibfk_1` FOREIGN KEY (`evidenceId`) REFERENCES `evidence` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `follow_up_tokens`
--
ALTER TABLE `follow_up_tokens`
  ADD CONSTRAINT `follow_up_tokens_ibfk_1` FOREIGN KEY (`caseId`) REFERENCES `cases` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `investigations`
--
ALTER TABLE `investigations`
  ADD CONSTRAINT `investigations_ibfk_1` FOREIGN KEY (`caseId`) REFERENCES `cases` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `investigation_actions`
--
ALTER TABLE `investigation_actions`
  ADD CONSTRAINT `investigation_actions_accountableAssignee_fk` FOREIGN KEY (`accountableAssigneeUserId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `investigation_actions_createdByUserId_fk` FOREIGN KEY (`createdByUserId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `investigation_actions_ibfk_1` FOREIGN KEY (`investigationId`) REFERENCES `investigations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `investigation_action_assignees`
--
ALTER TABLE `investigation_action_assignees`
  ADD CONSTRAINT `investigation_action_assignees_action_fk` FOREIGN KEY (`actionId`) REFERENCES `investigation_actions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `investigation_action_assignees_assignedByUser_fk` FOREIGN KEY (`assignedByUserId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `investigation_action_assignees_user_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `investigation_action_comments`
--
ALTER TABLE `investigation_action_comments`
  ADD CONSTRAINT `investigation_action_comments_action_fk` FOREIGN KEY (`actionId`) REFERENCES `investigation_actions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `investigation_action_comments_author_fk` FOREIGN KEY (`authorUserId`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `investigation_action_dependencies`
--
ALTER TABLE `investigation_action_dependencies`
  ADD CONSTRAINT `investigation_action_dependencies_ibfk_1` FOREIGN KEY (`actionId`) REFERENCES `investigation_actions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `investigation_action_dependencies_ibfk_2` FOREIGN KEY (`dependsOnActionId`) REFERENCES `investigation_actions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `investigation_action_evidence_files`
--
ALTER TABLE `investigation_action_evidence_files`
  ADD CONSTRAINT `investigation_action_evidence_files_action_fk` FOREIGN KEY (`actionId`) REFERENCES `investigation_actions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `investigation_action_evidence_files_attachedByUser_fk` FOREIGN KEY (`attachedByUserId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `investigation_action_evidence_files_file_fk` FOREIGN KEY (`evidenceFileId`) REFERENCES `evidence_files` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `investigation_action_files`
--
ALTER TABLE `investigation_action_files`
  ADD CONSTRAINT `investigation_action_files_action_fk` FOREIGN KEY (`actionId`) REFERENCES `investigation_actions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `investigation_action_files_uploader_fk` FOREIGN KEY (`uploadedByUserId`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `investigation_action_reviews`
--
ALTER TABLE `investigation_action_reviews`
  ADD CONSTRAINT `investigation_action_reviews_action_fk` FOREIGN KEY (`actionId`) REFERENCES `investigation_actions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `investigation_action_reviews_reviewer_fk` FOREIGN KEY (`reviewerUserId`) REFERENCES `users` (`id`);

--
-- Constraints for table `investigation_events`
--
ALTER TABLE `investigation_events`
  ADD CONSTRAINT `investigation_events_ibfk_1` FOREIGN KEY (`investigationId`) REFERENCES `investigations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `investigation_events_ibfk_2` FOREIGN KEY (`actorUserId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `investigation_findings`
--
ALTER TABLE `investigation_findings`
  ADD CONSTRAINT `investigation_findings_ibfk_1` FOREIGN KEY (`investigationId`) REFERENCES `investigations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `investigation_finding_evidence`
--
ALTER TABLE `investigation_finding_evidence`
  ADD CONSTRAINT `investigation_finding_evidence_ibfk_1` FOREIGN KEY (`findingId`) REFERENCES `investigation_findings` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `investigation_finding_evidence_ibfk_2` FOREIGN KEY (`evidenceId`) REFERENCES `evidence` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `investigation_finding_reviews`
--
ALTER TABLE `investigation_finding_reviews`
  ADD CONSTRAINT `investigation_finding_reviews_ibfk_1` FOREIGN KEY (`findingId`) REFERENCES `investigation_findings` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `investigation_finding_reviews_ibfk_2` FOREIGN KEY (`reviewerUserId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `investigation_reviews`
--
ALTER TABLE `investigation_reviews`
  ADD CONSTRAINT `investigation_reviews_ibfk_1` FOREIGN KEY (`investigationId`) REFERENCES `investigations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `investigation_reviews_ibfk_2` FOREIGN KEY (`reviewerUserId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `login_challenges`
--
ALTER TABLE `login_challenges`
  ADD CONSTRAINT `login_challenges_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `message_attachments`
--
ALTER TABLE `message_attachments`
  ADD CONSTRAINT `message_attachments_ibfk_1` FOREIGN KEY (`messageId`) REFERENCES `case_messages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `fk_notifications_recipient_user` FOREIGN KEY (`recipientUserId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`caseId`) REFERENCES `cases` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `notification_events`
--
ALTER TABLE `notification_events`
  ADD CONSTRAINT `notification_events_ibfk_1` FOREIGN KEY (`notificationId`) REFERENCES `notifications` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `organization_handlers`
--
ALTER TABLE `organization_handlers`
  ADD CONSTRAINT `organization_handlers_ibfk_1` FOREIGN KEY (`organizationId`) REFERENCES `organizations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `organization_handlers_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `reporters`
--
ALTER TABLE `reporters`
  ADD CONSTRAINT `reporters_ibfk_1` FOREIGN KEY (`caseId`) REFERENCES `cases` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `reports`
--
ALTER TABLE `reports`
  ADD CONSTRAINT `reports_ibfk_1` FOREIGN KEY (`caseId`) REFERENCES `cases` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `reports_ibfk_2` FOREIGN KEY (`templateId`) REFERENCES `report_templates` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `reports_ibfk_3` FOREIGN KEY (`generatedByUserId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `report_audit_events`
--
ALTER TABLE `report_audit_events`
  ADD CONSTRAINT `report_audit_events_ibfk_1` FOREIGN KEY (`reportId`) REFERENCES `reports` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `report_audit_events_ibfk_2` FOREIGN KEY (`actorUserId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `report_files`
--
ALTER TABLE `report_files`
  ADD CONSTRAINT `report_files_ibfk_1` FOREIGN KEY (`reportId`) REFERENCES `reports` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `reward_participations`
--
ALTER TABLE `reward_participations`
  ADD CONSTRAINT `reward_participations_ibfk_1` FOREIGN KEY (`caseId`) REFERENCES `cases` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `role_permissions`
--
ALTER TABLE `role_permissions`
  ADD CONSTRAINT `role_permissions_ibfk_1` FOREIGN KEY (`roleId`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `role_permissions_ibfk_2` FOREIGN KEY (`permissionId`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`roleId`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_invitations`
--
ALTER TABLE `user_invitations`
  ADD CONSTRAINT `user_invitations_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_otps`
--
ALTER TABLE `user_otps`
  ADD CONSTRAINT `user_otps_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_otps_ibfk_2` FOREIGN KEY (`invitationId`) REFERENCES `user_invitations` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `user_password_resets`
--
ALTER TABLE `user_password_resets`
  ADD CONSTRAINT `user_password_resets_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_sessions`
--
ALTER TABLE `user_sessions`
  ADD CONSTRAINT `user_sessions_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
