SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

CREATE TABLE `ci_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `user_data` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE `jns_akun` (
  `id` bigint(20) NOT NULL,
  `kd_aktiva` varchar(5) DEFAULT NULL,
  `jns_trans` varchar(50) NOT NULL,
  `akun` enum('Aktiva','Pasiva') DEFAULT NULL,
  `laba_rugi` enum('','PENDAPATAN','BIAYA') NOT NULL DEFAULT '',
  `pemasukan` enum('Y','N') DEFAULT NULL,
  `pengeluaran` enum('Y','N') DEFAULT NULL,
  `aktif` enum('Y','N') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `jns_akun` (`id`, `kd_aktiva`, `jns_trans`, `akun`, `laba_rugi`, `pemasukan`, `pengeluaran`, `aktif`) VALUES
(5, 'A4', 'Piutang Usaha', 'Aktiva', '', 'Y', 'Y', 'Y'),
(6, 'A5', 'Piutang Karyawan', 'Aktiva', '', 'N', 'Y', 'N'),
(7, 'A6', 'Pinjaman Anggota', 'Aktiva', '', NULL, NULL, 'Y'),
(8, 'A7', 'Piutang Anggota', 'Aktiva', '', 'Y', 'Y', 'N'),
(9, 'A8', 'Persediaan Barang', 'Aktiva', '', 'N', 'Y', 'Y'),
(10, 'A9', 'Biaya Dibayar Dimuka', 'Aktiva', '', 'N', 'Y', 'Y'),
(11, 'A10', 'Perlengkapan Usaha', 'Aktiva', '', 'N', 'Y', 'Y'),
(17, 'C', 'Aktiva Tetap Berwujud', 'Aktiva', '', NULL, NULL, 'Y'),
(18, 'C1', 'Peralatan Kantor', 'Aktiva', '', 'N', 'Y', 'Y'),
(19, 'C2', 'Inventaris Kendaraan', 'Aktiva', '', 'N', 'Y', 'Y'),
(20, 'C3', 'Mesin', 'Aktiva', '', 'N', 'Y', 'Y'),
(21, 'C4', 'Aktiva Tetap Lainnya', 'Aktiva', '', 'Y', 'N', 'Y'),
(26, 'E', 'Modal Pribadi', 'Aktiva', '', NULL, NULL, 'N'),
(27, 'E1', 'Prive', 'Aktiva', '', 'Y', 'Y', 'N'),
(28, 'F', 'Utang', 'Pasiva', '', NULL, NULL, 'Y'),
(29, 'F1', 'Utang Usaha', 'Pasiva', '', 'Y', 'Y', 'Y'),
(31, 'K3', 'Pengeluaran Lainnya', 'Aktiva', '', 'N', 'Y', 'N'),
(32, 'F4', 'Simpanan Sukarela', 'Pasiva', '', NULL, NULL, 'Y'),
(33, 'F5', 'Utang Pajak', 'Pasiva', '', 'Y', 'Y', 'Y'),
(36, 'H', 'Utang Jangka Panjang', 'Pasiva', '', NULL, NULL, 'Y'),
(37, 'H1', 'Utang Bank', 'Pasiva', '', 'Y', 'Y', 'Y'),
(38, 'H2', 'Obligasi', 'Pasiva', '', 'Y', 'Y', 'N'),
(39, 'I', 'Modal', 'Pasiva', '', NULL, NULL, 'Y'),
(40, 'I1', 'Simpanan Pokok', 'Pasiva', '', NULL, NULL, 'Y'),
(41, 'I2', 'Simpanan Wajib', 'Pasiva', '', NULL, NULL, 'Y'),
(42, 'I3', 'Modal Awal', 'Pasiva', '', 'Y', 'Y', 'Y'),
(43, 'I4', 'Modal Penyertaan', 'Pasiva', '', 'Y', 'Y', 'N'),
(44, 'I5', 'Modal Sumbangan', 'Pasiva', '', 'Y', 'Y', 'Y'),
(45, 'I6', 'Modal Cadangan', 'Pasiva', '', 'Y', 'Y', 'Y'),
(47, 'J', 'Pendapatan', 'Pasiva', 'PENDAPATAN', NULL, NULL, 'Y'),
(48, 'J1', 'Pembayaran Angsuran', 'Pasiva', '', NULL, NULL, 'Y'),
(49, 'J2', 'Pendapatan Lainnya', 'Pasiva', 'PENDAPATAN', 'Y', 'N', 'Y'),
(50, 'K', 'Beban', 'Aktiva', '', NULL, NULL, 'Y'),
(52, 'K2', 'Beban Gaji Karyawan', 'Aktiva', 'BIAYA', 'N', 'Y', 'Y'),
(53, 'K3', 'Biaya Listrik dan Air', 'Aktiva', 'BIAYA', 'N', 'Y', 'Y'),
(54, 'K4', 'Biaya Transportasi', 'Aktiva', 'BIAYA', 'N', 'Y', 'Y'),
(60, 'K10', 'Biaya Lainnya', 'Aktiva', 'BIAYA', 'N', 'Y', 'Y'),
(110, 'TRF', 'Transfer Antar Kas', NULL, '', NULL, NULL, 'N'),
(111, 'A11', 'Permisalan', 'Aktiva', '', 'Y', 'Y', 'Y');

CREATE TABLE `jns_angsuran` (
  `id` bigint(20) NOT NULL,
  `ket` int(11) NOT NULL,
  `aktif` enum('Y','T','','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `jns_angsuran` (`id`, `ket`, `aktif`) VALUES
(1, 3, 'Y'),
(2, 6, 'Y'),
(3, 18, 'Y'),
(11, 24, 'Y'),
(12, 36, 'Y'),
(13, 5, 'Y');

CREATE TABLE `jns_simpan` (
  `id` int(5) NOT NULL,
  `jns_simpan` varchar(30) NOT NULL,
  `jumlah` double NOT NULL,
  `tampil` enum('Y','T') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `jns_simpan` (`id`, `jns_simpan`, `jumlah`, `tampil`) VALUES
(32, 'Simpanan Sukarela', 0, 'Y'),
(40, 'Simpanan Pokok', 100000, 'Y'),
(41, 'Simpanan Wajib', 50000, 'Y');

CREATE TABLE `nama_kas_tbl` (
  `id` bigint(20) NOT NULL,
  `nama` varchar(225) CHARACTER SET latin1 NOT NULL,
  `aktif` enum('Y','T') CHARACTER SET latin1 NOT NULL,
  `tmpl_simpan` enum('Y','T') CHARACTER SET latin1 NOT NULL,
  `tmpl_penarikan` enum('Y','T') CHARACTER SET latin1 NOT NULL,
  `tmpl_pinjaman` enum('Y','T') CHARACTER SET latin1 NOT NULL,
  `tmpl_bayar` enum('Y','T') CHARACTER SET latin1 NOT NULL,
  `tmpl_pemasukan` enum('Y','T') NOT NULL,
  `tmpl_pengeluaran` enum('Y','T') NOT NULL,
  `tmpl_transfer` enum('Y','T') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `nama_kas_tbl` (`id`, `nama`, `aktif`, `tmpl_simpan`, `tmpl_penarikan`, `tmpl_pinjaman`, `tmpl_bayar`, `tmpl_pemasukan`, `tmpl_pengeluaran`, `tmpl_transfer`) VALUES
(1, 'Kas Tunai', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y'),
(2, 'Kas Besar', 'Y', 'T', 'T', 'Y', 'T', 'Y', 'Y', 'Y'),
(3, 'Bank BNI', 'Y', 'T', 'T', 'T', 'T', 'Y', 'Y', 'Y');

CREATE TABLE `pekerjaan` (
  `id_kerja` varchar(5) NOT NULL,
  `jenis_kerja` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO `pekerjaan` (`id_kerja`, `jenis_kerja`) VALUES
('1', 'TNI'),
('2', 'PNS'),
('3', 'Karyawan Swasta'),
('4', 'Guru'),
('5', 'Buruh'),
('6', 'Tani'),
('7', 'Pedagang'),
('8', 'Wiraswasta'),
('9', 'Mengurus Rumah Tangga'),
('99', 'Lainnya'),
('98', 'Pensiunan'),
('97', 'Penjahit');

CREATE TABLE `suku_bunga` (
  `id` int(10) NOT NULL,
  `opsi_key` varchar(20) NOT NULL,
  `opsi_val` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `suku_bunga` (`id`, `opsi_key`, `opsi_val`) VALUES
(1, 'bg_tab', '0'),
(2, 'bg_pinjam', '2'),
(3, 'biaya_adm', '1500'),
(4, 'denda', '1000'),
(5, 'denda_hari', '15'),
(6, 'dana_cadangan', '40'),
(7, 'jasa_anggota', '40'),
(8, 'dana_pengurus', '5'),
(9, 'dana_karyawan', '5'),
(10, 'dana_pend', '5'),
(11, 'dana_sosial', '5'),
(12, 'jasa_usaha', '70'),
(13, 'jasa_modal', '30'),
(14, 'pjk_pph', '5'),
(15, 'pinjaman_bunga_tipe', 'A');

CREATE TABLE `tbl_anggota` (
  `id` bigint(20) NOT NULL,
  `nama` varchar(255) CHARACTER SET latin1 NOT NULL,
  `identitas` varchar(255) NOT NULL,
  `jk` enum('L','P') NOT NULL,
  `tmp_lahir` varchar(225) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `status` varchar(30) NOT NULL,
  `agama` varchar(30) NOT NULL,
  `departement` varchar(255) NOT NULL,
  `pekerjaan` varchar(30) NOT NULL,
  `alamat` text CHARACTER SET latin1 NOT NULL,
  `kota` varchar(255) NOT NULL,
  `notelp` varchar(12) NOT NULL,
  `tgl_daftar` date NOT NULL,
  `jabatan_id` int(10) NOT NULL,
  `aktif` enum('Y','N') NOT NULL,
  `pass_word` varchar(225) NOT NULL,
  `file_pic` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_barang` (
  `id` bigint(20) NOT NULL,
  `nm_barang` varchar(255) NOT NULL,
  `type` varchar(50) NOT NULL,
  `merk` varchar(50) NOT NULL,
  `harga` double NOT NULL,
  `jml_brg` int(11) NOT NULL,
  `ket` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `tbl_barang` (`id`, `nm_barang`, `type`, `merk`, `harga`, `jml_brg`, `ket`) VALUES
(1, 'Lemari Es', 'Elektronik', 'Toshiba', 500000, 4, ''),
(2, 'Komputer', 'K300 Corei3', 'Asus', 5000000, 4, ''),
(3, 'Kompor Gas', 'Tr675000', 'Rinai', 100000, 7, ''),
(4, 'Pinjaman Uang', 'Uang', '-', 0, 0, '');

CREATE TABLE `tbl_pengajuan` (
  `id` bigint(20) NOT NULL,
  `no_ajuan` int(11) NOT NULL,
  `ajuan_id` varchar(255) NOT NULL,
  `anggota_id` bigint(20) NOT NULL,
  `tgl_input` datetime NOT NULL,
  `jenis` varchar(255) NOT NULL,
  `nominal` bigint(20) NOT NULL,
  `lama_ags` int(11) NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `alasan` varchar(255) NOT NULL,
  `tgl_cair` date NOT NULL,
  `tgl_update` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_pinjaman_d` (
  `id` bigint(20) NOT NULL,
  `tgl_bayar` datetime NOT NULL,
  `pinjam_id` bigint(20) NOT NULL,
  `angsuran_ke` bigint(20) NOT NULL,
  `jumlah_bayar` int(11) NOT NULL,
  `denda_rp` int(11) NOT NULL,
  `terlambat` int(11) NOT NULL,
  `ket_bayar` enum('Angsuran','Pelunasan','Bayar Denda') NOT NULL,
  `dk` enum('D','K') NOT NULL,
  `kas_id` bigint(20) NOT NULL,
  `jns_trans` bigint(20) NOT NULL,
  `update_data` datetime NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `keterangan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_pinjaman_h` (
  `id` bigint(20) NOT NULL,
  `tgl_pinjam` datetime NOT NULL,
  `anggota_id` bigint(20) NOT NULL,
  `barang_id` bigint(20) NOT NULL,
  `lama_angsuran` bigint(20) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `bunga` float(10,2) NOT NULL,
  `biaya_adm` int(11) NOT NULL,
  `lunas` enum('Belum','Lunas') NOT NULL,
  `dk` enum('D','K') NOT NULL,
  `kas_id` bigint(20) NOT NULL,
  `jns_trans` bigint(20) NOT NULL,
  `update_data` datetime NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `contoh` int(23) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_setting` (
  `id` bigint(20) NOT NULL,
  `opsi_key` varchar(255) NOT NULL,
  `opsi_val` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `tbl_setting` (`id`, `opsi_key`, `opsi_val`) VALUES
(1, 'nama_lembaga', 'KOPERASI MITRA USAHA BERDIKARI'),
(2, 'nama_ketua', 'BAMBANG '),
(3, 'hp_ketua', '08123235468'),
(4, 'alamat', 'Jl. Jati Padang Raya '),
(5, 'telepon', '021-123456789'),
(6, 'kota', 'DKI Jakarta'),
(7, 'email', 'mub_koperasi@gmail.com'),
(8, 'web', 'mub-koperasi.blogspot.com');

CREATE TABLE `tbl_trans_kas` (
  `id` bigint(20) NOT NULL,
  `tgl_catat` datetime NOT NULL,
  `jumlah` double NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `akun` enum('Pemasukan','Pengeluaran','Transfer') NOT NULL,
  `dari_kas_id` bigint(20) DEFAULT NULL,
  `untuk_kas_id` bigint(20) DEFAULT NULL,
  `jns_trans` bigint(20) DEFAULT NULL,
  `dk` enum('D','K') DEFAULT NULL,
  `update_data` datetime NOT NULL,
  `user_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_trans_sp` (
  `id` bigint(20) NOT NULL,
  `tgl_transaksi` datetime NOT NULL,
  `anggota_id` bigint(20) NOT NULL,
  `jenis_id` int(5) NOT NULL,
  `jumlah` double NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `akun` enum('Setoran','Penarikan') NOT NULL,
  `dk` enum('D','K') NOT NULL,
  `kas_id` bigint(20) NOT NULL,
  `update_data` datetime NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `nama_penyetor` varchar(255) NOT NULL,
  `no_identitas` varchar(20) NOT NULL,
  `alamat` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_user` (
  `id` bigint(20) NOT NULL,
  `u_name` varchar(255) NOT NULL,
  `pass_word` varchar(255) NOT NULL,
  `aktif` enum('Y','N') NOT NULL,
  `level` enum('admin','operator','pinjaman') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `tbl_user` (`id`, `u_name`, `pass_word`, `aktif`, `level`) VALUES
(1, 'admin', '224bec3dd08832bc6a69873f15a50df406045f40', 'Y', 'admin'),
(4, 'user', 'e22b7d59cb35d199ab7e54ed0f2ef58f5da5347b', 'Y', 'operator'),
(5, 'pinjaman', 'efd2770f6782f7218be595baf2fc16bc7cf45143', 'Y', 'pinjaman');
CREATE TABLE `v_hitung_pinjaman` (
`id` bigint(20)
,`tgl_pinjam` datetime
,`anggota_id` bigint(20)
,`lama_angsuran` bigint(20)
,`jumlah` int(11)
,`bunga` float(10,2)
,`biaya_adm` int(11)
,`lunas` enum('Belum','Lunas')
,`dk` enum('D','K')
,`kas_id` bigint(20)
,`user_name` varchar(255)
,`pokok_angsuran` decimal(14,4)
,`bunga_pinjaman` double(17,0)
,`ags_per_bulan` double(17,0)
,`tempo` datetime
,`tagihan` double(17,0)
,`keterangan` varchar(255)
,`barang_id` bigint(20)
);
CREATE TABLE `v_transaksi` (
`tbl` varchar(1)
,`id` bigint(20)
,`tgl` datetime
,`kredit` double
,`debet` double
,`dari_kas` bigint(20)
,`untuk_kas` bigint(20)
,`transaksi` bigint(20)
,`ket` varchar(255)
,`user` varchar(255)
);

DROP TABLE IF EXISTS `v_hitung_pinjaman`;
CREATE VIEW `v_hitung_pinjaman` AS SELECT `tbl_pinjaman_h`.`id` AS `id`,`tbl_pinjaman_h`.`tgl_pinjam` AS `tgl_pinjam`,`tbl_pinjaman_h`.`anggota_id` AS `anggota_id`,`tbl_pinjaman_h`.`lama_angsuran` AS `lama_angsuran`,`tbl_pinjaman_h`.`jumlah` AS `jumlah`,`tbl_pinjaman_h`.`bunga` AS `bunga`,`tbl_pinjaman_h`.`biaya_adm` AS `biaya_adm`,`tbl_pinjaman_h`.`lunas` AS `lunas`,`tbl_pinjaman_h`.`dk` AS `dk`,`tbl_pinjaman_h`.`kas_id` AS `kas_id`,`tbl_pinjaman_h`.`user_name` AS `user_name`,(`tbl_pinjaman_h`.`jumlah` / `tbl_pinjaman_h`.`lama_angsuran`) AS `pokok_angsuran`, round(ceiling((((`tbl_pinjaman_h`.`jumlah` / `tbl_pinjaman_h`.`lama_angsuran`) * `tbl_pinjaman_h`.`bunga`) / 100)),-(2)) AS `bunga_pinjaman`, round(ceiling((((((((`tbl_pinjaman_h`.`jumlah` / `tbl_pinjaman_h`.`lama_angsuran`) * `tbl_pinjaman_h`.`bunga`) / 100) + (`tbl_pinjaman_h`.`jumlah` / `tbl_pinjaman_h`.`lama_angsuran`)) + `tbl_pinjaman_h`.`biaya_adm`) * 100) / 100)),-(2)) AS `ags_per_bulan`, (`tbl_pinjaman_h`.`tgl_pinjam` + interval `tbl_pinjaman_h`.`lama_angsuran` month) AS `tempo`, (round(ceiling((((((((`tbl_pinjaman_h`.`jumlah` / `tbl_pinjaman_h`.`lama_angsuran`) * `tbl_pinjaman_h`.`bunga`) / 100) + (`tbl_pinjaman_h`.`jumlah` / `tbl_pinjaman_h`.`lama_angsuran`)) + `tbl_pinjaman_h`.`biaya_adm`) * 100) / 100)),-(2)) * `tbl_pinjaman_h`.`lama_angsuran`) AS `tagihan`, `tbl_pinjaman_h`.`keterangan` AS `keterangan`,`tbl_pinjaman_h`.`barang_id` AS `barang_id`, IFNULL(MAX(`tbl_pinjaman_d`.`angsuran_ke`), 0) AS `bln_sudah_angsur` FROM `tbl_pinjaman_h` LEFT JOIN `tbl_pinjaman_d` ON `tbl_pinjaman_h`.`id` = `tbl_pinjaman_d`.`pinjam_id` GROUP BY `tbl_pinjaman_h`.`id`;

DROP TABLE IF EXISTS `v_transaksi`;
CREATE VIEW `v_transaksi`  AS  select 'A' AS `tbl`,`tbl_pinjaman_h`.`id` AS `id`,`tbl_pinjaman_h`.`tgl_pinjam` AS `tgl`,`tbl_pinjaman_h`.`jumlah` AS `kredit`,0 AS `debet`,`tbl_pinjaman_h`.`kas_id` AS `dari_kas`,NULL AS `untuk_kas`,`tbl_pinjaman_h`.`jns_trans` AS `transaksi`,`tbl_pinjaman_h`.`keterangan` AS `ket`,`tbl_pinjaman_h`.`user_name` AS `user` from `tbl_pinjaman_h` union select 'B' AS `tbl`,`tbl_pinjaman_d`.`id` AS `id`,`tbl_pinjaman_d`.`tgl_bayar` AS `tgl`,0 AS `kredit`,`tbl_pinjaman_d`.`jumlah_bayar` AS `debet`,NULL AS `dari_kas`,`tbl_pinjaman_d`.`kas_id` AS `untuk_kas`,`tbl_pinjaman_d`.`jns_trans` AS `transaksi`,`tbl_pinjaman_d`.`keterangan` AS `ket`,`tbl_pinjaman_d`.`user_name` AS `user` from `tbl_pinjaman_d` union select 'C' AS `tbl`,`tbl_trans_sp`.`id` AS `id`,`tbl_trans_sp`.`tgl_transaksi` AS `tgl`,if((`tbl_trans_sp`.`dk` = 'K'),`tbl_trans_sp`.`jumlah`,0) AS `kredit`,if((`tbl_trans_sp`.`dk` = 'D'),`tbl_trans_sp`.`jumlah`,0) AS `debet`,if((`tbl_trans_sp`.`dk` = 'K'),`tbl_trans_sp`.`kas_id`,NULL) AS `dari_kas`,if((`tbl_trans_sp`.`dk` = 'D'),`tbl_trans_sp`.`kas_id`,NULL) AS `untuk_kas`,`tbl_trans_sp`.`jenis_id` AS `transaksi`,`tbl_trans_sp`.`keterangan` AS `ket`,`tbl_trans_sp`.`user_name` AS `user` from `tbl_trans_sp` union select 'D' AS `tbl`,`tbl_trans_kas`.`id` AS `id`,`tbl_trans_kas`.`tgl_catat` AS `tgl`,if((`tbl_trans_kas`.`dk` = 'K'),`tbl_trans_kas`.`jumlah`,if(isnull(`tbl_trans_kas`.`dk`),`tbl_trans_kas`.`jumlah`,0)) AS `kredit`,if((`tbl_trans_kas`.`dk` = 'D'),`tbl_trans_kas`.`jumlah`,if(isnull(`tbl_trans_kas`.`dk`),`tbl_trans_kas`.`jumlah`,0)) AS `debet`,`tbl_trans_kas`.`dari_kas_id` AS `dari_kas`,`tbl_trans_kas`.`untuk_kas_id` AS `untuk_kas`,`tbl_trans_kas`.`jns_trans` AS `transaksi`,`tbl_trans_kas`.`keterangan` AS `ket`,`tbl_trans_kas`.`user_name` AS `user` from `tbl_trans_kas` order by `tgl` ;


ALTER TABLE `ci_sessions`
  ADD PRIMARY KEY (`session_id`),
  ADD KEY `last_activity_idx` (`last_activity`);

ALTER TABLE `jns_akun`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kd_aktiva` (`kd_aktiva`);

ALTER TABLE `jns_angsuran`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `jns_simpan`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `nama_kas_tbl`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `suku_bunga`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `tbl_anggota`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `identitas` (`identitas`);

ALTER TABLE `tbl_barang`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `tbl_pengajuan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`anggota_id`);

ALTER TABLE `tbl_pinjaman_d`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kas_id` (`kas_id`),
  ADD KEY `user_name` (`user_name`),
  ADD KEY `pinjam_id` (`pinjam_id`),
  ADD KEY `jns_trans` (`jns_trans`);

ALTER TABLE `tbl_pinjaman_h`
  ADD PRIMARY KEY (`id`),
  ADD KEY `anggota_id` (`anggota_id`),
  ADD KEY `kas_id` (`kas_id`),
  ADD KEY `user_name` (`user_name`),
  ADD KEY `jns_trans` (`jns_trans`),
  ADD KEY `barang_id` (`barang_id`);

ALTER TABLE `tbl_setting`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `tbl_trans_kas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_name` (`user_name`),
  ADD KEY `dari_kas_id` (`dari_kas_id`,`untuk_kas_id`),
  ADD KEY `untuk_kas_id` (`untuk_kas_id`),
  ADD KEY `jns_trans` (`jns_trans`);

ALTER TABLE `tbl_trans_sp`
  ADD PRIMARY KEY (`id`),
  ADD KEY `anggota_id` (`anggota_id`),
  ADD KEY `jenis_id` (`jenis_id`),
  ADD KEY `kas_id` (`kas_id`),
  ADD KEY `user_name` (`user_name`);

ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_name` (`u_name`);


ALTER TABLE `jns_akun`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;
ALTER TABLE `jns_angsuran`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
ALTER TABLE `jns_simpan`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;
ALTER TABLE `nama_kas_tbl`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
ALTER TABLE `suku_bunga`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
ALTER TABLE `tbl_anggota`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
ALTER TABLE `tbl_barang`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
ALTER TABLE `tbl_pengajuan`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
ALTER TABLE `tbl_pinjaman_d`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
ALTER TABLE `tbl_pinjaman_h`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
ALTER TABLE `tbl_setting`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
ALTER TABLE `tbl_trans_kas`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
ALTER TABLE `tbl_trans_sp`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
ALTER TABLE `tbl_user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

ALTER TABLE `tbl_pengajuan`
  ADD CONSTRAINT `tbl_pengajuan_ibfk_1` FOREIGN KEY (`anggota_id`) REFERENCES `tbl_anggota` (`id`);

ALTER TABLE `tbl_pinjaman_d`
  ADD CONSTRAINT `tbl_pinjaman_d_ibfk_1` FOREIGN KEY (`pinjam_id`) REFERENCES `tbl_pinjaman_h` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_pinjaman_d_ibfk_2` FOREIGN KEY (`kas_id`) REFERENCES `nama_kas_tbl` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_pinjaman_d_ibfk_3` FOREIGN KEY (`user_name`) REFERENCES `tbl_user` (`u_name`) ON DELETE CASCADE,
  ADD CONSTRAINT `tbl_pinjaman_d_ibfk_4` FOREIGN KEY (`jns_trans`) REFERENCES `jns_akun` (`id`) ON UPDATE CASCADE;

ALTER TABLE `tbl_pinjaman_h`
  ADD CONSTRAINT `tbl_pinjaman_h_ibfk_1` FOREIGN KEY (`anggota_id`) REFERENCES `tbl_anggota` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_pinjaman_h_ibfk_2` FOREIGN KEY (`kas_id`) REFERENCES `nama_kas_tbl` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_pinjaman_h_ibfk_3` FOREIGN KEY (`user_name`) REFERENCES `tbl_user` (`u_name`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_pinjaman_h_ibfk_4` FOREIGN KEY (`jns_trans`) REFERENCES `jns_akun` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_pinjaman_h_ibfk_5` FOREIGN KEY (`barang_id`) REFERENCES `tbl_barang` (`id`) ON UPDATE CASCADE;

ALTER TABLE `tbl_trans_kas`
  ADD CONSTRAINT `tbl_trans_kas_ibfk_2` FOREIGN KEY (`user_name`) REFERENCES `tbl_user` (`u_name`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_trans_kas_ibfk_3` FOREIGN KEY (`dari_kas_id`) REFERENCES `nama_kas_tbl` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_trans_kas_ibfk_4` FOREIGN KEY (`untuk_kas_id`) REFERENCES `nama_kas_tbl` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_trans_kas_ibfk_5` FOREIGN KEY (`jns_trans`) REFERENCES `jns_akun` (`id`) ON UPDATE CASCADE;

ALTER TABLE `tbl_trans_sp`
  ADD CONSTRAINT `tbl_trans_sp_ibfk_1` FOREIGN KEY (`anggota_id`) REFERENCES `tbl_anggota` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_trans_sp_ibfk_2` FOREIGN KEY (`kas_id`) REFERENCES `nama_kas_tbl` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_trans_sp_ibfk_4` FOREIGN KEY (`jenis_id`) REFERENCES `jns_simpan` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_trans_sp_ibfk_5` FOREIGN KEY (`user_name`) REFERENCES `tbl_user` (`u_name`) ON UPDATE CASCADE;

