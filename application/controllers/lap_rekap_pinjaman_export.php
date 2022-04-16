<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Lap_rekap_pinjaman_export extends AdminController {

	public function __construct() {
		parent::__construct();	
		$this->load->helper('fungsi');
		$this->load->model('general_m');
		$this->load->model('pinjaman_m');
	}	


	function cetak_laporan() {
		<?php
                      // Fungsi header dengan mengirimkan raw data excel
                      header("Content-type: application/vnd-ms-excel");
                       
                      // Mendefinisikan nama file ekspor "rekap_pinjaman.xls"
                      header("Content-Disposition: attachment; filename=exp-rekap-pinjaman.xls");
                       
                      // Tambahkan table
                      //include 'data.php';

                      $data_pinjam = $this->pinjaman_m->lap_data_pinjaman();
		if($data_pinjam == FALSE) {
			echo 'DATA KOSONG<br>Pastikan Filter Tanggal dengan benar.';
			exit();
		}
                

 		<table>
			<tr >
				<th> No </th>
				<th> Nomor Kontrak</th>
				<th> Nama Anggota</th>
				<th> Tanggal Pinjam  </th>
				<th> Total Tagihan </th>
				<th> Jumlah Angsuran  </th>
				<th> Sisa Tagihan  </th>
				<th> Sisa Angsuran  </th>
			</tr>';


			

		$no =1;
		$batas = 1;
		$total_pinjaman = 0;
		$total_denda = 0;
		$total_tagihan = 0;
		$tot_sdh_dibayar = 0;
		$tot_sisa_tagihan = 0;
		foreach ($data_pinjam as $r) {

			$barang = $this->pinjaman_m->get_data_barang($r->barang_id);   
			$anggota = $this->general_m->get_data_anggota($r->anggota_id);   
			$jml_bayar = $this->general_m->get_jml_bayar($r->id); 
			$jml_denda = $this->general_m->get_jml_denda($r->id); 
			$jml_tagihan = $r->tagihan + $jml_denda->total_denda;
			$sisa_tagihan = $jml_tagihan - $jml_bayar->total;


			//total pinjaman
			$total_pinjaman += @$r->jumlah;
			//total tagihan
			$total_tagihan += $jml_tagihan;
			//total dibayar
			$tot_sdh_dibayar += $jml_bayar->total;
			//sisa tagihan
			$tot_sisa_tagihan += $sisa_tagihan;

			//jabatan
			if ($anggota->jabatan_id == "1"){
				$jabatan = "Pengurus";
			} else {
				$jabatan = "Anggota";
			}

			//jk
			if ($anggota->jk == "L"){
				$jk = "Laki-laki";
			} else {
				$jk = "Perempuan";
			}

			$tgl_pinjam = explode(' ', $r->tgl_pinjam);
			$txt_tanggal = jin_date_ina($tgl_pinjam[0],'full');

			$tgl_tempo = explode(' ', $r->tempo);
			$txt_tempo = jin_date_ina($tgl_tempo[0],'full');

			$sisa_angsur = 0;
			if($r->lunas == 'Belum') {
				$sisa_angsur = $r->lama_angsuran - $r->bln_sudah_angsur;
			}


			// AG'.sprintf('%04d',$anggota->id).'
			//$html .= '
			<tr">
				<td>'.$no++.' </td>
				<td>'.'PJ'.sprintf('%05d',$r->id).'</td>
				<td><strong>'.strtoupper($anggota->nama). ' <br>'.$anggota->departement.'</strong></td>
                               	<td>'.$txt_tanggal.'</td>
				<td> '.number_format(nsi_round($r->tagihan)).' </td>
				<td> '.number_format(nsi_round(@$r->ags_per_bulan)).'</td>
				<td ><strong>'.number_format(nsi_round($sisa_tagihan)).'</strong></td>
                                <td ><strong>'.number_format(nsi_round($sisa_angsur)).'</strong></td>



			</tr>';
			}


				<tr>
					<td> <strong> Total Pokok Pinjaman </strong> </td>
					<td><strong> '.number_format(nsi_round($total_pinjaman)).' </strong></td>
					<td></td>
				</tr>
				<tr>
					<td> <strong> Total Tagihan </strong> </td>
					<td><strong>'.number_format(nsi_round($total_tagihan)).'</strong></td>
					<td></td>
				</tr>
				<tr>
					<td> <strong> Total Dibayar </strong> </td>
					<td><strong>'.number_format(nsi_round($tot_sdh_dibayar)).'</strong></td>
					<td></td>
				</tr>
				<tr>
					<td> <strong> Sisa Tagihan </strong> </td>
					<td><strong>'.number_format(nsi_round($tot_sisa_tagihan)).'</strong></td>
					<td></td>
				</tr>
			</table>';
                      ?>
	}
}