-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: 29 Mar 2020 pada 15.18
-- Versi Server: 5.7.19
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_sepakbola`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `ssb`
--

DROP TABLE IF EXISTS `ssb`;
CREATE TABLE IF NOT EXISTS `ssb` (
  `ssb_id` int(11) NOT NULL AUTO_INCREMENT,
  `ssb_nama` varchar(100) DEFAULT NULL,
  `ssb_lokasi` text,
  `ssb_situs` varchar(50) DEFAULT NULL,
  `ssb_presiden` varchar(50) DEFAULT NULL,
  `ssb_kontak` varchar(14) DEFAULT NULL,
  `ssb_logo` varchar(100) DEFAULT NULL,
  `ssb_googlemaps` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ssb_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `ssb_event`
--

DROP TABLE IF EXISTS `ssb_event`;
CREATE TABLE IF NOT EXISTS `ssb_event` (
  `ev_id` int(11) NOT NULL AUTO_INCREMENT,
  `ev_kode` varchar(50) DEFAULT NULL,
  `ev_nama` varchar(50) DEFAULT NULL,
  `ev_logo` varchar(50) DEFAULT NULL,
  `ev_tgl_mulai` date DEFAULT NULL,
  `ev_tgl_selesai` date DEFAULT NULL,
  `ev_jumlah_tim` int(4) DEFAULT NULL,
  `ev_jumlah_lapangan` int(4) DEFAULT NULL,
  `ev_tanding_lapangan` int(4) DEFAULT NULL,
  `ev_jumlah_putaran` int(4) DEFAULT NULL,
  `ev_jadwal_hari` int(4) DEFAULT NULL,
  `ev_jam_mulai` time DEFAULT NULL,
  `ev_waktu_tanding` int(4) DEFAULT NULL,
  PRIMARY KEY (`ev_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `ssb_jadwal`
--

DROP TABLE IF EXISTS `ssb_jadwal`;
CREATE TABLE IF NOT EXISTS `ssb_jadwal` (
  `jw_id` int(11) NOT NULL AUTO_INCREMENT,
  `jw_event_id` varchar(10) DEFAULT NULL,
  `jw_tgl_main` date DEFAULT NULL,
  `jw_match` varchar(20) DEFAULT NULL,
  `jw_tim1` varchar(10) DEFAULT NULL,
  `jw_tim2` varchar(10) DEFAULT NULL,
  `jw_goal_t1` int(5) DEFAULT NULL,
  `jw_goal_t2` int(5) DEFAULT NULL,
  `jw_jam` time DEFAULT NULL,
  `jw_tempat` varchar(50) DEFAULT NULL,
  `jw_wasit_id` varchar(5) DEFAULT NULL,
  `jw_status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`jw_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `ssb_klasemen`
--

DROP TABLE IF EXISTS `ssb_klasemen`;
CREATE TABLE IF NOT EXISTS `ssb_klasemen` (
  `kl_id` int(11) NOT NULL AUTO_INCREMENT,
  `kl_event_id` varchar(10) DEFAULT NULL,
  `kl_kode_tim` varchar(10) DEFAULT NULL,
  `kl_tim` varchar(10) DEFAULT NULL,
  `kl_poin` int(5) DEFAULT NULL,
  `kl_kalah` int(5) DEFAULT NULL,
  `kl_menang` int(5) DEFAULT NULL,
  `kl_seri` int(5) DEFAULT NULL,
  `kl_posisi` int(5) DEFAULT NULL,
  `kl_GF` int(5) DEFAULT NULL,
  `kl_GA` int(5) DEFAULT NULL,
  `kl_GD` int(5) DEFAULT NULL,
  `kl_MN` int(5) DEFAULT NULL,
  PRIMARY KEY (`kl_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `ssb_pemain`
--

DROP TABLE IF EXISTS `ssb_pemain`;
CREATE TABLE IF NOT EXISTS `ssb_pemain` (
  `pm_id` int(11) NOT NULL AUTO_INCREMENT,
  `pm_nama` varchar(50) DEFAULT NULL,
  `pm_posisi` varchar(50) DEFAULT NULL,
  `pm_no_punggung` varchar(3) DEFAULT NULL,
  `pm_tgl_lahir` date DEFAULT NULL,
  `pm_tmp_lahir` varchar(50) DEFAULT NULL,
  `pm_alamat` text,
  `pm_kontak` varchar(14) DEFAULT NULL,
  `pm_email` varchar(50) DEFAULT NULL,
  `pm_foto` varchar(50) DEFAULT NULL,
  `pm_ktp` varchar(50) DEFAULT NULL,
  `pm_no_identitas` varchar(30) DEFAULT NULL,
  `pm_tim_id` int(11) DEFAULT NULL,
  `pm_ktim` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`pm_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `ssb_statistik`
--

DROP TABLE IF EXISTS `ssb_statistik`;
CREATE TABLE IF NOT EXISTS `ssb_statistik` (
  `st_id` int(11) NOT NULL AUTO_INCREMENT,
  `st_detail_id` varchar(50) DEFAULT NULL,
  `st_ssb_id` varchar(10) DEFAULT NULL,
  `st_event_id` varchar(10) DEFAULT NULL,
  `st_tim_id` varchar(10) DEFAULT NULL,
  `st_pemain_id` varchar(10) DEFAULT NULL,
  `st_jadwal_id` varchar(10) DEFAULT NULL,
  `st_goal` int(10) DEFAULT NULL,
  `st_assits` int(10) DEFAULT NULL,
  `st_kuning` int(10) DEFAULT NULL,
  `st_merah` int(10) DEFAULT NULL,
  `st_waktu` int(10) DEFAULT NULL,
  PRIMARY KEY (`st_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `ssb_tim`
--

DROP TABLE IF EXISTS `ssb_tim`;
CREATE TABLE IF NOT EXISTS `ssb_tim` (
  `tim_id` int(11) NOT NULL AUTO_INCREMENT,
  `tim_ssb_id` int(11) DEFAULT NULL,
  `tim_kode_klasemen` varchar(10) DEFAULT NULL,
  `tim_event` varchar(50) DEFAULT NULL,
  `tim_logo` varchar(100) DEFAULT NULL,
  `tim_lokasi` text,
  `tim_kota` varchar(50) DEFAULT NULL,
  `tim_stadion` varchar(50) DEFAULT NULL,
  `tim_email` varchar(50) DEFAULT NULL,
  `tim_telepon` varchar(12) DEFAULT NULL,
  `tim_presiden` varchar(50) DEFAULT NULL,
  `tim_manager` varchar(50) DEFAULT NULL,
  `tim_pelatih` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`tim_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `ssb_wasit`
--

DROP TABLE IF EXISTS `ssb_wasit`;
CREATE TABLE IF NOT EXISTS `ssb_wasit` (
  `ws_id` int(11) NOT NULL AUTO_INCREMENT,
  `ws_nama` varchar(50) DEFAULT NULL,
  `ws_tgl_lahir` date DEFAULT NULL,
  `ws_alamat` text,
  `ws_kontak` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`ws_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  `image` varchar(128) NOT NULL,
  `password` varchar(256) NOT NULL,
  `role_id` int(11) NOT NULL,
  `is_active` int(1) NOT NULL,
  `date_created` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `image`, `password`, `role_id`, `is_active`, `date_created`) VALUES
(5, 'Khusni Nur Zaman', 'khusni.noerz@gmail.com', 'avatar-ayas.png', '$2y$05$hDmc3hspJ3NWenZj4Qb.Guw0BLGQwKo5YHyLvmHZirAxOADn/Xo/y', 1, 1, 1552120289),
(6, 'Doddy Ferdiansyah', 'doddy@gmail.com', 'profile.jpg', '$2y$10$FhGzXwwTWLN/yonJpDLR0.nKoeWlKWBoRG9bsk0jOAgbJ007XzeFO', 2, 1, 1552285263),
(11, 'Sandhika Galih', 'sandhikagalih@gmail.com', 'default.jpg', '$2y$10$0QYEK1pB2L.Rdo.ZQsJO5eeTSpdzT7PvHaEwsuEyGSs0J1Qf5BoSq', 2, 1, 1553151354);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_access_menu`
--

DROP TABLE IF EXISTS `user_access_menu`;
CREATE TABLE IF NOT EXISTS `user_access_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `user_access_menu`
--

INSERT INTO `user_access_menu` (`id`, `role_id`, `menu_id`) VALUES
(1, 1, 1),
(3, 2, 2),
(7, 1, 3),
(8, 1, 2),
(9, 1, 4),
(10, 1, 5),
(11, 2, 5);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_menu`
--

DROP TABLE IF EXISTS `user_menu`;
CREATE TABLE IF NOT EXISTS `user_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `user_menu`
--

INSERT INTO `user_menu` (`id`, `menu`) VALUES
(1, 'Admin'),
(2, 'User'),
(3, 'Menu'),
(4, 'Pages'),
(5, 'News');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_role`
--

DROP TABLE IF EXISTS `user_role`;
CREATE TABLE IF NOT EXISTS `user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `user_role`
--

INSERT INTO `user_role` (`id`, `role`) VALUES
(1, 'Administrator'),
(2, 'Member');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_sub_menu`
--

DROP TABLE IF EXISTS `user_sub_menu`;
CREATE TABLE IF NOT EXISTS `user_sub_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) NOT NULL,
  `title` varchar(128) NOT NULL,
  `url` varchar(128) NOT NULL,
  `icon` varchar(128) NOT NULL,
  `is_active` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `user_sub_menu`
--

INSERT INTO `user_sub_menu` (`id`, `menu_id`, `title`, `url`, `icon`, `is_active`) VALUES
(1, 1, 'Dashboard', 'admin', 'fas fa-fw fa-tachometer-alt', 1),
(2, 2, 'My Profile', 'user', 'fas fa-fw fa-user', 1),
(3, 2, 'Edit Profile', 'user/edit', 'fas fa-fw fa-user-edit', 1),
(4, 3, 'Menu Management', 'menu', 'fas fa-fw fa-folder', 1),
(5, 3, 'Submenu Management', 'menu/submenu', 'fas fa-fw fa-folder-open', 1),
(7, 1, 'Role', 'admin/role', 'fas fa-fw fa-user-tie', 1),
(8, 2, 'Change Password', 'user/changepassword', 'fas fa-fw fa-key', 1),
(9, 1, 'List Users', 'admin/listusers', 'fas fa-fw fa-users', 1),
(10, 4, 'Matches', 'pages/matches', 'fas fa-fw fa-chevron-right', 1),
(11, 4, 'Team', 'pages/team', 'fas fa-fw fa-chevron-right', 1),
(12, 4, 'About', 'pages/about', 'fas fa-fw fa-chevron-right', 1),
(13, 4, 'Contact', 'pages/contact', 'fas fa-fw fa-chevron-right', 1),
(14, 5, 'Index', 'news', 'fas fa-fw fa-newspaper', 1),
(15, 5, 'Category', 'news/category', 'fas fa-fw fa-circle', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_token`
--

DROP TABLE IF EXISTS `user_token`;
CREATE TABLE IF NOT EXISTS `user_token` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(128) NOT NULL,
  `token` varchar(128) NOT NULL,
  `date_created` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
