-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 04 Jan 2022 pada 14.57
-- Versi server: 10.4.22-MariaDB
-- Versi PHP: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `weddingorganizer`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_barang`
--

CREATE TABLE `tb_barang` (
  `id_brg` int(11) NOT NULL,
  `nama_brg` varchar(120) NOT NULL,
  `keterangan` varchar(225) NOT NULL,
  `kategori` varchar(60) NOT NULL,
  `harga` int(11) NOT NULL,
  `stok` int(4) NOT NULL,
  `gambar` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_barang`
--

INSERT INTO `tb_barang` (`id_brg`, `nama_brg`, `keterangan`, `kategori`, `harga`, `stok`, `gambar`) VALUES
(10, 'Paket Promo  ', '25 ', 'Nasional ', 69000000, 12, 'dekor.jpg'),
(11, 'Fotografer', '2', 'Internasional', 500000, 4, 'foto.jpg'),
(12, 'PAKET A', 'Dekor, MUA & FG, Catering', 'Nasional', 85000000, 5, 'WhatsApp_Image_2022-01-04_at_20_32_36.jpeg'),
(13, 'Paket A', 'Dekor, MUA & FG, Catering', 'Rumah', 70000000, 4, 'WhatsApp_Image_2022-01-04_at_20_32_24.jpeg'),
(14, 'MUA', 'MUA + FG', 'Internasional', 45000000, 5, 'WhatsApp_Image_2022-01-04_at_20_32_28.jpeg'),
(15, 'Catering', '100 pcs', 'Nasional', 15000000, 5, 'WhatsApp_Image_2022-01-04_at_20_32_34.jpeg'),
(16, 'Dekor ', 'Tema 1', 'Internasional', 30000000, 3, 'WhatsApp_Image_2022-01-04_at_20_32_29.jpeg'),
(17, 'Paket Halal', 'Dekor, MUA & FG, Catering', 'Aneka', 25000000, 3, 'WhatsApp_Image_2022-01-04_at_20_32_22.jpeg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_invoice`
--

CREATE TABLE `tb_invoice` (
  `id` int(11) NOT NULL,
  `nama` varchar(56) NOT NULL,
  `alamat` varchar(225) NOT NULL,
  `no_telp` varchar(20) NOT NULL,
  `bank` varchar(50) NOT NULL,
  `tgl_pesan` datetime NOT NULL,
  `batas_bayar` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_invoice`
--

INSERT INTO `tb_invoice` (`id`, `nama`, `alamat`, `no_telp`, `bank`, `tgl_pesan`, `batas_bayar`) VALUES
(1, 'Ayu Sephia', 'Suwaduk, Wedarijaksa, Pati', '081568865124', 'MANDIRI - XXXXXX', '2021-12-24 17:24:03', '2021-12-25 17:24:03'),
(2, 'Ayu Sephia', 'Suwaduk, Wedarijaksa', '082345678012', 'BNI - XXXXXX', '2021-12-24 23:06:55', '2021-12-25 23:06:55'),
(3, 'Ana Rosa', 'Kudus', '08567834201234', 'BCA - XXXXXX', '2021-12-24 23:08:42', '2021-12-25 23:08:42'),
(4, 'Ayu Sephia', 'Suwaduk, Wedarijaksa, Pati', '081234567890321', 'BNI - XXXXXX', '2021-12-24 23:11:32', '2021-12-25 23:11:32');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pesanan`
--

CREATE TABLE `tb_pesanan` (
  `id` int(11) NOT NULL,
  `id_invoice` int(11) NOT NULL,
  `id_brg` int(11) NOT NULL,
  `nama_brg` varchar(50) NOT NULL,
  `jumlah` int(5) NOT NULL,
  `harga` int(10) NOT NULL,
  `pilihan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_pesanan`
--

INSERT INTO `tb_pesanan` (`id`, `id_invoice`, `id_brg`, `nama_brg`, `jumlah`, `harga`, `pilihan`) VALUES
(1, 1, 1, 'MUA', 1, 500000, ''),
(2, 2, 8, 'PAKET B', 1, 75000000, ''),
(3, 3, 5, 'Catering', 1, 3000000, ''),
(4, 4, 4, 'Dekor', 1, 20000000, '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_user`
--

CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `role_id` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_user`
--

INSERT INTO `tb_user` (`id`, `nama`, `username`, `password`, `role_id`) VALUES
(1, 'admin', 'admin', 'admin', 1),
(2, 'ayu', 'ayu', 'ayu', 2),
(3, 'Ana Rosa', 'ana', 'ana', 2);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_barang`
--
ALTER TABLE `tb_barang`
  ADD PRIMARY KEY (`id_brg`);

--
-- Indeks untuk tabel `tb_invoice`
--
ALTER TABLE `tb_invoice`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tb_pesanan`
--
ALTER TABLE `tb_pesanan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tb_barang`
--
ALTER TABLE `tb_barang`
  MODIFY `id_brg` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT untuk tabel `tb_invoice`
--
ALTER TABLE `tb_invoice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `tb_pesanan`
--
ALTER TABLE `tb_pesanan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
