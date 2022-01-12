-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 12 Jan 2022 pada 12.40
-- Versi server: 10.1.38-MariaDB
-- Versi PHP: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rumahsakit`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `appointment`
--

CREATE TABLE `appointment` (
  `id_pendaftaran` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_jadwal` int(11) NOT NULL,
  `gejala` varchar(256) NOT NULL,
  `pesan` varchar(256) NOT NULL,
  `status_janji` varchar(50) NOT NULL DEFAULT 'queue'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `appointment`
--

INSERT INTO `appointment` (`id_pendaftaran`, `id_user`, `id_jadwal`, `gejala`, `pesan`, `status_janji`) VALUES
(1, 9, 2, 'sakit kepala', 'haiii', 'queue'),
(3, 9, 9, 'alergi', 'halo', 'done'),
(4, 9, 3, 'aduhh', 'aduh', 'queue'),
(6, 9, 2, 'idih', 'idih', 'queue');

-- --------------------------------------------------------

--
-- Struktur dari tabel `checkup`
--

CREATE TABLE `checkup` (
  `id_checkup` int(5) NOT NULL,
  `id_user` int(5) NOT NULL,
  `paket` varchar(128) NOT NULL,
  `tanggal` date NOT NULL,
  `pesan` varchar(248) NOT NULL,
  `status_checkup` varchar(10) NOT NULL DEFAULT 'queue'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `checkup`
--

INSERT INTO `checkup` (`id_checkup`, `id_user`, `paket`, `tanggal`, `pesan`, `status_checkup`) VALUES
(1, 9, 'Woman Silver Packet', '2021-01-05', 'halohlao', 'queue');

-- --------------------------------------------------------

--
-- Struktur dari tabel `doctors`
--

CREATE TABLE `doctors` (
  `id_dokter` int(11) NOT NULL,
  `nama_dokter` varchar(128) NOT NULL,
  `email_dokter` varchar(128) NOT NULL,
  `spesialisasi` varchar(50) NOT NULL,
  `nomor_telepon` varchar(15) NOT NULL,
  `kota` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `doctors`
--

INSERT INTO `doctors` (`id_dokter`, `nama_dokter`, `email_dokter`, `spesialisasi`, `nomor_telepon`, `kota`) VALUES
(2, 'dr. saya', '05311940000038@gmail.com', 'Gigi', '087702840399', 'jakarta'),
(3, 'dr. hahaha', 'okky@gmail.com', 'Anak', '0871513545212', 'bandung'),
(4, 'dr. hihihi', 'hihihi@gmail.com', 'Kanker', '08123456789', 'jakarta'),
(8, 'dr. ku', 'ku@gmail.com', 'Paru-paru', '0871513545212', 'surabaya'),
(9, 'Deftrya Nisa\'ul Hanif', 'deftryanis22@gmail.com', 'Anak', '089525444981', 'Magetan'),
(10, 'cutiya', 'cutiyacantik@gmail.com', 'Kandungan', '0877777777777', 'Pekanbaru');

-- --------------------------------------------------------

--
-- Struktur dari tabel `login`
--

CREATE TABLE `login` (
  `user` int(5) NOT NULL,
  `pasword` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `login`
--

INSERT INTO `login` (`user`, `pasword`) VALUES
(123, 123);

-- --------------------------------------------------------

--
-- Struktur dari tabel `schedule`
--

CREATE TABLE `schedule` (
  `idSchedule` int(11) NOT NULL,
  `idDoctors` int(11) NOT NULL,
  `dateSchedule` date NOT NULL,
  `daySchedule` varchar(10) NOT NULL,
  `starttime` time NOT NULL,
  `endtime` time NOT NULL,
  `avail` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `schedule`
--

INSERT INTO `schedule` (`idSchedule`, `idDoctors`, `dateSchedule`, `daySchedule`, `starttime`, `endtime`, `avail`) VALUES
(2, 1, '2020-12-25', 'Wednesday', '13:00:00', '00:00:00', 'full'),
(3, 1, '2021-01-09', 'Friday', '12:00:00', '12:30:00', 'available'),
(4, 2, '2020-12-27', 'Saturday', '12:00:00', '00:00:00', 'available'),
(5, 3, '2021-01-25', 'Monday', '08:30:00', '09:45:00', 'available'),
(6, 4, '2021-01-09', 'Thursday', '12:00:00', '09:45:00', 'available'),
(7, 5, '2021-01-01', 'Sunday', '15:00:00', '15:45:00', 'available'),
(8, 6, '2020-12-25', 'Thursday', '06:30:00', '09:00:00', 'available'),
(9, 7, '2020-12-16', 'Tuesday', '15:00:00', '00:00:00', 'available'),
(10, 8, '2021-01-15', 'Monday', '13:00:00', '15:45:00', 'available');

-- --------------------------------------------------------

--
-- Struktur dari tabel `spesialisasi`
--

CREATE TABLE `spesialisasi` (
  `jenis_spesialisasi` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `spesialisasi`
--

INSERT INTO `spesialisasi` (`jenis_spesialisasi`) VALUES
('Anak'),
('Bedah Syaraf'),
('Bedah Umum'),
('Dokter Umum'),
('Gigi'),
('Gizi'),
('Jantung'),
('Kandungan'),
('Kanker'),
('Paru-paru'),
('Penyakit Dalam'),
('Psikologi'),
('THT');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `usersId` int(11) NOT NULL,
  `usersName` varchar(128) NOT NULL,
  `usersUsername` varchar(128) NOT NULL,
  `usersEmail` varchar(128) NOT NULL,
  `phoneNumber` varchar(15) NOT NULL,
  `usersPassword` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`usersId`, `usersName`, `usersUsername`, `usersEmail`, `phoneNumber`, `usersPassword`) VALUES
(9, 'zakky okky', 'zakky', 'zakky.okky@gmail.com', '087702840399', '$2y$10$xeG0p4oQ8gBPxTKv51Y0K.AuTeype0IexrbMQNPsrwLTkouI1GG32'),
(11, 'dedede', 'Deftrya', 'deftryanis22@gmail.com', '089525444981', '5cfd267b3ee03622cc49bab295256b16'),
(12, 'budi santoso', 'budi', 'budi@gmail.com', '08123456789', '$2y$10$ONSVqnWN/DNQ9d6JePVQA.iZw9wWXBjLB8a2e2HY88zbFxOJx2LFO');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`id_pendaftaran`);

--
-- Indeks untuk tabel `checkup`
--
ALTER TABLE `checkup`
  ADD PRIMARY KEY (`id_checkup`);

--
-- Indeks untuk tabel `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`id_dokter`);

--
-- Indeks untuk tabel `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`user`);

--
-- Indeks untuk tabel `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`idSchedule`);

--
-- Indeks untuk tabel `spesialisasi`
--
ALTER TABLE `spesialisasi`
  ADD PRIMARY KEY (`jenis_spesialisasi`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`usersId`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `appointment`
--
ALTER TABLE `appointment`
  MODIFY `id_pendaftaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `checkup`
--
ALTER TABLE `checkup`
  MODIFY `id_checkup` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `doctors`
--
ALTER TABLE `doctors`
  MODIFY `id_dokter` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `login`
--
ALTER TABLE `login`
  MODIFY `user` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=124;

--
-- AUTO_INCREMENT untuk tabel `schedule`
--
ALTER TABLE `schedule`
  MODIFY `idSchedule` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `usersId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
