<?php
require_once('../connessione.php');

$idPlan = isset($_POST['idPlan']) ? $_POST['idPlan'] : 0;
if(!$idPlan == 0){
  $select = "SELECT pos_x, pos_y, id_prodotto FROM prodotti WHERE id_planimetria = " . $idPlan;
  $result = $conn->query($select);
  $arr = array();
  $i = 0;
  while($row = $result->fetch_assoc()){
    $arr[$i] = array(
      'posX' => $row['pos_x'],
      'posY' => $row['pos_y'],
      'idProd' => $row['id_prodotto']
    );
    $i++;
  }
  $json = json_encode($arr);
  echo $json;
}
 ?>
