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

$posX = isset($_POST['posX']) ? $_POST['posX'] : '';
$posY = isset($_POST['posY']) ? $_POST['posY'] : '';
$idProdotto = isset($_POST['idProdotto']) ? $_POST['idProdotto'] : 0;
$random = rand(1, 100);
if(!($posX == '' || $posY == '' || $idProdotto == 0)){
  $insert = "INSERT INTO prodotti(pos_x, pos_y, id_prodotto, id_planimetria)
             VALUES('" . $posX . "', '" . $posY . "', '" . $idProdotto . "', '" . $random . "')";
  $result = $conn->query($insert);
}
 ?>
