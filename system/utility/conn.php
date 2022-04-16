<?php

    $dbHost  = "localhost";
	$dbUser  = "root";
	$dbPass  = "";
	$dbName    = "mub_koperasi";

mysql_connect($dbHost, $dbUser, $dbPass);
mysql_select_db($dbName);
	$conn = mysqli_connect($dbHost, $dbUser, $dbPass,$dbName);
?>