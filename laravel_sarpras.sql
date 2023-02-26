-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 26 Feb 2023 pada 22.00
-- Versi server: 10.4.14-MariaDB
-- Versi PHP: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel_sarpras`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `barangs`
--

CREATE TABLE `barangs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_barang` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kategori_id` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `nama_barang` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `satuan` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jumlah` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jumlah_rusak` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `barangs`
--

INSERT INTO `barangs` (`id`, `id_barang`, `kategori_id`, `nama_barang`, `satuan`, `jumlah`, `jumlah_rusak`) VALUES
(43, 'BR0001', '5', 'CCTV', 'Buah', '22', '0');

-- --------------------------------------------------------

--
-- Struktur dari tabel `input_ruangan`
--

CREATE TABLE `input_ruangan` (
  `id_input_ruangan` int(11) NOT NULL,
  `id_ruangan_barang` int(11) NOT NULL,
  `id_barang` varchar(200) NOT NULL,
  `jumlah_masuk` varchar(200) NOT NULL,
  `tanggal_masuk` date NOT NULL,
  `jumlah_rusak_ruangan` varchar(200) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `input_ruangan`
--

INSERT INTO `input_ruangan` (`id_input_ruangan`, `id_ruangan_barang`, `id_barang`, `jumlah_masuk`, `tanggal_masuk`, `jumlah_rusak_ruangan`) VALUES
(36, 20, 'BR0002', '1', '2022-03-01', '1');

--
-- Trigger `input_ruangan`
--
DELIMITER $$
CREATE TRIGGER `tg_barang_masuk` AFTER INSERT ON `input_ruangan` FOR EACH ROW BEGIN
UPDATE barangs
SET jumlah = jumlah - NEW.jumlah_masuk
WHERE
id_barang = NEW.id_barang;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int(200) NOT NULL,
  `nama_kategori` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`) VALUES
(4, 'Mebel'),
(5, 'Elektronik'),
(6, 'Perkakas');

-- --------------------------------------------------------

--
-- Struktur dari tabel `keluar`
--

CREATE TABLE `keluar` (
  `id_keluar` int(11) NOT NULL,
  `id_barang` varchar(200) NOT NULL,
  `jumlah_keluar` varchar(150) NOT NULL,
  `untuk` text NOT NULL,
  `tanggal_keluar` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Trigger `keluar`
--
DELIMITER $$
CREATE TRIGGER `tg_barang_keluar` AFTER INSERT ON `keluar` FOR EACH ROW BEGIN
UPDATE barangs
SET jumlah = jumlah - NEW.jumlah_keluar
WHERE
id_barang = NEW.id_barang;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `keranjang_keluar`
--

CREATE TABLE `keranjang_keluar` (
  `id_keluar` int(11) NOT NULL,
  `id_barang` varchar(200) NOT NULL,
  `jumlah_keluar` varchar(150) NOT NULL,
  `untuk` text NOT NULL,
  `tanggal_keluar` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `keranjang_masuk`
--

CREATE TABLE `keranjang_masuk` (
  `id_masuk` int(11) NOT NULL,
  `id_barang` varchar(200) NOT NULL,
  `jumlah_asup` varchar(50) NOT NULL,
  `tanggal_masuk` date NOT NULL,
  `harga_satuan` varchar(200) NOT NULL DEFAULT '0',
  `harga_total` varchar(200) NOT NULL DEFAULT '0',
  `nama_toko` varchar(200) NOT NULL DEFAULT '0',
  `merek` varchar(200) NOT NULL DEFAULT '0',
  `sumber_dana` varchar(200) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `keranjang_peminjaman`
--

CREATE TABLE `keranjang_peminjaman` (
  `id_peminjaman` int(11) NOT NULL,
  `nama_peminjam` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_barang` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jumlah_pinjam` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal_pinjam` date NOT NULL,
  `tanggal_kembali` date NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `keranjang_ruangan`
--

CREATE TABLE `keranjang_ruangan` (
  `id_input_ruangan` int(11) NOT NULL,
  `id_ruangan` int(11) NOT NULL,
  `id_barang` varchar(200) NOT NULL,
  `jumlah_masuk` varchar(200) NOT NULL,
  `tanggal_masuk` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `keranjang_rusak_luar`
--

CREATE TABLE `keranjang_rusak_luar` (
  `id_rusak_luar` int(11) NOT NULL,
  `id_barang_rusak_luar` varchar(200) NOT NULL,
  `jumlah_rusak_luar` varchar(200) NOT NULL,
  `tanggal_rusak_luar` date NOT NULL,
  `status` varchar(200) NOT NULL,
  `user_id_luar` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `keranjang_rusak_ruangan`
--

CREATE TABLE `keranjang_rusak_ruangan` (
  `id_rusak_ruangan` int(11) NOT NULL,
  `id_barang_rusak` varchar(200) NOT NULL,
  `jumlah_rusak_ruangan` varchar(200) NOT NULL,
  `id_ruangan_rusak` varchar(200) DEFAULT NULL,
  `tanggal_rusak` date NOT NULL,
  `status` varchar(200) NOT NULL,
  `user_id_ruangan` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `masuk`
--

CREATE TABLE `masuk` (
  `id_masuk` int(11) NOT NULL,
  `id_barang` varchar(200) NOT NULL,
  `jumlah_asup` varchar(50) NOT NULL,
  `tanggal_masuk` date NOT NULL,
  `harga_satuan` varchar(200) NOT NULL DEFAULT '0',
  `harga_total` varchar(200) NOT NULL DEFAULT '0',
  `nama_toko` varchar(200) NOT NULL DEFAULT '0',
  `merek` varchar(200) NOT NULL DEFAULT '0',
  `sumber_dana` varchar(200) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Trigger `masuk`
--
DELIMITER $$
CREATE TRIGGER `tg_masuk_barang` AFTER INSERT ON `masuk` FOR EACH ROW BEGIN
UPDATE barangs
SET jumlah = jumlah + NEW.jumlah_asup
WHERE
id_barang = NEW.id_barang;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(22, '2014_10_12_000000_create_users_table', 1),
(23, '2014_10_12_100000_create_password_resets_table', 1),
(24, '2019_09_30_134041_create_barangs_table', 1),
(25, '2019_10_10_031322_create_jenis_table', 1),
(26, '2019_10_10_062257_create_ruangan_table', 1),
(27, '2019_10_11_025053_create_peminjaman_table', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('arimuhamadsetiawan@gmail.com', '$2y$10$FMy8f0VQtUKGoqsRBwne0eKmlqV/xtw7hk6CRzXj0Nclvk3YbvMIe', '2022-04-22 23:47:43');

-- --------------------------------------------------------

--
-- Struktur dari tabel `peminjaman`
--

CREATE TABLE `peminjaman` (
  `id_peminjaman` int(11) NOT NULL,
  `nama_peminjam` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_barang` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jumlah_pinjam` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal_pinjam` date NOT NULL,
  `tanggal_kembali` date NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `peminjaman`
--

INSERT INTO `peminjaman` (`id_peminjaman`, `nama_peminjam`, `id_barang`, `jumlah_pinjam`, `tanggal_pinjam`, `tanggal_kembali`, `status`, `created_at`, `updated_at`) VALUES
(26, 'Bagas', 'BR0001', '10', '2022-05-25', '2022-05-26', 'Sudah Dikembalikan', NULL, NULL);

--
-- Trigger `peminjaman`
--
DELIMITER $$
CREATE TRIGGER `tg_pinjam` AFTER INSERT ON `peminjaman` FOR EACH ROW BEGIN
UPDATE barangs
SET jumlah = jumlah - NEW.jumlah_pinjam
WHERE
id_barang = NEW.id_barang;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `ruangan`
--

CREATE TABLE `ruangan` (
  `id_ruangan` bigint(20) UNSIGNED NOT NULL,
  `ruangan` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_pembimbing` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `id_pj` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `ruangan`
--

INSERT INTO `ruangan` (`id_ruangan`, `ruangan`, `id_pembimbing`, `id_pj`) VALUES
(20, 'Lab Komputer', '25', '26');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rusak_luar`
--

CREATE TABLE `rusak_luar` (
  `id_rusak_luar` int(11) NOT NULL,
  `id_barang_rusak_luar` varchar(200) NOT NULL,
  `jumlah_rusak_luar` varchar(200) NOT NULL,
  `tanggal_rusak_luar` date NOT NULL,
  `status` varchar(200) NOT NULL,
  `user_id_luar` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Trigger `rusak_luar`
--
DELIMITER $$
CREATE TRIGGER `tg_rusak_luar` AFTER INSERT ON `rusak_luar` FOR EACH ROW BEGIN
UPDATE barangs
SET jumlah = jumlah - NEW.jumlah_rusak_luar
WHERE
id_barang = NEW.id_barang_rusak_luar;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `rusak_ruangan`
--

CREATE TABLE `rusak_ruangan` (
  `id_rusak_ruangan` int(11) NOT NULL,
  `id_barang_rusak` varchar(200) NOT NULL,
  `jumlah_rusak_ruangan` varchar(200) NOT NULL,
  `id_ruangan_rusak` varchar(200) DEFAULT '0',
  `tanggal_rusak` date NOT NULL,
  `status` varchar(200) NOT NULL,
  `user_id_ruangan` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Trigger `rusak_ruangan`
--
DELIMITER $$
CREATE TRIGGER `tg_rusak_ruangan` AFTER INSERT ON `rusak_ruangan` FOR EACH ROW BEGIN
UPDATE input_ruangan
SET jumlah_masuk = jumlah_masuk - NEW.jumlah_rusak_ruangan
WHERE
id_barang = NEW.id_barang_rusak
AND
id_ruangan_barang=NEW.id_ruangan_rusak;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(70) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `level` enum('rayon','pj','admin','bukan_pj') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `username`, `password`, `level`, `remember_token`, `created_at`, `updated_at`) VALUES
(6, 'Administrator', 'admin@gmail.com', NULL, 'admin', '$2y$10$2vQoAVpSrVg1sAKntqgHEec.PLGMgSHDHD9EO6pfk6TtRePh4tavG', 'admin', NULL, '2019-11-26 17:49:45', '2020-01-04 19:56:19'),
(25, 'KaSetya Muhamad', 'arimuhamadsetiawan@gmail.com', NULL, 'admin@gmail.com', '$2y$10$2vQoAVpSrVg1sAKntqgHEec.PLGMgSHDHD9EO6pfk6TtRePh4tavG', 'rayon', 'uWSXbZAwK4iZFQZLRLCEN0jifrKquV4o0WR7wFbKEnqd4CMVXtkgXcUz7OLC', '2022-03-05 00:01:20', '2022-04-22 22:49:15'),
(26, 'PJ KaSetya', 'pj123@gmail.com', NULL, 'pj123456', '$2y$10$Xf3FUiUvQzuwo.SAYOGbL.fSD64DlgeC6Eir.S4UF3fEZd75RKQVy', 'pj', NULL, '2022-03-05 00:43:22', '2022-03-05 00:43:22'),
(27, 'Bagas Setya', 'bagas@gmail.com', NULL, 'bagas123', '$2y$10$DjS6L0UCaqxzTSd741sEYui83rzM80KvsYUjplMjNQSUGEE7igPkS', 'bukan_pj', NULL, '2022-03-05 01:20:00', '2022-03-05 01:20:00');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `barangs`
--
ALTER TABLE `barangs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_barang` (`id_barang`);

--
-- Indeks untuk tabel `input_ruangan`
--
ALTER TABLE `input_ruangan`
  ADD PRIMARY KEY (`id_input_ruangan`);

--
-- Indeks untuk tabel `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indeks untuk tabel `keluar`
--
ALTER TABLE `keluar`
  ADD PRIMARY KEY (`id_keluar`);

--
-- Indeks untuk tabel `keranjang_keluar`
--
ALTER TABLE `keranjang_keluar`
  ADD PRIMARY KEY (`id_keluar`);

--
-- Indeks untuk tabel `keranjang_masuk`
--
ALTER TABLE `keranjang_masuk`
  ADD PRIMARY KEY (`id_masuk`);

--
-- Indeks untuk tabel `keranjang_peminjaman`
--
ALTER TABLE `keranjang_peminjaman`
  ADD PRIMARY KEY (`id_peminjaman`);

--
-- Indeks untuk tabel `keranjang_ruangan`
--
ALTER TABLE `keranjang_ruangan`
  ADD PRIMARY KEY (`id_input_ruangan`);

--
-- Indeks untuk tabel `keranjang_rusak_luar`
--
ALTER TABLE `keranjang_rusak_luar`
  ADD PRIMARY KEY (`id_rusak_luar`);

--
-- Indeks untuk tabel `keranjang_rusak_ruangan`
--
ALTER TABLE `keranjang_rusak_ruangan`
  ADD PRIMARY KEY (`id_rusak_ruangan`);

--
-- Indeks untuk tabel `masuk`
--
ALTER TABLE `masuk`
  ADD PRIMARY KEY (`id_masuk`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indeks untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`id_peminjaman`);

--
-- Indeks untuk tabel `ruangan`
--
ALTER TABLE `ruangan`
  ADD PRIMARY KEY (`id_ruangan`);

--
-- Indeks untuk tabel `rusak_luar`
--
ALTER TABLE `rusak_luar`
  ADD PRIMARY KEY (`id_rusak_luar`);

--
-- Indeks untuk tabel `rusak_ruangan`
--
ALTER TABLE `rusak_ruangan`
  ADD PRIMARY KEY (`id_rusak_ruangan`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `barangs`
--
ALTER TABLE `barangs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT untuk tabel `input_ruangan`
--
ALTER TABLE `input_ruangan`
  MODIFY `id_input_ruangan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT untuk tabel `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int(200) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `keluar`
--
ALTER TABLE `keluar`
  MODIFY `id_keluar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT untuk tabel `keranjang_keluar`
--
ALTER TABLE `keranjang_keluar`
  MODIFY `id_keluar` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `keranjang_masuk`
--
ALTER TABLE `keranjang_masuk`
  MODIFY `id_masuk` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `keranjang_peminjaman`
--
ALTER TABLE `keranjang_peminjaman`
  MODIFY `id_peminjaman` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `keranjang_ruangan`
--
ALTER TABLE `keranjang_ruangan`
  MODIFY `id_input_ruangan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `keranjang_rusak_luar`
--
ALTER TABLE `keranjang_rusak_luar`
  MODIFY `id_rusak_luar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `keranjang_rusak_ruangan`
--
ALTER TABLE `keranjang_rusak_ruangan`
  MODIFY `id_rusak_ruangan` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `masuk`
--
ALTER TABLE `masuk`
  MODIFY `id_masuk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  MODIFY `id_peminjaman` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT untuk tabel `ruangan`
--
ALTER TABLE `ruangan`
  MODIFY `id_ruangan` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT untuk tabel `rusak_luar`
--
ALTER TABLE `rusak_luar`
  MODIFY `id_rusak_luar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT untuk tabel `rusak_ruangan`
--
ALTER TABLE `rusak_ruangan`
  MODIFY `id_rusak_ruangan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
