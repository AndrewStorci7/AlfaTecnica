<?php
$db = [
  'db_name' => 'alfatecnica',
  'db_host' => '127.0.0.1',
  'db_user' => 'root',
  'db_pw' => ''
];

$conn = new mysqli($db['db_host'], $db['db_user'], $db['db_pw'], $db['db_name']);
if($conn->connect_error)
  die("Connessione fallita: " . $con->connect_error);
 ?>
