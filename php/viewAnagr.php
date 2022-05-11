<?php
require_once('connessione.php');

$query="SELECT nome,sede,path_logo FROM anagrafica";
$risultato=$pdo->query($query);
$array = array( );
$i=0;
//if(count($risultato) > 0){
  while($row=$risultato->fetch(PDO::FETCH_ASSOC)){
    $array[$i]=array(
      "nome"=>$row["nome"],
      "sede"=>$row["sede"],
      "path_logo"=>$row["path_logo"]
    );
    $i++;
  }
//}
echo json_encode($array);
?>
