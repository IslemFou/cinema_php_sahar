<?php
require_once "../inc/functions.inc.php";


if (empty($_SESSION['client'])) {

    header("location:" . RACINE_SITE . "authentication.php");
  
  
}


if (isset($_POST) && !empty($_POST)) {

    $idFilm = htmlentities($_POST['id_film']);
    $quantite = htmlentities($_POST['quantity']);
    $film = showfilmViaId($idFilm);

    $title = $film['title'];
    $price =  $film['price'];
    $stock =  $film['stock'];
    $image =  $film['image'];

    if ($idFilm != $film['id_film'] || !isset($quantite) || empty($quantite) ||  $quantite > $stock) {

        header("location:" . RACINE_SITE . "index.php");

    } else {
        

        if (!isset($_SESSION['panier'])) { // je vérifie si je n'ai pas de film dans le panier donc j'initialise  le panier : s'il n'existe pas une session avec l'index "panier" on en créer une et on mets un tableau à l'intérieur
            $_SESSION['panier'] = array();
        }
        // si la session avec l'index "panier" existe on passe directement à la vérification du film


        // si le film existe dans le panier
        $filmPasDansPanier = true;
        // debug($_SESSION);
        // die;
        foreach ($_SESSION['panier'] as $key => $value) {

            // $_SESSION['panier'] => film 1 =>les informations: id / titre / image
            if ($value['id_film'] == $idFilm) {

                    $_SESSION['panier'][$key]['quantity'] += $quantite;
                    //-------- film n°1 ------ : quantité = quantité initiale + la nouvelle quantité
                    $filmPasDansPanier = false;
                    break;
             
            }
        }

        // si le film n'existe pas dans le Panier

        if ($filmPasDansPanier == true) { // si le film n'existe pas dans le panier
            $newFilm = [
                'id_film' => $idFilm,
                'quantity' => $quantite,
                'title' => $title,
                'price' => $price,
                'stock' => $stock,
                'image' => $image

            ];

            $_SESSION['panier'][] = $newFilm; // j'ajoute le film avec toutes ses information dans $_SESSION['panier']

        }
    }
}

// On vide le panier intégralement
if (isset($_GET['vider']) && $_GET['vider'] == 'unset') {
    unset($_SESSION['panier']);
}

// Supprimer un film du panier
if (isset($_GET['id_film'])) {
    // On stocke l'id récupéré dans l'URL dans la variable $idFilmForDelete
    $idFilmForDelete = htmlentities($_GET['id_film']);
    // On boucle sur notre session panier pour récupéré chaque clé et valeur de chaque film
    foreach ($_SESSION['panier'] as $key => $filmSession) {
        // Dans le cas où la valeur est égale à l'ID dans l'URL
        if ($filmSession['id_film'] == $idFilmForDelete) {
            // Alors on supprime le film de la session panier
            unset($_SESSION['panier'][$key]);
        }
    }
   
}




require_once "../inc/header.inc.php";
?>


<main>
    <div class="panier d-flex justify-content-center" style="padding-top:8rem;">


        <div class="d-flex flex-column  mt-5 p-5">
            <h2 class="text-center fw-bolder mb-5 text-danger">Mon panier</h2>

            <!-- le paramètre vider=1 pour indiquer qu'il faut vider le panier. -->
            <?php
            $info = '';

            if (empty($_SESSION['panier'])) {

                echo $info = alert('votre panier est vide', 'warning');
            } else {


            ?>
                <a href="?vider=unset" class="btn align-self-end mb-5">Vider le panier</a>

                <table class="fs-4">
                    <tr>
                        <th class="text-center text-danger fw-bolder">Affiche</th>
                        <th class="text-center text-danger fw-bolder">Nom</th>
                        <th class="text-center text-danger fw-bolder">Prix</th>
                        <th class="text-center text-danger fw-bolder">Quantité</th>
                        <th class="text-center text-danger fw-bolder">Sous-total</th>
                        <th class="text-center text-danger fw-bolder">Supprimer</th>
                    </tr>

                    <?php

                    $total = 0;

                    foreach ($_SESSION['panier']  as $filmDansPanier) {

                    ?>
                        <tr>
                            <td class="text-center border-top border-dark-subtle"><a href="<?= RACINE_SITE ?>showFilm.php?id_film=<?= $filmDansPanier['title'] ?>"><img src="<?= RACINE_SITE ?>/assets/img/<?= $filmDansPanier['image'] ?>" style="width: 100px;"></a></td>
                            <td class="text-center border-top border-dark-subtle"><?= $filmDansPanier['title'] ?></td>
                            <td class="text-center border-top border-dark-subtle"><?= $filmDansPanier['price'] ?>€</td>
                            <td class="text-center border-top border-dark-subtle d-flex align-items-center justify-content-center" style="padding: 7rem;">

                                <?= $filmDansPanier['quantity'] ?>
                                <!-- Afficher la quantité actuelle -->

                            </td>
                            <td class="text-center border-top border-dark-subtle"><?= $sousTotal = $filmDansPanier['price'] * $filmDansPanier['quantity'] ?>€</td>
                            <td class="text-center border-top border-dark-subtle"><a href="?id_film=<?= $filmDansPanier['id_film'] ?>"><i class="bi bi-trash3"></i></a></td>
                        </tr>

                       
                    <?php
                   
                      $total +=$sousTotal;
                    }
                    ?>
                    <tr class="border-top border-dark-subtle">
                        <th class="text-danger p-4 fs-3">Total :<?= $total?>€</th>
                    </tr>



                </table>
                <form action="checkout.php" method="post">
                    <input type="hidden" name="total" value="<?=$total ?>">
                    <button type="submit" class="btn btn-danger mt-5 p-3" id="checkout-button">Payer</button>
                </form>

            <?php

            }

            ?>


        </div>
    </div>
</main>




<?php

require_once "../inc/footer.inc.php";
?>
     require_once "../inc/footer.inc.php";
?>
