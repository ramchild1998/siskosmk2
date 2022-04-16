<?php
// Fungsi header dengan mengirimkan raw data excel
header("Content-type: application/vnd-ms-excel");
 
// Mendefinisikan nama file ekspor "rekap_pinjaman.xls"
header("Content-Disposition: attachment; filename=exp-rekap-pinjaman.xls");
 
// Tambahkan table
include 'data.php';
?>