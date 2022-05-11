<?php
require_once('connessione.php');


$idProdotto = isset($_POST['idProdotto']) ? $_POST['idProdotto'] : 0;

$select_prodotto = "SELECT planimetrie.path_img AS plan_img, prodotti.pos_x, prodotti.pos_y, prodotti_img.path_img AS prod_img FROM `prodotti` join planimetrie on prodotti.id_planimetria = planimetrie.id join prodotti_img on prodotti.id_prodotto = prodotti_img.id where prodotti.idProdotto =" . $idProdotto;

$result = $pdo->query($select_planimetria);

if ($result->num_rows > 0) {
  while($row = $result->fetch(PDO::FETCH_ASSOC)) {

    $array = [
      "plan_img"=>$row["plan_img"],
      "pos_x"=>$row["pos_x"],
      "pos_y"=>$row["pos_y"],
      "prod_img"=>$row["prod_img"]
    ];

  }
} else {
  echo "0 results";
}


echo '<script>

var sfondo = new Image();
sfondo.src = "'.$array["plan_img"].'";

var div = document.getElementById("planimetria");
var stage = new Konva.Stage({
  container: "planimetria",
  width: div.clientWidth + 300,
  height: div.clientHeight + 300
});

var layerSfondo = new Konva.Layer({
  scaleX: 1,
  scaleY: 1
});
stage.add(layerSfondo);
var layer = new Konva.Layer({
  scaleX: 1,
  scaleY: 1
});
stage.add(layer);

var groupSfondo = new Konva.Group({
  scaleX: 1
});
layer.add(groupSfondo);
var group = new Konva.Group({
  scaleX: 1
});
layer.add(group);
var sfondoImg = new Konva.Image({
  image: sfondo,
  width: div.clientWidth,
  height: div.clientHeight,
  draggable: false
});
groupSfondo.add(sfondoImg);

var imageObj = new Image();
imageObj.src = "../" + '.$array["prod_img"].';
var image = new Konva.Image({
  x: '.$array["pos_x"].',
  y: '.$array["pos_y"].',
  image: imageObj,
  width: 50,
  height: 50,
  draggable: false
});
group.add(image);




</script>';
?>
