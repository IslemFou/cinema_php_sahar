
<?php
require_once "../inc/functions.inc.php";
require_once "../inc/header.inc.php";

 $id_user = $_SESSION['client']['id_user'];
 $price = $_GET['total'];
 $dateAchat = date('Y-m-d H:i:s');

//------------- Adding order -----------------------------

 $result = addOrder($id_user, $price, $dateAchat, 1);

 $orderId = lastId();

 if ($result == true) {
 
    foreach($_SESSION['panier'] as $value){

      //---------------- adding order details -----------------------------

      addOrderDetails($orderId['lastId'], $value['id_film'],$value['price'], $value['quantity']);
      
      // debug($_SESSION['panier']);
      die;

    }
    unset($_SESSION['panier']); // on vide le panier
 }


?>

  
  <div class="w-25 m-auto  d-flex flex-column align-item-center">
      <p class="alert alert-success text-center ">Votre achat est bien effectué </p>
      <a href="<?=RACINE_SITE?>profil.php" class="btn text-center">Suivre ma commande </a>
  </div>
