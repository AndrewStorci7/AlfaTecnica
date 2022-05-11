<?php
require_once('connessione.php');


$posX = isset($_POST['posX']) ? $_POST['posX'] : '';
$posY = isset($_POST['posY']) ? $_POST['posY'] : '';
$idProdotto = isset($_POST['idProdotto']) ? $_POST['idProdotto'] : 0;



$select_planimetria = "SELECT planimetrie.path_img FROM `prodotti` join planimetrie on prodotti.id_planimetria = planimetrie.id where prodotti.pos_x =" . $posX . "  and prodotti.pos_y" . $posY;

$result = $pdo->query($select_planimetria);
if ($result->num_rows > 0) {
    while($row = $result->fetch(PDO::FETCH_ASSOC)) {

    }
  } else {
    echo "0 results";
  }
  $conn->close();


if(!($posX == '' || $posY == '' || $idProdotto == 0)){
    $insert = "INSERT INTO prodotti(pos_x, pos_y, id_prodotto, id_planimetria)
               VALUES('" . $posX . "', '" . $posY . "', '" . $idProdotto . "', '" . $id_planimetria . "')";
    $result = $conn->query($insert);

?>