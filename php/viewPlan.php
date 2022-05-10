<?php
require_once('connessione.php');

$idPlan = isset($_POST['idPlan']) ? $_POST['idPlan'] : 0;
if(!$idPlan == 0){
  $select = "SELECT prodotti.pos_x, prodotti.pos_y, prodotti_img.path_img AS pathProd, planimetrie.path_img AS pathSfondo
             FROM prodotti JOIN planimetrie JOIN prodotti_img
             ON planimetrie.id = prodotti.id_planimetria
             AND prodotti.id_prodotto = prodotti_img.id
             WHERE prodotti.id_planimetria = " . $idPlan;
  $result = $pdo->query($select);
  $arr = array();
  $i = 0;
  while($row = $result->fetch(PDO::FETCH_ASSOC)){
    $arr[$i] = array(
      'posX' => $row['pos_x'],
      'posY' => $row['pos_y'],
      'pathProd' => $row['pathProd'],
      'pathSfondo' => $row['pathSfondo']
    );
    $i++;
  }
  $json = json_encode($arr);
  echo $json;
}
 ?>
