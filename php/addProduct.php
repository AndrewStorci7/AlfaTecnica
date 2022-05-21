<?php
require_once('connessione.php');

$posX = isset($_POST['posX']) ? $_POST['posX'] : '';
$posY = isset($_POST['posY']) ? $_POST['posY'] : '';
$idProdotto = isset($_POST['idProdotto']) ? $_POST['idProdotto'] : 0;
$id = isset($_POST['id']) ? $_POST['id'] : 0;
$idPlan = isset($_POST['idPlan']) ? $_POST['idPlan'] : 0;
$random = rand(1, 100);
if(!($posX == '' || $posY == '' || $idProdotto == 0 || $id == 0)){
  $insert = "INSERT INTO prodotti(id, pos_x, pos_y, idProdImg)
             VALUES('" . $id . "','" . $posX . "', '" . $posY . "', '" . $idProdotto . "')";
  $result = $pdo->query($insert);
  if($result)
    echo 1;
  else
    echo 0;
}
 ?>
