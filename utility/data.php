<table border="1">
 <tr>
 <th>NO.</th>
 <th>ID ANGGOTA</th>
  <th>NAMA</th>
   <th>DEPARTEMEN</th>
 <th>TANGGAL PINJAM</th>
 <th>TOTAL TAGIHAN</th>
 <th>ANGSURAN PER BULAN</th>
  <th>LAMA ANGSURAN</th>
    <th>ANGSURAN KE</th>
 <th> JATUH TEMPO </th>
<th>LUNAS</th>
 </tr>
 <?php
 
 error_reporting(0);
include "conn.php";

 //koneksi ke database
 //mysql_connect("localhost", "root", "");
// mysql_select_db("pcm");
 
 //query menampilkan data
 $sql = mysql_query("SELECT c.*, p.* FROM tbl_anggota c, v_hitung_pinjaman p  WHERE c.id=p.anggota_id");
                $no = 1;
                $sisa_tagihan=0;
 while($data = mysql_fetch_array($sql)){

                // $sisa_tagihan=  $data['bln_sdh_angsur']  ;
 echo '
 <tr>
 <td>'.$no.'</td>
 <td>'.$data['anggota_id'].'</td>
 <td>'.$data['nama'].'</td>
 <td>'.$data['departement'].'</td>
 <td>'.$data['tgl_pinjam'].'</td>
 <td>'.$data['tagihan'].'</td>
 <td>'.$data['ags_per_bulan'].'</td>
  <td>'.$data['lama_angsuran'].'</td>
    <td>'.$data['bln_sudah_angsur'].'</td>
  <td>'.$data['tempo'].'</td>
 <td>'.$data['lunas'].'</td>

 </tr>
 </tr>
 ';
 $no++;
 }
 ?>
</table>