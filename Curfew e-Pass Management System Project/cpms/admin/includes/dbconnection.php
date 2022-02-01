<?php 
// DB credentials.
define('DB_HOST','database-3.c5s6juzypqax.us-east-2.rds.amazonaws.com');
define('DB_USER','admin');
define('DB_PASS','Ramrebel56');
define('DB_NAME','cpms');
// Establish database connection.
try
{
$dbh = new PDO("mysql:host=".DB_HOST.";dbname=".DB_NAME,DB_USER, DB_PASS,array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES 'utf8'"));
}
catch (PDOException $e)
{
exit("Error: " . $e->getMessage());
}
?>
