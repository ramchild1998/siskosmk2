<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Cetak_rekap extends OperatorController {

	public function __construct() {
		parent::__construct();

		$this->load->helper('fungsi');
		$this->load->model('general_m');
		$this->load->model('rekap_m');
		$this->load->model('setting_m');
        // angka
		$this->load->library('terbilang');
	}	

	function cetak($id) {
		$row = $this->rekap_m->get_data_pinjam($id);

		$opsi_val_arr = $this->setting_m->get_key_val();
		foreach ($opsi_val_arr as $key => $value){
			$out[$key] = $value;
		}

		$this->load->library('Struk');
		$pdf = new Struk('P', 'mm', 'A4', true, 'UTF-8', false);
		$pdf->set_nsi_header(false);
		$resolution = array(210, 140);
		$pdf->AddPage('L', $resolution);
		
		
		//array keys ini = attribute 'field' di view nya
			$barang = $this->rekap_m->get_data_barang($row->barang_id);
			$anggota = $this->general_m->get_data_anggota($row->anggota_id);
			$jml_bayar = $this->general_m->get_jml_bayar($row->id);
			$jml_denda = $this->general_m->get_jml_denda($row->id);
			$total_tagihan = $row->tagihan + $jml_denda->total_denda;
			$sisa_tagihan = $total_tagihan - $jml_bayar->total;

			$sisa_angsur = 0;
			if($row->lunas == 'Belum') {
				$sisa_angsur = $row->lama_angsuran - $row->bln_sudah_angsur;
			}


		$html = '
		<style>
			.h_tengah {text-align: center;}
			.h_kiri {text-align: left;}
			.h_kanan {text-align: right;}
			.txt_judul {font-size: 12pt; font-weight: bold; padding-bottom: 12px;}
			.header_kolom {background-color: #cccccc; text-align: center; font-weight: bold;}
			.txt_content {font-size: 12pt; text-align: center;}
		</style>';
		$html .= ''.$pdf->nsi_box($text ='
			<table width="100%">
				<tr>
					<td colspan="2" class="h_kiri" class="txt_judul"><strong>'.$out['nama_lembaga'].'</strong>
					</td>
				</tr>
				<tr>
					<td class="h_kiri" width="100%">'.$out['alamat'].' Tel. '.$out['telepon'].'
						<hr width="100%"></td>
					</tr>
				</table>
				', $width = '100%', $spacing = '0', $padding = '1', $border = '0', $align = 'left').'';

		$anggota= $this->general_m->get_data_anggota($row->anggota_id);

		$tgl_bayar = explode(' ', $row->tgl_pinjam);
		$txt_tanggal = jin_date_ina($tgl_bayar[0]);

		$tgl_tempo = explode(' ', $row->tempo);
		$tgl_tempo = jin_date_ina($tgl_tempo[0]); 

        // '.'AG'.sprintf('%05d', $row->anggota_id).'

		$html .='<div class="h_tengah"><strong>BUKTI PEMBAYARAN ANGSURAN </strong> <br> Ref. '.date('Ymd_His').'</div>

		<br> Telah terima pada tanggal '.jin_date_ina(date('Y-m-d')).' untuk angsuran pinjaman sebesar <strong> Rp. '.number_format(nsi_round($row->ags_per_bulan)).' <br>('.$this->terbilang->eja(nsi_round($row->ags_per_bulan)).' RUPIAH) dengan rincian </strong>:
		<br>  <br>
		<table width="100%">   
			<tr>
				<td width="18%"> Nomor Kontrak </td>
				<td width="2%">:</td>
				<td width="18%">'.'PJ'.sprintf('%05d', $row->id).'</td>
				
				<td width="20%"> Total Pinjaman </td>
				<td width="7%">: Rp. </td>
				<td width="15%" class="h_kanan">'.number_format(nsi_round($row->tagihan)).'</td>
			</tr>
			<tr>
				<td> Id Anggota </td>
				<td>:</td>
				<td>'.$anggota->identitas.'</td>
				
				<td width="20%"> Sisa Pinjaman </td>
				<td width="7%">: Rp. </td>
				<td width="15%" class="h_kanan">'.number_format(nsi_round($sisa_tagihan)).'</td>
			</tr>
			<tr>
				<td> Nama Anggota </td>
				<td>:</td>
				<td> <strong>'.strtoupper($anggota->nama).' </strong></td>
				
				<td> Angsuran Pokok </td>
				<td>: Rp. </td>
				<td class="h_kanan">'.number_format($row->pokok_angsuran).'</td>
			</tr>
			<tr>
				<td> Dept </td>
				<td>:</td>
				<td>'.$anggota->departement.'</td>
				
				<td> Biaya Admin </td>
				<td>: Rp. </td>
				<td class="h_kanan">'.number_format($row->biaya_adm).'</td>
			</tr>
			<tr>
				<td> Alamat </td>
				<td>:</td>
				<td>'.$anggota->alamat.'</td>
				
				<td> Angsuran Bunga </td>
				<td>: Rp. </td>
				<td class="h_kanan">'.number_format($row->bunga_pinjaman).'</td>

			</tr>
			<tr>
				<td> Tanggal Pinjam </td>
				<td>:</td>
				<td>'.$txt_tanggal.'</td>
			</tr>
			<tr>
				<td> Tanggal Tempo </td>
				<td>:</td>
				<td>'.$tgl_tempo.'</td>
			</tr>
			<tr>
				<td> Lama Pinjam </td>
				<td>:</td>
				<td>'.$row->lama_angsuran.' Bulan</td>
			</tr>
		</table>

		<br><br>

		<table width="90%">
			<tr>
				<td height="50px"></td>
				<td class="h_tengah">'.$out['kota'].', '.jin_date_ina(date('Y-m-d')).'</td>
			</tr>
			<tr>   <td> </td>
				<td class="h_tengah"> '.strtoupper($row->user_name).'</td>

			</tr>
		</table>';
		$pdf->nsi_html($html);
		$pdf->Output(date('Ymd_His') . '.pdf', 'I');
	} 
}