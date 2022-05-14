<?php
require_once('connessione.php');

$idAnag = isset($_POST['idAnag']) ? $_POST['idAnag'] : 0;
if(!$idAnag == 0){
  $select = "SELECT prodotti.pos_x, prodotti.pos_y, prodotti_img.path_img AS pathProd, planimetrie.path_img AS pathSfondo
             FROM app JOIN planimetrie JOIN prodotti_img JOIN prodotti JOIN anagrafica
             ON planimetrie.id = app.idPlanimetria
             AND app.idAnagrafica = anagrafica.id
             AND app.idProdotto = prodotti.id
             AND prodotti.idProdImg = prodotti_img.id
             WHERE app.idAnagrafica = " . $idAnag;
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
