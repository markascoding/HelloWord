-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 09, 2024 at 12:08 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_kasir`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_barang`
--

CREATE TABLE `tb_barang` (
  `id_barang` int NOT NULL,
  `nama_barang` varchar(255) NOT NULL,
  `stok_barang` int NOT NULL,
  `harga_barang` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_barang`
--

INSERT INTO `tb_barang` (`id_barang`, `nama_barang`, `stok_barang`, `harga_barang`) VALUES
(1, 'Rinso', 1000, 10000.00),
(2, 'Soyjoy', 10, 100000.00);

-- --------------------------------------------------------

--
-- Table structure for table `tb_detail_penjualan`
--

CREATE TABLE `tb_detail_penjualan` (
  `id_detail_penjualan` int NOT NULL,
  `id_penjualan` int NOT NULL,
  `id_barang` int NOT NULL,
  `jumlah_barang` int NOT NULL,
  `sub_total` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_detail_penjualan`
--

INSERT INTO `tb_detail_penjualan` (`id_detail_penjualan`, `id_penjualan`, `id_barang`, `jumlah_barang`, `sub_total`) VALUES
(1, 1, 2, 0, 0.00),
(2, 1, 1, 0, 0.00),
(3, 1, 1, 0, 0.00),
(4, 1, 1, 0, 0.00),
(5, 1, 1, 0, 0.00),
(6, 1, 1, 0, 0.00),
(7, 1, 1, 0, 0.00),
(8, 1, 1, 0, 0.00),
(9, 4, 1, 0, 0.00),
(10, 4, 1, 0, 0.00),
(11, 4, 1, 0, 0.00),
(12, 1, 1, 0, 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `tb_login`
--

CREATE TABLE `tb_login` (
  `id_login` int NOT NULL,
  `nama_pengguna` varchar(50) NOT NULL,
  `username_pengguna` varchar(50) NOT NULL,
  `password_pengguna` varchar(50) NOT NULL,
  `status` enum('Administrator','Petugas','','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_login`
--

INSERT INTO `tb_login` (`id_login`, `nama_pengguna`, `username_pengguna`, `password_pengguna`, `status`) VALUES
(1, 'ABU NAFI SOHIBUL HIKAM', 'abunafi', '123456', 'Administrator'),
(2, 'ACHMAD UJIONO', 'ujian', '123456', 'Petugas'),
(3, 'ABDUL RAZIQ SYAFIEE', 'abdul', '123456', 'Administrator'),
(4, 'ARIFUROHMAN 2', '22222', '22222', 'Administrator');

-- --------------------------------------------------------

--
-- Table structure for table `tb_pelanggan`
--

CREATE TABLE `tb_pelanggan` (
  `id_pelanggan` int NOT NULL,
  `nama_pelanggan` varchar(50) NOT NULL,
  `alamat_pelanggan` text NOT NULL,
  `telepon_pelanggan` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_pelanggan`
--

INSERT INTO `tb_pelanggan` (`id_pelanggan`, `nama_pelanggan`, `alamat_pelanggan`, `telepon_pelanggan`) VALUES
(22306, 'Arif', 'Blega', '081294929483'),
(24851, 'Hamzah', 'Blega', '081294929483');

-- --------------------------------------------------------

--
-- Table structure for table `tb_penjualan`
--

CREATE TABLE `tb_penjualan` (
  `id_penjualan` int NOT NULL,
  `tgl_penjualan` date NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `id_pelanggan` int NOT NULL,
  `id_login` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_penjualan`
--

INSERT INTO `tb_penjualan` (`id_penjualan`, `tgl_penjualan`, `total`, `id_pelanggan`, `id_login`) VALUES
(1, '2024-02-07', 0.00, 22306, 2),
(4, '2024-02-07', 0.00, 24851, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_barang`
--
ALTER TABLE `tb_barang`
  ADD PRIMARY KEY (`id_barang`);

--
-- Indexes for table `tb_detail_penjualan`
--
ALTER TABLE `tb_detail_penjualan`
  ADD PRIMARY KEY (`id_detail_penjualan`),
  ADD KEY `id_barang` (`id_barang`),
  ADD KEY `id_penjualan` (`id_penjualan`);

--
-- Indexes for table `tb_login`
--
ALTER TABLE `tb_login`
  ADD PRIMARY KEY (`id_login`);

--
-- Indexes for table `tb_pelanggan`
--
ALTER TABLE `tb_pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indexes for table `tb_penjualan`
--
ALTER TABLE `tb_penjualan`
  ADD PRIMARY KEY (`id_penjualan`),
  ADD KEY `id_login` (`id_login`),
  ADD KEY `id_pelanggan` (`id_pelanggan`,`id_login`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_barang`
--
ALTER TABLE `tb_barang`
  MODIFY `id_barang` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_detail_penjualan`
--
ALTER TABLE `tb_detail_penjualan`
  MODIFY `id_detail_penjualan` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tb_login`
--
ALTER TABLE `tb_login`
  MODIFY `id_login` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tb_penjualan`
--
ALTER TABLE `tb_penjualan`
  MODIFY `id_penjualan` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_detail_penjualan`
--
ALTER TABLE `tb_detail_penjualan`
  ADD CONSTRAINT `tb_detail_penjualan_ibfk_1` FOREIGN KEY (`id_barang`) REFERENCES `tb_barang` (`id_barang`),
  ADD CONSTRAINT `tb_detail_penjualan_ibfk_2` FOREIGN KEY (`id_penjualan`) REFERENCES `tb_penjualan` (`id_penjualan`);

--
-- Constraints for table `tb_penjualan`
--
ALTER TABLE `tb_penjualan`
  ADD CONSTRAINT `tb_penjualan_ibfk_1` FOREIGN KEY (`id_login`) REFERENCES `tb_login` (`id_login`),
  ADD CONSTRAINT `tb_penjualan_ibfk_2` FOREIGN KEY (`id_pelanggan`) REFERENCES `tb_pelanggan` (`id_pelanggan`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
