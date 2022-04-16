<?php

        $dbHost  = "localhost";
	$dbUser  = "root";
	$dbPass  = "";
	$dbName    = "kds";
	$db = new mysqli($dbHost, $dbUser, $dbPass, $dbname);
	mysql_select_db($dbName);

?>