<?php
require_once('connessione.php');

$idProd = isset($_POST['idProd']) ? $_POST['idProd'] : 0;
if(!$idProd == 0){
  $delete = "DELETE FROM prodotti WHERE id = " . $idProd;
  $result = $conn->query($delete);
  if($result)
    echo 1;
  else
    echo 0;

}
 ?>
