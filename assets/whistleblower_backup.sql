-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 10, 2026 at 03:01 AM
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

--
-- Dumping data for table `archived_notifications`
--

INSERT INTO `archived_notifications` (`id`, `notificationId`, `userId`, `archivedAt`, `createdAt`, `updatedAt`) VALUES
('0514e62c-eac4-483e-979a-d16f10d527da', 'notification-b91a4b88-cfa7-4f30-98fb-b682c0c49a28', '302c5e50-9c9b-4b6b-90a8-92be0c448805', '2026-10-08 07:50:45', '2026-10-08 07:50:45', '2026-10-08 07:50:45'),
('063cb423-2548-45ba-a3e6-bf18feab0018', 'security-f4aaedb4-a619-4a0f-84ad-0fa4c83dc449', '302c5e50-9c9b-4b6b-90a8-92be0c448805', '2026-10-09 14:31:43', '2026-10-09 14:31:44', '2026-10-09 14:31:44'),
('086b1be8-0786-42ec-83b9-91802989f65b', 'notification-dd06aaa3-3dc3-436a-86f2-699ce9bd4ee4', '302c5e50-9c9b-4b6b-90a8-92be0c448805', '2026-09-22 05:10:49', '2026-09-22 05:10:49', '2026-09-22 05:10:49'),
('3ce963e4-c0b6-49aa-94a3-3ee516b5b843', 'security-8d222964-10d9-41ab-a81c-742966e14205', '302c5e50-9c9b-4b6b-90a8-92be0c448805', '2026-10-08 07:50:45', '2026-10-08 07:50:45', '2026-10-08 07:50:45'),
('458637a8-d400-493f-884f-6983c4f6c927', 'security-91878af8-3cda-4754-b7c6-6914197c2fe2', '302c5e50-9c9b-4b6b-90a8-92be0c448805', '2026-10-08 07:50:45', '2026-10-08 07:50:45', '2026-10-08 07:50:45'),
('4cb66f89-67c9-4e04-a9b2-665ff8ea85c0', 'security-57c5bc1b-1fa7-4749-ae10-afce8040c26d', '302c5e50-9c9b-4b6b-90a8-92be0c448805', '2026-10-09 14:31:43', '2026-10-09 14:31:43', '2026-10-09 14:31:43'),
('55c55895-f28a-4543-bcc5-a5c7af22991b', 'security-3bd29812-ea58-4e2e-a3af-0219187140ef', '302c5e50-9c9b-4b6b-90a8-92be0c448805', '2026-10-08 07:50:45', '2026-10-08 07:50:45', '2026-10-08 07:50:45'),
('6abb5b36-cbd2-45b3-a611-8727e5eac0b7', 'security-6b862ce4-b360-46cf-a8b5-ff52d8d30824', '302c5e50-9c9b-4b6b-90a8-92be0c448805', '2026-10-08 07:50:45', '2026-10-08 07:50:45', '2026-10-08 07:50:45'),
('826541c2-c00b-47a9-9bdd-9ed584fb9545', 'notification-a40906f6-a3da-43a1-ab2f-f23a3cffc19b', '302c5e50-9c9b-4b6b-90a8-92be0c448805', '2026-10-09 14:31:43', '2026-10-09 14:31:43', '2026-10-09 14:31:43'),
('849e85d6-1c1b-463d-b1df-844906e6200a', 'notification-b2fdb604-7d71-48a1-849a-c9ef2af00289', '302c5e50-9c9b-4b6b-90a8-92be0c448805', '2026-10-08 07:50:45', '2026-10-08 07:50:45', '2026-10-08 07:50:45'),
('877c9d00-7bb5-4138-9d45-b16b034314cd', 'notification-14900d45-0a82-4cbb-969f-d0702f12d170', '302c5e50-9c9b-4b6b-90a8-92be0c448805', '2026-10-08 07:50:45', '2026-10-08 07:50:45', '2026-10-08 07:50:45'),
('a9986fc1-ae62-4b48-9b89-e5fdc7f577d2', 'notification-a0ac2776-4de2-4341-b88a-b03e53b4e3e0', '302c5e50-9c9b-4b6b-90a8-92be0c448805', '2026-09-22 05:10:49', '2026-09-22 05:10:49', '2026-09-22 05:10:49'),
('afa01180-9b14-4eec-9188-7964a036c3dd', 'security-dd8775a8-b1a7-485a-8f5f-79da7b2dd316', '302c5e50-9c9b-4b6b-90a8-92be0c448805', '2026-10-08 07:50:45', '2026-10-08 07:50:45', '2026-10-08 07:50:45'),
('b7ddc461-6e96-4e0a-b3ae-c94ee2c00c8a', 'security-6419a1ac-cfc6-4e96-a573-eaa3421bb307', '302c5e50-9c9b-4b6b-90a8-92be0c448805', '2026-10-08 07:50:45', '2026-10-08 07:50:45', '2026-10-08 07:50:45'),
('c1c09f2c-2a86-44a6-8ba7-74ac3024a0c7', 'security-3635515d-67ea-4149-bb93-d312204cf270', '302c5e50-9c9b-4b6b-90a8-92be0c448805', '2026-10-08 07:50:45', '2026-10-08 07:50:45', '2026-10-08 07:50:45'),
('c7fc2715-99fb-4e6e-8232-07b3d972361c', 'notification-23e0a13d-9c55-42c1-bc79-e2e9eae221c5', '302c5e50-9c9b-4b6b-90a8-92be0c448805', '2026-10-09 14:31:43', '2026-10-09 14:31:44', '2026-10-09 14:31:44'),
('efc1e1e4-4c33-4f9b-b9cc-5f8ccf63c914', 'security-49437446-97c5-4f48-8efd-3a3c97687df1', '302c5e50-9c9b-4b6b-90a8-92be0c448805', '2026-10-09 14:31:43', '2026-10-09 14:31:43', '2026-10-09 14:31:43'),
('f1b3a85d-813b-4629-9a53-22b579c14a50', 'notification-ceef3e65-9dd0-4cbd-a069-da19e35b7f37', '302c5e50-9c9b-4b6b-90a8-92be0c448805', '2026-09-22 05:10:49', '2026-09-22 05:10:49', '2026-09-22 05:10:49'),
('fd5cf806-ff45-47a3-a51a-1bf019230abe', 'security-05635c6d-c9a3-4831-8159-f70a68caa3a3', '302c5e50-9c9b-4b6b-90a8-92be0c448805', '2026-10-08 07:50:45', '2026-10-08 07:50:45', '2026-10-08 07:50:45');

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
('08519bc4-857c-4de4-9662-afc312764a4a', '302c5e50-9c9b-4b6b-90a8-92be0c448805', '7b833a0b-34b8-47b5-a35f-f27c4d1255a8', 'case_created', 'case', '7b833a0b-34b8-47b5-a35f-f27c4d1255a8', '{\"channel\":\"manual\",\"attachmentCount\":6}', NULL, NULL, '2026-10-10 00:47:35', '2026-10-10 00:47:35'),
('1a0ab5ad-5d60-4763-8c9b-c5bae0db3472', '302c5e50-9c9b-4b6b-90a8-92be0c448805', '7b833a0b-34b8-47b5-a35f-f27c4d1255a8', 'case_viewed', 'case', '7b833a0b-34b8-47b5-a35f-f27c4d1255a8', '{\"access\":\"detail\"}', NULL, NULL, '2026-10-10 00:49:01', '2026-10-10 00:49:01'),
('2afafc46-f427-411e-a213-58d564433cd4', '302c5e50-9c9b-4b6b-90a8-92be0c448805', '7b833a0b-34b8-47b5-a35f-f27c4d1255a8', 'case_action', 'case', '7b833a0b-34b8-47b5-a35f-f27c4d1255a8', '{\"action\":\"assign\",\"caseNumber\":\"WB/BC/20261010/6809\",\"detail\":\"A case was assigned to you.\"}', NULL, NULL, '2026-10-10 00:48:39', '2026-10-10 00:48:39'),
('4329fa10-fb4e-4991-849b-6ea9adf36ecb', '302c5e50-9c9b-4b6b-90a8-92be0c448805', '7b833a0b-34b8-47b5-a35f-f27c4d1255a8', 'case_viewed', 'case', '7b833a0b-34b8-47b5-a35f-f27c4d1255a8', '{\"access\":\"detail\"}', NULL, NULL, '2026-10-10 00:49:40', '2026-10-10 00:49:40'),
('6eed854c-646e-4ddd-aff9-68bc45b613d7', '302c5e50-9c9b-4b6b-90a8-92be0c448805', '7b833a0b-34b8-47b5-a35f-f27c4d1255a8', 'case_viewed', 'case', '7b833a0b-34b8-47b5-a35f-f27c4d1255a8', '{\"access\":\"detail\"}', NULL, NULL, '2026-10-10 00:47:53', '2026-10-10 00:47:53'),
('81104f44-c6f2-46ac-80db-0bd8d823e157', '302c5e50-9c9b-4b6b-90a8-92be0c448805', '7b833a0b-34b8-47b5-a35f-f27c4d1255a8', 'case_viewed', 'case', '7b833a0b-34b8-47b5-a35f-f27c4d1255a8', '{\"access\":\"detail\"}', NULL, NULL, '2026-10-10 00:48:39', '2026-10-10 00:48:39'),
('957b21c5-e24a-4de9-8f13-304c842ad884', '302c5e50-9c9b-4b6b-90a8-92be0c448805', '7b833a0b-34b8-47b5-a35f-f27c4d1255a8', 'case_action', 'case', '7b833a0b-34b8-47b5-a35f-f27c4d1255a8', '{\"action\":\"status\",\"caseNumber\":\"WB/BC/20261010/6809\",\"detail\":\"The case status workflow was updated.\"}', NULL, NULL, '2026-10-10 00:49:01', '2026-10-10 00:49:01'),
('d753612f-efc1-406b-84b5-09091e557978', '302c5e50-9c9b-4b6b-90a8-92be0c448805', '7b833a0b-34b8-47b5-a35f-f27c4d1255a8', 'case_action', 'case_note', 'a0654f41-f631-48cd-bd69-289f646f7eea', '{\"action\":\"note\",\"detail\":\"Internal note added.\"}', NULL, NULL, '2026-10-10 00:49:40', '2026-10-10 00:49:40'),
('ed18d1f2-7043-4dd5-a5ce-cf297fdba6fb', '302c5e50-9c9b-4b6b-90a8-92be0c448805', '7b833a0b-34b8-47b5-a35f-f27c4d1255a8', 'case_viewed', 'case', '7b833a0b-34b8-47b5-a35f-f27c4d1255a8', '{\"access\":\"detail\"}', NULL, NULL, '2026-10-10 00:47:53', '2026-10-10 00:47:53');

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
('7b833a0b-34b8-47b5-a35f-f27c4d1255a8', 'WB/BC/20261010/6809', 'b3181898-e893-4dd2-b9b4-c0422dfe9458', '9352907f-6039-40e5-9019-d10e221b0630', '118910f9-684e-40c4-91fc-e7038e803d53', 'normal', '2026-10-10 00:47:35', NULL, NULL, '2026-10-10 00:47:35', '2026-10-10 00:48:39', '87d187fe-26db-45bc-b2a6-e5ae504b9565');

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

--
-- Dumping data for table `case_assignments`
--

INSERT INTO `case_assignments` (`id`, `caseId`, `userId`, `assignedByUserId`, `assignmentType`, `active`, `assignedAt`, `unassignedAt`, `createdAt`, `updatedAt`) VALUES
('ecf7d2d4-c80f-46af-a7fb-57c370444b6a', '7b833a0b-34b8-47b5-a35f-f27c4d1255a8', '302c5e50-9c9b-4b6b-90a8-92be0c448805', '302c5e50-9c9b-4b6b-90a8-92be0c448805', 'reviewer', 1, '2026-10-10 00:47:35', NULL, '2026-10-10 00:47:35', '2026-10-10 00:47:35');

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
('7b833a0b-34b8-47b5-a35f-f27c4d1255a8', '47ceb0bf-1e11-4159-ab86-649f933dc3a2', '2026-10-10 00:47:35', '2026-10-10 00:47:35');

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
('483c9f7e-4032-4e20-848f-683ac917f048', '7b833a0b-34b8-47b5-a35f-f27c4d1255a8', 'v1.kBJUBCXSMwdbQxWi.ZCzz0FVUE0S_jDZtmaajjQ.DgodS249zdB9Fkq86U0AX0UcIcP0MaJaWq1oGrdRRZPUBJRM3nzsnEbSXTMAMWpgWsyBQ3fuZPgAMQr8BoglgkVle4FZlFQXXfSdy8ooZB-RY__ncRHEaGMvcwB4ZQQd275OoQZQz6rDerNEWD1sGrvONK-uggOniqBOak98kUVwn0HReBvuW3ru-E9Yj6Idd0BLxjsDzxSgCCLy-x0Cr2qDz3h7wxKNDtzuerVIgjjFlxWmKPrXYjjtWT5bJJAOmzLiHuTyRslUiSoohI2tfUE287237qULw-NsOO6PzG2wYTV7QqwguHYx9O9JmORFC5k', '2026-10-10 00:47:35', 'manual', '2026-10-10 00:47:35', '2026-10-10 00:47:35');

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

--
-- Dumping data for table `case_notes`
--

INSERT INTO `case_notes` (`id`, `caseId`, `authorUserId`, `encryptedBody`, `noteType`, `createdAt`, `updatedAt`) VALUES
('a0654f41-f631-48cd-bd69-289f646f7eea', '7b833a0b-34b8-47b5-a35f-f27c4d1255a8', '302c5e50-9c9b-4b6b-90a8-92be0c448805', 'v1.URdYWjAB8-lKSG3s.M2UeEmAZEuMNNBBdMeCMzA.-u-g2RvSaZhz32FMOjO6So_LCZWfz9II5bgcF2ZUrAK7fzk26tDPNeQnRCIqbvL2jQ', 'general', '2026-10-10 00:49:40', '2026-10-10 00:49:40');

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
('34b2c0cf-0b75-4e04-b5f0-327c48026dc9', 'CLOSED', 'Closed', 6, 1, '2026-09-21 11:38:35', '2026-09-21 11:38:35'),
('66e347b6-b5ab-408e-a88a-f8f40264186c', 'ACTION_REQUIRED', 'Action Required', 4, 0, '2026-09-21 11:38:35', '2026-09-21 11:38:35'),
('9429e6f4-6d3e-4296-be69-30526cbd1bf8', 'INVESTIGATING', 'Investigating', 3, 0, '2026-09-21 11:38:35', '2026-09-21 11:38:35'),
('b3181898-e893-4dd2-b9b4-c0422dfe9458', 'UNDER_REVIEW', 'Under Review', 2, 0, '2026-09-21 11:38:35', '2026-09-21 11:38:35'),
('c64e46df-cd13-46d7-b6b4-2ea8d1a73fce', 'RESOLVED', 'Resolved', 5, 1, '2026-09-21 11:38:35', '2026-09-21 11:38:35'),
('e30e2c8e-be91-4fef-b789-53be844f0bbe', 'NEW', 'New', 1, 0, '2026-09-21 11:38:35', '2026-09-21 11:38:35');

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
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `case_status_history`
--

INSERT INTO `case_status_history` (`id`, `caseId`, `changedByUserId`, `fromStatusId`, `toStatusId`, `reason`, `createdAt`, `updatedAt`) VALUES
('206b5cba-638c-4108-9dd6-8547917c2f79', '7b833a0b-34b8-47b5-a35f-f27c4d1255a8', '302c5e50-9c9b-4b6b-90a8-92be0c448805', NULL, 'e30e2c8e-be91-4fef-b789-53be844f0bbe', 'Case created manually by a CMS user.', '2026-10-10 00:47:35', '2026-10-10 00:47:35'),
('9101b55e-d795-4d6e-9c20-8e7d419f9643', '7b833a0b-34b8-47b5-a35f-f27c4d1255a8', '302c5e50-9c9b-4b6b-90a8-92be0c448805', 'e30e2c8e-be91-4fef-b789-53be844f0bbe', 'b3181898-e893-4dd2-b9b4-c0422dfe9458', 'Case reassigned to wongani nyirenda.', '2026-10-10 00:48:39', '2026-10-10 00:48:39');

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
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `evidence`
--

INSERT INTO `evidence` (`id`, `caseId`, `uploadedByUserId`, `title`, `description`, `classification`, `deletedAt`, `createdAt`, `updatedAt`) VALUES
('15da9eff-2416-4a36-8bbd-fc76788baa68', '7b833a0b-34b8-47b5-a35f-f27c4d1255a8', '302c5e50-9c9b-4b6b-90a8-92be0c448805', 'WhistleBlower - WonganiNyirenda.pdf', NULL, 'confidential', NULL, '2026-10-10 00:47:35', '2026-10-10 00:47:35'),
('25060c64-9bbe-4dc7-b21f-8e17e069b582', '7b833a0b-34b8-47b5-a35f-f27c4d1255a8', '302c5e50-9c9b-4b6b-90a8-92be0c448805', 'mchs sis erd (8).pdf', NULL, 'confidential', NULL, '2026-10-10 00:47:35', '2026-10-10 00:47:35'),
('37e39bd6-6d73-4189-bc04-177d366996c3', '7b833a0b-34b8-47b5-a35f-f27c4d1255a8', '302c5e50-9c9b-4b6b-90a8-92be0c448805', 'mchs sis erd (9).pdf', NULL, 'confidential', NULL, '2026-10-10 00:47:35', '2026-10-10 00:47:35'),
('aa06d881-9c67-4170-8bda-011e5d777e0a', '7b833a0b-34b8-47b5-a35f-f27c4d1255a8', '302c5e50-9c9b-4b6b-90a8-92be0c448805', 'mchs sis erd (3).pdf', NULL, 'confidential', NULL, '2026-10-10 00:47:35', '2026-10-10 00:47:35'),
('af77c1ec-c5c7-4a46-99f9-f9a76b0e770b', '7b833a0b-34b8-47b5-a35f-f27c4d1255a8', '302c5e50-9c9b-4b6b-90a8-92be0c448805', 'mchs sis erd (7).pdf', NULL, 'confidential', NULL, '2026-10-10 00:47:35', '2026-10-10 00:47:35'),
('b708441e-2c51-4325-8a35-3fc18ed7d3c3', '7b833a0b-34b8-47b5-a35f-f27c4d1255a8', '302c5e50-9c9b-4b6b-90a8-92be0c448805', 'accounting-logo-art-design-vector-template-company_736856-1181.jpg', NULL, 'confidential', NULL, '2026-10-10 00:47:35', '2026-10-10 00:47:35');

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
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `evidence_chain_of_custody`
--

INSERT INTO `evidence_chain_of_custody` (`id`, `evidenceFileId`, `actorUserId`, `action`, `fromLocation`, `toLocation`, `checksum`, `notes`, `createdAt`, `updatedAt`) VALUES
('424a5548-a2c6-48cc-bf11-ef9ad18cc5e4', 'c09971f1-0490-4b00-8464-49c3b3b711e8', '302c5e50-9c9b-4b6b-90a8-92be0c448805', 'uploaded', NULL, NULL, '8e22c109b010223e0137b045059d8e29b2458292f203c654e2d9ee155981ce7a', 'Uploaded through the CMS case registration form.', '2026-10-10 00:47:35', '2026-10-10 00:47:35'),
('5e47c5b1-7a9f-4372-b601-6ccd4116c4fe', '6e287f67-5576-481a-bd69-092ebf56b347', '302c5e50-9c9b-4b6b-90a8-92be0c448805', 'uploaded', NULL, NULL, '999ff03fc4e7912a594c874f475dccc8f00beb535700bbe9e32287ea90d00c59', 'Uploaded through the CMS case registration form.', '2026-10-10 00:47:35', '2026-10-10 00:47:35'),
('7ce26655-fb41-472f-a23e-f2f357e96b72', '02e4c057-4397-4522-a136-fb69edf1c92d', '302c5e50-9c9b-4b6b-90a8-92be0c448805', 'uploaded', NULL, NULL, '06a10362fc1df10677e8cd3052b3c1593c588e3f80c9d398c984087a98d7cf71', 'Uploaded through the CMS case registration form.', '2026-10-10 00:47:35', '2026-10-10 00:47:35'),
('c4bae2f0-c306-4706-8d43-10bfc2774b06', '5dc462f2-78a8-4da5-8e3f-9857a0a9e270', '302c5e50-9c9b-4b6b-90a8-92be0c448805', 'uploaded', NULL, NULL, '06a10362fc1df10677e8cd3052b3c1593c588e3f80c9d398c984087a98d7cf71', 'Uploaded through the CMS case registration form.', '2026-10-10 00:47:35', '2026-10-10 00:47:35'),
('de1434c6-906d-4e26-a6e7-cd2810992fc7', '2329c9f7-ea56-4672-aadc-b6bc3a24ff0d', '302c5e50-9c9b-4b6b-90a8-92be0c448805', 'uploaded', NULL, NULL, '06a10362fc1df10677e8cd3052b3c1593c588e3f80c9d398c984087a98d7cf71', 'Uploaded through the CMS case registration form.', '2026-10-10 00:47:35', '2026-10-10 00:47:35'),
('e5b117e3-9bc5-4d3b-9574-0d4c5fdcd24d', 'f171e946-ec77-4e80-9313-6172c6432177', '302c5e50-9c9b-4b6b-90a8-92be0c448805', 'uploaded', NULL, NULL, '06a10362fc1df10677e8cd3052b3c1593c588e3f80c9d398c984087a98d7cf71', 'Uploaded through the CMS case registration form.', '2026-10-10 00:47:35', '2026-10-10 00:47:35');

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
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `evidence_files`
--

INSERT INTO `evidence_files` (`id`, `evidenceId`, `originalName`, `mimeType`, `byteSize`, `checksum`, `encryptedPath`, `createdAt`, `updatedAt`) VALUES
('02e4c057-4397-4522-a136-fb69edf1c92d', '37e39bd6-6d73-4189-bc04-177d366996c3', 'mchs sis erd (9).pdf', 'application/pdf', 1106088, '06a10362fc1df10677e8cd3052b3c1593c588e3f80c9d398c984087a98d7cf71', 'C:\\Users\\Thoko\\Desktop\\site_updated\\api\\data\\evidence\\15471624-4443-4d3b-86ee-1892a6e74837.bin', '2026-10-10 00:47:35', '2026-10-10 00:47:35'),
('2329c9f7-ea56-4672-aadc-b6bc3a24ff0d', '25060c64-9bbe-4dc7-b21f-8e17e069b582', 'mchs sis erd (8).pdf', 'application/pdf', 1106088, '06a10362fc1df10677e8cd3052b3c1593c588e3f80c9d398c984087a98d7cf71', 'C:\\Users\\Thoko\\Desktop\\site_updated\\api\\data\\evidence\\13cbb4e8-b816-46e6-9641-5e5cdf948d81.bin', '2026-10-10 00:47:35', '2026-10-10 00:47:35'),
('5dc462f2-78a8-4da5-8e3f-9857a0a9e270', 'af77c1ec-c5c7-4a46-99f9-f9a76b0e770b', 'mchs sis erd (7).pdf', 'application/pdf', 1106088, '06a10362fc1df10677e8cd3052b3c1593c588e3f80c9d398c984087a98d7cf71', 'C:\\Users\\Thoko\\Desktop\\site_updated\\api\\data\\evidence\\f910c69d-0881-4304-b1d5-e69eedf3638b.bin', '2026-10-10 00:47:35', '2026-10-10 00:47:35'),
('6e287f67-5576-481a-bd69-092ebf56b347', '15da9eff-2416-4a36-8bbd-fc76788baa68', 'WhistleBlower - WonganiNyirenda.pdf', 'application/pdf', 265554, '999ff03fc4e7912a594c874f475dccc8f00beb535700bbe9e32287ea90d00c59', 'C:\\Users\\Thoko\\Desktop\\site_updated\\api\\data\\evidence\\89d039fd-ca9a-4e0f-80be-eaa5bff39800.bin', '2026-10-10 00:47:35', '2026-10-10 00:47:35'),
('c09971f1-0490-4b00-8464-49c3b3b711e8', 'b708441e-2c51-4325-8a35-3fc18ed7d3c3', 'accounting-logo-art-design-vector-template-company_736856-1181.jpg', 'image/jpeg', 61482, '8e22c109b010223e0137b045059d8e29b2458292f203c654e2d9ee155981ce7a', 'C:\\Users\\Thoko\\Desktop\\site_updated\\api\\data\\evidence\\aacfd77d-632f-47fb-adb1-f17a0bd6e6ca.bin', '2026-10-10 00:47:35', '2026-10-10 00:47:35'),
('f171e946-ec77-4e80-9313-6172c6432177', 'aa06d881-9c67-4170-8bda-011e5d777e0a', 'mchs sis erd (3).pdf', 'application/pdf', 1106088, '06a10362fc1df10677e8cd3052b3c1593c588e3f80c9d398c984087a98d7cf71', 'C:\\Users\\Thoko\\Desktop\\site_updated\\api\\data\\evidence\\1065e2c2-4321-4d0a-aadb-0bea18bca2b2.bin', '2026-10-10 00:47:35', '2026-10-10 00:47:35');

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

--
-- Dumping data for table `follow_up_tokens`
--

INSERT INTO `follow_up_tokens` (`id`, `caseId`, `tokenHash`, `expiresAt`, `revokedAt`, `lastUsedAt`, `createdAt`, `updatedAt`) VALUES
('d24e977d-14fa-4c4e-bcb7-87aae6940c70', '7b833a0b-34b8-47b5-a35f-f27c4d1255a8', '4268184acfb71ee35a74b88a606ee3dade8d3402c0b6761ae2263a8ebee14224', NULL, NULL, NULL, '2026-10-10 00:47:35', '2026-10-10 00:47:35');

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
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `investigation_actions`
--

CREATE TABLE `investigation_actions` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `investigationId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `assignedToUserId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `title` varchar(180) NOT NULL,
  `encryptedDescription` text DEFAULT NULL,
  `status` enum('open','in_progress','completed','cancelled') NOT NULL DEFAULT 'open',
  `dueAt` datetime DEFAULT NULL,
  `completedAt` datetime DEFAULT NULL,
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
('0d66d48c-cb90-400d-a393-c1bb3adbb68e', 'admin@whistleblower.mw', 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0', '2026-10-09 15:19:57', '2026-10-09 15:19:57'),
('10715bc5-098f-4d44-a615-28dafb53a3ed', 'admin@whistleblower.mw', 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-10-08 06:49:59', '2026-10-08 06:49:59'),
('361f3eb0-b4bc-4e1b-b915-b9f54b389bf2', 'admin@whistleblower.mw', 0, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', '2026-09-21 05:25:41', '2026-09-21 05:25:41'),
('3cf65ed9-885d-47e0-a6bd-2ff65b1c0624', 'admin@whistleblower.mw', 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0', '2026-10-09 18:00:59', '2026-10-09 18:00:59'),
('438d99d5-8127-4b28-b97c-627f108eae57', 'admin@whistleblower.mw', 0, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-10-08 06:45:17', '2026-10-08 06:45:17'),
('4d7a0111-c619-4512-94b1-e40d36435b80', 'info@whistleblower.mw', 0, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-10-08 06:42:29', '2026-10-08 06:42:29'),
('55976fa8-b81c-4705-826c-34cc8a9d294c', 'admin@whistleblower.mw', 0, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', '2026-09-21 05:11:03', '2026-09-21 05:11:03'),
('757ac34e-4222-41b3-923c-bb23fb665654', 'admin@whistleblower.mw', 0, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', '2026-09-21 05:11:16', '2026-09-21 05:11:16'),
('780285a8-05ee-4c47-97f4-4de00ec78543', 'admin@whistleblower.mw', 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', '2026-09-21 05:38:14', '2026-09-21 05:38:14'),
('79b067be-399b-4153-bd1d-f34843c7e26c', 'admin@whistleblower.mw', 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-09 12:48:17', '2026-10-09 12:48:17'),
('7b0c4514-c0e1-4a16-b9b4-58587148779d', 'admin@whistleblower.mw', 0, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', '2026-09-21 05:19:28', '2026-09-21 05:19:28'),
('90756c88-d781-44b4-aed2-66d3fd4993d0', 'info@whistleblower.mw', 0, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-10-08 06:42:14', '2026-10-08 06:42:14'),
('97f789f0-0aec-4858-9993-71b800dfbab8', 'admin@whistleblower.mw', 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-09 11:47:05', '2026-10-09 11:47:05'),
('acb259aa-548d-4064-ad08-5bbcd8564f8d', 'admin@whistleblower.mw', 0, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', '2026-09-21 05:19:18', '2026-09-21 05:19:18'),
('b0340a40-1b38-433a-80fa-9abb9ba41fb2', 'admin@whistleblower.mw', 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-09 15:06:16', '2026-10-09 15:06:16'),
('bc8e9892-c18a-4d42-ba0d-c23f050b6d9e', 'admin@whistleblower.mw', 0, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-10-08 06:45:07', '2026-10-08 06:45:07'),
('beb63a74-3499-4152-b528-36423b160ed9', 'admin@whistleblower.mw', 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', '2026-09-22 06:30:53', '2026-09-22 06:30:53'),
('cf3b29eb-3121-4280-ab88-e56fe40b1676', 'admin@whistleblower.mw', 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', '2026-09-22 02:05:43', '2026-09-22 02:05:43'),
('cfee5933-c96f-4ba9-bb91-d99ab8910c2f', 'admin@whistleblower.mw', 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-09-23 06:23:42', '2026-09-23 06:23:42'),
('d6beecca-35cc-435f-9638-4ba7676c30b1', 'admin@whistleblower.mw', 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-09 23:10:27', '2026-10-09 23:10:27'),
('d75eb2ba-e5f9-4c58-9580-f200616afc5e', 'admin@whistleblower.mw', 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', '2026-09-21 10:12:00', '2026-09-21 10:12:00'),
('e6744649-7b49-4850-9a9f-431a99b14e79', 'admin@whistleblower.mw', 0, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-10-08 06:45:20', '2026-10-08 06:45:20');

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
('05387a63-1485-4981-a6d5-b85a74318c8d', NULL, '302c5e50-9c9b-4b6b-90a8-92be0c448805', 'user', 'v1.IqJaDHNtvS9VslY0.a5JteNAdywN1dylV3hUQSA.KL8xBJRdcitBFmNCcxJswwx_WmtftIdy8oN9DKRb8UsfIIe0MnXDfiHhURbo_e00Zv5_3_00O-k457l1X53N_RnqS0FvjSu3i0OB6wCqPyLIqkBxLlm-477Viz4j5vN2qYqzdpHqY5F4h1lpEGlKn9QIZzs6wCOtedBAIEdOx7HvTUl2tvk7Cf8kROC68nQ17ASDkp8i0mtH', NULL, '2026-10-09 15:28:24', '2026-10-09 15:28:24'),
('08231a35-d008-4b9d-b38a-a73e06136eed', NULL, '302c5e50-9c9b-4b6b-90a8-92be0c448805', 'user', 'v1.P2QEmhT6V36C_WTd.9l4B8Hed4ILTpTnmtMXXRQ.DeGSOW7uLPTiOlM7VpWa6poMtk1ymcdl1oVhvi10y2sHxTTrC-1rmpyLe2NNyxj2OAEMtjfoQqBChAzyNB_nSO8dJOk1p6R1puMD1frWzxxh6AgCqolp6oN3-0hb9MC6qmbblekWtIcXJrax0IsFN9yaKZ1BkoSZvzZ350QfIYAql6NBS6jx13dal30IU-USQ0_efzgSfnKA', NULL, '2026-10-09 15:03:23', '2026-10-09 15:03:23'),
('08c030e5-7679-4104-8c27-bce768e7ab39', NULL, '118910f9-684e-40c4-91fc-e7038e803d53', 'user', 'v1.rv_6BLIJ9UzYTdXM.CXq5zS6E3YJmGjMdXzYpNA.cUbVQAJHUXvVuOCKcZ0DdwpyrC5sbQpjVoQ6AXFvyaM97MxSEThYFxCBqzJlwjGhg95uznnHZyCSA4TVTJELOGiXLO9-3NWvXBgLt5Gp8C0S3inSFseC1Y4fhqwN55_J1dzBrMlPo5g9Bbk3-eHs2-PXtXN4mCYZIQU1A_ySaQ9DVazdRUM_KfFBTuE', NULL, '2026-10-09 15:11:29', '2026-10-09 15:11:29'),
('08fcfc73-fe57-43d6-a5e3-0773cce423bf', NULL, '302c5e50-9c9b-4b6b-90a8-92be0c448805', 'user', 'v1.XmuAal-sik8xATvR._W_032vLHd84YzMlbb0g1w.PxtTviftoRVUfkGqilr8BzTwbYYPTB2UzpUIVPNn1SMU_Y42HF8XO76LTwFDHLpKda3GizwkXqyqWm1L2HbsA1w-uu0DFcpd161boWrPdmxZRcxuVjXRJD5iOqNaeaHirgLuYOq95Jg1XI2GAtXvPVp-hlR9pCBRQU3IxdTKk09mrMt_cg', NULL, '2026-10-09 14:41:06', '2026-10-09 14:41:06'),
('0c2449a7-0626-4e6b-a6c9-dd235bf64a6a', NULL, '302c5e50-9c9b-4b6b-90a8-92be0c448805', 'user', 'v1.ORINGH3-XCJc7Hw9.A83cUnT-z25laW08D9_gQQ.EVkpjRNdKvPynNeAetzaBIPvdmgBwOouVjnhUMcxins9hQ6o67Z3aP1Tf4MQmANSt4rJEP09MvPHJ8b_wZvuh3fRFn3ktjyiTd9SGm-zCVAan5OC_PVwQi0uXS7l5lSof0eQzxRGEzbEsOUf_nNtOAfma3a0rfQXu24JsbvVE4dbtNVPobajny6G9gn39wA_8d3cmBjBWY6M', NULL, '2026-10-09 15:21:50', '2026-10-09 15:21:50'),
('10cffd37-d70c-467d-9884-968df3c90a4d', NULL, '302c5e50-9c9b-4b6b-90a8-92be0c448805', 'user', 'v1.Osq6umL4FrKQvAU6.gRyOaa3rbWKzqKJhx5H6Ew.QmzBJ7ez7lsrXrn5PobkP1nPRtwMsjYjp0O0ENB4IL923rP5tmpHMt2XeJuydC-Fje-oSbqOGACJsXms5vm4X7mnf2t6km06IGOOG5OetL_elRpezUxXsdJfrZQWQtBb2FmpTgUc1avX4zwyWdZ9rQrhkO0Xcr_8aTccAaagn0NpbhjNSDdk8ArzKKhzPJeErB4FGXvKWHYh', NULL, '2026-10-09 15:26:32', '2026-10-09 15:26:32'),
('14900d45-0a82-4cbb-969f-d0702f12d170', NULL, '302c5e50-9c9b-4b6b-90a8-92be0c448805', 'user', 'v1.FSyRT0zqVvKDtZ4a.IjQDiBYpeam0UO3dU-ZDJQ.R86Iykl0fuaqngMnY7mMc3vWFUsfzbXm9P5vUttp9spIJ-sJIi5PWxPB06QTLZSDT8HSYlIABg_m3_bK_lTt0ecCTIIbkAfC1u2ok3tnRkcW5D78jbjmBKHOFVw03_3wo0s9h-OGyzVJQzFvqXZllg0_sHZF8ObrLZ2D3K_TewZqWHfPV0c_bS74q0JgqjCGr3eRwA', NULL, '2026-10-08 07:45:39', '2026-10-08 07:45:39'),
('193ec543-a397-4574-8b87-4e498de959fb', NULL, '302c5e50-9c9b-4b6b-90a8-92be0c448805', 'user', 'v1.3dJyPRltVst0FDSC.LNyc54V3_h_TuHLcYuCXKg.hm7QyRlb6ODvptDWPWGp0m-KH9A4_AKyeLZOaD8qxIxf4XwY1X0N2SUVt__XXnxW7e-kbiBwGi7PhnJXOQs3hXNfPQsBho5sn0tjiHbwiWS_vmnYtKY-SuiErwhmdV3WLejWs5DMc-gAsEhSh4MsLT4i_71F4tXjiVCSP9RBFO5jxmQ', NULL, '2026-10-09 15:20:21', '2026-10-09 15:20:21'),
('1a9ffa63-4545-41a0-86d6-e435431c22d0', NULL, '302c5e50-9c9b-4b6b-90a8-92be0c448805', 'case', 'v1.vU4QedA2Yx1lEWUm.Sy4nIgxf-p_Eqs9lPuZmwQ.i03AHaKv22mHD8YPpdWATJYZllInzpV9MW30aZ75u7n57BXeJUZ03RRJtbb_mR1wmewhtc2811B8NuNdAf1sSxtQZyiOWbmMTCSVuvMWmnuNYVXlAiecUITNtGOZKEcl91xvBX2lJu3dik2br1XKaBRwT2cRDDMZGmI7-03vKeqlr0Kb', NULL, '2026-09-21 09:44:55', '2026-09-21 09:44:55'),
('1ba98d09-62b9-4b78-8b78-71059064fb5a', NULL, '302c5e50-9c9b-4b6b-90a8-92be0c448805', 'user', 'v1.E2vbzY9Y5NQpsOD6.Amg7ATyKvD3QV2y49cwu8w.XHaXfLcMyB1hNW11R-zId7oqQ7FCabyj0IbPdVxB0hAUnU2v63h6pf59uRghfl-ueZ22dR8aLutyCtIBmvC2jP2xzDZqImmoL9GUstLibt8K18yX9WDRkzH7WkV3c6Vx9nWswzQdrjhjseFZV4I-O2J0CYGEuKasFk3o0FiOaA', NULL, '2026-10-09 15:06:26', '2026-10-09 15:06:26'),
('225f34c6-732b-4139-8653-7b87f51bd09e', '7b833a0b-34b8-47b5-a35f-f27c4d1255a8', '118910f9-684e-40c4-91fc-e7038e803d53', 'case', 'v1.nM5eam0wwYqlEdxz.1M5YhyXBM-5gJFscWMeG4Q.UuKRtR3je_lKUXIO0mM1UEfLhI3KNmLCEs9THFQNvDA8Kq0mtOvnS-Ps96P4Lbnyq0ijV2PC5qsAKNyOpLVyKJnKqtR7siuVJnPFXOS59eqER0HGd5u9ZVVTnHGnZ328Wr2uhp7C457oqxFn0BN68gL-4OiVII31cZJAbDjNRMa0Pf8oLdLehu_yNkRPmvG4KD5BmJd18fe_XbWy9w8f9joCIu1vyMXofyZ0tgAv0cK0CvTZ0eQj0IeGJdmzKa-VrNO55geS9N9MxoxE8D6sA1HhZ8z6jnaxmgnsDoLiS4dIv-SjaL90CjIFgdRUfZ4cfxKp1f-5IHw4', NULL, '2026-10-10 00:49:40', '2026-10-10 00:49:40'),
('239d5880-9b80-47c8-9168-204f5a55201f', NULL, '302c5e50-9c9b-4b6b-90a8-92be0c448805', 'case', 'v1.rQYFqUna-Qeq9cd3.NJVMLbq729CYJ2bghE8OMg.hS-pGGj5tXC2AiKOOuXCJBjEkodBntgb2VTNKtcBHHAejN276y6XVKTF8Pz9pGwLJp54UWYvQB-INlkSnmHSxfQJk9yu7qciJbhhOT-rn-VePABK0c-SuL0kDUxsHxrtLQTLGb1wf87HILmh09E3ZeSo6LSa66kjeMnX17GZLeO3XSeJ', NULL, '2026-09-21 09:44:51', '2026-09-21 09:44:51'),
('23e0a13d-9c55-42c1-bc79-e2e9eae221c5', NULL, '302c5e50-9c9b-4b6b-90a8-92be0c448805', 'user', 'v1.BxOS2BTb9tuKA8mZ.iD4WzqFDQp-HFIvGqN7p2w.iw2bCKkwsdkyVRqZQ1Gs1pKjYGay3Qt3qjrCbB98hiEyZJoMYOUJ3cChSQ-2enkdmV0NS2fnQgTCfueLH9jk0zWJd4WjEbNPGG-l4BaK9b-2GZtqs1A-sOlmF9Zt4wJ-yGpr6llvWSBxZb5pIjU8ftFTMOzsZK9sqMTr5MKHFtia1u4', NULL, '2026-10-09 14:26:26', '2026-10-09 14:26:26'),
('24d13709-f7ab-44ea-94e4-f9e162e4feda', NULL, '118910f9-684e-40c4-91fc-e7038e803d53', 'case', 'v1.3dqQqRxD9Ucn01-Q.w-9q3O-ZTtspBiIG-CqttA.CIlkR1snk-QnzX8LNouMFutD5imNZFdU2VAIoEKjOkIgd7DzNbwhbuHmqWA6qaI2Zd8mffTRdPPdwkCXB4GWwTb82nYEp-3FhAIc59zR_QsUdAX-V9sG3L0966RFum0NewT0Rbyo3PNDh42qyODGN_Zcbv9905CqEpRkUXmyjOr7bZGIXkUKLXjSDeI', NULL, '2026-10-09 15:11:41', '2026-10-09 15:11:41'),
('29a070fc-d2c2-43c0-a39a-fa6be208aa8f', NULL, '302c5e50-9c9b-4b6b-90a8-92be0c448805', 'user', 'v1.UzrYDKUa1lNa4lg4.0Nb5_JyJyFtjxRjwFjeXsg.TBQoIvJrRfRZXYKVl6n9I1a0Uu3CsIsgDWAT4jzAqWOzwv6tt5lPJM8Ry9F4a8l-245HIEF-XkWKkjEsDAhepPbNBQP0c3o_82XInXs9HZxBp-ViHOzwRafHkglKvFcZb0c9GIxPUAgwde5-bzZl5PwUfYOOuuXYyxSQhDkIjPftmFiBhQ', NULL, '2026-10-09 14:54:03', '2026-10-09 14:54:03'),
('2eb4d4f9-5178-4bd8-a1e4-f963afe69b04', NULL, '118910f9-684e-40c4-91fc-e7038e803d53', 'user', 'v1.oOEieGQPj6NE8caC.K7PnzqWRInCOy0DsqmYz7A.lzNX3SWlDCJIyxKdbO5itf5SrJ7Mbge5htKhbHuZW7YfCWegORWTB0QVfhouoiqR-HCWwgP3_kbFD5BtxHfC-wOfDhNJkirWHVro5XDt6n3FTsbCsD2eJJAehOLn4M1AbrhppuWh9qMFrTIeNiAteoFt3c_6LNfwphqyn9IOrAZJoi03lXXitv7gpZGuirlEY2A', NULL, '2026-10-09 15:11:29', '2026-10-09 15:11:29'),
('3d25786d-7eea-42ab-9674-6bdbeb7acbd8', NULL, '302c5e50-9c9b-4b6b-90a8-92be0c448805', 'user', 'v1.527VN6SycoY0vK7r.Je2uhtfCOY3oPxtpoBNaEg.M1Onszqrjybp94Rn9tMAoLfWKRGR8w2Heeeey-WUW7tOhwkcr9A-aG4qa4eOOClYZmJmmwHIzDdKv3aqil78qUthaobpCK-3RqsGD6dE92y28VX5BuCqxRCAKGB-Xmi088BfT9C3tpkHje66BbeHrgiN4CEbdaHrrU8XpNsDeLT_GiQXKIVhIV0xah1Bo6JSa74ZOP062SdCF2gzjm-I4WmXhurQ34O_5IxeTQwo40pnC8j-YvY', NULL, '2026-10-09 14:33:44', '2026-10-09 14:33:44'),
('3ff7be34-d2bb-4d2a-a23e-5981db3c2281', NULL, '302c5e50-9c9b-4b6b-90a8-92be0c448805', 'user', 'v1.rA8FGI5MhdxC9-8n.4lQX3fsHDnyAILEeJW3EBA.xmuuFF6V3vO3WfAiQ-LSfcxI01oa5Gd4wf5O2m35qjfs7_EaUW90pZeOKpClpNAf5O0HV9NaYoCtpkz6taX5dxpGmlxGXlpSB2HbbQlrE38od6Ocg1-LznjamyJjvjj02tyQp9vb_3Alw1BrEB5edxK4ZACBlb22w9roc5lmpUj19q9QIgAcK3SRLGIt7-klUUEb0Gcc36Qk_bzmfPe2Uij2fwgEG5FkVQ', NULL, '2026-10-09 14:53:13', '2026-10-09 14:53:13'),
('429ffd46-1493-4d4d-8bf2-0a68582ece8e', NULL, '302c5e50-9c9b-4b6b-90a8-92be0c448805', 'user', 'v1.t7fzW7eNg8koZcHk.HcI4MeGqJw4bdNe9fD99aQ.SHkQViZb29P1rl01aH3nhhkiIpPT0o5Ma1YtrKOGrZh_--fE5WdneqQ1pI_OyKlW32xAY799nhrZe4RfCiZJ81y4_-6MgC9kmSrsHi2F1Xj9K8pfNticFEWoF75zPXhd-g8lNcibEyjMO4HYHq5kfskfZo5lqKEbS2Lgi3Tl30aRpGtoMytGmsyaS2dif5IFx5EFM76qYMIG', NULL, '2026-10-09 15:21:07', '2026-10-09 15:21:07'),
('4379bbc2-9ac8-41dd-8893-8c86f9c9b833', NULL, '302c5e50-9c9b-4b6b-90a8-92be0c448805', 'case', 'v1.LFlx8RQY1dqxDxd5.wvkbmkNCB1eILzZ34PuNyg.ervikp-VR5JGtOF6ClEZZ8AykfKrJC8N2hHKvnlzc6-LqaiC9Wkj3F1nEaNhfQAFs-H5o_7Cl-BPD1AVtKGXO5Qix5zVNWdKdgI9XuKhmc5Gal4hkmVJ2DqwD8EKzZ1aTH98ieBz0FgvBm1tRdI8w34XVEj-DUB9I1DP_6nxmfpWqsxP', NULL, '2026-09-21 09:44:51', '2026-09-21 09:44:51'),
('43ce8d0c-dc07-4718-b861-33823c4c1e59', NULL, '302c5e50-9c9b-4b6b-90a8-92be0c448805', 'user', 'v1.KbI1BOd9bgyjqVya.avCyAq6RC01QnpTiO9g_Qg.7CuFXjl1z7GzcDD0l4mVoeDZb8FgWgti2No2gCdrWeGzor0Jus5cS5ycwJZYMdTLYmpG_Jful9aDBBnKU17p9yZQ_gr4ZBCejPXiADrhXk3h71-xeffZWyfIVK8C3GxOCgvcqSpoLymDaOn3JlYcVSEYNOvJfB3DxKrsXVqJ7jgaG0OsoQWXc_iwZqEMcujp317mK1Y', NULL, '2026-10-09 15:02:29', '2026-10-09 15:02:29'),
('57222be4-130a-4906-ab6d-fa5e539ad465', NULL, '302c5e50-9c9b-4b6b-90a8-92be0c448805', 'user', 'v1.oox4eyDwq0tJ4X4c.2zqQ8ZAzsdI7OE2Aby76RQ.Q8h2SsCqcY4ESH8zN9cBDsDiZmVhklPs6MKQCyYYsJJGK35vLjZGxFrB97kI-EjsHlCn8VvcO6NRRPkCt8MmfzDkCCSOTufRpCXKTCXCWebL-fqIn3z-w1xZZz1KcnB_fMYoFgJvqz3riPzgHVZ9MOB9XZ39YI25UR9KfHP2bMiimIJOPDQRp81zLz7NFGU', NULL, '2026-09-21 10:13:03', '2026-09-21 10:13:03'),
('5798e15d-ef52-411e-b2ce-5064ba37d1f6', NULL, '302c5e50-9c9b-4b6b-90a8-92be0c448805', 'user', 'v1.R5RE0GOtGVjTSRUa.D7KbjryJr_FvGET11v0Iog.0QTncVn0Wsg_y1fl8NU0gRCdQ-Q46aH5l717trouIXD-vYMytTIcCwE4uFnN7YNtVjCPPxMS5VtgsKKH4qlfvyGexCM7R4BAWvj-298sOBffPhkXds44NWQFpEN4aPGBWQc5nrrofdfEF1LXju8SAoxosBpJZQ8', NULL, '2026-09-21 10:20:06', '2026-09-21 10:20:06'),
('581decaa-545c-4130-b851-6f30efc488e3', NULL, '302c5e50-9c9b-4b6b-90a8-92be0c448805', 'user', 'v1.lo3_wIA_hDJXM17c.ETftTZI43UCLg-_26Z__Ag.sPGUPieBqHz4ixGsVoMhQKSUkUE9cN4OJ-9M0--nRBAriW3X_PATySUMXM5V9_VoGmkveWDtTVzLx9Iz1uZMkae4p5ucoUECp7vID2TbELnyHBM5PMUYdnLOlCrrSWFOrHLjgfRnCa-gJkfe3O1cw9sOS0UODcQDRsXxcquEZFp5kSzPPywcJDlqk0Vo', NULL, '2026-10-09 15:08:18', '2026-10-09 15:08:18'),
('582e4236-e1ad-4db1-917d-e3313b3e32c8', NULL, '118910f9-684e-40c4-91fc-e7038e803d53', 'user', 'v1.fsVTECpI3OS6_q9q.ijjqo1_bVz_eWqL_tHjXxg.VQOGamW_IDoBomPFqCAEiHDGKodGzYesPAvG_8J-FNxXoWZvKWSdjNfvVozOlgumVVkEjIJIF-QfCd_r7RdS60yqMcrXhgYY0Bj8AwywpDox2_dB7dYzh1YTtLPMzXiCEbKwjGUSMyJjebKRMD544i5LBksi3EVJQI9yfL1lU7FEPTaDZZOTU7FaaYY', NULL, '2026-10-09 15:11:29', '2026-10-09 15:11:29'),
('5f6c6724-ea3d-4f95-b563-43bd48c3b16d', NULL, '302c5e50-9c9b-4b6b-90a8-92be0c448805', 'user', 'v1.jDbBOkpYAtFNlh9u.y5fiZW5h-ucmZ-UPhO8Ewg.U-7_gVJbD1YKZvhG-g9GlYMumU-ghUdiVf7QKeX64qPAijEGxKMv7Qj_QbmJDAQJn63rP-auWGbDCCcA7tsHSqpElOQy_UIWKa1s0xo77hPP_okrWquNN4QVEFFoCAhZjBYAvJ6GHL6VxkDTuQxg0bdAwmMl-aOyJAtl6Biv_Q', NULL, '2026-10-09 15:08:53', '2026-10-09 15:08:53'),
('6d25be5a-484b-4e49-9a67-4839592a1284', NULL, '118910f9-684e-40c4-91fc-e7038e803d53', 'user', 'v1.K1_UVFYlW7Pi-4O2.78JtBXwgz4VdmrRNm73iSA.RPmHXgfPcqxJPLJd1tbCyGu__d65CTHU1xL6u950r28fJXd3KAu6aZ42oyRTF0grPEhTY7SAp99YUND4Su7o5sNAuoWLj1RUPXkZbi2tkZBKkaUdeEWzXP-outnEfxee78ZpI4n3JaQDSZZ6KEzHwpHBxQVxmWl7VSpIJEIEcsVEb-sw-bpNiamatpA', NULL, '2026-10-09 15:11:29', '2026-10-09 15:11:29'),
('70b5bee8-e698-41eb-a09d-fe8a4c10556a', NULL, '118910f9-684e-40c4-91fc-e7038e803d53', 'case', 'v1.BU9bkbx4TwaAB7Ni.hGjPXXO6TQZ1ySZ6VKOjcA.d4d-qykKlJ43s3jYov1G1GIBZNhamVaX37GLF9RykiG3xa61p2_7eR9lIW6zBTOsxKqvrh-_AgSncOojdqGTPdoSbzhr2u4XMqSM1xZGq8iGE3kkgtyAbGFZpJtCoIR8G3ulXebPymfsLV_fQBnKPtmls5tJ6swYy-MIhG9eY7imU6TaiJAov3FLEwY', NULL, '2026-10-09 15:11:41', '2026-10-09 15:11:41'),
('7359135c-cdf6-4a08-a329-0ad9641b8872', NULL, '302c5e50-9c9b-4b6b-90a8-92be0c448805', 'user', 'v1.27r6WxxXWiP5aZwt.JdJ4Nyf_NMl7Xw0TUMxzVg.4oMWNke2QqMNXjFb7k_jXgEnXQ_EAJjpoIGJ-cnQ46lbMrMzTWLWpUL9BhpwKvZSrENHQ_7QS8XO_qLpMuEikqUKEefpzjI6QtUzxjKx1R2IoYFUrOagDFpKqc8Ox3sOJ1PxrvE5rsrn3p7ZRNa8rrb858WhAYufC8_bdAD-lk0e0EbBK5URUgseRnWn-zDiTXTs_KdvZ0mx', NULL, '2026-10-09 15:46:13', '2026-10-09 15:46:13'),
('75a54769-e10d-4aaf-aac6-75f16af5ea56', NULL, '302c5e50-9c9b-4b6b-90a8-92be0c448805', 'user', 'v1.zy14paNt6zlzmFkX.z8vfgD1JBlhjAFmD-EbA_Q.z5kDiHdvxvBK1_ZyrW0DEY_Fz2hJmavOGGicXOY47MTtCHqHpxud1WOrZz1g3KICbdCIIL8QjPnpKlFiGJ5myhbkQnAkA6-WnQtGv-PkaHahY-999XwVlPtch-v-PmAq2HtKYMX9NEFIUXpQpkIN89HbfPuVScjnv96dcLwfHhm53FYBRVwKcXh3_r1QzOtfqSyULwpZYXo8', NULL, '2026-10-09 15:02:23', '2026-10-09 15:02:23'),
('76fc3cf6-1077-4b24-ae55-490833b711b4', '7b833a0b-34b8-47b5-a35f-f27c4d1255a8', '302c5e50-9c9b-4b6b-90a8-92be0c448805', 'case', 'v1.aIIjgpde76Wg7UrO._ZkoHPYnbyKFqCy6hzslpQ.p0u4gndX5IvDB_q7zjcgBCjPWiGxvLkk1WjJwxhfkLZ-WhvXvafNJH4AlK3CmhpRbqjjkzESiOO8Avfh5HA-yr6EBGRMiAOAf93ST8EeByhaSdSOsfaRY2nYZZo-JNv2sTZDNGl5HxxpeG7bSJVmfIjG_haQHVTQbr6EoYc-1EkhIh3xvsxwTRGjheZ2LBXqvXWlWsrilwRMlIyV97wZuGtreqyJvoRiybOgRJd75HlyLRwn_-z9vMqQsRC8Gf5wMokKL7JtnJg', NULL, '2026-10-10 00:47:35', '2026-10-10 00:47:35'),
('7a07f7c6-886c-446a-9cb8-ecd4ba5440b2', NULL, '302c5e50-9c9b-4b6b-90a8-92be0c448805', 'user', 'v1.RtjO6dXwKKiQfXOW.La-RH0X7gonn11sRE0gIsg.qiaziALQtCDm0EQpl3jxt73s2gT5K4zHSPYzGCmv_KMTGCf9JbgZCp3_5uKmz7ndOorhyCvIA8p57l98LXAa1NRFLile9zBwwakAgYvtXjumfWz2sxKFCsPmrpIv1kATLiNttcd27I0eTdC4rfbpQiBWsCNi4ela4C6BTES-1yn0hBMFnvZWgH_ftidHSMkzMiFye3yHxwiZ', NULL, '2026-10-09 15:25:45', '2026-10-09 15:25:45'),
('87d4e4b9-da50-4aaf-b719-3537c3d1bbea', NULL, '302c5e50-9c9b-4b6b-90a8-92be0c448805', 'user', 'v1.euPDztfkBN9uL9UM.KAsXPjQbBTvS96UydZPujQ.e1fiuFZJiV4p1a3YnsYKxMQ2YZTsVjzOGN29HC2DAjKtS-xmWt2D3uCCBDnII44J5sn_w96__-0xUa6VZrDTVQhRT00JuQbZvo__bQ6SapdF_fu5nMXKOLHI1a_w0K-pTET1NdJHwruCWK-8tMRgWO_N5kcD2-kDhVEYfumbcQMSVrL67DVPna6EBHizQflSx_uCa3nR_Ak-', NULL, '2026-10-09 15:42:10', '2026-10-09 15:42:10'),
('978f6408-e77b-4d3a-9767-150f053ff8bf', NULL, '302c5e50-9c9b-4b6b-90a8-92be0c448805', 'case', 'v1.K2J-jhOIvZ7nsCul.N-3LXFET_WWZGDxBNiukUQ.PKAixk5S7HuqWOwLGbW8dnxLxc6YFkTezShlsLO1LAHGzb_CAktjY9O6mAwi4iWI2aH3qW8bYFoyYd23Q9N_yOmthVXmT5sZ-mgY4gZ_cn2adP6VRBqROyox-Qn_aEBj1Q54CUn3B1YL0e68D2WbjLZTtzlUcag1gCxSes_OzRbIwjpO', NULL, '2026-09-21 07:37:18', '2026-09-21 07:37:18'),
('99a2be3e-2d73-44d9-8c4c-a1f295ea2f7c', NULL, '302c5e50-9c9b-4b6b-90a8-92be0c448805', 'user', 'v1.Y8y2tUYUGBAWaHSs.wDdOYARQxQwlssQWOVZKUg.bXBQZXodRpZjuDsznm0qmLOwjVulm9N1IWJFq7OR4WzfKCnww4xbIatEBseJrv0YvNe5qihgDl2fqL3Udhcsn1tmPM05UFQZgxivkDOge5pr-GUIAb4_NtePQN-6UOA-dbVb46H9siC3E_JRTeHWkXy5MurPHg8U1AkGLaVa4sg', NULL, '2026-09-21 10:35:55', '2026-09-21 10:35:55'),
('9a9157d3-01c5-49b4-b65f-37a02a2fece2', NULL, '302c5e50-9c9b-4b6b-90a8-92be0c448805', 'user', 'v1.nM6nE0TKN9q_SdL5.r9QxqbgfiXFBzWHb7HcS7A.NAFeMnvZ7iDryQtGe70amInolWlCmSwTKlnuzbe7rHxp1BIkGR7Th0rAguK4f3iz2hdyqNRiAEqZwsarSocCkMnrwA9rtLQNYZVnY2gyPIRWCRR8w2BK9AV-6ms2BahHbePWEp0-UXdp_xyusjOm-3XlRnP5tfIFwUpM4E3193G8bPjh', NULL, '2026-09-21 10:35:30', '2026-09-21 10:35:30'),
('a06a5ee4-8fe8-4998-bfbf-397213460ae0', NULL, '302c5e50-9c9b-4b6b-90a8-92be0c448805', 'user', 'v1.BW02Jw3fHQL8dr3A.9Hs2Yq5TZ4DnXP5huN9XUA.OpBRMvqpfAfRdMKGev9Q7UDxzNo2MyXm3wpq9vjrbSjBnNaEK6RKkgtiOOHoKuWolkqMfRkSBNsscwIxH___iD7ymmCE8DdVGqSu1c2zkpo7pjcnSff5cgbff2wttRsyYmgquZuxQbuWyj0N50vmrKFuRzwKfveMp4ghq3zvxOKW1BLVTnw-zsQg', NULL, '2026-09-21 10:26:57', '2026-09-21 10:26:57'),
('a0ac2776-4de2-4341-b88a-b03e53b4e3e0', NULL, '302c5e50-9c9b-4b6b-90a8-92be0c448805', 'user', 'v1.V4eZkxc5txHADdXc.0j_8BAb3kveSj3p_Tedcgw.mVVxHyFP9bFTfqI8bknOMdvnp7OMK3iskg541Ob6QrTT7tQAGa2QsmJx1XpVk0G7qchbGwLZYUZmPKNZf18WVnycdJEu1ZT8hrU238Kg48ZLMqvIwklxMGSwD8h4dJrKpB4ECqEQDDaeI067xrziNubGBklJp18BW29MLau42PV_F3FAbKo', NULL, '2026-09-22 05:04:14', '2026-09-22 05:04:14'),
('a152957e-64f3-47d0-bfe3-7ab631f54681', NULL, '302c5e50-9c9b-4b6b-90a8-92be0c448805', 'case', 'v1.kzYEKJfcuPq1rErW.rD5tLUK3K18q9slrgxJ5Og.UTTwL8D5hx0ygIUolohJY55x28BG9o5Lfr4g4-85SUYxLfn7Y-WT3B11dX0JcyKOGLfKnRN-2M4W44yQIRUoML6uVbJVEvNx8bAXuTR1Sj0vpCtNUR2fKPzf2r07igXGGGxvJI-zQDsykpY7gvoBJ2ilaZNHsRhGBeTQmNuDFJ0lU9-I', NULL, '2026-09-21 07:37:18', '2026-09-21 07:37:18'),
('a40906f6-a3da-43a1-ab2f-f23a3cffc19b', NULL, '302c5e50-9c9b-4b6b-90a8-92be0c448805', 'user', 'v1.v5a_16_eACEL8a6g.9SmBHxkizuZFSiaPuvtBzg.58c0TOINTOc0wTwbBoqMAgLZ_ViPXtk8VxR5pL8sK5r0VE0eUEmFQkJufZpEGXE09x5Fi3H1QWitgAIuEZXEAMGEr9W1qE3KjpiRoLjLMNmD_vhfPO5sxaopEcG6Ck3W7yJFQT8-ZDxScuH-vhibUAz4vQgcH1Gwu4JaHVO5drdWdLgex338X3ccvaDxLA4NWIUuhA', NULL, '2026-10-08 07:54:53', '2026-10-08 07:54:53'),
('a5ca0497-d57d-40a6-a31e-d07c72db0716', NULL, '302c5e50-9c9b-4b6b-90a8-92be0c448805', 'user', 'v1._szTv8OSnnz_fn57.poIcOAl0SWDrc98u2kXv0Q.vqym738UZcwzaUfI7tieEnpnNEbtT9sVyCdzEnQwzoivOD-rV22GSRG3b-4ta31SdNzFJjIVnqfPsG8f60q_JfAloNT3wL2WhS01BhOjrQ0Lo48hskhLUIUHS9SaqKyCe50WcDyDUHV2M2T-XRFYllRxFrEMA2oukEJrUsm4uzVXsDG4xtz4YhZ7M8CFROZ0bN_hiK3UxCQV', NULL, '2026-10-09 15:41:57', '2026-10-09 15:41:57'),
('a6017497-2e9e-400f-acaf-2c79dfdf0a3a', NULL, '302c5e50-9c9b-4b6b-90a8-92be0c448805', 'user', 'v1.gnWZ-GSULQdwpAQB.zWQWc7mUo4U1mCVCjpvycw.zCmx9NzL2djMZbZVVYkQw6K21DoV5A8LSyY2ZyxEreNpZSBxpxfFRNzJ_tOHr4STOlWtUQr08H3taliursAuTl8CAmOLNDT5XJ_A72oxvteq7-xC5w7ATTgIeKeap4HjGYx0hzgqimyq4YYVZ6_hSTdM0yV1GbSVfPo3Sf-sKMwrz1Yp_Id1FfsVk3mrTJ3WJ20x', NULL, '2026-09-21 10:36:29', '2026-09-21 10:36:29'),
('a8f2f6bd-50a7-4713-b621-0cd9543209ba', NULL, '302c5e50-9c9b-4b6b-90a8-92be0c448805', 'user', 'v1.aDJqWTIGKR8s93g3.29C1M01iJv3h1LovaIrrhA.XOmEuPhrjPOgDqMLK5COrDJz82J-0Uhmiz4RETX9htAweoRZRZRBIFiF_7hiraW7YqdkND00TpkVyaQo4HC__gGCcIxkYA5_iJ_Raa_xp8XU_NfUVU9S3W4rgOVsuZbuwXnrNpon9ickqTjrpL94rpto37JzNappoDmQbjRN4GkeYGid9A', NULL, '2026-10-09 14:39:19', '2026-10-09 14:39:19'),
('a971c177-e0a8-4ce9-ae64-32cd96899eac', NULL, '302c5e50-9c9b-4b6b-90a8-92be0c448805', 'user', 'v1.BLdEVy0gLzbfVHLa.pP69VHFn6Jy0OS5O30x_Yg.ysGwZKpLF-BeBVJzQcII8wa_gyN6DV-udqQ14UCqVjdb1GelyRN37yXxDQHpnkredb7m6TN_vhr9MW5w34sf2b8MUsrQU05wgxKtDXD_aTWvKu90Gd6yM_le99p3UA1wS9Wury-l7kXwuUlO2I3Yty-oVFAPu0xY1BaXJ2yP6DpxMk7S7Q29NjI', NULL, '2026-10-09 15:09:10', '2026-10-09 15:09:10'),
('a9a8aca6-c2d4-4f02-9084-629782d318f6', NULL, '302c5e50-9c9b-4b6b-90a8-92be0c448805', 'user', 'v1.tXnSgO0ZLZfT8VNP.yETBD0vE5wDfhojWs8MOHw.ETnAFjBIu9M7aWvlVAyGlD6u0RMPZZxz0gl2pI9wodR1R0TiLp1nXmrR-xv2egXGUSZV0Ak1f7h_vpV3T79-I4FvmdESCmEP07QaJ5BqKyp_K3irIL743fWmTNt3nrY0jhOR4R2_yvZbduFPG-jEPh6PdG7T3aewKMbcE6gFzMUvBYsWj-pf74KtsjnYRcydZOMg9bilzCcV', NULL, '2026-10-09 15:20:51', '2026-10-09 15:20:51'),
('ae54a31a-6ad0-439f-8a10-a6832495b47e', NULL, '302c5e50-9c9b-4b6b-90a8-92be0c448805', 'user', 'v1.KaM6clnL5dtzY0Z8.9prI95ZixJjMnJ8cqrjdZw.2kr2P7r6oQxiw7_6lfpMA5BRX03tCg-oBvFH2fwpmdHZZ-IYRcnx8R5Q4sEeLWFbcfifBqu4LrlGoaVAky8NHxajKwL7QriA4o1tbWD5nWB6HoFFnTLhrTM43C3eu8ONulJtkpnCV8h6x1AApERdjwb4XvJLK-wrpEmmoXwPqnBA7om8ae5eOtE8gRqFjNsWo5yNfAPeo0baSSaV3RH-xue-mZmx-_itlcSYJzpwud-JwO1BZeE', NULL, '2026-10-09 15:08:24', '2026-10-09 15:08:24'),
('b009fc16-7d7a-490d-a332-bddf5e3fd99e', NULL, '302c5e50-9c9b-4b6b-90a8-92be0c448805', 'case', 'v1.niK42Yz5vGKnmtAy.9GaWUtGHxdWSjOpArtHkWQ.H32Sk_d3XROv77BGkp_u9PWIEb4Nyq5Td2syen06q0p9U37ZoD-c31qSKsAAb_53S7eVqcIEz2O6xaej-XtDNW-OpcdnziE49-DGG9Bn9s385IACyJlVkvnYCIW-x_r4N7bA7XvuQ447zSSLu3SOprNajGatllpki15eqKTEljz2jQ6l', NULL, '2026-09-21 09:44:55', '2026-09-21 09:44:55'),
('b2fdb604-7d71-48a1-849a-c9ef2af00289', NULL, '302c5e50-9c9b-4b6b-90a8-92be0c448805', 'user', 'v1.Jn-_5owYyAlTfTC9.mqSe9N3mZ3wR6yZbRET_Vw.UQu3exUu8m_bKqMY3s5tgFEyfHQuX39cHu3LfI0tCciln7fF7CY9RmkG_HbnEdinszBlHeUXsxJL1RdYlaHXmGkE6mkvpMSZKfdqeS1Xa2t3RK2jbrTg_kQf8kuwDUedjLA2xOCvk29lFQY1il40PWOsqBZNqtl70m1Vp4Ibyzj3_Lg4JuyNxniDuhEF', NULL, '2026-10-08 06:53:23', '2026-10-08 06:53:23'),
('b5d73949-6cb8-4cce-ab2b-5b95191fa982', NULL, '302c5e50-9c9b-4b6b-90a8-92be0c448805', 'user', 'v1.fMA3RByK2rA1yBfl.xsFhCRNfCg2fqDEGVEIO6A.NSsMILz-QVzjwr6R36I04UqQo--1_C5IDFJwiy28OKWWYfpa0Erse4E5i5MRhKeOhblmuATWcf4xYvXEb4cqju4oduGEpzitkcZWVrdVp9tP7Wchnmr_j15ZY1251j6PMFlB7TFzlGwI98PP4zsQDeyFjiqtTuCKm6azVQNGrzqjhcrHhaelrHT7R5xorOA', NULL, '2026-09-21 10:13:03', '2026-09-21 10:13:03'),
('b62da8f0-cb65-40b2-ab8d-77396feb33d5', NULL, '302c5e50-9c9b-4b6b-90a8-92be0c448805', 'user', 'v1.j2GXtdGFNFtsbHMa.HlP1Pmv0JQJJEShYVOAGmg.-NTVb8BwDnOwburLhOfS6X9tILgPSPMp_0bcpGUCYsysFZ7gw1yNaOTJzbAGFxorXX3jtVRA6rMxJTFslh9zIZCwfxd0HnEublxBy0LYWQwaZrxrOjT5D5L3n8lLKmnjXjsDC1S9flDq2QVNoyFWe35dSPWia4Mgcz3geiap4Ol1UZKzIQ', NULL, '2026-10-09 14:50:31', '2026-10-09 14:50:31'),
('b6bd17bd-a3e6-4cc3-adad-a8afea83af6b', NULL, '302c5e50-9c9b-4b6b-90a8-92be0c448805', 'user', 'v1.qOcQIpuS0nvkuvYd.7Yt7Yua6P5DgeqzOJ8_n6A.p-_OpWZJfa1GNtj8deXE34RcyYz3oHW0mfXR7gjfTHNlZcCZr-XLNAlwrGXkKOpMRiB5AM1E2khCzHQu2iC4mo7yXZBtst-GySYBR2piive8aar_crcyDJtG3_yuDeY0ccurD9ddfoSYD6F7t78_7u1gdrs2z0ucz0EGwrwpIN7dJUjXnUMV1CRX392xhGrnrfpOyRc', NULL, '2026-10-09 15:02:30', '2026-10-09 15:02:30'),
('b7af03e5-58dc-48e7-a91c-639b84005901', NULL, '302c5e50-9c9b-4b6b-90a8-92be0c448805', 'user', 'v1.wmY8qZ2qt2kkda2l.0IcYRgyu2p_FK3ki6orOHw.xHs66AYaAJ7_cx2CwNc5oy8K351_cCiIvtB2TJczzhKg9WGnCtYt2UPUDCWVvKYp37tqEhKFav4pr5SxkyKO7oJZRSY64i2XFSLiO1phVYB_KlMrbU2304O_YrSPHfzDjBIylbxk2RZMQNcCmKu6AIavAekBVq7RHHKYxxUTSSCAfdTNbwTvZjQBJqRL5KAw9BNA26MAMA96', NULL, '2026-10-09 15:06:44', '2026-10-09 15:06:44'),
('b7cb185e-14cc-4e9f-9a02-90d147d3f049', NULL, '302c5e50-9c9b-4b6b-90a8-92be0c448805', 'user', 'v1.1QUj7cVxv9Knd_bc.Z5Iz17cU3Jh7mwjKPcKdRA.jfoWgwLwrfjVqZ10dHbtcL-L_XN4tssj6yTdP-gqO9sJS0cdblN6tfXtgbYeqqJns90RtRHyYQ-QOSzCiB3LW1qSTrkQ3HS2BCzIFacvBYUovQfz5naxGpIfsiu8fNj4ijy8hoKAeBQVxRGfcfeJ-8Rlm62sA3hH1xX5D7gbSmBDSL3vpmUAllwnWvMdODjhsv8VjDO4fpqp', NULL, '2026-10-09 15:25:37', '2026-10-09 15:25:37'),
('b91a4b88-cfa7-4f30-98fb-b682c0c49a28', NULL, '302c5e50-9c9b-4b6b-90a8-92be0c448805', 'user', 'v1.MuCINu8mucLQ6J-6.E8gU-TLtIdBwN_vSJZHUsA._AP7nTpUjY_vfS8H6GiPOTLLO0igrQlajUHUpY59VJNFOjOjK0INfI5olC_-88RVbNvMU6l3bzeX0o4pTkr3hJtHZ_4MGc_3vomW_7flKagnsNS7Puuy_X1tOikjEoU8457-O2Ofy6pd7w_DcQjhJzZ2ksrOHRx07FY4m8ArfnYcnIM_idM7Rvs5uzTkrFqtCNKlKQ', NULL, '2026-10-08 07:50:19', '2026-10-08 07:50:19'),
('c6113ef9-5cc6-44e1-85d4-290c97b1b599', NULL, '302c5e50-9c9b-4b6b-90a8-92be0c448805', 'user', 'v1.x9tMS1zgY4aLwDgy.rfvm3tsrruyu4mzGuSXTgQ.5WZb0pbKPb7E3nHdOgJ0fhQvuRm_nWuvd1h2IPEAs8eMueIBzvgwYv4xTJtNo5LLu68D1uy9l-VsePWmJ5755487cduj0k90qwJfRXO3Nbqpm_V_1FlLs1dfdVPeePLMCBK9zvsxKODtCSCQ_91gITWOkZVpCusJAAXRYLGyvgJsTW0kBH4RcQEF_g3NiDgdJlUMNRnFrYgr', NULL, '2026-10-09 15:35:43', '2026-10-09 15:35:43'),
('c764481e-862d-47c7-8731-bd596f94af33', NULL, '302c5e50-9c9b-4b6b-90a8-92be0c448805', 'user', 'v1.Wtn2yg-zTEaKhUGe.RapzQBgvA-VA8YUj8K-Llw.XVz01A-myUEerZj27Mg7iT5KXPJWVedKNJF09amf7l-4Kfd4uk4_iluGQlbMNFRwEroHU0zSUNyv7EBLl2YALuiUCDcEYY0I5tLbjRR2JBMdpCP0OqP-mYxkcO3b89XsqktCuh8UgiiXQ0fUWVlH2RN9d11fBXTNUhq4VYoahQqayN6PG9ZAXffkFVXVXlFBbkCs', NULL, '2026-09-21 10:36:29', '2026-09-21 10:36:29'),
('c931db94-7c21-477e-b891-46f78112904a', NULL, '302c5e50-9c9b-4b6b-90a8-92be0c448805', 'user', 'v1.PDPMdiCl38_9GJnY.o1JOorAy8yGstVjPPitPVQ.5WI4T7pnS7G2ZiQY2G87Eg_Y_RtwOc7g0sg2U4hA6D5xI72i-92lz4TUgAlLxfw7JXOlRkjX37hY19-K6R7unGbScFAFymRmPOI7arK1zU7O7XZfgxPvlVNEQRCu827QSeVnd7tRUrRAnKiQ41VYgirkHsnrS96N2znU', NULL, '2026-09-21 10:20:27', '2026-09-21 10:20:27'),
('cbe74895-84d0-4af3-9436-17d9f8516bcc', '7b833a0b-34b8-47b5-a35f-f27c4d1255a8', '118910f9-684e-40c4-91fc-e7038e803d53', 'case', 'v1.W4DzbDUNj4DAsE2E.Il1DN8FUpjaTp-Szs82Jlg.q6yV_11Ukc9dKZY727-1oc5LO30iL6sJ6ubF3haKOQ6Z-DWtOnvmVdGStgWdWjkoVk_4dcAt-DbVJZUZzXYCI3QTcP5WIRHdnowdxlB1P-zXrj1zcfng_AyAC3TDrSIs-TutObQ91b6wzikiI8SLwgof2X2lz9FuFmmjcRWTEBu2EckzzpJnn-cQ0YpVr5QKQtvswdPl0YFiAxkmxyCpWGDoihHmFj3ijxkbOEtrgZ7j6pExKiQ50O4_dtDg0212QKvq8QRA5zYU4jS9RaYl', NULL, '2026-10-10 00:48:39', '2026-10-10 00:48:39'),
('ceef3e65-9dd0-4cbd-a069-da19e35b7f37', NULL, '302c5e50-9c9b-4b6b-90a8-92be0c448805', 'user', 'v1.uatJHYxzuiVp2Z3x.sD5ZcqeFqpVBZjqZ31n5Pw.ofkk3EVd3axtrsAR4QHs7ICqbaVJjon_Q6DblKOiBI-yDD0y2vz1oXa5DiqP2clWTq8Gko7dJ_6oDOA4JlEDZNupTk-_xG8g1aVW9Y4A-BpP2rKr_kFzZK6RC0HMpJcdF24yjJfjx0Gk6fQgUVbJCu2zVqU9j5vC67PFD0gN1yBYinaqx0g9b5M', NULL, '2026-09-22 05:10:06', '2026-09-22 05:10:06'),
('cef9881d-1b67-4ac4-82da-147f8b64203c', NULL, '302c5e50-9c9b-4b6b-90a8-92be0c448805', 'user', 'v1.dWfCtYrv_2M62cbz.IzcKTH7A0BxZAgNcjptpiQ.rlXGG1UvnRPi-XtHw8uhqOD9zps16qR5Qmdd7hOK9YkecVPK0SIdkwmbsovU115FbeksX80P3nYOicdxmmhIxjCab341pZ8gl3N71DGr5ZaH68DiczoJHTJS-oitmUO0WYp3s2RkaLDAXE0eqyOmPEny2jEplhk_YyAGQiJK-Qs_HW0uuEB62I0tIt7gdnnb8U1x2Q', NULL, '2026-10-09 14:34:41', '2026-10-09 14:34:41'),
('dd06aaa3-3dc3-436a-86f2-699ce9bd4ee4', NULL, '302c5e50-9c9b-4b6b-90a8-92be0c448805', 'user', 'v1.CJF71R6y0-R-xRzD.rf5Z9CFW7XCRafc5DMU_jA._L0NQsM1FSSl1FfmBtQ8-x7P17guMk4pj9kiZhH6ZDQhMJgXKc3tzK0Py56-fAGXWstyqXiDH2FkhV97g57e7nZUFQjIAPKQq-JLqP9W2XB9xWQ-Qq8D3LjBjMag-pn8kgnbu8eHR_TprCzE9SBK3WCNL4M5lrr8s6FYj01Q67n7b8EuSLidde8', NULL, '2026-09-22 05:10:07', '2026-09-22 05:10:07'),
('ddeb929f-1d88-4ff9-a82a-f87d3fdbc224', NULL, '302c5e50-9c9b-4b6b-90a8-92be0c448805', 'user', 'v1.Wz4LQj2Mhn1TGOiU.NIhbXFM0tHNrHyeZG9KItQ.MpmHb5_hxaR9T3gF16L_aGoRCd1MzcVzmZjUHLmrnAUoRWxOqBHDwOnRDuhya-8RtPQpahNy0LSvXoP4r09sO-mlGC1uZNDBjfGuBF2ZYXSrjAk687NUspIEEowG9chz5EYYexAvKkps8h9QKMFMu_XbqqNGA441mE4LDvFxMA', NULL, '2026-10-09 15:03:14', '2026-10-09 15:03:14'),
('e0e2d187-f827-4e07-8e7a-16041503970a', NULL, '302c5e50-9c9b-4b6b-90a8-92be0c448805', 'user', 'v1.JHWXhVpJaPTt4fkP.Ggcu85kor0VkRCvmTBz3qA.lQ2nHDO6-xy2TZhE9ulrTn4_Brjaw8xskinr5BmWmfnj9SezrCkwqp7zjxPRIqtOPkz8rOKEo0foMr4Q3rtMJXBBAbP95d9mXZRETaTXVxauJk8I5QZ1BswS_fvBlLnvXtef-LaN4o6Bjyl_CxSfpXmibMUASh6rZfnkcEqf7irf013KzDuML6I-8yh035PIXpkOXg', NULL, '2026-10-09 14:34:37', '2026-10-09 14:34:37'),
('f420f730-c9f5-4d40-8888-887cb130a816', NULL, '302c5e50-9c9b-4b6b-90a8-92be0c448805', 'user', 'v1.MFCbU4cYpicatMJ2.zF1SDeuxR9GHFCva8ZTK0Q.cDKISfNd0TZWvzFRYvZTYTF7bsdI8F3gfn_uxn81kTRZC2_uFqZ8jGonv2JzFOGppay9SRh-9PeKuq9W3C48svyNM9Vroh_44THhfmy9o9nTGV2ndtiLTbopzIuzNXh9w6Q5RoqNwwkpyeuqGAVB_WJGjTgp3sg6ibsA4RcWKiE5mQEE', NULL, '2026-09-22 03:49:06', '2026-09-22 03:49:06');

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

--
-- Dumping data for table `notification_archives`
--

INSERT INTO `notification_archives` (`id`, `notificationId`, `userId`, `createdAt`, `updatedAt`) VALUES
('0838a2df-2675-4f46-a1c7-b784d99ebabf', 'security-e5d82b80-7378-4c79-ab92-487c280804e1', '302c5e50-9c9b-4b6b-90a8-92be0c448805', '2026-09-21 11:31:50', '2026-09-21 11:31:50'),
('08bff3d4-1caf-4c17-a684-7048a703b25c', 'security-6419a1ac-cfc6-4e96-a573-eaa3421bb307', '302c5e50-9c9b-4b6b-90a8-92be0c448805', '2026-10-08 07:50:45', '2026-10-08 07:50:45'),
('243a41a4-f889-4e7d-846e-77ab052e5e84', 'security-f4aaedb4-a619-4a0f-84ad-0fa4c83dc449', '302c5e50-9c9b-4b6b-90a8-92be0c448805', '2026-10-09 14:31:43', '2026-10-09 14:31:43'),
('2620fb38-083e-4f6c-b653-8c411b5c709f', 'security-b184def8-034a-4907-a2d5-f37cbbcb48d5', '302c5e50-9c9b-4b6b-90a8-92be0c448805', '2026-09-22 04:24:43', '2026-09-22 04:24:43'),
('2d31af44-857f-40ff-b8c9-2229feb4ce2d', 'security-57c5bc1b-1fa7-4749-ae10-afce8040c26d', '302c5e50-9c9b-4b6b-90a8-92be0c448805', '2026-10-09 14:31:43', '2026-10-09 14:31:43'),
('2d801cea-e970-43b5-b9ad-f7b3fc97219f', 'security-8d222964-10d9-41ab-a81c-742966e14205', '302c5e50-9c9b-4b6b-90a8-92be0c448805', '2026-10-08 07:50:45', '2026-10-08 07:50:45'),
('31cbc02a-d613-4c0f-8ce2-79caa3ddeba4', 'notification-b91a4b88-cfa7-4f30-98fb-b682c0c49a28', '302c5e50-9c9b-4b6b-90a8-92be0c448805', '2026-10-08 07:50:45', '2026-10-08 07:50:45'),
('36a17cb9-199d-4fad-99dc-fabb65b660d5', 'security-05635c6d-c9a3-4831-8159-f70a68caa3a3', '302c5e50-9c9b-4b6b-90a8-92be0c448805', '2026-10-08 07:50:45', '2026-10-08 07:50:45'),
('378aa16e-b7a3-412c-85a5-6088dc9a111f', 'security-b1cd2739-4895-4597-b5e0-8329c144b6ca', '302c5e50-9c9b-4b6b-90a8-92be0c448805', '2026-09-21 05:38:34', '2026-09-21 05:38:34'),
('3afe6e55-d398-47aa-a4d9-cfae0806a52f', 'security-b2151390-fda7-48c1-80b6-332d69d84602', '302c5e50-9c9b-4b6b-90a8-92be0c448805', '2026-09-21 10:35:22', '2026-09-21 10:35:22'),
('3c61b3a0-a076-404b-8998-572728991cc1', 'security-60e3f97e-6b6d-4d67-9987-236f3f35cd69', '302c5e50-9c9b-4b6b-90a8-92be0c448805', '2026-09-21 10:35:20', '2026-09-21 10:35:20'),
('472185a1-9b6a-43bc-b206-5ed795083a0d', 'security-6b862ce4-b360-46cf-a8b5-ff52d8d30824', '302c5e50-9c9b-4b6b-90a8-92be0c448805', '2026-10-08 07:50:45', '2026-10-08 07:50:45'),
('4f2ea32e-49c6-4cb7-bbf7-084f90406e34', 'notification-9a9157d3-01c5-49b4-b65f-37a02a2fece2', '302c5e50-9c9b-4b6b-90a8-92be0c448805', '2026-09-21 11:31:51', '2026-09-21 11:31:51'),
('52e76c72-7c01-474f-a069-e1f818365339', 'notification-a6017497-2e9e-400f-acaf-2c79dfdf0a3a', '302c5e50-9c9b-4b6b-90a8-92be0c448805', '2026-09-21 11:31:49', '2026-09-21 11:31:49'),
('53249b81-efae-451d-898d-708b30035d7e', 'notification-ceef3e65-9dd0-4cbd-a069-da19e35b7f37', '302c5e50-9c9b-4b6b-90a8-92be0c448805', '2026-09-22 05:10:49', '2026-09-22 05:10:49'),
('58adcd6d-ba15-4fd0-8978-f4f45d8fbefb', 'notification-5798e15d-ef52-411e-b2ce-5064ba37d1f6', '302c5e50-9c9b-4b6b-90a8-92be0c448805', '2026-09-21 10:35:19', '2026-09-21 10:35:19'),
('595e9c34-d7c9-4430-9baa-530bcb3c9c98', 'notification-a06a5ee4-8fe8-4998-bfbf-397213460ae0', '302c5e50-9c9b-4b6b-90a8-92be0c448805', '2026-09-21 10:35:19', '2026-09-21 10:35:19'),
('5a371ad7-5474-478c-a39e-afdc25dd100f', 'security-49437446-97c5-4f48-8efd-3a3c97687df1', '302c5e50-9c9b-4b6b-90a8-92be0c448805', '2026-10-09 14:31:43', '2026-10-09 14:31:43'),
('5c003015-b7d2-4dd1-ad68-2fde98fb08f0', 'notification-a0ac2776-4de2-4341-b88a-b03e53b4e3e0', '302c5e50-9c9b-4b6b-90a8-92be0c448805', '2026-09-22 05:10:49', '2026-09-22 05:10:49'),
('5ea5780e-7cd7-4a48-8275-b86ae2634eab', 'notification-99a2be3e-2d73-44d9-8c4c-a1f295ea2f7c', '302c5e50-9c9b-4b6b-90a8-92be0c448805', '2026-09-21 11:31:50', '2026-09-21 11:31:50'),
('65f39f40-01b0-4ec5-bf44-79e455ebc65e', 'security-6f094879-882c-4e9b-b801-9576472587a9', '302c5e50-9c9b-4b6b-90a8-92be0c448805', '2026-09-21 10:35:23', '2026-09-21 10:35:23'),
('6b71823b-5e32-4bd8-a1da-babc5f89089f', 'security-3bd29812-ea58-4e2e-a3af-0219187140ef', '302c5e50-9c9b-4b6b-90a8-92be0c448805', '2026-10-08 07:50:45', '2026-10-08 07:50:45'),
('700a3fb2-eadf-4577-9814-5243825fc544', 'security-dd8775a8-b1a7-485a-8f5f-79da7b2dd316', '302c5e50-9c9b-4b6b-90a8-92be0c448805', '2026-10-08 07:50:45', '2026-10-08 07:50:45'),
('750fabba-84d1-4e92-9b87-4bc72fcdbb09', 'security-3635515d-67ea-4149-bb93-d312204cf270', '302c5e50-9c9b-4b6b-90a8-92be0c448805', '2026-10-08 07:50:45', '2026-10-08 07:50:45'),
('7c00aaa5-4032-468e-9600-d61093cb0f5e', 'notification-4379bbc2-9ac8-41dd-8893-8c86f9c9b833', '302c5e50-9c9b-4b6b-90a8-92be0c448805', '2026-09-21 10:35:21', '2026-09-21 10:35:21'),
('7e03067d-5a74-411b-9349-03672f5c8127', 'security-822ae4f6-aa02-4b9f-bc03-e34be201282e', '302c5e50-9c9b-4b6b-90a8-92be0c448805', '2026-09-21 05:38:34', '2026-09-21 05:38:34'),
('8a0ffac2-96f8-4bf4-b604-a5d3a111f47e', 'security-26b137e0-45d6-4469-9d60-fa05c47bcad8', '302c5e50-9c9b-4b6b-90a8-92be0c448805', '2026-09-21 10:35:23', '2026-09-21 10:35:23'),
('8a1ec058-f18d-46c3-96b6-8e75b3f35e9d', 'notification-239d5880-9b80-47c8-9168-204f5a55201f', '302c5e50-9c9b-4b6b-90a8-92be0c448805', '2026-09-21 10:35:20', '2026-09-21 10:35:20'),
('8c25aade-86be-4c5e-b833-9394b48dce5d', 'notification-c764481e-862d-47c7-8731-bd596f94af33', '302c5e50-9c9b-4b6b-90a8-92be0c448805', '2026-09-21 11:31:50', '2026-09-21 11:31:50'),
('99354c02-6ba9-4d80-b502-2ec65c8e3f56', 'notification-a40906f6-a3da-43a1-ab2f-f23a3cffc19b', '302c5e50-9c9b-4b6b-90a8-92be0c448805', '2026-10-09 14:31:43', '2026-10-09 14:31:43'),
('9e3a7cf6-64d6-456f-bcd3-34a5e1cbd2fe', 'notification-57222be4-130a-4906-ab6d-fa5e539ad465', '302c5e50-9c9b-4b6b-90a8-92be0c448805', '2026-09-21 10:35:19', '2026-09-21 10:35:19'),
('a8bf9d46-1cd5-46c4-b90c-eb1c0384676c', 'notification-b009fc16-7d7a-490d-a332-bddf5e3fd99e', '302c5e50-9c9b-4b6b-90a8-92be0c448805', '2026-09-21 10:35:20', '2026-09-21 10:35:20'),
('afdb0b4b-39fd-4c8e-b933-c1fdf7256068', 'notification-1a9ffa63-4545-41a0-86d6-e435431c22d0', '302c5e50-9c9b-4b6b-90a8-92be0c448805', '2026-09-21 10:35:20', '2026-09-21 10:35:20'),
('bb8ac2a2-c98c-4e40-8cb8-957d7e21898b', 'notification-978f6408-e77b-4d3a-9767-150f053ff8bf', '302c5e50-9c9b-4b6b-90a8-92be0c448805', '2026-09-21 10:35:22', '2026-09-21 10:35:22'),
('bf13e6c6-c1b4-4a20-b890-3b264bbfb4c8', 'notification-c931db94-7c21-477e-b891-46f78112904a', '302c5e50-9c9b-4b6b-90a8-92be0c448805', '2026-09-21 10:35:19', '2026-09-21 10:35:19'),
('c22a08ea-7b61-4109-a2cc-f6e34807377e', 'notification-a152957e-64f3-47d0-bfe3-7ab631f54681', '302c5e50-9c9b-4b6b-90a8-92be0c448805', '2026-09-21 10:35:22', '2026-09-21 10:35:22'),
('c22e74bb-c845-43e6-8d66-7b1a61d7f67c', 'notification-14900d45-0a82-4cbb-969f-d0702f12d170', '302c5e50-9c9b-4b6b-90a8-92be0c448805', '2026-10-08 07:50:45', '2026-10-08 07:50:45'),
('c57fc7d5-dc39-4835-936f-77cd01f4bdee', 'security-377c5106-6f97-4e33-871f-6389e907746b', '302c5e50-9c9b-4b6b-90a8-92be0c448805', '2026-09-21 10:35:23', '2026-09-21 10:35:23'),
('ca84b045-c363-4bc6-9317-701a96f95a21', 'notification-b2fdb604-7d71-48a1-849a-c9ef2af00289', '302c5e50-9c9b-4b6b-90a8-92be0c448805', '2026-10-08 07:50:45', '2026-10-08 07:50:45'),
('cb2ee088-c6aa-4d54-947c-b2d4b7d77f59', 'notification-23e0a13d-9c55-42c1-bc79-e2e9eae221c5', '302c5e50-9c9b-4b6b-90a8-92be0c448805', '2026-10-09 14:31:43', '2026-10-09 14:31:43'),
('da976331-4cae-4be8-941f-b9116fb5cb53', 'security-91878af8-3cda-4754-b7c6-6914197c2fe2', '302c5e50-9c9b-4b6b-90a8-92be0c448805', '2026-10-08 07:50:45', '2026-10-08 07:50:45'),
('dd305118-157f-4c71-b874-a2f353c92a94', 'notification-b5d73949-6cb8-4cce-ab2b-5b95191fa982', '302c5e50-9c9b-4b6b-90a8-92be0c448805', '2026-09-21 10:35:20', '2026-09-21 10:35:20'),
('e02b9441-8816-4c6a-9889-8c950e098474', 'notification-f420f730-c9f5-4d40-8888-887cb130a816', '302c5e50-9c9b-4b6b-90a8-92be0c448805', '2026-09-22 04:24:43', '2026-09-22 04:24:43'),
('f5e7491a-06d6-4aee-a388-5f33f52d072d', 'notification-dd06aaa3-3dc3-436a-86f2-699ce9bd4ee4', '302c5e50-9c9b-4b6b-90a8-92be0c448805', '2026-09-22 05:10:49', '2026-09-22 05:10:49');

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
('87d187fe-26db-45bc-b2a6-e5ae504b9565', 'Malawi Revenue Authority', 'wongani chakaka nyirenda', 'wnyirenda1996@gmail.com', 1, '{\"portalSlug\":\"\",\"industrySector\":\"\",\"retentionRule\":\"\"}', '2026-10-10 00:41:20', '2026-10-10 00:41:20');

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
('05f06f9d-e168-445a-87f5-febc4ceed3cb', '87d187fe-26db-45bc-b2a6-e5ae504b9565', NULL, 'primary', 1, 1, 1, '2026-10-10 00:41:20', '2026-10-10 00:43:47', 'wongani chakaka nyirenda', 'wnyirenda1996@gmail.com', 'scrypt$65536$8$1$TE_MVhEJqQG-llwSx5BAtg$z_CTp-zAdFVIBwakchiZdPsMb0t-e5-ct9EcGFjdaXaOkfk5CfVP9fTrpad2RaNUEC4tPCfwPISzeFDVBtRdIA', '2026-10-10 00:43:47', NULL, NULL, NULL, 'v1.8h5ec2lRRUHsyMwF.ph7bv0I3ePwTp232kljf4g.mnkTHNHhIsLktNJvFPWcm7NfkO1J3pW9XOpAchZLbDsRMZdppWqWmQ_e7A', '{\"version\":1,\"kdf\":{\"name\":\"scrypt\",\"n\":65536,\"r\":8,\"p\":1},\"salt\":\"VxmRwZsqGusqvHqJEHx57A\",\"nonce\":\"5o4zv85wTEJ5vzj-\",\"wrappedKey\":\"w7-oB5ZJEXwPYOA-UDp6paZJymGyfYo0aNZMqV11lyJraXztef7NEhDjjBmFTHv8\"}');

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
('42e46997-bf7a-419b-b725-a2c60b62a991', '7b833a0b-34b8-47b5-a35f-f27c4d1255a8', NULL, 1, '2026-10-10 00:47:35', '2026-10-10 00:47:35');

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
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reports`
--

INSERT INTO `reports` (`id`, `caseId`, `templateId`, `generatedByUserId`, `title`, `status`, `summary`, `metadata`, `generatedAt`, `createdAt`, `updatedAt`) VALUES
('b354a256-2c12-4582-a888-f3e60c1f0067', '7b833a0b-34b8-47b5-a35f-f27c4d1255a8', '054b217f-0d2f-4966-a64a-00b77540d608', '302c5e50-9c9b-4b6b-90a8-92be0c448805', 'Individual Case Dossier Report 2026-10-10', 'undefined', 'Generated from the live CMS case data for 10 Oct 2026.', '{\"generatedFrom\":\"cms-dashboard\",\"source\":\"manual\",\"createdAt\":\"2026-10-10T00:50:40.805Z\",\"reportOptions\":{\"includeEvidenceSummaries\":true,\"includeInvestigatoryNotes\":true,\"anonymizeReporterIdentity\":false},\"organizationId\":\"87d187fe-26db-45bc-b2a6-e5ae504b9565\",\"statusFilter\":\"ALL\",\"caseIds\":[\"7b833a0b-34b8-47b5-a35f-f27c4d1255a8\"]}', '2026-10-10 00:50:40', '2026-10-10 00:50:40', '2026-10-10 00:50:40');

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

--
-- Dumping data for table `report_audit_events`
--

INSERT INTO `report_audit_events` (`id`, `reportId`, `actorUserId`, `action`, `metadata`, `createdAt`, `updatedAt`) VALUES
('4800c76c-b624-4820-9658-a3a6dfffc95f', 'b354a256-2c12-4582-a888-f3e60c1f0067', '302c5e50-9c9b-4b6b-90a8-92be0c448805', 'generated', '{\"templateCode\":\"individual-case-dossier-report\",\"format\":\"PDF\",\"source\":\"case\",\"fileId\":\"64e267e5-7edc-4121-9528-33719b4bc1fd\",\"handlersNotified\":1,\"handlerEmailFailures\":0,\"eligibleHandlers\":1}', '2026-10-10 00:50:43', '2026-10-10 00:50:43');

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
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `report_files`
--

INSERT INTO `report_files` (`id`, `reportId`, `fileName`, `filePath`, `mimeType`, `checksum`, `fileSizeBytes`, `downloadCount`, `createdAt`, `updatedAt`) VALUES
('64e267e5-7edc-4121-9528-33719b4bc1fd', 'b354a256-2c12-4582-a888-f3e60c1f0067', 'individual-case-dossier-report-2026-10-10-b55077d6-1b5c-4352-acc4-8a39b4461b1f.pdf', 'C:\\Users\\Thoko\\Desktop\\site_updated\\api\\data\\reports\\2dd97cb4-db1d-4bf7-8376-3962dd07be46.enc', 'application/pdf', NULL, 973, 0, '2026-10-10 00:50:40', '2026-10-10 00:50:40');

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

--
-- Dumping data for table `report_templates`
--

INSERT INTO `report_templates` (`id`, `code`, `name`, `description`, `format`, `version`, `active`, `metadata`, `createdAt`, `updatedAt`) VALUES
('054b217f-0d2f-4966-a64a-00b77540d608', 'individual-case-dossier-report', 'Individual Case Dossier Report', 'Generated compliance report', 'PDF', '1.0', 1, '{\"generatedFrom\":\"cms-dashboard\",\"source\":\"manual\",\"createdAt\":\"2026-10-10T00:50:40.805Z\",\"reportOptions\":{\"includeEvidenceSummaries\":true,\"includeInvestigatoryNotes\":true,\"anonymizeReporterIdentity\":false}}', '2026-10-10 00:50:40', '2026-10-10 00:50:40'),
('833c8248-b604-43a5-ac85-cf3df2c8d05e', 'individual-case', 'Individual Case Dossier Report', 'Comprehensive investigation report with case narrative, evidence timeline, and supporting annexes.', 'PDF', '1.0', 1, '{}', '2026-09-21 11:38:35', '2026-09-21 11:38:35'),
('aefb46aa-fd9f-44e4-9575-a77317e83fd7', 'regulatory-audit', 'Regulatory & Audit Package', 'Whistle Blower Ltd compliance pack for internal and external auditors.', 'PDF', '1.0', 1, '{}', '2026-09-21 11:38:35', '2026-09-21 11:38:35'),
('d1d00584-e531-4fcd-a7ba-e0bfe1cd9b58', 'multi-case', 'Multi-Case Compliance Summary', 'Aggregate metrics, SLA audit, category breakdown, and risk review across selected cases.', 'PDF', '1.0', 1, '{}', '2026-09-21 11:38:35', '2026-09-21 11:38:35');

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
('1ecb045d-1d74-40a5-b78b-238c4fb6e2d6', '21185daa-99a2-43d6-8719-692bb0923d99', '2026-09-21 11:38:35', '2026-09-21 11:38:35'),
('1ecb045d-1d74-40a5-b78b-238c4fb6e2d6', '359c6148-c9f5-42e1-934c-89d06d430c28', '2026-09-21 11:38:35', '2026-09-21 11:38:35'),
('1ecb045d-1d74-40a5-b78b-238c4fb6e2d6', '4118c990-749b-4da4-8768-0dd04b7cf74b', '2026-09-21 11:38:35', '2026-09-21 11:38:35'),
('1ecb045d-1d74-40a5-b78b-238c4fb6e2d6', '6834d7e1-c407-45e4-b72b-be90915a448e', '2026-09-21 11:38:35', '2026-09-21 11:38:35'),
('1ecb045d-1d74-40a5-b78b-238c4fb6e2d6', 'a3f3a11a-2286-46f5-818d-e9e7a499a47b', '2026-09-21 11:38:35', '2026-09-21 11:38:35'),
('1ecb045d-1d74-40a5-b78b-238c4fb6e2d6', 'b52ee63b-31ba-486d-9068-3fe1ba080075', '2026-09-21 11:38:35', '2026-09-21 11:38:35'),
('1ecb045d-1d74-40a5-b78b-238c4fb6e2d6', 'e8b3e1da-9bc7-4186-b820-3b82d8ab00e2', '2026-09-21 11:38:35', '2026-09-21 11:38:35'),
('1ecb045d-1d74-40a5-b78b-238c4fb6e2d6', 'f5f80de5-e628-4473-8f7d-738655263383', '2026-09-21 11:38:35', '2026-09-21 11:38:35'),
('1ecb045d-1d74-40a5-b78b-238c4fb6e2d6', 'f63a7abd-d73e-4525-97ad-45b9296cb466', '2026-09-21 11:38:35', '2026-09-21 11:38:35'),
('240148db-00f6-40a9-8dab-d21120c68705', '21185daa-99a2-43d6-8719-692bb0923d99', '2026-09-21 11:38:34', '2026-09-21 11:38:34'),
('240148db-00f6-40a9-8dab-d21120c68705', '38e23d7f-aa0a-4a9c-a23f-c0ce18bd989f', '2026-09-21 11:38:34', '2026-09-21 11:38:34'),
('240148db-00f6-40a9-8dab-d21120c68705', '4118c990-749b-4da4-8768-0dd04b7cf74b', '2026-09-21 11:38:34', '2026-09-21 11:38:34'),
('240148db-00f6-40a9-8dab-d21120c68705', '8733c667-f489-4fc4-b246-9357e94b0154', '2026-09-21 11:38:34', '2026-09-21 11:38:34'),
('240148db-00f6-40a9-8dab-d21120c68705', 'e8b3e1da-9bc7-4186-b820-3b82d8ab00e2', '2026-09-21 11:38:34', '2026-09-21 11:38:34'),
('3037b809-8fe6-4fb3-a3fc-6f5b4a0120ef', '15d19ba4-b2cf-409e-b8c7-545dda7525ee', '2026-09-21 11:38:34', '2026-09-21 11:38:34'),
('3037b809-8fe6-4fb3-a3fc-6f5b4a0120ef', '1608e84b-bc9e-4429-95fc-737ea7aef967', '2026-09-21 11:38:34', '2026-09-21 11:38:34'),
('3037b809-8fe6-4fb3-a3fc-6f5b4a0120ef', '479fa466-5640-431b-be2f-6d22e8022b59', '2026-10-08 07:53:57', '2026-10-08 07:53:57'),
('3037b809-8fe6-4fb3-a3fc-6f5b4a0120ef', '947cc1b1-9705-4268-941d-bde266c3f3d8', '2026-09-21 11:38:34', '2026-09-21 11:38:34'),
('3037b809-8fe6-4fb3-a3fc-6f5b4a0120ef', 'a6f35da1-f445-4708-8d13-9b725a679fc0', '2026-09-21 11:38:34', '2026-09-21 11:38:34'),
('3037b809-8fe6-4fb3-a3fc-6f5b4a0120ef', 'e8b3e1da-9bc7-4186-b820-3b82d8ab00e2', '2026-09-21 11:38:34', '2026-09-21 11:38:34'),
('3037b809-8fe6-4fb3-a3fc-6f5b4a0120ef', 'ec812df6-ea4b-4aa2-ad92-3328048cd56d', '2026-09-21 11:38:34', '2026-09-21 11:38:34'),
('41b3ec60-0f25-4254-ba26-91bc1b7db483', '4118c990-749b-4da4-8768-0dd04b7cf74b', '2026-09-21 11:38:35', '2026-09-21 11:38:35'),
('41b3ec60-0f25-4254-ba26-91bc1b7db483', '99e41976-a2e8-4170-8ac8-6b62224e39e7', '2026-09-21 11:38:35', '2026-09-21 11:38:35'),
('41b3ec60-0f25-4254-ba26-91bc1b7db483', 'e8b3e1da-9bc7-4186-b820-3b82d8ab00e2', '2026-09-21 11:38:35', '2026-09-21 11:38:35'),
('41b3ec60-0f25-4254-ba26-91bc1b7db483', 'f5f80de5-e628-4473-8f7d-738655263383', '2026-09-21 11:38:35', '2026-09-21 11:38:35'),
('41b3ec60-0f25-4254-ba26-91bc1b7db483', 'f63a7abd-d73e-4525-97ad-45b9296cb466', '2026-09-21 11:38:35', '2026-09-21 11:38:35'),
('941e2fee-9dfd-4a90-852c-ed0046e6a553', '21185daa-99a2-43d6-8719-692bb0923d99', '2026-09-21 11:38:35', '2026-09-21 11:38:35'),
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
('cbe4f906-78d0-47b2-a46a-6b03d0d8571f', '38e23d7f-aa0a-4a9c-a23f-c0ce18bd989f', '2026-09-21 11:38:34', '2026-09-21 11:38:34'),
('cbe4f906-78d0-47b2-a46a-6b03d0d8571f', '4118c990-749b-4da4-8768-0dd04b7cf74b', '2026-09-21 11:38:35', '2026-09-21 11:38:35'),
('cbe4f906-78d0-47b2-a46a-6b03d0d8571f', '6834d7e1-c407-45e4-b72b-be90915a448e', '2026-09-21 11:38:35', '2026-09-21 11:38:35'),
('cbe4f906-78d0-47b2-a46a-6b03d0d8571f', '8733c667-f489-4fc4-b246-9357e94b0154', '2026-09-21 11:38:35', '2026-09-21 11:38:35'),
('cbe4f906-78d0-47b2-a46a-6b03d0d8571f', 'a3f3a11a-2286-46f5-818d-e9e7a499a47b', '2026-09-21 11:38:35', '2026-09-21 11:38:35'),
('cbe4f906-78d0-47b2-a46a-6b03d0d8571f', 'b52ee63b-31ba-486d-9068-3fe1ba080075', '2026-09-21 11:38:35', '2026-09-21 11:38:35'),
('cbe4f906-78d0-47b2-a46a-6b03d0d8571f', 'e8b3e1da-9bc7-4186-b820-3b82d8ab00e2', '2026-09-21 11:38:34', '2026-09-21 11:38:34'),
('cbe4f906-78d0-47b2-a46a-6b03d0d8571f', 'f5f80de5-e628-4473-8f7d-738655263383', '2026-09-21 11:38:35', '2026-09-21 11:38:35'),
('eefb2408-974f-48d9-977d-bcb73dc14d32', '21185daa-99a2-43d6-8719-692bb0923d99', '2026-09-21 11:38:35', '2026-09-21 11:38:35'),
('eefb2408-974f-48d9-977d-bcb73dc14d32', '359c6148-c9f5-42e1-934c-89d06d430c28', '2026-09-21 11:38:35', '2026-09-21 11:38:35'),
('eefb2408-974f-48d9-977d-bcb73dc14d32', '3f85c9e8-13a2-462d-b9d4-0389d47bccf4', '2026-09-21 11:38:35', '2026-09-21 11:38:35'),
('eefb2408-974f-48d9-977d-bcb73dc14d32', '4118c990-749b-4da4-8768-0dd04b7cf74b', '2026-09-21 11:38:35', '2026-09-21 11:38:35'),
('eefb2408-974f-48d9-977d-bcb73dc14d32', '6834d7e1-c407-45e4-b72b-be90915a448e', '2026-09-21 11:38:35', '2026-09-21 11:38:35'),
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
('05635c6d-c9a3-4831-8159-f70a68caa3a3', NULL, 'cms_login_failed', 'warning', '{\"reason\":\"invalid_credentials\"}', '::1', '2026-10-08 06:42:29', '2026-10-08 06:42:29'),
('0953e606-ecf7-47e4-b262-7bf009cc6c53', '302c5e50-9c9b-4b6b-90a8-92be0c448805', 'cms_login_succeeded', 'info', '{}', '::1', '2026-10-09 15:06:16', '2026-10-09 15:06:16'),
('1913abb5-6023-4907-93e2-1aa9a220590a', '302c5e50-9c9b-4b6b-90a8-92be0c448805', 'cms_invitation_resent', 'info', '{\"targetUserId\":\"118910f9-684e-40c4-91fc-e7038e803d53\",\"role\":\"reviewer\",\"delivered\":true}', '::1', '2026-10-09 15:09:10', '2026-10-09 15:09:10'),
('24954de2-999e-4ec3-9c2f-827b2dacd837', '302c5e50-9c9b-4b6b-90a8-92be0c448805', 'cms_login_succeeded', 'info', '{}', '::1', '2026-10-09 15:19:57', '2026-10-09 15:19:57'),
('26b137e0-45d6-4469-9d60-fa05c47bcad8', NULL, 'cms_login_failed', 'warning', '{\"reason\":\"invalid_credentials\"}', '::1', '2026-09-21 05:19:18', '2026-09-21 05:19:18'),
('27f5e936-337a-47b9-b5ea-6d9044d758c7', '302c5e50-9c9b-4b6b-90a8-92be0c448805', 'cms_invitation_deleted', 'info', '{\"invitationId\":\"3b4ef54e-5882-4535-8d3c-40edec8b44d5\"}', '::1', '2026-10-09 15:06:26', '2026-10-09 15:06:26'),
('30314e7d-9bb3-45c0-a088-83b50a77d6ff', '302c5e50-9c9b-4b6b-90a8-92be0c448805', 'cms_login_succeeded', 'info', '{}', '::1', '2026-10-09 18:00:59', '2026-10-09 18:00:59'),
('3635515d-67ea-4149-bb93-d312204cf270', NULL, 'cms_login_failed', 'warning', '{\"reason\":\"invalid_credentials\"}', '::1', '2026-10-08 06:42:14', '2026-10-08 06:42:14'),
('377c5106-6f97-4e33-871f-6389e907746b', NULL, 'cms_login_failed', 'warning', '{\"reason\":\"invalid_credentials\"}', '::1', '2026-09-21 05:11:03', '2026-09-21 05:11:03'),
('3bd29812-ea58-4e2e-a3af-0219187140ef', '302c5e50-9c9b-4b6b-90a8-92be0c448805', 'cms_login_succeeded', 'info', '{}', '::1', '2026-10-08 06:49:59', '2026-10-08 06:49:59'),
('49437446-97c5-4f48-8efd-3a3c97687df1', '302c5e50-9c9b-4b6b-90a8-92be0c448805', 'cms_login_succeeded', 'info', '{}', '::1', '2026-10-09 11:47:05', '2026-10-09 11:47:05'),
('57c5bc1b-1fa7-4749-ae10-afce8040c26d', '302c5e50-9c9b-4b6b-90a8-92be0c448805', 'cms_password_admin_reset', 'warning', '{\"reason\":\"operator initiated password reset\"}', NULL, '2026-10-09 11:17:53', '2026-10-09 11:17:53'),
('60e3f97e-6b6d-4d67-9987-236f3f35cd69', '302c5e50-9c9b-4b6b-90a8-92be0c448805', 'cms_login_succeeded', 'info', '{}', '::1', '2026-09-21 10:12:00', '2026-09-21 10:12:00'),
('6419a1ac-cfc6-4e96-a573-eaa3421bb307', '302c5e50-9c9b-4b6b-90a8-92be0c448805', 'cms_login_failed', 'warning', '{\"reason\":\"invalid_credentials\"}', '::1', '2026-10-08 06:45:17', '2026-10-08 06:45:17'),
('6b862ce4-b360-46cf-a8b5-ff52d8d30824', '302c5e50-9c9b-4b6b-90a8-92be0c448805', 'cms_login_failed', 'warning', '{\"reason\":\"invalid_credentials\"}', '::1', '2026-10-08 06:45:07', '2026-10-08 06:45:07'),
('6f094879-882c-4e9b-b801-9576472587a9', NULL, 'cms_login_failed', 'warning', '{\"reason\":\"invalid_credentials\"}', '::1', '2026-09-21 05:11:16', '2026-09-21 05:11:16'),
('7123094e-1c9e-4a65-b148-023bb1e86e7b', '302c5e50-9c9b-4b6b-90a8-92be0c448805', 'cms_login_succeeded', 'info', '{}', '::1', '2026-10-09 23:10:27', '2026-10-09 23:10:27'),
('822ae4f6-aa02-4b9f-bc03-e34be201282e', NULL, 'cms_login_failed', 'warning', '{\"reason\":\"invalid_credentials\"}', '::1', '2026-09-21 05:25:41', '2026-09-21 05:25:41'),
('8d222964-10d9-41ab-a81c-742966e14205', '302c5e50-9c9b-4b6b-90a8-92be0c448805', 'cms_login_failed', 'warning', '{\"reason\":\"invalid_credentials\"}', '::1', '2026-10-08 06:45:20', '2026-10-08 06:45:20'),
('91137ceb-7b61-4cac-ab59-481aeb872d55', '118910f9-684e-40c4-91fc-e7038e803d53', 'cms_registration_succeeded', 'info', '{\"twoFactor\":true}', '::1', '2026-10-09 15:10:58', '2026-10-09 15:10:58'),
('91878af8-3cda-4754-b7c6-6914197c2fe2', '302c5e50-9c9b-4b6b-90a8-92be0c448805', 'cms_login_succeeded', 'info', '{}', '::1', '2026-09-23 06:23:42', '2026-09-23 06:23:42'),
('a257f718-f2db-49d0-84de-9d784dd2960e', '302c5e50-9c9b-4b6b-90a8-92be0c448805', 'cms_invitation_deleted', 'info', '{\"invitationId\":\"b92347ff-7cae-454f-a964-a95646b4d63e\"}', '::1', '2026-10-09 15:08:53', '2026-10-09 15:08:53'),
('b184def8-034a-4907-a2d5-f37cbbcb48d5', '302c5e50-9c9b-4b6b-90a8-92be0c448805', 'cms_login_succeeded', 'info', '{}', '::1', '2026-09-22 02:05:43', '2026-09-22 02:05:43'),
('b1cd2739-4895-4597-b5e0-8329c144b6ca', '302c5e50-9c9b-4b6b-90a8-92be0c448805', 'cms_login_succeeded', 'info', '{}', '::1', '2026-09-21 05:38:14', '2026-09-21 05:38:14'),
('b2151390-fda7-48c1-80b6-332d69d84602', NULL, 'cms_login_failed', 'warning', '{\"reason\":\"invalid_credentials\"}', '::1', '2026-09-21 05:19:28', '2026-09-21 05:19:28'),
('c91c0b73-e69d-49ca-8c24-3cbb1f1f8b1a', '302c5e50-9c9b-4b6b-90a8-92be0c448805', 'smtp_configuration_updated', 'info', '{\"host\":\"smtp.migadu.com\",\"port\":465}', '::1', '2026-10-09 17:48:22', '2026-10-09 17:48:22'),
('ceb2b2b3-45f7-4a7d-ac2d-1b04e0d0ebbe', '302c5e50-9c9b-4b6b-90a8-92be0c448805', 'smtp_configuration_updated', 'info', '{\"host\":\"smtp.migadu.com\",\"port\":465}', '::1', '2026-10-09 15:08:18', '2026-10-09 15:08:18'),
('dc146599-4da5-4feb-9f27-06b3faac572e', '302c5e50-9c9b-4b6b-90a8-92be0c448805', 'cms_user_invited', 'info', '{\"invitedUserId\":\"118910f9-684e-40c4-91fc-e7038e803d53\",\"role\":\"reviewer\"}', '::1', '2026-10-09 15:02:21', '2026-10-09 15:02:21'),
('dd8775a8-b1a7-485a-8f5f-79da7b2dd316', '302c5e50-9c9b-4b6b-90a8-92be0c448805', 'cms_login_succeeded', 'info', '{}', '::1', '2026-09-22 06:30:53', '2026-09-22 06:30:53'),
('e5d82b80-7378-4c79-ab92-487c280804e1', '302c5e50-9c9b-4b6b-90a8-92be0c448805', 'smtp_configuration_updated', 'info', '{\"host\":\"smtp.migadu.com\",\"port\":465}', '::1', '2026-09-21 10:35:30', '2026-09-21 10:35:30'),
('f201c9ff-5a36-443a-9be3-b07897db6c08', '302c5e50-9c9b-4b6b-90a8-92be0c448805', 'cms_invitation_deleted', 'info', '{\"invitationId\":\"9d6561dc-6be0-4f6e-ae2b-9d20c0799cbb\"}', '::1', '2026-10-09 15:03:14', '2026-10-09 15:03:14'),
('f4aaedb4-a619-4a0f-84ad-0fa4c83dc449', '302c5e50-9c9b-4b6b-90a8-92be0c448805', 'cms_login_succeeded', 'info', '{}', '::1', '2026-10-09 12:48:17', '2026-10-09 12:48:17');

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

--
-- Dumping data for table `system_settings`
--

INSERT INTO `system_settings` (`id`, `key`, `encryptedValue`, `description`, `createdAt`, `updatedAt`) VALUES
('bed60b59-6309-4122-bc52-f1b8355d7fe0', 'smtp.config', 'v1.stHtymDZTP_Sxg9A.X68NljMJcvOt8C514gHA7g.AY6tEVSeWWI4SByFiZ2G2OwoCkRW_KcYBaVmixt2RvKUnhy9mGPy_3sfBuM1bJCiPJDRxXdQjBMPrkoIc2WIUfsUaWeG_SB2uy05_GRuJedW9zReAT6NVN0r0xNZXcn1RHmtk7yUKZ6BKMTPuC9E2UDTiXGtpK1K8aCPZmPDXoalc8ZPyzBJerP2pUce0uS5QDD51euZvoEnZM7pxHcVX2FdSs8lH7zvOqjrvp5gByZXMZuE_Ep5FUFCTGtmgXlbdQ', 'Encrypted SMTP delivery configuration', '2026-09-21 10:35:30', '2026-10-09 17:48:22');

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
('118910f9-684e-40c4-91fc-e7038e803d53', 'wongani@whistleblower.mw', 'scrypt$65536$8$1$T64H3fIiDipHWll9KzBHPg$V2Cf4rYlmWzmublFLMRmBtwDQi5BqSnDcOb4azDc3My2hsZ5P8QdaIRTxo6sjBzWAImwMzxlfCWgVVG_qimPtA', 'wongani', 'nyirenda', '09af445f-8645-43ce-95fb-e78e8335191e', 'active', 1, NULL, '2026-10-09 15:02:21', '2026-10-09 15:10:58', NULL, NULL),
('302c5e50-9c9b-4b6b-90a8-92be0c448805', 'admin@whistleblower.mw', 'scrypt$65536$8$1$iuPQyI03MZ7zaeQ4iiINRQ$0axkxzhf59Nj55KsDPAv4DqZb_4-C6goDY4TEgEV5G50NJxsLvbhwCmJT4lKTz1__Zr1LN3eNagtDzlt-d-K6g', 'wongani', 'chakaka Nyirenda', 'bba3f3f5-6482-4ce0-8cd7-32e49ea858fb', 'active', 0, '2026-10-09 23:10:27', '2026-09-21 05:27:12', '2026-10-09 23:10:27', '+26599955469', NULL);

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

--
-- Dumping data for table `user_invitations`
--

INSERT INTO `user_invitations` (`id`, `userId`, `invitedByUserId`, `tokenHash`, `expiresAt`, `acceptedAt`, `revokedAt`, `createdAt`, `updatedAt`) VALUES
('3b4ef54e-5882-4535-8d3c-40edec8b44d5', '118910f9-684e-40c4-91fc-e7038e803d53', '302c5e50-9c9b-4b6b-90a8-92be0c448805', 'b73e029ae46edb592ec06cdd45275d23223a418fb82c0a988a949df3bcb267d9', '2026-10-10 15:03:22', NULL, '2026-10-09 15:06:26', '2026-10-09 15:03:22', '2026-10-09 15:06:26'),
('7caa700f-28b4-4850-9bca-4e2ff1d36111', '118910f9-684e-40c4-91fc-e7038e803d53', '302c5e50-9c9b-4b6b-90a8-92be0c448805', '49176eedad2ee315a2f28ea3e0730906cc1422cec3bc200c951fef7cded0367b', '2026-10-10 15:09:07', '2026-10-09 15:10:58', NULL, '2026-10-09 15:09:07', '2026-10-09 15:10:58'),
('9d6561dc-6be0-4f6e-ae2b-9d20c0799cbb', '118910f9-684e-40c4-91fc-e7038e803d53', '302c5e50-9c9b-4b6b-90a8-92be0c448805', '277e3c552f0f118b1ab322a574af429b4fee7e13425c651e4d274deed5cbd731', '2026-10-10 15:02:21', NULL, '2026-10-09 15:03:14', '2026-10-09 15:02:21', '2026-10-09 15:03:14'),
('b92347ff-7cae-454f-a964-a95646b4d63e', '118910f9-684e-40c4-91fc-e7038e803d53', '302c5e50-9c9b-4b6b-90a8-92be0c448805', '2f449240a8f07373ff6a98853533304328ba27c77093bf5f1d97168458975f22', '2026-10-10 15:06:41', NULL, '2026-10-09 15:08:53', '2026-10-09 15:06:41', '2026-10-09 15:08:53');

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

--
-- Dumping data for table `user_otps`
--

INSERT INTO `user_otps` (`id`, `userId`, `invitationId`, `codeHash`, `expiresAt`, `consumedAt`, `attempts`, `createdAt`, `updatedAt`) VALUES
('7f908124-18c3-4684-8be1-2f42c4b964b2', '118910f9-684e-40c4-91fc-e7038e803d53', '7caa700f-28b4-4850-9bca-4e2ff1d36111', '47c38e5820a79676f938d921f6fc0c0ddcc0ae4ce8703977814abe55b5de5d35', '2026-10-09 15:15:08', '2026-10-09 15:10:58', 0, '2026-10-09 15:10:08', '2026-10-09 15:10:58');

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
('0ac55e4a-0d66-4a6a-8de6-8f37f81e6080', '302c5e50-9c9b-4b6b-90a8-92be0c448805', '8f64463d217fc66a295632dbcd71096074152123e874e5fce1dfbfbe335f08c1', '2026-10-08 14:49:59', '2026-10-09 11:17:53', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-10-08 06:49:59', '2026-10-09 11:17:53'),
('2420babb-9f5a-4c91-8747-0eabc5530930', '302c5e50-9c9b-4b6b-90a8-92be0c448805', 'f753f27724d5f3b4e67d3f8949e1ede8b5ebf50ffc289dc46b2537fd03e6a6c2', '2026-10-09 19:47:05', '2026-10-09 12:47:55', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-09 11:47:05', '2026-10-09 12:47:55'),
('3772ae47-83fa-4faf-a5e7-40c08e1915c5', '302c5e50-9c9b-4b6b-90a8-92be0c448805', '6a60be59df795e983c45377cf1bb7114aa06b8b8011cd9418795b2292fcd3f44', '2026-09-23 14:23:42', '2026-10-08 06:48:06', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-09-23 06:23:42', '2026-10-08 06:48:06'),
('69d1623e-1d14-473a-b835-1814af9d4589', '302c5e50-9c9b-4b6b-90a8-92be0c448805', '059ebdd7f78fd1429c0eb4f872040fcd6a82c334cfe323c1bf57d3580f6faf14', '2026-10-10 02:00:59', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0', '2026-10-09 18:00:59', '2026-10-09 18:00:59'),
('87dd230d-ad72-4ba7-92a7-274a81732c56', '302c5e50-9c9b-4b6b-90a8-92be0c448805', '87f9885f8dae8070db792fdc2224e9063b0b860f3f0d88393ba6537bb6ced089', '2026-09-22 10:05:43', '2026-09-22 05:28:36', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', '2026-09-22 02:05:43', '2026-09-22 05:28:36'),
('8f241978-c268-45a3-a9d8-064a096fc06b', '302c5e50-9c9b-4b6b-90a8-92be0c448805', '4eb97c41f8416c086aff1309d4c1599f81335a0afc74e21346a8dbe9342e5dcd', '2026-09-22 14:30:53', '2026-10-08 06:48:06', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', '2026-09-22 06:30:53', '2026-10-08 06:48:06'),
('a9f65809-8039-4a07-807d-c592d56a1363', '302c5e50-9c9b-4b6b-90a8-92be0c448805', '44fb54b625a6962c9417753b206a34e74a01d55f36817949daeffaa50c0b045a', '2026-10-09 20:48:17', '2026-10-09 15:05:17', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-09 12:48:17', '2026-10-09 15:05:17'),
('ac6cc41c-fcb3-4123-af90-0a4b147be1d9', '302c5e50-9c9b-4b6b-90a8-92be0c448805', '49db4ed130d63d3b522d5e2b7d25e02a954459c3a052d3c9ed7c8f6029bdb7c6', '2026-09-21 18:12:00', '2026-10-08 06:48:06', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', '2026-09-21 10:12:00', '2026-10-08 06:48:06'),
('ac7bfbd2-85e8-4fd9-a209-bb2d0b6491f1', '302c5e50-9c9b-4b6b-90a8-92be0c448805', '739c2b58393dc8ba43759faa768642494267ae1c2cd9382006863e17b90f0787', '2026-10-09 23:06:16', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-09 15:06:16', '2026-10-09 15:06:16'),
('b3d74bf7-cdd6-4c1e-8769-ca6017068efc', '302c5e50-9c9b-4b6b-90a8-92be0c448805', '1acd2dc5c5dd5f70f831b087984b7fca3386a371a71c800988e9a4861ce7088d', '2026-09-21 13:38:14', '2026-09-21 10:11:37', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', '2026-09-21 05:38:14', '2026-09-21 10:11:37'),
('c64c5285-3be8-4d89-b475-a5572db635e6', '302c5e50-9c9b-4b6b-90a8-92be0c448805', '59efe2d6f3447207fed34580a74f07873b798581cb0bdeca4baff941453dc50a', '2026-10-10 07:10:27', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-09 23:10:27', '2026-10-09 23:10:27'),
('d3c77318-f242-435d-af8f-8d8c6652fcd1', '118910f9-684e-40c4-91fc-e7038e803d53', '780db0826e601f02a8745bd615d7a83b7d8b7c177acabd2be5565adc50646abb', '2026-10-09 23:10:58', '2026-10-09 15:12:21', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0', '2026-10-09 15:10:58', '2026-10-09 15:12:21'),
('fc5cb4df-4465-44ae-ad40-e75bddd05889', '302c5e50-9c9b-4b6b-90a8-92be0c448805', '827c38425f077f2cb14f11a4d05402e87a32bff38f1bbe36d950e8eeab358a22', '2026-10-09 23:19:57', '2026-10-09 15:20:21', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0', '2026-10-09 15:19:57', '2026-10-09 15:20:21');

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
  ADD UNIQUE KEY `caseId` (`caseId`);

--
-- Indexes for table `investigation_actions`
--
ALTER TABLE `investigation_actions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `investigationId` (`investigationId`);

--
-- Indexes for table `investigation_findings`
--
ALTER TABLE `investigation_findings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `investigationId` (`investigationId`);

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
  ADD CONSTRAINT `investigation_actions_ibfk_1` FOREIGN KEY (`investigationId`) REFERENCES `investigations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `investigation_findings`
--
ALTER TABLE `investigation_findings`
  ADD CONSTRAINT `investigation_findings_ibfk_1` FOREIGN KEY (`investigationId`) REFERENCES `investigations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
-- Constraints for table `user_sessions`
--
ALTER TABLE `user_sessions`
  ADD CONSTRAINT `user_sessions_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
