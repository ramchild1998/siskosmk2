<?php
error_reporting(0);
include "conn.php";


$connection = mysqli_connect($dbHost, $dbUser, $dbPass , $dbName);

backup_tables('localhost','root','','$dbName');
 if (mysqli_connect_errno())  {
	echo "Failed to connect to MySQL: " . mysqli_connect_error();
	print  ("<br><br>");
	echo "BACKUP DATA GAGAL !!! ";
	print  ("<br><br>");
	echo "Lihat Petunjuk BACKUP DATA .....";
	exit;
       }
        /* backup the db OR just a table */
//        function backup_tables($host,$user,$pass,$name,$tables = '*')
        function backup_tables($mysql_host, $mysql_username, $mysql_password, $mysql_database,$tables = '*')

        {
        	
        	$link = mysql_connect($host,$user,$pass);
        	mysql_select_db($name,$link);

        	//get all of the tables
        	if($tables == '*')
        	{
        		$tables = array();
        		$result = mysql_query('SHOW TABLES');
        		while($row = mysql_fetch_row($result))
        		{
        			$tables[] = $row[0];
        		}
        	}
        	else
        	{
        		$tables = is_array($tables) ? $tables : explode(',',$tables);
        	}
        	
        	//cycle through
        	foreach($tables as $table)
        	{
        		$result = mysql_query('SELECT * FROM '.$table);
        		$num_fields = mysql_num_fields($result);
        		
        		$return.= 'DROP TABLE IF EXISTS '.$table.';';
        		$row2 = mysql_fetch_row(mysql_query('SHOW CREATE TABLE '.$table));
        		$return.= "\n\n".$row2[1].";\n\n";
        		
        		for ($i = 0; $i < $num_fields; $i++) 
        		{
        			while($row = mysql_fetch_row($result))
        			{
        				$return.= 'INSERT INTO '.$table.' VALUES(';
        				for($j=0; $j < $num_fields; $j++) 
        				{
        					$row[$j] = addslashes($row[$j]);
        					$row[$j] = ereg_replace("\n","\\n",$row[$j]);
        					if (isset($row[$j])) { $return.= '"'.$row[$j].'"' ; } else { $return.= '""'; }
        					if ($j < ($num_fields-1)) { $return.= ','; }
        				}
        				$return.= ");\n";
        			}
        		}
        		$return.="\n\n\n";
        	}
        	
        	//save file
        	$handle = fopen('db-koperasi-'.date('d-m-Y').'-'.time().'-'.(md5(implode(',',$tables))).'.sql','w+');
        	fwrite($handle,$return);
        	fclose($handle);
        
        }
        
        
        // bagian perintah untuk proses download file hasil backup.
        //header("Content-Disposition: attachment; filename=".$dbName.".sql");
        //header("Content-type: application/download");
        //$fp  = fopen($dbName.".sql", 'r');
        //$content = fread($fp, filesize($dbName.".sql"));
        //fclose($fp);
        //echo $content;
         //exit;

 mysqli_close($connection);
echo "Database Backup Successfully.... ";

exit;




?>
