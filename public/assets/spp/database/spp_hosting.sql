-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 08, 2021 at 12:56 PM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 5.6.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sppphpmu_midtrans`
--

-- --------------------------------------------------------

--
-- Table structure for table `angsurantoko`
--

CREATE TABLE `angsurantoko` (
  `id_angsurantoko` varchar(10) NOT NULL,
  `id_hutangtoko` varchar(10) NOT NULL,
  `tanggal` date NOT NULL,
  `angsuran` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bulan`
--

CREATE TABLE `bulan` (
  `idBulan` varchar(15) NOT NULL DEFAULT '0',
  `nmBulan` varchar(25) DEFAULT NULL,
  `urutan` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bulan`
--

INSERT INTO `bulan` (`idBulan`, `nmBulan`, `urutan`) VALUES
('1', 'Januari', 7),
('10', 'Oktober', 4),
('11', 'November', 5),
('12', 'Desember', 6),
('2', 'Februari', 8),
('3', 'Maret', 9),
('4', 'April', 10),
('5', 'Mei', 11),
('6', 'Juni', 12),
('7', 'Juli', 1),
('8', 'Agustus', 2),
('9', 'September', 3);

-- --------------------------------------------------------

--
-- Table structure for table `hutangtoko`
--

CREATE TABLE `hutangtoko` (
  `id_hutangtoko` varchar(10) NOT NULL,
  `hutangke` varchar(50) NOT NULL,
  `tanggal` date NOT NULL,
  `ket` varchar(100) NOT NULL,
  `nominal` int(11) NOT NULL,
  `sisa` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `hutangtoko`
--

INSERT INTO `hutangtoko` (`id_hutangtoko`, `hutangke`, `tanggal`, `ket`, `nominal`, `sisa`) VALUES
('HT001', '1', '2021-08-08', 'as', 1000, 1000);

-- --------------------------------------------------------

--
-- Table structure for table `identitas`
--

CREATE TABLE `identitas` (
  `npsn` varchar(8) NOT NULL,
  `nmSekolah` varchar(100) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `kabupaten` varchar(100) NOT NULL,
  `propinsi` varchar(100) NOT NULL,
  `nipKepsek` varchar(20) DEFAULT NULL,
  `nmKepsek` varchar(100) DEFAULT NULL,
  `nipKaTU` varchar(200) DEFAULT NULL,
  `nmKaTU` varchar(100) DEFAULT NULL,
  `nipBendahara` varchar(200) DEFAULT NULL,
  `link` varchar(200) NOT NULL,
  `nmBendahara` varchar(100) DEFAULT NULL,
  `logo_kiri` varchar(255) DEFAULT NULL,
  `logo_kanan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `identitas`
--

INSERT INTO `identitas` (`npsn`, `nmSekolah`, `alamat`, `kabupaten`, `propinsi`, `nipKepsek`, `nmKepsek`, `nipKaTU`, `nmKaTU`, `nipBendahara`, `link`, `nmBendahara`, `logo_kiri`, `logo_kanan`) VALUES
('10700295', 'SMK 6 KOTA BEKASI', 'Jl. Angker No.111', 'Surabaya', 'Jawa Timur ', 'false', 'ahmad syaikhu. S.Kom', 'SB-Mid-server-BrgTdce22fYc7XLwh69kEDIe', 'ANISA ANJARSARI ', 'SB-Mid-client-H6doqefJfLZaXlVq', 'https://app.sandbox.midtrans.com/snap/snap.js', 'SHOLIHATUL FAHMI', 'boedoet.png', 'bekasi.png');

-- --------------------------------------------------------

--
-- Table structure for table `jenis_bayar`
--

CREATE TABLE `jenis_bayar` (
  `idJenisBayar` int(10) NOT NULL,
  `idPosBayar` int(5) DEFAULT NULL,
  `idTahunAjaran` int(5) DEFAULT NULL,
  `nmJenisBayar` varchar(100) DEFAULT NULL,
  `tipeBayar` enum('bulanan','bebas') DEFAULT 'bulanan'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jenis_bayar`
--

INSERT INTO `jenis_bayar` (`idJenisBayar`, `idPosBayar`, `idTahunAjaran`, `nmJenisBayar`, `tipeBayar`) VALUES
(6, 1, 4, 'DAFTAR ULANG', 'bebas'),
(7, 1, 4, 'DANA KEG. (AGUSTUSAN)', 'bebas'),
(8, 1, 4, 'DANA KEG. (QURBAN)', 'bebas'),
(9, 1, 4, 'DANA KEG.(CLASSMEETING)', 'bebas'),
(10, 1, 4, 'DANA KEG.(PHBI)', 'bebas'),
(11, 1, 4, 'DANA KEG.(OSIS)', 'bebas'),
(12, 1, 4, 'EKSTRAKULIKULER', 'bebas'),
(13, 1, 4, 'KEPRAMUKAAN', 'bebas'),
(14, 1, 4, 'KARTU PELAJAR', 'bebas'),
(15, 1, 4, 'DANA PERPUS', 'bebas'),
(16, 1, 4, 'UTS (SMST1)', 'bebas'),
(17, 1, 4, 'UTS (SMST2)', 'bebas'),
(18, 1, 4, 'UAS(SMST1)', 'bebas'),
(19, 1, 4, 'UAS(SMST2)', 'bebas'),
(20, 1, 4, 'RAPORT', 'bebas'),
(21, 1, 4, 'PERKEMAHAN/PERJARI', 'bebas'),
(22, 1, 4, 'SERAGAM ALMAMATER', 'bebas'),
(23, 1, 4, 'DANA PRAKTIKUM', 'bebas'),
(24, 1, 4, 'DANA SARPARAS', 'bebas'),
(25, 1, 4, 'KALENDER SEKOLAH', 'bebas'),
(26, 1, 4, 'NOMINATIF', 'bebas'),
(27, 1, 4, 'PENDALAMAN MATERI', 'bebas'),
(28, 1, 4, 'PENGADAAN SARANA UNBK', 'bebas'),
(29, 1, 4, 'FOTO IJAZAH', 'bebas'),
(30, 1, 4, 'BUKU PENDAMPING UN & LKS', 'bebas'),
(31, 1, 4, 'SIMULASI (1&2)', 'bebas'),
(32, 1, 4, 'TRYOUT (1&2)', 'bebas'),
(33, 1, 4, 'USBN BK', 'bebas'),
(34, 1, 4, 'UNBK', 'bebas'),
(35, 1, 4, 'PRA UKK', 'bebas'),
(36, 1, 4, 'UKK', 'bebas'),
(37, 1, 4, 'BUKU KENANGAN', 'bebas'),
(38, 1, 4, 'IJASAH & SKHUN', 'bebas'),
(39, 1, 4, 'SAMPUL IJASAH', 'bebas'),
(40, 1, 4, 'FC.PENULISAN IJASAH', 'bebas'),
(41, 1, 4, 'CENDERAMATA SEKOLAH', 'bebas'),
(42, 1, 4, 'PERPISAHAN', 'bebas'),
(43, 1, 4, 'PRAKERIN/TABLE MANER', 'bebas'),
(44, 2, 4, 'UAS', 'bebas'),
(45, 1, 5, 'PTS Susulan', 'bebas'),
(46, 1, 5, 'PAS Susulan', 'bebas'),
(49, 4, 4, 'PSG', 'bebas'),
(50, 1, 4, '', 'bebas'),
(51, 1, 4, 'SPP 01 20', 'bebas'),
(52, 1, 4, 'kaoskaki', 'bebas'),
(53, 1, 5, 'SPP Bulanan', 'bulanan'),
(54, 6, 4, 'Uang Pangkal', 'bebas'),
(55, 1, 4, 'Ikhtifalan', 'bebas'),
(56, 1, 5, 'bilungal', 'bebas'),
(57, 1, 4, 'bp', 'bebas'),
(58, 1, 8, '', 'bulanan'),
(59, 5, 8, 'susulan', 'bulanan'),
(60, 1, 8, 'susulan', 'bulanan'),
(61, 6, 8, 'Uang Keamanan', 'bebas'),
(65, 9, 8, 'SPP BULAN JUNI', 'bulanan'),
(66, 8, 8, 'Uang Makan', 'bulanan'),
(67, 1, 4, 'KOMITE', 'bulanan'),
(68, 1, 4, 'Spp Bulanan', 'bulanan'),
(69, 12, 10, 'SPP', 'bulanan'),
(70, 1, 10, 'Pramuka', 'bebas'),
(71, 1, 10, 'Qurban', 'bebas'),
(73, 1, 10, 'Laundry', 'bulanan'),
(74, 1, 10, 'Pondok Ramadhan', 'bebas'),
(75, 1, 10, 'Buku Lks', 'bebas'),
(76, 1, 10, 'Komite', 'bebas');

-- --------------------------------------------------------

--
-- Table structure for table `jurnal_umum`
--

CREATE TABLE `jurnal_umum` (
  `id` int(50) NOT NULL,
  `tgl` date DEFAULT NULL,
  `ket` varchar(100) DEFAULT NULL,
  `penerimaan` int(10) DEFAULT '0',
  `pengeluaran` int(10) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jurnal_umum`
--

INSERT INTO `jurnal_umum` (`id`, `tgl`, `ket`, `penerimaan`, `pengeluaran`) VALUES
(1, '2021-07-27', 'gaji staff tata usaha TU', 0, 600000),
(2, '2021-07-30', 'bayar listrik', 0, 1000000),
(3, '2021-08-08', 'bayar listrik sekolah 2 bulan', 0, 2000000);

-- --------------------------------------------------------

--
-- Table structure for table `kas`
--

CREATE TABLE `kas` (
  `kode` int(11) NOT NULL,
  `keterangan` varchar(300) NOT NULL,
  `idKelas` int(50) NOT NULL,
  `tgl` date NOT NULL,
  `jumlah` int(10) NOT NULL,
  `jenis` varchar(20) NOT NULL,
  `keluar` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kas`
--

INSERT INTO `kas` (`kode`, `keterangan`, `idKelas`, `tgl`, `jumlah`, `jenis`, `keluar`) VALUES
(2, 'Juli', 1, '2020-06-21', 25000, 'masuk', 0);

-- --------------------------------------------------------

--
-- Table structure for table `kelas_siswa`
--

CREATE TABLE `kelas_siswa` (
  `idKelas` int(5) NOT NULL,
  `nmKelas` varchar(20) DEFAULT NULL,
  `ketKelas` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kelas_siswa`
--

INSERT INTO `kelas_siswa` (`idKelas`, `nmKelas`, `ketKelas`) VALUES
(1, 'X OTKP', '-'),
(3, 'X APH', ''),
(4, 'X TKJ', ''),
(5, 'XI TKJ', ''),
(6, 'XI OTKP', ''),
(7, 'XI APH', ''),
(8, 'XII APH', ''),
(9, 'X RPL', ''),
(10, 'IX A', ''),
(11, 'I', 'Satu');

-- --------------------------------------------------------

--
-- Table structure for table `kwitansi`
--

CREATE TABLE `kwitansi` (
  `id_kwitansi` int(10) NOT NULL,
  `id_siswa` int(10) NOT NULL,
  `tgl_cetak` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kwitansi`
--

INSERT INTO `kwitansi` (`id_kwitansi`, `id_siswa`, `tgl_cetak`) VALUES
(1, 299, '2021-07-14'),
(5, 299, '2021-07-14'),
(6, 299, '2021-07-14'),
(7, 299, '2021-07-14'),
(8, 299, '2021-07-14'),
(9, 299, '2021-07-17'),
(10, 299, '2021-07-17'),
(11, 299, '2021-07-18'),
(12, 299, '2021-07-18'),
(13, 320, '2021-07-19'),
(14, 317, '2021-07-19');

-- --------------------------------------------------------

--
-- Table structure for table `pos_bayar`
--

CREATE TABLE `pos_bayar` (
  `idPosBayar` int(5) NOT NULL,
  `nmPosBayar` varchar(100) DEFAULT NULL,
  `ketPosBayar` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pos_bayar`
--

INSERT INTO `pos_bayar` (`idPosBayar`, `nmPosBayar`, `ketPosBayar`) VALUES
(1, 'SMK', 'SMK ASWAJA'),
(2, 'SD AJA', 'SD AJA'),
(3, 'LSPP SMA', 'Luar Syahriyah SMA'),
(4, 'PSG', 'PSG'),
(5, 'SPP', 'SPP Bulanan'),
(6, 'MA', 'Uang Pangkal'),
(7, 'Ikhtifalan', 'sumbangan'),
(8, 'Syahriyah', 'kamar dan nasi'),
(9, 'SPP Bulan Juni', ''),
(10, 'SPP Bulan Juli', ''),
(11, 'APA AJA', 'APA'),
(12, 'SPP', 'Bulanan'),
(13, 'UANG GEDUNG', 'PEMBAYARAN UANG GEDUNG SEMUA KELAS');

-- --------------------------------------------------------

--
-- Table structure for table `siswa`
--

CREATE TABLE `siswa` (
  `idSiswa` int(10) NOT NULL,
  `nisSiswa` varchar(25) DEFAULT NULL,
  `nisnSiswa` varchar(25) DEFAULT NULL,
  `nmSiswa` varchar(100) DEFAULT NULL,
  `jkSiswa` varchar(15) DEFAULT NULL,
  `agamaSiswa` varchar(15) DEFAULT NULL,
  `idKelas` int(5) DEFAULT NULL,
  `statusSiswa` enum('Aktif','Non Aktif','Pindah','Drop Out','Lulus') DEFAULT 'Aktif',
  `username` varchar(20) NOT NULL,
  `password` varchar(200) DEFAULT NULL,
  `level` varchar(10) NOT NULL,
  `nmOrtu` varchar(40) DEFAULT NULL,
  `alamatOrtu` varchar(100) DEFAULT NULL,
  `noHpOrtu` varchar(30) DEFAULT NULL,
  `saldo` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `siswa`
--

INSERT INTO `siswa` (`idSiswa`, `nisSiswa`, `nisnSiswa`, `nmSiswa`, `jkSiswa`, `agamaSiswa`, `idKelas`, `statusSiswa`, `username`, `password`, `level`, `nmOrtu`, `alamatOrtu`, `noHpOrtu`, `saldo`) VALUES
(278, '361/059/116', '0031242223', 'Dewi Pitasari', 'P', 'Islam', 6, 'Aktif', 'siswa2', 'siswa', 'ketuakelas', 'Jauhari', 'Dsn. Sukodadi RT.04/RW.01 Ds. Sraten ', '6825233072661', 100000),
(280, '363/061/116', '0047537539', 'Eka Dian Saputri', 'P', 'Islam', 6, 'Lulus', '', NULL, '', '', 'Dsn. Sukodadi RT.03/RW.02 Ds. Sraten ', '', 0),
(282, '366/064/116', '0036076018', 'Haliyatul Fitri', 'P', 'Islam', 6, 'Lulus', '', NULL, '', 'HANIPAN', 'SRAMPON', '', 0),
(284, '368/066/116', '0036492698', 'Hillah Maulana', 'L', 'Islam', 6, 'Lulus', '', NULL, '', '', 'Dsn. Sukodadi RT.03/RW.02 Ds. Sraten ', '', 0),
(285, '369/067/116', '0045002559', 'Israhul Amalia', 'P', 'Islam', 6, 'Lulus', '', NULL, '', '', 'Dsn. Krajan RT.03/RW.03 Ds. Kedayunan', '', 0),
(286, '370/068/116', '0031890173', 'LISA NUR AYU GUNAWATI', 'P', 'Islam', 6, 'Lulus', '', NULL, '', 'Sujarno', 'Sukodadi', '', 0),
(287, '371/069/116', '0023395015', 'Mirna Putri Uhrowi', 'P', 'Islam', 6, 'Lulus', '', NULL, '', '', 'Dsn. Sumberjeruk RT.03/RW.03 Ds. Tamanagung', '', 0),
(289, '373/071/116', '0043434098', 'Moh. Taqinaqi Khoirusima Yusuf', 'L', 'Islam', 6, 'Lulus', '', NULL, '', '', 'Dsn. Kejoyo RT.01/04 Ds. Tambong', '', 0),
(290, '374/072/116', '0039621557', 'Muhammad Hendrawan', 'L', 'Islam', 6, 'Lulus', '', NULL, '', '', 'Dsn. Krajan RT.04/RW.04 Ds. Sraten', '', 0),
(291, '375/073/116', '0036533502', 'Nafila Kurnia Alvianda', 'P', 'Islam', 6, 'Lulus', '', NULL, '', '', 'Dsn. Krajan RT.02/RW.01 Ds. Sukojati', '', 0),
(292, '376/074/116', '0037619590', 'Nining Arbailah', 'P', 'Islam', 6, 'Lulus', '', NULL, '', '', 'Dsn. Krajan RT.02/RW.07 Ds. Pakistaji', '', 0),
(293, '377/075/116', '3007000000', 'Nur Aini', 'P', 'Islam', 6, 'Lulus', '', NULL, '', '', 'Dsn. Gumukagung RT.03/RW.05 Ds. Gintangan', '', 0),
(294, '378/076/116', '0041817964', 'Puspa Rida Umma', 'P', 'Islam', 6, 'Lulus', '', NULL, '', 'HUSNAN', 'JL. BANYU CINDIH', '', 0),
(295, '380/078/116', '0035612410', 'Seza Aprilia', 'P', 'Islam', 6, 'Lulus', '', NULL, '', '', 'Dsn. Krajan RT.02/RW.07 Ds. Gladag', '', 0),
(296, '382/080/116', '0044995733', 'Siti Wasilah', 'P', 'Islam', 6, 'Lulus', '', NULL, '', '', 'Dsn. Krajan RT.03/RW.02 Ds. Kaligung', '', 0),
(297, '383/081/116', '0035663108', 'Wahyudi Ismail', 'L', 'Islam', 6, 'Lulus', '', NULL, '', '', 'Dsn. Kedungsari RT.02/RW.01 Ds. Gintangan', '', 0),
(298, '384/082/116', '0043344704', 'Yeni Fitriani', 'P', 'Islam', 6, 'Lulus', '', NULL, '', '', 'Dsn Krajan RT.02/RW.01 Ds. Sraten', '', 0),
(299, '373/046/1100', '0041807508', 'Amalia Ilmiah', 'P', 'Islam', 1, 'Aktif', 'theivhan@gmail.com', 'ilmi', '', 'Hadiris', 'sampangan', '085156619657', 48000),
(300, '374/047/110', '0044717785', 'Anisa Tri Wahyuni', 'P', 'Islam', 1, 'Lulus', '', NULL, '', '', 'Dsn. Pekiwen RT.03/RW.02 Ds. Kaligung', '', 100000),
(302, '376/049/110', '0033302744', 'Diana Ulfa', 'P', 'Islam', 8, 'Lulus', '', NULL, '', '', '', '', 450000),
(303, '377/050/110', '0047992668', 'Dimas Viktor Risman', 'L', 'Islam', 5, 'Aktif', '', NULL, '', '', '', '', 0),
(304, '378/051/110', '0048336113', 'Dini Asmawati', 'P', 'Islam', 1, 'Lulus', '', NULL, '', '', 'Dsn. Krajan RT.02/RW.02 Ds. Blimbingsari', '', 0),
(305, '379/052/110', '0042201099', 'Dini Putri Hidayah', 'P', 'Islam', 1, 'Lulus', '', NULL, '', '', 'Rejosari', '', 15000),
(306, '380/053/110', '0047377251', 'Eka Agustina Rahayu', 'P', 'Islam', 1, 'Lulus', '', NULL, '', '', 'Sukodadi Sraten', '', 0),
(307, '381/054/110', '0036492699', 'Hedi Saputra', 'L', 'Islam', 1, 'Lulus', '', NULL, '', '', 'Dsn. Babakan RT.01/RW.04 Ds. Kedayunan', '', 0),
(308, '382/055/110', '0040573762', 'Indah Tri Wulandari', 'P', 'Islam', 1, 'Lulus', '', NULL, '', 'Surip', 'Krajan', '', 0),
(309, '383/056/110', '0039182496', 'Istikomah', 'P', 'Islam', 1, 'Lulus', '', NULL, '', '', 'Dsn. Kedungsari RT.02/RW.01  Ds. Gintangan', '', 0),
(311, '385/058/110', '0036413579', 'Maulida Yuli Fitri', 'P', 'Islam', 1, 'Lulus', '', NULL, '', '', 'Dsn. Krajan Timur RT.03/RW.03 Ds. Segobang Licin', '', 0),
(312, '395/059/110', '0031048961', 'Mira Agustin', 'P', 'Islam', 3, 'Aktif', '', NULL, '', 'Orang Tua', 'Dsn. Krajan Ds. Songgon', '085233072661', 0),
(313, '396/060/110', '0044324638', 'Nadifatul Insiyah', 'P', 'Islam', 1, 'Lulus', '', NULL, '', '', 'Ds. Sasakbomo RT.01/RW.02 Ds. Mangir', '', 0),
(314, '397/061/110', '0035764814', 'Nuris Soleha', 'P', 'Islam', 1, 'Lulus', '', NULL, '', 'MAD RAJI', 'PALUREJO', '', 0),
(316, '399/063/110', '0036380287', 'Roekhatul Habibah', 'P', 'Islam', 1, 'Lulus', '', NULL, '', '', 'sampangan', '085233072661', 0),
(317, '400/064/110', '0035593330', 'Ulfa Hanin Khumairoh', 'P', 'Islam', 1, 'Lulus', '', NULL, '', '', 'Dsn. Rejosari RT.06/RW.01 Ds. Benculuk', '', 0),
(318, '401/087/66', '0039250453', 'Abd. Rohim', 'L', 'Islam', 4, 'Lulus', '', NULL, '', '', 'Giri', '', 0),
(319, '402/088/66', '0039782572', 'Abdul Latip', 'L', 'Islam', 5, 'Aktif', '', NULL, '', 'Sudirman', 'Desa Tanjung Mulya', '', 0),
(320, '403/089/66', '0014102305', 'Abdul Rohman', 'L', 'Islam', 5, 'Aktif', '', NULL, '', '', 'Dsn. Cengkokan RT.01/RW.01 Ds. Mangir', '', 0),
(321, '404/090/66', '0049747742', 'Ahmad Balya Irsyaduddin', 'L', 'Islam', 5, 'Aktif', '', NULL, '', '', 'Dsn. Sumbersari  RT.01/RW.02 Ds. Mangir', '', 0),
(322, '405/091/66', '0048101100', 'Ahmad Fathurrohman', 'L', 'Islam', 5, 'Aktif', '', NULL, '', '', 'Dsn. Kramatagung RT.03/RW.02 Ds. Kaligung', '', 0),
(323, '406/092/66', '0047902281', 'Ahmad Taufiqur Rohman', 'L', 'Islam', 5, 'Aktif', '', NULL, '', '', 'Dsn. Sumbersari  RT.02/RW.02 Ds. Mangir', '', 0),
(324, '317/043/66', '0037262310', 'Andri Kristina Putra', 'L', 'Islam', 5, 'Aktif', '', NULL, '', '', 'Dsn. Rejosari RT.01/RW.01 Ds. Karangrejo', '', 0),
(325, '408/094/66', '0042037288', 'Ayu Uut Wulandari', 'P', 'Islam', 5, 'Aktif', '', NULL, '', '', 'Dsn. Krajan RT.05/RW.02 Ds. Bomo', '', 0),
(326, '428/113/66', '0036431103', 'Dina Mukarromah', 'P', 'Islam', 5, 'Aktif', '', NULL, '', '', 'JAMBEARUM PUGER JEMBER', '', 0),
(327, '429/114/66', '0036431104', 'Dini Mukarromah', 'P', 'Islam', 5, 'Aktif', '', NULL, '', '', 'JAMBEARUM PUGER JEMBER', '', 0),
(328, '409/095/66', '0036057891', 'ERVINA GUSMIARNI', 'P', 'Islam', 5, 'Aktif', '', NULL, '', 'KUSNEN', 'JL.GUMUK KANTONG', '', 0),
(330, '411/097/66', '0049516358', 'Hayatun Thoyyibah', 'P', 'Islam', 5, 'Aktif', '', NULL, '', 'NASERI', 'Jl. Kramat', '', 0),
(331, '412/098/66', '0035657766', 'Imam Mustofa', 'L', 'Islam', 5, 'Aktif', '', NULL, '', '', 'Dsn. Rejosari RT.03/RW.01 Ds. Karangrejo', '', 0),
(332, '413/099/66', '0034686802', 'Ismia Umul Azam', 'P', 'Islam', 5, 'Aktif', '', NULL, '', 'SUGIANTO', 'JL. KEDAYUNAN', '', 0),
(333, '414/100/66', '0031469023', 'Kartika Trisna Devi', 'P', 'Islam', 5, 'Aktif', '', NULL, '', 'BASORI', 'Krajan', '', 0),
(334, '415/101/66', '0033680235', 'M. Azwar Anas', 'L', 'Islam', 5, 'Aktif', '', NULL, '', 'Misnan', 'Dsn, Sumbersari', '', 0),
(335, '416/102/66', '0050455300', 'Mas Hilmi Mubarrok', 'L', 'Islam', 5, 'Aktif', '', NULL, '', '', 'Dsn. Babakan RT.01/RW.04 Ds.Kedayunan', '', 0),
(336, '417/103/66', '0037811820', 'Moh. Fikri Andriansyah', 'L', 'Islam', 5, 'Aktif', '', NULL, '', 'AGUS MUJIB', 'JL. PRING SEJUTA', '', 0),
(337, '419/105/66', '0046777477', 'Nanang Bahroji', 'L', 'Islam', 5, 'Aktif', '', NULL, '', '', 'JL. WATUGONG', '', 0),
(338, '420/106/66', '0045631789', 'Nidia Rin Triana', 'P', 'Islam', 5, 'Aktif', '', NULL, '', '', 'Dsn. Kedunen RT.03/RW.02 Ds. Bomo', '', 0),
(339, '421/107/66', '0042520889', 'Nuril Islam', 'L', 'Islam', 5, 'Aktif', '', NULL, '', '', 'Dsn. Malar Ds. Macanputih', '', 0),
(341, '423/109/66', '0036452057', 'Sela Arista', 'P', 'Islam', 5, 'Aktif', '', NULL, '', '', 'Dsn. Pendarungan RT.01/RW.01 Ds. Karangrejo', '', 0),
(342, '424/110/66', '0045236290', 'Sinta Annuriyah', 'P', 'Islam', 5, 'Aktif', '', NULL, '', 'Tuhaini', 'Jl. Kramat', '', 0),
(343, '425/111/66', '0042258489', 'Very Prasetiyo', 'L', 'Islam', 5, 'Aktif', '', NULL, '', '', 'Dsn. Pekiwen RT.01/RW.02 Ds. Kaligung', '', 0),
(345, '427/046/66', '0044255385', 'Wisnu Wardana', 'L', 'Islam', 5, 'Aktif', '', NULL, '', 'MOH. SUPRIYANTO ROUTOMO', 'KRAJAN', '', 0),
(346, '320/037/116', '0022045685', 'AHMAD SULAIMI', 'L', 'Islam', 5, 'Aktif', '', NULL, '', '', 'Babagan RT01/RW01 Kedayunan Kabat', '', 0),
(347, '335/051/116', '0019297552', 'Arkanul Muslimin', 'L', 'Islam', 5, 'Aktif', '', NULL, '', '', 'Curahpacul RT03/RW04 Tambakrejo Muncar', '', 0),
(348, '341/053/116', '0016977296', 'DENI PURWANTO', 'L', 'Islam', 5, 'Aktif', '', NULL, '', '', 'Yosowinangun RT06/RW03 Jajag Gambiran', '', 0),
(349, '321/038/116', '0034332522', 'DHILA ARIESTYA', 'P', 'Islam', 5, 'Aktif', '', NULL, '', '', 'Muncar RT03/RW05 Kedungrejo Muncar', '', 0),
(350, '324/040/116', '0036495560', 'Muhamad Firli Abdika', 'L', 'Islam', 5, 'Aktif', '', NULL, '', '', 'Krajan RT04/RW02 Sraten Cluring', '', 0),
(351, '326/042/116', '0025512733', 'Nur Alfi Ansyah', 'P', 'Islam', 5, 'Aktif', '', NULL, '', 'HADI SURYANTO', 'SRONO', '', 0),
(352, '325/041/116', '0039907311', 'Nuril Maulidiyah', 'P', 'Islam', 5, 'Aktif', '', NULL, '', 'FATKHAL MUNIR', 'KRAJAN', '', 0),
(353, '327/043/116', '0031970784', 'Orlando Pilipus', 'L', 'Islam', 5, 'Aktif', '', NULL, '', 'DIDIK HARIYADI', 'DUSUN BLANGKON', '', 0),
(354, '328/044/116', '0010062760', 'Putra Adi Prasetya', 'L', 'Islam', 5, 'Aktif', '', NULL, '', '', 'Plosorejo RT02/RW01 Kaliploso Cluring', '', 0),
(355, '329/045/116', '0039075959', 'Putri Amelia Larosa', 'P', 'Islam', 5, 'Aktif', '', NULL, '', 'Khusnun', 'Suwaluh', '', 0),
(358, '330/046/116', '0056677245', 'S. Eka Nurul Hikmah', 'P', 'Islam', 5, 'Aktif', '', NULL, '', 'Yusup', 'Pekiringan', '', 0),
(359, '331/047/116', '0013717789', 'Sayu Ulandari', 'P', 'Islam', 5, 'Aktif', '', NULL, '', '', 'Sukodadi RT04/RW01 Sraten Cluring', '', 0),
(362, '332/048/116', '0023393443', 'Siti Kholifah', 'P', 'Islam', 5, 'Aktif', '', NULL, '', '', 'Krajan RT03/RW02 Sraten Cluring', '', 0),
(363, '416/055/116', '0013563839', 'Siti Nur Lutfiyah', 'P', 'Islam', 5, 'Aktif', '', NULL, '', 'AHMAD QUSOYI', 'Jl.segobang', '', 0),
(364, '417/056/116', '0002341623', 'Sri Dwi Wahyuni', 'P', 'Islam', 5, 'Aktif', '', NULL, '', 'SUROSO', 'Jl.sukonatar', '', 10000),
(365, '333/049/116', '0030992539', 'Syekh Maulana Ishaq', 'L', 'Islam', 5, 'Aktif', '', NULL, '', '', 'Kramatagung RT03/RW01 Kaligung Blimbingsari', '', 0),
(366, '334/050/116', '0033770586', 'Umarudin', 'L', 'Islam', 5, 'Aktif', '', NULL, '', '', 'Krajan RT01/RW08 Sraten Cluring', '', 0),
(370, '313/039/110', '0035134146', 'Arjun Rhamadani', 'L', 'Islam', 6, 'Lulus', '', NULL, '', 'EKO SANTOSO', 'CEMPOKOSARI', '', 0),
(371, '314/040/110', '0036552923', 'Dewi Aisah', 'P', 'Islam', 6, 'Lulus', '', NULL, '', '', 'Krajan RT01/RW08 Dadapan Kabat', '', 0),
(372, '315/041/110', '0011769512', 'Fita Ratnaningtiyas', 'P', 'Islam', 6, 'Lulus', '', NULL, '', 'MUHTADI', 'TUGUNG', '', 0),
(374, '316/042/110', '0022222882', 'Mita Agustin', 'P', 'Islam', 6, 'Lulus', '', NULL, '', 'SURIYONO', 'SUMBERJOYO', '', 0),
(377, '319/045/110', '0025570684', 'Sintia Ayu Lestari', 'P', 'Islam', 6, 'Lulus', '', NULL, '', '', 'Sukosari', '', 0),
(378, '337/069/66', '0036682272', 'Andre Gunawan', 'L', 'Islam', 5, 'Aktif', '', NULL, '', '', 'Biyan Tengah RT01/RW02 Kaduara Barat Larangan', '', 0),
(379, '338/070/66', '0034088266', 'ANGGI NOVITASARI', 'P', 'Islam', 5, 'Aktif', '', NULL, '', '', 'Patoman Barat RT02/RW02 Patoman Blimbingsari', '', 0),
(380, '339/071/66', '0027589635', 'ARIF SETIAWAN', 'L', 'Islam', 5, 'Aktif', '', NULL, '', '', 'Patoman Barat RT02/RW02 Patoman Blimbingsari', '', 0),
(381, '340/072/66', '0033009795', 'AYUK OKTAVIA', 'P', 'Islam', 5, 'Aktif', '', NULL, '', '', 'Babakan RT01/RW04 Kedayunan Kabat ', '', 0),
(382, '342/073/66', '0036921533', 'Diyana', 'P', 'Islam', 5, 'Aktif', '', NULL, '', 'AGUS', 'JL. TAMBONG', '', 0),
(383, '343/074/66', '0036113469', 'Erviyadi Luqman Asmawi', 'L', 'Islam', 5, 'Aktif', '', NULL, '', '', 'Krajan RT02/RW04 Kaligung Rogojampi', '', 0),
(384, '344/075/66', '0036378894', 'Lilis Widya Astutik', 'P', 'Islam', 5, 'Aktif', '', NULL, '', 'SAIKONI', 'PAKEL', '', 0),
(385, '349/080/66', '0037870073', 'M Ali Murtadlo', 'L', 'Islam', 5, 'Aktif', '', NULL, '', '', 'Temuguruh Sempu', '', 0),
(387, '345/076/66', '0036413345', 'Moch Nurul Fawaiz', 'L', 'Islam', 5, 'Aktif', '', NULL, '', '', 'Segobang', '', 0),
(388, '351/082/66', '0026203553', 'Mochammad Marzuqi', 'L', 'Islam', 5, 'Aktif', '', NULL, '', '', 'Tapansari RT03/RW01 Sraten Cluring', '', 0),
(390, '346/077/66', '0023173932', 'Moh. Gufron', 'L', 'Islam', 5, 'Aktif', '', NULL, '', 'SUMITO', 'JL. PRING SEJUTA', '', 0),
(391, '347/078/66', '0038927770', 'Mohammad Nabil', 'L', 'Islam', 5, 'Aktif', '', NULL, '', 'NUR KHOLIS', 'SRONO', '', 0),
(392, '348/079/66', '0020425650', 'Muhamad Ifroni', 'L', 'Islam', 5, 'Aktif', '', NULL, '', 'BUKHORI', 'JL. PRING SEJUTA', '', 0),
(393, '350/081/66', '0035733377', 'Muhammad Azkanafsi', 'L', 'Islam', 5, 'Aktif', '', NULL, '', '', 'Seloagung RT04/RW03 Siliragung Siliragung', '', 0),
(394, '352/083/66', '0026362601', 'Nur Laila Hidayah', 'P', 'Islam', 5, 'Aktif', '', NULL, '', '', 'Krajan RT05/RW02 Barurejo Siliragung', '', 0),
(395, '353/084/66', '0038926644', 'Rizki Ari Saputra', 'L', 'Islam', 5, 'Aktif', '', NULL, '', 'JONO SUPARNO', 'Tanah Hitam', '', 0),
(396, '354/085/66', '0029051204', 'Siti  Mudawamah', 'P', 'Islam', 5, 'Aktif', '', NULL, '', '', 'Kebonsari', '', 0),
(397, '358/089/66', '0009813878', 'Siti Nur Azizah', 'P', 'Islam', 5, 'Aktif', '', NULL, '', 'FAHRUDIN', 'Jl.sraten', '', 0),
(398, '355/086/66', '0037604093', 'Syaiful Islam', 'L', 'Islam', 5, 'Aktif', '', NULL, '', '', 'Kedungsumur RT02/RW14 Jambearum Puger', '', 0),
(399, '301/035/098', '0014832615', 'Adelia P', 'P', 'Islam', 8, 'Lulus', '', NULL, '', '', 'Dsn.Sritanjung 001/006 Ds.Wirolegi Kec.sumbersari', '', 0),
(400, '299/033/098', '0019767038', 'Ahmad Syaifulloh', 'L', 'Islam', 8, 'Lulus', '', NULL, '', 'PONIRAN', 'SUWALUH', '', 0),
(401, '294/028/098', '0012388010', 'Aprilia Prahesti Utami', 'L', 'Islam', 8, 'Lulus', '', NULL, '', 'SUGIYONO', 'KRAJAN', '', 0),
(402, '302/036/098', '0034260832', 'Davit Agung Prayogo', 'L', 'Islam', 8, 'Lulus', '', NULL, '', 'SUGIONO', 'SUWALUH', '', 0),
(403, '295/029/098', '0020824994', 'Eka Ulansari', 'P', 'Islam', 8, 'Lulus', '', NULL, '', 'SAFRUDIN', 'rimpis', '', 0),
(404, '296/030/098', '0016430243', 'Faizatul Fitri', 'P', 'Islam', 8, 'Lulus', '', NULL, '', 'MEIYANTO', 'Krajan', '', 0),
(405, '311/033/098', '0025558288', 'Faris Abid Muwaffaq', 'L', 'Islam', 8, 'Lulus', '', NULL, '', 'ABDUL KARIM', 'BULUAGUNG SILIRAGUNG BANYUWANGI', '', 0),
(406, '297/031/098', '0009438458', 'Firman Bastomi', 'L', 'Islam', 8, 'Lulus', '', NULL, '', 'BUSAINI', 'ABDUL BASAR', '', 0),
(407, '300/034/098', '0029658269', 'Medi Denes Saputra', 'L', 'Islam', 8, 'Lulus', '', NULL, '', 'GATOT BAMBANG SUGIONO', 'BLANGKON', '', 45000),
(408, '298/032/098', '0028439399', 'Rika Supiyati', 'P', 'Islam', 8, 'Lulus', '', NULL, '', 'Rohmad', 'Pendarungan', '', 0),
(409, '123', '0031242229', 'rsad', 'L', 'Islam', 1, 'Lulus', 'siswa2', 'siswa', 'siswa', 'Hadiri', 'Jalan Raya Gedangan', '999999999999', 30000),
(410, '21787878', '676687', 'Asep Keraton', 'L', 'Katolik', 5, 'Aktif', '', NULL, '', 'usluk', '', '', 5000),
(411, '12345678', '123456789', 'kimin', 'L', 'Islam', 1, 'Lulus', '', NULL, '', 'kiming', 'takes', '321321123', 200000),
(412, '7612641827', '783585391', 'Ahmad Baihaqi', 'L', 'Islam', 9, 'Lulus', '', NULL, '', 'Sudin Samsudin', 'Alamatnya', '092507235', -250000),
(413, '1234', '', 'wanda', 'P', 'Islam', 3, 'Aktif', 'wanda', 'wahyuni', 'siswa', 'suhdi', 'Yossudarso', '08123456789', 0),
(414, '88', '88', 'wanda', 'P', 'Islam', 3, 'Aktif', 'wanda1', 'wanda1', 'siswa', 'suhdi', 'Yossudarso', '08123456789', 0),
(415, '0001', '414', 'abcd', 'L', 'Islam', 1, 'Lulus', '12345678', '12345678', 'siswa', 'qqq', 'qqqqqqqqqq', '999999999999', 0),
(416, '0002', '12345678', 'Fauzan', 'L', 'Islam', 5, 'Aktif', '12345678', '123', 'siswa', 'Setiyo', 'Sidoarjo', '909090', 10000),
(417, '12345', '12345678', 'Alvin R', 'L', 'Islam', 11, 'Aktif', 'alvin', 'alvin', 'siswa', 'A', 'B', '+6285776171735', 0),
(418, '6000', '6000', 'sugito', 'L', 'Islam', 1, 'Aktif', 'sugito', 'sugito', 'siswa', 'warjiyanto', 'KP RAWA AREN , RT.001/001, Aren Jaya, Bekasi Timur', '081214600799', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tagihan_bebas`
--

CREATE TABLE `tagihan_bebas` (
  `idTagihanBebas` int(50) NOT NULL,
  `idJenisBayar` int(5) DEFAULT NULL,
  `idSiswa` int(10) DEFAULT NULL,
  `idKelas` int(5) DEFAULT NULL,
  `totalTagihan` int(10) DEFAULT NULL,
  `ref` varchar(100) NOT NULL,
  `statusBayar` enum('0','1','2') DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tagihan_bebas`
--

INSERT INTO `tagihan_bebas` (`idTagihanBebas`, `idJenisBayar`, `idSiswa`, `idKelas`, `totalTagihan`, `ref`, `statusBayar`) VALUES
(2247, 70, 299, 1, 100000, '', '1'),
(2248, 71, 299, 1, 50000, '', '1'),
(2249, 74, 299, 1, 50000, '', '0'),
(2250, 76, 299, 1, 200000, '', '0'),
(2251, 75, 299, 1, 450000, '', '0'),
(2252, 76, 418, 1, 300000, '', '0');

-- --------------------------------------------------------

--
-- Table structure for table `tagihan_bebas_bayar`
--

CREATE TABLE `tagihan_bebas_bayar` (
  `idTagihanBebasBayar` int(50) NOT NULL,
  `idTagihanBebas` int(50) DEFAULT NULL,
  `tglBayar` date DEFAULT NULL,
  `jumlahBayar` int(10) DEFAULT NULL,
  `ketBayar` varchar(100) DEFAULT NULL,
  `caraBayar` enum('Tunai','Transfer') DEFAULT 'Tunai'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tagihan_bebas_bayar`
--

INSERT INTO `tagihan_bebas_bayar` (`idTagihanBebasBayar`, `idTagihanBebas`, `tglBayar`, `jumlahBayar`, `ketBayar`, `caraBayar`) VALUES
(69, 2247, '2021-07-19', 100000, 'Lunas', 'Tunai'),
(70, 2248, '2021-07-19', 50000, 'Lunas', 'Tunai');

-- --------------------------------------------------------

--
-- Table structure for table `tagihan_bulanan`
--

CREATE TABLE `tagihan_bulanan` (
  `idTagihanBulanan` int(50) NOT NULL,
  `idJenisBayar` int(5) DEFAULT NULL,
  `idSiswa` int(10) DEFAULT NULL,
  `idKelas` int(5) DEFAULT NULL,
  `idBulan` varchar(15) DEFAULT NULL,
  `jumlahBayar` int(10) DEFAULT NULL,
  `tglBayar` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `tglUpdate` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `inv` varchar(100) NOT NULL,
  `statusBayar` enum('0','1','2') DEFAULT '0',
  `caraBayar` enum('Tunai','Transfer','Transfer Midtrans') DEFAULT 'Tunai'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tagihan_bulanan`
--

INSERT INTO `tagihan_bulanan` (`idTagihanBulanan`, `idJenisBayar`, `idSiswa`, `idKelas`, `idBulan`, `jumlahBayar`, `tglBayar`, `tglUpdate`, `inv`, `statusBayar`, `caraBayar`) VALUES
(49, 69, 299, 1, '1', 400000, '2021-07-19 00:39:35', '2021-07-19 00:39:35', '', '0', 'Tunai'),
(50, 69, 299, 1, '2', 400000, '2021-07-18 22:35:13', '2021-07-18 22:35:13', '', '0', 'Tunai'),
(51, 69, 299, 1, '3', 400000, '2021-07-18 22:35:13', '2021-07-18 22:35:13', '', '0', 'Tunai'),
(52, 69, 299, 1, '4', 400000, '2021-07-18 22:35:13', '2021-07-18 22:35:13', '', '0', 'Tunai'),
(53, 69, 299, 1, '5', 400000, '2021-07-18 22:35:13', '2021-07-18 22:35:13', '', '0', 'Tunai'),
(54, 69, 299, 1, '6', 400000, '2021-07-18 22:35:13', '2021-07-18 22:35:13', '', '0', 'Tunai'),
(55, 69, 299, 1, '7', 400000, '2021-07-19 01:23:46', '2021-07-19 01:23:46', 'INV20210719012316', '1', 'Transfer Midtrans'),
(56, 69, 299, 1, '8', 400000, '2021-07-30 00:00:00', '2021-07-30 05:34:41', 'INV20210719012603', '1', 'Tunai'),
(57, 69, 299, 1, '9', 400000, '2021-07-19 01:43:10', '2021-07-19 01:43:10', 'INV20210719014131', '1', 'Transfer Midtrans'),
(58, 69, 299, 1, '10', 400000, '2021-07-19 01:53:45', '2021-07-19 01:53:45', 'INV20210719015335', '2', 'Tunai'),
(59, 69, 299, 1, '11', 400000, '2021-07-30 00:00:00', '2021-07-30 05:34:46', '', '1', 'Tunai'),
(60, 69, 299, 1, '12', 400000, '2021-07-19 00:39:35', '2021-07-19 00:39:35', '', '0', 'Tunai'),
(61, 73, 299, 1, '1', 50000, '2021-07-19 00:39:35', '2021-07-19 00:39:35', '', '0', 'Tunai'),
(62, 73, 299, 1, '2', 50000, '2021-07-19 00:39:35', '2021-07-19 00:39:35', '', '0', 'Tunai'),
(63, 73, 299, 1, '3', 50000, '2021-07-19 00:39:35', '2021-07-19 00:39:35', '', '0', 'Tunai'),
(64, 73, 299, 1, '4', 50000, NULL, NULL, '', '0', 'Tunai'),
(65, 73, 299, 1, '5', 50000, '2021-07-18 22:35:14', '2021-07-18 22:35:14', '', '0', 'Tunai'),
(66, 73, 299, 1, '6', 50000, '2021-07-19 00:39:35', '2021-07-19 00:39:35', '', '0', 'Tunai'),
(67, 73, 299, 1, '7', 50000, '2021-07-19 02:14:45', '2021-07-19 02:14:45', 'INV20210719021437', '2', 'Tunai'),
(68, 73, 299, 1, '8', 50000, '2021-07-19 00:49:39', '2021-07-19 00:49:39', 'INV20210719004721', '1', 'Transfer Midtrans'),
(69, 73, 299, 1, '9', 50000, '2021-07-19 00:51:29', '2021-07-19 00:51:29', 'INV20210719005104', '1', 'Transfer Midtrans'),
(70, 73, 299, 1, '10', 50000, '2021-07-19 02:34:26', '2021-07-19 02:34:26', 'INV20210719023426', '0', 'Tunai'),
(71, 73, 299, 1, '11', 50000, '2021-07-19 01:46:45', '2021-07-19 01:46:45', 'INV20210719013948', '0', 'Tunai'),
(72, 73, 299, 1, '12', 50000, '2021-07-19 00:39:35', '2021-07-19 00:39:35', '', '0', 'Tunai'),
(73, 69, 418, 1, '1', 100000, NULL, NULL, '', '0', 'Tunai'),
(74, 69, 418, 1, '2', 100000, NULL, NULL, '', '0', 'Tunai'),
(75, 69, 418, 1, '3', 100000, NULL, NULL, '', '0', 'Tunai'),
(76, 69, 418, 1, '4', 100000, NULL, NULL, '', '0', 'Tunai'),
(77, 69, 418, 1, '5', 100000, NULL, NULL, '', '0', 'Tunai'),
(78, 69, 418, 1, '6', 100000, NULL, NULL, '', '0', 'Tunai'),
(79, 69, 418, 1, '7', 100000, NULL, NULL, '', '0', 'Tunai'),
(80, 69, 418, 1, '8', 100000, NULL, NULL, '', '0', 'Tunai'),
(81, 69, 418, 1, '9', 100000, NULL, NULL, '', '0', 'Tunai'),
(82, 69, 418, 1, '10', 100000, NULL, NULL, '', '0', 'Tunai'),
(83, 69, 418, 1, '11', 100000, NULL, NULL, '', '0', 'Tunai'),
(84, 69, 418, 1, '12', 100000, NULL, NULL, '', '0', 'Tunai');

-- --------------------------------------------------------

--
-- Table structure for table `tahun_ajaran`
--

CREATE TABLE `tahun_ajaran` (
  `idTahunAjaran` int(5) NOT NULL,
  `nmTahunAjaran` varchar(9) DEFAULT NULL,
  `aktif` enum('Y','T') DEFAULT 'Y'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tahun_ajaran`
--

INSERT INTO `tahun_ajaran` (`idTahunAjaran`, `nmTahunAjaran`, `aktif`) VALUES
(3, '2018/2019', 'T'),
(4, '2019/2020', 'T'),
(5, '2020/2021', 'T'),
(8, '2019/2020', 'T'),
(10, '2020/2021', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` varchar(50) NOT NULL,
  `nisnSiswa` varchar(50) NOT NULL,
  `tanggal` date NOT NULL,
  `debit` int(10) NOT NULL,
  `kredit` int(10) NOT NULL,
  `keterangan` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `nisnSiswa`, `tanggal`, `debit`, `kredit`, `keterangan`) VALUES
('T0001', '0041807508', '2021-07-11', 30000, 0, ''),
('T0002', '0041807508', '2021-07-11', 0, 10000, ''),
('T0003', '0041807508', '2021-07-14', 20000, 0, ''),
('T0004', '0041807508', '2021-07-15', 10000, 0, ''),
('T0005', '0041807508', '2021-07-27', 0, 2000, 'narik duit'),
('T0006', '783585391', '2021-08-14', 0, 250000, 'tarik tunai');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `username` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `password` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `nama_lengkap` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `email` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `no_telp` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `level` varchar(20) COLLATE latin1_general_ci NOT NULL DEFAULT 'admin',
  `blokir` enum('Y','N') COLLATE latin1_general_ci NOT NULL DEFAULT 'N',
  `idKelas` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `id_session` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `last_login` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`username`, `password`, `nama_lengkap`, `email`, `no_telp`, `level`, `blokir`, `idKelas`, `id_session`, `last_login`) VALUES
('admin', '81dc9bdb52d04dc20036dbd8313ed055', 'muladi', 'mifans1995@gmail.com', '085233072661', 'admin', 'N', '', 'vgjkducma2cld9dq2a7ahg5f04', '2017-08-30 11:43:28'),
('adminjuraganpay', '21232f297a57a5a743894a0e4a801fc3', 'Riv', 'theivhan@gmail.com', '68233072661', 'bendahara', 'N', '', '', NULL),
('herudin', '27a3642057f81413e04b71e785673868', 'herudin', 'kurniawanrendy53@gmail.com', '083806060659', 'admin', 'N', '11', '', NULL),
('messi', '1463ccd2104eeb36769180b8a0c86bb6', 'messi', 'kasir@gmail.com', '08121460047', 'bendahara', 'N', '11', '', NULL),
('rendy', '81dc9bdb52d04dc20036dbd8313ed055', 'galih prasetyo', 'mifans1995@gmail.com', '081214600792', 'admin', 'N', '11', '', NULL),
('wakel', '21d4cfa6c49e0bfad4b3b7484d9cd50c', 'Vivi', 'theivhan@gmail.com', '68233072661', 'wakel', 'N', '3', '', NULL);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_detil_jenis_bayar`
-- (See below for the actual view)
--
CREATE TABLE `view_detil_jenis_bayar` (
`idJenisBayar` int(10)
,`idPosBayar` int(5)
,`idTahunAjaran` int(5)
,`nmJenisBayar` varchar(100)
,`tipeBayar` enum('bulanan','bebas')
,`nmPosBayar` varchar(100)
,`nmTahunAjaran` varchar(9)
,`aktif` enum('Y','T')
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_detil_siswa`
-- (See below for the actual view)
--
CREATE TABLE `view_detil_siswa` (
`idSiswa` int(10)
,`nisSiswa` varchar(25)
,`nisnSiswa` varchar(25)
,`nmSiswa` varchar(100)
,`jkSiswa` varchar(15)
,`agamaSiswa` varchar(15)
,`idKelas` int(5)
,`statusSiswa` enum('Aktif','Non Aktif','Pindah','Drop Out','Lulus')
,`nmKelas` varchar(20)
,`ketKelas` varchar(255)
,`nmOrtu` varchar(40)
,`alamatOrtu` varchar(100)
,`noHpOrtu` varchar(30)
,`saldo` double
,`username` varchar(20)
,`password` varchar(200)
,`level` varchar(10)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_laporan_bayar_bulanan`
-- (See below for the actual view)
--
CREATE TABLE `view_laporan_bayar_bulanan` (
`idTagihanBulanan` int(50)
,`idJenisBayar` int(5)
,`idSiswa` int(10)
,`idKelas` int(5)
,`idBulan` varchar(15)
,`jumlahBayar` int(10)
,`tglBayar` datetime
,`tglUpdate` datetime
,`statusBayar` enum('0','1','2')
,`idTahunAjaran` int(5)
,`nmJenisBayar` varchar(100)
,`nmTahunAjaran` varchar(9)
,`nisSiswa` varchar(25)
,`nmSiswa` varchar(100)
,`nmKelas` varchar(20)
,`nmBulan` varchar(25)
,`urutan` int(2)
,`caraBayar` enum('Tunai','Transfer','Transfer Midtrans')
);

-- --------------------------------------------------------

--
-- Structure for view `view_detil_jenis_bayar`
--
DROP TABLE IF EXISTS `view_detil_jenis_bayar`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `view_detil_jenis_bayar`  AS  select `jenis_bayar`.`idJenisBayar` AS `idJenisBayar`,`jenis_bayar`.`idPosBayar` AS `idPosBayar`,`jenis_bayar`.`idTahunAjaran` AS `idTahunAjaran`,`jenis_bayar`.`nmJenisBayar` AS `nmJenisBayar`,`jenis_bayar`.`tipeBayar` AS `tipeBayar`,`pos_bayar`.`nmPosBayar` AS `nmPosBayar`,`tahun_ajaran`.`nmTahunAjaran` AS `nmTahunAjaran`,`tahun_ajaran`.`aktif` AS `aktif` from ((`jenis_bayar` join `pos_bayar` on((`jenis_bayar`.`idPosBayar` = `pos_bayar`.`idPosBayar`))) join `tahun_ajaran` on((`jenis_bayar`.`idTahunAjaran` = `tahun_ajaran`.`idTahunAjaran`))) ;

-- --------------------------------------------------------

--
-- Structure for view `view_detil_siswa`
--
DROP TABLE IF EXISTS `view_detil_siswa`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `view_detil_siswa`  AS  select `siswa`.`idSiswa` AS `idSiswa`,`siswa`.`nisSiswa` AS `nisSiswa`,`siswa`.`nisnSiswa` AS `nisnSiswa`,`siswa`.`nmSiswa` AS `nmSiswa`,`siswa`.`jkSiswa` AS `jkSiswa`,`siswa`.`agamaSiswa` AS `agamaSiswa`,`siswa`.`idKelas` AS `idKelas`,`siswa`.`statusSiswa` AS `statusSiswa`,`kelas_siswa`.`nmKelas` AS `nmKelas`,`kelas_siswa`.`ketKelas` AS `ketKelas`,`siswa`.`nmOrtu` AS `nmOrtu`,`siswa`.`alamatOrtu` AS `alamatOrtu`,`siswa`.`noHpOrtu` AS `noHpOrtu`,`siswa`.`saldo` AS `saldo`,`siswa`.`username` AS `username`,`siswa`.`password` AS `password`,`siswa`.`level` AS `level` from (`siswa` join `kelas_siswa` on((`siswa`.`idKelas` = `kelas_siswa`.`idKelas`))) ;

-- --------------------------------------------------------

--
-- Structure for view `view_laporan_bayar_bulanan`
--
DROP TABLE IF EXISTS `view_laporan_bayar_bulanan`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `view_laporan_bayar_bulanan`  AS  select `tagihan_bulanan`.`idTagihanBulanan` AS `idTagihanBulanan`,`tagihan_bulanan`.`idJenisBayar` AS `idJenisBayar`,`tagihan_bulanan`.`idSiswa` AS `idSiswa`,`tagihan_bulanan`.`idKelas` AS `idKelas`,`tagihan_bulanan`.`idBulan` AS `idBulan`,`tagihan_bulanan`.`jumlahBayar` AS `jumlahBayar`,`tagihan_bulanan`.`tglBayar` AS `tglBayar`,`tagihan_bulanan`.`tglUpdate` AS `tglUpdate`,`tagihan_bulanan`.`statusBayar` AS `statusBayar`,`jenis_bayar`.`idTahunAjaran` AS `idTahunAjaran`,`jenis_bayar`.`nmJenisBayar` AS `nmJenisBayar`,`tahun_ajaran`.`nmTahunAjaran` AS `nmTahunAjaran`,`siswa`.`nisSiswa` AS `nisSiswa`,`siswa`.`nmSiswa` AS `nmSiswa`,`kelas_siswa`.`nmKelas` AS `nmKelas`,`bulan`.`nmBulan` AS `nmBulan`,`bulan`.`urutan` AS `urutan`,`tagihan_bulanan`.`caraBayar` AS `caraBayar` from (((((`tagihan_bulanan` join `jenis_bayar` on((`tagihan_bulanan`.`idJenisBayar` = `jenis_bayar`.`idJenisBayar`))) join `tahun_ajaran` on((`jenis_bayar`.`idTahunAjaran` = `tahun_ajaran`.`idTahunAjaran`))) join `siswa` on((`tagihan_bulanan`.`idSiswa` = `siswa`.`idSiswa`))) join `kelas_siswa` on((`siswa`.`idKelas` = `kelas_siswa`.`idKelas`))) join `bulan` on((`tagihan_bulanan`.`idBulan` = `bulan`.`idBulan`))) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `angsurantoko`
--
ALTER TABLE `angsurantoko`
  ADD PRIMARY KEY (`id_angsurantoko`);

--
-- Indexes for table `bulan`
--
ALTER TABLE `bulan`
  ADD PRIMARY KEY (`idBulan`);

--
-- Indexes for table `hutangtoko`
--
ALTER TABLE `hutangtoko`
  ADD PRIMARY KEY (`id_hutangtoko`);

--
-- Indexes for table `identitas`
--
ALTER TABLE `identitas`
  ADD PRIMARY KEY (`npsn`);

--
-- Indexes for table `jenis_bayar`
--
ALTER TABLE `jenis_bayar`
  ADD PRIMARY KEY (`idJenisBayar`),
  ADD KEY `fk_pos` (`idPosBayar`),
  ADD KEY `fk_tahun` (`idTahunAjaran`);

--
-- Indexes for table `jurnal_umum`
--
ALTER TABLE `jurnal_umum`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kas`
--
ALTER TABLE `kas`
  ADD PRIMARY KEY (`kode`);

--
-- Indexes for table `kelas_siswa`
--
ALTER TABLE `kelas_siswa`
  ADD PRIMARY KEY (`idKelas`);

--
-- Indexes for table `kwitansi`
--
ALTER TABLE `kwitansi`
  ADD PRIMARY KEY (`id_kwitansi`);

--
-- Indexes for table `pos_bayar`
--
ALTER TABLE `pos_bayar`
  ADD PRIMARY KEY (`idPosBayar`);

--
-- Indexes for table `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`idSiswa`),
  ADD KEY `fk_kelas` (`idKelas`),
  ADD KEY `fk_status` (`statusSiswa`);

--
-- Indexes for table `tagihan_bebas`
--
ALTER TABLE `tagihan_bebas`
  ADD PRIMARY KEY (`idTagihanBebas`),
  ADD KEY `fk_t_jenis` (`idJenisBayar`),
  ADD KEY `fk_t_siswa` (`idSiswa`),
  ADD KEY `fk_t_kelas` (`idKelas`);

--
-- Indexes for table `tagihan_bebas_bayar`
--
ALTER TABLE `tagihan_bebas_bayar`
  ADD PRIMARY KEY (`idTagihanBebasBayar`),
  ADD KEY `fkbayarbebas` (`idTagihanBebas`);

--
-- Indexes for table `tagihan_bulanan`
--
ALTER TABLE `tagihan_bulanan`
  ADD PRIMARY KEY (`idTagihanBulanan`),
  ADD KEY `fk_t_jenis` (`idJenisBayar`),
  ADD KEY `fk_t_siswa` (`idSiswa`),
  ADD KEY `fk_t_kelas` (`idKelas`),
  ADD KEY `fk_t_bulan` (`idBulan`);

--
-- Indexes for table `tahun_ajaran`
--
ALTER TABLE `tahun_ajaran`
  ADD PRIMARY KEY (`idTahunAjaran`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `jenis_bayar`
--
ALTER TABLE `jenis_bayar`
  MODIFY `idJenisBayar` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `jurnal_umum`
--
ALTER TABLE `jurnal_umum`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `kas`
--
ALTER TABLE `kas`
  MODIFY `kode` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `kelas_siswa`
--
ALTER TABLE `kelas_siswa`
  MODIFY `idKelas` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `kwitansi`
--
ALTER TABLE `kwitansi`
  MODIFY `id_kwitansi` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `pos_bayar`
--
ALTER TABLE `pos_bayar`
  MODIFY `idPosBayar` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `siswa`
--
ALTER TABLE `siswa`
  MODIFY `idSiswa` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=419;

--
-- AUTO_INCREMENT for table `tagihan_bebas`
--
ALTER TABLE `tagihan_bebas`
  MODIFY `idTagihanBebas` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2253;

--
-- AUTO_INCREMENT for table `tagihan_bebas_bayar`
--
ALTER TABLE `tagihan_bebas_bayar`
  MODIFY `idTagihanBebasBayar` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `tagihan_bulanan`
--
ALTER TABLE `tagihan_bulanan`
  MODIFY `idTagihanBulanan` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `tahun_ajaran`
--
ALTER TABLE `tahun_ajaran`
  MODIFY `idTahunAjaran` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `jenis_bayar`
--
ALTER TABLE `jenis_bayar`
  ADD CONSTRAINT `fk_pos` FOREIGN KEY (`idPosBayar`) REFERENCES `pos_bayar` (`idPosBayar`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tahun` FOREIGN KEY (`idTahunAjaran`) REFERENCES `tahun_ajaran` (`idTahunAjaran`) ON UPDATE CASCADE;

--
-- Constraints for table `siswa`
--
ALTER TABLE `siswa`
  ADD CONSTRAINT `fk_kelas` FOREIGN KEY (`idKelas`) REFERENCES `kelas_siswa` (`idKelas`) ON UPDATE CASCADE;

--
-- Constraints for table `tagihan_bebas`
--
ALTER TABLE `tagihan_bebas`
  ADD CONSTRAINT `tagihan_bebas_ibfk_2` FOREIGN KEY (`idJenisBayar`) REFERENCES `jenis_bayar` (`idJenisBayar`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tagihan_bebas_ibfk_3` FOREIGN KEY (`idKelas`) REFERENCES `kelas_siswa` (`idKelas`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tagihan_bebas_ibfk_4` FOREIGN KEY (`idSiswa`) REFERENCES `siswa` (`idSiswa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tagihan_bebas_bayar`
--
ALTER TABLE `tagihan_bebas_bayar`
  ADD CONSTRAINT `fkbayarbebas` FOREIGN KEY (`idTagihanBebas`) REFERENCES `tagihan_bebas` (`idTagihanBebas`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tagihan_bulanan`
--
ALTER TABLE `tagihan_bulanan`
  ADD CONSTRAINT `fk_t_bulan` FOREIGN KEY (`idBulan`) REFERENCES `bulan` (`idBulan`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_t_jenis` FOREIGN KEY (`idJenisBayar`) REFERENCES `jenis_bayar` (`idJenisBayar`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_t_kelas` FOREIGN KEY (`idKelas`) REFERENCES `kelas_siswa` (`idKelas`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_t_siswa` FOREIGN KEY (`idSiswa`) REFERENCES `siswa` (`idSiswa`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
