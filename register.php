<?php
require_once "inc/functions.inc.php";


if (isset($_SESSION['client'])) { // si une session existe avec un identiafaint user je me redérige vers la page de profile

    header("location:profil.php");
}

$info = "";

// debug($_POST);

if (!empty($_POST)) {


    // On vérifie si un champs est vide 

    $verif = true;
    foreach ($_POST as $key => $value) {

        if (empty(trim($value))) {

            $verif = false;
        }
    }

    if ($verif === false) {

        $info = alert("Veuillez renseigner tout les champs", "danger");
    } else{





        if (!isset($_POST['lastName']) || strlen(trim($_POST['lastName'])) < 2 || strlen(trim($_POST['lastName'])) > 50) {

            $info .= alert("Le champ nom n'est pas valide", "danger");
        }

        if (!isset($_POST['firstName']) || strlen(trim($_POST['firstName'])) > 50) {


            $info .= alert("Le champ prénom n'est pas valide", "danger");
        }

        if (!isset($_POST['pseudo']) ||  strlen(trim($_POST['pseudo'])) < 3 || strlen(trim($_POST['pseudo'])) > 50) {

            $info .= alert("Le champ pseudo n'est pas valide", "danger");
        }

        // La fonction filter_var() applique un filtre spécifique à une variable. Lorsqu'elle est utilisée avec la constante FILTER_VALIDATE_EMAIL, elle vérifie si la chaîne passée en paramètre est une adresse e-mail valide. Si l'adresse est valide, la fonction retourne la chaîne elle-même ; sinon, elle retourne false.
        // La constante FILTER_VALIDATE_EMAIL est utilisée dans la fonction filter_var() en PHP pour valider une adresse e-mail. C'est une option de filtrage qui permet de vérifier si une chaîne de caractères est une adresse e-mail valide selon le format standard des e-mails.

        if (!isset($_POST['email']) ||  strlen(trim($_POST['email'])) < 5 || strlen(trim($_POST['email'])) > 100 || !filter_var($_POST['email'], FILTER_VALIDATE_EMAIL)) {

            $info .= alert("Le champ email n'est pas valide", "danger");
        }


        $regexPhone = "/^[0-9]{10}$/";

        if (!isset($_POST['phone']) || !preg_match($regexPhone, $_POST['phone'])) { // vérifie si le téléphone contient 10 chiffres

            $info .= alert("Le numéro de téléphone n'est pas valide", "danger");
        }

        $regexMdp = '/^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/';
        /*
            ^ : Début de la chaîne.
            (?=.*[A-Z]) : Doit contenir au moins une lettre majuscule.
            (?=.*[a-z]) : Doit contenir au moins une lettre minuscule.
            (?=.*\d) : Doit contenir au moins un chiffre.
            (?=.*[@$!%*?&]) : Doit contenir au moins un caractère spécial parmi @$!%*?&
            [A-Za-z\d@$!%*?&]{12,} : Doit être constitué uniquement de lettres majuscules, lettres minuscules, chiffres et caractères spéciaux spécifiés, et doit avoir une longueur minimale de 12 caractères.
            $ : Fin de la chaîne.
       */

        if (!isset($_POST['mdp']) || !preg_match($regexMdp, $_POST['mdp'])) {

            $info .= alert("Le mot de passe n'est pas valide", "danger");
        }

        if (!isset($_POST['confirmMdp']) || $_POST['mdp'] !== $_POST['confirmMdp']) {

            $info .= alert("La confirmation et le mot de passe doivent être identiques", "danger");
        }

        if (!isset($_POST['civility']) || !in_array($_POST['civility'], ['f', 'h'])) {

            $info .= alert("La civilité n'est pas valide", "danger");
        }

        $year1 = ((int) date('Y')) - 13; // 2012
        $year2 = ((int) date('Y')) - 90; // 1935

        $birthdayYear = explode('-', $_POST['birthday']);
        // var_dump((int) $birthdayYear[0]);

        if (!isset($_POST['birthday']) ||  (int)$birthdayYear[0] > $year1  ||  (int)$birthdayYear[0] < $year2) {
            // 1989 > 2012         &&            1989 < 1935
            $info .= alert("La date de naissance n'est pas valide", "danger");
        }
        if (!isset($_POST['address']) || strlen(trim($_POST['address'])) < 5 ||  strlen(trim($_POST['address'])) > 50) {

            $info .= alert("L'adresse n'est pas valide", "danger");
        }

        if (!isset($_POST['zip']) || !preg_match('/^[0-9]{5}$/', $_POST['zip'])) {

            $info .= alert("Le code postal n'est pas valide", "danger");
        }

        if (!isset($_POST['city']) ||  strlen(trim($_POST['city'])) < 4 || strlen(trim($_POST['city'])) > 50 || preg_match('/[0-9]/', $_POST['city'])) {

            $info .= alert("La ville n'est pas valide", "danger");
        }

        if (!isset($_POST['country']) ||  strlen(trim($_POST['country'])) < 5 || strlen(trim($_POST['country'])) > 50 || preg_match('/[0-9]/', $_POST['country'])) {

            $info .= alert("Le champ pays n'est pas valide", "danger");
        }


        if (empty($info)) {

            //         // on récupére les valeurs de nos champs et on les stock dans des variables
            $lastName = trim($_POST['lastName']);
            $firstName = trim($_POST['firstName']);
            $pseudo = trim($_POST['pseudo']);
            $email = trim($_POST['email']);
            $phone = trim($_POST['phone']);
            $mdp = trim($_POST['mdp']);
            $civility = trim($_POST['civility']);
            $birthday = trim($_POST['birthday']);
            $address = trim($_POST['address']);
            $zip = trim($_POST['zip']);
            $city = trim($_POST['city']);
            $country = trim($_POST['country']);

            $mdpHash = password_hash($mdp, PASSWORD_DEFAULT);
            // Cette fonction PHP crée un hachage sécurisé d'un mot de passe en utilisant un algorithme de hachage fort : génère une chaîne de caractères unique à partir d'une entrée. C'est un mécanisme unidirectionnel dont l'utilité est d'empêcher le déchiffrement d'un hash. Lors de la connexion, il faudra comparer le hash stocké dans la base de données avec celui du mot de passe fourni par l'internaute.
            // PASSWORD_DEFAULT : constante indique à password_hash() d'utiliser l'algorithme de hachage par défaut actuel c'est le plus recommandé car elle garantit que le code utilisera toujours le meilleur algorithme disponible sans avoir besoin de modifications.
            // debug($mdp);
            // debug($mdpHash);

            $emailExist = checkEmailUser($email);
            $pseudoExist = checkPseudoUser($pseudo);
            $userExist = checkUser($pseudo, $email);

            // debug($emailExist);
            // die;
            if ($emailExist) { // si l'email existe dans la BDD

                $info = alert("Ce mail n'est pas disponible", "danger");
            } elseif ($pseudoExist) { // si le pseudo existe dans la BDD

                $info = alert("Ce pseudo n'est pas disponible", "danger");
            }
            if ($userExist) { // si l 'email et le pseudo correspondent au même utilisateur

                $info = alert("Vous avez déjà un compte", "danger");
            } elseif (empty($info)) {

                addUser($lastName,  $firstName,  $pseudo,  $email,  $phone,  $mdpHash,  $civility, $birthday,  $address,  $zip,  $city,  $country);
                $info = alert("Vous êtes bien inscrit, vous pouvez vous connectez <a href='authentication.php' class='text-danger fw-bold'>ici</a>", 'success');
            }
        }
    }
}































require_once "inc/header.inc.php";
?>

<main style="background:url(assets/img/5818.png) no-repeat; background-size: cover; background-attachment: fixed;">

    <div class="w-75 m-auto p-5" style="background: rgba(20, 20, 20, 0.9);">
        <h2 class="text-center mb-5 p-3">Créer un compte</h2>
        <?php
        echo $info;
        ?>

        <form action="" method="post" class="p-5">
            <div class="row mb-3">
                <div class="col-md-6 mb-5">
                    <label for="lastName" class="form-label mb-3">Nom</label>
                    <input type="text" class="form-control fs-5" id="lastName" name="lastName">
                </div>
                <div class="col-md-6 mb-5">
                    <label for="firstName" class="form-label mb-3">Prenom</label>
                    <input type="text" class="form-control fs-5" id="firstName" name="firstName">
                </div>
            </div>
            <div class="row mb-3">
                <div class="col-md-4 mb-5">
                    <label for="pseudo" class="form-label mb-3">Pseudo</label>
                    <input type="text" class="form-control fs-5" id="pseudo" name="pseudo">
                </div>
                <div class="col-md-4 mb-5">
                    <label for="email" class="form-label mb-3">Email</label>
                    <input type="text" class="form-control fs-5" id="email" name="email" placeholder="exemple.email@exemple.com">
                </div>
                <div class="col-md-4 mb-5">
                    <label for="phone" class="form-label mb-3">Téléphone</label>
                    <input type="text" class="form-control fs-5" id="phone" name="phone">
                </div>

            </div>
            <div class="row mb-3">
                <div class="col-md-6 mb-5">
                    <label for="mdp" class="form-label mb-3">Mot de passe</label>
                    <input type="password" class="form-control fs-5" id="mdp" name="mdp" placeholder="Entrer votre mot de passe">
                </div>
                <div class="col-md-6 mb-5">
                    <label for="confirmMdp" class="form-label mb-3">Confirmation mot de passe</label>
                    <input type="password" class="form-control fs-5 mb-3" id="confirmMdp" name="confirmMdp" placeholder="Confirmer votre mot de passe ">
                    <input type="checkbox" onclick="myFunction()"> <span class="text-danger">Afficher/masquer le mot de passe</span>
                </div>


            </div>
            <div class="row mb-3">
                <div class="col-md-6 mb-5">
                    <label class="form-label mb-3">Civilité</label>
                    <select class="form-select fs-5" name="civility">
                        <option value="h">Homme</option>
                        <option value="f">Femme</option>
                    </select>
                </div>
                <div class="col-md-6 mb-5">
                    <label for="birthday" class="form-label mb-3">Date de naissance</label>
                    <input type="date" class="form-control fs-5" id="birthday" name="birthday">
                </div>
            </div>
            <div class="row mb-3">
                <div class="col-12 mb-5">
                    <label for="address" class="form-label mb-3">Adresse</label>
                    <input type="text" class="form-control fs-5" id="address" name="address">
                </div>
            </div>
            <div class="row mb-3">
                <div class="col-md-3">
                    <label for="zip" class="form-label mb-3">Code postale</label>
                    <input type="text" class="form-control fs-5" id="zip" name="zip">
                </div>
                <div class="col-md-5">
                    <label for="city" class="form-label mb-3">Cité</label>
                    <input type="text" class="form-control fs-5" id="city" name="city">
                </div>
                <div class="col-md-4">
                    <label for="country" class="form-label mb-3">Pays</label>
                    <input type="text" class="form-control fs-5" id="country" name="country">
                </div>
            </div>
            <div class="row mt-5">
                <button class="w-25 m-auto btn btn-danger btn-lg fs-5" type="submit">S'inscrire</button>
                <p class="mt-5 text-center">Vous avez dèjà un compte ! <a href="authentication.php" class=" text-danger">connectez-vous ici</a></p>
            </div>
        </form>
    </div>



</main>








<?php
require_once "inc/footer.inc.php";
