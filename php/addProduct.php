<?php
require_once('connessione.php');

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
