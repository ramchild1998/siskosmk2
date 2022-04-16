<?php

error_reporting(0);
include "conn.php";


$connection = mysqli_connect($dbHost, $dbUser, $dbPass , $dbName);
//Menghasilkan backup DB
backupDatabaseTables($dbHost, $dbUser, $dbPass , $dbName);

 if (mysqli_connect_errno())  {
	echo "Failed to connect to MySQL: " . mysql_connect_error();
	print  ("<br><br>");
	echo "BACKUP DATA GAGAL !!! ";
	print  ("<br><br>");
	echo "Lihat Petunjuk BACKUP DATA .....";
	exit;
       }



function backupDatabaseTables($dbHost,$dbUsername,$dbPassword,$dbName,$tables = '*'){

  //menghubungkan & memilih DB
    $db = new mysqli($dbHost, $dbUsername, $dbPassword, $dbName);

 //Mendapatkan semua Table
 if($tables == '*'){
  $tables = array();
  $result = $db->query("SHOW TABLES");
  while($row = $result->fetch_row()){
   $tables[] = $row[0];
  }
 }else{
  $tables = is_array($tables)?$tables:explode(',',$tables);
 }

 //Loop melalui Table
 foreach($tables as $table){
  $result = $db->query("SELECT * FROM $table");
  $numColumns = $result->field_count;

  $return .= "DROP TABLE $table;";

        $result2 = $db->query("SHOW CREATE TABLE $table");
        $row2 = $result2->fetch_row();

  $return .= "\n\n".$row2[1].";\n\n";

  for($i = 0; $i < $numColumns; $i++){
   while($row = $result->fetch_row()){
    $return .= "INSERT INTO $table VALUES(";
    for($j=0; $j < $numColumns; $j++){
     $row[$j] = addslashes($row[$j]);
     $row[$j] = ereg_replace("\n","\\n",$row[$j]);
     if (isset($row[$j])) { $return .= '"'.$row[$j].'"' ; } else { $return .= '""'; }
     if ($j < ($numColumns-1)) { $return.= ','; }
    }
    $return .= ");\n";
   }
  }
  $return .= "\n\n\n";
 }



 //simpan file
  $fileName = 'DB_KOPERASI_DUTASEHATI_BACKUP_'.date('Y-m-d').'-'.time().'.sql';
// $handle = fopen('DB-backup-Kop-DutaSehatiKepri-'.date('d-m-Y').'-'.time().'.sql','w+');
  $handle = fopen($fileName,'w+');
 fwrite($handle,$return);
 //fclose($handle);
 
 if(fclose($handle)){
    //    echo "Done, the file name is: ".$fileName;
    echo "SET FOREIGN_KEY_CHECKS = 0; ";  

    header('Content-Description: File Transfer');
    header('Content-Type: application/octet-stream');
    header('Content-Disposition: attachment; filename="'.$fileName.'"');
    header('Expires: 0');
    //header('Cache-Control: must-revalidate');
    header('Pragma: public');
    header('Content-Length: ' . filesize($fileName));
    readfile($fileName);
		
		exit; 
    }
}
mysqli_close($connection);
echo "Database Backup Successfully.... ";

exit;

?>